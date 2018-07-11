Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-eopbgr50059.outbound.protection.outlook.com ([40.107.5.59]
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdHPX-0007rl-D0
 for ath10k@lists.infradead.org; Wed, 11 Jul 2018 15:52:17 +0000
From: Arthur Watt <arthur.watt@virtuosys.com>
Subject: RE: QCA988X firmware crash in AP mode
Date: Wed, 11 Jul 2018 15:51:54 +0000
Message-ID: <VI1PR07MB092624400F951534EC8F2FBDFF5A0@VI1PR07MB0926.eurprd07.prod.outlook.com>
References: <VI1PR07MB0926DCCFCA0D3A510C03E651FF470@VI1PR07MB0926.eurprd07.prod.outlook.com>
In-Reply-To: <VI1PR07MB0926DCCFCA0D3A510C03E651FF470@VI1PR07MB0926.eurprd07.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Arthur Watt <arthur.watt@virtuosys.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello

Does anyone have any ideas on how I can progress with this problem.
It only seems to happen when the system is stressed in some way, so it is n=
ot highly reproduceable.
I have tried using the stress application but this did not repeat the error.

Regards
Arthur


-----Original Message-----
From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Arthur Watt
Sent: 06 July 2018 10:06
To: ath10k@lists.infradead.org
Subject: QCA988X firmware crash in AP mode

Hello All

I am testing =A0Compex WLE600VX PCIe modules on a Cavium Octeon TX CN8030 b=
oard.
The WLE600VX uses the QCA9882 chipset.
We are running Linux kernel version 4.14 with Ubuntu 16.04.
The firmware version running is 10.2.4.70.9-2.
There are 4 APs configured on each QCA988X device.
During testing we saw occasional firmware crashes.
Is it possible for someone to decode the firmware crash and give me a clue =
to the source of this problem please?
We have also tried moving to the latest version of linux-wireless and we st=
ill see the problem.


Thank you
Arthur


[=A0 134.795044] ath10k_pci 0003:90:00.0: wmi pdev get temperature
[=A0 134.795369] ath10k_pci 0003:90:00.0: wmi pdev get temperature
[=A0 134.820036] ath10k_pci 0002:58:00.0: wmi pdev get temperature
[=A0 134.820326] ath10k_pci 0002:58:00.0: wmi pdev get temperature
[=A0 140.184526] ath10k_pci 0003:90:00.0: wmi pdev get temperature
[=A0 140.184611] ath10k_pci 0003:90:00.0: firmware crashed! (guid fc795a23-=
0dbb-4c51-96cd-67f434b013bc)
[=A0 140.194192] ath10k_pci 0003:90:00.0: qca988x hw2.0 target 0x4100016c c=
hip_id 0x043222ff sub 0000:0000
[=A0 140.194213] ath10k_pci 0003:90:00.0: kconfig debug 1 debugfs 1 tracing=
 0 dfs 1 testmode 0
[=A0 140.195304] ath10k_pci 0003:90:00.0: firmware ver 10.2.4.70.9-2 api 5 =
features no-p2p,raw-mode crc32 b8d50af5
[=A0 140.195321] ath10k_pci 0003:90:00.0: board_file api 1 bmi_id N/A crc32=
 bebc7c08
[=A0 140.195328] ath10k_pci 0003:90:00.0: htt-ver 2.1 wmi-op 5 htt-op 2 cal=
 otp max-sta 128 raw 0 hwcrypto 1
[=A0 140.197426] ath10k_pci 0003:90:00.0: firmware register dump:
[=A0 140.203204] ath10k_pci 0003:90:00.0: [00]: 0x4100016C 0x000015B3 0x009=
BFADE 0x00955B31
[=A0 140.211409] ath10k_pci 0003:90:00.0: [04]: 0x009BFADE 0x00060130 0x000=
00010 0x00409418
[=A0 140.219505] ath10k_pci 0003:90:00.0: [08]: 0x00000000 0x00400000 0x004=
16E0C 0x00411F38
[=A0 140.227625] ath10k_pci 0003:90:00.0: [12]: 0x00000009 0xFFFFFFFF 0x009=
58360 0x0095836B
[=A0 140.235741] ath10k_pci 0003:90:00.0: [16]: 0x00958080 0x0094085D 0x000=
00000 0x00000000
[=A0 140.243802] ath10k_pci 0003:90:00.0: [20]: 0x409BFADE 0x0040ADA4 0x009=
BFAA8 0x00417ACC
[=A0 140.251958] ath10k_pci 0003:90:00.0: [24]: 0x809486FA 0x0040AE04 0x004=
12A44 0xC09BFADE
[=A0 140.260064] ath10k_pci 0003:90:00.0: [28]: 0x80948E2C 0x0040AEA4 0x004=
1F448 0x0041258C
[=A0 140.268143] ath10k_pci 0003:90:00.0: [32]: 0x809BEF99 0x0040AEC4 0x004=
1F448 0x00000001
[=A0 140.276172] ath10k_pci 0003:90:00.0: [36]: 0x80940F18 0x0040AF14 0x000=
00010 0x00403AC0
[=A0 140.284230] ath10k_pci 0003:90:00.0: [40]: 0x80940EEA 0x0040AF44 0x004=
00000 0x00000000
[=A0 140.292324] ath10k_pci 0003:90:00.0: [44]: 0x80940F31 0x0040AF64 0x004=
01C10 0x00400600
[=A0 140.300404] ath10k_pci 0003:90:00.0: [48]: 0x40940024 0x0040AF84 0x004=
068E8 0x004068E8
[=A0 140.308421] ath10k_pci 0003:90:00.0: [52]: 0x00000000 0x0040AFA4 0x009=
BB001 0x00040020
[=A0 140.316411] ath10k_pci 0003:90:00.0: [56]: 0x00000000 0x00000000 0x000=
00000 0x00000000
[=A0 140.324401] ath10k_pci 0003:90:00.0: Copy Engine register dump:
[=A0 140.330416] ath10k_pci 0003:90:00.0: [00]: 0x00057400=A0 11=A0 11=A0=
=A0 3=A0=A0 3
[=A0 140.337080] ath10k_pci 0003:90:00.0: [01]: 0x00057800=A0=A0 9=A0=A0 9 =
364 365
[=A0 140.343543] ath10k_pci 0003:90:00.0: [02]: 0x00057c00=A0=A0 1=A0=A0 1=
=A0 64=A0 65
[=A0 140.350043] ath10k_pci 0003:90:00.0: [03]: 0x00058000=A0=A0 8=A0=A0 8=
=A0=A0 8=A0=A0 8
[=A0 140.356625] ath10k_pci 0003:90:00.0: [04]: 0x00058400=A0 75=A0 75 115=
=A0 75
[=A0 140.363151] ath10k_pci 0003:90:00.0: [05]: 0x00058800=A0 13=A0 13 460 =
461
[=A0 140.369640] ath10k_pci 0003:90:00.0: [06]: 0x00058c00=A0=A0 5=A0=A0 5=
=A0=A0 5=A0=A0 5
[=A0 140.376120] ath10k_pci 0003:90:00.0: [07]: 0x00059000=A0=A0 0=A0=A0 0=
=A0=A0 0=A0=A0 0
[=A0 140.412169] ath10k_pci 0003:90:00.0: wmi disable pktlog
[=A0 140.412189] ath10k_pci 0003:90:00.0: boot hif stop
[=A0 140.412193] ath10k_pci 0003:90:00.0: boot warm reset

After the crash the software automatically attempts to recover the device b=
ut this always fails.

[=A0 145.039204] ath10k_pci 0003:90:00.0: boot target indicator 2
[=A0 145.039222] ath10k_pci 0003:90:00.0: boot target initialised
[=A0 145.039226] ath10k_pci 0003:90:00.0: boot warm reset complete
[=A0 145.042580] ath10k_pci 0003:90:00.0: Could not init core: -11
[=A0 145.057666] ath10k_pci 0003:90:00.0: boot hif power down
[=A0 145.057687] Hardware became unavailable during restart.
[=A0 145.057773] ------------[ cut here ]------------


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
