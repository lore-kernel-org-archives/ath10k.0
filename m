Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7o5M-00078q-Oc
 for ath10k@lists.infradead.org; Fri, 18 Nov 2016 18:40:35 +0000
Received: by mail-wm0-x244.google.com with SMTP id u144so8952567wmu.0
 for <ath10k@lists.infradead.org>; Fri, 18 Nov 2016 10:40:05 -0800 (PST)
From: Christian Lamparter <chunkeey@googlemail.com>
Subject: Re: IPQ4019 Firmware: board-2.bin vs board.bin
Date: Fri, 18 Nov 2016 19:40:01 +0100
Message-ID: <2201471.3r8NqtoCOn@debian64>
In-Reply-To: <CA+BoTQ=6x=4V8=1-Co4quZ3UDTzDT_Q=iP6R-pSQd1qkesMDSg@mail.gmail.com>
References: <3020314.NNveBmB38o@debian64>
 <CA+BoTQ=6x=4V8=1-Co4quZ3UDTzDT_Q=iP6R-pSQd1qkesMDSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart1611892.JB1qdEMJua"
Content-Transfer-Encoding: 7Bit
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>, "Valo,
 Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

This is a multi-part message in MIME format.

--nextPart1611892.JB1qdEMJua
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, November 18, 2016 6:25:24 PM CET Michal Kazior wrote:
> On 18 November 2016 at 17:46, Christian Lamparter
> <chunkeey@googlemail.com> wrote:
> > I've acquired a IPQ4019 Router (Asus RT-AC58U). And It has a IPQ4019-SoC.
> > I'm currently in the process of porting it to LEDE. I can report that the
> > router is booting and I got the ath10k to work with 4.8.8 +
> > LEDE's compat-wireless (2016-10-08-1).
> >
> > Now, I ran across a small discrepancy with the provided firmware for
> > the IPQ4019. From the ath10k's driver prospective it seems that the
> > board-2.bin provided on github[0] has the wrong filename:
> >
> > ath10k_ahb a000000.wifi: Direct firmware load for ath10k/pre-cal-ahb-a000000.wifi.bin failed with error -2
> > ath10k_ahb a000000.wifi: Falling back to user helper
> > firmware ath10k!pre-cal-ahb-a000000.wifi.bin: firmware_loading_store: map pages failed
> > ath10k_ahb a000000.wifi: qca4019 hw1.0 target 0x01000000 chip_id 0x003b00ff sub 0000:0000
> > ath10k_ahb a000000.wifi: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 1
> > ath10k_ahb a000000.wifi: firmware ver 10.4-3.2.1-00044 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param crc32 b9833652
> > ath10k_ahb a000000.wifi: failed to fetch board data for bus=ahb,vendor=0000,device=0000,subsystem-vendor=0000,subsystem-devn
> 
> As far as I remember QCA4019 is supposed to used bmi chip
> identification instead of pci ids for board files. For some reason the
> driver uses pci ids on your device. Can you load ath10k_core with
> debug_mask=0xffffff3f and post results, please? I recall OpenWRT was
> messing with board file logic with its downstream patches and I
> wouldn't be surprised if LEDE keeps on doing that as well.

I've attached the logs you want for both cases (board.bin and board2.bin).
LEDE does indeed patch ath10k [0]. But as far as I can tell, LEDE just
adds a extra path to supply the caldata [1] via request_firmware.
 
> > ath10k_ahb a000000.wifi: Direct firmware load for ath10k/QCA4019/hw1.0/board.bin failed with error -2
> > ath10k_ahb a000000.wifi: Falling back to user helper
> > firmware ath10k!QCA4019!hw1.0!board.bin: firmware_loading_store: map pages failed
> > ath10k_ahb a000000.wifi: failed to fetch board data
> > ath10k_ahb a000000.wifi: failed to fetch board file: -11
> > ath10k_ahb a000000.wifi: could not probe fw (-11)
> >
> > Now, If I rename board-2.bin to board.bin it works fine and the device initializes
> > successfully (and seems to work too):
> >
> > ath10k_ahb a000000.wifi: Direct firmware load for ath10k/pre-cal-ahb-a000000.wifi.bin failed with error -2
> > ath10k_ahb a000000.wifi: Falling back to user helper
> > firmware ath10k!pre-cal-ahb-a000000.wifi.bin: firmware_loading_store: map pages failed
> > ath10k_ahb a000000.wifi: qca4019 hw1.0 target 0x01000000 chip_id 0x003b00ff sub 0000:0000
> > ath10k_ahb a000000.wifi: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 1
> > ath10k_ahb a000000.wifi: firmware ver 10.4-3.2.1-00044 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param crc32 b9833652
> > ath10k_ahb a000000.wifi: Direct firmware load for ath10k/QCA4019/hw1.0/board-2.bin failed with error -2
> > ath10k_ahb a000000.wifi: Falling back to user helper
> > firmware ath10k!QCA4019!hw1.0!board-2.bin: firmware_loading_store: map pages failed
> > ath10k_ahb a000000.wifi: board_file api 1 bmi_id N/A crc32 9e6ce62c
> > ath10k_ahb a000000.wifi: htt-ver 2.2 wmi-op 6 htt-op 4 cal file max-sta 512 raw 0 hwcrypto 1
> 
> Please don't do that. Your basically pushing bogus data as board data
> to the device. I'm a ltittle surprised firmware didn't notice. Anyway,
> expect the device to misbehave (crash, hang, regulatory violations)
> with this "board.bin".
Ok, thanks. I reverted the changes and cancelled the ath10k-firmware
patches.

> > ath: EEPROM regdomain: 0x0
> > ath: EEPROM indicates default country code should be used
> > ath: doing EEPROM country->regdmn map search
> > ath: country maps to regdmn code: 0x3a
> > ath: Country alpha2 being used: US
> > ath: Regpair used: 0x3a
> >
> > What's up with the board-2.bin name? Kalle, can you rename it or
> > should ath10k look for board-2.bin instead?
> 
> board-2 is a key-value store of actual board files. Some devices,
> notably qca61x4 hw3+ and qca4019 need distinct board files to be
> uploaded. Otherwise they fail in various ways.

[0] <https://git.lede-project.org/?p=source.git;a=tree;f=package/kernel/mac80211/patches;h=c05ce02fb1c46d0573654a28a0b81d59b588cecd;hb=HEAD>

[1] <https://git.lede-project.org/?p=source.git;a=blob;f=package/kernel/mac80211/patches/936-ath10k_skip_otp_check.patch;h=fbda8d5ac176a5cd0e5fe144e3d878bf90cb895e;hb=HEAD>


--nextPart1611892.JB1qdEMJua
Content-Disposition: attachment; filename="ath10k_load.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="ath10k_load-board-2.txt"

