Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VapvC-0002Rb-VE
 for ath10k@lists.infradead.org; Mon, 28 Oct 2013 16:44:07 +0000
Message-ID: <526E9437.9020705@candelatech.com>
Date: Mon, 28 Oct 2013 09:43:35 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k:  Fix un-initialized debug objects.
References: <1382639166-25698-1-git-send-email-greearb@candelatech.com>
 <871u39iydt.fsf@kamboji.qca.qualcomm.com> <526A8762.9050009@candelatech.com>
 <877gd0fzti.fsf@kamboji.qca.qualcomm.com> <526B467E.1060607@candelatech.com>
 <87hac1d7th.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87hac1d7th.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

On 10/28/2013 03:10 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
>> On 10/25/2013 08:58 PM, Kalle Valo wrote:
>>> Ben Greear <greearb@candelatech.com> writes:
>>>
>>>> On 10/25/2013 12:49 AM, Kalle Valo wrote:
>>>>> greearb@candelatech.com writes:
>>>>
>>>>>>    	INIT_WORK(&ar->restart_work, ath10k_core_restart);
>>>>>>
>>>>>> +	ath10k_debug_init(ar);
>>>>>
>>>>> For symmetry would it make more sense to move ath10k_debug_destroy() to
>>>>> ath10k_core_unregister()? That way we could avoid adding a new function.
>>>>>
>>>>
>>>> In my opinion, you should initialize such things as early as possible
>>>> so you don't have to worry so much about the various error cases leaving
>>>> things un-initialized.  I believe my patch accomplished that.
>>>
>>> Well, I again like symmetry and simplicity.
>>>
>>>> What new function are you planning to avoid?
>>>
>>> I would prefer not to create ath10k_debug_init().
>>>
>>> What I was trying to suggest is this, I think it should fix the bug you
>>> are seeing:
>>
>> I don't think so.  The problem is that the init logic can fail before
>> the debug logic is ever initialized, so any cleanup that attempts to
>> access the debug logic can blow up.
> 
> Please look again. My idea was to fix the logic so that
> ath10k_debug_destroy() is called only if ath10k_debug_create() succeeds.

Ok, I think your patch will work.  I'll back mine out when you push
yours and will let you know if I find any more problems in this
area.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
