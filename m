Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVMVH-0001hn-OK
 for ath10k@lists.infradead.org; Tue, 10 Mar 2015 15:55:32 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Remove trace about getting temperature
References: <1424802385-23017-1-git-send-email-mka@chromium.org>
Date: Tue, 10 Mar 2015 17:54:55 +0200
In-Reply-To: <1424802385-23017-1-git-send-email-mka@chromium.org> (Matthias
 Kaehlcke's message of "Tue, 24 Feb 2015 10:26:25 -0800")
Message-ID: <87h9tsyhin.fsf@kamboji.qca.qualcomm.com>
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
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, ath10k@lists.infradead.org

Matthias Kaehlcke <mka@chromium.org> writes:

> When ath10k debugging is enabled this trace generates a log entry
> every time the chip temperature is read. On systems polling the
> temperature this clutters the log with entries which aren't
> particularly useful. Remove this trace.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  drivers/net/wireless/ath/ath10k/wmi.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index aeea1c7..1c86984 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -4881,7 +4881,6 @@ ath10k_wmi_10_2_op_gen_pdev_get_temperature(struct ath10k *ar)
>  	if (!skb)
>  		return ERR_PTR(-ENOMEM);
>  
> -	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi pdev get temperature\n");
>  	return skb;

I'm worried that this is dangerous, as that means that not all WMI
commands will be in debug and something might be missed because of that.

Isn't there any other way? Like implementing ath10k_dbg_ratelimit()? Or
adding a new log level?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
