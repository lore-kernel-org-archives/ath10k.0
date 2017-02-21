Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg708-00065z-9B
 for ath10k@lists.infradead.org; Tue, 21 Feb 2017 09:44:54 +0000
Received: by mail-qt0-x22f.google.com with SMTP id x35so32958448qtc.2
 for <ath10k@lists.infradead.org>; Tue, 21 Feb 2017 01:44:29 -0800 (PST)
Subject: Re: [PATCH] ath10k: Remove return statement from a void function
References: <1487667873-3493-1-git-send-email-marcin.rokicki@tieto.com>
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <145513d5-e8d7-c7e4-810b-fc278cea3ace@broadcom.com>
Date: Tue, 21 Feb 2017 10:44:26 +0100
MIME-Version: 1.0
In-Reply-To: <1487667873-3493-1-git-send-email-marcin.rokicki@tieto.com>
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



On 21-2-2017 10:04, Marcin Rokicki wrote:
> The empty 'return;' statement in a void function should be
> used to return from somewhere else then the end.
> 
> Signed-off-by: Marcin Rokicki <marcin.rokicki@tieto.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 59729aa..d65850e 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2268,7 +2268,7 @@ static void ath10k_core_register_work(struct work_struct *work)
>  	status = ath10k_core_probe_fw(ar);
>  	if (status) {
>  		ath10k_err(ar, "could not probe fw (%d)\n", status);
> -		goto err;
> +		return;

The subject seems misleading as you add a return here. Also removing the
goto will break the desired behavior as expressed in the TODO below.

>  	}
>  
>  	status = ath10k_mac_register(ar);
> @@ -2307,11 +2307,10 @@ static void ath10k_core_register_work(struct work_struct *work)
>  	ath10k_mac_unregister(ar);
>  err_release_fw:
>  	ath10k_core_free_firmware_files(ar);
> -err:
> -	/* TODO: It's probably a good idea to release device from the driver
> -	 * but calling device_release_driver() here will cause a deadlock.
> -	 */
> -	return;

So to me removing this return statement and no more is sufficient for
this patch. Just leave the label and TODO comment in place or fix it
properly by scheduling a "release driver" work here or whatever is
needed to prevent the deadlock.

Regards,
Arend

> +
> +/* TODO: It's probably a good idea to release device from the driver
> + * but calling device_release_driver() here will cause a deadlock.
> + */
>  }
>  
>  int ath10k_core_register(struct ath10k *ar, u32 chip_id)
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
