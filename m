Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kawFH-0004kq-HK
 for ath10k@lists.infradead.org; Fri, 06 Nov 2020 07:33:18 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: cancel rx worker in hif_stop for SDIO
References: <1604558036-4056-1-git-send-email-wgong@codeaurora.org>
Date: Fri, 06 Nov 2020 09:32:58 +0200
In-Reply-To: <1604558036-4056-1-git-send-email-wgong@codeaurora.org> (Wen
 Gong's message of "Thu, 5 Nov 2020 14:33:56 +0800")
Message-ID: <87r1p7kkid.fsf@codeaurora.org>
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

> The rx worker of SDIO should be cancelled after disable interrupt, and
> release rx sk_buff in queue, otherwise the rx worker maybe still run
> after hif_stop. And it should be cancelled before napi_synchronize in
> hif_stop, because the rx worker of SDIO will call napi_schedule, it
> should have no napi_schedule before napi_synchronize, otherwise it
> lead napi_synchronize wait untill napi_complete.
>
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00049
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/sdio.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index 81ddaafb6721..2c619ef8a87c 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -1962,9 +1962,15 @@ static void ath10k_sdio_hif_stop(struct ath10k *ar)
>  {
>  	struct ath10k_sdio_bus_request *req, *tmp_req;
>  	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
> +	struct sk_buff *skb;
>  
>  	ath10k_sdio_irq_disable(ar);
>  
> +	cancel_work_sync(&ar_sdio->async_work_rx);
> +
> +	while (skb = skb_dequeue(&ar_sdio->rx_head))
> +		dev_kfree_skb_any(skb);

This gives a warning:

drivers/net/wireless/ath/ath10k/sdio.c: In function 'ath10k_sdio_hif_stop':
drivers/net/wireless/ath/ath10k/sdio.c:1971:9: warning: suggest parentheses around assignment used as truth value [-Wparentheses]

Fixed in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
