Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dzzIJ-0006YL-0g
 for ath10k@lists.infradead.org; Thu, 05 Oct 2017 06:06:04 +0000
From: <akolli@qti.qualcomm.com>
Subject: [PATCH 1/2] ath10k: move ath10k_mac_tdls_vif*() functions
Date: Thu, 5 Oct 2017 11:38:28 +0530
Message-ID: <1507183709-585-1-git-send-email-akolli@qti.qualcomm.com>
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
Cc: Anilkumar Kolli <akolli@qti.qualcomm.com>, akolli@codeaurora.org, linux-wireless@vger.kernel.org

From: Anilkumar Kolli <akolli@qti.qualcomm.com>

To be able to use ath10k_mac_tdls_vif_stations_count() in
ath10k_hw_scan() in the following patch, move the functions
earlier in the file.

This commit is pure code move, no functional changes.

Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |  106 ++++++++++++++++-----------------
 1 file changed, 53 insertions(+), 53 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 5683f1a5330e..0f14da73cf64 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5575,6 +5575,59 @@ static void ath10k_mac_op_set_coverage_class(struct ieee80211_hw *hw, s16 value)
 	ar->hw_params.hw_ops->set_coverage_class(ar, value);
 }
 
+struct ath10k_mac_tdls_iter_data {
+	u32 num_tdls_stations;
+	struct ieee80211_vif *curr_vif;
+};
+
+static void ath10k_mac_tdls_vif_stations_count_iter(void *data,
+						    struct ieee80211_sta *sta)
+{
+	struct ath10k_mac_tdls_iter_data *iter_data = data;
+	struct ath10k_sta *arsta = (struct ath10k_sta *)sta->drv_priv;
+	struct ieee80211_vif *sta_vif = arsta->arvif->vif;
+
+	if (sta->tdls && sta_vif == iter_data->curr_vif)
+		iter_data->num_tdls_stations++;
+}
+
+static int ath10k_mac_tdls_vif_stations_count(struct ieee80211_hw *hw,
+					      struct ieee80211_vif *vif)
+{
+	struct ath10k_mac_tdls_iter_data data = {};
+
+	data.curr_vif = vif;
+
+	ieee80211_iterate_stations_atomic(hw,
+					  ath10k_mac_tdls_vif_stations_count_iter,
+					  &data);
+	return data.num_tdls_stations;
+}
+
+static void ath10k_mac_tdls_vifs_count_iter(void *data, u8 *mac,
+					    struct ieee80211_vif *vif)
+{
+	struct ath10k_vif *arvif = (void *)vif->drv_priv;
+	int *num_tdls_vifs = data;
+
+	if (vif->type != NL80211_IFTYPE_STATION)
+		return;
+
+	if (ath10k_mac_tdls_vif_stations_count(arvif->ar->hw, vif) > 0)
+		(*num_tdls_vifs)++;
+}
+
+static int ath10k_mac_tdls_vifs_count(struct ieee80211_hw *hw)
+{
+	int num_tdls_vifs = 0;
+
+	ieee80211_iterate_active_interfaces_atomic(hw,
+						   IEEE80211_IFACE_ITER_NORMAL,
+						   ath10k_mac_tdls_vifs_count_iter,
+						   &num_tdls_vifs);
+	return num_tdls_vifs;
+}
+
 static int ath10k_hw_scan(struct ieee80211_hw *hw,
 			  struct ieee80211_vif *vif,
 			  struct ieee80211_scan_request *hw_req)
@@ -6000,59 +6053,6 @@ static void ath10k_mac_dec_num_stations(struct ath10k_vif *arvif,
 	ar->num_stations--;
 }
 
-struct ath10k_mac_tdls_iter_data {
-	u32 num_tdls_stations;
-	struct ieee80211_vif *curr_vif;
-};
-
-static void ath10k_mac_tdls_vif_stations_count_iter(void *data,
-						    struct ieee80211_sta *sta)
-{
-	struct ath10k_mac_tdls_iter_data *iter_data = data;
-	struct ath10k_sta *arsta = (struct ath10k_sta *)sta->drv_priv;
-	struct ieee80211_vif *sta_vif = arsta->arvif->vif;
-
-	if (sta->tdls && sta_vif == iter_data->curr_vif)
-		iter_data->num_tdls_stations++;
-}
-
-static int ath10k_mac_tdls_vif_stations_count(struct ieee80211_hw *hw,
-					      struct ieee80211_vif *vif)
-{
-	struct ath10k_mac_tdls_iter_data data = {};
-
-	data.curr_vif = vif;
-
-	ieee80211_iterate_stations_atomic(hw,
-					  ath10k_mac_tdls_vif_stations_count_iter,
-					  &data);
-	return data.num_tdls_stations;
-}
-
-static void ath10k_mac_tdls_vifs_count_iter(void *data, u8 *mac,
-					    struct ieee80211_vif *vif)
-{
-	struct ath10k_vif *arvif = (void *)vif->drv_priv;
-	int *num_tdls_vifs = data;
-
-	if (vif->type != NL80211_IFTYPE_STATION)
-		return;
-
-	if (ath10k_mac_tdls_vif_stations_count(arvif->ar->hw, vif) > 0)
-		(*num_tdls_vifs)++;
-}
-
-static int ath10k_mac_tdls_vifs_count(struct ieee80211_hw *hw)
-{
-	int num_tdls_vifs = 0;
-
-	ieee80211_iterate_active_interfaces_atomic(hw,
-						   IEEE80211_IFACE_ITER_NORMAL,
-						   ath10k_mac_tdls_vifs_count_iter,
-						   &num_tdls_vifs);
-	return num_tdls_vifs;
-}
-
 static int ath10k_sta_state(struct ieee80211_hw *hw,
 			    struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta,
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
