Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNYGa-00083L-2X
 for ath10k@lists.infradead.org; Thu, 24 Oct 2019 08:14:45 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v6 3/3] ath10k: add workqueue for RX path of sdio
References: <1569402639-31720-1-git-send-email-wgong@codeaurora.org>
 <1569402639-31720-4-git-send-email-wgong@codeaurora.org>
Date: Thu, 24 Oct 2019 11:14:39 +0300
In-Reply-To: <1569402639-31720-4-git-send-email-wgong@codeaurora.org> (Wen
 Gong's message of "Wed, 25 Sep 2019 17:10:39 +0800")
Message-ID: <871rv2tv9s.fsf@kamboji.qca.qualcomm.com>
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

> --- a/drivers/net/wireless/ath/ath10k/sdio.h
> +++ b/drivers/net/wireless/ath/ath10k/sdio.h
> @@ -98,6 +98,12 @@
>  #define ATH10K_FIFO_TIMEOUT_AND_CHIP_CONTROL_DISABLE_SLEEP_OFF 0xFFFEFFFF
>  #define ATH10K_FIFO_TIMEOUT_AND_CHIP_CONTROL_DISABLE_SLEEP_ON 0x10000
>  
> +struct ath10k_sdio_rx_request {
> +	struct list_head list;
> +	struct sk_buff *skb;
> +	struct ath10k_htc_ep *ep;
> +};

This is not used anymore, I removed it in the pending branch.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