[  262.519231] ath10k_ahb a000000.wifi: ahb probe
[  262.523040] ath10k_ahb a000000.wifi: irq: 174
[  262.523400] ath10k_ahb a000000.wifi: mem: 0xcde00000 mem_len: 2097152 gcc mem: 0xce080000 tcsr_mem: 0xce100000
[  262.537453] ath10k_ahb a000000.wifi: boot waiting target to initialise
[  262.537830] ath10k_ahb a000000.wifi: boot target indicator 80000000
[  262.554644] ath10k_ahb a000000.wifi: boot target indicator 80000002
[  262.554968] ath10k_ahb a000000.wifi: boot target initialised
[  262.561418] ath10k_ahb a000000.wifi: boot ahb hif power up
[  262.565927] ath10k_ahb a000000.wifi: axi bus halted
[  262.719252] ath10k_ahb a000000.wifi: core 0 reset done
[  262.719588] ath10k_ahb a000000.wifi: boot waiting target to initialise
[  262.723299] ath10k_ahb a000000.wifi: boot target indicator 80000002
[  262.729851] ath10k_ahb a000000.wifi: boot target initialised
[  262.735990] ath10k_ahb a000000.wifi: boot init ce src ring id 0 entries 16 base_addr cddc1000
[  262.741925] ath10k_ahb a000000.wifi: boot ce dest ring id 1 entries 512 base_addr cddc3000
[  262.750339] ath10k_ahb a000000.wifi: boot ce dest ring id 2 entries 128 base_addr cddc6000
[  262.758473] ath10k_ahb a000000.wifi: boot init ce src ring id 3 entries 32 base_addr cddc8000
[  262.766781] ath10k_ahb a000000.wifi: boot init ce src ring id 4 entries 8192 base_addr cddca000
[  262.775341] ath10k_ahb a000000.wifi: boot ce dest ring id 5 entries 512 base_addr cdddc000
[  262.783859] ath10k_ahb a000000.wifi: boot init ce src ring id 7 entries 2 base_addr cdddf000
[  262.792179] ath10k_ahb a000000.wifi: boot ce dest ring id 7 entries 2 base_addr cdde1000
[  262.800771] ath10k_ahb a000000.wifi: boot ce dest ring id 8 entries 128 base_addr cdde3000
[  262.820028] ath10k_ahb a000000.wifi: bmi get target info
[  262.820151] ath10k_ahb a000000.wifi: Hardware name qca4019 hw1.0 version 0x1000000
[  262.824658] ath10k_ahb a000000.wifi: Direct firmware load for ath10k/pre-cal-ahb-a000000.wifi.bin failed with error -2
[  262.831901] ath10k_ahb a000000.wifi: Falling back to user helper
[  262.885353] firmware ath10k!pre-cal-ahb-a000000.wifi.bin: firmware_loading_store: map pages failed
[  262.886151] ath10k_ahb a000000.wifi: found calibration file ath10k/cal-ahb-a000000.wifi.bin
[  262.893336] ath10k_ahb a000000.wifi: trying fw api 5
[  262.903669] ath10k_ahb a000000.wifi: found fw version 10.4-3.2.1-00047
[  262.906727] ath10k_ahb a000000.wifi: found fw timestamp 1479300476
[  262.913106] ath10k_ahb a000000.wifi: found otp image ie (4582 B)
[  262.919434] ath10k_ahb a000000.wifi: found fw image ie (359358 B)
[  262.925373] ath10k_ahb a000000.wifi: found firmware features ie (2 B)
[  262.931423] ath10k_ahb a000000.wifi: Enabling feature bit: 3
[  262.937759] ath10k_ahb a000000.wifi: Enabling feature bit: 12
[  262.943579] ath10k_ahb a000000.wifi: Enabling feature bit: 13
[  262.949128] ath10k_ahb a000000.wifi: Enabling feature bit: 14
[  262.954944] ath10k_ahb a000000.wifi: features
[  262.960657] ath10k_ahb a000000.wifi: 00000000: 08 70 00 00                                      .p..
[  262.964936] ath10k_ahb a000000.wifi: found fw ie wmi op version 6
[  262.974223] ath10k_ahb a000000.wifi: found fw ie htt op version 4
[  262.980163] ath10k_ahb a000000.wifi: found fw code swap image ie (150415 B)
[  262.986198] ath10k_ahb a000000.wifi: using fw api 5
[  262.993063] ath10k_ahb a000000.wifi: qca4019 hw1.0 target 0x01000000 chip_id 0x003b00ff sub 0000:0000
[  262.997837] ath10k_ahb a000000.wifi: kconfig debug 1 debugfs 1 tracing 0 dfs 1 testmode 1
[  263.012368] ath10k_ahb a000000.wifi: firmware ver 10.4-3.2.1-00047 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param crc32 68f59ec5
[  263.015394] ath10k_ahb a000000.wifi: boot did not find a pre calibration file, try DT next: -11
[  263.027408] ath10k_ahb a000000.wifi: unable to load pre cal data from DT: -2
[  263.036057] ath10k_ahb a000000.wifi: could not load pre cal data: -2
[  263.043352] ath10k_ahb a000000.wifi: boot using board name 'bus=ahb,vendor=0000,device=0000,subsystem-vendor=0000,subsystem-device=0000'
[  263.050819] ath10k_ahb a000000.wifi: board name
[  263.061978] ath10k_ahb a000000.wifi: 00000000: 62 75 73 3d 61 68 62 2c 62 6d 69 2d 63 68 69 70  bus=ahb,bmi-chip
[  263.066154] ath10k_ahb a000000.wifi: 00000010: 2d 69 64 3d 30 2c 62 6d 69 2d 62 6f 61 72 64 2d  -id=0,bmi-board-
[  263.076680] ath10k_ahb a000000.wifi: 00000020: 69 64 3d 31 36                                   id=16
[  263.086766] ath10k_ahb a000000.wifi: board name
[  263.095870] ath10k_ahb a000000.wifi: 00000000: 62 75 73 3d 61 68 62 2c 62 6d 69 2d 63 68 69 70  bus=ahb,bmi-chip
[  263.100211] ath10k_ahb a000000.wifi: 00000010: 2d 69 64 3d 30 2c 62 6d 69 2d 62 6f 61 72 64 2d  -id=0,bmi-board-
[  263.110625] ath10k_ahb a000000.wifi: 00000020: 69 64 3d 31 37                                   id=17
[  263.120776] ath10k_ahb a000000.wifi: board name
[  263.129886] ath10k_ahb a000000.wifi: 00000000: 62 75 73 3d 61 68 62 2c 62 6d 69 2d 63 68 69 70  bus=ahb,bmi-chip
[  263.134208] ath10k_ahb a000000.wifi: 00000010: 2d 69 64 3d 30 2c 62 6d 69 2d 62 6f 61 72 64 2d  -id=0,bmi-board-
[  263.144676] ath10k_ahb a000000.wifi: 00000020: 69 64 3d 31 38                                   id=18
[  263.154816] ath10k_ahb a000000.wifi: board name
[  263.164052] ath10k_ahb a000000.wifi: 00000000: 62 75 73 3d 61 68 62 2c 62 6d 69 2d 63 68 69 70  bus=ahb,bmi-chip
[  263.168231] ath10k_ahb a000000.wifi: 00000010: 2d 69 64 3d 30 2c 62 6d 69 2d 62 6f 61 72 64 2d  -id=0,bmi-board-
[  263.178682] ath10k_ahb a000000.wifi: 00000020: 69 64 3d 31 39                                   id=19
[  263.188826] ath10k_ahb a000000.wifi: board name
[  263.197928] ath10k_ahb a000000.wifi: 00000000: 62 75 73 3d 61 68 62 2c 62 6d 69 2d 63 68 69 70  bus=ahb,bmi-chip
[  263.202279] ath10k_ahb a000000.wifi: 00000010: 2d 69 64 3d 30 2c 62 6d 69 2d 62 6f 61 72 64 2d  -id=0,bmi-board-
[  263.212694] ath10k_ahb a000000.wifi: 00000020: 69 64 3d 32 30                                   id=20
[  263.222848] ath10k_ahb a000000.wifi: board name
[  263.231957] ath10k_ahb a000000.wifi: 00000000: 62 75 73 3d 61 68 62 2c 62 6d 69 2d 63 68 69 70  bus=ahb,bmi-chip
[  263.236286] ath10k_ahb a000000.wifi: 00000010: 2d 69 64 3d 30 2c 62 6d 69 2d 62 6f 61 72 64 2d  -id=0,bmi-board-
[  263.246721] ath10k_ahb a000000.wifi: 00000020: 69 64 3d 32 31                                   id=21
[  263.256877] ath10k_ahb a000000.wifi: failed to fetch board data for bus=ahb,vendor=0000,device=0000,subsystem-vendor=0000,subsystem-devn
[  263.266211] ath10k_ahb a000000.wifi: Direct firmware load for ath10k/QCA4019/hw1.0/board.bin failed with error -2
[  263.282162] ath10k_ahb a000000.wifi: Falling back to user helper
[  263.324063] firmware ath10k!QCA4019!hw1.0!board.bin: firmware_loading_store: map pages failed
[  263.324378] ath10k_ahb a000000.wifi: failed to fetch board data
[  263.331651] ath10k_ahb a000000.wifi: failed to fetch board file: -11
[  263.337505] ath10k_ahb a000000.wifi: boot hif power down
[  263.343991] ath10k_ahb a000000.wifi: could not probe fw (-11)
[  263.350373] ath10k_ahb a800000.wifi: ahb probe
[  263.355141] ath10k_ahb a800000.wifi: irq: 191
[  263.359248] ath10k_ahb a800000.wifi: mem: 0xce200000 mem_len: 2097152 gcc mem: 0xce480000 tcsr_mem: 0xce500000
[  263.365112] ath10k_ahb a800000.wifi: boot waiting target to initialise
[  263.373583] ath10k_ahb a800000.wifi: boot target indicator 80000002
[  263.380047] ath10k_ahb a800000.wifi: boot target initialised
[  263.386357] ath10k_ahb a800000.wifi: boot ahb hif power up
[  263.392121] ath10k_ahb a800000.wifi: axi bus halted
[  263.539248] ath10k_ahb a800000.wifi: core 1 reset done
[  263.539587] ath10k_ahb a800000.wifi: boot waiting target to initialise
[  263.543294] ath10k_ahb a800000.wifi: boot target indicator 80000002
[  263.549849] ath10k_ahb a800000.wifi: boot target initialised
[  263.555983] ath10k_ahb a800000.wifi: boot init ce src ring id 0 entries 16 base_addr ce0e1000
[  263.561918] ath10k_ahb a800000.wifi: boot ce dest ring id 1 entries 512 base_addr ce0e3000
[  263.570335] ath10k_ahb a800000.wifi: boot ce dest ring id 2 entries 128 base_addr ce0e6000
[  263.578467] ath10k_ahb a800000.wifi: boot init ce src ring id 3 entries 32 base_addr ce0e8000
[  263.586777] ath10k_ahb a800000.wifi: boot init ce src ring id 4 entries 8192 base_addr ce0ea000
[  263.595334] ath10k_ahb a800000.wifi: boot ce dest ring id 5 entries 512 base_addr ce0fc000
[  263.603850] ath10k_ahb a800000.wifi: boot init ce src ring id 7 entries 2 base_addr ce181000
[  263.612172] ath10k_ahb a800000.wifi: boot ce dest ring id 7 entries 2 base_addr ce183000
[  263.620764] ath10k_ahb a800000.wifi: boot ce dest ring id 8 entries 128 base_addr ce185000
[  263.640019] ath10k_ahb a800000.wifi: bmi get target info
[  263.640143] ath10k_ahb a800000.wifi: Hardware name qca4019 hw1.0 version 0x1000000
[  263.644647] ath10k_ahb a800000.wifi: Direct firmware load for ath10k/pre-cal-ahb-a800000.wifi.bin failed with error -2
[  263.651844] ath10k_ahb a800000.wifi: Falling back to user helper
[  263.705181] firmware ath10k!pre-cal-ahb-a800000.wifi.bin: firmware_loading_store: map pages failed
[  263.705839] ath10k_ahb a800000.wifi: found calibration file ath10k/cal-ahb-a800000.wifi.bin
[  263.713136] ath10k_ahb a800000.wifi: trying fw api 5
[  263.723216] ath10k_ahb a800000.wifi: found fw version 10.4-3.2.1-00047
[  263.726530] ath10k_ahb a800000.wifi: found fw timestamp 1479300476
[  263.732965] ath10k_ahb a800000.wifi: found otp image ie (4582 B)
[  263.739036] ath10k_ahb a800000.wifi: found fw image ie (359358 B)
[  263.745418] ath10k_ahb a800000.wifi: found firmware features ie (2 B)
[  263.751276] ath10k_ahb a800000.wifi: Enabling feature bit: 3
[  263.757605] ath10k_ahb a800000.wifi: Enabling feature bit: 12
[  263.763363] ath10k_ahb a800000.wifi: Enabling feature bit: 13
[  263.768956] ath10k_ahb a800000.wifi: Enabling feature bit: 14
[  263.774750] ath10k_ahb a800000.wifi: features
[  263.780452] ath10k_ahb a800000.wifi: 00000000: 08 70 00 00                                      .p..
[  263.784764] ath10k_ahb a800000.wifi: found fw ie wmi op version 6
[  263.793986] ath10k_ahb a800000.wifi: found fw ie htt op version 4
[  263.799975] ath10k_ahb a800000.wifi: found fw code swap image ie (150415 B)
[  263.806025] ath10k_ahb a800000.wifi: using fw api 5
[  263.812831] ath10k_ahb a800000.wifi: qca4019 hw1.0 target 0x01000000 chip_id 0x003b00ff sub 0000:0000
[  263.817666] ath10k_ahb a800000.wifi: kconfig debug 1 debugfs 1 tracing 0 dfs 1 testmode 1
[  263.832151] ath10k_ahb a800000.wifi: firmware ver 10.4-3.2.1-00047 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param crc32 68f59ec5
[  263.835233] ath10k_ahb a800000.wifi: boot did not find a pre calibration file, try DT next: -11
[  263.847237] ath10k_ahb a800000.wifi: unable to load pre cal data from DT: -2
[  263.855903] ath10k_ahb a800000.wifi: could not load pre cal data: -2
[  263.863183] ath10k_ahb a800000.wifi: boot using board name 'bus=ahb,vendor=0000,device=0000,subsystem-vendor=0000,subsystem-device=0000'
[  263.870586] ath10k_ahb a800000.wifi: board name
[  263.881785] ath10k_ahb a800000.wifi: 00000000: 62 75 73 3d 61 68 62 2c 62 6d 69 2d 63 68 69 70  bus=ahb,bmi-chip
[  263.885983] ath10k_ahb a800000.wifi: 00000010: 2d 69 64 3d 30 2c 62 6d 69 2d 62 6f 61 72 64 2d  -id=0,bmi-board-
[  263.896496] ath10k_ahb a800000.wifi: 00000020: 69 64 3d 31 36                                   id=16
[  263.906606] ath10k_ahb a800000.wifi: board name
[  263.915700] ath10k_ahb a800000.wifi: 00000000: 62 75 73 3d 61 68 62 2c 62 6d 69 2d 63 68 69 70  bus=ahb,bmi-chip
[  263.920040] ath10k_ahb a800000.wifi: 00000010: 2d 69 64 3d 30 2c 62 6d 69 2d 62 6f 61 72 64 2d  -id=0,bmi-board-
[  263.930450] ath10k_ahb a800000.wifi: 00000020: 69 64 3d 31 37                                   id=17
[  263.940604] ath10k_ahb a800000.wifi: board name
[  263.949716] ath10k_ahb a800000.wifi: 00000000: 62 75 73 3d 61 68 62 2c 62 6d 69 2d 63 68 69 70  bus=ahb,bmi-chip
[  263.954033] ath10k_ahb a800000.wifi: 00000010: 2d 69 64 3d 30 2c 62 6d 69 2d 62 6f 61 72 64 2d  -id=0,bmi-board-
[  263.964477] ath10k_ahb a800000.wifi: 00000020: 69 64 3d 31 38                                   id=18
[  263.974774] ath10k_ahb a800000.wifi: board name
[  263.983749] ath10k_ahb a800000.wifi: 00000000: 62 75 73 3d 61 68 62 2c 62 6d 69 2d 63 68 69 70  bus=ahb,bmi-chip
[  263.988060] ath10k_ahb a800000.wifi: 00000010: 2d 69 64 3d 30 2c 62 6d 69 2d 62 6f 61 72 64 2d  -id=0,bmi-board-
[  263.998505] ath10k_ahb a800000.wifi: 00000020: 69 64 3d 31 39                                   id=19
[  264.008649] ath10k_ahb a800000.wifi: board name
[  264.017800] ath10k_ahb a800000.wifi: 00000000: 62 75 73 3d 61 68 62 2c 62 6d 69 2d 63 68 69 70  bus=ahb,bmi-chip
[  264.022145] ath10k_ahb a800000.wifi: 00000010: 2d 69 64 3d 30 2c 62 6d 69 2d 62 6f 61 72 64 2d  -id=0,bmi-board-
[  264.032531] ath10k_ahb a800000.wifi: 00000020: 69 64 3d 32 30                                   id=20
[  264.042676] ath10k_ahb a800000.wifi: board name
[  264.051784] ath10k_ahb a800000.wifi: 00000000: 62 75 73 3d 61 68 62 2c 62 6d 69 2d 63 68 69 70  bus=ahb,bmi-chip
[  264.056113] ath10k_ahb a800000.wifi: 00000010: 2d 69 64 3d 30 2c 62 6d 69 2d 62 6f 61 72 64 2d  -id=0,bmi-board-
[  264.066553] ath10k_ahb a800000.wifi: 00000020: 69 64 3d 32 31                                   id=21
[  264.076707] ath10k_ahb a800000.wifi: failed to fetch board data for bus=ahb,vendor=0000,device=0000,subsystem-vendor=0000,subsystem-devn
[  264.086039] ath10k_ahb a800000.wifi: Direct firmware load for ath10k/QCA4019/hw1.0/board.bin failed with error -2
[  264.101992] ath10k_ahb a800000.wifi: Falling back to user helper
[  264.143784] firmware ath10k!QCA4019!hw1.0!board.bin: firmware_loading_store: map pages failed
[  264.144054] ath10k_ahb a800000.wifi: failed to fetch board data
[  264.151359] ath10k_ahb a800000.wifi: failed to fetch board file: -11
[  264.157199] ath10k_ahb a800000.wifi: boot hif power down
[  264.163712] ath10k_ahb a800000.wifi: could not probe fw (-11)


