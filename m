Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEvv8-0003dy-1n
 for ath10k@lists.infradead.org; Fri, 12 Apr 2019 13:08:43 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 3/6] ath10k: sdio: read RX packets in bundles
References: <20190409190851.4557-1-erik.stromdahl@gmail.com>
 <20190409190851.4557-4-erik.stromdahl@gmail.com>
Date: Fri, 12 Apr 2019 16:08:37 +0300
In-Reply-To: <20190409190851.4557-4-erik.stromdahl@gmail.com> (Erik
 Stromdahl's message of "Tue, 9 Apr 2019 21:08:48 +0200")
Message-ID: <874l73e5gq.fsf@kamboji.qca.qualcomm.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: Alagu Sankar <alagusankar@silex-india.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> From: Alagu Sankar <alagusankar@silex-india.com>
>
> The existing implementation of initiating multiple sdio transfers for
> receive bundling is slowing down the receive speed.
>
> Instead of having one sdio transfer for each packet in the bundle, we
> read all packets in one sdio transfer.
>
> This results in significant performance improvement on some targets.

Do you have any numbers? Before and after would be nice to know.

> +static int ath10k_sdio_mbox_rx_fetch(struct ath10k *ar)
>  {
>  	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
> +	struct ath10k_sdio_rx_data *pkt = &ar_sdio->rx_pkts[0];
>  	struct sk_buff *skb = pkt->skb;
>  	int ret;
>  
> -	ret = ath10k_sdio_readsb(ar, ar_sdio->mbox_info.htc_addr,
> -				 skb->data, pkt->alloc_len);
> -	pkt->status = ret;
> -	if (!ret)
> +	ret = ath10k_sdio_read(ar, ar_sdio->mbox_info.htc_addr,
> +			       skb->data, pkt->alloc_len);
> +	if (ret) {
> +		ar_sdio->n_rx_pkts = 0;
> +		ath10k_sdio_mbox_free_rx_pkt(pkt);
> +	} else {
> +		pkt->status = ret;
>  		skb_put(skb, pkt->act_len);
> +	}

With this you can avoid the else branch:

if (ret) {
	ar_sdio->n_rx_pkts = 0;
	ath10k_sdio_mbox_free_rx_pkt(pkt);
        return ret;
}

> -static int ath10k_sdio_mbox_rx_fetch(struct ath10k *ar)
> +static int ath10k_sdio_mbox_rx_fetch_bundle(struct ath10k *ar)
>  {
>  	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
> +	struct ath10k_sdio_rx_data *pkt;
>  	int ret, i;
> +	u32 pkt_offset = 0, pkt_bundle_len = 0;
> +
> +	for (i = 0; i < ar_sdio->n_rx_pkts; i++)
> +		pkt_bundle_len += ar_sdio->rx_pkts[i].alloc_len;
> +
> +	if (pkt_bundle_len > ATH10K_SDIO_READ_BUF_SIZE) {
> +		ret = -ENOMEM;
> +		ath10k_err(ar, "bundle size (%d) exceeding limit %d\n",
> +			   pkt_bundle_len, ATH10K_SDIO_READ_BUF_SIZE);

As this is a recoverable case please use ath10k_warn(). And would
-ENOSPC be more descriptive error?

> +		goto err;
> +	}
> +
> +	ret = ath10k_sdio_readsb(ar, ar_sdio->mbox_info.htc_addr,
> +				 ar_sdio->sdio_read_buf, pkt_bundle_len);
> +	if (ret)
> +		goto err;
>  
>  	for (i = 0; i < ar_sdio->n_rx_pkts; i++) {
> -		ret = ath10k_sdio_mbox_rx_packet(ar,
> -						 &ar_sdio->rx_pkts[i]);
> -		if (ret)
> -			goto err;
> +		struct sk_buff *skb = ar_sdio->rx_pkts[i].skb;
> +
> +		pkt = &ar_sdio->rx_pkts[i];
> +		memcpy(skb->data, ar_sdio->sdio_read_buf + pkt_offset,
> +		       pkt->alloc_len);
> +		pkt->status = 0;
> +		skb_put(skb, pkt->act_len);

Shouldn't you call first skb_put() and then memcpy()?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
