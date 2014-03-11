Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNHll-0003Hr-M0
 for ath10k@lists.infradead.org; Tue, 11 Mar 2014 08:10:38 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k driver crashes whenever firmware crashes on ARM SoC
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <871tzq210z.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmomkfvaTm+=Du8FqCC=b=UG2d=8ixUK2tUsFj4_dsRL4Pg@mail.gmail.com>
 <CAHqTa-3O0_5OcTKNi0KLa--63ZYO4o7qK=VsN7Bsyi0nX+rF7g@mail.gmail.com>
 <CAHqTa-2kUJ1hrc8c2Kqy+cGexPJdisTMuUTH8WQ5KqV9qURwMw@mail.gmail.com>
 <871ty9jijp.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-135UdAuQ8AQZOEPqAfv2erkS-eSa1+T8skS5aMNHFp+g@mail.gmail.com>
Date: Tue, 11 Mar 2014 10:10:01 +0200
In-Reply-To: <CAHqTa-135UdAuQ8AQZOEPqAfv2erkS-eSa1+T8skS5aMNHFp+g@mail.gmail.com>
 (Avery Pennarun's message of "Tue, 11 Mar 2014 02:40:15 -0500")
Message-ID: <87wqg1i2au.fsf@kamboji.qca.qualcomm.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Avery Pennarun <apenwarr@gmail.com> writes:

> On Tue, Mar 11, 2014 at 2:33 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
>> I showed your analysis to an HW engineer and the response I got was
>> "don't do that" (= don't use the cold reset). As you know, we now have a
>> workaround using the warm reset:
>>
>> 00f5482bcd94 ath10k: suspend hardware before reset
>> 9042e17df834 ath10k: refactor suspend/resume functions
>> fc36e3ffcdd0 ath10k: fix device initialization routine
>>
>> Have you tested these? Did they help at all?
>
> Yes, I've tested them and they help, mainly by doing the cold reset
> less often.  However, when the firmware hard crashes in certain ways
> (for example, using my original test case), it looks like warm reset
> can't fix that.  The driver then still must fall back to cold reset
> and, some fairly large percentage of the time (1/3rd?), crashes the
> bus.

Ok, thanks. I'll investigate more about the warm reset problems and try
to find ways to make it more reliable.

> We do have a separate reset line controlled by a GPIO.  Using that
> crashes the SoC's PCIe host implementation (whee!).  But I got help
> from the SoC manufacturer and was able to get some instructions for
> resetting their PCIe host controller.  When I do all the magic
> incantations in the right order, the system can recover, albeit with a
> fully reset ath10k chip.  This workaround is unfortunately specific to
> the host device platform so it won't do you much good.
>
> Of course, a good way to avoid the problem is "don't crash the
> firmware then," but that's not as robust as I'd like.

I never trust the firmware, in any device, and that's why I would like
to have in ath10k 100% reliable way to restart it from host.

> This box is doing quite a few things, so rebooting to fix a problem on
> one of the wireless cards is pretty expensive.

Yeah, that would be really bad. Restarting the firmware will take
something like 1-2 seconds and the user would only notice a small pause
in data traffic, a much better solution than rebooting the whole box.

> Nevertheless, the warm reset changes really do reduce the frequency of
> this a lot, to the point where my workaround is almost never needed.
> Thanks for that!

Great, thanks for the feedback.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
