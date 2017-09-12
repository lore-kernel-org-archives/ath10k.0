Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drfYz-0002Ua-92
 for ath10k@lists.infradead.org; Tue, 12 Sep 2017 07:25:58 +0000
Received: by mail-wr0-x233.google.com with SMTP id 108so18653041wra.5
 for <ath10k@lists.infradead.org>; Tue, 12 Sep 2017 00:24:32 -0700 (PDT)
Subject: Re: failed to fetch board data QCA6174
References: <c1f6096c-7445-7862-a5df-b96211be9df3@gmail.com>
 <8d3a8d6f-5191-d1fa-784b-28cab8b407d5@qti.qualcomm.com>
From: Luka Karinja <luka.karinja@gmail.com>
Message-ID: <e87292ba-a00c-edf9-2c02-5be14750bb60@gmail.com>
Date: Tue, 12 Sep 2017 09:24:26 +0200
MIME-Version: 1.0
In-Reply-To: <8d3a8d6f-5191-d1fa-784b-28cab8b407d5@qti.qualcomm.com>
Content-Language: en-US
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ryan Hsu <ryanhsu@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 09/12/2017 12:25 AM, Ryan Hsu wrote:
> On 09/11/2017 03:03 PM, Luka Karinja wrote:
>
>>>> Hello. I'm trying to get a M.2 QCA6174 working on my MSI B150Mortar mo=
therboard. i did try all the various firmware versions from https://github.=
com/kvalo/ath10k-firmware more or less with the same errors as bellow
>>>>
>>>> in dmesg i get: failed to fetch board data for bus=3Dpci,vendor=3D168c=
,device=3D003e,subsystem-vendor=3D0000,subsystem-device=3D0000 from ath10k/=
QCA6174/hw3.0/board-2.bin
>>>>
>>>> when trying to get the device up i get: RTNETLINK answers: Resource te=
mporarily unavailable
>>>>
>>>> [ 2026.219245] ath10k_pci 0000:05:00.0: pci irq msi oper_irq_mode 2 ir=
q_mode 0 reset_mode 0
>>>> [ 2026.477510] ath10k_pci 0000:05:00.0: qca6174 hw3.2 target 0x0503000=
0 chip_id 0x00340aff sub 0000:0000
>>>> [ 2026.477517] ath10k_pci 0000:05:00.0: kconfig debug 0 debugfs 1 trac=
ing 0 dfs 0 testmode 0
>>>> [ 2026.478640] ath10k_pci 0000:05:00.0: firmware ver WLAN.RM.4.4.1-000=
26-QCARMSWP-1 api 6 features wowlan,ignore-otp,raw-mode crc32 7b90c3fc
>>>> [ 2026.542196] ath10k_pci 0000:05:00.0: failed to fetch board data for=
 bus=3Dpci,vendor=3D168c,device=3D003e,subsystem-vendor=3D0000,subsystem-de=
vice=3D0000 from ath10k/QCA6174/hw3.0/board-2.bin
>>>>
>>> Not sure what kernel and driver do you have?
>>>
>>> This should already fix this case - https://patchwork.kernel.org/patch/=
9486941/
>>>
>> I have kernel 4.12.10 (Arch linux) i did try with ath10k WLAN.RM.2.4, 4.=
4, 4.4.1 firmware
>>
> ok, then it should be happening, would you mind enable the ATH10K_DBG_BOO=
T and share logs?
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/debug
>
here is the log with ATH10K_DBG_BOOT

[=A0=A0=A0 3.388761] ath10k_pci 0000:05:00.0: pci probe 168c:003e 0000:0000
[=A0=A0=A0 3.388784] ath10k_pci 0000:05:00.0: enabling device (0000 -> 0002)
[=A0=A0=A0 3.388886] ath10k_pci 0000:05:00.0: boot pci_mem 0xffffb2cc042000=
00
[=A0=A0=A0 3.389044] ath10k_pci 0000:05:00.0: pci irq msi oper_irq_mode 2 =

irq_mode 0 reset_mode 0
[=A0=A0=A0 3.389061] ath10k_pci 0000:05:00.0: boot qca6174 chip reset
[=A0=A0=A0 3.389062] ath10k_pci 0000:05:00.0: boot cold reset
[=A0=A0=A0 3.440716] ath10k_pci 0000:05:00.0: boot cold reset complete
[=A0=A0=A0 3.440718] ath10k_pci 0000:05:00.0: boot waiting target to initia=
lise
[=A0=A0=A0 3.440722] ath10k_pci 0000:05:00.0: boot target indicator 2
[=A0=A0=A0 3.440728] ath10k_pci 0000:05:00.0: boot target initialised
[=A0=A0=A0 3.440728] ath10k_pci 0000:05:00.0: boot warm reset
[=A0=A0=A0 3.473362] ath10k_pci 0000:05:00.0: boot init ce src ring id 0 =

entries 16 base_addr ffff9fcdf703e000
[=A0=A0=A0 3.473375] ath10k_pci 0000:05:00.0: boot ce dest ring id 1 entrie=
s =

512 base_addr ffff9fcdf705e000
[=A0=A0=A0 3.473387] ath10k_pci 0000:05:00.0: boot ce dest ring id 2 entrie=
s =

128 base_addr ffff9fcdf703f000
[=A0=A0=A0 3.473400] ath10k_pci 0000:05:00.0: boot init ce src ring id 3 =

entries 32 base_addr ffff9fcdf7040000
[=A0=A0=A0 3.473416] ath10k_pci 0000:05:00.0: boot init ce src ring id 4 =

