Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1etwYJ-0004v5-LI
 for ath10k@lists.infradead.org; Thu, 08 Mar 2018 14:29:53 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v12] ath10k: add LED and GPIO controlling support for
 various chipsets
References: <20180226084406.2093-1-s.gottschall@dd-wrt.com>
 <CACna6rzD6z3DC6yjMCgBxgxx+DF+GGu69Ot5QA6xpJ41Ewb2=A@mail.gmail.com>
 <82d8ac0c-b391-6099-4c7f-991cc35445aa@dd-wrt.com>
 <20180302090312.GA30267@amd>
 <e77d25d4-a824-380a-c51a-e81175ba6205@dd-wrt.com>
 <CACna6rys85VEkzRGDVUAkBy7KgHS2y0DET7YvedboX-YEQHrkg@mail.gmail.com>
 <890a4dcc-f549-6487-2ce5-3b62874cd266@dd-wrt.com>
 <20180308090216.GC17761@amd>
 <d443856e-cfc8-2d50-900d-edf22e5360e3@dd-wrt.com>
 <20180308140515.GA4889@amd>
Date: Thu, 08 Mar 2018 16:29:36 +0200
In-Reply-To: <20180308140515.GA4889@amd> (Pavel Machek's message of "Thu, 8
 Mar 2018 15:05:16 +0100")
Message-ID: <87371ahc8f.fsf@kamboji.qca.qualcomm.com>
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
To: Pavel Machek <pavel@ucw.cz>
Cc: =?utf-8?Q?Rafa=C5=82?= =?utf-8?Q?_Mi=C5=82ecki?= <zajec5@gmail.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Sebastian Gottschall <s.gottschall@dd-wrt.com>, Sebastian Gottschall <s.gottschall@newmedia-net.de>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>

Pavel Machek <pavel@ucw.cz> writes:

>> >>>ath10k_leds.gpio = ar->hw_params.led_pin;
>> >>>gpio_led_register_device(0, &ath10k_leds);
>> >>
>> >>the problem are other architectures which have already registered gpio_led
>> >>at system start like ar71xx
>> >>you cannot register a second one. so a independend led driver is a
>> >>requirement for direct control
>> >
>> >If the limitation indeed exists, please fix the limitation rather than
>> >working around it in each and every driver.
>> see ath9k. its exact the same implementation.
>
> Ok, so one more driver to fix.
>
>> in addition my variant does also work without gpiolib support. so it
>> can be used even if the kernel is configured without gpio support.
>> and not to forget, using a own led driver is more ligthweight from
>> the call path for each led on / off event which is important for low
>> performance embedded devices
>
> We are not going to copy&paste code because such code works without
> libraries, and we are not going to copy&paste code because that uses
> less cache during calls. Sorry.
>
> NAK. Please fix your patch. 

To me it's not that black and white, sometimes copying code is simpler
than trying to bring up complicated or restricting frameworks (talking
in general here).

I haven't been able to review this patch in detail yet but from a quick
look most of the code is about standard ath10k infrastructure code. How
many lines of code would using leds-gpio save?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
