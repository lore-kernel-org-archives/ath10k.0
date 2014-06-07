Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WtIcJ-0008V9-CN
 for ath10k@lists.infradead.org; Sat, 07 Jun 2014 15:33:11 +0000
Message-ID: <539330A1.9050307@candelatech.com>
Date: Sat, 07 Jun 2014 08:32:49 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ath10k:  provide firmware crash info via debugfs.
References: <1401904902-5842-1-git-send-email-greearb@candelatech.com>	<87egz3nxdn.fsf@kamboji.qca.qualcomm.com>	<5390B632.7030305@candelatech.com>	<87wqcumuuw.fsf@kamboji.qca.qualcomm.com>	<5391E842.4010401@candelatech.com>
 <874mzwkher.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <874mzwkher.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org



On 06/07/2014 05:55 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> On 06/05/2014 11:10 PM, Kalle Valo wrote:
>>> Ben Greear <greearb@candelatech.com> writes:
>>>
>>>> I did not do this because I figure we will want ethtool support w/out
>>>> forcing debugfs to be enabled someday soon.
>>>
>>> When we add ethtool support, it's easy to move these back. And then we
>>> need to move the code out from debug.c anyway.
>>
>> Well, it seems like needless churn and makes it harder to follow
>> 'git blame' when you move big chunks around.
>
> I don't care about 'git blame', the actual code is far more important to
> me. If git blame is so important, someone else can improve 'git blame'
> to detect moving code chunks.
>
>> We would not have to move the code out of debug.c, but if you do want
>> it moved, lets pick that place now and just put it there to begin
>> with.
>
> Code in debug.c should have the data it owns in struct ath10k_debug.

Ok, I'll move the data structs to the debug logic for next version of the patch.


>>>> I'm a bit leery of adding spin-locks in the dump routine just for
>>>> this, but I can add and use a new spin-lock if you prefer.
>>>
>>> Why a new spinlock? I didn't review the locking requirements, but I
>>> would first check ar->data_lock can be used.
>>
>> I think it has to be a spin-lock because the crash dump is gathered
>> in the irq handler, so I can't use a mutex as far as I know...
>>
>> I'll work on adding such a lock today.
>
> I asked why add a _new_ spinlock as ar->data_lock is already a spinlock.

Surely we do not want to impede traffic flow just to dump debug info?

And, it is easier to review a specific spinlock rather than use one big
global-ish lock and have to review every use of that lock for issues.

My -v2 had a new spinlock for this new debug data.  I'll move it into the
debug struct with the other new data fields for next version.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
