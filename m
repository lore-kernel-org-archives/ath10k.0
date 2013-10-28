Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vajni-0000Yu-5x
 for ath10k@lists.infradead.org; Mon, 28 Oct 2013 10:11:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k:  Fix un-initialized debug objects.
References: <1382639166-25698-1-git-send-email-greearb@candelatech.com>
 <871u39iydt.fsf@kamboji.qca.qualcomm.com>
 <526A8762.9050009@candelatech.com>
 <877gd0fzti.fsf@kamboji.qca.qualcomm.com>
 <526B467E.1060607@candelatech.com>
Date: Mon, 28 Oct 2013 12:10:50 +0200
In-Reply-To: <526B467E.1060607@candelatech.com> (Ben Greear's message of "Fri, 
 25 Oct 2013 21:35:10 -0700")
Message-ID: <87hac1d7th.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> On 10/25/2013 08:58 PM, Kalle Valo wrote:
>> Ben Greear <greearb@candelatech.com> writes:
>>
>>> On 10/25/2013 12:49 AM, Kalle Valo wrote:
>>>> greearb@candelatech.com writes:
>>>
>>>>>    	INIT_WORK(&ar->restart_work, ath10k_core_restart);
>>>>>
>>>>> +	ath10k_debug_init(ar);
>>>>
>>>> For symmetry would it make more sense to move ath10k_debug_destroy() to
>>>> ath10k_core_unregister()? That way we could avoid adding a new function.
>>>>
>>>
>>> In my opinion, you should initialize such things as early as possible
>>> so you don't have to worry so much about the various error cases leaving
>>> things un-initialized.  I believe my patch accomplished that.
>>
>> Well, I again like symmetry and simplicity.
>>
>>> What new function are you planning to avoid?
>>
>> I would prefer not to create ath10k_debug_init().
>>
>> What I was trying to suggest is this, I think it should fix the bug you
>> are seeing:
>
> I don't think so.  The problem is that the init logic can fail before
> the debug logic is ever initialized, so any cleanup that attempts to
> access the debug logic can blow up.

Please look again. My idea was to fix the logic so that
ath10k_debug_destroy() is called only if ath10k_debug_create() succeeds.

> All my patch does is ensure the debug related members are always initialized,
> and so can be cleaned up later without problem.

It adds an unnecessary function which is not needed AFAICS.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
