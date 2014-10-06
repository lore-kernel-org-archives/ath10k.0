Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xb8JT-0002U9-J6
 for ath10k@lists.infradead.org; Mon, 06 Oct 2014 13:26:56 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 4/4] ath10k: add tracepoint for htt tx frames
Date: Mon, 6 Oct 2014 18:57:04 +0530
Message-ID: <1412602024-31706-5-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1412602024-31706-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1412602024-31706-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, Michal Kazior <michal.kazior@tieto.com>

Although frame contents were printed via dbg_dump
already it was not possible to easily filter them
out for processing.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c |  3 ++-
 drivers/net/wireless/ath/ath10k/trace.h  | 13 +++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index fdfb171..9621b62 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -557,7 +557,8 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 	skb_cb->htt.txbuf->cmd_tx.frags_paddr = __cpu_to_le32(frags_paddr);
 	skb_cb->htt.txbuf->cmd_tx.peerid = __cpu_to_le32(HTT_INVALID_PEERID);
 
-	trace_ath10k_htt_tx(ar, msdu_id, msdu->len, vdev_id, tid);
+	trace_ath10k_htt_tx(ar, msdu_id, msdu->len, vdev_id, tid,
+			    msdu->data, msdu->len);
 	ath10k_dbg(ar, ATH10K_DBG_HTT,
 		   "htt tx flags0 %hhu flags1 %hu len %d id %hu frags_paddr %08x, msdu_paddr %08x vdev %hhu tid %hhu\n",
 		   flags0, flags1, msdu->len, msdu_id, frags_paddr,
diff --git a/drivers/net/wireless/ath/ath10k/trace.h b/drivers/net/wireless/ath/ath10k/trace.h
index 6d39055..1747534 100644
--- a/drivers/net/wireless/ath/ath10k/trace.h
+++ b/drivers/net/wireless/ath/ath10k/trace.h
@@ -313,9 +313,9 @@ TRACE_EVENT(ath10k_htt_rx_desc,
 
 TRACE_EVENT(ath10k_htt_tx,
 	    TP_PROTO(struct ath10k *ar, u16 msdu_id, u16 msdu_len,
-		     u8 vdev_id, u8 tid),
+		     u8 vdev_id, u8 tid, void *data, size_t len),
 
-	TP_ARGS(ar, msdu_id, msdu_len, vdev_id, tid),
+	TP_ARGS(ar, msdu_id, msdu_len, vdev_id, tid, data, len),
 
 	TP_STRUCT__entry(
 		__string(device, dev_name(ar->dev))
@@ -324,6 +324,8 @@ TRACE_EVENT(ath10k_htt_tx,
 		__field(u16, msdu_len)
 		__field(u8, vdev_id)
 		__field(u8, tid)
+		__field(size_t, len)
+		__dynamic_array(u8, data, len)
 	),
 
 	TP_fast_assign(
@@ -333,16 +335,19 @@ TRACE_EVENT(ath10k_htt_tx,
 		__entry->msdu_len = msdu_len;
 		__entry->vdev_id = vdev_id;
 		__entry->tid = tid;
+		__entry->len = len;
+		memcpy(__get_dynamic_array(data), data, len);
 	),
 
 	TP_printk(
-		"%s %s msdu_id %d msdu_len %d vdev_id %d tid %d",
+		"%s %s msdu_id %d msdu_len %d vdev_id %d tid %d len %zu",
 		__get_str(driver),
 		__get_str(device),
 		__entry->msdu_id,
 		__entry->msdu_len,
 		__entry->vdev_id,
-		__entry->tid
+		__entry->tid,
+		__entry->len
 	 )
 );
 
-- 
2.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
