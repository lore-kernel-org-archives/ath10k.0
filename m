Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22f.google.com ([2607:f8b0:400c:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNHJ2-0002Z7-WA
 for ath10k@lists.infradead.org; Tue, 11 Mar 2014 07:40:57 +0000
Received: by mail-vc0-f175.google.com with SMTP id lh14so6178557vcb.34
 for <ath10k@lists.infradead.org>; Tue, 11 Mar 2014 00:40:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <871ty9jijp.fsf@kamboji.qca.qualcomm.com>
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <871tzq210z.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmomkfvaTm+=Du8FqCC=b=UG2d=8ixUK2tUsFj4_dsRL4Pg@mail.gmail.com>
 <CAHqTa-3O0_5OcTKNi0KLa--63ZYO4o7qK=VsN7Bsyi0nX+rF7g@mail.gmail.com>
 <CAHqTa-2kUJ1hrc8c2Kqy+cGexPJdisTMuUTH8WQ5KqV9qURwMw@mail.gmail.com>
 <871ty9jijp.fsf@kamboji.qca.qualcomm.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 11 Mar 2014 02:40:15 -0500
Message-ID: <CAHqTa-135UdAuQ8AQZOEPqAfv2erkS-eSa1+T8skS5aMNHFp+g@mail.gmail.com>
Subject: Re: ath10k driver crashes whenever firmware crashes on ARM SoC
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
Cc: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tue, Mar 11, 2014 at 2:33 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Avery Pennarun <apenwarr@gmail.com> writes:
>> On Wed, Jan 29, 2014 at 9:41 PM, Avery Pennarun <apenwarr@gmail.com> wrote:
>>> Still chasing around some people to get a PCIe bus analyzer set up.
>>
>> Okay, I finally managed to get enough parts put together to look at
>> the PCIe bus.  To make things a little more clear, I added a macro
>> that does essentially:
>>
>>    pci_write_config_dword(0, 0x80000000 | __LINE__)
>>    mdelay(1);
>>    pci_write_config_dword(0, __LINE__)
>>
>> ...at various points in the code.  This way I can see precisely what
>> was the most recent PCIe transaction before the crash.
>>
>> I'm not super familiar with PCIe, but what I think I'm seeing is:
>>
>> - the firmware does not need to be loaded yet; sometimes I can crash
>> it just by doing a cold reset right at driver load time.  So the good
>> news is, the firmware code is not related.
>>
>> - the crash is always in ath10k_pci_device_reset
>
> [...]
>
>> Does this ring a bell for anyone?  I think I can also export the
>> traces as csv in case someone wants to look at them.
>
> I showed your analysis to an HW engineer and the response I got was
> "don't do that" (= don't use the cold reset). As you know, we now have a
> workaround using the warm reset:
>
> 00f5482bcd94 ath10k: suspend hardware before reset
> 9042e17df834 ath10k: refactor suspend/resume functions
> fc36e3ffcdd0 ath10k: fix device initialization routine
>
> Have you tested these? Did they help at all?

Yes, I've tested them and they help, mainly by doing the cold reset
less often.  However, when the firmware hard crashes in certain ways
(for example, using my original test case), it looks like warm reset
can't fix that.  The driver then still must fall back to cold reset
and, some fairly large percentage of the time (1/3rd?), crashes the
bus.

We do have a separate reset line controlled by a GPIO.  Using that
crashes the SoC's PCIe host implementation (whee!).  But I got help
from the SoC manufacturer and was able to get some instructions for
resetting their PCIe host controller.  When I do all the magic
incantations in the right order, the system can recover, albeit with a
fully reset ath10k chip.  This workaround is unfortunately specific to
the host device platform so it won't do you much good.

Of course, a good way to avoid the problem is "don't crash the
firmware then," but that's not as robust as I'd like.  This box is
doing quite a few things, so rebooting to fix a problem on one of the
wireless cards is pretty expensive.

Nevertheless, the warm reset changes really do reduce the frequency of
this a lot, to the point where my workaround is almost never needed.
Thanks for that!

Have fun,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
