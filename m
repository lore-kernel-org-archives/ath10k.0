Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6cku-0006MH-Hp
 for ath10k@lists.infradead.org; Fri, 14 Aug 2020 16:40:37 +0000
Received: by mail-il1-x142.google.com with SMTP id c6so8924851ilo.13
 for <ath10k@lists.infradead.org>; Fri, 14 Aug 2020 09:40:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200814144844.1920-1-tangbin@cmss.chinamobile.com>
References: <20200814144844.1920-1-tangbin@cmss.chinamobile.com>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Fri, 14 Aug 2020 18:40:32 +0200
Message-ID: <CAKR_QVLYeY5g8kuGwCPBj+aRMmE_yAUYx593vW1-UGYZGZnH3w@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix the status check and wrong return
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Zhang Shengju <zhangshengju@cmss.chinamobile.com>, davem@davemloft.net, kvalo@codeaurora.org

On 14/08/2020, Tang Bin <tangbin@cmss.chinamobile.com> wrote:
> In the function ath10k_ahb_clock_init(), devm_clk_get() doesn't
> return NULL. Thus use IS_ERR() and PTR_ERR() to validate
> the returned value instead of IS_ERR_OR_NULL().
>
> Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  drivers/net/wireless/ath/ath10k/ahb.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/ahb.c
> b/drivers/net/wireless/ath/ath10k/ahb.c
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
>
>  	ar_ahb->ref_clk = devm_clk_get(dev, "wifi_wcss_ref");
> -	if (IS_ERR_OR_NULL(ar_ahb->ref_clk)) {
> +	if (IS_ERR(ar_ahb->ref_clk)) {
>  		ath10k_err(ar, "failed to get ref clk: %ld\n",
>  			   PTR_ERR(ar_ahb->ref_clk));
> -		return ar_ahb->ref_clk ? PTR_ERR(ar_ahb->ref_clk) : -ENODEV;
> +		return PTR_ERR(ar_ahb->ref_clk);
>  	}
>
>  	ar_ahb->rtc_clk = devm_clk_get(dev, "wifi_wcss_rtc");
> -	if (IS_ERR_OR_NULL(ar_ahb->rtc_clk)) {
> +	if (IS_ERR(ar_ahb->rtc_clk)) {
>  		ath10k_err(ar, "failed to get rtc clk: %ld\n",
>  			   PTR_ERR(ar_ahb->rtc_clk));
> -		return ar_ahb->rtc_clk ? PTR_ERR(ar_ahb->rtc_clk) : -ENODEV;
> +		return PTR_ERR(ar_ahb->rtc_clk);
>  	}
>
>  	return 0;
> --
> 2.20.1.windows.1
>
>
>
>

Hi

You should've include which HW/FW combination you tested this on

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
