Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knN4V-0001au-Ur
 for ath10k@lists.infradead.org; Thu, 10 Dec 2020 14:37:35 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH wireless -next] wireless/ath10k: simplify the return
 expression of ath10k_ahb_chip_reset()
References: <20201210140204.1774-1-zhengyongjun3@huawei.com>
Date: Thu, 10 Dec 2020 16:37:18 +0200
In-Reply-To: <20201210140204.1774-1-zhengyongjun3@huawei.com> (Zheng Yongjun's
 message of "Thu, 10 Dec 2020 22:02:04 +0800")
Message-ID: <87mtyl4ti9.fsf@codeaurora.org>
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
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, kuba@kernel.org, davem@davemloft.net

Zheng Yongjun <zhengyongjun3@huawei.com> writes:

> Simplify the return expression.
>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/net/wireless/ath/ath10k/ahb.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
> index 05a61975c83f..0ba31c0bbd24 100644
> --- a/drivers/net/wireless/ath/ath10k/ahb.c
> +++ b/drivers/net/wireless/ath/ath10k/ahb.c
> @@ -598,16 +598,10 @@ static int ath10k_ahb_prepare_device(struct ath10k *ar)
>  
>  static int ath10k_ahb_chip_reset(struct ath10k *ar)
>  {
> -	int ret;
> -
>  	ath10k_ahb_halt_chip(ar);
>  	ath10k_ahb_clock_disable(ar);
>  
> -	ret = ath10k_ahb_prepare_device(ar);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return ath10k_ahb_prepare_device(ar);
>  }
>  
>  static int ath10k_ahb_wake_target_cpu(struct ath10k *ar)

I prefer the original style, easier to add new code to the function.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
