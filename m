Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDwBE-0001ly-J8
 for ath10k@lists.infradead.org; Tue, 09 Apr 2019 19:13:15 +0000
Received: by mail-lf1-x142.google.com with SMTP id o199so598222lfo.1
 for <ath10k@lists.infradead.org>; Tue, 09 Apr 2019 12:13:12 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH 4/6] ath10k: sdio: add MSDU ID allocation in HTT TX path
Date: Tue,  9 Apr 2019 21:08:49 +0200
Message-Id: <20190409190851.4557-5-erik.stromdahl@gmail.com>
In-Reply-To: <20190409190851.4557-1-erik.stromdahl@gmail.com>
References: <20190409190851.4557-1-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>, Alagu Sankar <alagusankar@silex-india.com>

From: Alagu Sankar <alagusankar@silex-india.com>

This makes the SDIO HTT TX path more similar to PCIe.
Transmit completion for SDIO is similar to PCIe, via the T2H message
HTT_T2H_MSG_TYPE_TX_COMPL_IND. This means that we will create a unique
MSDU ID for each transmitted frame just as we do in the PCIe case.

As a result of this, the TX skb will be freed when we receive the
HTT_T2H_MSG_TYPE_TX_COMPL_IND message. Thus, we must not free the skb in
the HTT ep_tx_complete handler in the SDIO case.

Co-developed-by: Erik Stromdahl <erik.stromdahl@gmail.com>
Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |  4 +++-
 drivers/net/wireless/ath/ath10k/htt_tx.c | 16 ++++++++++++++--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index a20ea270d519..6e3331b96c0f 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2277,7 +2277,9 @@ static void ath10k_htt_rx_tx_compl_ind(struct ath10k *ar,
 		 *  Note that with only one concurrent reader and one concurrent
 		 *  writer, you don't need extra locking to use these macro.
 		 */
-		if (!kfifo_put(&htt->txdone_fifo, tx_done)) {
+		if (ar->hif.bus == ATH10K_BUS_SDIO) {
+			ath10k_txrx_tx_unref(htt, &tx_done);
+		} else if (!kfifo_put(&htt->txdone_fifo, tx_done)) {
 			ath10k_warn(ar, "txdone fifo overrun, msdu_id %d status %d\n",
 				    tx_done.msdu_id, tx_done.status);
 			ath10k_txrx_tx_unref(htt, &tx_done);
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 619c2b87b8bb..e5e6e206a52f 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -543,7 +543,8 @@ void ath10k_htt_tx_free(struct ath10k_htt *htt)
 
 void ath10k_htt_htc_tx_complete(struct ath10k *ar, struct sk_buff *skb)
 {
-	dev_kfree_skb_any(skb);
+	if (!(ar->hif.bus == ATH10K_BUS_SDIO))
+		dev_kfree_skb_any(skb);
 }
 
 void ath10k_htt_hif_tx_complete(struct ath10k *ar, struct sk_buff *skb)
@@ -1244,6 +1245,7 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	u8 tid = ath10k_htt_tx_get_tid(msdu, is_eth);
 	u8 flags0 = 0;
 	u16 flags1 = 0;
+	u16 msdu_id = 0;
 
 	data_len = msdu->len;
 
@@ -1291,6 +1293,16 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 		}
 	}
 
+	if (ar->hif.bus == ATH10K_BUS_SDIO) {
+		flags1 |= HTT_DATA_TX_DESC_FLAGS1_POSTPONED;
+		res = ath10k_htt_tx_alloc_msdu_id(htt, msdu);
+		if (res < 0) {
+			ath10k_err(ar, "msdu_id allocation failed %d\n", res);
+			goto out;
+		}
+		msdu_id = res;
+	}
+
 	skb_push(msdu, sizeof(*cmd_hdr));
 	skb_push(msdu, sizeof(*tx_desc));
 	cmd_hdr = (struct htt_cmd_hdr *)msdu->data;
@@ -1300,7 +1312,7 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	tx_desc->flags0 = flags0;
 	tx_desc->flags1 = __cpu_to_le16(flags1);
 	tx_desc->len = __cpu_to_le16(data_len);
-	tx_desc->id = 0;
+	tx_desc->id = __cpu_to_le16(msdu_id);
 	tx_desc->frags_paddr = 0; /* always zero */
 	/* Initialize peer_id to INVALID_PEER because this is NOT
 	 * Reinjection path
-- 
2.19.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
