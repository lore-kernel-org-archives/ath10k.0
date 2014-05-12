Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjsR1-0005c0-D7
 for ath10k@lists.infradead.org; Mon, 12 May 2014 15:46:37 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Mon, 12 May 2014 17:43:05 +0200
Subject: RE : [PATCH v2 2/2] ath10k:  support get/set antenna configurations.
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBC@srvexch01.SODIELEC.local>
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
In-Reply-To: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
Content-Language: fr-FR
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "greearb@candelatech.com" <greearb@candelatech.com>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Thank you very much for the patch, I just had a question of a new bie: Your=
 patch is for the branch of ath-next-test, not for the branch ath-master, r=
ight?
But even it is for ath-next-test, I can not apply it, there is a conflict, =
for example the first change of your patch (in file "core.h" which starts f=
rom line 472 but I found in the branch of ath-next-test that it must start =
from line 444 where there is u32 dfs_block_radar_events; )
So I have to apply your patch manually (I look for the different and add it=
 to the code) and then the result is quite good, I can see the Available an=
d Configured Antennas from "iw list". Then I can also select the antenna th=
anks to the command "iw phyX set antenna" too. =

Sorry if I disturbing you for the question about applying the patch. =

Regards,
 =

NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE

________________________________________
De : ath10k [ath10k-bounces@lists.infradead.org] de la part de greearb@cand=
elatech.com [greearb@candelatech.com]
Date d'envoi : jeudi 8 mai 2014 18:18
=C0 : ath10k@lists.infradead.org
Cc : Ben Greear; linux-wireless@vger.kernel.org
Objet : [PATCH v2 2/2] ath10k:  support get/set antenna configurations.

From: Ben Greear <greearb@candelatech.com>

Tested with CT firmware, but should work on standard
firmware as well.

Verified that target's tx/rx chain register is set appropriately,
and that the tx rate goes down as number of chains
decrease, but I did not actually try to verify antenna
ceased to transmit when disabled.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---

v2:  Fixes suggested by Michal Kazior.

 drivers/net/wireless/ath/ath10k/core.h |  6 +++
 drivers/net/wireless/ath/ath10k/mac.c  | 72 ++++++++++++++++++++++++++++++=
++++
 drivers/net/wireless/ath/ath10k/wmi.c  |  5 +++
 3 files changed, 83 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/=
ath/ath10k/core.h
index 7050c47..791d76d 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -472,6 +472,12 @@ struct ath10k {
        u32 dfs_block_radar_events;
        int install_key_rv; /* Store error code from key-install */

+       /* Protected by conf-mutex */
+       unsigned char supp_tx_chainmask;
+       unsigned char supp_rx_chainmask;
+       unsigned char cfg_tx_chainmask;
+       unsigned char cfg_rx_chainmask;
+
        struct wmi_pdev_set_wmm_params_arg wmm_params;
        struct completion install_key_done;

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/a=
th/ath10k/mac.c
index dcb147d..01ba41e 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2483,6 +2483,69 @@ void ath10k_halt(struct ath10k *ar)
        spin_unlock_bh(&ar->data_lock);
 }

