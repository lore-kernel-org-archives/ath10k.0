Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ymjaj-0000Al-Dd
 for ath10k@lists.infradead.org; Mon, 27 Apr 2015 14:01:00 +0000
Received: by wiun10 with SMTP id n10so91046199wiu.1
 for <ath10k@lists.infradead.org>; Mon, 27 Apr 2015 07:00:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <553D8112.2050300@gmx.com>
References: <trinity-d51578c9-4e28-4805-b58e-fdd5388949da-1426217948333@msvc-mesg-gmx002>
 <CA+BoTQnGQC9sy_Qhiv4peeRsF2dY+2yd12GTgJpyRhrgMTg+Yw@mail.gmail.com>
 <trinity-2097dd2e-b8b3-40c5-9eed-c0dc7d8690af-1426260485155@3capp-mailcom-lxa11>
 <CA+BoTQnKJE0w0SZrh-p2KaKe62t4=cRLnjeKu+t9aeE+LFce-w@mail.gmail.com>
 <loom.20150425T025815-684@post.gmane.org>
 <CAJAVYN208PQpnt5oQPi1hdYW71WMVJReBNSY-OqZ9aCb0yuiaA@mail.gmail.com>
 <553B8F89.4040908@gmx.com>
 <CAJAVYN1XKYdGqx4pzg3C9kSxj6_qwr4raoDJm7e+VLy1P=dsdw@mail.gmail.com>
 <553CF1EE.50807@gmx.com> <553D8112.2050300@gmx.com>
From: Moritz Morawietz <moritz.morawietz@informatik.uni-oldenburg.de>
Date: Mon, 27 Apr 2015 16:00:14 +0200
Message-ID: <CA+-y_t-L5tAYRfT5+WzbB_EvZbWDO3hys9GD8Ms7fFhT_9cy_Q@mail.gmail.com>
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
To: ath10k@lists.infradead.org

Hi!

I have the same problems with my card (also a Killer N1525). It seems
you've done it, but i can't figure out how.

Do i need to build and use kvalo's kernel, or is it enough to build
the modules ath10k_core & ath10k_pci?
I'm a bit afraid of compiling the whole kernel ^^
output of uname -a:
Linux companion 4.0.0-2-ARCH #1 SMP PREEMPT Tue Apr 14 07:14:46 CEST
2015 x86_64 GNU/Linux

I have the disassembly.py, but cannot find the dissect.py, can you
provide the link? Or, even better, the assembled files?


Many thanks for help!

Moritz

