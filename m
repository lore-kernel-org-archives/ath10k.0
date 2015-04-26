Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YmNGv-0001XU-St
 for ath10k@lists.infradead.org; Sun, 26 Apr 2015 14:11:03 +0000
Received: from [192.168.69.6] ([79.44.224.230]) by mail.gmx.com (mrgmx102)
 with ESMTPSA (Nemesis) id 0M8axL-1ZZNBG0FZT-00wDYU for
 <ath10k@lists.infradead.org>; Sun, 26 Apr 2015 16:10:37 +0200
Message-ID: <553CF1EE.50807@gmx.com>
Date: Sun, 26 Apr 2015 16:10:54 +0200
From: Gabriele Martino <g.martino@gmx.com>
MIME-Version: 1.0
Subject: Re: QCA6174 hw2.1?
References: <trinity-d51578c9-4e28-4805-b58e-fdd5388949da-1426217948333@msvc-mesg-gmx002>
 <CA+BoTQnGQC9sy_Qhiv4peeRsF2dY+2yd12GTgJpyRhrgMTg+Yw@mail.gmail.com>
 <trinity-2097dd2e-b8b3-40c5-9eed-c0dc7d8690af-1426260485155@3capp-mailcom-lxa11>
 <CA+BoTQnKJE0w0SZrh-p2KaKe62t4=cRLnjeKu+t9aeE+LFce-w@mail.gmail.com>
 <loom.20150425T025815-684@post.gmane.org>
 <CAJAVYN208PQpnt5oQPi1hdYW71WMVJReBNSY-OqZ9aCb0yuiaA@mail.gmail.com>
 <553B8F89.4040908@gmx.com>
 <CAJAVYN1XKYdGqx4pzg3C9kSxj6_qwr4raoDJm7e+VLy1P=dsdw@mail.gmail.com>
In-Reply-To: <CAJAVYN1XKYdGqx4pzg3C9kSxj6_qwr4raoDJm7e+VLy1P=dsdw@mail.gmail.com>
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
To: ath10k@lists.infradead.org

Hi Corin,
the "dissect.py" script seems to work better than the "disassemble.py":

[ 6483.455435] ath10k_pci 0000:03:00.0: pci irq msi-x interrupts 8
irq_mode 0 reset_mode 0
[ 6483.600747] ath10k_pci 0000:03:00.0: Direct firmware load for
ath10k/cal-pci-0000:03:00.0.bin failed with error -2
[ 6484.772417] ath10k_pci 0000:03:00.0: firmware crashed! (uuid n/a)
[ 6484.772433] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000,
0x003405ff) fw killer-n1525-fw api 4 htt 0.0 wmi 4 cal otp max_sta 32
[ 6484.772435] ath10k_pci 0000:03:00.0: debug 1 debugfs 0 tracing 0 dfs
0 testmode 0
[ 6484.773333] ath10k_pci 0000:03:00.0: firmware register dump:
[ 6484.773333] ath10k_pci 0000:03:00.0: [00]: 0x05010000 0x000015B3
0x0095186B 0x00955B31
[ 6484.773333] ath10k_pci 0000:03:00.0: [04]: 0x0095186B 0x00060130
0x00000010 0x0040AF04
[ 6484.773333] ath10k_pci 0000:03:00.0: [08]: 0x00000018 0x00000001
0x00000001 0x00412250
[ 6484.773333] ath10k_pci 0000:03:00.0: [12]: 0x00000009 0x00000000
0x0096C09C 0x0096C0A7
[ 6484.773333] ath10k_pci 0000:03:00.0: [16]: 0x0096BDBC 0x009286B6
0x00000000 0x00000000
[ 6484.773333] ath10k_pci 0000:03:00.0: [20]: 0x4095186B 0x0040E160
0x0041F82C 0x00000001
[ 6484.773333] ath10k_pci 0000:03:00.0: [24]: 0x80936238 0x0040E1C0
0x00000000 0xC095186B
[ 6484.773333] ath10k_pci 0000:03:00.0: [28]: 0x80936361 0x0040E1E0
0x00000000 0x0041C8DC
[ 6484.773333] ath10k_pci 0000:03:00.0: [32]: 0x80934A67 0x0040E200
0x00436DF0 0x0040E250
[ 6484.773333] ath10k_pci 0000:03:00.0: [36]: 0x809A5C92 0x0040E250
0x004275B0 0x00000001
[ 6484.773333] ath10k_pci 0000:03:00.0: [40]: 0x809A5CEA 0x0040E290
0x00426F40 0x00000004
[ 6484.773333] ath10k_pci 0000:03:00.0: [44]: 0x809A5DCA 0x0040E2B0
0x00426F40 0x0041C8DC
[ 6484.773333] ath10k_pci 0000:03:00.0: [48]: 0x800A0909 0x0040E2D0
0x00426F40 0x004275A0
[ 6484.773333] ath10k_pci 0000:03:00.0: [52]: 0x800A024A 0x0040E2F0
0x0041ABB0 0x00420440
[ 6484.773333] ath10k_pci 0000:03:00.0: [56]: 0x809287D9 0x0040E310
0x00000000 0x00400000
[ 6485.765040] ath10k_pci 0000:03:00.0: failed to receive control
response completion, polling..
[ 6486.765027] ath10k_pci 0000:03:00.0: ctl_resp never came in (-110)
[ 6486.765032] ath10k_pci 0000:03:00.0: failed to connect to HTC: -110
[ 6486.828658] ath10k_pci 0000:03:00.0: could not init core (-110)
[ 6486.828689] ath10k_pci 0000:03:00.0: could not probe fw (-110)
[ 6486.831175] ath10k_pci 0000:03:00.0: cannot restart a device that
hasn't been started

