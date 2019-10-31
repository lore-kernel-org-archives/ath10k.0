Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQ6RK-0002PU-To
 for ath10k@lists.infradead.org; Thu, 31 Oct 2019 09:08:24 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v6 3/3] ath10k: add workqueue for RX path of sdio
References: <1569402639-31720-1-git-send-email-wgong@codeaurora.org>
 <1569402639-31720-4-git-send-email-wgong@codeaurora.org>
Date: Thu, 31 Oct 2019 11:08:18 +0200
In-Reply-To: <1569402639-31720-4-git-send-email-wgong@codeaurora.org> (Wen
 Gong's message of "Wed, 25 Sep 2019 17:10:39 +0800")
Message-ID: <8736f92sfx.fsf@kamboji.qca.qualcomm.com>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> For RX, it has two parts, one is to read data from sdio, another
> is to indicate the packets to upper stack. Recently it has only
> one thread to do all RX things, it results that it is sequential
> for RX and low throughout, change RX to parallel for the two parts
> will increase throughout.
>
> This patch move the indication to a workqueue, it results in
> significant performance improvement on RX path.
>
> Udp rx throughout is 200Mbps without this patch, and it arrives
> 400Mbps with this patch.
>
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00017-QCARMSWPZ-1
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>

[...]

> +static void ath10k_rx_indication_async_work(struct work_struct *work)
> +{
> +	struct ath10k_sdio *ar_sdio = container_of(work, struct ath10k_sdio,
> +						   async_work_rx);
> +	struct ath10k *ar = ar_sdio->ar;
> +	struct ath10k_htc_ep *ep;
> +	struct ath10k_skb_cb *cb;
> +	struct sk_buff *skb;
> +
> +	while (true) {
> +		skb = skb_dequeue(&ar_sdio->rx_head);
> +		if (!skb)
> +			break;
> +		cb = ATH10K_SKB_CB(skb);
> +		ep = &ar->htc.endpoint[cb->eid];
> +		ep->ep_ops.ep_rx_complete(ar, skb);
> +	}
> +}

I just realised that this is RX path so we should use ATH10K_SKB_RXCB()
instead. I made the change below to this commit in pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=28da1fe7a3ffa5c55c52328c21165d9efdf2e94c

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index af68eb5d0776..c5407f5080b2 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -124,6 +124,7 @@ struct ath10k_skb_cb {
 struct ath10k_skb_rxcb {
 	dma_addr_t paddr;
 	struct hlist_node hlist;
+	u8 eid;
 };
 
 static inline struct ath10k_skb_cb *ATH10K_SKB_CB(struct sk_buff *skb)
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index c34637881219..c7d09b07a382 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -419,7 +419,7 @@ static int ath10k_sdio_mbox_rx_process_packets(struct ath10k *ar,
 	struct ath10k_htc *htc = &ar->htc;
 	struct ath10k_sdio_rx_data *pkt;
 	struct ath10k_htc_ep *ep;
-	struct ath10k_skb_cb *cb;
+	struct ath10k_skb_rxcb *cb;
 	enum ath10k_htc_ep_id id;
 	int ret, i, *n_lookahead_local;
 	u32 *lookaheads_local;
@@ -466,7 +466,7 @@ static int ath10k_sdio_mbox_rx_process_packets(struct ath10k *ar,
 			goto out;
 
 		if (!pkt->trailer_only) {
-			cb = ATH10K_SKB_CB(pkt->skb);
+			cb = ATH10K_SKB_RXCB(pkt->skb);
 			cb->eid = id;
 
 			skb_queue_tail(&ar_sdio->rx_head, pkt->skb);
@@ -1333,14 +1333,14 @@ static void ath10k_rx_indication_async_work(struct work_struct *work)
 						   async_work_rx);
 	struct ath10k *ar = ar_sdio->ar;
 	struct ath10k_htc_ep *ep;
-	struct ath10k_skb_cb *cb;
+	struct ath10k_skb_rxcb *cb;
 	struct sk_buff *skb;
 
 	while (true) {
 		skb = skb_dequeue(&ar_sdio->rx_head);
 		if (!skb)
 			break;
-		cb = ATH10K_SKB_CB(skb);
+		cb = ATH10K_SKB_RXCB(skb);
 		ep = &ar->htc.endpoint[cb->eid];
 		ep->ep_ops.ep_rx_complete(ar, skb);
 	}

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
