Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdM0H-0006vU-RD
 for ath10k@lists.infradead.org; Wed, 11 Jul 2018 20:46:27 +0000
Received: by mail-wm0-f46.google.com with SMTP id s12-v6so3610977wmc.1
 for <ath10k@lists.infradead.org>; Wed, 11 Jul 2018 13:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR07MB0926DCCFCA0D3A510C03E651FF470@VI1PR07MB0926.eurprd07.prod.outlook.com>
 <VI1PR07MB092624400F951534EC8F2FBDFF5A0@VI1PR07MB0926.eurprd07.prod.outlook.com>
In-Reply-To: <VI1PR07MB092624400F951534EC8F2FBDFF5A0@VI1PR07MB0926.eurprd07.prod.outlook.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Wed, 11 Jul 2018 13:46:01 -0700
Message-ID: <CAJ-Vmo=diMjkwQwvNFWtJHjnXerTtdfY8f4vVEwP0DGKdwbm=Q@mail.gmail.com>
Subject: Re: QCA988X firmware crash in AP mode
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
To: arthur.watt@virtuosys.com
Cc: ath10k@lists.infradead.org

Hi,

My only suggestion is to try the candalatech 10.1 firmware for
QCA9880/Peregrine chips and see if it behaves better. There are a
bunch of unresolved issues in the 10.2 firmware which I think Ben has
fixed in his 10.1 firmware.

If it works in Ben's firmware release then you maybe can work with him
to trial previous versions of his firmware to try and narrow down when
the fix was introduced.

Thanks!



-adrian

