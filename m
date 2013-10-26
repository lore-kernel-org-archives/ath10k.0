Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZvb7-0002G0-6E
 for ath10k@lists.infradead.org; Sat, 26 Oct 2013 04:35:38 +0000
Message-ID: <526B467E.1060607@candelatech.com>
Date: Fri, 25 Oct 2013 21:35:10 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k:  Fix un-initialized debug objects.
References: <1382639166-25698-1-git-send-email-greearb@candelatech.com>
 <871u39iydt.fsf@kamboji.qca.qualcomm.com> <526A8762.9050009@candelatech.com>
 <877gd0fzti.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <877gd0fzti.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

On 10/25/2013 08:58 PM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> On 10/25/2013 12:49 AM, Kalle Valo wrote:
>>> greearb@candelatech.com writes:
>>
>>>>    	INIT_WORK(&ar->restart_work, ath10k_core_restart);
>>>>
>>>> +	ath10k_debug_init(ar);
>>>
>>> For symmetry would it make more sense to move ath10k_debug_destroy() to
>>> ath10k_core_unregister()? That way we could avoid adding a new function.
>>>
>>
>> In my opinion, you should initialize such things as early as possible
>> so you don't have to worry so much about the various error cases leaving
>> things un-initialized.  I believe my patch accomplished that.
>
> Well, I again like symmetry and simplicity.
>
>> What new function are you planning to avoid?
>
> I would prefer not to create ath10k_debug_init().
>
> What I was trying to suggest is this, I think it should fix the bug you
> are seeing:

I don't think so.  The problem is that the init logic can fail before
the debug logic is ever initialized, so any cleanup that attempts to
access the debug logic can blow up.

All my patch does is ensure the debug related members are always initialized,
and so can be cleaned up later without problem.

Maybe your patch fixes something else though, I haven't investigated that
part of the code in detail yet.

Thanks,
Ben


>
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -738,8 +738,6 @@ EXPORT_SYMBOL(ath10k_core_create);
>
>   void ath10k_core_destroy(struct ath10k *ar)
>   {
> -       ath10k_debug_destroy(ar);
> -
>          flush_workqueue(ar->workqueue);
>          destroy_workqueue(ar->workqueue);
>
> @@ -986,6 +984,8 @@ void ath10k_core_unregister(struct ath10k *ar)
>          ath10k_mac_unregister(ar);
>
>          ath10k_core_free_firmware_files(ar);
> +
> +       ath10k_debug_destroy(ar);
>   }
>   EXPORT_SYMBOL(ath10k_core_unregister);
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
