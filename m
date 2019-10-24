Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNYUa-0006c8-6I
 for ath10k@lists.infradead.org; Thu, 24 Oct 2019 08:29:13 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v6 1/3] ath10k: enable RX bundle receive for sdio
References: <1569402639-31720-1-git-send-email-wgong@codeaurora.org>
 <1569402639-31720-2-git-send-email-wgong@codeaurora.org>
Date: Thu, 24 Oct 2019 11:29:06 +0300
In-Reply-To: <1569402639-31720-2-git-send-email-wgong@codeaurora.org> (Wen
 Gong's message of "Wed, 25 Sep 2019 17:10:37 +0800")
Message-ID: <87v9sesg19.fsf@kamboji.qca.qualcomm.com>
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
> WLAN.RMH.4.4.1-00017-QCARMSWPZ-1
>
> Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>

[...]

> +static int ath10k_sdio_mbox_rx_fetch_bundle(struct ath10k *ar)
>  {
>  	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
> +	struct ath10k_sdio_rx_data *pkt;
> +	struct ath10k_htc_hdr *htc_hdr;
>  	int ret, i;
> +	u32 pkt_offset, virt_pkt_len;
>  
> +	virt_pkt_len = 0;
> +	for (i = 0; i < ar_sdio->n_rx_pkts; i++)
> +		virt_pkt_len += ar_sdio->rx_pkts[i].alloc_len;
> +
> +	if (virt_pkt_len > ATH10K_SDIO_VSG_BUF_SIZE) {
> +		ath10k_err(ar, "size exceeding limit %d\n", virt_pkt_len);
> +		ret = -E2BIG;
> +		goto err;
> +	}

This should use ath10k_warn(), fixed in the pending branch. I also
improved the log message.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
