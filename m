Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZm3Y-00087R-UR
 for ath10k@lists.infradead.org; Thu, 02 Oct 2014 19:28:53 +0000
Received: by mail-wi0-f176.google.com with SMTP id hi2so5097887wib.9
 for <ath10k@lists.infradead.org>; Thu, 02 Oct 2014 12:28:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <542DA1F7.9090904@amacapital.net>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
 <20141002132914.GN5788@leverpostej>
 <87ppeamvr9.fsf@kamboji.qca.qualcomm.com>
 <542DA1F7.9090904@amacapital.net>
Date: Thu, 2 Oct 2014 12:28:29 -0700
Message-ID: <CAJ-VmomR+AzsUVqSik=ejntHHhQf_wj9kU==uCqWyk27M7Gp9w@mail.gmail.com>
Subject: Re: ath10k: calibration data through Device Tree?
From: Adrian Chadd <adrian@freebsd.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 2 October 2014 12:05, Andy Lutomirski <luto@amacapital.net> wrote:
> On 10/02/2014 06:44 AM, Kalle Valo wrote:
>> Hi Mark,
>>
>> Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:
>>
>>>> ath10k is a wireless driver for Qualcomm Atheros 802.11ac hardware and
>>>> located in drivers/net/wireless/ath/ath10k/. Currently it only supports
>>>> PCI devices.
>>>>
>>>> Some of the devices store the calibration data to the host flash and the
>>>> bootloader reads the data from the flash. And now we need a method to
>>>> deliver the calibration data from bootloader to ath10k.
>>>
>>> What does this calibration data consist of?
>>
>> From ath10k point of view it's just a binary blob which we push to the
>> firmware before we start it. ath10k does not parse it in any way.
>>
>>> What happens if you don't have the calibration data? Is it a critical
>>> requirement for the use of the device, or does its absence simply result
>>> in degraded performance?
>>
>> From my point of view the device should not be used if it doesn't
>> contain the correct calibration data. I guess it could work somehow but
>> there's no guarantee about the perfomance.
>>
>>> What do you do on non-DT systems? Where does the information come from
>>> in that case?
>>
>> Currently ath10k only supports having the calibration data in the OTP
>> area inside the QCA98XX chip. But some manufacturers want to store it on
>> the host file, I assume because of the flexibility it provides. And
>> that's why we have the need for Device Tree support.
>
> To give an actual concrete example that might be what Kalle is talking
> about:
>
> I have a TP-Link Archer C7, which has a mips cpu and an ath10k minipcie
> device.  For whatever reason (I honestly have no clue whatsoever why the
> hardware works this way), the calibration data is on a host flash
> partition, not on the minipcie device's ROM or flash or whatever it is.

The hardware works this way because it's what's being chosen at
manufacturing time.

It _used_ to be this way because then the manufacturers could choose
whether to put the serial EEPROM on the wireless card or on board - or
just save that particular component and load in the same data from the
existing SPI flash chip that holds the firmware.

With OTP they'd have to include writing OTP data out to the chip as
part of the manufacturing process, rather than just "load in data via
JTAG or uboot".

It also means they can re-do the calibration or configuration space
for the device rather than the "One Time Programmable" bits which (a)
will eventually run out of space for programming, (b) occasionally may
error during programming, or (c) may end up writing the wrong data
during programming time, making a chip or a whole batch of chips
useless.

> Needless to say, the mainline ath10k driver won't load on it.  (An old
> version used to load without calibration data.  It didn't work very well.)

I'm surprised it worked at all. :)



-a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
