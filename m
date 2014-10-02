Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZghI-0000qm-8t
 for ath10k@lists.infradead.org; Thu, 02 Oct 2014 13:45:32 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k: calibration data through Device Tree?
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
 <20141002132914.GN5788@leverpostej>
Date: Thu, 2 Oct 2014 16:44:26 +0300
In-Reply-To: <20141002132914.GN5788@leverpostej> (Mark Rutland's message of
 "Thu, 2 Oct 2014 14:29:15 +0100")
Message-ID: <87ppeamvr9.fsf@kamboji.qca.qualcomm.com>
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
To: Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi Mark,

Mark Rutland <mark.rutland@arm.com> writes:

>> ath10k is a wireless driver for Qualcomm Atheros 802.11ac hardware and
>> located in drivers/net/wireless/ath/ath10k/. Currently it only supports
>> PCI devices.
>> 
>> Some of the devices store the calibration data to the host flash and the
>> bootloader reads the data from the flash. And now we need a method to
>> deliver the calibration data from bootloader to ath10k. 
>
> What does this calibration data consist of?

From ath10k point of view it's just a binary blob which we push to the
firmware before we start it. ath10k does not parse it in any way.

> What happens if you don't have the calibration data? Is it a critical
> requirement for the use of the device, or does its absence simply result
> in degraded performance?

From my point of view the device should not be used if it doesn't
contain the correct calibration data. I guess it could work somehow but
there's no guarantee about the perfomance.

> What do you do on non-DT systems? Where does the information come from
> in that case?

Currently ath10k only supports having the calibration data in the OTP
area inside the QCA98XX chip. But some manufacturers want to store it on
the host file, I assume because of the flexibility it provides. And
that's why we have the need for Device Tree support.

> I'm somewhat puzzled as to why a discoverable PCI device would require
> non-discoverable information to use.

ath9k has a similar model as well, but it doesn't support Device Tree
(at least not yet).

>> * The calibration data is now 2116 bytes, in the future it might be
>>   longer. The data is unique for each radio and is created at the
>>   factory.
>
> Why would this change in future? Who is in charge of providing this
> information, and deciding upon the format thereof?

That's up to the firmare and hardware teams working on the chipsets.
Basically ath10k just needs the data and the length of the data.

>> * ath10k must be able to reliably map the PCI device (=radio) to the
>>   correct calibration data. Maybe with using PCI bus and slot numbers?
>
> I guess we'd have to do something along those lines.
>
> I'd like to get a better understanding of the problem before we start
> figuring out how to pass an arbitrary blob of information around.

I hope my answers helped.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
