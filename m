Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBeJ1-0000Xf-BT
 for ath10k@lists.infradead.org; Sat, 21 Sep 2019 12:16:04 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v5 2/8] ath10k: enable RX bundle receive for sdio
References: <1567679893-14029-1-git-send-email-wgong@codeaurora.org>
 <1567679893-14029-3-git-send-email-wgong@codeaurora.org>
Date: Sat, 21 Sep 2019 15:15:58 +0300
In-Reply-To: <1567679893-14029-3-git-send-email-wgong@codeaurora.org> (Wen
 Gong's message of "Thu, 5 Sep 2019 18:38:07 +0800")
Message-ID: <87r249alq9.fsf@codeaurora.org>
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

> From: Alagu Sankar <alagusankar@silex-india.com>
>
> The existing implementation of initiating multiple sdio transfers for
> receive bundling is slowing down the receive speed. Combining the
> transfers using a bundle method would be ideal.
>
> The transmission utilization ratio for sdio bus for small packet is
> slow, because the space and time cost for sdio bus is same for large
> length packet and small length packet. So the speed of data for large
> length packet is higher than small length.
>
> Test result of different length of data:
> data packet(byte)   cost time(us)   calculated rate(Mbps)
>       256               28                73
>       512               33               124
>      1024               35               234
>      1792               45               318
>     14336              168               682
>     28672              333               688
>     57344              660               695
>
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00007-QCARMSWP-1.
>
> Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>

[...]

> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -24,6 +24,9 @@
>  #include "trace.h"
>  #include "sdio.h"
>  
> +#define ATH10K_SDIO_DMA_BUF_SIZE	(32 * 1024)
> +#define ATH10K_SDIO_VSG_BUF_SIZE	(32 * 1024)

Why two defines? Seems error prone to me and using the latter should be
enough.

> @@ -529,6 +532,7 @@ static int ath10k_sdio_mbox_rx_alloc(struct ath10k *ar,
>  	size_t full_len, act_len;
>  	bool last_in_bundle;
>  	int ret, i;
> +	int pkt_cnt = 0;
>  
>  	if (n_lookaheads > ATH10K_SDIO_MAX_RX_MSGS) {
>  		ath10k_warn(ar,
> @@ -572,20 +576,22 @@ static int ath10k_sdio_mbox_rx_alloc(struct ath10k *ar,
>  			 */
>  			size_t bndl_cnt;
>  
> -			ret = ath10k_sdio_mbox_alloc_pkt_bundle(ar,
> -								&ar_sdio->rx_pkts[i],
> -								htc_hdr,
> -								full_len,
> -								act_len,
> -								&bndl_cnt);
> +			struct ath10k_sdio_rx_data *rx_pkts =
> +				&ar_sdio->rx_pkts[pkt_cnt];

You need to declare rx_pkts in the beginning of the block, not mixed
within the code.

> @@ -606,9 +612,10 @@ static int ath10k_sdio_mbox_rx_alloc(struct ath10k *ar,
>  			ath10k_warn(ar, "alloc_rx_pkt error %d\n", ret);
>  			goto err;
>  		}
> +		pkt_cnt++;

Empty line before 'pkt_cnt++'.

> -static int ath10k_sdio_mbox_rx_fetch(struct ath10k *ar)
> +static int ath10k_sdio_mbox_rx_fetch_bundle(struct ath10k *ar)
>  {
>  	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
> +	struct ath10k_sdio_rx_data *pkt;
> +	struct ath10k_htc_hdr *htc_hdr;
>  	int ret, i;
> +	u32 pkt_offset, virt_pkt_len;
>  
> +	virt_pkt_len = 0;
>  	for (i = 0; i < ar_sdio->n_rx_pkts; i++) {
> -		ret = ath10k_sdio_mbox_rx_packet(ar,
> -						 &ar_sdio->rx_pkts[i]);
> +		virt_pkt_len += ar_sdio->rx_pkts[i].alloc_len;
> +	}
> +
> +	if (virt_pkt_len < ATH10K_SDIO_DMA_BUF_SIZE) {
> +		ret = ath10k_sdio_readsb(ar, ar_sdio->mbox_info.htc_addr,
> +					 ar_sdio->vsg_buffer, virt_pkt_len);
>  		if (ret)
>  			goto err;
> +	} else {
> +		ath10k_err(ar, "size exceeding limit %d\n", virt_pkt_len);
> +		ret = -ENOMEM;
> +		goto err;
> +	}

Use common error handling style, ath10k_warn() and -E2BIG:

if (virt_pkt_len >= ATH10K_SDIO_DMA_BUF_SIZE) {
	ath10k_err(ar, "size exceeding limit %d\n", virt_pkt_len);
	ret = -E2BIG;
	goto err;
}

ret = ath10k_sdio_readsb(ar, ar_sdio->mbox_info.htc_addr,
			 ar_sdio->vsg_buffer, virt_pkt_len);
if (ret) {
        ath10k_warn("failed to do foo: %d", ret)
	goto err;
}

> @@ -1123,7 +1151,7 @@ static int ath10k_sdio_bmi_get_rx_lookahead(struct ath10k *ar)
>  					 MBOX_HOST_INT_STATUS_ADDRESS,
>  					 &rx_word);
>  		if (ret) {
> -			ath10k_warn(ar, "unable to read RX_LOOKAHEAD_VALID: %d\n", ret);
> +			ath10k_warn(ar, "unable to read rx_lookahd: %d\n", ret);

Looks like an unnecessary change?

> @@ -196,6 +196,9 @@ struct ath10k_sdio {
>  	struct ath10k *ar;
>  	struct ath10k_sdio_irq_data irq_data;
>  
> +	/* temporary buffer for sdio read */
> +	u8 *vsg_buffer;

So how is vsg_buffer protected? You should document that here.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
