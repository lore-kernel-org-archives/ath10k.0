Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afliQ-0005Ca-M8
 for ath10k@lists.infradead.org; Tue, 15 Mar 2016 09:56:39 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH] ath10k: Advertise force AP scan feature
Date: Tue, 15 Mar 2016 15:25:53 +0530
Message-ID: <1458035753-20727-1-git-send-email-vthiagar@qti.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

Results obtained from scan can be used for spectrum management by
doing something like building information of preferred channel
lists and sharing them with stations around. It is to be noted
that traffic to the connected stations would be affected during
the scan.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index ebff9c0..48b789c 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -7697,7 +7697,8 @@ int ath10k_mac_register(struct ath10k *ar)
 	ar->hw->wiphy->max_remain_on_channel_duration = 5000;
 
 	ar->hw->wiphy->flags |= WIPHY_FLAG_AP_UAPSD;
-	ar->hw->wiphy->features |= NL80211_FEATURE_AP_MODE_CHAN_WIDTH_CHANGE;
+	ar->hw->wiphy->features |= NL80211_FEATURE_AP_MODE_CHAN_WIDTH_CHANGE |
+				   NL80211_FEATURE_AP_SCAN;
 
 	ar->hw->wiphy->max_ap_assoc_sta = ar->max_num_stations;
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
