Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJLyK-0005wh-1u
 for ath10k@lists.infradead.org; Wed, 13 Jan 2016 14:00:26 +0000
Received: by mail-lf0-x234.google.com with SMTP id m198so108396239lfm.0
 for <ath10k@lists.infradead.org>; Wed, 13 Jan 2016 06:00:03 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 4/5] ath10k: clean up cont frag desc init code
Date: Wed, 13 Jan 2016 15:01:07 +0100
Message-Id: <1452693668-30030-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1452693668-30030-1-git-send-email-michal.kazior@tieto.com>
References: <1452693668-30030-1-git-send-email-michal.kazior@tieto.com>
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

This makes the code easier to extend and re-use.

While at it fix _warn to _err. Other than that
there are no functional changes.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 58 ++++++++++++++++++++++----------
 1 file changed, 41 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index b3adadb5f824..41a9811820e8 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -97,6 +97,41 @@ void ath10k_htt_tx_free_msdu_id(struct ath10k_htt *htt, u16 msdu_id)
 	idr_remove(&htt->pending_tx, msdu_id);
 }
 
+static void ath10k_htt_tx_free_cont_frag_desc(struct ath10k_htt *htt)
+{
+	size_t size;
+
+	if (!htt->frag_desc.vaddr)
+		return;
+
+	size = htt->max_num_pending_tx * sizeof(struct htt_msdu_ext_desc);
+
+	dma_free_coherent(htt->ar->dev,
+			  size,
+			  htt->frag_desc.vaddr,
+			  htt->frag_desc.paddr);
+}
+
+static int ath10k_htt_tx_alloc_cont_frag_desc(struct ath10k_htt *htt)
+{
+	struct ath10k *ar = htt->ar;
+	size_t size;
+
+	if (!ar->hw_params.continuous_frag_desc)
+		return 0;
+
+	size = htt->max_num_pending_tx * sizeof(struct htt_msdu_ext_desc);
+	htt->frag_desc.vaddr = dma_alloc_coherent(ar->dev, size,
+						  &htt->frag_desc.paddr,
+						  GFP_DMA);
+	if (!htt->frag_desc.vaddr) {
+		ath10k_err(ar, "failed to alloc fragment desc memory\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
 int ath10k_htt_tx_alloc(struct ath10k_htt *htt)
 {
 	struct ath10k *ar = htt->ar;
@@ -118,20 +153,12 @@ int ath10k_htt_tx_alloc(struct ath10k_htt *htt)
 		goto free_idr_pending_tx;
 	}
 
-	if (!ar->hw_params.continuous_frag_desc)
-		goto skip_frag_desc_alloc;
-
-	size = htt->max_num_pending_tx * sizeof(struct htt_msdu_ext_desc);
-	htt->frag_desc.vaddr = dma_alloc_coherent(ar->dev, size,
-						  &htt->frag_desc.paddr,
-						  GFP_KERNEL);
-	if (!htt->frag_desc.vaddr) {
-		ath10k_warn(ar, "failed to alloc fragment desc memory\n");
-		ret = -ENOMEM;
+	ret = ath10k_htt_tx_alloc_cont_frag_desc(htt);
+	if (ret) {
+		ath10k_err(ar, "failed to alloc cont frag desc: %d\n", ret);
 		goto free_txbuf;
 	}
 
-skip_frag_desc_alloc:
 	return 0;
 
 free_txbuf:
@@ -139,8 +166,10 @@ free_txbuf:
 			  sizeof(struct ath10k_htt_txbuf);
 	dma_free_coherent(htt->ar->dev, size, htt->txbuf.vaddr,
 			  htt->txbuf.paddr);
+
 free_idr_pending_tx:
 	idr_destroy(&htt->pending_tx);
+
 	return ret;
 }
 
@@ -174,12 +203,7 @@ void ath10k_htt_tx_free(struct ath10k_htt *htt)
 				  htt->txbuf.paddr);
 	}
 
-	if (htt->frag_desc.vaddr) {
-		size = htt->max_num_pending_tx *
-				  sizeof(struct htt_msdu_ext_desc);
-		dma_free_coherent(htt->ar->dev, size, htt->frag_desc.vaddr,
-				  htt->frag_desc.paddr);
-	}
+	ath10k_htt_tx_free_cont_frag_desc(htt);
 }
 
 void ath10k_htt_htc_tx_complete(struct ath10k *ar, struct sk_buff *skb)
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
