Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xa5ld-0006A8-8y
 for ath10k@lists.infradead.org; Fri, 03 Oct 2014 16:31:42 +0000
Received: by mail-lb0-f178.google.com with SMTP id w7so1333735lbi.9
 for <ath10k@lists.infradead.org>; Fri, 03 Oct 2014 09:31:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2386503.dNPayhXJTQ@wuerfel>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
 <87ppeamvr9.fsf@kamboji.qca.qualcomm.com>
 <542DA1F7.9090904@amacapital.net> <2386503.dNPayhXJTQ@wuerfel>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 3 Oct 2014 09:24:08 -0700
Message-ID: <CALCETrVMrRA8AQ_nVui-MMy9R9FkRjz7tNYKp14OpPK-CQarHQ@mail.gmail.com>
Subject: Re: ath10k: calibration data through Device Tree?
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Fri, Oct 3, 2014 at 8:29 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thursday 02 October 2014 12:05:27 Andy Lutomirski wrote:
>> On 10/02/2014 06:44 AM, Kalle Valo wrote:
>> > Hi Mark,
>> >
>> > Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:
>> >
>> >>> ath10k is a wireless driver for Qualcomm Atheros 802.11ac hardware and
>> >>> located in drivers/net/wireless/ath/ath10k/. Currently it only supports
>> >>> PCI devices.
>> >>>
>> >>> Some of the devices store the calibration data to the host flash and the
>> >>> bootloader reads the data from the flash. And now we need a method to
>> >>> deliver the calibration data from bootloader to ath10k.
>> >>
>> >> What does this calibration data consist of?
>> >
>> > From ath10k point of view it's just a binary blob which we push to the
>> > firmware before we start it. ath10k does not parse it in any way.
>> >
>> >> What happens if you don't have the calibration data? Is it a critical
>> >> requirement for the use of the device, or does its absence simply result
>> >> in degraded performance?
>> >
>> > From my point of view the device should not be used if it doesn't
>> > contain the correct calibration data. I guess it could work somehow but
>> > there's no guarantee about the perfomance.
>> >
>> >> What do you do on non-DT systems? Where does the information come from
>> >> in that case?
>> >
>> > Currently ath10k only supports having the calibration data in the OTP
>> > area inside the QCA98XX chip. But some manufacturers want to store it on
>> > the host file, I assume because of the flexibility it provides. And
>> > that's why we have the need for Device Tree support.
>>
>> To give an actual concrete example that might be what Kalle is talking
>> about:
>>
>> I have a TP-Link Archer C7, which has a mips cpu and an ath10k minipcie
>> device.  For whatever reason (I honestly have no clue whatsoever why the
>> hardware works this way), the calibration data is on a host flash
>> partition, not on the minipcie device's ROM or flash or whatever it is.
>
> Just to clarify: is this data specific to the design of the device and
> identical for all parts in a manufacture run, or does each individual
> board have to be calibrated separately?

Each board has separate data.  (Even the MAC address is in this blob
on my device.)

--Andy

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
