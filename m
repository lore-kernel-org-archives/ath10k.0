Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMYZ6-0005Vz-73
 for ath10k@lists.infradead.org; Thu, 09 Apr 2020 14:54:03 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v9 3/4] ath10k: add htt TX bundle for sdio
References: <20200212080415.31265-1-wgong@codeaurora.org>
 <20200212080415.31265-4-wgong@codeaurora.org>
Date: Thu, 09 Apr 2020 17:53:29 +0300
In-Reply-To: <20200212080415.31265-4-wgong@codeaurora.org> (Wen Gong's message
 of "Wed, 12 Feb 2020 16:04:14 +0800")
Message-ID: <87tv1su2vq.fsf@kamboji.qca.qualcomm.com>
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

> The transmission utilization ratio for sdio bus for small packet is
> slow, because the space and time cost for sdio bus is same for large
> length packet and small length packet. So the speed of data for large
> length packet is higher than small length.
>
> Test result of different length of data:
>
> data packet(byte)   cost time(us)   calculated rate(Mbps)
>       256               28                73
>       512               33               124
>      1024               35               234
>      1792               45               318
>     14336              168               682
>     28672              333               688
>     57344              660               695
>
> This patch change the TX packet from single packet to a large length
> bundle packet, max size is 32, it results in significant performance
> improvement on TX path.
>
> This patch only effect sdio chip, it will not effect PCI, SNOC etc.
> It only enable bundle for sdio chip.
>
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00017-QCARMSWP-1.
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>

[...]

> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -3208,6 +3208,11 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
>  	if (!ar->workqueue_aux)
>  		goto err_free_wq;
>  
> +	ar->workqueue_tx_complete =
> +		create_singlethread_workqueue("ath10k_tx_complete_wq");
> +	if (!ar->workqueue_tx_complete)
> +		goto err_free_aux_wq;

We already have three threads:

ath/ath10k/core.c:      ar->workqueue = create_singlethread_workqueue("ath10k_wq");
ath/ath10k/core.c:      ar->workqueue_aux = create_singlethread_workqueue("ath10k_aux_wq");
ath/ath10k/sdio.c:      ar_sdio->workqueue = create_singlethread_workqueue("ath10k_sdio_wq");

Do we really need a fourth one? For example, why can't we use
ar->workqueue_aux?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
