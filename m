Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dem3f-0004JJ-1F
 for ath10k@lists.infradead.org; Mon, 07 Aug 2017 17:43:49 +0000
Subject: Re: Compex WLE600VX firmware crash
References: <4e8550cf-6d07-374f-160e-19d41fef101b@localhost>
 <CAJ-VmonevTpU7DaJMujoy2Ko5GtzEQX-3F=1FO9SH3K7uWYqaw@mail.gmail.com>
 <10eb580b-9c4f-d683-92ea-d058e6acb0d0@gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <e86d1e3a-ab2e-0e12-c86e-0bb9e605906b@candelatech.com>
Date: Mon, 7 Aug 2017 10:42:51 -0700
MIME-Version: 1.0
In-Reply-To: <10eb580b-9c4f-d683-92ea-d058e6acb0d0@gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: svp <s.pooheer@gmail.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 08/07/2017 05:26 AM, svp wrote:
> On 05.08.2017 03:07, Adrian Chadd wrote:
>> Hi,
>>
>> Is this being used as a STA? AP? What's it associating to? what
>> channel, mode, etc
>>
>>
>>
>> -adrian
>>
>
> Hi!
> The device was not initialized. Driver failed to set up network interface.
> If then I try to start driver as modprobe ath10k_pci  - result is the same -
> firware crash.
> More accurate dmesg log here:

I'd be curious how my firmware works on this system if you want to try it...send me the crash if it does crash:

The 988X version should work with this NIC.

http://www.candelatech.com/ath10k-10.1.php

Thanks,
Ben

>
> [    2.651496] ath10k_pci 0000:06:00.0: enabling device (0000 -> 0002)
> [    2.651731] ath10k_pci 0000:06:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
> [    2.677241] snd_hda_intel 0000:00:03.0: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
> [    2.688848] random: crng init done
> [    2.694209] input: HDA Intel HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:03.0/sound/card0/input17
> [    2.694237] input: HDA Intel HDMI HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:03.0/sound/card0/input18
> [    2.694259] input: HDA Intel HDMI HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:03.0/sound/card0/input19
> [    2.694280] input: HDA Intel HDMI HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:03.0/sound/card0/input20
> [    2.719901] fbcon: inteldrmfb (fb0) is primary device
> [    2.763642] Console: switching to colour frame buffer device 240x75
> [    2.785165] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
> [    2.808817] ath10k_pci 0000:06:00.0: qca988x hw2.0 target 0x4100016c chip_id 0x043222ff sub 0000:0000
> [    2.808818] ath10k_pci 0000:06:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
> [    2.808960] ath10k_pci 0000:06:00.0: firmware ver 10.2.4.70.63-2 api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 4ff9e14d
> [    2.849225] ath10k_pci 0000:06:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
> [    3.102190] EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: data=ordered
> [    3.120930] nct6775: Enabling hardware monitor logical device mappings.
> [    3.120944] nct6775: Found NCT6791D or compatible chip at 0x2e:0x290
> [    3.403675] enp3s0: 0xffffa31883295000, 74:d0:2b:7e:f7:35, IRQ 30
> [    3.979192] ath10k_pci 0000:06:00.0: firmware crashed! (uuid 1773073a-6896-4834-91d4-6d0e9b026b06)
> [    3.979241] ath10k_pci 0000:06:00.0: qca988x hw2.0 target 0x4100016c chip_id 0x043222ff sub 0000:0000
> [    3.979244] ath10k_pci 0000:06:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
> [    3.979456] ath10k_pci 0000:06:00.0: firmware ver 10.2.4.70.63-2 api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 4ff9e14d
> [    3.979461] ath10k_pci 0000:06:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
> [    3.979463] ath10k_pci 0000:06:00.0: htt-ver 0.0 wmi-op 5 htt-op 2 cal otp max-sta 128 raw 0 hwcrypto 1
> [    3.981477] ath10k_pci 0000:06:00.0: firmware register dump:
> [    3.981501] ath10k_pci 0000:06:00.0: [00]: 0x4100016C 0x000015B3 0x009BFF84 0x00955B31
> [    3.981530] ath10k_pci 0000:06:00.0: [04]: 0x009BFF84 0x00060130 0x00000013 0x00000000
> [    3.981559] ath10k_pci 0000:06:00.0: [08]: 0x009C8EA4 0x00007170 0x00000001 0x00435300
> [    3.981588] ath10k_pci 0000:06:00.0: [12]: 0x00000009 0x00000000 0x00958360 0x0095836B
> [    3.981616] ath10k_pci 0000:06:00.0: [16]: 0x00958080 0x0094078E 0x00000000 0x00000000
> [    3.981645] ath10k_pci 0000:06:00.0: [20]: 0x409BFF84 0x0040AB44 0x004101E0 0x0000000C
> [    3.981675] ath10k_pci 0000:06:00.0: [24]: 0x809BFE1C 0x0040ABA4 0x00000006 0xC09BFF84
> [    3.981703] ath10k_pci 0000:06:00.0: [28]: 0x8098E907 0x0040ABD4 0x009C8E7C 0x0000016B
> [    3.982735] ath10k_pci 0000:06:00.0: [32]: 0x8098FD3B 0x0040ABF4 0x004209EC 0x00420B0C
> [    3.983755] ath10k_pci 0000:06:00.0: [36]: 0x8098A7DA 0x0040AC34 0x00420AA0 0x004062DC
> [    3.984763] ath10k_pci 0000:06:00.0: [40]: 0x80988785 0x0040AC94 0x00410760 0x00400000
> [    3.985763] ath10k_pci 0000:06:00.0: [44]: 0x8098AEC8 0x0040AD44 0x00410760 0x00000001
> [    3.986752] ath10k_pci 0000:06:00.0: [48]: 0x809B67C4 0x0040AD84 0x00410760 0x00411344
> [    3.987740] ath10k_pci 0000:06:00.0: [52]: 0x809B293C 0x0040ADA4 0x00400000 0x00416FA4
> [    3.988723] ath10k_pci 0000:06:00.0: [56]: 0x809C0C3D 0x0040ADE4 0x0040AE08 0x00412118
> [    3.989700] ath10k_pci 0000:06:00.0: Copy Engine register dump:
> [    3.990684] ath10k_pci 0000:06:00.0: [00]: 0x00057400   0   0 3   3
> [    3.991670] ath10k_pci 0000:06:00.0: [01]: 0x00057800   3   3 8   9
> [    3.992652] ath10k_pci 0000:06:00.0: [02]: 0x00057c00   1   1 0   1
> [    3.993628] ath10k_pci 0000:06:00.0: [03]: 0x00058000   1   1 2   1
> [    3.994587] ath10k_pci 0000:06:00.0: [04]: 0x00058400   0   0 40   0
> [    3.995529] ath10k_pci 0000:06:00.0: [05]: 0x00058800   0   0 0   0
> [    3.996454] ath10k_pci 0000:06:00.0: [06]: 0x00058c00   0   0 0   0
> [    3.997359] ath10k_pci 0000:06:00.0: [07]: 0x00059000   0   0 0   0
> [    5.501878] r8168: enp3s0: link up
> [    7.630654] usb 3-13: device descriptor read/64, error -110
> [    9.010685] ath10k_pci 0000:06:00.0: wmi unified ready event not received
> [    9.082483] ath10k_pci 0000:06:00.0: could not init core (-110)
> [    9.083167] ath10k_pci 0000:06:00.0: could not probe fw (-110)
> [    9.097304] ath10k_pci 0000:06:00.0: cannot restart a device that hasn't been started
>
>
> Sergey
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
