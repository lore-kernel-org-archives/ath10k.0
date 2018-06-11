Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSU4o-0006rN-Jw
 for ath10k@lists.infradead.org; Mon, 11 Jun 2018 21:10:15 +0000
Received: by mail-pl0-x241.google.com with SMTP id b14-v6so13044458pls.5
 for <ath10k@lists.infradead.org>; Mon, 11 Jun 2018 14:10:00 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH 1/4] ath10k: snoc: use correct bus-specific pointer in RX retry
Date: Mon, 11 Jun 2018 14:09:43 -0700
Message-Id: <20180611210946.241341-1-briannorris@chromium.org>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Brian Norris <briannorris@chromium.org>, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

We're 'ath10k_snoc', not 'ath10k_pci'. This probably means we're
accessing junk data in ath10k_snoc_rx_replenish_retry(), unless
'ath10k_snoc' and 'ath10k_pci' happen to have very similar struct
layouts.

Noticed by inspection.

Fixes: d915105231ca ("ath10k: add hif rx methods for wcn3990")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
It's possible this would be a for-4.18 target, since the buggy patch is
in the -rc1 merge. But this driver is not fully operational yet. Also,
I'm sending some companion refactorings to help avoid this bug. They
probably aren't 4.18 material.

Let me know if I should do anything differently.

 drivers/net/wireless/ath/ath10k/snoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index ee74e0060504..c7cfc9c9b3d7 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -449,7 +449,7 @@ static void ath10k_snoc_htt_rx_cb(struct ath10k_ce_pipe *ce_state)
 
 static void ath10k_snoc_rx_replenish_retry(struct timer_list *t)
 {
-	struct ath10k_pci *ar_snoc = from_timer(ar_snoc, t, rx_post_retry);
+	struct ath10k_snoc *ar_snoc = from_timer(ar_snoc, t, rx_post_retry);
 	struct ath10k *ar = ar_snoc->ar;
 
 	ath10k_snoc_rx_post(ar);
-- 
2.18.0.rc1.242.g61856ae69a-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
