Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7g76-0006IQ-Nx
 for ath10k@lists.infradead.org; Mon, 17 Aug 2020 14:27:58 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: fix the status check and wrong return
References: <20200814144844.1920-1-tangbin@cmss.chinamobile.com>
Date: Mon, 17 Aug 2020 17:26:54 +0300
In-Reply-To: <20200814144844.1920-1-tangbin@cmss.chinamobile.com> (Tang Bin's
 message of "Fri, 14 Aug 2020 22:48:44 +0800")
Message-ID: <87y2mdjqkx.fsf@codeaurora.org>
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
To: Tang Bin <tangbin@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, davem@davemloft.net, Zhang Shengju <zhangshengju@cmss.chinamobile.com>

Tang Bin <tangbin@cmss.chinamobile.com> writes:

> In the function ath10k_ahb_clock_init(), devm_clk_get() doesn't
> return NULL. Thus use IS_ERR() and PTR_ERR() to validate
> the returned value instead of IS_ERR_OR_NULL().

Why? What's the benefit of this patch? Or what harm does
IS_ERR_OR_NULL() create?

> Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  drivers/net/wireless/ath/ath10k/ahb.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
> index ed87bc00f..ea669af6a 100644
> --- a/drivers/net/wireless/ath/ath10k/ahb.c
> +++ b/drivers/net/wireless/ath/ath10k/ahb.c
> @@ -87,24 +87,24 @@ static int ath10k_ahb_clock_init(struct ath10k *ar)
>  	dev = &ar_ahb->pdev->dev;
>  
>  	ar_ahb->cmd_clk = devm_clk_get(dev, "wifi_wcss_cmd");
> -	if (IS_ERR_OR_NULL(ar_ahb->cmd_clk)) {
> +	if (IS_ERR(ar_ahb->cmd_clk)) {
>  		ath10k_err(ar, "failed to get cmd clk: %ld\n",
>  			   PTR_ERR(ar_ahb->cmd_clk));
> -		return ar_ahb->cmd_clk ? PTR_ERR(ar_ahb->cmd_clk) : -ENODEV;
> +		return PTR_ERR(ar_ahb->cmd_clk);
>  	}

devm_clk_get() can return NULL if CONFIG_HAVE_CLK is disabled:

static inline struct clk *devm_clk_get(struct device *dev, const char *id)
{
	return NULL;
}

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