entries 8192 base_addr ffff9fcdf7060000
[=A0=A0=A0 3.473430] ath10k_pci 0000:05:00.0: boot init ce src ring id 7 =

entries 2 base_addr ffff9fcdf7041000
[=A0=A0=A0 3.473441] ath10k_pci 0000:05:00.0: boot ce dest ring id 7 entrie=
s 2 =

base_addr ffff9fcdf7042000
[=A0=A0=A0 3.473442] ath10k_pci 0000:05:00.0: boot waiting target to initia=
lise
[=A0=A0=A0 3.473445] ath10k_pci 0000:05:00.0: boot target indicator 0
[=A0=A0=A0 3.483457] ath10k_pci 0000:05:00.0: boot target indicator 2
[=A0=A0=A0 3.483463] ath10k_pci 0000:05:00.0: boot target initialised
[=A0=A0=A0 3.503359] ath10k_pci 0000:05:00.0: boot init ce src ring id 0 =

entries 16 base_addr ffff9fcdf703e000
[=A0=A0=A0 3.503374] ath10k_pci 0000:05:00.0: boot ce dest ring id 1 entrie=
s =

512 base_addr ffff9fcdf705e000
[=A0=A0=A0 3.503388] ath10k_pci 0000:05:00.0: boot ce dest ring id 2 entrie=
s =

128 base_addr ffff9fcdf703f000
[=A0=A0=A0 3.503403] ath10k_pci 0000:05:00.0: boot init ce src ring id 3 =

entries 32 base_addr ffff9fcdf7040000
[=A0=A0=A0 3.503419] ath10k_pci 0000:05:00.0: boot init ce src ring id 4 =

entries 8192 base_addr ffff9fcdf7060000
[=A0=A0=A0 3.503435] ath10k_pci 0000:05:00.0: boot init ce src ring id 7 =

entries 2 base_addr ffff9fcdf7041000
[=A0=A0=A0 3.503448] ath10k_pci 0000:05:00.0: boot ce dest ring id 7 entrie=
s 2 =

base_addr ffff9fcdf7042000
[=A0=A0=A0 3.503449] ath10k_pci 0000:05:00.0: boot waiting target to initia=
lise
[=A0=A0=A0 3.503451] ath10k_pci 0000:05:00.0: boot target indicator 0
[=A0=A0=A0 3.513458] ath10k_pci 0000:05:00.0: boot target indicator 2
[=A0=A0=A0 3.513464] ath10k_pci 0000:05:00.0: boot target initialised
[=A0=A0=A0 3.513464] ath10k_pci 0000:05:00.0: boot warm reset complete
[=A0=A0=A0 3.513465] ath10k_pci 0000:05:00.0: boot qca6174 chip reset compl=
ete =

(cold)
[=A0=A0=A0 3.513475] ath10k_pci 0000:05:00.0: boot hif power up
[=A0=A0=A0 3.513480] ath10k_pci 0000:05:00.0: boot qca6174 chip reset
[=A0=A0=A0 3.513481] ath10k_pci 0000:05:00.0: boot cold reset
[=A0=A0=A0 3.566677] ath10k_pci 0000:05:00.0: boot cold reset complete
[=A0=A0=A0 3.566678] ath10k_pci 0000:05:00.0: boot waiting target to initia=
lise
[=A0=A0=A0 3.566682] ath10k_pci 0000:05:00.0: boot target indicator 2
[=A0=A0=A0 3.566687] ath10k_pci 0000:05:00.0: boot target initialised
[=A0=A0=A0 3.566688] ath10k_pci 0000:05:00.0: boot warm reset
[=A0=A0=A0 3.603354] ath10k_pci 0000:05:00.0: boot init ce src ring id 0 =

entries 16 base_addr ffff9fcdf703e000
[=A0=A0=A0 3.603366] ath10k_pci 0000:05:00.0: boot ce dest ring id 1 entrie=
s =

512 base_addr ffff9fcdf705e000
[=A0=A0=A0 3.603377] ath10k_pci 0000:05:00.0: boot ce dest ring id 2 entrie=
s =

128 base_addr ffff9fcdf703f000
[=A0=A0=A0 3.603390] ath10k_pci 0000:05:00.0: boot init ce src ring id 3 =

entries 32 base_addr ffff9fcdf7040000
[=A0=A0=A0 3.603405] ath10k_pci 0000:05:00.0: boot init ce src ring id 4 =

entries 8192 base_addr ffff9fcdf7060000
[=A0=A0=A0 3.603418] ath10k_pci 0000:05:00.0: boot init ce src ring id 7 =

entries 2 base_addr ffff9fcdf7041000
[=A0=A0=A0 3.603430] ath10k_pci 0000:05:00.0: boot ce dest ring id 7 entrie=
s 2 =

base_addr ffff9fcdf7042000
[=A0=A0=A0 3.603430] ath10k_pci 0000:05:00.0: boot waiting target to initia=
lise
[=A0=A0=A0 3.603433] ath10k_pci 0000:05:00.0: boot target indicator 0
[=A0=A0=A0 3.613440] ath10k_pci 0000:05:00.0: boot target indicator 2
[=A0=A0=A0 3.613445] ath10k_pci 0000:05:00.0: boot target initialised
[=A0=A0=A0 3.633356] ath10k_pci 0000:05:00.0: boot init ce src ring id 0 =

entries 16 base_addr ffff9fcdf703e000
[=A0=A0=A0 3.633370] ath10k_pci 0000:05:00.0: boot ce dest ring id 1 entrie=
s =

