Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBZeD-0004qS-NY
 for ath10k@lists.infradead.org; Thu, 15 Jan 2015 01:54:59 +0000
Message-ID: <54B71DB9.10608@qca.qualcomm.com>
Date: Wed, 14 Jan 2015 17:54:01 -0800
From: Peter Oh <poh@qca.qualcomm.com>
MIME-Version: 1.0
Subject: Re: Anyone seeing tx-credits 'hang'?
References: <54AEF595.9030205@candelatech.com>
 <CA+BoTQk86cnC1eRwqAbbnkMe7rDTvctH8o-JPvM3yT56nEes6g@mail.gmail.com>
 <54B00807.9060909@candelatech.com>
 <CA+BoTQ=Q-J0x1AbNNVAuwgTq1Ar8D=pki2=pWW=9upWp06h2rQ@mail.gmail.com>
 <54B56D00.4010401@candelatech.com>
 <CA+BoTQ=7BDPUs+B4-wBp5RRhKpvjHcTtbo=CFqj6e62rA+HnGA@mail.gmail.com>
 <54B6AE1E.3020900@candelatech.com> <54B6D67C.4090006@qca.qualcomm.com>
 <54B6DE13.1080609@candelatech.com>
In-Reply-To: <54B6DE13.1080609@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>, Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>


On 01/14/2015 01:22 PM, Ben Greear wrote:
> On 01/14/2015 12:50 PM, Peter Oh wrote:
>> On 01/14/2015 09:57 AM, Ben Greear wrote:
>>> On 01/14/2015 01:45 AM, Michal Kazior wrote:
>>>> On 13 January 2015 at 20:07, Ben Greear <greearb@candelatech.com> wrote:
>>>> [...]
>>>>> I managed to get some better debug out of the firmware.
>>>>>
>>>>> I am having a hell of a time figuring out how the code flows through all
>>>>> of the callbacks (in both firmware and driver), but it appears this is what happened:
>>>>>
>>>>> (I have instrumented transfer-id in both firmware and driver)
>>>>>
>>>>> firmware sent wmi message with transfer-id of 72.
>>>>> kernel received this transfer-id
>>>>> firmware's last send-callback transfer ID is 71.
>>>>>
>>>>> So, it seems that either ath10k did not do the transfer-complete logic,
>>>>> did it incorrectly, or the firmware did not notice it was done.
>>>>>
>>>>> I cannot find where the transfer complete code that should be updating
>>>>> firmware is at.  If you know, can you point me to it?
>>>> I think the send-callback should be called when CE is simply done
>>>> doing it's stuff. There's no need for the other side to ack anything
>>>> explicitly (it just needs to have a free buffer on it's side so CE can
>>>> copy it over).
>>>>
>>>> Or maybe it is the HOST_IS_COPY_COMPLETE_MASK? Not really sure.
>>> I am now guessing that some magic IRQ happens when ath10k_ce_src_ring_write_index_set()
>>> is called.
>> You may already notice it, but to clarify the magic IRQ is DMA interrupts. Copy Engine is almost the same as DMA engine with channels which triggers an
>> interrupt automatically when a DMA transfer is completed. we have registers to enable it, HOST_IE (offset 0x2c) and TARGET_IE(offset 0x24).
>> ath10k_ce_src_ring_write_index_set (SRC_RING_WR_IND register, offset 0x3c) triggers fetching data automatically using DMA by ASIC design.
> Yes, that makes sense, and I appreciate the extra details.
>
>>> I may have narrowed down the problem a bit further now.
>>>
>>> I printed out the ring indexes in firmware and driver when lockup
>>> occured.  The target -> host ring ids match fine, but I notice that
>>> it appears the firmware has pending entries in it's host -> target wmi
>>> ring that it has not consumed.
>>>
>>> Maybe it missed an irq or has some related race.
>> Since the IRQ is a DMA interrupt triggered by ASIC, all the amount of data size must be transferred to trigger the interrupt. If IRQ does not happen even after
>> all the data transferred, then we may call it an ASIC bug otherwise it could be software issues. The corresponding status register is TARGET_IS (offset 0x28)
>> and HOST_IS (offset 0x30), but I'm not sure which registers represent the number of bytes has been transferred. If we have this type of register, it will be
>> easy to determine if DMA is done.
> I found some things that look risky in the firmware CE code, but my attempts at
> fixing them made no improvement, so I am not sure I found any real problems in
> this area yet.  I'll be happy to send you the firmware patches for my debugging
> efforts and such if you are interested.
sure. I'd like to run your changes, but I cannot guarantee how much 
efforts by when I give work on.
>
> As for when bytes are fully read, see this firmware method:
>
> CE_completed_recv_next
>
> At this point, I am trying to make a work-around that will force a re-read of the ring
> buffer (basically, fake an interrupt).
>
>
> Back to the original attempt at debugging this...the problem was quite easy to reproduce
> before I started adding debugging to the firmware..and the debugging I have added is quite light on
> run-time behaviour, so I suspect some sort of race either in software or hardware.
>
> Hard to pin it down though.
>
> Out of curiosity, are you aware of anyone hitting this type of problem with upstream
> firmware?
sorry, but I don't see people address this issue.
> Thanks,
> Ben
>
>
Regards,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
