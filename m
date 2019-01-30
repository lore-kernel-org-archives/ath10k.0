Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goj5U-0008Jf-2Q
 for ath10k@lists.infradead.org; Wed, 30 Jan 2019 06:11:05 +0000
Received: by mail-pf1-x444.google.com with SMTP id h3so10953344pfg.1
 for <ath10k@lists.infradead.org>; Tue, 29 Jan 2019 22:11:03 -0800 (PST)
Date: Tue, 29 Jan 2019 22:10:59 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH for-5.0] ath10k: correct bus type for WCN3990
Message-ID: <20190130061059.GA2387@tuxbook-pro>
References: <20190129231201.42230-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190129231201.42230-1-briannorris@chromium.org>
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
To: Brian Norris <briannorris@chromium.org>
Cc: Govind Singh <govinds@codeaurora.org>, Erik Stromdahl <erik.stromdahl@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>

On Tue 29 Jan 15:12 PST 2019, Brian Norris wrote:

> WCN3990 is SNOC, not PCI. This prevents probing WCN3990.
> 
> Fixes: 367c899f622c ("ath10k: add bus type check in ath10k_init_hw_params")
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> This was a regression in 4.20.
> 
>  drivers/net/wireless/ath/ath10k/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 399b501f3c3c..e8891f5fc83a 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -548,7 +548,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>  	{
>  		.id = WCN3990_HW_1_0_DEV_VERSION,
>  		.dev_id = 0,
> -		.bus = ATH10K_BUS_PCI,
> +		.bus = ATH10K_BUS_SNOC,
>  		.name = "wcn3990 hw1.0",
>  		.continuous_frag_desc = true,
>  		.tx_chain_mask = 0x7,
> -- 
> 2.20.1.495.gaa96b0ce6b-goog
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
