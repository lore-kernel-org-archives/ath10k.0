Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z737U-0003g7-1H
 for ath10k@lists.infradead.org; Mon, 22 Jun 2015 14:54:44 +0000
From: Raja Mani <rmani@qti.qualcomm.com>
Subject: [PATCH v2 6/8] ath10k: advertise 10.4 fw ap and sta iface combination
 to mac80211
Date: Mon, 22 Jun 2015 20:22:25 +0530
Message-ID: <1434984747-24294-7-git-send-email-rmani@qti.qualcomm.com>
In-Reply-To: <1434984747-24294-1-git-send-email-rmani@qti.qualcomm.com>
References: <1434984747-24294-1-git-send-email-rmani@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>

10.4 fw supports upto 16 interface in ap mode and 1 interface
in station mode, overall total interfaces supported are 16
interfaces. Populate this limit in wiphy->iface_combinations.

Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index f9989d1..bbdf7a9 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6620,6 +6620,33 @@ static struct ieee80211_iface_combination ath10k_tlv_qcs_if_comb[] = {
 	},
 };
 
+static const struct ieee80211_iface_limit ath10k_10_4_if_limits[] = {
+	{
+		.max = 1,
+		.types = BIT(NL80211_IFTYPE_STATION),
+	},
+	{
+		.max	= 16,
+		.types	= BIT(NL80211_IFTYPE_AP)
+	},
+};
+
+static const struct ieee80211_iface_combination ath10k_10_4_if_comb[] = {
+	{
+		.limits = ath10k_10_4_if_limits,
+		.n_limits = ARRAY_SIZE(ath10k_10_4_if_limits),
+		.max_interfaces = 16,
+		.num_different_channels = 1,
+		.beacon_int_infra_match = true,
+#ifdef CONFIG_ATH10K_DFS_CERTIFIED
+		.radar_detect_widths =	BIT(NL80211_CHAN_WIDTH_20_NOHT) |
+					BIT(NL80211_CHAN_WIDTH_20) |
+					BIT(NL80211_CHAN_WIDTH_40) |
+					BIT(NL80211_CHAN_WIDTH_80),
+#endif
+	},
+};
+
 static struct ieee80211_sta_vht_cap ath10k_create_vht_cap(struct ath10k *ar)
 {
 	struct ieee80211_sta_vht_cap vht_cap = {0};
@@ -6944,6 +6971,9 @@ int ath10k_mac_register(struct ath10k *ar)
 			ARRAY_SIZE(ath10k_10x_if_comb);
 		break;
 	case ATH10K_FW_WMI_OP_VERSION_10_4:
+		ar->hw->wiphy->iface_combinations = ath10k_10_4_if_comb;
+		ar->hw->wiphy->n_iface_combinations =
+			ARRAY_SIZE(ath10k_10_4_if_comb);
 		break;
 	case ATH10K_FW_WMI_OP_VERSION_UNSET:
 	case ATH10K_FW_WMI_OP_VERSION_MAX:
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
