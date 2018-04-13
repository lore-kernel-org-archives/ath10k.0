Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6tSy-0005kU-9h
 for ath10k@lists.infradead.org; Fri, 13 Apr 2018 07:49:53 +0000
MIME-Version: 1.0
Date: Fri, 13 Apr 2018 13:19:41 +0530
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: Re: [PATCH] ath10k: Fix a typo in ath10k_wmi_set_wmm_param()
In-Reply-To: <1523605711-1874-1-git-send-email-mkenna@codeaurora.org>
References: <1523605711-1874-1-git-send-email-mkenna@codeaurora.org>
Message-ID: <6d423aeaf1011dc25e5caa57d11d2d1b@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Hi All,

Sorry for the inconvenience. Please ignore this duplicate patch.
Please use the previous patch.


On 2018-04-13 1:18 pm, mkenna@codeaurora.org wrote:
> From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> 
> Fix a typo in the function ath10k_wmi_set_wmm_param().
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/wmi.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c
> b/drivers/net/wireless/ath/ath10k/wmi.c
> index c5e1ca5..727c965 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -7648,7 +7648,7 @@ void ath10k_wmi_set_wmm_param(struct
> wmi_wmm_params *params,
>  	cmd->param = __cpu_to_le32(param);
> 
>  	ath10k_dbg(ar, ATH10K_DBG_WMI,
> -		   "wmi pdev get tcp config param:%d\n", param);
> +		   "wmi pdev get tpc config param %d\n", param);
>  	return skb;
>  }

-- 
Regards,
Maha

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
