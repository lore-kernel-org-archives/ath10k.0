Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMYkq-0007BR-Fr
 for ath10k@lists.infradead.org; Thu, 09 Apr 2020 15:06:14 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v9 3/4] ath10k: add htt TX bundle for sdio
References: <20200212080415.31265-1-wgong@codeaurora.org>
 <20200212080415.31265-4-wgong@codeaurora.org>
Date: Thu, 09 Apr 2020 18:05:45 +0300
In-Reply-To: <20200212080415.31265-4-wgong@codeaurora.org> (Wen Gong's message
 of "Wed, 12 Feb 2020 16:04:14 +0800")
Message-ID: <87pncgu2ba.fsf@kamboji.qca.qualcomm.com>
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

> +	if (ep->tx_credits < credits) {
> +		ath10k_dbg(ar, ATH10K_DBG_HTC,
> +			   "htc insufficient credits ep %d required %d available %d consume %d\n",
> +			   eid, credits, ep->tx_credits, consume);
> +		ret = -EAGAIN;
> +		goto unlock;
> +	}
> +
> +	if (consume) {
> +		ep->tx_credits -= credits;
> +		ath10k_dbg(ar, ATH10K_DBG_HTC,
> +			   "htc ep %d consumed %d credits (total %d)\n",

"htc ep %d consumed %d credits total %d\n"

[...]

> +	ath10k_dbg(ar, ATH10K_DBG_HTC, "bundle skb: len:%d\n", bundle_skb->len);

"htc bundle skb len %d\n"

In other words, start with "htc" and don't use colons or parenthesis.
This applies to most of debug messages in this patch.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
