Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58] helo=smtp.tuxdriver.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAmLJ-0005Ub-U7
 for ath10k@lists.infradead.org; Mon, 12 Jan 2015 21:16:10 +0000
From: "John W. Linville" <linville@tuxdriver.com>
Subject: [PATCH] ath10k: document switch case fall-through in
 __ath10k_scan_finish
Date: Mon, 12 Jan 2015 16:07:02 -0500
Message-Id: <1421096822-28698-1-git-send-email-linville@tuxdriver.com>
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
To: linux-wireless@vger.kernel.org
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, "John W. Linville" <linville@tuxdriver.com>, ath10k@lists.infradead.org

Add a comment for indicating that the ATH10K_SCAN_RUNNING case falls
through to the ATH10K_SCAN_ABORTING case in __ath10k_scan_finish.  This
will document that the lack of a break is intentional.

Coverity: CID 1260017

Signed-off-by: John W. Linville <linville@tuxdriver.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index c4005670cba2..695222e57728 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2213,6 +2213,7 @@ void __ath10k_scan_finish(struct ath10k *ar)
 	case ATH10K_SCAN_RUNNING:
 		if (ar->scan.is_roc)
 			ieee80211_remain_on_channel_expired(ar->hw);
+		/* fall through */
 	case ATH10K_SCAN_ABORTING:
 		if (!ar->scan.is_roc)
 			ieee80211_scan_completed(ar->hw,
-- 
2.1.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
