Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9cqs-0005mO-1q
 for ath10k@lists.infradead.org; Fri, 09 Jan 2015 16:55:59 +0000
Message-ID: <54B00807.9060909@candelatech.com>
Date: Fri, 09 Jan 2015 08:55:35 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone seeing tx-credits 'hang'?
References: <54AEF595.9030205@candelatech.com>
 <CA+BoTQk86cnC1eRwqAbbnkMe7rDTvctH8o-JPvM3yT56nEes6g@mail.gmail.com>
In-Reply-To: <CA+BoTQk86cnC1eRwqAbbnkMe7rDTvctH8o-JPvM3yT56nEes6g@mail.gmail.com>
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

On 01/09/2015 02:34 AM, Michal Kazior wrote:
> On 8 January 2015 at 22:24, Ben Greear <greearb@candelatech.com> wrote:
>> I am still working on tracking down tx-credits hang, where it appears
>> to the driver that firmware does not return tx credits, and the driver
>> then gets lots of -11 errors from htc/wmi and will not recover (well,
>> once it recovered after hanging for about 45 minutes, for reasons that are totally
>> beyond me.  I do not normally wait so long).
>>
>> I am using a hacked ath10k driver and CT firmware, but I am suspicious that the problem
>> is not unique to me, though I probably hit the problem much more often
>> due to the types of stress tests I am running.
> 
> I don't recall seeing it recently.
> 
> 
>> I have implemented a keep-alive between my driver and CT firmware,
>> and firmware will assert if it does not get a message within
>> about 10 seconds.  This is a wmi-message, so if we hang due to credits,
>> the firmware will assert and dump a nice crash log (and host can recover).
> 
> FYI the default time mgmt tx can be stuck is 10 seconds (vide the
> tx-credit starvation issue due to hostapd's inactivity measures).

One thing I noticed yesterday is that when the driver tries to put a
vdev down, the firmware will try to flush, and will delay vdev-down
event until fw is flushed.  I changed CT firmware to automatically
flush in this case, but perhaps the driver should explicitly ask
firmware to flush the vdev before putting it down?

Once the driver gets out of sync due to timeouts, the firmware
is likely to assert soon after if wmi hang doesn't happen because
firmware will think vdev is up when it is not, or vice versa.

Also, I notice a pattern in the failure case.

The sequence is almost always something like this:

[lots of vdev up/down, re-associate, etc]

vdev down (this would have timed out if I didn't put in the flush)
  * vdev down is usually last wmi cmd firmware receives.
driver tries to delete peer, that times out (firmware wmi layer never
  saw the command)
firmware reports one or two more messages to driver, and if it manages to report
a dbglog, that shows a tx-timeout message usually within a second of
the vdev down.  This happens whether or not I flush the vdev bringing it
down.

At this point, one more request from driver may be sent, after that,
it is credit starvation.  Firmware continues to run (timers fire, etc).

I think that firmware is also waiting on a completion event from the
CE layer...I plan to dig into that more today.

>> One crash I looked at closely appears to show the firmware thinking it
>> has returned all credits, but driver never received them.  What is more,
>> it seems that the driver thought it sent one additional wmi command
>> that the firmware did not receive in the wmi message handling code.
> 
> Hmm.. A couple of ideas:
>  a) lost interrupt
>  b) silently dropped event buffer (in fw, e.g. due to unforseen lack
> of resources)
>  c) memory barrier / ordering issue (delivered/submitted buffer was a
> mess - I don't know if you're checking the buffer in/out count or
> analyzed all the way down to copy engine)
> 
> You could try adding a few extra mb() (e.g. before copy engine ring
> indexes are updated) for (c), at least in ath10k.
> 
> You could try changing _service_any() to ignore copy engine summary
> mask and iterate i=0..CE_COUNT-1 and try polling htc-wmi rx pipe (or
> just simply all of them :P) with ath10k_hif_send_complete_check().

Yes, I suspect CE transport issue...I have not dug into that code yet,
but I will do so today.

Thanks,
Ben

> 
> 
> Michal
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
