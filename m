Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNHCe-0002Rc-LA
 for ath10k@lists.infradead.org; Tue, 11 Mar 2014 07:34:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k driver crashes whenever firmware crashes on ARM SoC
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <871tzq210z.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmomkfvaTm+=Du8FqCC=b=UG2d=8ixUK2tUsFj4_dsRL4Pg@mail.gmail.com>
 <CAHqTa-3O0_5OcTKNi0KLa--63ZYO4o7qK=VsN7Bsyi0nX+rF7g@mail.gmail.com>
 <CAHqTa-2kUJ1hrc8c2Kqy+cGexPJdisTMuUTH8WQ5KqV9qURwMw@mail.gmail.com>
Date: Tue, 11 Mar 2014 09:33:46 +0200
In-Reply-To: <CAHqTa-2kUJ1hrc8c2Kqy+cGexPJdisTMuUTH8WQ5KqV9qURwMw@mail.gmail.com>
 (Avery Pennarun's message of "Sun, 9 Feb 2014 03:00:45 -0500")
Message-ID: <871ty9jijp.fsf@kamboji.qca.qualcomm.com>
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

> On Wed, Jan 29, 2014 at 9:41 PM, Avery Pennarun <apenwarr@gmail.com> wrote:
>> Still chasing around some people to get a PCIe bus analyzer set up.
>
> Okay, I finally managed to get enough parts put together to look at
> the PCIe bus.  To make things a little more clear, I added a macro
> that does essentially:
>
>    pci_write_config_dword(0, 0x80000000 | __LINE__)
>    mdelay(1);
>    pci_write_config_dword(0, __LINE__)
>
> ...at various points in the code.  This way I can see precisely what
> was the most recent PCIe transaction before the crash.
>
> I'm not super familiar with PCIe, but what I think I'm seeing is:
>
> - the firmware does not need to be loaded yet; sometimes I can crash
> it just by doing a cold reset right at driver load time.  So the good
> news is, the firmware code is not related.
>
> - the crash is always in ath10k_pci_device_reset

[...]

> Does this ring a bell for anyone?  I think I can also export the
> traces as csv in case someone wants to look at them.

I showed your analysis to an HW engineer and the response I got was
"don't do that" (= don't use the cold reset). As you know, we now have a
workaround using the warm reset:

00f5482bcd94 ath10k: suspend hardware before reset
9042e17df834 ath10k: refactor suspend/resume functions
fc36e3ffcdd0 ath10k: fix device initialization routine

Have you tested these? Did they help at all?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