On Wed, 11 Jul 2018 at 08:52, Arthur Watt <arthur.watt@virtuosys.com> wrote:
>
> Hello
>
> Does anyone have any ideas on how I can progress with this problem.
> It only seems to happen when the system is stressed in some way, so it is not highly reproduceable.
> I have tried using the stress application but this did not repeat the error.
>
> Regards
> Arthur
>
>
> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Arthur Watt
> Sent: 06 July 2018 10:06
> To: ath10k@lists.infradead.org
> Subject: QCA988X firmware crash in AP mode
>
> Hello All
>
> I am testing  Compex WLE600VX PCIe modules on a Cavium Octeon TX CN8030 board.
> The WLE600VX uses the QCA9882 chipset.
> We are running Linux kernel version 4.14 with Ubuntu 16.04.
> The firmware version running is 10.2.4.70.9-2.
> There are 4 APs configured on each QCA988X device.
> During testing we saw occasional firmware crashes.
> Is it possible for someone to decode the firmware crash and give me a clue to the source of this problem please?
> We have also tried moving to the latest version of linux-wireless and we still see the problem.
>
>
> Thank you
> Arthur
>
>
> [  134.795044] ath10k_pci 0003:90:00.0: wmi pdev get temperature
> [  134.795369] ath10k_pci 0003:90:00.0: wmi pdev get temperature
> [  134.820036] ath10k_pci 0002:58:00.0: wmi pdev get temperature
> [  134.820326] ath10k_pci 0002:58:00.0: wmi pdev get temperature
> [  140.184526] ath10k_pci 0003:90:00.0: wmi pdev get temperature
> [  140.184611] ath10k_pci 0003:90:00.0: firmware crashed! (guid fc795a23-0dbb-4c51-96cd-67f434b013bc)
> [  140.194192] ath10k_pci 0003:90:00.0: qca988x hw2.0 target 0x4100016c chip_id 0x043222ff sub 0000:0000
> [  140.194213] ath10k_pci 0003:90:00.0: kconfig debug 1 debugfs 1 tracing 0 dfs 1 testmode 0
> [  140.195304] ath10k_pci 0003:90:00.0: firmware ver 10.2.4.70.9-2 api 5 features no-p2p,raw-mode crc32 b8d50af5
> [  140.195321] ath10k_pci 0003:90:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
> [  140.195328] ath10k_pci 0003:90:00.0: htt-ver 2.1 wmi-op 5 htt-op 2 cal otp max-sta 128 raw 0 hwcrypto 1
> [  140.197426] ath10k_pci 0003:90:00.0: firmware register dump:
> [  140.203204] ath10k_pci 0003:90:00.0: [00]: 0x4100016C 0x000015B3 0x009BFADE 0x00955B31
> [  140.211409] ath10k_pci 0003:90:00.0: [04]: 0x009BFADE 0x00060130 0x00000010 0x00409418
> [  140.219505] ath10k_pci 0003:90:00.0: [08]: 0x00000000 0x00400000 0x00416E0C 0x00411F38
> [  140.227625] ath10k_pci 0003:90:00.0: [12]: 0x00000009 0xFFFFFFFF 0x00958360 0x0095836B
> [  140.235741] ath10k_pci 0003:90:00.0: [16]: 0x00958080 0x0094085D 0x00000000 0x00000000
> [  140.243802] ath10k_pci 0003:90:00.0: [20]: 0x409BFADE 0x0040ADA4 0x009BFAA8 0x00417ACC
> [  140.251958] ath10k_pci 0003:90:00.0: [24]: 0x809486FA 0x0040AE04 0x00412A44 0xC09BFADE
> [  140.260064] ath10k_pci 0003:90:00.0: [28]: 0x80948E2C 0x0040AEA4 0x0041F448 0x0041258C
> [  140.268143] ath10k_pci 0003:90:00.0: [32]: 0x809BEF99 0x0040AEC4 0x0041F448 0x00000001
> [  140.276172] ath10k_pci 0003:90:00.0: [36]: 0x80940F18 0x0040AF14 0x00000010 0x00403AC0
> [  140.284230] ath10k_pci 0003:90:00.0: [40]: 0x80940EEA 0x0040AF44 0x00400000 0x00000000
> [  140.292324] ath10k_pci 0003:90:00.0: [44]: 0x80940F31 0x0040AF64 0x00401C10 0x00400600
> [  140.300404] ath10k_pci 0003:90:00.0: [48]: 0x40940024 0x0040AF84 0x004068E8 0x004068E8
> [  140.308421] ath10k_pci 0003:90:00.0: [52]: 0x00000000 0x0040AFA4 0x009BB001 0x00040020
> [  140.316411] ath10k_pci 0003:90:00.0: [56]: 0x00000000 0x00000000 0x00000000 0x00000000
> [  140.324401] ath10k_pci 0003:90:00.0: Copy Engine register dump:
> [  140.330416] ath10k_pci 0003:90:00.0: [00]: 0x00057400  11  11   3   3
> [  140.337080] ath10k_pci 0003:90:00.0: [01]: 0x00057800   9   9 364 365
> [  140.343543] ath10k_pci 0003:90:00.0: [02]: 0x00057c00   1   1  64  65
> [  140.350043] ath10k_pci 0003:90:00.0: [03]: 0x00058000   8   8   8   8
> [  140.356625] ath10k_pci 0003:90:00.0: [04]: 0x00058400  75  75 115  75
> [  140.363151] ath10k_pci 0003:90:00.0: [05]: 0x00058800  13  13 460 461
> [  140.369640] ath10k_pci 0003:90:00.0: [06]: 0x00058c00   5   5   5   5
> [  140.376120] ath10k_pci 0003:90:00.0: [07]: 0x00059000   0   0   0   0
> [  140.412169] ath10k_pci 0003:90:00.0: wmi disable pktlog
> [  140.412189] ath10k_pci 0003:90:00.0: boot hif stop
> [  140.412193] ath10k_pci 0003:90:00.0: boot warm reset
>
> After the crash the software automatically attempts to recover the device but this always fails.
>
> [  145.039204] ath10k_pci 0003:90:00.0: boot target indicator 2
> [  145.039222] ath10k_pci 0003:90:00.0: boot target initialised
> [  145.039226] ath10k_pci 0003:90:00.0: boot warm reset complete
> [  145.042580] ath10k_pci 0003:90:00.0: Could not init core: -11
> [  145.057666] ath10k_pci 0003:90:00.0: boot hif power down
> [  145.057687] Hardware became unavailable during restart.
> [  145.057773] ------------[ cut here ]------------
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
