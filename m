Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YmDbo-0001hZ-VP
 for ath10k@lists.infradead.org; Sun, 26 Apr 2015 03:51:57 +0000
Received: by igblo3 with SMTP id lo3so40783170igb.1
 for <ath10k@lists.infradead.org>; Sat, 25 Apr 2015 20:51:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <553B8F89.4040908@gmx.com>
References: <trinity-d51578c9-4e28-4805-b58e-fdd5388949da-1426217948333@msvc-mesg-gmx002>
 <CA+BoTQnGQC9sy_Qhiv4peeRsF2dY+2yd12GTgJpyRhrgMTg+Yw@mail.gmail.com>
 <trinity-2097dd2e-b8b3-40c5-9eed-c0dc7d8690af-1426260485155@3capp-mailcom-lxa11>
 <CA+BoTQnKJE0w0SZrh-p2KaKe62t4=cRLnjeKu+t9aeE+LFce-w@mail.gmail.com>
 <loom.20150425T025815-684@post.gmane.org>
 <CAJAVYN208PQpnt5oQPi1hdYW71WMVJReBNSY-OqZ9aCb0yuiaA@mail.gmail.com>
 <553B8F89.4040908@gmx.com>
From: Corin Lawson <me@corinlawson.com.au>
Date: Sun, 26 Apr 2015 13:51:13 +1000
Message-ID: <CAJAVYN1XKYdGqx4pzg3C9kSxj6_qwr4raoDJm7e+VLy1P=dsdw@mail.gmail.com>
Subject: Re: QCA6174 hw2.1?
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
To: Gabriele Martino <g.martino@gmx.com>
Cc: ath10k <ath10k@lists.infradead.org>

Hi Gabriele,

I think we have the same card (the vendor and device ids are the
determining factor):

    $ lspci -n -s 05:00.0
    05:00.0 0280: 168c:003e (rev 20)

Without the skip_otp option I get this in dmesg:

    [18396.622576] ath10k_pci 0000:05:00.0: pci irq msi interrupts 1
irq_mode 0 reset_mode 0
    [18396.768593] ath10k_pci 0000:05:00.0: Direct firmware load for
ath10k/cal-pci-0000:05:00.0.bin failed with error -2
    [18396.847975] ath10k_pci 0000:05:00.0: otp calibration failed: 3
    [18396.847977] ath10k_pci 0000:05:00.0: failed to run otp: -22
    [18396.847978] ath10k_pci 0000:05:00.0: could not init core (-22)
    [18396.847995] ath10k_pci 0000:05:00.0: could not probe fw (-22)

Which is different to your messages. I'm taking a guess here, but
those DMAR messages seem to indicate that the firmware is attempting
to write to the wrong part of memory (i.e. wrong firmware).

Using kvalo's kernel fork is probably a good step (it contains those
necessary patches). If you still don't get it working, then my only
other idea is to try that dissect.py gist I mentioned previously. Here
are the commands that worked for me:

    # python dissect.py <
drivers/Production/Windows8.1-x64/k1525w81/qca61x420.bin
    # python assemble.py killer-n1525-fw 0 fw-2.bin fw-1.bin 4 >
/lib/firmware/ath10k/QCA6174/hw2.1/firmware-4.bin

The dissect.py script produced fw-1.bin which is the otp file and
fw-2.bin which is the correct firmware (don't quote me on that, but it
worked for me). As for your board.bin file, you need to check the .inf
file that comes with your drivers. I'm not sure what the structure of
that file is... for all I know I could be using the wrong board
file...

I hope this helps, otherwise you've reached the limits of my
experience :) Maybe someone else on the list has a better idea?

Cheers,
Corin


On Sat, Apr 25, 2015 at 10:58 PM, Gabriele Martino <g.martino@gmx.com> wrote:
> On 25/04/2015 05:47, Corin Lawson wrote:
>> I also had problems with calibration, I had to pass skip_otp=y to the module:
>>
>>     $ cat /etc/modprobe.d/ath10k.conf
>>     options ath10k_core skip_otp=y
> Hi Corin,
> I removed ath10k_pci, ath10k_core and ath before loading ath10k_core
> with skip_otp=1, but nothing happened:
>
> [ 1808.473874] ath10k_pci 0000:03:00.0: pci irq msi-x interrupts 8
> irq_mode 0 reset_mode 0
> [ 1808.618770] ath10k_pci 0000:03:00.0: Direct firmware load for
> ath10k/cal-pci-0000:03:00.0.bin failed with error -2
> [ 1808.687492] dmar: DRHD: handling fault status reg 2
> [ 1808.687506] dmar: DMAR:[DMA Write] Request device [03:00.0] fault
> addr 7ee00000
>                DMAR:[fault reason 05] PTE Write access is not set
> [ 1809.688015] ath10k_pci 0000:03:00.0: unable to write to the device
> [ 1809.688018] ath10k_pci 0000:03:00.0: failed to download normal
> firmware: -110
> [ 1809.688020] ath10k_pci 0000:03:00.0: could not init core (-110)
> [ 1809.688054] ath10k_pci 0000:03:00.0: could not probe fw (-110)
>
> I assembled the otp.bin with fw.bin to get the blob, so I'm not sure
> skip_otp will fix this...
> Now I'm cloning the kvalo's kernel tree, this should be faster than
> picking the single patches.
>
>> FWIW:
>>
>>     $ lspci -vs 05:00.0
>>     05:00.0 Network controller: Qualcomm Atheros Device 003e (rev 20)
>>             Subsystem: Bigfoot Networks, Inc. Device 1525
>>             Flags: bus master, fast devsel, latency 0, IRQ 31
>>             Memory at f7800000 (64-bit, non-prefetchable) [size=2M]
>>             Capabilities: <access denied>
>>             Kernel driver in use: ath10k_pci
>>             Kernel modules: ath10k_pci
> Well, mine seems a bit different:
>
> 03:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless
> Network Adapter (rev 20)
>         Subsystem: Bigfoot Networks, Inc. Killer N1525 Wireless-AC
>         Flags: bus master, fast devsel, latency 0, IRQ 32
>         Memory at f6800000 (64-bit, non-prefetchable) [size=2M]
>         Capabilities: [40] Power Management version 3
>         Capabilities: [50] MSI: Enable+ Count=8/8 Maskable+ 64bit-
>         Capabilities: [70] Express Endpoint, MSI 00
>         Capabilities: [100] Advanced Error Reporting
>         Capabilities: [148] Virtual Channel
>         Capabilities: [168] Device Serial Number 00-00-00-00-00-00-00-00
>         Capabilities: [178] Latency Tolerance Reporting
>         Capabilities: [180] L1 PM Substates
>         Kernel driver in use: ath10k_pci
>         Kernel modules: ath10k_pci
>
>> I would interested in knowing from where you got your drivers/board
>> files. I had to download mine from my laptop manufacturer's (MSI)
>> website.
> I mounted the preinstalled Windows 8 partition on /mnt and run:
> find /mnt -iname '*.bin'
>
> The same files can be found inside the driver installer on the Alienware
> (Dell) website.
>
> Regards,
> Gabriele
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
