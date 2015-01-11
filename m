Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAFU8-0000tG-3e
 for ath10k@lists.infradead.org; Sun, 11 Jan 2015 10:11:04 +0000
Message-ID: <54B24B42.30700@qti.qualcomm.com>
Date: Sun, 11 Jan 2015 15:36:58 +0530
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
MIME-Version: 1.0
Subject: Re: [PATCH RESEND] ath10k: Fix potential Rx ring corruption
References: <1420823986-29503-1-git-send-email-vthiagar@qti.qualcomm.com>
 <54B07420.8090600@candelatech.com>,
 <54B17716.40609@candelatech.com> <1420969591846.36256@qti.qualcomm.com>
In-Reply-To: <1420969591846.36256@qti.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org




> Well, problem is not solved after all.  Had total of 5 crashes on overnight run, must have
> all been before midnight, because that is the earliest logs I see (journald was not configured
> to use enough space...fixed for next time) and no crashes since then.

Not sure about the crash you are originally seeing. This commit fixes rx ring buffer corruption,
this could make some difference in buffer corruption in copy engine 1.

>
> Still, it is at least no worse.
>
> I wonder if similar wb() is needed in the firmware somewhere?

Unlikely, there will be enough time for host to see the updated index and
rx buffer after fw updates them while sending htt rx indication. Host accesses
them only when processing the htt message.

Vasanth

>
> Thanks,
> Ben
>
> On 01/09/2015 04:36 PM, Ben Greear wrote:
>> I added this to my tree (and a bunch more debug stuff to track
>> CE transport-ids), and I've done about 4500 station reconnects over
>> the last 2 hours and no tx-credits hang issue so far.
>>
>> Could be my debugging code or that I'm getting lucky, but I'm hopeful
>> that your patch actually fixed the problem I was seeing!
>>
>> Thanks,
>> Ben
>>
>>
>> On 01/09/2015 09:19 AM, Vasanthakumar Thiagarajan wrote:
>>> When replenishing Rx buffers driver updates the address of the
>>> buffer and the index of rx buffer in rx ring to the firmware.
>>> Change in order by CPU can cause rx ring corruption. Add memory
>>> barrier before updating rx buffer index to guarantee the order.
>>>
>>> This could fix some instances of rx ring corruption due to done
>>> bit in rx attention flag not set.
>>>
>>> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
>>> ---
>>>    drivers/net/wireless/ath/ath10k/htt_rx.c |    5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
>>> index 9c782a4..baa1c44 100644
>>> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
>>> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
>>> @@ -97,6 +97,11 @@ static int __ath10k_htt_rx_ring_fill_n(struct ath10k_htt *htt, int num)
>>>       }
>>>
>>>    fail:
>>> +    /*
>>> +     * Make sure the rx buffer is updated before available buffer
>>> +     * index to avoid any potential rx ring corruption.
>>> +     */
>>> +    mb();
>>>       *htt->rx_ring.alloc_idx.vaddr = __cpu_to_le32(idx);
>>>       return ret;
>>>    }
>>>
>>
>>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