512 base_addr ffff9fcdf705e000
[=A0=A0=A0 3.633384] ath10k_pci 0000:05:00.0: boot ce dest ring id 2 entrie=
s =

128 base_addr ffff9fcdf703f000
[=A0=A0=A0 3.633398] ath10k_pci 0000:05:00.0: boot init ce src ring id 3 =

entries 32 base_addr ffff9fcdf7040000
[=A0=A0=A0 3.633416] ath10k_pci 0000:05:00.0: boot init ce src ring id 4 =

entries 8192 base_addr ffff9fcdf7060000
[=A0=A0=A0 3.633433] ath10k_pci 0000:05:00.0: boot init ce src ring id 7 =

entries 2 base_addr ffff9fcdf7041000
[=A0=A0=A0 3.633445] ath10k_pci 0000:05:00.0: boot ce dest ring id 7 entrie=
s 2 =

base_addr ffff9fcdf7042000
[=A0=A0=A0 3.633446] ath10k_pci 0000:05:00.0: boot waiting target to initia=
lise
[=A0=A0=A0 3.633449] ath10k_pci 0000:05:00.0: boot target indicator 0
[=A0=A0=A0 3.643827] ath10k_pci 0000:05:00.0: boot target indicator 2
[=A0=A0=A0 3.643834] ath10k_pci 0000:05:00.0: boot target initialised
[=A0=A0=A0 3.643834] ath10k_pci 0000:05:00.0: boot warm reset complete
[=A0=A0=A0 3.643835] ath10k_pci 0000:05:00.0: boot qca6174 chip reset compl=
ete =

(cold)
[=A0=A0=A0 3.643851] ath10k_pci 0000:05:00.0: boot init ce src ring id 0 =

entries 16 base_addr ffff9fcdf703e000
[=A0=A0=A0 3.643864] ath10k_pci 0000:05:00.0: boot ce dest ring id 1 entrie=
s =

512 base_addr ffff9fcdf705e000
[=A0=A0=A0 3.643877] ath10k_pci 0000:05:00.0: boot ce dest ring id 2 entrie=
s =

128 base_addr ffff9fcdf703f000
[=A0=A0=A0 3.643892] ath10k_pci 0000:05:00.0: boot init ce src ring id 3 =

entries 32 base_addr ffff9fcdf7040000
[=A0=A0=A0 3.643911] ath10k_pci 0000:05:00.0: boot init ce src ring id 4 =

entries 8192 base_addr ffff9fcdf7060000
[=A0=A0=A0 3.643925] ath10k_pci 0000:05:00.0: boot init ce src ring id 7 =

entries 2 base_addr ffff9fcdf7041000
[=A0=A0=A0 3.643939] ath10k_pci 0000:05:00.0: boot ce dest ring id 7 entrie=
s 2 =

base_addr ffff9fcdf7042000
[=A0=A0=A0 3.656678] ath10k_pci 0000:05:00.0: Hardware name qca6174 hw3.2 =

version 0x5030000
[=A0=A0=A0 3.656935] ath10k_pci 0000:05:00.0: boot fw request =

'ath10k/pre-cal-pci-0000:05:00.0.bin': -2
[=A0=A0=A0 3.656944] ath10k_pci 0000:05:00.0: boot fw request =

'ath10k/cal-pci-0000:05:00.0.bin': -2
[=A0=A0=A0 3.656945] ath10k_pci 0000:05:00.0: trying fw api 6
[=A0=A0=A0 3.662928] ath10k_pci 0000:05:00.0: boot fw request =

'ath10k/QCA6174/hw3.0/firmware-6.bin': 0
[=A0=A0=A0 3.662930] ath10k_pci 0000:05:00.0: found fw version =

WLAN.RM.4.4.1-00026-QCARMSWP-1
[=A0=A0=A0 3.662931] ath10k_pci 0000:05:00.0: found fw timestamp 1502353467
[=A0=A0=A0 3.662932] ath10k_pci 0000:05:00.0: found otp image ie (24193 B)
[=A0=A0=A0 3.662932] ath10k_pci 0000:05:00.0: found fw image ie (703151 B)
[=A0=A0=A0 3.662933] ath10k_pci 0000:05:00.0: found firmware features ie (2=
 B)
[=A0=A0=A0 3.662934] ath10k_pci 0000:05:00.0: Enabling feature bit: 6
[=A0=A0=A0 3.662934] ath10k_pci 0000:05:00.0: Enabling feature bit: 7
[=A0=A0=A0 3.662935] ath10k_pci 0000:05:00.0: Enabling feature bit: 10
[=A0=A0=A0 3.662936] ath10k_pci 0000:05:00.0: features
[=A0=A0=A0 3.662937] ath10k_pci 0000:05:00.0: 00000000: c0 04 00 00 00 00 0=
0 =

00=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 ........
[=A0=A0=A0 3.662937] ath10k_pci 0000:05:00.0: found fw ie wmi op version 4
[=A0=A0=A0 3.662938] ath10k_pci 0000:05:00.0: found fw ie htt op version 3
[=A0=A0=A0 3.662939] ath10k_pci 0000:05:00.0: using fw api 6
[=A0=A0=A0 3.662941] ath10k_pci 0000:05:00.0: qca6174 hw3.2 target 0x050300=
00 =

chip_id 0x00340aff sub 0000:0000
[=A0=A0=A0 3.662941] ath10k_pci 0000:05:00.0: kconfig debug 1 debugfs 1 =

tracing 1 dfs 0 testmode 0
[=A0=A0=A0 3.663314] ath10k_pci 0000:05:00.0: firmware ver =

