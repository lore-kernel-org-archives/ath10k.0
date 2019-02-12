Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtYQ7-000492-Mg
 for ath10k@lists.infradead.org; Tue, 12 Feb 2019 13:48:21 +0000
From: Dundi Raviteja <dundi@codeaurora.org>
Subject: [PATCH] ath10k: Enable support for beacon interval per VAP
Date: Tue, 12 Feb 2019 19:18:06 +0530
Message-Id: <1549979286-9255-1-git-send-email-dundi@codeaurora.org>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Dundi Raviteja <dundi@codeaurora.org>

Enable support to configure different beacon interval per VAP.

To support this feature, map different beacon interval service bit
to wmi tlv service.

Tested HW: WCN3990
Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1

Signed-off-by: Dundi Raviteja <dundi@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c     | 33 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  3 +++
 2 files changed, 36 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index e49b367..09c4705 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8232,6 +8232,30 @@ void ath10k_mac_destroy(struct ath10k *ar)
 	},
 };
 
+static struct
+ieee80211_iface_combination ath10k_tlv_qcs_bcn_int_if_comb[] = {
+	{
+		.limits = ath10k_tlv_if_limit,
+		.num_different_channels = 1,
+		.max_interfaces = 4,
+		.beacon_int_infra_match = true,
+		.beacon_int_min_gcd = 1,
+		.n_limits = ARRAY_SIZE(ath10k_tlv_if_limit),
+	},
+	{
+		.limits = ath10k_tlv_qcs_if_limit,
+		.num_different_channels = 2,
+		.max_interfaces = 4,
+		.n_limits = ARRAY_SIZE(ath10k_tlv_qcs_if_limit),
+	},
+	{
+		.limits = ath10k_tlv_if_limit_ibss,
+		.num_different_channels = 1,
+		.max_interfaces = 2,
+		.n_limits = ARRAY_SIZE(ath10k_tlv_if_limit_ibss),
+	},
+};
+
 static const struct ieee80211_iface_limit ath10k_10_4_if_limits[] = {
 	{
 		.max = 1,
@@ -8642,6 +8666,15 @@ int ath10k_mac_register(struct ath10k *ar)
 				ath10k_tlv_qcs_if_comb;
 			ar->hw->wiphy->n_iface_combinations =
 				ARRAY_SIZE(ath10k_tlv_qcs_if_comb);
+
+			if (test_bit
+			    (WMI_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT,
+			    ar->wmi.svc_map)) {
+				ar->hw->wiphy->iface_combinations =
+						ath10k_tlv_qcs_bcn_int_if_comb;
+				ar->hw->wiphy->n_iface_combinations =
+				     ARRAY_SIZE(ath10k_tlv_qcs_bcn_int_if_comb);
+			}
 		} else {
 			ar->hw->wiphy->iface_combinations = ath10k_tlv_if_comb;
 			ar->hw->wiphy->n_iface_combinations =
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index e07e990..9f78502 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -1567,6 +1567,9 @@ enum wmi_tlv_service {
 	SVCMAP(WMI_TLV_SERVICE_THERM_THROT,
 	       WMI_SERVICE_THERM_THROT,
 	       WMI_TLV_MAX_SERVICE);
+	SVCMAP(WMI_TLV_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT,
+	       WMI_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT,
+	       WMI_TLV_MAX_SERVICE);
 }
 
 #undef SVCMAP
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
