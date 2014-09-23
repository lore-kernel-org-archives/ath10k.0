Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWXTh-0003J5-Fv
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 21:18:31 +0000
From: greearb@candelatech.com
Subject: [PATCH v2 05/10] ath10k: apply chainmask settings to vdev on creation.
Date: Tue, 23 Sep 2014 14:17:20 -0700
Message-Id: <1411507045-18973-5-git-send-email-greearb@candelatech.com>
In-Reply-To: <1411507045-18973-1-git-send-email-greearb@candelatech.com>
References: <1411507045-18973-1-git-send-email-greearb@candelatech.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: linux-wireless@vger.kernel.org
Cc: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

From: Ben Greear <greearb@candelatech.com>

It appears it takes more than just setting the
hardware's chainmask to make things work well.  Without
this patch, a vdev would only use 1x1 rates when chainmask
was set to 0x3.

Setting the 'nss' (number of spatial streams) on the vdev
helps the firmware's rate-control algorithm work properly.

Tested on CT firmware, but probably this works (and
is required) on normal firmware.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---

v2:  Add warning if chainmask is set to probably-invalid configuration.
  Also, from a quick test, it appears you cannot even set the chainmask
  using 'iw' when vdevs are active.

 drivers/net/wireless/ath/ath10k/mac.c | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 4bb3ef6..e75607d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2427,12 +2427,27 @@ static int ath10k_get_antenna(struct ieee80211_hw *hw, u32 *tx_ant, u32 *rx_ant)
 	return 0;
 }
 
+static void ath10k_check_chain_mask(struct ath10k *ar, u32 cm, const char* dbg)
+{
+	/* It is not clear that allowing gaps in chainmask
+	 * is helpful.  Probably it will not do what user
+	 * is hoping for, so warn in that case.
+	 */
+	if (cm == 15 || cm == 7 || cm == 3 || cm == 1 || cm == 0)
+		return;
+	ath10k_warn(ar, "mac %s antenna chainmask may be invalid: 0x%x.  Suggested values: 15, 7, 3, 1 or 0.\n",
+		    dbg, cm);
+}
+
 static int __ath10k_set_antenna(struct ath10k *ar, u32 tx_ant, u32 rx_ant)
 {
 	int ret;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	ath10k_check_chain_mask(ar, tx_ant, "tx");
+	ath10k_check_chain_mask(ar, rx_ant, "rx");
+	
 	ar->cfg_tx_chainmask = tx_ant;
 	ar->cfg_rx_chainmask = rx_ant;
 
@@ -2758,6 +2773,17 @@ static int ath10k_config(struct ieee80211_hw *hw, u32 changed)
 	return ret;
 }
 
+static u32 get_nss_from_chainmask(u16 chain_mask)
+{
+	if ((chain_mask & 0x15) == 0x15)
+		return 4;
+	else if ((chain_mask & 0x7) == 0x7)
+		return 3;
+	else if ((chain_mask & 0x3) == 0x3)
+		return 2;
+	return 1;
+}
+
 /*
  * TODO:
  * Figure out how to handle WMI_VDEV_SUBTYPE_P2P_DEVICE,
@@ -2890,6 +2916,20 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		goto err_vdev_delete;
 	}
 
+	if (ar->cfg_tx_chainmask) {
+		u16 nss = get_nss_from_chainmask(ar->cfg_tx_chainmask);
+
+		vdev_param = ar->wmi.vdev_param->nss;
+		ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
+						nss);
+		if (ret) {
+			ath10k_warn(ar, "failed to set vdev %i chainmask 0x%x, nss %i: %d\n",
+				    arvif->vdev_id, ar->cfg_tx_chainmask, nss,
+				    ret);
+			goto err_vdev_delete;
+		}
+	}
+
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
 		ret = ath10k_peer_create(ar, arvif->vdev_id, vif->addr);
 		if (ret) {
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
