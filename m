Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlI5U-0005U7-9m
 for ath10k@lists.infradead.org; Fri, 16 May 2014 13:22:14 +0000
Message-ID: <537610EE.6050008@candelatech.com>
Date: Fri, 16 May 2014 06:21:50 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix rssi reporting.
References: <1400178894-26206-1-git-send-email-greearb@candelatech.com>	<CALhHN=o6zrn_0rtEJzfZsaJp5b8JoGNew-qq_=LU6Uh-XJbJ6g@mail.gmail.com>	<53760CEA.1000500@candelatech.com>
 <CALhHN=oriD4jGQEQ9XQ5Q0bzR31HkkW6F-tJ7xuRd8pAAs3fKA@mail.gmail.com>
In-Reply-To: <CALhHN=oriD4jGQEQ9XQ5Q0bzR31HkkW6F-tJ7xuRd8pAAs3fKA@mail.gmail.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 05/16/2014 06:16 AM, Janusz Dziedzic wrote:
> On 16 May 2014 15:04, Ben Greear <greearb@candelatech.com> wrote:
>>
>>
>> On 05/16/2014 05:18 AM, Janusz Dziedzic wrote:
>>>
>>> On 15 May 2014 20:34,  <greearb@candelatech.com> wrote:
>>>>
>>>> From: Ben Greear <greearb@candelatech.com>
>>>>
>>>> When the driver cannot provide proper rssi, mark
>>>> status with RX_FLAG_NO_SIGNAL_VAL so that stack
>>>> properly ignores it.
>>>>
>>> I think we should skip this one while we know rssi/rates.
>>> They are correct for all packets between START_VALID and END_VALID flags.
>>
>>
>> Skip what, the patch?  With current code, you are sending packets up
>> the tree without signal being set and yet without the flag set that says
>> to ignore the (unset) signal value.
>>
> Didn't reproduce this yet, while we have this values saved when
> START_VALID - rx status is an template in htt structure.
>
> struct ieee80211_rx_status *rx_status = &htt->rx_status;
>
> Are you sure you have all patches?
> This could be passible if we will get first packet with only flag
> END_VALID (not sure this is even possible). In case we get packets
> with START valid before, we will use template correctly. In case we
> will get packets with flags START and END valid we will also reports
> this correctly.
> Did you reproduce this with official firmware?
>
> BTW
> your patch break rates info based also on htt->rx_status template.
>
> BR
> Janusz

I will test again without my patch, and if you think current code is
correct, then just drop this patch and I'll retest everything when I
move back to testing on kalle's tree.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
