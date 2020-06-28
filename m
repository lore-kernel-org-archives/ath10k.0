Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by casper.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpb3m-0008Nj-3r
 for ath10k@lists.infradead.org; Sun, 28 Jun 2020 17:25:48 +0000
Subject: Re: [PATCH] ath10k: Add history for tracking certain events
References: <1593238973-23237-1-git-send-email-pillair@codeaurora.org>
 <926301ed-e27f-0d8f-0177-6484bfffa40c@candelatech.com>
 <000201d64d0a$b3d39d10$1b7ad730$@codeaurora.org>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <859a8ffb-6108-81f3-b379-4a0adfa064fe@candelatech.com>
Date: Sun, 28 Jun 2020 10:25:35 -0700
MIME-Version: 1.0
In-Reply-To: <000201d64d0a$b3d39d10$1b7ad730$@codeaurora.org>
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
To: Rakesh Pillai <pillair@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org



On 06/27/2020 10:12 PM, Rakesh Pillai wrote:
>
>
>> -----Original Message-----
>> From: Ben Greear <greearb@candelatech.com>
>> Sent: Saturday, June 27, 2020 8:58 PM
>> To: Rakesh Pillai <pillair@codeaurora.org>; ath10k@lists.infradead.org
>> Cc: linux-wireless@vger.kernel.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH] ath10k: Add history for tracking certain events
>>
>>
>>
>> On 06/26/2020 11:22 PM, Rakesh Pillai wrote:
>>> For debugging many issues, a history of the
>>> below mentioned events can help get an idea
>>> of what exactly was going on just before any
>>> issue occurred in the system. These event
>>> history will be collected only when the host
>>> driver is run in debug mode (i.e. with the
>>> config ATH10K_DEBUG enabled).
>>
>> This should be disabled by default unless user specifically pokes some
>> debugfs
>> value to turn it on so that it does not impact performance.
>
> Hi Ben,
> This history is enabled only if the user compiles the kernel with
> ATH10K_DEBUG.
> Making it runtime, adds a lot of "if" conditions for this history record.
> Do you suggest to add support to enable/disable it runtime even in
> ATH10K_DEBUG ?

Yes, because you are adding lots of locks/unlocks.  That is way more expensive
than an if statement.  You can add an 'unlikely' to the if check as well, so
compiler will optimize for this feature not being enabled.

Thanks,
Ben

>
>>
>> Thanks,
>> Ben
>>
>>>
>>> Add history for tracking the below events
>>> - register read
>>> - register write
>>> - IRQ trigger
>>> - IRQ Enable
>>> - IRQ Disable
>>> - NAPI poll
>>> - CE service
>>> - WMI cmd
>>> - WMI event
>>> - WMI tx completion
>>>
>>> This will help in debugging any crash or any
>>> improper behaviour.
>>
>>
>> --
>> Ben Greear <greearb@candelatech.com>
>> Candela Technologies Inc  http://www.candelatech.com
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
