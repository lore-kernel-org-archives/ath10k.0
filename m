Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22e.google.com ([2a00:1450:4010:c04::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZD9hb-0004He-En
 for ath10k@lists.infradead.org; Thu, 09 Jul 2015 11:09:16 +0000
Received: by lbzd8 with SMTP id d8so27595447lbz.0
 for <ath10k@lists.infradead.org>; Thu, 09 Jul 2015 04:08:53 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 6/6] ath10k: tweak interface combinations
Date: Thu,  9 Jul 2015 13:08:39 +0200
Message-Id: <1436440119-30231-7-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1436440119-30231-1-git-send-email-michal.kazior@tieto.com>
References: <1436440119-30231-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Concurrent AP/GO operation on different channels
isn't really supported well by the firmware so
it's better to remove it from being advertised.

Also tune the way station and p2p client interface
limits are expressed to allow station + 2x p2p
client or station + p2p client + p2p go.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 39 ++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 0ef568c36db9..c41b34843a82 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6557,8 +6557,11 @@ static const struct ieee80211_iface_combination ath10k_10x_if_comb[] = {
 static const struct ieee80211_iface_limit ath10k_tlv_if_limit[] = {
 	{
 		.max = 2,
-		.types = BIT(NL80211_IFTYPE_STATION) |
-			 BIT(NL80211_IFTYPE_AP) |
+		.types = BIT(NL80211_IFTYPE_STATION),
+	},
+	{
+		.max = 2,
+		.types = BIT(NL80211_IFTYPE_AP) |
 			 BIT(NL80211_IFTYPE_P2P_CLIENT) |
 			 BIT(NL80211_IFTYPE_P2P_GO),
 	},
@@ -6568,6 +6571,26 @@ static const struct ieee80211_iface_limit ath10k_tlv_if_limit[] = {
 	},
 };
 
+static const struct ieee80211_iface_limit ath10k_tlv_qcs_if_limit[] = {
+	{
+		.max = 2,
+		.types = BIT(NL80211_IFTYPE_STATION),
+	},
+	{
+		.max = 2,
+		.types = BIT(NL80211_IFTYPE_P2P_CLIENT),
+	},
+	{
+		.max = 1,
+		.types = BIT(NL80211_IFTYPE_AP) |
+			 BIT(NL80211_IFTYPE_P2P_GO),
+	},
+	{
+		.max = 1,
+		.types = BIT(NL80211_IFTYPE_P2P_DEVICE),
+	},
+};
+
 static const struct ieee80211_iface_limit ath10k_tlv_if_limit_ibss[] = {
 	{
 		.max = 1,
@@ -6586,7 +6609,7 @@ static struct ieee80211_iface_combination ath10k_tlv_if_comb[] = {
 	{
 		.limits = ath10k_tlv_if_limit,
 		.num_different_channels = 1,
-		.max_interfaces = 3,
+		.max_interfaces = 4,
 		.n_limits = ARRAY_SIZE(ath10k_tlv_if_limit),
 	},
 	{
@@ -6600,9 +6623,15 @@ static struct ieee80211_iface_combination ath10k_tlv_if_comb[] = {
 static struct ieee80211_iface_combination ath10k_tlv_qcs_if_comb[] = {
 	{
 		.limits = ath10k_tlv_if_limit,
+		.num_different_channels = 1,
+		.max_interfaces = 4,
+		.n_limits = ARRAY_SIZE(ath10k_tlv_if_limit),
+	},
+	{
+		.limits = ath10k_tlv_qcs_if_limit,
 		.num_different_channels = 2,
-		.max_interfaces = 3,
-		.n_limits = ARRAY_SIZE(ath10k_tlv_if_limit),
+		.max_interfaces = 4,
+		.n_limits = ARRAY_SIZE(ath10k_tlv_qcs_if_limit),
 	},
 	{
 		.limits = ath10k_tlv_if_limit_ibss,
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
