Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x233.google.com ([2607:f8b0:400c:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNsa3-0007bp-UE
 for ath10k@lists.infradead.org; Wed, 12 Mar 2014 23:29:00 +0000
Received: by mail-vc0-f179.google.com with SMTP id ij19so252357vcb.38
 for <ath10k@lists.infradead.org>; Wed, 12 Mar 2014 16:28:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <532084C3.8060904@candelatech.com>
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <871tzq210z.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmomkfvaTm+=Du8FqCC=b=UG2d=8ixUK2tUsFj4_dsRL4Pg@mail.gmail.com>
 <CAHqTa-3O0_5OcTKNi0KLa--63ZYO4o7qK=VsN7Bsyi0nX+rF7g@mail.gmail.com>
 <CAHqTa-2kUJ1hrc8c2Kqy+cGexPJdisTMuUTH8WQ5KqV9qURwMw@mail.gmail.com>
 <871ty9jijp.fsf@kamboji.qca.qualcomm.com> <531F5D6F.6060801@candelatech.com>
 <87pplrg71t.fsf@kamboji.qca.qualcomm.com> <532084C3.8060904@candelatech.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Wed, 12 Mar 2014 18:28:17 -0500
Message-ID: <CAHqTa-01MAbTh4ekq8+u-uG_cH=o9SCkpC-fWuMfsPDmfAMCow@mail.gmail.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Wed, Mar 12, 2014 at 11:01 AM, Ben Greear <greearb@candelatech.com> wrote:
> Come to think of it, I'm not sure I've seen a hard lockup of the machine
> on non CUS223 machines, but I have seen cases where non CUS223 NIC wedges
> and the existing restart does not recover it.
>
> This requires a reboot to recover from.

That's not so surprising; the current driver doesn't do the cold reset
that is the only thing you can recover from a wedge, I guess because
of the CUS223 bug.

Stupid question: can I honestly just buy a different module and make
my PCIe crashiness problems go away?  Is there a reason do prefer the
CUS223?

Another question: is there perhaps anything the firmware can do to eg.
set a watchdog timer, so that the internal CPU will restart (go back
to "waiting for firmware" mode) if it doesn't answer for a while?  The
idea would be for the device to un-wedge itself even if there's
nothing we can do to fix it from outside.

Thanks,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
