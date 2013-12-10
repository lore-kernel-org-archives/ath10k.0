Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x22f.google.com ([2a00:1450:4013:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqP7U-0002pn-Bf
 for ath10k@lists.infradead.org; Tue, 10 Dec 2013 15:21:10 +0000
Received: by mail-ea0-f175.google.com with SMTP id z10so2309236ead.20
 for <ath10k@lists.infradead.org>; Tue, 10 Dec 2013 07:20:43 -0800 (PST)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH 1/2] ath10k: split the if_limits and if_comb
Date: Tue, 10 Dec 2013 16:20:39 +0100
Message-Id: <1386688840-12181-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

Split the interface limits and inteface combination,
to reflect the 10.X capabilites (no P2P, no STA and 8 VAP).

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index ce9ef349..35952a4 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3464,14 +3464,12 @@ static const struct ieee80211_iface_limit ath10k_if_limits[] = {
 	},
 };
 
-#ifdef CONFIG_ATH10K_DFS_CERTIFIED
-static const struct ieee80211_iface_limit ath10k_if_dfs_limits[] = {
+static const struct ieee80211_iface_limit ath10k_10x_if_limits[] = {
 	{
 	.max	= 8,
 	.types	= BIT(NL80211_IFTYPE_AP)
 	},
 };
-#endif
 
 static const struct ieee80211_iface_combination ath10k_if_comb[] = {
 	{
@@ -3481,19 +3479,22 @@ static const struct ieee80211_iface_combination ath10k_if_comb[] = {
 		.num_different_channels = 1,
 		.beacon_int_infra_match = true,
 	},
-#ifdef CONFIG_ATH10K_DFS_CERTIFIED
+};
+
+static const struct ieee80211_iface_combination ath10k_10x_if_comb[] = {
 	{
-		.limits = ath10k_if_dfs_limits,
-		.n_limits = ARRAY_SIZE(ath10k_if_dfs_limits),
+		.limits = ath10k_10x_if_limits,
+		.n_limits = ARRAY_SIZE(ath10k_10x_if_limits),
 		.max_interfaces = 8,
 		.num_different_channels = 1,
 		.beacon_int_infra_match = true,
+#ifdef CONFIG_ATH10K_DFS_CERTIFIED
 		.radar_detect_widths =	BIT(NL80211_CHAN_WIDTH_20_NOHT) |
 					BIT(NL80211_CHAN_WIDTH_20) |
 					BIT(NL80211_CHAN_WIDTH_40) |
 					BIT(NL80211_CHAN_WIDTH_80),
-	}
 #endif
+	},
 };
 
 static struct ieee80211_sta_vht_cap ath10k_create_vht_cap(struct ath10k *ar)
@@ -3717,8 +3718,15 @@ int ath10k_mac_register(struct ath10k *ar)
 	 */
 	ar->hw->queues = 4;
 
-	ar->hw->wiphy->iface_combinations = ath10k_if_comb;
-	ar->hw->wiphy->n_iface_combinations = ARRAY_SIZE(ath10k_if_comb);
+	if (!test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
+
+		ar->hw->wiphy->iface_combinations = ath10k_if_comb;
+		ar->hw->wiphy->n_iface_combinations = ARRAY_SIZE(ath10k_if_comb);
+
+	} else {
+		ar->hw->wiphy->iface_combinations = ath10k_10x_if_comb;
+		ar->hw->wiphy->n_iface_combinations = ARRAY_SIZE(ath10k_10x_if_comb);
+	}
 
 	ar->hw->netdev_features = NETIF_F_HW_CSUM;
 
-- 
1.7.10


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