WLAN.RM.4.4.1-00026-QCARMSWP-1 api 6 features wowlan,ignore-otp,raw-mode =

crc32 7b90c3fc
[=A0=A0=A0 3.663315] ath10k_pci 0000:05:00.0: boot did not find a pre =

calibration file, try DT next: -2
[=A0=A0=A0 3.663316] ath10k_pci 0000:05:00.0: unable to load pre cal data f=
rom =

DT: -2
[=A0=A0=A0 3.663317] ath10k_pci 0000:05:00.0: could not load pre cal data: =
-2
[=A0=A0=A0 3.663318] ath10k_pci 0000:05:00.0: boot upload otp to 0x1234 len =

24193 for board id
[=A0=A0=A0 3.726143] ath10k_pci 0000:05:00.0: boot get otp board id result =

0x00000000 board_id 0 chip_id 0
[=A0=A0=A0 3.726144] ath10k_pci 0000:05:00.0: board id does not exist in ot=
p, =

ignore it
[=A0=A0=A0 3.726165] ath10k_pci 0000:05:00.0: bdf variant name not set.
[=A0=A0=A0 3.726167] ath10k_pci 0000:05:00.0: boot using board name =

'bus=3Dpci,vendor=3D168c,device=3D003e,subsystem-vendor=3D0000,subsystem-de=
vice=3D0000'
[=A0=A0=A0 3.727652] ath10k_pci 0000:05:00.0: boot fw request =

'ath10k/QCA6174/hw3.0/board-2.bin': 0
[=A0=A0=A0 3.727653] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727654] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727655] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727656] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727657] ath10k_pci 0000:05:00.0: 00000030: 3d 31 36 38 63 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D168c,subsystem-
[=A0=A0=A0 3.727658] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

33 33 34 65=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D334e
[=A0=A0=A0 3.727658] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727659] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727660] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727661] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727661] ath10k_pci 0000:05:00.0: 00000030: 3d 31 36 38 63 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D168c,subsystem-
[=A0=A0=A0 3.727662] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

33 33 36 30=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D3360
[=A0=A0=A0 3.727663] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727663] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727664] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727665] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727666] ath10k_pci 0000:05:00.0: 00000030: 3d 31 36 38 63 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D168c,subsystem-
[=A0=A0=A0 3.727666] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

33 33 36 32=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D3362
[=A0=A0=A0 3.727667] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727668] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727668] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727669] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727670] ath10k_pci 0000:05:00.0: 00000030: 3d 31 36 38 63 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D168c,subsystem-
[=A0=A0=A0 3.727670] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

33 33 36 33=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D3363
[=A0=A0=A0 3.727671] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727672] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727672] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727673] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727674] ath10k_pci 0000:05:00.0: 00000030: 3d 31 36 38 63 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D168c,subsystem-
[=A0=A0=A0 3.727675] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

33 33 36 31=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D3361
[=A0=A0=A0 3.727675] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727676] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727677] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727677] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727678] ath10k_pci 0000:05:00.0: 00000030: 3d 31 61 35 36 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1a56,subsystem-
[=A0=A0=A0 3.727679] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

35 32 35 61=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D525a
[=A0=A0=A0 3.727680] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727680] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727681] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727682] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727682] ath10k_pci 0000:05:00.0: 00000030: 3d 31 34 34 66 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D144f,subsystem-
[=A0=A0=A0 3.727683] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

37 31 34 33=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D7143
[=A0=A0=A0 3.727684] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727684] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727685] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727686] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727687] ath10k_pci 0000:05:00.0: 00000030: 3d 31 36 38 63 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D168c,subsystem-
[=A0=A0=A0 3.727687] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

33 33 36 36=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D3366
[=A0=A0=A0 3.727688] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727689] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727689] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727690] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727691] ath10k_pci 0000:05:00.0: 00000030: 3d 31 34 63 64 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D14cd,subsystem-
[=A0=A0=A0 3.727692] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

39 30 30 38=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D9008
[=A0=A0=A0 3.727692] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727693] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727694] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727694] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727695] ath10k_pci 0000:05:00.0: 00000030: 3d 31 34 63 64 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D14cd,subsystem-
[=A0=A0=A0 3.727696] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

39 38 30 31=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D9801
[=A0=A0=A0 3.727696] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727697] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727698] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727699] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727699] ath10k_pci 0000:05:00.0: 00000030: 3d 31 34 63 64 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D14cd,subsystem-
[=A0=A0=A0 3.727700] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

39 38 30 32=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D9802
[=A0=A0=A0 3.727701] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727701] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727702] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727703] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727703] ath10k_pci 0000:05:00.0: 00000030: 3d 31 61 35 36 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1a56,subsystem-
[=A0=A0=A0 3.727704] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

31 34 33 35=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D1435
[=A0=A0=A0 3.727705] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727706] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727706] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727707] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727708] ath10k_pci 0000:05:00.0: 00000030: 3d 31 61 35 36 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1a56,subsystem-
[=A0=A0=A0 3.727708] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

35 33 35 61=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D535a
[=A0=A0=A0 3.727709] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727710] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727710] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727711] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727712] ath10k_pci 0000:05:00.0: 00000030: 3d 31 61 35 36 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1a56,subsystem-
[=A0=A0=A0 3.727713] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

31 35 33 35=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D1535
[=A0=A0=A0 3.727713] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727714] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727715] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727715] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727716] ath10k_pci 0000:05:00.0: 00000030: 3d 31 61 35 36 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1a56,subsystem-
[=A0=A0=A0 3.727717] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

