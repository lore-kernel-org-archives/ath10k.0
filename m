Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cgd0M-0008CS-Tq
 for ath10k@lists.infradead.org; Wed, 22 Feb 2017 19:55:17 +0000
Received: by mail-qk0-x22d.google.com with SMTP id n127so13237516qkf.0
 for <ath10k@lists.infradead.org>; Wed, 22 Feb 2017 11:54:53 -0800 (PST)
Subject: Re: [PATCH v2] ath10k: Remove return statement from a void function
References: <1487672891-8584-1-git-send-email-marcin.rokicki@tieto.com>
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <b7ac6892-4cbd-bd60-382f-5c51e9ae588a@broadcom.com>
Date: Wed, 22 Feb 2017 20:54:49 +0100
MIME-Version: 1.0
In-Reply-To: <1487672891-8584-1-git-send-email-marcin.rokicki@tieto.com>
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
To: Marcin Rokicki <marcin.rokicki@tieto.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org



On 21-2-2017 11:28, Marcin Rokicki wrote:
> The empty 'return;' statement in a void function should be
> used to return from somewhere else than the end.
> 
> Signed-off-by: Marcin Rokicki <marcin.rokicki@tieto.com>
> ---
> 
> Changes for v2
>  -remove only return statement instead of empty err label
>   which can be used in the future
> 
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 59729aa..a22d3c9 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2311,7 +2311,7 @@ static void ath10k_core_register_work(struct work_struct *work)
>  	/* TODO: It's probably a good idea to release device from the driver
>  	 * but calling device_release_driver() here will cause a deadlock.
>  	 */
> -	return;
> +	;

Not exactly what I meant. Just drop the whole line include semicolon.

Regards,
Arend

>  }
>  
>  int ath10k_core_register(struct ath10k *ar, u32 chip_id)
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
