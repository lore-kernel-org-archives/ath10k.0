Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSMjE-0004vg-6I
 for ath10k@lists.infradead.org; Thu, 29 Nov 2018 13:51:41 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: remove an unnecessary NULL check
References: <20181129103214.5tudci6izlfaasqx@kili.mountain>
Date: Thu, 29 Nov 2018 15:51:24 +0200
In-Reply-To: <20181129103214.5tudci6izlfaasqx@kili.mountain> (Dan Carpenter's
 message of "Thu, 29 Nov 2018 13:32:14 +0300")
Message-ID: <87sgzk56w3.fsf@kamboji.qca.qualcomm.com>
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
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Rakesh Pillai <pillair@codeaurora.org>, ath10k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> The "survey" pointer is the address of an array element.  We know that
> it can't be NULL so this check can be removed.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index 659513bf4ddc..6a04727b63ce 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -2578,7 +2578,7 @@ static void ath10k_wmi_event_chan_info_unpaired(struct ath10k *ar,
>  
>  	survey = &ar->survey[idx];
>  
> -	if (!params->mac_clk_mhz || !survey)
> +	if (!params->mac_clk_mhz)
>  		return;

Can you please CC linux-wireless so that patchwork sees this?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
