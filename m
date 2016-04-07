Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ao3aj-0001jd-BB
 for ath10k@lists.infradead.org; Thu, 07 Apr 2016 06:38:58 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH v2 3/3] ath10k: fix unconditional num_mpdus_ready subtraction
Date: Thu, 7 Apr 2016 12:07:31 +0530
Message-ID: <1460011051-8272-3-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1460011051-8272-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1460011051-8272-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, rmanohar@codeaurora.org

Decrement num_mpdus_ready only when rx amsdu is processed successfully.
Not doing so, will result in leak and impact stabilty under low memory
cases. Also commit 3128b3d8a2b9 ("ath10k: speedup htt rx descriptor
processing for rx_ind") missed to removed unused skb list rx_q.

Fixes: 3128b3d8a2b9 ("ath10k: speedup htt rx descriptor processing for
rx_ind")
Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
v2: updated commit log

 drivers/net/wireless/ath/ath10k/htt_rx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 41adf62d7555..9390897a00c6 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2412,14 +2412,12 @@ static void ath10k_htt_txrx_compl_task(unsigned long ptr)
 	struct ath10k_htt *htt = (struct ath10k_htt *)ptr;
 	struct ath10k *ar = htt->ar;
 	struct htt_tx_done tx_done = {};
-	struct sk_buff_head rx_q;
 	struct sk_buff_head rx_ind_q;
 	struct sk_buff_head tx_ind_q;
 	struct sk_buff *skb;
 	unsigned long flags;
 	int num_mpdus;
 
-	__skb_queue_head_init(&rx_q);
 	__skb_queue_head_init(&rx_ind_q);
 	__skb_queue_head_init(&tx_ind_q);
 
@@ -2447,11 +2445,13 @@ static void ath10k_htt_txrx_compl_task(unsigned long ptr)
 	ath10k_mac_tx_push_pending(ar);
 
 	num_mpdus = atomic_read(&htt->num_mpdus_ready);
-	atomic_sub(num_mpdus, &htt->num_mpdus_ready);
 
-	while (num_mpdus--) {
+	while (num_mpdus) {
 		if (ath10k_htt_rx_handle_amsdu(htt))
 			break;
+
+		num_mpdus--;
+		atomic_dec(&htt->num_mpdus_ready);
 	}
 
 	while ((skb = __skb_dequeue(&rx_ind_q))) {
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