31 35 33 36=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D1536
[=A0=A0=A0 3.727717] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727718] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727719] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727720] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727720] ath10k_pci 0000:05:00.0: 00000030: 3d 31 37 61 61 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D17aa,subsystem-
[=A0=A0=A0 3.727721] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

31 35 33 35=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D1535
[=A0=A0=A0 3.727722] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727722] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727723] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727724] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727725] ath10k_pci 0000:05:00.0: 00000030: 3d 31 30 63 66 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D10cf,subsystem-
[=A0=A0=A0 3.727725] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

31 39 32 61=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D192a
[=A0=A0=A0 3.727726] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727727] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727727] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727728] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727729] ath10k_pci 0000:05:00.0: 00000030: 3d 31 30 63 66 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D10cf,subsystem-
[=A0=A0=A0 3.727729] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

31 39 32 62=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D192b
[=A0=A0=A0 3.727730] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727731] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727732] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727732] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727733] ath10k_pci 0000:05:00.0: 00000030: 3d 31 34 34 64 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D144d,subsystem-
[=A0=A0=A0 3.727734] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

34 31 32 66=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D412f
[=A0=A0=A0 3.727734] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727735] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727736] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727736] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727737] ath10k_pci 0000:05:00.0: 00000030: 3d 31 34 34 64 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D144d,subsystem-
[=A0=A0=A0 3.727738] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

34 31 33 30=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D4130
[=A0=A0=A0 3.727739] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727739] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727740] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727741] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727741] ath10k_pci 0000:05:00.0: 00000030: 3d 31 34 34 64 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D144d,subsystem-
[=A0=A0=A0 3.727742] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

34 31 33 31=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D4131
[=A0=A0=A0 3.727743] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727743] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727744] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727745] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727746] ath10k_pci 0000:05:00.0: 00000030: 3d 31 34 34 64 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D144d,subsystem-
[=A0=A0=A0 3.727746] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

34 31 33 32=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D4132
[=A0=A0=A0 3.727747] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727748] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727748] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727749] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727750] ath10k_pci 0000:05:00.0: 00000030: 3d 31 30 35 62 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D105b,subsystem-
[=A0=A0=A0 3.727751] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

65 30 61 30=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3De0a0
[=A0=A0=A0 3.727751] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727752] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727753] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727753] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727754] ath10k_pci 0000:05:00.0: 00000030: 3d 31 31 61 64 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D11ad,subsystem-
[=A0=A0=A0 3.727755] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

30 35 30 33=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D0503
[=A0=A0=A0 3.727755] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727756] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727757] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727758] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727758] ath10k_pci 0000:05:00.0: 00000030: 3d 31 31 61 64 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D11ad,subsystem-
[=A0=A0=A0 3.727759] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

30 38 30 37=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D0807
[=A0=A0=A0 3.727760] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727760] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727761] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727762] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727762] ath10k_pci 0000:05:00.0: 00000030: 3d 31 31 61 64 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D11ad,subsystem-
[=A0=A0=A0 3.727763] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

31 38 30 37=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D1807
[=A0=A0=A0 3.727764] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727765] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727765] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727766] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727767] ath10k_pci 0000:05:00.0: 00000030: 3d 31 30 35 62 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D105b,subsystem-
[=A0=A0=A0 3.727767] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

65 30 39 64=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3De09d
[=A0=A0=A0 3.727768] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727769] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727769] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727770] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727771] ath10k_pci 0000:05:00.0: 00000030: 3d 31 30 34 33 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1043,subsystem-
[=A0=A0=A0 3.727772] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

38 36 63 64=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D86cd
[=A0=A0=A0 3.727772] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727773] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727774] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727774] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727775] ath10k_pci 0000:05:00.0: 00000030: 3d 31 30 34 33 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1043,subsystem-
[=A0=A0=A0 3.727776] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

38 36 65 30=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D86e0
[=A0=A0=A0 3.727776] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727777] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727778] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727779] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727779] ath10k_pci 0000:05:00.0: 00000030: 3d 31 61 33 62 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1a3b,subsystem-
[=A0=A0=A0 3.727781] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

32 32 36 30=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D2260
[=A0=A0=A0 3.727781] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727782] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727783] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727783] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727784] ath10k_pci 0000:05:00.0: 00000030: 3d 31 31 61 64 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D11ad,subsystem-
[=A0=A0=A0 3.727785] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

30 38 30 38=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D0808
[=A0=A0=A0 3.727785] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727786] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727787] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727788] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727788] ath10k_pci 0000:05:00.0: 00000030: 3d 31 34 34 66 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D144f,subsystem-
[=A0=A0=A0 3.727789] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

37 31 34 34=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D7144
[=A0=A0=A0 3.727790] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727790] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727791] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727792] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727792] ath10k_pci 0000:05:00.0: 00000030: 3d 31 30 34 33 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1043,subsystem-
[=A0=A0=A0 3.727793] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

38 36 66 38=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D86f8
[=A0=A0=A0 3.727794] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727794] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727795] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727796] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727797] ath10k_pci 0000:05:00.0: 00000030: 3d 31 30 34 33 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1043,subsystem-
[=A0=A0=A0 3.727797] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

38 36 66 39=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D86f9
[=A0=A0=A0 3.727798] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727799] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727799] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727800] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727801] ath10k_pci 0000:05:00.0: 00000030: 3d 31 37 61 61 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D17aa,subsystem-
[=A0=A0=A0 3.727802] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

30 38 32 37=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D0827
[=A0=A0=A0 3.727802] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727803] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727804] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727804] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727805] ath10k_pci 0000:05:00.0: 00000030: 3d 31 37 61 61 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D17aa,subsystem-
[=A0=A0=A0 3.727806] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

