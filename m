Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHADg-0006DZ-FO
 for ath10k@lists.infradead.org; Mon, 20 Jul 2015 12:30:57 +0000
From: Vivek Natarajan <nataraja@qti.qualcomm.com>
Subject: [PATCH] ath10k: Enable MU MIMO txbf support for QCA99X0
Date: Mon, 20 Jul 2015 18:00:01 +0530
Message-ID: <1437395401-2765-2-git-send-email-nataraja@qti.qualcomm.com>
In-Reply-To: <1437395401-2765-1-git-send-email-nataraja@qti.qualcomm.com>
References: <1437395401-2765-1-git-send-email-nataraja@qti.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

This patch enables MU-MIMO transmit beamforming support
for QCA99X0 chipsets.

Signed-off-by: Vivek Natarajan <nataraja@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 44 +++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h |  5 ++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 0b31331..bfaeabb 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4063,6 +4063,43 @@ static u32 get_nss_from_chainmask(u16 chain_mask)
 	return 1;
 }
 
+static int ath10k_mac_set_txbf_conf(struct ath10k_vif *arvif)
+{
+	u32 value = 0;
+	struct ath10k *ar = arvif->ar;
+
+	if (ath10k_wmi_get_txbf_conf_scheme(ar) != WMI_TXBF_CONF_BEFORE_ASSOC)
+		return 0;
+
+	if (ar->vht_cap_info & (IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE |
+				IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE))
+		value |= SM((ar->num_rf_chains - 1), WMI_TXBF_STS_CAP_OFFSET);
+
+	if (ar->vht_cap_info & (IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE |
+				IEEE80211_VHT_CAP_MU_BEAMFORMER_CAPABLE))
+		value |= SM((ar->num_rf_chains - 1), WMI_BF_SOUND_DIM_OFFSET);
+
+	if (!value)
+		return 0;
+
+	if (ar->vht_cap_info & IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE)
+		value |= WMI_VDEV_PARAM_TXBF_SU_TX_BFER;
+
+	if (ar->vht_cap_info & IEEE80211_VHT_CAP_MU_BEAMFORMER_CAPABLE)
+		value |= (WMI_VDEV_PARAM_TXBF_MU_TX_BFER |
+			  WMI_VDEV_PARAM_TXBF_SU_TX_BFER);
+
+	if (ar->vht_cap_info & IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE)
+		value |= WMI_VDEV_PARAM_TXBF_SU_TX_BFEE;
+
+	if (ar->vht_cap_info & IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE)
+		value |= (WMI_VDEV_PARAM_TXBF_MU_TX_BFEE |
+			  WMI_VDEV_PARAM_TXBF_SU_TX_BFEE);
+
+	return ath10k_wmi_vdev_set_param(ar, arvif->vdev_id,
+					 ar->wmi.vdev_param->txbf, value);
+}
+
 /*
  * TODO:
  * Figure out how to handle WMI_VDEV_SUBTYPE_P2P_DEVICE,
@@ -4281,6 +4318,13 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		}
 	}
 
+	ret = ath10k_mac_set_txbf_conf(arvif);
+	if (ret) {
+		ath10k_warn(ar, "failed to set txbf for vdev %d: %d\n",
+				arvif->vdev_id, ret);
+		goto err_peer_delete;
+	}
+
 	ret = ath10k_mac_set_rts(arvif, ar->hw->wiphy->rts_threshold);
 	if (ret) {
 		ath10k_warn(ar, "failed to set rts threshold for vdev %d: %d\n",
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 0a41ec4..a544292 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4637,6 +4637,11 @@ enum wmi_10_4_vdev_param {
 #define WMI_VDEV_PARAM_TXBF_SU_TX_BFER BIT(2)
 #define WMI_VDEV_PARAM_TXBF_MU_TX_BFER BIT(3)
 
+#define WMI_TXBF_STS_CAP_OFFSET_LSB	4
+#define WMI_TXBF_STS_CAP_OFFSET_MASK	0xf0
+#define WMI_BF_SOUND_DIM_OFFSET_LSB	8
+#define WMI_BF_SOUND_DIM_OFFSET_MASK	0xf00
+
 /* slot time long */
 #define WMI_VDEV_SLOT_TIME_LONG		0x1
 /* slot time short */
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