Well, at least it loads correctly. This should be the firmware crash
fixed in the patches, it's time to test kvalo's kernel sources.


On 26/04/2015 05:51, Corin Lawson wrote:
> Hi Gabriele,
>
> I think we have the same card (the vendor and device ids are the
> determining factor):
>
>     $ lspci -n -s 05:00.0
>     05:00.0 0280: 168c:003e (rev 20)
>
> Without the skip_otp option I get this in dmesg:
>
>     [18396.622576] ath10k_pci 0000:05:00.0: pci irq msi interrupts 1
> irq_mode 0 reset_mode 0
>     [18396.768593] ath10k_pci 0000:05:00.0: Direct firmware load for
> ath10k/cal-pci-0000:05:00.0.bin failed with error -2
>     [18396.847975] ath10k_pci 0000:05:00.0: otp calibration failed: 3
>     [18396.847977] ath10k_pci 0000:05:00.0: failed to run otp: -22
>     [18396.847978] ath10k_pci 0000:05:00.0: could not init core (-22)
>     [18396.847995] ath10k_pci 0000:05:00.0: could not probe fw (-22)
>
> Which is different to your messages. I'm taking a guess here, but
> those DMAR messages seem to indicate that the firmware is attempting
> to write to the wrong part of memory (i.e. wrong firmware).
>
> Using kvalo's kernel fork is probably a good step (it contains those
> necessary patches). If you still don't get it working, then my only
> other idea is to try that dissect.py gist I mentioned previously. Here
> are the commands that worked for me:
>
>     # python dissect.py <
> drivers/Production/Windows8.1-x64/k1525w81/qca61x420.bin
>     # python assemble.py killer-n1525-fw 0 fw-2.bin fw-1.bin 4 >
> /lib/firmware/ath10k/QCA6174/hw2.1/firmware-4.bin
>
> The dissect.py script produced fw-1.bin which is the otp file and
> fw-2.bin which is the correct firmware (don't quote me on that, but it
> worked for me). As for your board.bin file, you need to check the .inf
> file that comes with your drivers. I'm not sure what the structure of
> that file is... for all I know I could be using the wrong board
> file...
>
> I hope this helps, otherwise you've reached the limits of my
> experience :) Maybe someone else on the list has a better idea?
>
> Cheers,
> Corin
>
>
> On Sat, Apr 25, 2015 at 10:58 PM, Gabriele Martino <g.martino@gmx.com> wrote:
>> On 25/04/2015 05:47, Corin Lawson wrote:
>>> I also had problems with calibration, I had to pass skip_otp=y to the module:
>>>
>>>     $ cat /etc/modprobe.d/ath10k.conf
>>>     options ath10k_core skip_otp=y
>> Hi Corin,
>> I removed ath10k_pci, ath10k_core and ath before loading ath10k_core
>> with skip_otp=1, but nothing happened:
>>
>> [ 1808.473874] ath10k_pci 0000:03:00.0: pci irq msi-x interrupts 8
>> irq_mode 0 reset_mode 0
>> [ 1808.618770] ath10k_pci 0000:03:00.0: Direct firmware load for
>> ath10k/cal-pci-0000:03:00.0.bin failed with error -2
>> [ 1808.687492] dmar: DRHD: handling fault status reg 2
>> [ 1808.687506] dmar: DMAR:[DMA Write] Request device [03:00.0] fault
>> addr 7ee00000
>>                DMAR:[fault reason 05] PTE Write access is not set
>> [ 1809.688015] ath10k_pci 0000:03:00.0: unable to write to the device
>> [ 1809.688018] ath10k_pci 0000:03:00.0: failed to download normal
>> firmware: -110
>> [ 1809.688020] ath10k_pci 0000:03:00.0: could not init core (-110)
>> [ 1809.688054] ath10k_pci 0000:03:00.0: could not probe fw (-110)
>>
>> I assembled the otp.bin with fw.bin to get the blob, so I'm not sure
>> skip_otp will fix this...
>> Now I'm cloning the kvalo's kernel tree, this should be faster than
>> picking the single patches.
>>
>>> FWIW:
>>>
>>>     $ lspci -vs 05:00.0
>>>     05:00.0 Network controller: Qualcomm Atheros Device 003e (rev 20)
>>>             Subsystem: Bigfoot Networks, Inc. Device 1525
>>>             Flags: bus master, fast devsel, latency 0, IRQ 31
>>>             Memory at f7800000 (64-bit, non-prefetchable) [size=2M]
>>>             Capabilities: <access denied>
>>>             Kernel driver in use: ath10k_pci
>>>             Kernel modules: ath10k_pci
>> Well, mine seems a bit different:
>>
>> 03:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless
>> Network Adapter (rev 20)
>>         Subsystem: Bigfoot Networks, Inc. Killer N1525 Wireless-AC
>>         Flags: bus master, fast devsel, latency 0, IRQ 32
>>         Memory at f6800000 (64-bit, non-prefetchable) [size=2M]
>>         Capabilities: [40] Power Management version 3
>>         Capabilities: [50] MSI: Enable+ Count=8/8 Maskable+ 64bit-
>>         Capabilities: [70] Express Endpoint, MSI 00
>>         Capabilities: [100] Advanced Error Reporting
>>         Capabilities: [148] Virtual Channel
>>         Capabilities: [168] Device Serial Number 00-00-00-00-00-00-00-00
>>         Capabilities: [178] Latency Tolerance Reporting
>>         Capabilities: [180] L1 PM Substates
>>         Kernel driver in use: ath10k_pci
>>         Kernel modules: ath10k_pci
>>
>>> I would interested in knowing from where you got your drivers/board
>>> files. I had to download mine from my laptop manufacturer's (MSI)
>>> website.
>> I mounted the preinstalled Windows 8 partition on /mnt and run:
>> find /mnt -iname '*.bin'
>>
>> The same files can be found inside the driver installer on the Alienware
>> (Dell) website.
>>
>> Regards,
>> Gabriele
>>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

-- 

*Gabriele Martino*

Linux Sysadmin & Web Development

g.martino@gmx.com



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
