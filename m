Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cgD7Y-0007HT-0o
 for ath10k@lists.infradead.org; Tue, 21 Feb 2017 16:16:56 +0000
Received: by mail-lf0-x244.google.com with SMTP id 86so5300599lfv.0
 for <ath10k@lists.infradead.org>; Tue, 21 Feb 2017 08:16:35 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v4 21/21] ath10k: dma fixes for high latency devices
Date: Tue, 21 Feb 2017 17:15:41 +0100
Message-Id: <1487693741-10042-22-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1487693741-10042-1-git-send-email-erik.stromdahl@gmail.com>
References: <1487693741-10042-1-git-send-email-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

Several DMA related functions (such as the dma_map_xxx functions)
are not used with high latency devices and don't need to be invoked
in this case.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htc.c    | 13 ++++++++-----
 drivers/net/wireless/ath/ath10k/htt_rx.c |  3 ++-
 drivers/net/wireless/ath/ath10k/htt_tx.c |  3 +++
 drivers/net/wireless/ath/ath10k/txrx.c   |  5 +++--
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 3eaa9a8..b5fddd7 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -134,11 +134,14 @@ int ath10k_htc_send(struct ath10k_htc *htc,
 	ath10k_htc_prepare_tx_skb(ep, skb);
 
 	skb_cb->eid = eid;
-	skb_cb->paddr = dma_map_single(dev, skb->data, skb->len, DMA_TO_DEVICE);
-	ret = dma_mapping_error(dev, skb_cb->paddr);
-	if (ret) {
-		ret = -EIO;
-		goto err_credits;
+	if (!ar->is_high_latency) {
+		skb_cb->paddr = dma_map_single(dev, skb->data, skb->len,
+					       DMA_TO_DEVICE);
+		ret = dma_mapping_error(dev, skb_cb->paddr);
+		if (ret) {
+			ret = -EIO;
+			goto err_credits;
+		}
 	}
 
 	sg_item.transfer_id = ep->eid;
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index c90570f..96e73b4 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2485,7 +2485,8 @@ bool ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 		break;
 	}
 	case HTT_T2H_MSG_TYPE_TX_COMPL_IND:
-		ath10k_htt_rx_tx_compl_ind(htt->ar, skb);
+		if (!ar->is_high_latency)
+			ath10k_htt_rx_tx_compl_ind(htt->ar, skb);
 		break;
 	case HTT_T2H_MSG_TYPE_SEC_IND: {
 		struct ath10k *ar = htt->ar;
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index a714aa8..190d002 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -409,6 +409,9 @@ int ath10k_htt_tx_start(struct ath10k_htt *htt)
 	if (htt->tx_mem_allocated)
 		return 0;
 
+	if (ar->is_high_latency)
+		return 0;
+
 	ret = ath10k_htt_tx_alloc_buf(htt);
 	if (ret)
 		goto free_idr_pending_tx;
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index 9852c5d..5e27f6da 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -89,11 +89,12 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 
 	ath10k_htt_tx_free_msdu_id(htt, tx_done->msdu_id);
 	ath10k_htt_tx_dec_pending(htt);
-	if (htt->num_pending_tx == 0)
+	if (!ar->is_high_latency && (htt->num_pending_tx == 0))
 		wake_up(&htt->empty_tx_wq);
 	spin_unlock_bh(&htt->tx_lock);
 
-	dma_unmap_single(dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
+	if (!ar->is_high_latency)
+		dma_unmap_single(dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 
 	ath10k_report_offchan_tx(htt->ar, msdu);
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