--nextPart1611892.JB1qdEMJua
Content-Disposition: attachment; filename="ath10k_load-board.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="ath10k_load-board.txt"

[  407.739465] ath10k_ahb a000000.wifi: ahb probe
[  407.740334] ath10k_ahb a000000.wifi: irq: 174
[  407.742881] ath10k_ahb a000000.wifi: mem: 0xce600000 mem_len: 2097152 gcc mem: 0xce880000 tcsr_mem: 0xce900000
[  407.750095] ath10k_ahb a000000.wifi: boot waiting target to initialise
[  407.757226] ath10k_ahb a000000.wifi: boot target indicator 80000002
[  407.764869] ath10k_ahb a000000.wifi: boot target initialised
[  407.770235] ath10k_ahb a000000.wifi: boot ahb hif power up
[  407.775775] ath10k_ahb a000000.wifi: axi bus halted
[  407.929361] ath10k_ahb a000000.wifi: core 0 reset done
[  407.929843] ath10k_ahb a000000.wifi: boot waiting target to initialise
[  407.933450] ath10k_ahb a000000.wifi: boot target indicator 80000002
[  407.940062] ath10k_ahb a000000.wifi: boot target initialised
[  407.946150] ath10k_ahb a000000.wifi: boot init ce src ring id 0 entries 16 base_addr ce1b2000
[  407.952160] ath10k_ahb a000000.wifi: boot ce dest ring id 1 entries 512 base_addr ce1b4000
[  407.960564] ath10k_ahb a000000.wifi: boot ce dest ring id 2 entries 128 base_addr ce1b7000
[  407.968634] ath10k_ahb a000000.wifi: boot init ce src ring id 3 entries 32 base_addr ce1b9000
[  407.977052] ath10k_ahb a000000.wifi: boot init ce src ring id 4 entries 8192 base_addr ce1bb000
[  407.985727] ath10k_ahb a000000.wifi: boot ce dest ring id 5 entries 512 base_addr ce1cd000
[  407.994088] ath10k_ahb a000000.wifi: boot init ce src ring id 7 entries 2 base_addr ce1d0000
[  408.002401] ath10k_ahb a000000.wifi: boot ce dest ring id 7 entries 2 base_addr ce1d2000
[  408.011107] ath10k_ahb a000000.wifi: boot ce dest ring id 8 entries 128 base_addr ce1d4000
[  408.030378] ath10k_ahb a000000.wifi: bmi get target info
[  408.030680] ath10k_ahb a000000.wifi: Hardware name qca4019 hw1.0 version 0x1000000
[  408.035331] ath10k_ahb a000000.wifi: Direct firmware load for ath10k/pre-cal-ahb-a000000.wifi.bin failed with error -2
[  408.042380] ath10k_ahb a000000.wifi: Falling back to user helper
[  408.152207] firmware ath10k!pre-cal-ahb-a000000.wifi.bin: firmware_loading_store: map pages failed
[  408.153847] ath10k_ahb a000000.wifi: found calibration file ath10k/cal-ahb-a000000.wifi.bin
[  408.160309] ath10k_ahb a000000.wifi: trying fw api 5
[  408.172141] ath10k_ahb a000000.wifi: found fw version 10.4-3.2.1-00047
[  408.173596] ath10k_ahb a000000.wifi: found fw timestamp 1479300476
[  408.180161] ath10k_ahb a000000.wifi: found otp image ie (4582 B)
[  408.186090] ath10k_ahb a000000.wifi: found fw image ie (359358 B)
[  408.192607] ath10k_ahb a000000.wifi: found firmware features ie (2 B)
[  408.198271] ath10k_ahb a000000.wifi: Enabling feature bit: 3
[  408.204872] ath10k_ahb a000000.wifi: Enabling feature bit: 12
[  408.210546] ath10k_ahb a000000.wifi: Enabling feature bit: 13
[  408.216032] ath10k_ahb a000000.wifi: Enabling feature bit: 14
[  408.221888] ath10k_ahb a000000.wifi: features
[  408.227500] ath10k_ahb a000000.wifi: 00000000: 08 70 00 00                                      .p..
[  408.232043] ath10k_ahb a000000.wifi: found fw ie wmi op version 6
[  408.241258] ath10k_ahb a000000.wifi: found fw ie htt op version 4
[  408.247020] ath10k_ahb a000000.wifi: found fw code swap image ie (150415 B)
[  408.253148] ath10k_ahb a000000.wifi: using fw api 5
[  408.259895] ath10k_ahb a000000.wifi: qca4019 hw1.0 target 0x01000000 chip_id 0x003b00ff sub 0000:0000
[  408.264715] ath10k_ahb a000000.wifi: kconfig debug 1 debugfs 1 tracing 0 dfs 1 testmode 1
[  408.279188] ath10k_ahb a000000.wifi: firmware ver 10.4-3.2.1-00047 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param crc32 68f59ec5
[  408.282260] ath10k_ahb a000000.wifi: boot did not find a pre calibration file, try DT next: -11
[  408.294302] ath10k_ahb a000000.wifi: unable to load pre cal data from DT: -2
[  408.302945] ath10k_ahb a000000.wifi: could not load pre cal data: -2
[  408.310239] ath10k_ahb a000000.wifi: boot using board name 'bus=ahb,vendor=0000,device=0000,subsystem-vendor=0000,subsystem-device=0000'
[  408.316782] ath10k_ahb a000000.wifi: Direct firmware load for ath10k/QCA4019/hw1.0/board-2.bin failed with error -2
[  408.328838] ath10k_ahb a000000.wifi: Falling back to user helper
[  408.381664] firmware ath10k!QCA4019!hw1.0!board-2.bin: firmware_loading_store: map pages failed
[  408.383078] ath10k_ahb a000000.wifi: using board api 1
[  408.390031] ath10k_ahb a000000.wifi: board_file api 1 bmi_id N/A crc32 9e6ce62c
[  408.394925] ath10k_ahb a000000.wifi: bmi start
[  408.401812] ath10k_ahb a000000.wifi: bmi write address 0x400800 length 4
[  408.406169] ath10k_ahb a000000.wifi: bmi read address 0x400810 length 4
[  408.414292] ath10k_ahb a000000.wifi: bmi write address 0x400810 length 4
[  408.419404] ath10k_ahb a000000.wifi: bmi write address 0x400844 length 4
[  408.426331] ath10k_ahb a000000.wifi: bmi write address 0x400904 length 4
[  408.433059] ath10k_ahb a000000.wifi: bmi write address 0x4008bc length 4
[  408.439688] ath10k_ahb a000000.wifi: boot did not find a pre calibration file, try DT next: -11
[  408.446319] ath10k_ahb a000000.wifi: unable to load pre cal data from DT: -2
[  408.454768] ath10k_ahb a000000.wifi: failed to load pre cal data: -2
[  408.462063] ath10k_ahb a000000.wifi: pre cal download procedure failed, try cal file: -2
[  408.468360] ath10k_ahb a000000.wifi: bmi read address 0x4008ac length 4
[  408.476541] ath10k_ahb a000000.wifi: boot push board extended data addr 0x0
[  408.482828] ath10k_ahb a000000.wifi: bmi read address 0x400854 length 4
[  408.489869] ath10k_ahb a000000.wifi: bmi write address 0xc0000 length 12064
[  408.515883] ath10k_ahb a000000.wifi: bmi write address 0x400858 length 4
[  408.516072] ath10k_ahb a000000.wifi: boot cal file downloaded
[  408.521706] ath10k_ahb a000000.wifi: boot using calibration mode file
[  408.527300] ath10k_ahb a000000.wifi: boot found firmware code swap binary
[  408.533766] ath10k_ahb a000000.wifi: bmi write address 0x417010 length 208
[  408.540551] ath10k_ahb a000000.wifi: boot uploading firmware image ce582228 len 359358
[  408.547271] ath10k_ahb a000000.wifi: bmi fast download address 0x1234 buffer 0xce582228 length 359358
[  408.555206] ath10k_ahb a000000.wifi: bmi lz stream start address 0x1234
[  408.564494] ath10k_ahb a000000.wifi: bmi lz data buffer 0xce582228 length 359356
[  409.768736] ath10k_ahb a000000.wifi: bmi lz data buffer 0xc705de1c length 4
[  409.768802] ath10k_ahb a000000.wifi: bmi lz stream start address 0x0
[  409.774573] ath10k_ahb a000000.wifi: bmi write address 0x400814 length 4
[  409.781169] ath10k_ahb a000000.wifi: pci hif get default pipe
[  409.787796] ath10k_ahb a000000.wifi: pci hif map service
[  409.793472] ath10k_ahb a000000.wifi: bmi done
[  409.798836] ath10k_ahb a000000.wifi: htt tx max num pending tx 2500
[  409.804382] ath10k_ahb a000000.wifi: htt rx ring size 2048 fill_level 1023
[  409.809151] ath10k_ahb a000000.wifi: boot ahb hif start
[  409.817795] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 20
[  409.823485] ath10k_ahb a000000.wifi: Target ready! transmit resources: 2 size:1792
[  409.827176] ath10k_ahb a000000.wifi: pci hif map service
[  409.834563] ath10k_ahb a000000.wifi: boot htc service 'Control' ul pipe 0 dl pipe 1 eid 0 ready
[  409.840202] ath10k_ahb a000000.wifi: boot htc service 'Control' eid 0 TX flow control disabled
[  409.848392] ath10k_ahb a000000.wifi: boot htc service HTT Data does not allocate target credits
[  409.857109] ath10k_ahb a000000.wifi: ath10k_htc_build_tx_ctrl_skb: skb c56ad9c0
[  409.865880] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x809b1dcc len 16 n_items 1
[  409.873021] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 0 skb c56ad9c0
[  409.880995] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 20
[  409.888899] ath10k_ahb a000000.wifi: HTC Service HTT Data connect response: status: 0x0, assigned ep: 0x1
[  409.894648] ath10k_ahb a000000.wifi: pci hif map service
[  409.904248] ath10k_ahb a000000.wifi: boot htc service 'HTT Data' ul pipe 4 dl pipe 5 eid 1 ready
[  409.909450] ath10k_ahb a000000.wifi: boot htc service 'HTT Data' eid 1 TX flow control disabled
[  409.918185] ath10k_ahb a000000.wifi: ath10k_htc_build_tx_ctrl_skb: skb c086be40
[  409.926813] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x8544524c len 16 n_items 1
[  409.933961] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 0 skb c086be40
[  409.941929] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 20
[  409.949855] ath10k_ahb a000000.wifi: HTC Service WMI connect response: status: 0x0, assigned ep: 0x2
[  409.955548] ath10k_ahb a000000.wifi: pci hif map service
[  409.964662] ath10k_ahb a000000.wifi: boot htc service 'WMI' ul pipe 3 dl pipe 2 eid 2 ready
[  409.970135] ath10k_ahb a000000.wifi: ath10k_htc_build_tx_ctrl_skb: skb c4ae2300
[  409.977988] ath10k_ahb a000000.wifi: HTC is using TX credit flow control
[  409.985318] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x80a48c4c len 20 n_items 1
[  409.992462] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 0 skb c4ae2300
[  410.000002] ath10k_ahb a000000.wifi: pci rx ce pipe 2 len 284
[  410.007675] ath10k_ahb a000000.wifi: htc rx completion ep 2 skb c095b600
[  410.013610] ath10k_ahb a000000.wifi: testmode event wmi cmd_id 32768 skb c095b600 skb->len 272
[  410.020384] ath10k_ahb a000000.wifi: 00000000: 00 00 00 01 2f 00 00 00 03 00 00 00 02 00 00 00  ..../...........
[  410.028776] ath10k_ahb a000000.wifi: 00000010: 05 00 00 00 08 00 00 00 07 00 00 00 07 00 00 00  ................
[  410.039130] ath10k_ahb a000000.wifi: 00000020: 09 00 00 00 04 00 00 00 01 00 00 00 0a 00 00 00  ................
[  410.049293] ath10k_ahb a000000.wifi: 00000030: 08 00 00 00 0d 00 00 00 07 00 00 00 0e 00 00 00  ................
[  410.059442] ath10k_ahb a000000.wifi: 00000040: 06 00 00 00 07 00 00 00 01 00 00 00 00 00 00 00  ................
[  410.069597] ath10k_ahb a000000.wifi: 00000050: 00 00 00 00 02 00 00 00 5b 08 00 00 b2 59 99 33  ........[....Y.3
[  410.079755] ath10k_ahb a000000.wifi: 00000060: fa ff 00 00 3f 00 00 00 3f 00 00 00 00 00 00 00  ....?...?.......
[  410.089911] ath10k_ahb a000000.wifi: 00000070: 3f 00 00 00 07 00 00 00 c0 0b 00 00 0c 68 00 00  ?............h..
[  410.100069] ath10k_ahb a000000.wifi: 00000080: 08 09 00 00 ac 0a 00 00 30 13 00 00 d4 17 00 00  ........0.......
[  410.110224] ath10k_ahb a000000.wifi: 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 07 00 00 00  ................
[  410.120377] ath10k_ahb a000000.wifi: 000000a0: 01 00 00 00 d0 02 00 00 02 00 00 00 00 00 00 00  ................
[  410.130552] ath10k_ahb a000000.wifi: 000000b0: 02 00 00 00 00 01 00 00 0c 00 00 00 01 00 00 00  ................
[  410.140692] ath10k_ahb a000000.wifi: 000000c0: 03 00 00 00 00 04 00 00 0c 00 00 00 01 00 00 00  ................
[  410.150848] ath10k_ahb a000000.wifi: 000000d0: 04 00 00 00 00 10 00 00 0c 00 00 00 01 00 00 00  ................
[  410.161003] ath10k_ahb a000000.wifi: 000000e0: 06 00 00 00 00 0c 00 00 00 00 00 00 23 00 00 00  ............#...
[  410.171158] ath10k_ahb a000000.wifi: 000000f0: 07 00 00 00 00 18 00 00 00 00 00 00 01 00 00 00  ................
[  410.181315] ath10k_ahb a000000.wifi: 00000100: 05 00 00 00 fc 07 00 00 02 00 00 00 00 00 00 00  ................
[  410.191834] ath10k_ahb a000000.wifi: wmi svc: 00000000: 08 00 00 00 07 00 00 00 07 00 00 00 09 00 00 00  ................
[  410.201820] ath10k_ahb a000000.wifi: wmi svc: 00000010: 04 00 00 00 01 00 00 00 0a 00 00 00 08 00 00 00  ................
[  410.212622] ath10k_ahb a000000.wifi: wmi svc: 00000020: 0d 00 00 00 07 00 00 00 0e 00 00 00 06 00 00 00  ................
[  410.223550] ath10k_ahb a000000.wifi: wmi svc: 00000030: 07 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00  ................
[  410.234489] ath10k_ahb a000000.wifi: wmi mem_req_id 1 num_units 0 num_unit_info 2 unit size 720 actual units 529
[  410.245772] ath10k_ahb a000000.wifi: wmi mem_req_id 2 num_units 1 num_unit_info 12 unit size 256 actual units 52
[  410.255684] ath10k_ahb a000000.wifi: wmi mem_req_id 3 num_units 1 num_unit_info 12 unit size 1024 actual units 52
[  410.265873] ath10k_ahb a000000.wifi: wmi mem_req_id 4 num_units 1 num_unit_info 12 unit size 4096 actual units 52
[  410.276153] ath10k_ahb a000000.wifi: wmi mem_req_id 6 num_units 35 num_unit_info 0 unit size 3072 actual units 35
[  410.286311] ath10k_ahb a000000.wifi: wmi mem_req_id 7 num_units 1 num_unit_info 0 unit size 6144 actual units 1
[  410.296504] ath10k_ahb a000000.wifi: wmi mem_req_id 5 num_units 0 num_unit_info 2 unit size 2044 actual units 529
[  410.308331] ath10k_ahb a000000.wifi: wmi event service ready min_tx_power 0x0000003f max_tx_power 0x0000003f ht_cap 0x0000085b vht_cap 7
[  410.320664] ath10k_ahb a000000.wifi: firmware 10.4-3.2.1-00047 booted
[  410.342552] ath10k_ahb a000000.wifi: wmi ext resource config host type 1 firmware feature bitmap 00000032
[  410.349013] ath10k_ahb a000000.wifi: htc ep 2 consumed 1 credits (total 1)
[  410.358603] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x855f0ec0 len 20 n_items 1
[  410.365388] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c54e8240
[  410.373305] ath10k_ahb a000000.wifi: wmi chunk 0 len 380880 requested, addr 0x85500000
[  410.381025] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 16
[  410.381043] ath10k_ahb a000000.wifi: htc ep 2 got 1 credits (total 2)
[  410.394785] ath10k_ahb a000000.wifi: wmi chunk 1 len 13312 requested, addr 0x8088c000
[  410.401124] ath10k_ahb a000000.wifi: wmi chunk 2 len 53248 requested, addr 0x85780000
[  410.408899] ath10k_ahb a000000.wifi: wmi chunk 3 len 212992 requested, addr 0x857c0000
[  410.416750] ath10k_ahb a000000.wifi: wmi chunk 4 len 107520 requested, addr 0x857a0000
[  410.424560] ath10k_ahb a000000.wifi: wmi chunk 5 len 6144 requested, addr 0x852d4000
[  410.432461] ath10k_ahb a000000.wifi: wmi chunk 6 len 1081276 requested, addr 0x85000000
[  410.440359] ath10k_ahb a000000.wifi: wmi init 10.4
[  410.448048] ath10k_ahb a000000.wifi: htc ep 2 consumed 1 credits (total 1)
[  410.452972] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x855f0c80 len 280 n_items 1
[  410.459827] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c54e8240
[  410.488823] ath10k_ahb a000000.wifi: pci rx ce pipe 5 len 28
[  410.488866] ath10k_ahb a000000.wifi: htt rx, msg_type: 0xF
[  410.493595] ath10k_ahb a000000.wifi: htt chan change freq 2412 phymode 11ng-ht20
[  410.498933] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 16
[  410.506465] ath10k_ahb a000000.wifi: htc ep 2 got 1 credits (total 2)
[  410.512125] ath10k_ahb a000000.wifi: pci rx ce pipe 2 len 40
[  410.518390] ath10k_ahb a000000.wifi: htc rx completion ep 2 skb c095b6c0
[  410.524159] ath10k_ahb a000000.wifi: testmode event wmi cmd_id 32769 skb c095b6c0 skb->len 28
[  410.530846] ath10k_ahb a000000.wifi: 00000000: 00 00 00 01 03 00 00 00 70 4d 7b 11 9f f8 00 00  ........pM{.....
[  410.539261] ath10k_ahb a000000.wifi: 00000010: 00 00 00 00 00 00 00 00 00 00 00 00              ............
[  410.549512] ath10k_ahb a000000.wifi: wmi event ready sw_version 16777216 abi_version 3 mac_addr 70:4d:7b:11:9f:f8 status 0
[  410.560452] ath10k_ahb a000000.wifi: WMI vdev create: id 0 type 2 subtype 0 macaddr 70:4d:7b:11:9f:f8
[  410.570184] ath10k_ahb a000000.wifi: htc ep 2 consumed 1 credits (total 1)
[  410.579447] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x84a9d200 len 32 n_items 1
[  410.586198] ath10k_ahb a000000.wifi: WMI vdev delete id 0
[  410.594111] ath10k_ahb a000000.wifi: htc ep 2 consumed 1 credits (total 0)
[  410.599406] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x84a9d0c0 len 16 n_items 1
[  410.606152] ath10k_ahb a000000.wifi: wmi echo value 0x0ba991e9
[  410.614167] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 16
[  410.619715] ath10k_ahb a000000.wifi: htc ep 2 got 1 credits (total 1)
[  410.625515] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 16
[  410.625533] ath10k_ahb a000000.wifi: htc ep 2 consumed 1 credits (total 0)
[  410.625549] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x84a9cf80 len 16 n_items 1
[  410.644274] ath10k_ahb a000000.wifi: htc ep 2 got 1 credits (total 1)
[  410.652207] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c54e8480
[  410.658492] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c54e8540
[  410.666331] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c54e8600
[  410.674358] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 16
[  410.682299] ath10k_ahb a000000.wifi: htc ep 2 got 1 credits (total 2)
[  410.688200] ath10k_ahb a000000.wifi: pci rx ce pipe 2 len 16
[  410.694538] ath10k_ahb a000000.wifi: htc rx completion ep 2 skb c095b780
[  410.700266] ath10k_ahb a000000.wifi: testmode event wmi cmd_id 36865 skb c095b780 skb->len 4
[  410.706930] ath10k_ahb a000000.wifi: 00000000: e9 91 a9 0b                                      ....
[  410.715373] ath10k_ahb a000000.wifi: wmi event echo value 0x0ba991e9
[  410.724529] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x855fff00 len 12 n_items 1
[  410.730861] ath10k_ahb a000000.wifi: pci rx ce pipe 5 len 12
[  410.738522] ath10k_ahb a000000.wifi: htt rx, msg_type: 0x0
[  410.744215] ath10k_ahb a000000.wifi: htt target version 2.2
[  410.749479] ath10k_ahb a000000.wifi: htt frag desc bank cmd
[  410.754935] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x855ffdc0 len 56 n_items 1
[  410.760516] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x855ffc80 len 48 n_items 1
[  410.768476] ath10k_ahb a000000.wifi: htt h2t aggr cfg msg amsdu 3 ampdu 64
[  410.776222] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x855ffb40 len 11 n_items 1
[  410.782907] ath10k_ahb a000000.wifi: wmi disable pktlog
[  410.783041] ath10k_ahb a000000.wifi: pci rx ce pipe 5 len 16
[  410.783050] ath10k_ahb a000000.wifi: htt rx, msg_type: 0x15
[  410.801644] ath10k_ahb a000000.wifi: htc ep 2 consumed 1 credits (total 1)
[  410.803911] ath10k_ahb a000000.wifi: pci rx ce pipe 2 len 128
[  410.803921] ath10k_ahb a000000.wifi: htc rx completion ep 2 skb c095b840
[  410.803932] ath10k_ahb a000000.wifi: testmode event wmi cmd_id 32770 skb c095b840 skb->len 116
[  410.803943] ath10k_ahb a000000.wifi: 00000000: 00 00 00 00 3d 0a 00 00 2e 58 fc 17 03 00 00 00  ....=....X......
[  410.803952] ath10k_ahb a000000.wifi: 00000010: 1e 00 00 00 4c 09 00 00 4c 09 00 00 00 00 00 00  ....L...L.......
[  410.803961] ath10k_ahb a000000.wifi: 00000020: 3d 0a 00 00 2e 58 fc 17 12 00 00 00 1e 00 00 00  =....X..........
[  410.803970] ath10k_ahb a000000.wifi: 00000030: 4c 09 00 00 4c 09 00 00 00 00 00 00 3d 0a 00 00  L...L.......=...
[  410.803979] ath10k_ahb a000000.wifi: 00000040: 2e 58 fc 17 45 00 00 00 1e 00 00 00 4c 09 00 00  .X..E.......L...
[  410.803988] ath10k_ahb a000000.wifi: 00000050: 4c 09 00 00 00 00 00 00 3d 0a 00 00 2e 58 fc 17  L.......=....X..
[  410.803997] ath10k_ahb a000000.wifi: 00000060: 67 00 00 00 1e 00 00 00 4c 09 00 00 4c 09 00 00  g.......L...L...
[  410.804006] ath10k_ahb a000000.wifi: 00000070: 00 00 00 00                                      ....
[  410.804015] ath10k_ahb a000000.wifi: wmi event debug mesg len 116
[  410.915292] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x855ffa00 len 12 n_items 1
[  410.921436] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 16
[  410.921452] ath10k_ahb a000000.wifi: htt-ver 2.2 wmi-op 6 htt-op 4 cal file max-sta 512 raw 0 hwcrypto 1
[  410.921468] ath10k_ahb a000000.wifi: wmi disable pktlog
[  410.921486] ath10k_ahb a000000.wifi: htc ep 2 consumed 1 credits (total 0)
[  410.921506] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x855ff8c0 len 12 n_items 1
[  410.956089] ath10k_ahb a000000.wifi: htc ep 2 got 1 credits (total 1)
[  410.964028] ath10k_ahb a000000.wifi: htc ep 2 consumed 1 credits (total 0)
[  410.964039] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c0a78840
[  410.964057] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c0a78540
[  410.964131] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 16
[  410.992971] ath10k_ahb a000000.wifi: htc ep 2 got 1 credits (total 1)
[  410.998867] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x855ff780 len 16 n_items 1
[  411.005304] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 16
[  411.013039] ath10k_ahb a000000.wifi: htc ep 2 got 1 credits (total 2)
[  411.018655] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 12
[  411.025016] ath10k_ahb a000000.wifi: boot suspend complete
[  411.030775] ath10k_ahb a000000.wifi: boot ahb hif stop
[  411.030786] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c0a786c0
[  411.047860] ath10k_ahb a000000.wifi: boot hif power down
[  411.049044] ath: EEPROM regdomain: 0x0
[  411.054700] ath: EEPROM indicates default country code should be used
[  411.058136] ath: doing EEPROM country->regdmn map search
[  411.064689] ath: country maps to regdmn code: 0x3a
[  411.070054] ath: Country alpha2 being used: US
[  411.074626] ath: Regpair used: 0x3a
[  411.079565] ath10k_ahb a000000.wifi: dfs region 0x1
[  411.094121] ath10k_ahb a800000.wifi: ahb probe
[  411.094762] ath10k_ahb a800000.wifi: irq: 191
[  411.097538] ath10k_ahb a800000.wifi: mem: 0xcec80000 mem_len: 2097152 gcc mem: 0xcef00000 tcsr_mem: 0xcef80000
[  411.104180] ath10k_ahb a800000.wifi: boot waiting target to initialise
[  411.112834] ath10k_ahb a800000.wifi: boot target indicator 80000002
[  411.118333] ath10k_ahb a800000.wifi: boot target initialised
[  411.124801] ath10k_ahb a800000.wifi: boot ahb hif power up
[  411.130475] ath10k_ahb a800000.wifi: axi bus halted
[  411.279329] ath10k_ahb a800000.wifi: core 1 reset done
[  411.279688] ath10k_ahb a800000.wifi: boot waiting target to initialise
[  411.283406] ath10k_ahb a800000.wifi: boot target indicator 80000002
[  411.290028] ath10k_ahb a800000.wifi: boot target initialised
[  411.296619] ath10k_ahb a800000.wifi: boot init ce src ring id 0 entries 16 base_addr ce1f5000
[  411.302125] ath10k_ahb a800000.wifi: boot ce dest ring id 1 entries 512 base_addr ce1f7000
[  411.310516] ath10k_ahb a800000.wifi: boot ce dest ring id 2 entries 128 base_addr ce1fa000
[  411.318587] ath10k_ahb a800000.wifi: boot init ce src ring id 3 entries 32 base_addr ce1fc000
[  411.326989] ath10k_ahb a800000.wifi: boot init ce src ring id 4 entries 8192 base_addr ce850000
[  411.335554] ath10k_ahb a800000.wifi: boot ce dest ring id 5 entries 512 base_addr ce4fb000
[  411.344194] ath10k_ahb a800000.wifi: boot init ce src ring id 7 entries 2 base_addr ce4fe000
[  411.352428] ath10k_ahb a800000.wifi: boot ce dest ring id 7 entries 2 base_addr ce862000
[  411.361019] ath10k_ahb a800000.wifi: boot ce dest ring id 8 entries 128 base_addr ce864000
[  411.380455] ath10k_ahb a800000.wifi: bmi get target info
[  411.380676] ath10k_ahb a800000.wifi: Hardware name qca4019 hw1.0 version 0x1000000
[  411.385413] ath10k_ahb a800000.wifi: Direct firmware load for ath10k/pre-cal-ahb-a800000.wifi.bin failed with error -2
[  411.392397] ath10k_ahb a800000.wifi: Falling back to user helper
[  411.502649] firmware ath10k!pre-cal-ahb-a800000.wifi.bin: firmware_loading_store: map pages failed
[  411.504295] ath10k_ahb a800000.wifi: found calibration file ath10k/cal-ahb-a800000.wifi.bin
[  411.510735] ath10k_ahb a800000.wifi: trying fw api 5
[  411.518881] ath10k_ahb a800000.wifi: found fw version 10.4-3.2.1-00047
[  411.524303] ath10k_ahb a800000.wifi: found fw timestamp 1479300476
[  411.530544] ath10k_ahb a800000.wifi: found otp image ie (4582 B)
[  411.536530] ath10k_ahb a800000.wifi: found fw image ie (359358 B)
[  411.543001] ath10k_ahb a800000.wifi: found firmware features ie (2 B)
[  411.548715] ath10k_ahb a800000.wifi: Enabling feature bit: 3
[  411.555255] ath10k_ahb a800000.wifi: Enabling feature bit: 12
[  411.560903] ath10k_ahb a800000.wifi: Enabling feature bit: 13
[  411.566474] ath10k_ahb a800000.wifi: Enabling feature bit: 14
[  411.572273] ath10k_ahb a800000.wifi: features
[  411.577943] ath10k_ahb a800000.wifi: 00000000: 08 70 00 00                                      .p..
[  411.582427] ath10k_ahb a800000.wifi: found fw ie wmi op version 6
[  411.591643] ath10k_ahb a800000.wifi: found fw ie htt op version 4
[  411.597499] ath10k_ahb a800000.wifi: found fw code swap image ie (150415 B)
[  411.603582] ath10k_ahb a800000.wifi: using fw api 5
[  411.610338] ath10k_ahb a800000.wifi: qca4019 hw1.0 target 0x01000000 chip_id 0x003b00ff sub 0000:0000
[  411.615157] ath10k_ahb a800000.wifi: kconfig debug 1 debugfs 1 tracing 0 dfs 1 testmode 1
[  411.629658] ath10k_ahb a800000.wifi: firmware ver 10.4-3.2.1-00047 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param crc32 68f59ec5
[  411.632698] ath10k_ahb a800000.wifi: boot did not find a pre calibration file, try DT next: -11
[  411.644709] ath10k_ahb a800000.wifi: unable to load pre cal data from DT: -2
[  411.653372] ath10k_ahb a800000.wifi: could not load pre cal data: -2
[  411.660685] ath10k_ahb a800000.wifi: boot using board name 'bus=ahb,vendor=0000,device=0000,subsystem-vendor=0000,subsystem-device=0000'
[  411.667230] ath10k_ahb a800000.wifi: Direct firmware load for ath10k/QCA4019/hw1.0/board-2.bin failed with error -2
[  411.679268] ath10k_ahb a800000.wifi: Falling back to user helper
[  411.731909] firmware ath10k!QCA4019!hw1.0!board-2.bin: firmware_loading_store: map pages failed
[  411.732287] ath10k_ahb a800000.wifi: using board api 1
[  411.740250] ath10k_ahb a800000.wifi: board_file api 1 bmi_id N/A crc32 9e6ce62c
[  411.745146] ath10k_ahb a800000.wifi: bmi start
[  411.751948] ath10k_ahb a800000.wifi: bmi write address 0x400800 length 4
[  411.756420] ath10k_ahb a800000.wifi: bmi read address 0x400810 length 4
[  411.763371] ath10k_ahb a800000.wifi: bmi write address 0x400810 length 4
[  411.769671] ath10k_ahb a800000.wifi: bmi write address 0x400844 length 4
[  411.776548] ath10k_ahb a800000.wifi: bmi write address 0x400904 length 4
[  411.783262] ath10k_ahb a800000.wifi: bmi write address 0x4008bc length 4
[  411.789923] ath10k_ahb a800000.wifi: boot did not find a pre calibration file, try DT next: -11
[  411.796565] ath10k_ahb a800000.wifi: unable to load pre cal data from DT: -2
[  411.805005] ath10k_ahb a800000.wifi: failed to load pre cal data: -2
[  411.812294] ath10k_ahb a800000.wifi: pre cal download procedure failed, try cal file: -2
[  411.818608] ath10k_ahb a800000.wifi: bmi read address 0x4008ac length 4
[  411.826784] ath10k_ahb a800000.wifi: boot push board extended data addr 0x0
[  411.833066] ath10k_ahb a800000.wifi: bmi read address 0x400854 length 4
[  411.840108] ath10k_ahb a800000.wifi: bmi write address 0xc0000 length 12064
[  411.866071] ath10k_ahb a800000.wifi: bmi write address 0x400858 length 4
[  411.866263] ath10k_ahb a800000.wifi: boot cal file downloaded
[  411.871871] ath10k_ahb a800000.wifi: boot using calibration mode file
[  411.877485] ath10k_ahb a800000.wifi: boot found firmware code swap binary
[  411.883933] ath10k_ahb a800000.wifi: bmi write address 0x417010 length 208
[  411.890724] ath10k_ahb a800000.wifi: boot uploading firmware image ce582228 len 359358
[  411.897454] ath10k_ahb a800000.wifi: bmi fast download address 0x1234 buffer 0xce582228 length 359358
[  411.905381] ath10k_ahb a800000.wifi: bmi lz stream start address 0x1234
[  411.914708] ath10k_ahb a800000.wifi: bmi lz data buffer 0xce582228 length 359356
[  413.118928] ath10k_ahb a800000.wifi: bmi lz data buffer 0xc705de1c length 4
[  413.118984] ath10k_ahb a800000.wifi: bmi lz stream start address 0x0
[  413.124753] ath10k_ahb a800000.wifi: bmi write address 0x400814 length 4
[  413.131345] ath10k_ahb a800000.wifi: pci hif get default pipe
[  413.137985] ath10k_ahb a800000.wifi: pci hif map service
[  413.143652] ath10k_ahb a800000.wifi: bmi done
[  413.149027] ath10k_ahb a800000.wifi: htt tx max num pending tx 2500
[  413.154608] ath10k_ahb a800000.wifi: htt rx ring size 2048 fill_level 1023
[  413.159388] ath10k_ahb a800000.wifi: boot ahb hif start
[  413.166569] ath10k_ahb a800000.wifi: pci rx ce pipe 1 len 20
[  413.171500] ath10k_ahb a800000.wifi: Target ready! transmit resources: 2 size:1792
[  413.177318] ath10k_ahb a800000.wifi: pci hif map service
[  413.184733] ath10k_ahb a800000.wifi: boot htc service 'Control' ul pipe 0 dl pipe 1 eid 0 ready
[  413.190189] ath10k_ahb a800000.wifi: boot htc service 'Control' eid 0 TX flow control disabled
[  413.198584] ath10k_ahb a800000.wifi: boot htc service HTT Data does not allocate target credits
[  413.207288] ath10k_ahb a800000.wifi: ath10k_htc_build_tx_ctrl_skb: skb c4beb600
[  413.215888] ath10k_ahb a800000.wifi: pci tx item 0 paddr 0x80a1ec0c len 16 n_items 1
[  413.223203] ath10k_ahb a800000.wifi: ath10k_htc_notify_tx_completion: ep 0 skb c4beb600
[  413.231175] ath10k_ahb a800000.wifi: pci rx ce pipe 1 len 20
[  413.238888] ath10k_ahb a800000.wifi: HTC Service HTT Data connect response: status: 0x0, assigned ep: 0x1
[  413.244788] ath10k_ahb a800000.wifi: pci hif map service
[  413.254247] ath10k_ahb a800000.wifi: boot htc service 'HTT Data' ul pipe 4 dl pipe 5 eid 1 ready
[  413.259628] ath10k_ahb a800000.wifi: boot htc service 'HTT Data' eid 1 TX flow control disabled
[  413.268377] ath10k_ahb a800000.wifi: ath10k_htc_build_tx_ctrl_skb: skb c4beb6c0
[  413.276825] ath10k_ahb a800000.wifi: pci tx item 0 paddr 0x80a1e9cc len 16 n_items 1
[  413.284133] ath10k_ahb a800000.wifi: ath10k_htc_notify_tx_completion: ep 0 skb c4beb6c0
[  413.292109] ath10k_ahb a800000.wifi: pci rx ce pipe 1 len 20
[  413.299844] ath10k_ahb a800000.wifi: HTC Service WMI connect response: status: 0x0, assigned ep: 0x2
[  413.305702] ath10k_ahb a800000.wifi: pci hif map service
[  413.314842] ath10k_ahb a800000.wifi: boot htc service 'WMI' ul pipe 3 dl pipe 2 eid 2 ready
[  413.320136] ath10k_ahb a800000.wifi: ath10k_htc_build_tx_ctrl_skb: skb c4beb780
[  413.328181] ath10k_ahb a800000.wifi: HTC is using TX credit flow control
[  413.335499] ath10k_ahb a800000.wifi: pci tx item 0 paddr 0x80a1e78c len 20 n_items 1
[  413.342468] ath10k_ahb a800000.wifi: ath10k_htc_notify_tx_completion: ep 0 skb c4beb780
[  413.350400] ath10k_ahb a800000.wifi: pci rx ce pipe 2 len 284
[  413.357867] ath10k_ahb a800000.wifi: htc rx completion ep 2 skb c099e0c0
[  413.363810] ath10k_ahb a800000.wifi: testmode event wmi cmd_id 32768 skb c099e0c0 skb->len 272
[  413.370576] ath10k_ahb a800000.wifi: 00000000: 00 00 00 01 2f 00 00 00 03 00 00 00 01 00 00 00  ..../...........
[  413.378967] ath10k_ahb a800000.wifi: 00000010: 05 00 00 00 08 00 00 00 07 00 00 00 07 00 00 00  ................
[  413.389332] ath10k_ahb a800000.wifi: 00000020: 09 00 00 00 04 00 00 00 01 00 00 00 0a 00 00 00  ................
[  413.399499] ath10k_ahb a800000.wifi: 00000030: 08 00 00 00 0d 00 00 00 03 00 00 00 0e 00 00 00  ................
[  413.409648] ath10k_ahb a800000.wifi: 00000040: 06 00 00 00 07 00 00 00 00 00 00 00 00 00 00 00  ................
[  413.419805] ath10k_ahb a800000.wifi: 00000050: 00 00 00 00 02 00 00 00 5b 08 00 00 b2 59 99 33  ........[....Y.3
[  413.429962] ath10k_ahb a800000.wifi: 00000060: fa ff 00 00 3f 00 00 00 3f 00 00 00 00 00 00 00  ....?...?.......
[  413.440115] ath10k_ahb a800000.wifi: 00000070: 3f 00 00 00 07 00 00 00 c0 0b 00 00 01 90 1f 00  ?...............
[  413.450270] ath10k_ahb a800000.wifi: 00000080: 08 09 00 00 ac 0a 00 00 30 13 00 00 d4 17 00 00  ........0.......
[  413.460429] ath10k_ahb a800000.wifi: 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 07 00 00 00  ................
[  413.470585] ath10k_ahb a800000.wifi: 000000a0: 01 00 00 00 d0 02 00 00 02 00 00 00 00 00 00 00  ................
[  413.480739] ath10k_ahb a800000.wifi: 000000b0: 02 00 00 00 00 01 00 00 0c 00 00 00 01 00 00 00  ................
[  413.490897] ath10k_ahb a800000.wifi: 000000c0: 03 00 00 00 00 04 00 00 0c 00 00 00 01 00 00 00  ................
[  413.501053] ath10k_ahb a800000.wifi: 000000d0: 04 00 00 00 00 10 00 00 0c 00 00 00 01 00 00 00  ................
[  413.511211] ath10k_ahb a800000.wifi: 000000e0: 06 00 00 00 00 0c 00 00 00 00 00 00 23 00 00 00  ............#...
[  413.521365] ath10k_ahb a800000.wifi: 000000f0: 07 00 00 00 00 18 00 00 00 00 00 00 01 00 00 00  ................
[  413.531520] ath10k_ahb a800000.wifi: 00000100: 05 00 00 00 fc 07 00 00 02 00 00 00 00 00 00 00  ................
[  413.541735] ath10k_ahb a800000.wifi: wmi svc: 00000000: 08 00 00 00 07 00 00 00 07 00 00 00 09 00 00 00  ................
[  413.552029] ath10k_ahb a800000.wifi: wmi svc: 00000010: 04 00 00 00 01 00 00 00 0a 00 00 00 08 00 00 00  ................
[  413.562860] ath10k_ahb a800000.wifi: wmi svc: 00000020: 0d 00 00 00 03 00 00 00 0e 00 00 00 06 00 00 00  ................
[  413.573797] ath10k_ahb a800000.wifi: wmi svc: 00000030: 07 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[  413.584737] ath10k_ahb a800000.wifi: wmi mem_req_id 1 num_units 0 num_unit_info 2 unit size 720 actual units 529
[  413.596198] ath10k_ahb a800000.wifi: wmi mem_req_id 2 num_units 1 num_unit_info 12 unit size 256 actual units 52
[  413.605943] ath10k_ahb a800000.wifi: wmi mem_req_id 3 num_units 1 num_unit_info 12 unit size 1024 actual units 52
[  413.616142] ath10k_ahb a800000.wifi: wmi mem_req_id 4 num_units 1 num_unit_info 12 unit size 4096 actual units 52
[  413.626487] ath10k_ahb a800000.wifi: wmi mem_req_id 6 num_units 35 num_unit_info 0 unit size 3072 actual units 35
[  413.636608] ath10k_ahb a800000.wifi: wmi mem_req_id 7 num_units 1 num_unit_info 0 unit size 6144 actual units 1
[  413.646725] ath10k_ahb a800000.wifi: wmi mem_req_id 5 num_units 0 num_unit_info 2 unit size 2044 actual units 529
[  413.658511] ath10k_ahb a800000.wifi: wmi event service ready min_tx_power 0x0000003f max_tx_power 0x0000003f ht_cap 0x0000085b vht_cap 7
[  413.670839] ath10k_ahb a800000.wifi: firmware 10.4-3.2.1-00047 booted
[  413.692730] ath10k_ahb a800000.wifi: wmi ext resource config host type 1 firmware feature bitmap 00000030
[  413.699234] ath10k_ahb a800000.wifi: htc ep 2 consumed 1 credits (total 1)
[  413.708750] ath10k_ahb a800000.wifi: pci tx item 0 paddr 0x80a1e640 len 20 n_items 1
[  413.715564] ath10k_ahb a800000.wifi: wmi chunk 0 len 380880 requested, addr 0x84e80000
[  413.715749] ath10k_ahb a800000.wifi: pci rx ce pipe 1 len 16
[  413.715772] ath10k_ahb a800000.wifi: htc ep 2 got 1 credits (total 2)
[  413.715824] ath10k_ahb a800000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c4beb840
[  413.743310] ath10k_ahb a800000.wifi: wmi chunk 1 len 13312 requested, addr 0x856e4000
[  413.751130] ath10k_ahb a800000.wifi: wmi chunk 2 len 53248 requested, addr 0x84e50000
[  413.759091] ath10k_ahb a800000.wifi: wmi chunk 3 len 212992 requested, addr 0x84f00000
[  413.766929] ath10k_ahb a800000.wifi: wmi chunk 4 len 107520 requested, addr 0x84e60000
[  413.774741] ath10k_ahb a800000.wifi: wmi chunk 5 len 6144 requested, addr 0x852d6000
[  413.782639] ath10k_ahb a800000.wifi: wmi chunk 6 len 1081276 requested, addr 0x84400000
[  413.790534] ath10k_ahb a800000.wifi: wmi init 10.4
[  413.798238] ath10k_ahb a800000.wifi: htc ep 2 consumed 1 credits (total 1)
[  413.803132] ath10k_ahb a800000.wifi: pci tx item 0 paddr 0x80a1e400 len 280 n_items 1
[  413.810152] ath10k_ahb a800000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c4beb900
[  413.838471] ath10k_ahb a800000.wifi: pci rx ce pipe 5 len 28
[  413.838512] ath10k_ahb a800000.wifi: htt rx, msg_type: 0xF
[  413.843242] ath10k_ahb a800000.wifi: htt chan change freq 5220 phymode 11ac-vht40
[  413.848566] ath10k_ahb a800000.wifi: pci rx ce pipe 1 len 16
[  413.856101] ath10k_ahb a800000.wifi: htc ep 2 got 1 credits (total 2)
[  413.861857] ath10k_ahb a800000.wifi: pci rx ce pipe 2 len 40
[  413.868120] ath10k_ahb a800000.wifi: htc rx completion ep 2 skb c099e000
[  413.873890] ath10k_ahb a800000.wifi: testmode event wmi cmd_id 32769 skb c099e000 skb->len 28
[  413.880577] ath10k_ahb a800000.wifi: 00000000: 00 00 00 01 03 00 00 00 70 4d 7b 11 9f fc 00 00  ........pM{.....
[  413.888962] ath10k_ahb a800000.wifi: 00000010: 00 00 00 00 00 00 00 00 00 00 00 00              ............
[  413.899256] ath10k_ahb a800000.wifi: wmi event ready sw_version 16777216 abi_version 3 mac_addr 70:4d:7b:11:9f:fc status 0
[  413.909058] ath10k_ahb a800000.wifi: WMI vdev create: id 0 type 2 subtype 0 macaddr 70:4d:7b:11:9f:fc
[  413.919907] ath10k_ahb a800000.wifi: htc ep 2 consumed 1 credits (total 1)
[  413.929155] ath10k_ahb a800000.wifi: pci tx item 0 paddr 0x80a1e2c0 len 32 n_items 1
[  413.935979] ath10k_ahb a800000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c4beb9c0
[  413.936100] ath10k_ahb a800000.wifi: WMI vdev delete id 0
[  413.936118] ath10k_ahb a800000.wifi: htc ep 2 consumed 1 credits (total 0)
[  413.936137] ath10k_ahb a800000.wifi: pci tx item 0 paddr 0x80a1e180 len 16 n_items 1
[  413.936155] ath10k_ahb a800000.wifi: wmi echo value 0x0ba991e9
[  413.971854] ath10k_ahb a800000.wifi: pci rx ce pipe 1 len 16
[  413.977412] ath10k_ahb a800000.wifi: htc ep 2 got 1 credits (total 1)
[  413.983279] ath10k_ahb a800000.wifi: pci rx ce pipe 1 len 16
[  413.983319] ath10k_ahb a800000.wifi: htc ep 2 consumed 1 credits (total 0)
[  413.983345] ath10k_ahb a800000.wifi: pci tx item 0 paddr 0x80a1e040 len 16 n_items 1
[  414.002006] ath10k_ahb a800000.wifi: htc ep 2 got 1 credits (total 1)
[  414.009956] ath10k_ahb a800000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c4beba80
[  414.016217] ath10k_ahb a800000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c4bebb40
[  414.024156] ath10k_ahb a800000.wifi: pci rx ce pipe 1 len 16
[  414.032054] ath10k_ahb a800000.wifi: htc ep 2 got 1 credits (total 2)
[  414.037943] ath10k_ahb a800000.wifi: pci rx ce pipe 2 len 16
[  414.044286] ath10k_ahb a800000.wifi: htc rx completion ep 2 skb c08c9f00
[  414.050016] ath10k_ahb a800000.wifi: testmode event wmi cmd_id 36865 skb c08c9f00 skb->len 4
[  414.056668] ath10k_ahb a800000.wifi: 00000000: e9 91 a9 0b                                      ....
[  414.065121] ath10k_ahb a800000.wifi: wmi event echo value 0x0ba991e9
[  414.074285] ath10k_ahb a800000.wifi: pci tx item 0 paddr 0x80a1df00 len 12 n_items 1
[  414.080754] ath10k_ahb a800000.wifi: pci rx ce pipe 5 len 12
[  414.088259] ath10k_ahb a800000.wifi: htt rx, msg_type: 0x0
[  414.093968] ath10k_ahb a800000.wifi: htt target version 2.2
[  414.099227] ath10k_ahb a800000.wifi: htt frag desc bank cmd
[  414.104672] ath10k_ahb a800000.wifi: pci tx item 0 paddr 0x80a1ddc0 len 56 n_items 1
[  414.110267] ath10k_ahb a800000.wifi: pci tx item 0 paddr 0x80a1dc80 len 48 n_items 1
[  414.118214] ath10k_ahb a800000.wifi: htt h2t aggr cfg msg amsdu 3 ampdu 64
[  414.125971] ath10k_ahb a800000.wifi: pci tx item 0 paddr 0x80a1db40 len 11 n_items 1
[  414.132700] ath10k_ahb a800000.wifi: pci rx ce pipe 5 len 16
[  414.132797] ath10k_ahb a800000.wifi: wmi disable pktlog
[  414.132817] ath10k_ahb a800000.wifi: htc ep 2 consumed 1 credits (total 1)
[  414.132837] ath10k_ahb a800000.wifi: pci tx item 0 paddr 0x80a1da00 len 12 n_items 1
[  414.132861] ath10k_ahb a800000.wifi: htt-ver 2.2 wmi-op 6 htt-op 4 cal file max-sta 512 raw 0 hwcrypto 1
[  414.132875] ath10k_ahb a800000.wifi: wmi disable pktlog
[  414.132891] ath10k_ahb a800000.wifi: htc ep 2 consumed 1 credits (total 0)
[  414.132911] ath10k_ahb a800000.wifi: pci tx item 0 paddr 0x80a1d8c0 len 12 n_items 1
[  414.187311] ath10k_ahb a800000.wifi: htt rx, msg_type: 0x15
[  414.195309] ath10k_ahb a800000.wifi: pci rx ce pipe 1 len 16
[  414.200543] ath10k_ahb a800000.wifi: htc ep 2 got 1 credits (total 1)
[  414.206416] ath10k_ahb a800000.wifi: pci rx ce pipe 1 len 16
[  414.206441] ath10k_ahb a800000.wifi: htc ep 2 consumed 1 credits (total 0)
[  414.206463] ath10k_ahb a800000.wifi: pci tx item 0 paddr 0x80a1d780 len 16 n_items 1
[  414.225182] ath10k_ahb a800000.wifi: htc ep 2 got 1 credits (total 1)
[  414.233123] ath10k_ahb a800000.wifi: pci rx ce pipe 2 len 128
[  414.239423] ath10k_ahb a800000.wifi: htc rx completion ep 2 skb c08c9e40
[  414.245120] ath10k_ahb a800000.wifi: testmode event wmi cmd_id 32770 skb c08c9e40 skb->len 116
[  414.251931] ath10k_ahb a800000.wifi: 00000000: 00 00 00 00 3d 0a 00 00 2e 58 fc 17 03 00 00 00  ....=....X......
[  414.260351] ath10k_ahb a800000.wifi: 00000010: 1e 00 00 00 4c 09 00 00 4c 09 00 00 00 00 00 00  ....L...L.......
[  414.270679] ath10k_ahb a800000.wifi: 00000020: 3d 0a 00 00 2e 58 fc 17 12 00 00 00 1e 00 00 00  =....X..........
[  414.280834] ath10k_ahb a800000.wifi: 00000030: 4c 09 00 00 4c 09 00 00 00 00 00 00 3d 0a 00 00  L...L.......=...
[  414.290989] ath10k_ahb a800000.wifi: 00000040: 2e 58 fc 17 45 00 00 00 1e 00 00 00 4c 09 00 00  .X..E.......L...
[  414.301146] ath10k_ahb a800000.wifi: 00000050: 4c 09 00 00 00 00 00 00 3d 0a 00 00 2e 58 fc 17  L.......=....X..
[  414.311304] ath10k_ahb a800000.wifi: 00000060: 67 00 00 00 1e 00 00 00 4c 09 00 00 4c 09 00 00  g.......L...L...
[  414.321462] ath10k_ahb a800000.wifi: 00000070: 00 00 00 00                                      ....
[  414.331613] ath10k_ahb a800000.wifi: wmi event debug mesg len 116
[  414.340754] ath10k_ahb a800000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c4bebf00
[  414.346687] ath10k_ahb a800000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c4bebe40
[  414.354536] ath10k_ahb a800000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c4bebd80
[  414.362569] ath10k_ahb a800000.wifi: pci rx ce pipe 1 len 16
[  414.370504] ath10k_ahb a800000.wifi: htc ep 2 got 1 credits (total 2)
[  414.376375] ath10k_ahb a800000.wifi: pci rx ce pipe 1 len 12
[  414.382737] ath10k_ahb a800000.wifi: boot suspend complete
[  414.388464] ath10k_ahb a800000.wifi: boot ahb hif stop
[  414.400518] ath10k_ahb a800000.wifi: boot hif power down
[  414.400587] ath: EEPROM regdomain: 0x0
[  414.404909] ath: EEPROM indicates default country code should be used
[  414.408471] ath: doing EEPROM country->regdmn map search
[  414.415029] ath: country maps to regdmn code: 0x3a
[  414.420399] ath: Country alpha2 being used: US
[  414.424960] ath: Regpair used: 0x3a
[  414.429891] ath10k_ahb a800000.wifi: dfs region 0x1


--nextPart1611892.JB1qdEMJua
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--nextPart1611892.JB1qdEMJua--
