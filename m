Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAiE2-0008Vg-3D
 for ath10k@lists.infradead.org; Mon, 12 Jan 2015 16:52:23 +0000
Message-ID: <54B3FBAF.5070608@candelatech.com>
Date: Mon, 12 Jan 2015 08:51:59 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone seeing tx-credits 'hang'?
References: <54AEF595.9030205@candelatech.com>
 <CA+BoTQk86cnC1eRwqAbbnkMe7rDTvctH8o-JPvM3yT56nEes6g@mail.gmail.com>
 <54B00807.9060909@candelatech.com>
 <CA+BoTQ=Q-J0x1AbNNVAuwgTq1Ar8D=pki2=pWW=9upWp06h2rQ@mail.gmail.com>
In-Reply-To: <CA+BoTQ=Q-J0x1AbNNVAuwgTq1Ar8D=pki2=pWW=9upWp06h2rQ@mail.gmail.com>
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

On 01/12/2015 12:06 AM, Michal Kazior wrote:
> On 9 January 2015 at 17:55, Ben Greear <greearb@candelatech.com> wrote:
> [...]
>> One thing I noticed yesterday is that when the driver tries to put a
>> vdev down, the firmware will try to flush, and will delay vdev-down
>> event until fw is flushed.  I changed CT firmware to automatically
>> flush in this case, but perhaps the driver should explicitly ask
>> firmware to flush the vdev before putting it down?
> 
> I recall the discussion we once had. I do plan on doing a patch for
> that, eventually.

I this case, I am thinking to just flush a particular vdev instead
of the entire set of vdevs.  I don't think flushing is root cause of
my problems anyway, as I still see the issue after making my CT
firmware flush.  I think upstream firmware might require one
message per tid per peer, so might be an issue to generate that
many wmi commands anyway...not sure.

>> Once the driver gets out of sync due to timeouts, the firmware
>> is likely to assert soon after if wmi hang doesn't happen because
>> firmware will think vdev is up when it is not, or vice versa.
>>
>> Also, I notice a pattern in the failure case.
>>
>> The sequence is almost always something like this:
>>
>> [lots of vdev up/down, re-associate, etc]
>>
>> vdev down (this would have timed out if I didn't put in the flush)
>>   * vdev down is usually last wmi cmd firmware receives.
>> driver tries to delete peer, that times out (firmware wmi layer never
>>   saw the command)
> 
> So there's a chance htc layer actually did get the buffer but for some
> reason it decided it isn't a wmi buffer. One reason could be the
> buffer contained garbage (e.g. due to missing barrier on host so
> firmware could read some data from an old physical address that was
> stored in ce descriptor item).
> 
> 
>> firmware reports one or two more messages to driver, and if it manages to report
>> a dbglog, that shows a tx-timeout message usually within a second of
>> the vdev down.  This happens whether or not I flush the vdev bringing it
>> down.
>>
>> At this point, one more request from driver may be sent, after that,
>> it is credit starvation.  Firmware continues to run (timers fire, etc).
>>
>> I think that firmware is also waiting on a completion event from the
>> CE layer...I plan to dig into that more today.
> 
> Hm.. This reminds me of issues hw1.0 had. I'd check if one of the
> workarounds ath10k had changes anything (see
> ath10k_ce_src_ring_write_index_set in ce.c in 5e3dd157ce).

Thanks, I'll go take a look at this today.

Ben



-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
