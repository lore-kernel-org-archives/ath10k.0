Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1wRa-0007Lu-Fq
 for ath10k@lists.infradead.org; Wed, 24 Jul 2013 10:37:19 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: detect the number of spatial streams supported by hw
Date: Wed, 24 Jul 2013 12:36:46 +0200
Message-ID: <1374662206-19198-1-git-send-email-michal.kazior@tieto.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Until now ath10k assumed 3 spatial streams.
However some devices support only 2 spatial
streams.

This patch improves performance on devices that
don't support 3 spatial streams.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.h |    1 +
 drivers/net/wireless/ath/ath10k/mac.c  |   19 +++++++++----------
 drivers/net/wireless/ath/ath10k/wmi.c  |   12 ++++++++++--
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 9f21ecb..ff42bb7 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -285,6 +285,7 @@ struct ath10k {
 	u32 hw_max_tx_power;
 	u32 ht_cap_info;
 	u32 vht_cap_info;
+	u32 num_rf_chains;
 
 	struct targetdef *targetdef;
 	struct hostdef *hostdef;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index d0a7761..330ba93 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3093,19 +3093,18 @@ static struct ieee80211_sta_vht_cap ath10k_create_vht_cap(struct ath10k *ar)
 {
 	struct ieee80211_sta_vht_cap vht_cap = {0};
 	u16 mcs_map;
+	int i;
 
 	vht_cap.vht_supported = 1;
 	vht_cap.cap = ar->vht_cap_info;
 
-	/* FIXME: check dynamically how many streams board supports */
-	mcs_map = IEEE80211_VHT_MCS_SUPPORT_0_9 << 0 |
-		IEEE80211_VHT_MCS_SUPPORT_0_9 << 2 |
-		IEEE80211_VHT_MCS_SUPPORT_0_9 << 4 |
-		IEEE80211_VHT_MCS_NOT_SUPPORTED << 6 |
-		IEEE80211_VHT_MCS_NOT_SUPPORTED << 8 |
-		IEEE80211_VHT_MCS_NOT_SUPPORTED << 10 |
-		IEEE80211_VHT_MCS_NOT_SUPPORTED << 12 |
-		IEEE80211_VHT_MCS_NOT_SUPPORTED << 14;
+	mcs_map = 0;
+	for (i = 0; i < 8; i++) {
+		if (i < ar->num_rf_chains)
+			mcs_map |= IEEE80211_VHT_MCS_SUPPORT_0_9 << (i*2);
+		else
+			mcs_map |= IEEE80211_VHT_MCS_NOT_SUPPORTED << (i*2);
+	}
 
 	vht_cap.vht_mcs.rx_mcs_map = cpu_to_le16(mcs_map);
 	vht_cap.vht_mcs.tx_mcs_map = cpu_to_le16(mcs_map);
@@ -3168,7 +3167,7 @@ static struct ieee80211_sta_ht_cap ath10k_get_ht_cap(struct ath10k *ar)
 	if (ar->vht_cap_info & WMI_VHT_CAP_MAX_MPDU_LEN_MASK)
 		ht_cap.cap |= IEEE80211_HT_CAP_MAX_AMSDU;
 
-	for (i = 0; i < WMI_MAX_SPATIAL_STREAM; i++)
+	for (i = 0; i < ar->num_rf_chains; i++)
 		ht_cap.mcs.rx_mask[i] = 0xFF;
 
 	ht_cap.mcs.tx_params |= IEEE80211_HT_MCS_TX_DEFINED;
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 5e42460..1cbcb2e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -868,6 +868,13 @@ static void ath10k_wmi_service_ready_event_rx(struct ath10k *ar,
 		(__le32_to_cpu(ev->sw_version_1) & 0xffff0000) >> 16;
 	ar->fw_version_build = (__le32_to_cpu(ev->sw_version_1) & 0x0000ffff);
 	ar->phy_capability = __le32_to_cpu(ev->phy_capability);
+	ar->num_rf_chains = __le32_to_cpu(ev->num_rf_chains);
+
+	if (ar->num_rf_chains > WMI_MAX_SPATIAL_STREAM) {
+		ath10k_warn("hardware advertises support for more spatial streams than it should (%d > %d)\n",
+			    ar->num_rf_chains, WMI_MAX_SPATIAL_STREAM);
+		ar->num_rf_chains = WMI_MAX_SPATIAL_STREAM;
+	}
 
 	ar->ath_common.regulatory.current_rd =
 		__le32_to_cpu(ev->hal_reg_capabilities.eeprom_rd);
@@ -892,7 +899,7 @@ static void ath10k_wmi_service_ready_event_rx(struct ath10k *ar,
 	}
 
 	ath10k_dbg(ATH10K_DBG_WMI,
-		   "wmi event service ready sw_ver 0x%08x sw_ver1 0x%08x abi_ver %u phy_cap 0x%08x ht_cap 0x%08x vht_cap 0x%08x vht_supp_msc 0x%08x sys_cap_info 0x%08x mem_reqs %u\n",
+		   "wmi event service ready sw_ver 0x%08x sw_ver1 0x%08x abi_ver %u phy_cap 0x%08x ht_cap 0x%08x vht_cap 0x%08x vht_supp_msc 0x%08x sys_cap_info 0x%08x mem_reqs %u num_rf_chains %u\n",
 		   __le32_to_cpu(ev->sw_version),
 		   __le32_to_cpu(ev->sw_version_1),
 		   __le32_to_cpu(ev->abi_version),
@@ -901,7 +908,8 @@ static void ath10k_wmi_service_ready_event_rx(struct ath10k *ar,
 		   __le32_to_cpu(ev->vht_cap_info),
 		   __le32_to_cpu(ev->vht_supp_mcs),
 		   __le32_to_cpu(ev->sys_cap_info),
-		   __le32_to_cpu(ev->num_mem_reqs));
+		   __le32_to_cpu(ev->num_mem_reqs),
+		   __le32_to_cpu(ev->num_rf_chains));
 
 	complete(&ar->wmi.service_ready);
 }
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
