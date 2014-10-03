Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xa4oO-00017b-Ck
 for ath10k@lists.infradead.org; Fri, 03 Oct 2014 15:30:29 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: ath10k: calibration data through Device Tree?
Date: Fri, 03 Oct 2014 17:29:54 +0200
Message-ID: <2386503.dNPayhXJTQ@wuerfel>
In-Reply-To: <542DA1F7.9090904@amacapital.net>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
 <87ppeamvr9.fsf@kamboji.qca.qualcomm.com> <542DA1F7.9090904@amacapital.net>
MIME-Version: 1.0
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
To: Andy Lutomirski <luto@amacapital.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org

On Thursday 02 October 2014 12:05:27 Andy Lutomirski wrote:
> On 10/02/2014 06:44 AM, Kalle Valo wrote:
> > Hi Mark,
> > 
> > Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:
> > 
> >>> ath10k is a wireless driver for Qualcomm Atheros 802.11ac hardware and
> >>> located in drivers/net/wireless/ath/ath10k/. Currently it only supports
> >>> PCI devices.
> >>>
> >>> Some of the devices store the calibration data to the host flash and the
> >>> bootloader reads the data from the flash. And now we need a method to
> >>> deliver the calibration data from bootloader to ath10k. 
> >>
> >> What does this calibration data consist of?
> > 
> > From ath10k point of view it's just a binary blob which we push to the
> > firmware before we start it. ath10k does not parse it in any way.
> > 
> >> What happens if you don't have the calibration data? Is it a critical
> >> requirement for the use of the device, or does its absence simply result
> >> in degraded performance?
> > 
> > From my point of view the device should not be used if it doesn't
> > contain the correct calibration data. I guess it could work somehow but
> > there's no guarantee about the perfomance.
> > 
> >> What do you do on non-DT systems? Where does the information come from
> >> in that case?
> > 
> > Currently ath10k only supports having the calibration data in the OTP
> > area inside the QCA98XX chip. But some manufacturers want to store it on
> > the host file, I assume because of the flexibility it provides. And
> > that's why we have the need for Device Tree support.
> 
> To give an actual concrete example that might be what Kalle is talking
> about:
> 
> I have a TP-Link Archer C7, which has a mips cpu and an ath10k minipcie
> device.  For whatever reason (I honestly have no clue whatsoever why the
> hardware works this way), the calibration data is on a host flash
> partition, not on the minipcie device's ROM or flash or whatever it is.

Just to clarify: is this data specific to the design of the device and
identical for all parts in a manufacture run, or does each individual
board have to be calibrated separately?

> Needless to say, the mainline ath10k driver won't load on it.  (An old
> version used to load without calibration data.  It didn't work very well.)
> 
> Presuambly the idea is that, if things like this used DT (which mine
> doesn't, I presume), then ath10k could get the calibration data via DT.
>  And maybe some vendors of ARM-based wifi devices are planning on
> playing similar games, and they do use DT.

Yes, this makes sense. I would also very much love to see DT support for
arch/mips/ath79 in general, it seems like a nice platform that is used
in a lot of devices with good openwrt support, and using DT would make
it easier to support additional devices.

From a system design point, it's still horrible that you have to use
DT for a device that is on a discoverable bus like PCI, but as you describe,
the reality is that products are shipping that use ath10k PCI devices
without this data in them.

	Arnd

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