30 38 33 37=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D0837
[=A0=A0=A0 3.727806] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727807] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727808] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727809] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727809] ath10k_pci 0000:05:00.0: 00000030: 3d 31 37 61 61 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D17aa,subsystem-
[=A0=A0=A0 3.727810] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

30 38 34 37=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D0847
[=A0=A0=A0 3.727811] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727811] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727812] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727813] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727813] ath10k_pci 0000:05:00.0: 00000030: 3d 31 37 61 61 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D17aa,subsystem-
[=A0=A0=A0 3.727814] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

30 38 35 37=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D0857
[=A0=A0=A0 3.727815] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727816] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727816] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727817] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727818] ath10k_pci 0000:05:00.0: 00000030: 3d 31 37 61 61 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D17aa,subsystem-
[=A0=A0=A0 3.727818] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

31 34 33 35=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D1435
[=A0=A0=A0 3.727819] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727820] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727820] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727821] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727822] ath10k_pci 0000:05:00.0: 00000030: 3d 31 30 32 38 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1028,subsystem-
[=A0=A0=A0 3.727823] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

30 33 31 30=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D0310
[=A0=A0=A0 3.727823] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727824] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727825] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727825] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727826] ath10k_pci 0000:05:00.0: 00000030: 3d 31 30 32 38 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1028,subsystem-
[=A0=A0=A0 3.727827] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

30 34 31 30=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D0410
[=A0=A0=A0 3.727827] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727828] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727829] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727830] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727830] ath10k_pci 0000:05:00.0: 00000030: 3d 31 30 32 38 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1028,subsystem-
[=A0=A0=A0 3.727831] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

30 33 31 30 2c 76 61 72 69=A0 device=3D0310,vari
[=A0=A0=A0 3.727832] ath10k_pci 0000:05:00.0: 00000050: 61 6e 74 3d 52 56 5=
f =

30 35 31 39=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ant=3DRV_0519
[=A0=A0=A0 3.727832] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727833] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727834] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727834] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727835] ath10k_pci 0000:05:00.0: 00000030: 3d 31 61 35 36 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1a56,subsystem-
[=A0=A0=A0 3.727836] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

31 35 33 35 2c 76 61 72 69=A0 device=3D1535,vari
[=A0=A0=A0 3.727837] ath10k_pci 0000:05:00.0: 00000050: 61 6e 74 3d 52 56 5=
f =

30 35 31 39=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ant=3DRV_0519
[=A0=A0=A0 3.727837] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727838] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727839] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727839] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727840] ath10k_pci 0000:05:00.0: 00000030: 3d 31 61 35 36 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1a56,subsystem-
[=A0=A0=A0 3.727841] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

31 35 33 35 2c 76 61 72 69=A0 device=3D1535,vari
[=A0=A0=A0 3.727841] ath10k_pci 0000:05:00.0: 00000050: 61 6e 74 3d 52 56 5=
f =

30 35 32 30=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ant=3DRV_0520
[=A0=A0=A0 3.727842] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727843] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727843] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727844] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727845] ath10k_pci 0000:05:00.0: 00000030: 3d 31 30 35 62 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D105b,subsystem-
[=A0=A0=A0 3.727846] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

65 30 61 35=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3De0a5
[=A0=A0=A0 3.727846] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727847] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727848] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727848] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727849] ath10k_pci 0000:05:00.0: 00000030: 3d 31 30 34 33 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1043,subsystem-
[=A0=A0=A0 3.727850] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

38 37 35 31=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D8751
[=A0=A0=A0 3.727850] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727851] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727852] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727853] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727853] ath10k_pci 0000:05:00.0: 00000030: 3d 31 30 34 33 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1043,subsystem-
[=A0=A0=A0 3.727854] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

38 37 35 32=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D8752
[=A0=A0=A0 3.727855] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727855] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727856] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727857] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727858] ath10k_pci 0000:05:00.0: 00000030: 3d 31 31 61 64 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D11ad,subsystem-
[=A0=A0=A0 3.727858] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

30 35 32 33=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D0523
[=A0=A0=A0 3.727859] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727860] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727860] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727861] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727862] ath10k_pci 0000:05:00.0: 00000030: 3d 31 30 35 62 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D105b,subsystem-
[=A0=A0=A0 3.727862] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

65 30 61 32=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3De0a2
[=A0=A0=A0 3.727863] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727864] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727865] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727865] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727866] ath10k_pci 0000:05:00.0: 00000030: 3d 31 31 61 64 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D11ad,subsystem-
[=A0=A0=A0 3.727867] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

30 38 33 37=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D0837
[=A0=A0=A0 3.727867] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727868] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727869] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727869] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727870] ath10k_pci 0000:05:00.0: 00000030: 3d 31 64 61 63 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1dac,subsystem-
[=A0=A0=A0 3.727871] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

30 32 35 38=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D0258
[=A0=A0=A0 3.727871] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727872] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727873] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727874] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727874] ath10k_pci 0000:05:00.0: 00000030: 3d 31 30 35 62 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D105b,subsystem-
[=A0=A0=A0 3.727875] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

65 30 61 36=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3De0a6
[=A0=A0=A0 3.727876] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727876] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727877] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727878] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727879] ath10k_pci 0000:05:00.0: 00000030: 3d 31 31 61 64 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D11ad,subsystem-
[=A0=A0=A0 3.727879] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