+static int ath10k_get_antenna(struct ieee80211_hw *hw, u32 *tx_ant, u32 *r=
x_ant)
+{
+       struct ath10k *ar =3D hw->priv;
+
+       mutex_lock(&ar->conf_mutex);
+
+       if (ar->cfg_tx_chainmask) {
+               *tx_ant =3D ar->cfg_tx_chainmask;
+               *rx_ant =3D ar->cfg_rx_chainmask;
+       } else {
+               *tx_ant =3D ar->supp_tx_chainmask;
+               *rx_ant =3D ar->supp_rx_chainmask;
+       }
+
+       mutex_unlock(&ar->conf_mutex);
+
+       return 0;
+}
+
+static int __ath10k_set_antenna(struct ath10k *ar, u32 tx_ant, u32 rx_ant)
+{
+       int ret;
+
+       lockdep_assert_held(&ar->conf_mutex);
+
+       ar->cfg_tx_chainmask =3D tx_ant;
+       ar->cfg_rx_chainmask =3D rx_ant;
+
+       if ((ar->state !=3D ATH10K_STATE_ON) &&
+           (ar->state !=3D ATH10K_STATE_RESTARTED))
+               return 0;
+
+       ret =3D ath10k_wmi_pdev_set_param(ar, ar->wmi.pdev_param->tx_chain_=
mask,
+                                       tx_ant);
+       if (ret) {
+               ath10k_warn("failed to set tx-chainmask: %d, req 0x%x\n",
+                           ret, tx_ant);
+               return ret;
+       }
+
+       ret =3D ath10k_wmi_pdev_set_param(ar, ar->wmi.pdev_param->rx_chain_=
mask,
+                                       rx_ant);
+       if (ret) {
+               ath10k_warn("failed to set rx-chainmask: %d, req 0x%x\n",
+                           ret, rx_ant);
+               return ret;
+       }
+
+       return 0;
+}
+
+static int ath10k_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_=
ant)
+{
+       struct ath10k *ar =3D hw->priv;
+       int ret;
+
+       mutex_lock(&ar->conf_mutex);
+       ret =3D __ath10k_set_antenna(ar, tx_ant, rx_ant);
+       mutex_unlock(&ar->conf_mutex);
+       return ret;
+}
+
+
 static int ath10k_start(struct ieee80211_hw *hw)
 {
        struct ath10k *ar =3D hw->priv;
@@ -2530,6 +2593,10 @@ static int ath10k_start(struct ieee80211_hw *hw)
        if (ret)
                ath10k_warn("failed to enable dynamic BW: %d\n", ret);

+       if (ar->cfg_tx_chainmask)
+               __ath10k_set_antenna(ar, ar->cfg_tx_chainmask,
+                                    ar->cfg_rx_chainmask);
+
        /*
         * By default FW set ARP frames ac to voice (6). In that case ARP
         * exchange is not working properly for UAPSD enabled AP. ARP reque=
sts
@@ -4437,6 +4504,8 @@ static const struct ieee80211_ops ath10k_ops =3D {
        .set_frag_threshold             =3D ath10k_set_frag_threshold,
        .flush                          =3D ath10k_flush,
        .tx_last_beacon                 =3D ath10k_tx_last_beacon,
+       .set_antenna                    =3D ath10k_set_antenna,
+       .get_antenna                    =3D ath10k_get_antenna,
        .restart_complete               =3D ath10k_restart_complete,
        .get_survey                     =3D ath10k_get_survey,
        .set_bitrate_mask               =3D ath10k_set_bitrate_mask,
@@ -4818,6 +4887,9 @@ int ath10k_mac_register(struct ath10k *ar)
                BIT(NL80211_IFTYPE_ADHOC) |
                BIT(NL80211_IFTYPE_AP);

+       ar->hw->wiphy->available_antennas_rx =3D ar->supp_rx_chainmask;
+       ar->hw->wiphy->available_antennas_tx =3D ar->supp_tx_chainmask;
+
        if (!test_bit(ATH10K_FW_FEATURE_NO_P2P, ar->fw_features))
                ar->hw->wiphy->interface_modes |=3D
                        BIT(NL80211_IFTYPE_P2P_CLIENT) |
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/a=
th/ath10k/wmi.c
index 82a827e..d82b740 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2601,6 +2601,8 @@ static int ath10k_wmi_main_cmd_init(struct ath10k *ar)
        config.ast_skid_limit =3D __cpu_to_le32(TARGET_AST_SKID_LIMIT);
        config.tx_chain_mask =3D __cpu_to_le32(TARGET_TX_CHAIN_MASK);
        config.rx_chain_mask =3D __cpu_to_le32(TARGET_RX_CHAIN_MASK);
+       ar->supp_tx_chainmask =3D TARGET_TX_CHAIN_MASK;
+       ar->supp_rx_chainmask =3D TARGET_RX_CHAIN_MASK;
        config.rx_timeout_pri_vo =3D __cpu_to_le32(TARGET_RX_TIMEOUT_LO_PRI=
);
        config.rx_timeout_pri_vi =3D __cpu_to_le32(TARGET_RX_TIMEOUT_LO_PRI=
);
        config.rx_timeout_pri_be =3D __cpu_to_le32(TARGET_RX_TIMEOUT_LO_PRI=
);
@@ -2721,6 +2723,9 @@ static int ath10k_wmi_10x_cmd_init(struct ath10k *ar)
        config.num_tids =3D __cpu_to_le32(TARGET_10X_NUM_TIDS);
        config.tx_chain_mask =3D __cpu_to_le32(TARGET_10X_TX_CHAIN_MASK);
        config.rx_chain_mask =3D __cpu_to_le32(TARGET_10X_RX_CHAIN_MASK);
+       /* TODO:  Have to deal with 2x2 chips if/when the come out. */
+       ar->supp_tx_chainmask =3D TARGET_10X_TX_CHAIN_MASK;
+       ar->supp_rx_chainmask =3D TARGET_10X_RX_CHAIN_MASK;
        config.rx_timeout_pri_vo =3D __cpu_to_le32(TARGET_10X_RX_TIMEOUT_LO=
_PRI);
        config.rx_timeout_pri_vi =3D __cpu_to_le32(TARGET_10X_RX_TIMEOUT_LO=
_PRI);
        config.rx_timeout_pri_be =3D __cpu_to_le32(TARGET_10X_RX_TIMEOUT_LO=
_PRI);
--
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
