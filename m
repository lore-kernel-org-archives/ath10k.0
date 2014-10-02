Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZhym-0005gb-6W
 for ath10k@lists.infradead.org; Thu, 02 Oct 2014 15:07:40 +0000
Date: Thu, 2 Oct 2014 16:07:12 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: ath10k: calibration data through Device Tree?
Message-ID: <20141002150712.GA18660@leverpostej>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
 <20141002132914.GN5788@leverpostej>
 <87ppeamvr9.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ppeamvr9.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, Oct 02, 2014 at 02:44:26PM +0100, Kalle Valo wrote:
> Hi Mark,
> 
> Mark Rutland <mark.rutland@arm.com> writes:
> 
> >> ath10k is a wireless driver for Qualcomm Atheros 802.11ac hardware and
> >> located in drivers/net/wireless/ath/ath10k/. Currently it only supports
> >> PCI devices.
> >> 
> >> Some of the devices store the calibration data to the host flash and the
> >> bootloader reads the data from the flash. And now we need a method to
> >> deliver the calibration data from bootloader to ath10k. 
> >
> > What does this calibration data consist of?
> 
> From ath10k point of view it's just a binary blob which we push to the
> firmware before we start it. ath10k does not parse it in any way.

Ok. So this is an arbitrary binary blob that the firmware needs.

Who is in charge of loading the firmware onto the device? Where does the
firmware come from?

> > What happens if you don't have the calibration data? Is it a critical
> > requirement for the use of the device, or does its absence simply result
> > in degraded performance?
> 
> From my point of view the device should not be used if it doesn't
> contain the correct calibration data. I guess it could work somehow but
> there's no guarantee about the perfomance.

Ok.

> > What do you do on non-DT systems? Where does the information come from
> > in that case?
> 
> Currently ath10k only supports having the calibration data in the OTP
> area inside the QCA98XX chip. But some manufacturers want to store it on
> the host file, I assume because of the flexibility it provides. And
> that's why we have the need for Device Tree support.

So currently the calibration data is stored within the device itself?

What is the rationale for overriding this? While it might be 'flexible',
that's not to say it's fantastic idea to rely upon it. This sounds like
a workaround for buggy/incomplete data in the OTP area.

> > I'm somewhat puzzled as to why a discoverable PCI device would require
> > non-discoverable information to use.
> 
> ath9k has a similar model as well, but it doesn't support Device Tree
> (at least not yet).

Ah. So currently it's possible to read calibration data from the device
itself. That sounds more like what I had expected.

Given that, why is it necessary to override this data?

> >> * The calibration data is now 2116 bytes, in the future it might be
> >>   longer. The data is unique for each radio and is created at the
> >>   factory.
> >
> > Why would this change in future? Who is in charge of providing this
> > information, and deciding upon the format thereof?
> 
> That's up to the firmare and hardware teams working on the chipsets.
> Basically ath10k just needs the data and the length of the data.

One issue I'm concerned with is the possiblity of a mismatch between the
FW (which is presumably loaded by Linux from a filesystem somewhere),
and the FW-specific(?) calibration data which comes from somewhere else.

I assume given the calibration data would otherwise come from the OTP
area that new FW must be backwards compatible with old calibration data?

I hope that even with a 'flexible' mechanism for overriding this
information, that compatibility would remain the case, so a user would
not have to update their DTB simply because they updated their userspace
and hence their firmware. Otherwise, this sounds broken to me.

> >> * ath10k must be able to reliably map the PCI device (=radio) to the
> >>   correct calibration data. Maybe with using PCI bus and slot numbers?
> >
> > I guess we'd have to do something along those lines.
> >
> > I'd like to get a better understanding of the problem before we start
> > figuring out how to pass an arbitrary blob of information around.
> 
> I hope my answers helped.

Somewhat, yes!

Thanks,
Mark.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