30 38 31 38=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D0818
[=A0=A0=A0 3.727880] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727881] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727881] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727882] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727883] ath10k_pci 0000:05:00.0: 00000030: 3d 31 64 61 63 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1dac,subsystem-
[=A0=A0=A0 3.727883] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

30 32 35 39=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D0259
[=A0=A0=A0 3.727884] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727885] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727886] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727886] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727887] ath10k_pci 0000:05:00.0: 00000030: 3d 31 64 61 63 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1dac,subsystem-
[=A0=A0=A0 3.727888] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

30 32 36 31=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D0261
[=A0=A0=A0 3.727888] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727889] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727890] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727890] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727891] ath10k_pci 0000:05:00.0: 00000030: 3d 31 37 61 61 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D17aa,subsystem-
[=A0=A0=A0 3.727892] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

33 30 32 34=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D3024
[=A0=A0=A0 3.727893] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727893] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727894] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727895] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727895] ath10k_pci 0000:05:00.0: 00000030: 3d 31 31 61 64 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D11ad,subsystem-
[=A0=A0=A0 3.727896] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

30 35 31 33=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D0513
[=A0=A0=A0 3.727897] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727897] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727898] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727899] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727900] ath10k_pci 0000:05:00.0: 00000030: 3d 31 61 35 36 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1a56,subsystem-
[=A0=A0=A0 3.727900] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

31 34 33 61=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D143a
[=A0=A0=A0 3.727901] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727902] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727902] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727903] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727904] ath10k_pci 0000:05:00.0: 00000030: 3d 31 30 32 38 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1028,subsystem-
[=A0=A0=A0 3.727905] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

33 36 34 61 2c 76 61 72 69=A0 device=3D364a,vari
[=A0=A0=A0 3.727905] ath10k_pci 0000:05:00.0: 00000050: 61 6e 74 3d 44 45 5=
f =

30 35 32 32=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ant=3DDE_0522
[=A0=A0=A0 3.727906] ath10k_pci 0000:05:00.0: board name
[=A0=A0=A0 3.727907] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 6=
9 =

2c 76 65 6e 64 6f 72 3d 31=A0 bus=3Dpci,vendor=3D1
[=A0=A0=A0 3.727907] ath10k_pci 0000:05:00.0: 00000010: 36 38 63 2c 64 65 7=
6 =

69 63 65 3d 30 30 33 65 2c=A0 68c,device=3D003e,
[=A0=A0=A0 3.727908] ath10k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 7=
4 =

65 6d 2d 76 65 6e 64 6f 72=A0 subsystem-vendor
[=A0=A0=A0 3.727909] ath10k_pci 0000:05:00.0: 00000030: 3d 31 61 35 36 2c 7=
3 =

75 62 73 79 73 74 65 6d 2d=A0 =3D1a56,subsystem-
[=A0=A0=A0 3.727909] ath10k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3=
d =

35 33 35 62=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device=3D535b
[=A0=A0=A0 3.727911] ath10k_pci 0000:05:00.0: failed to fetch board data fo=
r =

bus=3Dpci,vendor=3D168c,device=3D003e,subsystem-vendor=3D0000,subsystem-dev=
ice=3D0000 =

from ath10k/QCA6174/hw3.0/board-2.bin
[=A0=A0=A0 3.728168] ath10k_pci 0000:05:00.0: boot fw request =

'ath10k/QCA6174/hw3.0/board.bin': 0
[=A0=A0=A0 3.728169] ath10k_pci 0000:05:00.0: using board api 1
[=A0=A0=A0 3.728177] ath10k_pci 0000:05:00.0: board_file api 1 bmi_id N/A =

crc32 ed5f849a
[=A0=A0=A0 3.729100] ath10k_pci 0000:05:00.0: boot did not find a pre =

calibration file, try DT next: -2
[=A0=A0=A0 3.729101] ath10k_pci 0000:05:00.0: unable to load pre cal data f=
rom =

DT: -2
[=A0=A0=A0 3.729101] ath10k_pci 0000:05:00.0: failed to load pre cal data: =
-2
[=A0=A0=A0 3.729102] ath10k_pci 0000:05:00.0: pre cal download procedure =

failed, try cal file: -2
[=A0=A0=A0 3.729103] ath10k_pci 0000:05:00.0: boot did not find a calibrati=
on =

file, try DT next: -2
[=A0=A0=A0 3.729103] ath10k_pci 0000:05:00.0: boot did not find DT entry, t=
ry =

target EEPROM next: -2
[=A0=A0=A0 3.729104] ath10k_pci 0000:05:00.0: boot did not find target EEPR=
OM =

entry, try OTP next: -95
[=A0=A0=A0 3.729123] ath10k_pci 0000:05:00.0: boot push board extended data =

addr 0x0
[=A0=A0=A0 3.734442] ath10k_pci 0000:05:00.0: boot upload otp to 0x1234 len=
 24193
[=A0=A0=A0 3.751164] ath10k_pci 0000:05:00.0: boot otp execute result 2
[=A0=A0=A0 3.751166] ath10k_pci 0000:05:00.0: boot using calibration mode o=
tp
[=A0=A0=A0 3.751167] ath10k_pci 0000:05:00.0: boot uploading firmware image =

ffffb2cc02227ed4 len 703151
[=A0=A0=A0 4.291417] ath10k_pci 0000:05:00.0: boot htc service 'Control' ul =

pipe 0 dl pipe 1 eid 0 ready
[=A0=A0=A0 4.291418] ath10k_pci 0000:05:00.0: boot htc service 'Control' ei=
d 0 =

