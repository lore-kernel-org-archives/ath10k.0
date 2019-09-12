Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8PQM-0002QN-3e
 for ath10k@lists.infradead.org; Thu, 12 Sep 2019 13:46:15 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v5 1/8] ath10k: adjust skb length in
 ath10k_sdio_mbox_rx_packet
References: <1567679893-14029-1-git-send-email-wgong@codeaurora.org>
 <1567679893-14029-2-git-send-email-wgong@codeaurora.org>
Date: Thu, 12 Sep 2019 16:46:09 +0300
In-Reply-To: <1567679893-14029-2-git-send-email-wgong@codeaurora.org> (Wen
 Gong's message of "Thu, 5 Sep 2019 18:38:06 +0800")
Message-ID: <87muf9k4pq.fsf@kamboji.qca.qualcomm.com>
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
To: Wen Gong <wgong@codeaurora.org>, Nicolas Boichat <drinkcat@chromium.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> From: Nicolas Boichat <drinkcat@chromium.org>
>
> When the FW bundles multiple packets, pkt->act_len may be incorrect
> as it refers to the first packet only (however, the FW will only
> bundle packets that fit into the same pkt->alloc_len).
>
> Before this patch, the skb length would be set (incorrectly) to
> pkt->act_len in ath10k_sdio_mbox_rx_packet, and then later manually
> adjusted in ath10k_sdio_mbox_rx_process_packet.
>
> The first problem is that ath10k_sdio_mbox_rx_process_packet does not
> use proper skb_put commands to adjust the length (it directly changes
> skb->len), so we end up with a mismatch between skb->head + skb->tail
> and skb->data + skb->len. This is quite serious, and causes corruptions
> in the TCP stack, as the stack tries to coalesce packets, and relies
> on skb->tail being correct (that is, skb_tail_pointer must point to
> the first byte_after_ the data).
>
> Instead of re-adjusting the size in ath10k_sdio_mbox_rx_process_packet,
> this moves the code to ath10k_sdio_mbox_rx_packet, and also add a
> bounds check, as skb_put would crash the kernel if not enough space is
> available.
>
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00007-QCARMSWP-1.
>
> Fixes: 8530b4e7b22bc3b ("ath10k: sdio: set skb len for all rx packets")
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>

[...]

> @@ -632,13 +627,29 @@ static int ath10k_sdio_mbox_rx_packet(struct ath10k *ar,
>  {
>  	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
>  	struct sk_buff *skb = pkt->skb;
> +	struct ath10k_htc_hdr *htc_hdr;
>  	int ret;
>  
>  	ret = ath10k_sdio_readsb(ar, ar_sdio->mbox_info.htc_addr,
>  				 skb->data, pkt->alloc_len);
> +
> +	if (!ret) {
> +		/* Update actual length. The original length may be incorrect,
> +		 * as the FW will bundle multiple packets as long as their sizes
> +		 * fit within the same aligned length (pkt->alloc_len).
> +		 */
> +		htc_hdr = (struct ath10k_htc_hdr *)skb->data;
> +		pkt->act_len = le16_to_cpu(htc_hdr->len) + sizeof(*htc_hdr);
> +		if (pkt->act_len <= pkt->alloc_len) {
> +			skb_put(skb, pkt->act_len);
> +		} else {
> +			ath10k_warn(ar, "rx packet too large (%zu > %zu)\n",
> +				    pkt->act_len, pkt->alloc_len);
> +			ret = -EMSGSIZE;
> +		}
> +	}
> +
>  	pkt->status = ret;
> -	if (!ret)
> -		skb_put(skb, pkt->act_len);
>  
>  	return ret;
>  }

I simplified the error handling in this function to follow the ath10k
style, please check carefully that I didn't create any bugs:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6e4d2cc5

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