2015-04-27 2:21 GMT+02:00 Gabriele Martino <g.martino@gmx.com>:
> Just tried the kvalo's kernel.
> NetworkManager connected flawlessly at boot to my WPA2 home network on
> 2.4GHz. Will try 5GHz later.
> iwconfig reports a fixed 1Mb/s bitrate, but I can copy files to my nas
> (smb share) at about 3.3MB/s.
> That's a reasonable speed for b/g wireless.
>
> iwconfig:
> wlp3s0    IEEE 802.11abgn  ESSID:"W-I-SEE-YOU-N"
>           Mode:Managed  Frequency:2.412 GHz  Access Point:
> 40:16:7E:2C:79:90
>           Bit Rate=1 Mb/s   Tx-Power=20 dBm
>           Retry short limit:7   RTS thr:off   Fragment thr:off
>           Encryption key:off
>           Power Management:on
>           Link Quality=59/70  Signal level=-51 dBm
>           Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
>           Tx excessive retries:0  Invalid misc:42   Missed beacon:0
>
> iwlist scan (part of):
> wlp3s0    Scan completed :
>           Cell 01 - Address: 40:16:7E:2C:79:90
>                     Channel:1
>                     Frequency:2.412 GHz (Channel 1)
>                     Quality=60/70  Signal level=-50 dBm
>                     Encryption key:on
>                     ESSID:"W-I-SEE-YOU-N"
>                     Bit Rates:1 Mb/s; 2 Mb/s; 5.5 Mb/s; 11 Mb/s; 18 Mb/s
>                               24 Mb/s; 36 Mb/s; 54 Mb/s
>                     Bit Rates:6 Mb/s; 9 Mb/s; 12 Mb/s; 48 Mb/s
>                     Mode:Master
>                     Extra:tsf=00000005244f5a5d
>                     Extra: Last beacon: 33ms ago
>                     IE: Unknown: 000D572D492D5345452D594F552D4E
>                     IE: Unknown: 010882848B962430486C
>                     IE: Unknown: 030101
>                     IE: Unknown: 2A0104
>                     IE: Unknown: 2F0104
>                     IE: IEEE 802.11i/WPA2 Version 1
>                         Group Cipher : CCMP
>                         Pairwise Ciphers (1) : CCMP
>                         Authentication Suites (1) : PSK
>
> dmesg output:
> [    2.212106] ath10k_pci 0000:03:00.0: enabling device (0000 -> 0002)
> [    2.212558] ath10k_pci 0000:03:00.0: pci irq msi-x interrupts 8
> irq_mode 0 reset_mode 0
> [    2.368318] ath10k_pci 0000:03:00.0: Direct firmware load for
> ath10k/cal-pci-0000:03:00.0.bin failed with error -2
> [    2.368971] ath10k_pci 0000:03:00.0: Direct firmware load for
> ath10k/QCA6174/hw2.1/board-pci-168c:003e:1a56:1525.bin failed with error -2
> [    2.368974] ath10k_pci 0000:03:00.0: failed to load spec board file,
> falling back to generic: -2
> [    2.369252] ath10k_pci 0000:03:00.0: Direct firmware load for
> ath10k/QCA6174/hw2.1/firmware-5.bin failed with error -2
> [    2.369270] ath10k_pci 0000:03:00.0: could not fetch firmware file
> 'ath10k/QCA6174/hw2.1/firmware-5.bin': -2
> [    3.559021] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000,
> 0x003405ff, 168c:003e:1a56:1525 fallback) fw killer-n1525-fw api 4 htt
> 3.0 wmi 4 cal otp max_sta 32
> [    3.559024] ath10k_pci 0000:03:00.0: debug 1 debugfs 0 tracing 0 dfs
> 0 testmode 0
> [    3.623733] ath: EEPROM regdomain: 0x6c
> [    3.623735] ath: EEPROM indicates we should expect a direct regpair map
> [    3.623736] ath: Country alpha2 being used: 00
> [    3.623737] ath: Regpair used: 0x6c
> [    3.638102] ath10k_pci 0000:03:00.0 wlp3s0: renamed from wlan0
> [    7.523617] ath10k_pci 0000:03:00.0: no channel configured; ignoring
> frame(s)!
> [    7.627173] ath10k_pci 0000:03:00.0: no channel configured; ignoring
> frame(s)!
> [   12.149947] wlp3s0: authenticate with 40:16:7e:2c:79:90
> [   12.183915] wlp3s0: send auth to 40:16:7e:2c:79:90 (try 1/3)
> [   12.185559] wlp3s0: authenticated
> [   12.186043] wlp3s0: associate with 40:16:7e:2c:79:90 (try 1/3)
> [   12.189402] wlp3s0: RX AssocResp from 40:16:7e:2c:79:90 (capab=0x411
> status=0 aid=3)
> [   12.192174] wlp3s0: associated
> [  313.912952] wlp3s0: AP 40:16:7e:2c:79:90 changed bandwidth, new
> config is 2412 MHz, width 1 (2412/0 MHz)
> [  313.912955] wlp3s0: AP 40:16:7e:2c:79:90 changed bandwidth in a way
> we can't support - disconnect
> [  318.709453] wlp3s0: authenticate with 40:16:7e:2c:79:90
> [  318.750807] wlp3s0: send auth to 40:16:7e:2c:79:90 (try 1/3)
> [  318.752541] wlp3s0: authenticated
> [  318.753030] wlp3s0: associate with 40:16:7e:2c:79:90 (try 1/3)
> [  318.756524] wlp3s0: RX AssocResp from 40:16:7e:2c:79:90 (capab=0x411
> status=0 aid=1)
> [  318.759082] wlp3s0: associated
>
> I'm using the board file "eeprom_qca9377_1p0_NFA435_olpc.bin".
>
> Regards,
> Gabriele
>
>
> On 26/04/2015 16:10, Gabriele Martino wrote:
>> Hi Corin,
>> the "dissect.py" script seems to work better than the "disassemble.py":
>>
>> [ 6483.455435] ath10k_pci 0000:03:00.0: pci irq msi-x interrupts 8
>> irq_mode 0 reset_mode 0
>> [ 6483.600747] ath10k_pci 0000:03:00.0: Direct firmware load for
>> ath10k/cal-pci-0000:03:00.0.bin failed with error -2
>> [ 6484.772417] ath10k_pci 0000:03:00.0: firmware crashed! (uuid n/a)
>> [ 6484.772433] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000,
>> 0x003405ff) fw killer-n1525-fw api 4 htt 0.0 wmi 4 cal otp max_sta 32
>> [ 6484.772435] ath10k_pci 0000:03:00.0: debug 1 debugfs 0 tracing 0 dfs
>> 0 testmode 0
>> [ 6484.773333] ath10k_pci 0000:03:00.0: firmware register dump:
>> [ 6484.773333] ath10k_pci 0000:03:00.0: [00]: 0x05010000 0x000015B3
>> 0x0095186B 0x00955B31
>> [ 6484.773333] ath10k_pci 0000:03:00.0: [04]: 0x0095186B 0x00060130
>> 0x00000010 0x0040AF04
>> [ 6484.773333] ath10k_pci 0000:03:00.0: [08]: 0x00000018 0x00000001
>> 0x00000001 0x00412250
>> [ 6484.773333] ath10k_pci 0000:03:00.0: [12]: 0x00000009 0x00000000
>> 0x0096C09C 0x0096C0A7
>> [ 6484.773333] ath10k_pci 0000:03:00.0: [16]: 0x0096BDBC 0x009286B6
>> 0x00000000 0x00000000
>> [ 6484.773333] ath10k_pci 0000:03:00.0: [20]: 0x4095186B 0x0040E160
>> 0x0041F82C 0x00000001
>> [ 6484.773333] ath10k_pci 0000:03:00.0: [24]: 0x80936238 0x0040E1C0
>> 0x00000000 0xC095186B
>> [ 6484.773333] ath10k_pci 0000:03:00.0: [28]: 0x80936361 0x0040E1E0
>> 0x00000000 0x0041C8DC
>> [ 6484.773333] ath10k_pci 0000:03:00.0: [32]: 0x80934A67 0x0040E200
>> 0x00436DF0 0x0040E250
>> [ 6484.773333] ath10k_pci 0000:03:00.0: [36]: 0x809A5C92 0x0040E250
>> 0x004275B0 0x00000001
>> [ 6484.773333] ath10k_pci 0000:03:00.0: [40]: 0x809A5CEA 0x0040E290
>> 0x00426F40 0x00000004
>> [ 6484.773333] ath10k_pci 0000:03:00.0: [44]: 0x809A5DCA 0x0040E2B0
>> 0x00426F40 0x0041C8DC
>> [ 6484.773333] ath10k_pci 0000:03:00.0: [48]: 0x800A0909 0x0040E2D0
>> 0x00426F40 0x004275A0
>> [ 6484.773333] ath10k_pci 0000:03:00.0: [52]: 0x800A024A 0x0040E2F0
>> 0x0041ABB0 0x00420440
>> [ 6484.773333] ath10k_pci 0000:03:00.0: [56]: 0x809287D9 0x0040E310
>> 0x00000000 0x00400000
>> [ 6485.765040] ath10k_pci 0000:03:00.0: failed to receive control
>> response completion, polling..
>> [ 6486.765027] ath10k_pci 0000:03:00.0: ctl_resp never came in (-110)
>> [ 6486.765032] ath10k_pci 0000:03:00.0: failed to connect to HTC: -110
>> [ 6486.828658] ath10k_pci 0000:03:00.0: could not init core (-110)
>> [ 6486.828689] ath10k_pci 0000:03:00.0: could not probe fw (-110)
>> [ 6486.831175] ath10k_pci 0000:03:00.0: cannot restart a device that
>> hasn't been started
>>
>> Well, at least it loads correctly. This should be the firmware crash
>> fixed in the patches, it's time to test kvalo's kernel sources.
>>
>>
>> On 26/04/2015 05:51, Corin Lawson wrote:
>>> Hi Gabriele,
>>>
>>> I think we have the same card (the vendor and device ids are the
>>> determining factor):
>>>
>>>     $ lspci -n -s 05:00.0
>>>     05:00.0 0280: 168c:003e (rev 20)
>>>
>>> Without the skip_otp option I get this in dmesg:
>>>
>>>     [18396.622576] ath10k_pci 0000:05:00.0: pci irq msi interrupts 1
>>> irq_mode 0 reset_mode 0
>>>     [18396.768593] ath10k_pci 0000:05:00.0: Direct firmware load for
>>> ath10k/cal-pci-0000:05:00.0.bin failed with error -2
>>>     [18396.847975] ath10k_pci 0000:05:00.0: otp calibration failed: 3
>>>     [18396.847977] ath10k_pci 0000:05:00.0: failed to run otp: -22
>>>     [18396.847978] ath10k_pci 0000:05:00.0: could not init core (-22)
>>>     [18396.847995] ath10k_pci 0000:05:00.0: could not probe fw (-22)
>>>
>>> Which is different to your messages. I'm taking a guess here, but
>>> those DMAR messages seem to indicate that the firmware is attempting
>>> to write to the wrong part of memory (i.e. wrong firmware).
>>>
>>> Using kvalo's kernel fork is probably a good step (it contains those
>>> necessary patches). If you still don't get it working, then my only
>>> other idea is to try that dissect.py gist I mentioned previously. Here
>>> are the commands that worked for me:
>>>
>>>     # python dissect.py <
>>> drivers/Production/Windows8.1-x64/k1525w81/qca61x420.bin
>>>     # python assemble.py killer-n1525-fw 0 fw-2.bin fw-1.bin 4 >
>>> /lib/firmware/ath10k/QCA6174/hw2.1/firmware-4.bin
>>>
>>> The dissect.py script produced fw-1.bin which is the otp file and
>>> fw-2.bin which is the correct firmware (don't quote me on that, but it
>>> worked for me). As for your board.bin file, you need to check the .inf
>>> file that comes with your drivers. I'm not sure what the structure of
>>> that file is... for all I know I could be using the wrong board
>>> file...
>>>
>>> I hope this helps, otherwise you've reached the limits of my
>>> experience :) Maybe someone else on the list has a better idea?
>>>
>>> Cheers,
>>> Corin
>>>
>>>
>>> On Sat, Apr 25, 2015 at 10:58 PM, Gabriele Martino <g.martino@gmx.com> wrote:
>>>> On 25/04/2015 05:47, Corin Lawson wrote:
>>>>> I also had problems with calibration, I had to pass skip_otp=y to the module:
>>>>>
>>>>>     $ cat /etc/modprobe.d/ath10k.conf
>>>>>     options ath10k_core skip_otp=y
>>>> Hi Corin,
>>>> I removed ath10k_pci, ath10k_core and ath before loading ath10k_core
>>>> with skip_otp=1, but nothing happened:
>>>>
>>>> [ 1808.473874] ath10k_pci 0000:03:00.0: pci irq msi-x interrupts 8
>>>> irq_mode 0 reset_mode 0
>>>> [ 1808.618770] ath10k_pci 0000:03:00.0: Direct firmware load for
>>>> ath10k/cal-pci-0000:03:00.0.bin failed with error -2
>>>> [ 1808.687492] dmar: DRHD: handling fault status reg 2
>>>> [ 1808.687506] dmar: DMAR:[DMA Write] Request device [03:00.0] fault
>>>> addr 7ee00000
>>>>                DMAR:[fault reason 05] PTE Write access is not set
>>>> [ 1809.688015] ath10k_pci 0000:03:00.0: unable to write to the device
>>>> [ 1809.688018] ath10k_pci 0000:03:00.0: failed to download normal
>>>> firmware: -110
>>>> [ 1809.688020] ath10k_pci 0000:03:00.0: could not init core (-110)
>>>> [ 1809.688054] ath10k_pci 0000:03:00.0: could not probe fw (-110)
>>>>
>>>> I assembled the otp.bin with fw.bin to get the blob, so I'm not sure
>>>> skip_otp will fix this...
>>>> Now I'm cloning the kvalo's kernel tree, this should be faster than
>>>> picking the single patches.
>>>>
>>>>> FWIW:
>>>>>
>>>>>     $ lspci -vs 05:00.0
>>>>>     05:00.0 Network controller: Qualcomm Atheros Device 003e (rev 20)
>>>>>             Subsystem: Bigfoot Networks, Inc. Device 1525
>>>>>             Flags: bus master, fast devsel, latency 0, IRQ 31
>>>>>             Memory at f7800000 (64-bit, non-prefetchable) [size=2M]
>>>>>             Capabilities: <access denied>
>>>>>             Kernel driver in use: ath10k_pci
>>>>>             Kernel modules: ath10k_pci
>>>> Well, mine seems a bit different:
>>>>
>>>> 03:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless
>>>> Network Adapter (rev 20)
>>>>         Subsystem: Bigfoot Networks, Inc. Killer N1525 Wireless-AC
>>>>         Flags: bus master, fast devsel, latency 0, IRQ 32
>>>>         Memory at f6800000 (64-bit, non-prefetchable) [size=2M]
>>>>         Capabilities: [40] Power Management version 3
>>>>         Capabilities: [50] MSI: Enable+ Count=8/8 Maskable+ 64bit-
>>>>         Capabilities: [70] Express Endpoint, MSI 00
>>>>         Capabilities: [100] Advanced Error Reporting
>>>>         Capabilities: [148] Virtual Channel
>>>>         Capabilities: [168] Device Serial Number 00-00-00-00-00-00-00-00
>>>>         Capabilities: [178] Latency Tolerance Reporting
>>>>         Capabilities: [180] L1 PM Substates
>>>>         Kernel driver in use: ath10k_pci
>>>>         Kernel modules: ath10k_pci
>>>>
>>>>> I would interested in knowing from where you got your drivers/board
>>>>> files. I had to download mine from my laptop manufacturer's (MSI)
>>>>> website.
>>>> I mounted the preinstalled Windows 8 partition on /mnt and run:
>>>> find /mnt -iname '*.bin'
>>>>
>>>> The same files can be found inside the driver installer on the Alienware
>>>> (Dell) website.
>>>>
>>>> Regards,
>>>> Gabriele
>>>>
>>> _______________________________________________
>>> ath10k mailing list
>>> ath10k@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/ath10k
>
> --
>
> *Gabriele Martino*
>
> Linux Sysadmin & Web Development
>
> g.martino@gmx.com
>
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
