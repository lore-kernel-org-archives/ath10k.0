Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBo37-0003gR-Vf
 for ath10k@lists.infradead.org; Thu, 15 Jan 2015 17:17:38 +0000
Message-ID: <54B7F617.8050505@candelatech.com>
Date: Thu, 15 Jan 2015 09:17:11 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone seeing tx-credits 'hang'?
References: <54AEF595.9030205@candelatech.com>
 <CA+BoTQk86cnC1eRwqAbbnkMe7rDTvctH8o-JPvM3yT56nEes6g@mail.gmail.com>
 <54B00807.9060909@candelatech.com>
 <CA+BoTQ=Q-J0x1AbNNVAuwgTq1Ar8D=pki2=pWW=9upWp06h2rQ@mail.gmail.com>
 <54B56D00.4010401@candelatech.com>
 <CA+BoTQ=7BDPUs+B4-wBp5RRhKpvjHcTtbo=CFqj6e62rA+HnGA@mail.gmail.com>
 <54B6AE1E.3020900@candelatech.com>
 <CA+BoTQniiBEYnQYSp4H7yFQPT8sxG4kb3kiHsUB7SniyU_zorA@mail.gmail.com>
In-Reply-To: <CA+BoTQniiBEYnQYSp4H7yFQPT8sxG4kb3kiHsUB7SniyU_zorA@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 01/14/2015 11:48 PM, Michal Kazior wrote:
> On 14 January 2015 at 18:57, Ben Greear <greearb@candelatech.com> wrote:
>> On 01/14/2015 01:45 AM, Michal Kazior wrote:
>>> On 13 January 2015 at 20:07, Ben Greear <greearb@candelatech.com> wrote:
>>> [...]
>>>>
>>>> I managed to get some better debug out of the firmware.
>>>>
>>>> I am having a hell of a time figuring out how the code flows through all
>>>> of the callbacks (in both firmware and driver), but it appears this is what happened:
>>>>
>>>> (I have instrumented transfer-id in both firmware and driver)
>>>>
>>>> firmware sent wmi message with transfer-id of 72.
>>>> kernel received this transfer-id
>>>> firmware's last send-callback transfer ID is 71.
>>>>
>>>> So, it seems that either ath10k did not do the transfer-complete logic,
>>>> did it incorrectly, or the firmware did not notice it was done.
>>>>
>>>> I cannot find where the transfer complete code that should be updating
>>>> firmware is at.  If you know, can you point me to it?
>>>
>>> I think the send-callback should be called when CE is simply done
>>> doing it's stuff. There's no need for the other side to ack anything
>>> explicitly (it just needs to have a free buffer on it's side so CE can
>>> copy it over).
>>>
>>> Or maybe it is the HOST_IS_COPY_COMPLETE_MASK? Not really sure.
>>
>> I am now guessing that some magic IRQ happens when ath10k_ce_src_ring_write_index_set()
>> is called.
> 
> Correct. CE should generate an interrupt (provided it's not masked in
> CE registers) on the other end when ring index is bumped.
> 
> 
>> I may have narrowed down the problem a bit further now.
>>
>> I printed out the ring indexes in firmware and driver when lockup
>> occured.  The target -> host ring ids match fine, but I notice that
>> it appears the firmware has pending entries in it's host -> target wmi
>> ring that it has not consumed.
>>
>> Maybe it missed an irq or has some related race.
> 
> Hmm.. The host can tell the target it wants tx credit update in the
> htc host->target buffer. Upstream ath10k does this only when spending
> last tx credit. Your observation would explain why firmware doesn't
> send tx credit update to the host - it didn't get to see the
> need-credit-update. Does your tree modify behaviour of when is set
> ATH10K_HTC_FLAG_NEED_CREDIT_UPDATE in ath10k?

I am running a patch you posted a long time ago that enables credit-req
on every frame.  Firmware thinks it has given all credits back to the
host.  The problem seems to be that the firmware just did not receive
the last two requests from the host because it failed to properly read
it's wmi ring buffer.

My attempt to force a read keep crashing...I'll be back at debugging that
now.

>> I'm going to try forcing a poll of the host -> target wmi queue in the
>> firmware when it detects no wmi keep-alive messages and see if that kicks
>> things back into action, and maybe see if I can find any reason for it
>> to not properly handle the ring in the first place.
> 
> Did you try the old workaround ath10k had for hw1.0?

No, what I found looked quite horrible and complicated, and I did not
take time to try to fully understand what it was doing.

>> If this works, perhaps there is a way to kick the ring from the driver
>> side...maybe send a wmi command (ignoring quota) that has no affect,
>> or something like that?
> 
> I think the wmi-echo could be suited for this. It probably doesn't use
> any extra resources so overcommiting tx-credit to send it should be
> safe.

Worth a try, but since the driver ends up mostly dead-locked in this case,
it may be hard to properly trigger the dummy write when needed.  For now, I'm going to
focus on having firmware keep-alive timer logic force the re-read of the
ring buffer.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
