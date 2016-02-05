Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aRiXm-0000xv-Uk
 for ath10k@lists.infradead.org; Fri, 05 Feb 2016 15:43:35 +0000
From: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
Subject: [PATCH 1/2] ath10k: fix pktlog in QCA99X0
Date: Fri, 5 Feb 2016 21:12:48 +0530
Message-ID: <1454686969-5740-1-git-send-email-arnagara@qti.qualcomm.com>
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
Cc: arnagara@qti.qualcomm.com, kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org

Currently, we are providing wrong payload data of pktlog to trace points.
Data we receive from FW through copy engine 8 contains pktlog data alone.
We don't need to parse anything in driver before handing it to trace
points.

Fixes: afb0bf7f530b ("ath10k: add support for pktlog in QCA99X0")
Signed-off-by: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 3079434..1ff04d4 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2143,11 +2143,7 @@ EXPORT_SYMBOL(ath10k_htt_t2h_msg_handler);
 void ath10k_htt_rx_pktlog_completion_handler(struct ath10k *ar,
 					     struct sk_buff *skb)
 {
-	struct ath10k_pktlog_10_4_hdr *hdr =
-		(struct ath10k_pktlog_10_4_hdr *)skb->data;
-
-	trace_ath10k_htt_pktlog(ar, hdr->payload,
-				sizeof(*hdr) + __le16_to_cpu(hdr->size));
+	trace_ath10k_htt_pktlog(ar, skb->data, skb->len);
 	dev_kfree_skb_any(skb);
 }
 EXPORT_SYMBOL(ath10k_htt_rx_pktlog_completion_handler);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