TX flow control disabled
[=A0=A0=A0 4.291427] ath10k_pci 0000:05:00.0: htt tx max num pending tx 1056
[=A0=A0=A0 4.291434] ath10k_pci 0000:05:00.0: htt rx ring size 2048 fill_le=
vel =

1023
[=A0=A0=A0 4.291435] ath10k_pci 0000:05:00.0: boot hif start
[=A0=A0=A0 4.304531] ath10k_pci 0000:05:00.0: boot htc service HTT Data doe=
s =

not allocate target credits
[=A0=A0=A0 4.304575] ath10k_pci 0000:05:00.0: boot htc service 'HTT Data' u=
l =

pipe 4 dl pipe 1 eid 1 ready
[=A0=A0=A0 4.304576] ath10k_pci 0000:05:00.0: boot htc service 'HTT Data' e=
id =

1 TX flow control disabled
[=A0=A0=A0 4.304607] ath10k_pci 0000:05:00.0: boot htc service 'WMI' ul pip=
e 3 =

dl pipe 2 eid 2 ready
[=A0=A0=A0 4.304878] ath10k_pci 0000:05:00.0: firmware =

WLAN.RM.4.4.1-00026-QCARMSWP-1 booted
[=A0=A0=A0 4.319531] ath10k_pci 0000:05:00.0: Unknown eventid: 118809
[=A0=A0=A0 4.322438] ath10k_pci 0000:05:00.0: Unknown eventid: 90118
[=A0=A0=A0 4.323090] ath10k_pci 0000:05:00.0: htt target version 3.44
[=A0=A0=A0 4.323096] ath10k_pci 0000:05:00.0: htt-ver 3.44 wmi-op 4 htt-op =
3 =

cal otp max-sta 32 raw 0 hwcrypto 1
[=A0=A0 10.716831] ath10k_pci 0000:05:00.0: could not suspend target (-11)
[=A0=A0 10.716834] ath10k_pci 0000:05:00.0: boot hif stop
[=A0=A0 10.716835] ath10k_pci 0000:05:00.0: boot warm reset
[=A0=A0 10.750133] ath10k_pci 0000:05:00.0: boot init ce src ring id 0 =

entries 16 base_addr ffff9fcdf703e000
[=A0=A0 10.750142] ath10k_pci 0000:05:00.0: boot ce dest ring id 1 entries =

512 base_addr ffff9fcdf705e000
[=A0=A0 10.750151] ath10k_pci 0000:05:00.0: boot ce dest ring id 2 entries =

128 base_addr ffff9fcdf703f000
[=A0=A0 10.750161] ath10k_pci 0000:05:00.0: boot init ce src ring id 3 =

entries 32 base_addr ffff9fcdf7040000
[=A0=A0 10.750174] ath10k_pci 0000:05:00.0: boot init ce src ring id 4 =

entries 8192 base_addr ffff9fcdf7060000
[=A0=A0 10.750184] ath10k_pci 0000:05:00.0: boot init ce src ring id 7 =

entries 2 base_addr ffff9fcdf7041000
[=A0=A0 10.750192] ath10k_pci 0000:05:00.0: boot ce dest ring id 7 entries =
2 =

base_addr ffff9fcdf7042000
[=A0=A0 10.750193] ath10k_pci 0000:05:00.0: boot waiting target to initiali=
se
[=A0=A0 10.750195] ath10k_pci 0000:05:00.0: boot target indicator 0
[=A0=A0 10.760206] ath10k_pci 0000:05:00.0: boot target indicator 2
[=A0=A0 10.760212] ath10k_pci 0000:05:00.0: boot target initialised
[=A0=A0 10.776805] ath10k_pci 0000:05:00.0: boot init ce src ring id 0 =

entries 16 base_addr ffff9fcdf703e000
[=A0=A0 10.776819] ath10k_pci 0000:05:00.0: boot ce dest ring id 1 entries =

512 base_addr ffff9fcdf705e000
[=A0=A0 10.776831] ath10k_pci 0000:05:00.0: boot ce dest ring id 2 entries =

128 base_addr ffff9fcdf703f000
[=A0=A0 10.776846] ath10k_pci 0000:05:00.0: boot init ce src ring id 3 =

entries 32 base_addr ffff9fcdf7040000
[=A0=A0 10.776862] ath10k_pci 0000:05:00.0: boot init ce src ring id 4 =

entries 8192 base_addr ffff9fcdf7060000
[=A0=A0 10.776877] ath10k_pci 0000:05:00.0: boot init ce src ring id 7 =

entries 2 base_addr ffff9fcdf7041000
[=A0=A0 10.776889] ath10k_pci 0000:05:00.0: boot ce dest ring id 7 entries =
2 =

base_addr ffff9fcdf7042000
[=A0=A0 10.776890] ath10k_pci 0000:05:00.0: boot waiting target to initiali=
se
[=A0=A0 10.776893] ath10k_pci 0000:05:00.0: boot target indicator 0
[=A0=A0 10.786902] ath10k_pci 0000:05:00.0: boot target indicator 2
[=A0=A0 10.786909] ath10k_pci 0000:05:00.0: boot target initialised
[=A0=A0 10.786909] ath10k_pci 0000:05:00.0: boot warm reset complete
[=A0=A0 10.787814] ath10k_pci 0000:05:00.0: boot hif power down
[=A0=A0 10.787922] ath10k_pci 0000:05:00.0: regulatory hint from WRDD =

(alpha2-code): AP
[=A0=A0 10.787923] ath10k_pci 0000:05:00.0: fallback to eeprom programmed =

regulatory settings
[=A0=A0 10.795609] ath10k_pci 0000:05:00.0 wlp5s0: renamed from wlan0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
