Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfh3o-0003F2-71
 for ath10k@lists.infradead.org; Fri, 02 Sep 2016 05:30:40 +0000
From: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
Subject: [PATCH] ath10k: fix reporting channel survey data
Date: Fri, 2 Sep 2016 10:59:53 +0530
Message-ID: <1472794193-20774-1-git-send-email-arnagara@qti.qualcomm.com>
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
Cc: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>, arnagara@codeaurora.org, linux-wireless@vger.kernel.org

When user requests for survey dump data, driver is providing wrong survey
information. This information we sent is the survey data that we have
collected during previous user request.

This issue occurs because we request survey dump for wrong channel. With
this change, we correctly display the correct and current survey
information to userspace.

Fixes: fa7937e3d5c2 ("ath10k: update bss channel survey information")
Signed-off-by: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 0bbd0a0..1fa3c17 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6538,7 +6538,7 @@ static int ath10k_get_survey(struct ieee80211_hw *hw, int idx,
 		goto exit;
 	}
 
-	ath10k_mac_update_bss_chan_survey(ar, survey->channel);
+	ath10k_mac_update_bss_chan_survey(ar, &sband->channels[idx]);
 
 	spin_lock_bh(&ar->data_lock);
 	memcpy(survey, ar_survey, sizeof(*survey));
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
