Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDQWn-00005u-I7
 for ath10k@lists.infradead.org; Tue, 20 Jan 2015 04:34:58 +0000
Message-ID: <54BDDAD9.4010405@candelatech.com>
Date: Mon, 19 Jan 2015 20:34:33 -0800
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>

Ok, so I think I've mostly got this figured out...at least enough to
work around the problem.

It seems that the firmware and/or NIC hardware stops doing CE interrupts
for the WMI rings (at least).  If I force a poll of
the rings, then packets are found and may be processed.

In one case I looked at closely, it seems IRQs went away for around 30 seconds,
and then for no obvious reason IRQs for the rings started being delivered and
processed again. ~20 WMI messages were processed due to polling CE rings in this
interval.

The combination of WMI keep-alive messages sent from host, and
timer to check for timeouts (and do CE polling at higher intervals
when timeout is detected) appears to be enough.  I also check
for the IRQ working again and stop the polling at that time.

I plan to clean the firmware changes up and commit them to my
own repo...but it will require host changes to enable the keep-alive
to fully work around this problem.  Probably none of this will make
it upstream....

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
