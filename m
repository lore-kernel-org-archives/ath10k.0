Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDxQn-00008N-2q
 for ath10k@lists.infradead.org; Wed, 21 Jan 2015 15:42:57 +0000
Message-ID: <54BFC8EA.2000804@candelatech.com>
Date: Wed, 21 Jan 2015 07:42:34 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone seeing tx-credits 'hang'?
References: <54AEF595.9030205@candelatech.com>	<CA+BoTQk86cnC1eRwqAbbnkMe7rDTvctH8o-JPvM3yT56nEes6g@mail.gmail.com>	<54B00807.9060909@candelatech.com>	<CA+BoTQ=Q-J0x1AbNNVAuwgTq1Ar8D=pki2=pWW=9upWp06h2rQ@mail.gmail.com>	<54B56D00.4010401@candelatech.com>	<CA+BoTQ=7BDPUs+B4-wBp5RRhKpvjHcTtbo=CFqj6e62rA+HnGA@mail.gmail.com>	<54B6AE1E.3020900@candelatech.com>	<CA+BoTQniiBEYnQYSp4H7yFQPT8sxG4kb3kiHsUB7SniyU_zorA@mail.gmail.com>	<54BDDAD9.4010405@candelatech.com>
 <CA+BoTQkpDTxmwP9CFCzUmsSU0so2uaZswwOyM13a_6O88vrj9A@mail.gmail.com>
In-Reply-To: <CA+BoTQkpDTxmwP9CFCzUmsSU0so2uaZswwOyM13a_6O88vrj9A@mail.gmail.com>
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



On 01/20/2015 11:22 PM, Michal Kazior wrote:
> On 20 January 2015 at 05:34, Ben Greear <greearb@candelatech.com> wrote:
>> Ok, so I think I've mostly got this figured out...at least enough to
>> work around the problem.
>>
>> It seems that the firmware and/or NIC hardware stops doing CE interrupts
>> for the WMI rings (at least).  If I force a poll of
>> the rings, then packets are found and may be processed.
>
> So you just keep calling ath10k_hif_send_complete_check() (or
> ath10k_ce_per_engine_service) for polling, right?

The polling is in firmware...but it is calling the firmware variants
of these.

I did actually add polling in the host as well, but that did not
fix the problem.  I will back that out and make sure the problem
remains fixed with just the firmware changes and host keep-alive
messages to enable the firmware changes.

>> In one case I looked at closely, it seems IRQs went away for around 30
>> seconds,
>> and then for no obvious reason IRQs for the rings started being delivered
>> and
>> processed again. ~20 WMI messages were processed due to polling CE rings in
>> this
>> interval.
>
> Out of curiosity - what irq mode are you using? Shared or MSI? Or did
> you try both?

Probably MSI, but I don't actually know.  Is there an easy way to tell?

>> The combination of WMI keep-alive messages sent from host, and
>> timer to check for timeouts (and do CE polling at higher intervals
>> when timeout is detected) appears to be enough.  I also check
>> for the IRQ working again and stop the polling at that time.
>>
>> I plan to clean the firmware changes up and commit them to my
>> own repo...but it will require host changes to enable the keep-alive
>> to fully work around this problem.  Probably none of this will make
>> it upstream....
>
> We could add a watchdog to WMI which uses the `echo` command and look
> at echo events and tx credit completion (WMI is notified about that).
> In case neither comes in in a timely fashion (lets say 1s which is
> less than WMI command timeout of 3s) we start polling until things
> settle down. This should work with standard firmware, no?

Since it is firmware that has to do the CE polling, then I don't see any
way to resolve this w/out hacking firmware..and you need a new message to
send to firmware from host that firmware can be sure is periodic to use
as it's WMI keep-alive timer.  That is why I made a new message type
for this (otherwise, cannot really be backwards compat with old kernels that
do not send regular keep-alives, but *may* send any other valid message type for
whatever reason whenever they want.)

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
