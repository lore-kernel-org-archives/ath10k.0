Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coRRV-0000vU-PA
 for ath10k@lists.infradead.org; Thu, 16 Mar 2017 09:11:36 +0000
Subject: [PATCH] ath10k: fix warnings from an earlier commit
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 16 Mar 2017 11:11:02 +0200
Message-ID: <148965546273.3007.5273967631982279383.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

I failed to notice that commit 523f6701dbab ("ath10k: update available channel
list for 5G radio") added two new warnings:

drivers/net/wireless/ath/ath10k/mac.c:3129:6: warning: symbol 'ath10k_mac_update_channel_list' was not declared. Should it be static?
drivers/net/wireless/ath/ath10k/mac.c:3170: Alignment should match open parenthesis

Fix those.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a25f0ec15cf8..d60086cdc584 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3126,8 +3126,8 @@ static void ath10k_regd_update(struct ath10k *ar)
 		ath10k_warn(ar, "failed to set pdev regdomain: %d\n", ret);
 }
 
-void ath10k_mac_update_channel_list(struct ath10k *ar,
-				    struct ieee80211_supported_band *band)
+static void ath10k_mac_update_channel_list(struct ath10k *ar,
+					   struct ieee80211_supported_band *band)
 {
 	int i;
 
@@ -3167,7 +3167,7 @@ static void ath10k_reg_notifier(struct wiphy *wiphy,
 
 	if (ar->phy_capability & WHAL_WLAN_11A_CAPABILITY)
 		ath10k_mac_update_channel_list(ar,
-				ar->hw->wiphy->bands[NL80211_BAND_5GHZ]);
+					       ar->hw->wiphy->bands[NL80211_BAND_5GHZ]);
 }
 
 /***************/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
