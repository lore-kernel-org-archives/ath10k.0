Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1b0VsO-0004Pf-Su
 for ath10k@lists.infradead.org; Wed, 11 May 2016 15:16:41 +0000
Message-ID: <57334B51.1010104@candelatech.com>
Date: Wed, 11 May 2016 08:10:09 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 03/21] ath10k: Support setting debug mask from driver code.
References: <1462835475-11079-1-git-send-email-greearb@candelatech.com>
 <1462835475-11079-4-git-send-email-greearb@candelatech.com>
 <CA+BoTQmbn_6TzfV5eNieD4=B5_CieQ2XRKeXVLKSgfaEQ_2kUg@mail.gmail.com>
In-Reply-To: <CA+BoTQmbn_6TzfV5eNieD4=B5_CieQ2XRKeXVLKSgfaEQ_2kUg@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 05/11/2016 03:40 AM, Michal Kazior wrote:
> On 10 May 2016 at 01:10,  <greearb@candelatech.com> wrote:
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Might want to turn off verbose debug as soon as you
>> see a firmware crash, for instance.  Helps keep dmesg
>> output from over-running the stuff you care about.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/debug.c | 5 +++++
>>   drivers/net/wireless/ath/ath10k/debug.h | 1 +
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
>> index e251155..a689bf1 100644
>> --- a/drivers/net/wireless/ath/ath10k/debug.c
>> +++ b/drivers/net/wireless/ath/ath10k/debug.c
>> @@ -194,6 +194,11 @@ void ath10k_print_driver_info(struct ath10k *ar)
>>   }
>>   EXPORT_SYMBOL(ath10k_print_driver_info);
>>
>> +void ath10k_set_debug_mask(unsigned int v) {
>
> The { should be on new line.
>
>
>> +       ath10k_debug_mask = v;
>> +}
>> +EXPORT_SYMBOL(ath10k_set_debug_mask);
>
> I didn't see any uses of this in your patchset (it's commented out in
> 21/21) and I'm not fully convinced it's a good idea to override
> debug_mask like that. Once I set a debug_mask I expect it to stay
> unchanged. What if I do want to trace what happens after fw crash?
>
> Wouldn't it be better to have a knob to tell ath10k whether hw
> recovery should be automatic or manual?

Hmm, I have a later patch that allows twiddling this through debugfs,
that is what I meant to add to this series.  I'll find that one and squash
it into this one.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
