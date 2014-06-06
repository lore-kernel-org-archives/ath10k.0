Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WsvSO-0007MJ-3E
 for ath10k@lists.infradead.org; Fri, 06 Jun 2014 14:49:24 +0000
Message-ID: <5391D4DC.7060402@candelatech.com>
Date: Fri, 06 Jun 2014 07:49:00 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: More issues with ath10k_flush
References: <5390BB50.7040600@candelatech.com>	<5390FF56.4070503@candelatech.com>
 <CA+BoTQm8Ga2JH6cGcJ4kr0jbocusNecL1VL+LMPXk+du_OY5sw@mail.gmail.com>
In-Reply-To: <CA+BoTQm8Ga2JH6cGcJ4kr0jbocusNecL1VL+LMPXk+du_OY5sw@mail.gmail.com>
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
Cc: ath10k <ath10k@lists.infradead.org>



On 06/05/2014 10:16 PM, Michal Kazior wrote:
> On 6 June 2014 01:37, Ben Greear <greearb@candelatech.com> wrote:
>> On 06/05/2014 11:47 AM, Ben Greear wrote:
>>> I'm back to debugging this charmer.
>>>
>>> Currently I see the flush fail (and take 5 seconds doing so)
>>> fairly often when creating lots of station vifs against my firmware.
>>>
>>> Once stations are connected, there are usually no more timeouts,
>>> even though I might be sending/receiving 100+Mbps of traffic for hours at
>>> a time.
>>>
>>> By printing out the firmware stats, I see that much of the time
>>> the hardware has accepted X packets for transmission, but has completed
>>> X-1.  It is possible the firmware's counters are screwed up some how
>>> or that it lost a packet, but I think it may also be possible that
>>> the firmware is just being really slow about completing a packet
>>> every now and then.  I have looked at the firmware in detail and
>>> have found no way that it could actually leak tx descriptors.
>
> Interesting. This reminds me the lazy wmi-htc tx credit replenishment
> after wmi mgmt tx is completed. Maybe it's a similar sort of thing?
> Maybe it's actually completed but for some reason the completion
> hasn't been fully processed yet..

I didn't see any reason for that to happen in the firmware, but it
is not the simplest code...

>>> So, I was thinking about changing the flush logic to try
>>> the current flush (that just waits) for up to 1/5 of the
>>> flush timeout, and if that fails, try telling the firmware to purge
>>> it's tx buffers, and then wait up to 4/5ths more of the
>>> flush timeout.
>
> Sounds reasonable.

By flushing before we start waiting, maybe we don't need the extra
cleverness...but possibly it would be better to wait a short bit
of time an then flush firmware if we still have pending skbs?

>> After poking around, it seems there is no wmi command to tell
>> the firmware to just flush everything, so I hacked one into
>> my firmware, called it before ath10k_flush starts waiting,
>> and after several reboots, I do not see any timeouts trying
>> to flush.
>
> I thought WMI_PEER_FLUSH_TIDS_CMDID is for that. It didn't work for
> you? If so I would assume it's a firmware bug..

Well, actually, the command may have worked...but instead of iterating
through all peers for all vdevs and making lots of wmi calls, I just
made the firmware do the iteration by passing 0xFFFFFFFF as the vdev-id
and special-casing the firmware handling of the message.

Was only about 8 extra lines of code in the firmware...

I also noticed something where the firmware might not be
flushing it's tids when a vdev goes down...I didn't bother
to change that yet, but possibly that is part of the issue.
(It only flushed if vdev was 'paused'...not sure why.)


>> So, maybe that will do the trick...other suggestions are
>> still welcome :)
>
> Did you try to find out what kind of frame is supposedly held? I
> recall you've posted a NullFunc hexdump once pointing that it's one of
> the offending frames that didn't complete.
>
> So.. maybe just not sending NullFunc frames (hell, they don't get a
> proper ack status anyway..) or somehow altering how they are sent is
> another way to work this around.

I haven't tried printing them lately...and if the flush logic continues
to work, I probably won't bother...

In the past, I know there were sometimes lots of larger frames as well, but possibly
that was a separate issue as I have not seen more than one frame hung lately.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
