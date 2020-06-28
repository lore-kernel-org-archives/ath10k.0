Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpah5-00037q-MB
 for ath10k@lists.infradead.org; Sun, 28 Jun 2020 17:02:17 +0000
From: Tamizh Chelvam <tamizhr@codeaurora.org>
Subject: [PATCH 2/4] ath10k: Move rate mask validation function up in the file
Date: Sun, 28 Jun 2020 22:31:56 +0530
Message-Id: <1593363718-5148-3-git-send-email-tamizhr@codeaurora.org>
In-Reply-To: <1593363718-5148-1-git-send-email-tamizhr@codeaurora.org>
References: <1593363718-5148-1-git-send-email-tamizhr@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Tamizh Chelvam <tamizhr@codeaurora.org>

This patch does not have any functional changes.

Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 174 +++++++++++++++++-----------------
 1 file changed, 87 insertions(+), 87 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3e38962..7023ccf 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6602,6 +6602,93 @@ static int ath10k_sta_set_txpwr(struct ieee80211_hw *hw,
 	return ret;
 }
 
+static bool
+ath10k_mac_bitrate_mask_has_single_rate(struct ath10k *ar,
+					enum nl80211_band band,
+					const struct cfg80211_bitrate_mask *mask,
+					int *vht_num_rates)
+{
+	int num_rates = 0;
+	int i, tmp;
+
+	num_rates += hweight32(mask->control[band].legacy);
+
+	for (i = 0; i < ARRAY_SIZE(mask->control[band].ht_mcs); i++)
+		num_rates += hweight8(mask->control[band].ht_mcs[i]);
+
+	*vht_num_rates = 0;
+	for (i = 0; i < ARRAY_SIZE(mask->control[band].vht_mcs); i++) {
+		tmp = hweight16(mask->control[band].vht_mcs[i]);
+		num_rates += tmp;
+		*vht_num_rates += tmp;
+	}
+
+	return num_rates == 1;
+}
+
+static int
+ath10k_mac_bitrate_mask_get_single_rate(struct ath10k *ar,
+					enum nl80211_band band,
+					const struct cfg80211_bitrate_mask *mask,
+					u8 *rate, u8 *nss, bool vht_only)
+{
+	int rate_idx;
+	int i;
+	u16 bitrate;
+	u8 preamble;
+	u8 hw_rate;
+
+	if (vht_only)
+		goto next;
+
+	if (hweight32(mask->control[band].legacy) == 1) {
+		rate_idx = ffs(mask->control[band].legacy) - 1;
+
+		if (ar->phy_capability & WHAL_WLAN_11A_CAPABILITY)
+			rate_idx += ATH10K_MAC_FIRST_OFDM_RATE_IDX;
+
+		hw_rate = ath10k_wmi_legacy_rates[rate_idx].hw_value;
+		bitrate = ath10k_wmi_legacy_rates[rate_idx].bitrate;
+
+		if (ath10k_mac_bitrate_is_cck(bitrate))
+			preamble = WMI_RATE_PREAMBLE_CCK;
+		else
+			preamble = WMI_RATE_PREAMBLE_OFDM;
+
+		*nss = 1;
+		*rate = preamble << 6 |
+			(*nss - 1) << 4 |
+			hw_rate << 0;
+
+		return 0;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(mask->control[band].ht_mcs); i++) {
+		if (hweight8(mask->control[band].ht_mcs[i]) == 1) {
+			*nss = i + 1;
+			*rate = WMI_RATE_PREAMBLE_HT << 6 |
+				(*nss - 1) << 4 |
+				(ffs(mask->control[band].ht_mcs[i]) - 1);
+
+			return 0;
+		}
+	}
+
+next:
+	for (i = 0; i < ARRAY_SIZE(mask->control[band].vht_mcs); i++) {
+		if (hweight16(mask->control[band].vht_mcs[i]) == 1) {
+			*nss = i + 1;
+			*rate = WMI_RATE_PREAMBLE_VHT << 6 |
+				(*nss - 1) << 4 |
+				(ffs(mask->control[band].vht_mcs[i]) - 1);
+
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
 static int ath10k_sta_state(struct ieee80211_hw *hw,
 			    struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta,
@@ -7352,30 +7439,6 @@ static int ath10k_get_survey(struct ieee80211_hw *hw, int idx,
 }
 
 static bool
-ath10k_mac_bitrate_mask_has_single_rate(struct ath10k *ar,
-					enum nl80211_band band,
-					const struct cfg80211_bitrate_mask *mask,
-					int *vht_num_rates)
-{
-	int num_rates = 0;
-	int i, tmp;
-
-	num_rates += hweight32(mask->control[band].legacy);
-
-	for (i = 0; i < ARRAY_SIZE(mask->control[band].ht_mcs); i++)
-		num_rates += hweight8(mask->control[band].ht_mcs[i]);
-
-	*vht_num_rates = 0;
-	for (i = 0; i < ARRAY_SIZE(mask->control[band].vht_mcs); i++) {
-		tmp = hweight16(mask->control[band].vht_mcs[i]);
-		num_rates += tmp;
-		*vht_num_rates += tmp;
-	}
-
-	return num_rates == 1;
-}
-
-static bool
 ath10k_mac_bitrate_mask_get_single_nss(struct ath10k *ar,
 				       enum nl80211_band band,
 				       const struct cfg80211_bitrate_mask *mask,
@@ -7424,69 +7487,6 @@ static int ath10k_get_survey(struct ieee80211_hw *hw, int idx,
 	return true;
 }
 
-static int
-ath10k_mac_bitrate_mask_get_single_rate(struct ath10k *ar,
-					enum nl80211_band band,
-					const struct cfg80211_bitrate_mask *mask,
-					u8 *rate, u8 *nss, bool vht_only)
-{
-	int rate_idx;
-	int i;
-	u16 bitrate;
-	u8 preamble;
-	u8 hw_rate;
-
-	if (vht_only)
-		goto next;
-
-	if (hweight32(mask->control[band].legacy) == 1) {
-		rate_idx = ffs(mask->control[band].legacy) - 1;
-
-		if (ar->phy_capability & WHAL_WLAN_11A_CAPABILITY)
-			rate_idx += ATH10K_MAC_FIRST_OFDM_RATE_IDX;
-
-		hw_rate = ath10k_wmi_legacy_rates[rate_idx].hw_value;
-		bitrate = ath10k_wmi_legacy_rates[rate_idx].bitrate;
-
-		if (ath10k_mac_bitrate_is_cck(bitrate))
-			preamble = WMI_RATE_PREAMBLE_CCK;
-		else
-			preamble = WMI_RATE_PREAMBLE_OFDM;
-
-		*nss = 1;
-		*rate = preamble << 6 |
-			(*nss - 1) << 4 |
-			hw_rate << 0;
-
-		return 0;
-	}
-
-	for (i = 0; i < ARRAY_SIZE(mask->control[band].ht_mcs); i++) {
-		if (hweight8(mask->control[band].ht_mcs[i]) == 1) {
-			*nss = i + 1;
-			*rate = WMI_RATE_PREAMBLE_HT << 6 |
-				(*nss - 1) << 4 |
-				(ffs(mask->control[band].ht_mcs[i]) - 1);
-
-			return 0;
-		}
-	}
-
-next:
-	for (i = 0; i < ARRAY_SIZE(mask->control[band].vht_mcs); i++) {
-		if (hweight16(mask->control[band].vht_mcs[i]) == 1) {
-			*nss = i + 1;
-			*rate = WMI_RATE_PREAMBLE_VHT << 6 |
-				(*nss - 1) << 4 |
-				(ffs(mask->control[band].vht_mcs[i]) - 1);
-
-			return 0;
-		}
-	}
-
-	return -EINVAL;
-}
-
 static int ath10k_mac_set_fixed_rate_params(struct ath10k_vif *arvif,
 					    u8 rate, u8 nss, u8 sgi, u8 ldpc)
 {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
