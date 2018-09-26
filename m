Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-auth.no-ip.com ([8.23.224.61] helo=out.smtp-auth.no-ip.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g57H5-0002mF-53
 for ath10k@lists.infradead.org; Wed, 26 Sep 2018 10:42:44 +0000
Received: from anon.gotu.dk (unknown [128.76.197.190])
 (Authenticated sender: gotu.dk@noip-smtp)
 by smtp-auth.no-ip.com (Postfix) with ESMTPA id C2FEA27A
 for <ath10k@lists.infradead.org>; Wed, 26 Sep 2018 03:41:51 -0700 (PDT)
Received: from mkjlap (50-232-78-136-static.hfc.comcastbusiness.net
 [50.232.78.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by anon.gotu.dk (Postfix) with ESMTPSA id CF1DE60066
 for <ath10k@lists.infradead.org>; Wed, 26 Sep 2018 12:41:48 +0200 (CEST)
From: mkj@gotu.dk (Martin =?utf-8?Q?Kj=C3=A6r_J=C3=B8rgensen?=)
Subject: Re: PROBLEM: firmware crash on QCA6174
References: <875zz1mlip.fsf@mkjlap.gotu.lan>
Date: Wed, 26 Sep 2018 06:41:44 -0400
In-Reply-To: <875zz1mlip.fsf@mkjlap.gotu.lan> ("Martin
 \=\?utf-8\?Q\?Kj\=C3\=A6r\?\=
 \=\?utf-8\?Q\?_J\=C3\=B8rgensen\=22's\?\=
 message of "Wed, 19 Sep 2018 13:42:38 -0400")
Message-ID: <87wor8o80n.fsf@mkjlap.gotu.lan>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
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
To: ath10k@lists.infradead.org

--=-=-=
Content-Type: text/plain

Just encountered another firmware crash. I've attached the demsg once again.


--=-=-=
Content-Type: text/plain
Content-Disposition: attachment; filename=dmesg.ath10kcrash
Content-Description: dmesg errors after ath10k crash

[    4.329919] hid-multitouch 0018:04F3:24EE.0001: input,hidraw0: I2C HID v1.00 Device [ELAN24EE:00 04F3:24EE] on i2c-ELAN24EE:00
[    4.345515] input: HDA Intel PCH Headphone Mic as /devices/pci0000:00/0000:00:1f.3/sound/card1/input30
[    4.392168] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card1/input31
[    4.392272] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card1/input32
[    4.432181] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card1/input33
[    4.432271] input: HDA Intel PCH HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1f.3/sound/card1/input34
[    4.432348] input: HDA Intel PCH HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:1f.3/sound/card1/input35
[    4.481642] ath10k_pci 0000:02:00.0: firmware: failed to load ath10k/pre-cal-pci-0000:02:00.0.bin (-2)
[    4.481643] firmware_class: See https://wiki.debian.org/Firmware for information about missing firmware
[    4.481649] ath10k_pci 0000:02:00.0: firmware: failed to load ath10k/cal-pci-0000:02:00.0.bin (-2)
[    4.482432] ath10k_pci 0000:02:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/firmware-6.bin
[    4.482436] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
[    4.482437] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[    4.482810] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00079-QCARMSWPZ-1 api 6 features wowlan,ignore-otp crc32 fd869beb
[    4.546329] ath10k_pci 0000:02:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/board-2.bin
[    4.546614] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 20d869c3
[    4.552493] input: DELL07E6:00 06CB:76AF Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/input/input37
[    4.552603] hid-multitouch 0018:06CB:76AF.0002: input,hidraw1: I2C HID v1.00 Mouse [DELL07E6:00 06CB:76AF] on i2c-DELL07E6:00
[    5.141419] pcieport 0000:04:00.0: Refused to change power state, currently in D3
[    5.143053] pci_bus 0000:05: busn_res: [bus 05] is released
[    5.143150] pci_bus 0000:06: busn_res: [bus 06-38] is released
[    5.143214] pci_bus 0000:39: busn_res: [bus 39] is released
[    5.143293] pci_bus 0000:3a: busn_res: [bus 3a-6d] is released
[    5.143319] pci_bus 0000:04: busn_res: [bus 04-6d] is released
[    5.159615] ath10k_pci 0000:02:00.0: Unknown eventid: 118809
[    5.162646] ath10k_pci 0000:02:00.0: Unknown eventid: 90118
[    5.163403] ath10k_pci 0000:02:00.0: htt-ver 3.47 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[    5.243741] ath: EEPROM regdomain: 0x6c
[    5.243742] ath: EEPROM indicates we should expect a direct regpair map
[    5.243743] ath: Country alpha2 being used: 00
[    5.243744] ath: Regpair used: 0x6c
[    5.250625] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
[    7.684440] input: PS/2 Synaptics TouchPad as /devices/platform/i8042/serio1/input/input6
[    7.888259] psmouse serio1: Failed to enable mouse on isa0060/serio1
[   14.123132] NET: Registered protocol family 38
[   14.352216] EXT4-fs (dm-0): mounted filesystem with ordered data mode. Opts: discard
[   14.415352] audit: type=1400 audit(1537911733.967:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-oopslash" pid=708 comm="apparmor_parser"
[   14.415381] audit: type=1400 audit(1537911733.967:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="torbrowser_tor" pid=710 comm="apparmor_parser"
[   14.415717] audit: type=1400 audit(1537911733.967:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-xpdfimport" pid=706 comm="apparmor_parser"
[   14.416737] audit: type=1400 audit(1537911733.971:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="torbrowser_plugin_container" pid=711 comm="apparmor_parser"
[   14.416927] audit: type=1400 audit(1537911733.971:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/tcpdump" pid=707 comm="apparmor_parser"
[   14.417921] audit: type=1400 audit(1537911733.971:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="ioq3ded" pid=705 comm="apparmor_parser"
[   14.418001] audit: type=1400 audit(1537911733.971:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/freshclam" pid=712 comm="apparmor_parser"
[   14.418238] audit: type=1400 audit(1537911733.971:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/rtcw/iowolf{mp,sp}*" pid=714 comm="apparmor_parser"
[   14.418240] audit: type=1400 audit(1537911733.971:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/rtcw/iowolf{mp,sp}*//popup" pid=714 comm="apparmor_parser"
[   14.418354] audit: type=1400 audit(1537911733.971:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="ioquake3" pid=709 comm="apparmor_parser"
[   14.817684] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   14.817685] Bluetooth: BNEP filters: protocol multicast
[   14.817687] Bluetooth: BNEP socket layer initialized
[   15.230745] ath10k_pci 0000:02:00.0: Unknown eventid: 118809
[   15.233785] ath10k_pci 0000:02:00.0: Unknown eventid: 90118
[   15.279598] IPv6: ADDRCONF(NETDEV_UP): wlp2s0: link is not ready
[   20.425419] wlp2s0: authenticate with f0:b0:52:15:23:bc
[   20.479528] wlp2s0: send auth to f0:b0:52:15:23:bc (try 1/3)
[   20.480382] wlp2s0: authenticated
[   20.484098] wlp2s0: associate with f0:b0:52:15:23:bc (try 1/3)
[   20.486966] wlp2s0: RX AssocResp from f0:b0:52:15:23:bc (capab=0x1001 status=0 aid=1)
[   20.490415] wlp2s0: associated
[   20.491250] IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready
[   20.499142] ath: EEPROM regdomain: 0x8348
[   20.499142] ath: EEPROM indicates we should expect a country code
[   20.499143] ath: doing EEPROM country->regdmn map search
[   20.499144] ath: country maps to regdmn code: 0x3a
[   20.499144] ath: Country alpha2 being used: US
[   20.499145] ath: Regpair used: 0x3a
[   20.499146] ath: regdomain 0x8348 dynamically updated by country element
[   20.585166] wlp2s0: Limiting TX power to 30 (30 - 0) dBm as advertised by f0:b0:52:15:23:bc
[   34.342887] Bluetooth: RFCOMM TTY layer initialized
[   34.342893] Bluetooth: RFCOMM socket layer initialized
[   34.342898] Bluetooth: RFCOMM ver 1.11
[ 2115.939762] CPU6: Core temperature above threshold, cpu clock throttled (total events = 1)
[ 2115.939763] CPU2: Core temperature above threshold, cpu clock throttled (total events = 1)
[ 2115.939764] CPU4: Package temperature above threshold, cpu clock throttled (total events = 1)
[ 2115.939765] CPU3: Package temperature above threshold, cpu clock throttled (total events = 1)
[ 2115.939766] CPU7: Package temperature above threshold, cpu clock throttled (total events = 1)
[ 2115.939767] CPU0: Package temperature above threshold, cpu clock throttled (total events = 1)
[ 2115.939768] CPU1: Package temperature above threshold, cpu clock throttled (total events = 1)
[ 2115.939769] CPU5: Package temperature above threshold, cpu clock throttled (total events = 1)
[ 2115.939770] CPU2: Package temperature above threshold, cpu clock throttled (total events = 1)
[ 2115.939771] CPU6: Package temperature above threshold, cpu clock throttled (total events = 1)
[ 2115.940720] CPU6: Core temperature/speed normal
[ 2115.940720] CPU2: Core temperature/speed normal
[ 2115.940721] CPU1: Package temperature/speed normal
[ 2115.940722] CPU5: Package temperature/speed normal
[ 2115.940723] CPU7: Package temperature/speed normal
[ 2115.940723] CPU3: Package temperature/speed normal
[ 2115.940724] CPU0: Package temperature/speed normal
[ 2115.940725] CPU4: Package temperature/speed normal
[ 2115.940725] CPU2: Package temperature/speed normal
[ 2115.940726] CPU6: Package temperature/speed normal
[ 2429.467783] CPU2: Core temperature above threshold, cpu clock throttled (total events = 2468)
[ 2429.467784] CPU6: Core temperature above threshold, cpu clock throttled (total events = 2468)
[ 2429.467785] CPU1: Package temperature above threshold, cpu clock throttled (total events = 3464)
[ 2429.467786] CPU5: Package temperature above threshold, cpu clock throttled (total events = 3464)
[ 2429.467787] CPU4: Package temperature above threshold, cpu clock throttled (total events = 3464)
[ 2429.467787] CPU0: Package temperature above threshold, cpu clock throttled (total events = 3464)
[ 2429.467788] CPU6: Package temperature above threshold, cpu clock throttled (total events = 3464)
[ 2429.467789] CPU2: Package temperature above threshold, cpu clock throttled (total events = 3464)
[ 2429.467792] CPU7: Package temperature above threshold, cpu clock throttled (total events = 3464)
[ 2429.467793] CPU3: Package temperature above threshold, cpu clock throttled (total events = 3464)
[ 2429.468731] CPU2: Core temperature/speed normal
[ 2429.468731] CPU6: Core temperature/speed normal
[ 2429.468732] CPU5: Package temperature/speed normal
[ 2429.468733] CPU3: Package temperature/speed normal
[ 2429.468734] CPU4: Package temperature/speed normal
[ 2429.468734] CPU1: Package temperature/speed normal
[ 2429.468735] CPU7: Package temperature/speed normal
[ 2429.468736] CPU0: Package temperature/speed normal
[ 2429.468736] CPU6: Package temperature/speed normal
[ 2429.468737] CPU2: Package temperature/speed normal
[ 4438.031775] CPU0: Core temperature above threshold, cpu clock throttled (total events = 1761)
[ 4438.031776] CPU4: Core temperature above threshold, cpu clock throttled (total events = 1761)
[ 4438.031799] CPU0: Package temperature above threshold, cpu clock throttled (total events = 3794)
[ 4438.031800] CPU4: Package temperature above threshold, cpu clock throttled (total events = 3794)
[ 4438.031803] CPU1: Package temperature above threshold, cpu clock throttled (total events = 3794)
[ 4438.031804] CPU6: Package temperature above threshold, cpu clock throttled (total events = 3794)
[ 4438.031805] CPU5: Package temperature above threshold, cpu clock throttled (total events = 3794)
[ 4438.031805] CPU2: Package temperature above threshold, cpu clock throttled (total events = 3794)
[ 4438.031806] CPU7: Package temperature above threshold, cpu clock throttled (total events = 3794)
[ 4438.031807] CPU3: Package temperature above threshold, cpu clock throttled (total events = 3794)
[ 4438.032762] CPU0: Core temperature/speed normal
[ 4438.032763] CPU4: Core temperature/speed normal
[ 4438.032763] CPU0: Package temperature/speed normal
[ 4438.032764] CPU4: Package temperature/speed normal
[ 4438.032792] CPU1: Package temperature/speed normal
[ 4438.032792] CPU5: Package temperature/speed normal
[ 4438.032794] CPU7: Package temperature/speed normal
[ 4438.032795] CPU3: Package temperature/speed normal
[ 4438.032795] CPU2: Package temperature/speed normal
[ 4438.032796] CPU6: Package temperature/speed normal
[ 5385.984762] CPU4: Core temperature above threshold, cpu clock throttled (total events = 1885)
[ 5385.984763] CPU0: Core temperature above threshold, cpu clock throttled (total events = 1885)
[ 5385.984764] CPU1: Package temperature above threshold, cpu clock throttled (total events = 4622)
[ 5385.984765] CPU5: Package temperature above threshold, cpu clock throttled (total events = 4622)
[ 5385.984766] CPU3: Package temperature above threshold, cpu clock throttled (total events = 4622)
[ 5385.984767] CPU7: Package temperature above threshold, cpu clock throttled (total events = 4622)
[ 5385.984768] CPU6: Package temperature above threshold, cpu clock throttled (total events = 4622)
[ 5385.984769] CPU2: Package temperature above threshold, cpu clock throttled (total events = 4622)
[ 5385.984770] CPU0: Package temperature above threshold, cpu clock throttled (total events = 4622)
[ 5385.984772] CPU4: Package temperature above threshold, cpu clock throttled (total events = 4622)
[ 5385.987719] CPU0: Core temperature/speed normal
[ 5385.987720] CPU4: Core temperature/speed normal
[ 5385.987721] CPU5: Package temperature/speed normal
[ 5385.987722] CPU1: Package temperature/speed normal
[ 5385.987722] CPU6: Package temperature/speed normal
[ 5385.987723] CPU7: Package temperature/speed normal
[ 5385.987724] CPU2: Package temperature/speed normal
[ 5385.987725] CPU3: Package temperature/speed normal
[ 5385.987726] CPU4: Package temperature/speed normal
[ 5385.987727] CPU0: Package temperature/speed normal
[ 5510.814027] perf: interrupt took too long (2509 > 2500), lowering kernel.perf_event_max_sample_rate to 79500
[ 5686.712781] CPU6: Core temperature above threshold, cpu clock throttled (total events = 8165)
[ 5686.712801] CPU2: Core temperature above threshold, cpu clock throttled (total events = 8165)
[ 5686.712802] CPU4: Package temperature above threshold, cpu clock throttled (total events = 11331)
[ 5686.712803] CPU0: Package temperature above threshold, cpu clock throttled (total events = 11331)
[ 5686.712804] CPU2: Package temperature above threshold, cpu clock throttled (total events = 11331)
[ 5686.712806] CPU6: Package temperature above threshold, cpu clock throttled (total events = 11331)
[ 5686.712807] CPU1: Package temperature above threshold, cpu clock throttled (total events = 11331)
[ 5686.712808] CPU5: Package temperature above threshold, cpu clock throttled (total events = 11331)
[ 5686.712809] CPU3: Package temperature above threshold, cpu clock throttled (total events = 11331)
[ 5686.712810] CPU7: Package temperature above threshold, cpu clock throttled (total events = 11331)
[ 5686.775742] CPU6: Core temperature/speed normal
[ 5686.775742] CPU2: Core temperature/speed normal
[ 5686.775743] CPU4: Package temperature/speed normal
[ 5686.775744] CPU0: Package temperature/speed normal
[ 5686.775745] CPU2: Package temperature/speed normal
[ 5686.775746] CPU6: Package temperature/speed normal
[ 5686.775780] CPU7: Package temperature/speed normal
[ 5686.775781] CPU5: Package temperature/speed normal
[ 5686.775782] CPU1: Package temperature/speed normal
[ 5686.775783] CPU3: Package temperature/speed normal
[ 8267.987685] perf: interrupt took too long (3168 > 3136), lowering kernel.perf_event_max_sample_rate to 63000
[ 8942.921690] CPU6: Core temperature above threshold, cpu clock throttled (total events = 8171)
[ 8942.921690] CPU2: Core temperature above threshold, cpu clock throttled (total events = 8171)
[ 8942.921692] CPU1: Package temperature above threshold, cpu clock throttled (total events = 11337)
[ 8942.921693] CPU4: Package temperature above threshold, cpu clock throttled (total events = 11337)
[ 8942.921694] CPU0: Package temperature above threshold, cpu clock throttled (total events = 11337)
[ 8942.921695] CPU5: Package temperature above threshold, cpu clock throttled (total events = 11337)
[ 8942.921696] CPU3: Package temperature above threshold, cpu clock throttled (total events = 11337)
[ 8942.921697] CPU7: Package temperature above threshold, cpu clock throttled (total events = 11337)
[ 8942.921698] CPU2: Package temperature above threshold, cpu clock throttled (total events = 11337)
[ 8942.921699] CPU6: Package temperature above threshold, cpu clock throttled (total events = 11337)
[ 8942.922696] CPU2: Core temperature/speed normal
[ 8942.922696] CPU6: Core temperature/speed normal
[ 8942.922697] CPU7: Package temperature/speed normal
[ 8942.922698] CPU1: Package temperature/speed normal
[ 8942.922699] CPU3: Package temperature/speed normal
[ 8942.922700] CPU0: Package temperature/speed normal
[ 8942.922700] CPU5: Package temperature/speed normal
[ 8942.922701] CPU4: Package temperature/speed normal
[ 8942.922702] CPU6: Package temperature/speed normal
[ 8942.922702] CPU2: Package temperature/speed normal
[ 9256.877722] CPU2: Core temperature above threshold, cpu clock throttled (total events = 11516)
[ 9256.877723] CPU6: Core temperature above threshold, cpu clock throttled (total events = 11516)
[ 9256.877724] CPU4: Package temperature above threshold, cpu clock throttled (total events = 15810)
[ 9256.877725] CPU3: Package temperature above threshold, cpu clock throttled (total events = 15810)
[ 9256.877726] CPU1: Package temperature above threshold, cpu clock throttled (total events = 15810)
[ 9256.877727] CPU5: Package temperature above threshold, cpu clock throttled (total events = 15810)
[ 9256.877728] CPU0: Package temperature above threshold, cpu clock throttled (total events = 15810)
[ 9256.877729] CPU7: Package temperature above threshold, cpu clock throttled (total events = 15810)
[ 9256.877730] CPU6: Package temperature above threshold, cpu clock throttled (total events = 15810)
[ 9256.877731] CPU2: Package temperature above threshold, cpu clock throttled (total events = 15810)
[ 9256.880679] CPU6: Core temperature/speed normal
[ 9256.880680] CPU2: Core temperature/speed normal
[ 9256.880681] CPU5: Package temperature/speed normal
[ 9256.880682] CPU1: Package temperature/speed normal
[ 9256.880683] CPU7: Package temperature/speed normal
[ 9256.880683] CPU3: Package temperature/speed normal
[ 9256.880684] CPU4: Package temperature/speed normal
[ 9256.880685] CPU0: Package temperature/speed normal
[ 9256.880686] CPU2: Package temperature/speed normal
[ 9256.880686] CPU6: Package temperature/speed normal
[ 9589.267705] CPU2: Core temperature above threshold, cpu clock throttled (total events = 13880)
[ 9589.267705] CPU6: Core temperature above threshold, cpu clock throttled (total events = 13880)
[ 9589.267707] CPU1: Package temperature above threshold, cpu clock throttled (total events = 18946)
[ 9589.267708] CPU5: Package temperature above threshold, cpu clock throttled (total events = 18946)
[ 9589.267709] CPU4: Package temperature above threshold, cpu clock throttled (total events = 18946)
[ 9589.267710] CPU3: Package temperature above threshold, cpu clock throttled (total events = 18946)
[ 9589.267711] CPU0: Package temperature above threshold, cpu clock throttled (total events = 18946)
[ 9589.267712] CPU7: Package temperature above threshold, cpu clock throttled (total events = 18946)
[ 9589.267713] CPU6: Package temperature above threshold, cpu clock throttled (total events = 18946)
[ 9589.267714] CPU2: Package temperature above threshold, cpu clock throttled (total events = 18946)
[ 9589.270720] CPU2: Core temperature/speed normal
[ 9589.270720] CPU6: Core temperature/speed normal
[ 9589.270721] CPU3: Package temperature/speed normal
[ 9589.270722] CPU1: Package temperature/speed normal
[ 9589.270723] CPU5: Package temperature/speed normal
[ 9589.270724] CPU0: Package temperature/speed normal
[ 9589.270724] CPU4: Package temperature/speed normal
[ 9589.270725] CPU7: Package temperature/speed normal
[ 9589.270726] CPU6: Package temperature/speed normal
[ 9589.270726] CPU2: Package temperature/speed normal
[12564.082615] perf: interrupt took too long (3962 > 3960), lowering kernel.perf_event_max_sample_rate to 50250
[12651.989997] wlp2s0: AP f0:b0:52:15:23:bc changed bandwidth, new config is 5500 MHz, width 2 (5510/0 MHz)
[17521.189431] perf: interrupt took too long (4958 > 4952), lowering kernel.perf_event_max_sample_rate to 40250
[19425.543520] ath10k_pci 0000:02:00.0: firmware crashed! (guid 043a040c-7222-40e2-a683-c665ae8269d6)
[19425.543565] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
[19425.543574] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[19425.545376] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00079-QCARMSWPZ-1 api 6 features wowlan,ignore-otp crc32 fd869beb
[19425.546628] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 20d869c3
[19425.546638] ath10k_pci 0000:02:00.0: htt-ver 3.47 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[19425.559557] ath10k_pci 0000:02:00.0: failed to get memcpy hi address for firmware address 4: -16
[19425.559561] ath10k_pci 0000:02:00.0: failed to read firmware dump area: -16
[19425.559563] ath10k_pci 0000:02:00.0: Copy Engine register dump:
[19425.559572] ath10k_pci 0000:02:00.0: [00]: 0x00034400  14  14   3   3
[19425.559580] ath10k_pci 0000:02:00.0: [01]: 0x00034800  17  17 477 478
[19425.559589] ath10k_pci 0000:02:00.0: [02]: 0x00034c00   6   6  68  69
[19425.559597] ath10k_pci 0000:02:00.0: [03]: 0x00035000  10  10  12  10
[19425.559605] ath10k_pci 0000:02:00.0: [04]: 0x00035400 2005 2005  43 235
[19425.559614] ath10k_pci 0000:02:00.0: [05]: 0x00035800   0   0  64   0
[19425.559622] ath10k_pci 0000:02:00.0: [06]: 0x00035c00  24  23   2   0
[19425.559631] ath10k_pci 0000:02:00.0: [07]: 0x00036000   0   0   0   1
[19425.654862] ieee80211 phy0: Hardware restart was requested
[19428.434388] ath10k_pci 0000:02:00.0: firmware crashed! (guid 5c7a6bf9-1c7b-4032-925c-cf6ec2f8b5de)
[19428.434420] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
[19428.434427] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[19428.435905] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00079-QCARMSWPZ-1 api 6 features wowlan,ignore-otp crc32 fd869beb
[19428.437019] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 20d869c3
[19428.437027] ath10k_pci 0000:02:00.0: htt-ver 3.47 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[19428.439047] ath10k_pci 0000:02:00.0: firmware register dump:
[19428.439050] ath10k_pci 0000:02:00.0: [00]: 0x05030000 0x00000000 0x809A6C96 0x00000000
[19428.439052] ath10k_pci 0000:02:00.0: [04]: 0x809A6C96 0x0040E928 0x00000000 0x004313FC
[19428.439054] ath10k_pci 0000:02:00.0: [08]: 0x004313E4 0x00000001 0x00000000 0x0040E9A8
[19428.439057] ath10k_pci 0000:02:00.0: [12]: 0x809A6C0F 0x00000011 0x004313FC 0x00000044
[19428.439059] ath10k_pci 0000:02:00.0: [16]: 0x00000001 0x00000000 0x00000000 0x0041F370
[19428.439061] ath10k_pci 0000:02:00.0: [20]: 0x809A6FC7 0x0040E8E8 0x004312E4 0x00000001
[19428.439064] ath10k_pci 0000:02:00.0: [24]: 0x00000000 0x00000001 0x00418ED4 0x00955A00
[19428.439066] ath10k_pci 0000:02:00.0: [28]: 0x809A5F4C 0x00000005 0x00000008 0x00000000
[19428.439068] ath10k_pci 0000:02:00.0: [32]: 0x00432DE4 0x00000000 0x00955A00 0x0041F440
[19428.439070] ath10k_pci 0000:02:00.0: [36]: 0x00000000 0x00000000 0x00000000 0x00000000
[19428.439073] ath10k_pci 0000:02:00.0: [40]: 0x00000000 0x00000000 0x00000000 0x00000000
[19428.439075] ath10k_pci 0000:02:00.0: [44]: 0x00000000 0x00000000 0x00000000 0x00000000
[19428.439077] ath10k_pci 0000:02:00.0: [48]: 0x00000000 0x00000000 0x00000000 0x00000000
[19428.439079] ath10k_pci 0000:02:00.0: [52]: 0x00000000 0x00000000 0x00000000 0x00000000
[19428.439081] ath10k_pci 0000:02:00.0: [56]: 0x00000000 0x00000000 0x00000000 0x00000000
[19428.439083] ath10k_pci 0000:02:00.0: Copy Engine register dump:
[19428.439092] ath10k_pci 0000:02:00.0: [00]: 0x00034400  14  14   3   3
[19428.439100] ath10k_pci 0000:02:00.0: [01]: 0x00034800   3   3  16  17
[19428.439109] ath10k_pci 0000:02:00.0: [02]: 0x00034c00   1   1   0   1
[19428.439117] ath10k_pci 0000:02:00.0: [03]: 0x00035000   1   0   2   0
[19428.439125] ath10k_pci 0000:02:00.0: [04]: 0x00035400   8   4  65   1
[19428.439133] ath10k_pci 0000:02:00.0: [05]: 0x00035800   0   0   0   0
[19428.439141] ath10k_pci 0000:02:00.0: [06]: 0x00035c00   0   0   0   0
[19428.439150] ath10k_pci 0000:02:00.0: [07]: 0x00036000   1   1   1   1
[19431.406556] ath10k_pci 0000:02:00.0: wmi unified ready event not received
[19431.456581] ath10k_pci 0000:02:00.0: device has crashed during init
[19431.484598] ath10k_pci 0000:02:00.0: device has crashed during init
[19431.484601] ath10k_pci 0000:02:00.0: failed to wait for target init: -70
[19431.485836] ath10k_pci 0000:02:00.0: Could not init core: -110
[19431.485841] ------------[ cut here ]------------
[19431.485841] Hardware became unavailable during restart.
[19431.485884] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/util.c:1908 ieee80211_reconfig+0x24c/0x12e0 [mac80211]
[19431.485885] Modules linked in: rfcomm cmac
[19431.485888] ath10k_pci 0000:02:00.0: cannot restart a device that hasn't been started
[19431.485889]  bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss media efi_pstore tpm_crb
[19431.485931]  snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc crc32c_intel mmc_core
[19431.485985]  i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.486004] CPU: 7 PID: 6608 Comm: kworker/7:1 Not tainted 4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.486005] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.486018] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.486035] RIP: 0010:ieee80211_reconfig+0x24c/0x12e0 [mac80211]
[19431.486036] Code: 44 24 07 00 c6 83 94 04 00 00 00 48 89 df e8 bb ce fc ff 85 c0 41 89 c7 0f 84 30 01 00 00 48 c7 c7 50 e9 1c c1 e8 f4 08 2e e6 <0f> 0b 48 89 df e8 5a e0 ff ff eb 9b c6 83 95 04 00 00 00 48 8d ab 
[19431.486069] RSP: 0018:ffffbfa7c6553e00 EFLAGS: 00010286
[19431.486071] RAX: 0000000000000000 RBX: ffffa063586e0760 RCX: 0000000000000006
[19431.486072] RDX: 0000000000000007 RSI: 0000000000000086 RDI: ffffa0636e5d6730
[19431.486073] RBP: ffffa063586e13a0 R08: 000000000000047f R09: 0000000000000000
[19431.486074] R10: ffffbfa7c6553bf0 R11: 0000000000000001 R12: ffffa063586e0f90
[19431.486075] R13: ffffa063586e0760 R14: ffffa063586e13a0 R15: 00000000ffffff92
[19431.486077] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.486078] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.486080] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.486081] Call Trace:
[19431.486087]  ? rcu_exp_wait_wake+0x530/0x530
[19431.486090]  ? try_to_del_timer_sync+0x4d/0x80
[19431.486102]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.486106]  process_one_work+0x195/0x370
[19431.486109]  worker_thread+0x30/0x390
[19431.486112]  ? process_one_work+0x370/0x370
[19431.486114]  kthread+0x113/0x130
[19431.486116]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.486120]  ret_from_fork+0x35/0x40
[19431.486122] ---[ end trace 5eabcedfdcf66ea2 ]---
[19431.486190] ------------[ cut here ]------------
[19431.486191] p2p-dev-wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[19431.486213] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 drv_remove_interface+0xf5/0x100 [mac80211]
[19431.486214] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.486248]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.486291]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.486314] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.486320] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.486334] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.486351] RIP: 0010:drv_remove_interface+0xf5/0x100 [mac80211]
[19431.486354] Code: 85 c0 75 e8 5b 5d 41 5c c3 48 8b b3 08 04 00 00 48 81 c3 28 04 00 00 48 c7 c7 38 ce 1c c1 48 85 f6 48 0f 44 f3 e8 1b 35 31 e6 <0f> 0b 5b 5d 41 5c c3 0f 1f 40 00 0f 1f 44 00 00 41 57 41 56 41 55 
[19431.486431] RSP: 0018:ffffbfa7c6553d18 EFLAGS: 00010286
[19431.486433] RAX: 0000000000000000 RBX: ffffa06354fd4428 RCX: 0000000000000006
[19431.486434] RDX: 0000000000000007 RSI: 0000000000000096 RDI: ffffa0636e5d6730
[19431.486435] RBP: ffffa063586e0760 R08: 00000000000004a0 R09: 0000000000000000
[19431.486436] R10: 0000000000000000 R11: 0000000000000001 R12: ffffa063586e0b80
[19431.486437] R13: ffffa063586e0760 R14: ffffa063586e0ee8 R15: ffffa06354fd4ab0
[19431.486439] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.486440] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.486441] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.486442] Call Trace:
[19431.486459]  ieee80211_do_stop+0x4f6/0x820 [mac80211]
[19431.486479]  cfg80211_stop_p2p_device+0x65/0x180 [cfg80211]
[19431.486491]  cfg80211_shutdown_all_interfaces+0x8a/0xc0 [cfg80211]
[19431.486512]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.486518]  ? rcu_exp_wait_wake+0x530/0x530
[19431.486524]  ? try_to_del_timer_sync+0x4d/0x80
[19431.486539]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.486545]  process_one_work+0x195/0x370
[19431.486550]  worker_thread+0x30/0x390
[19431.486555]  ? process_one_work+0x370/0x370
[19431.486559]  kthread+0x113/0x130
[19431.486565]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.486571]  ret_from_fork+0x35/0x40
[19431.486575] ---[ end trace 5eabcedfdcf66ea3 ]---
[19431.486601] ath10k_pci 0000:02:00.0: failed to set PS Mode 1 for vdev 0: -108
[19431.486603] ath10k_pci 0000:02:00.0: failed to setup powersave: -108
[19431.486616] wlp2s0: deauthenticating from f0:b0:52:15:23:bc by local choice (Reason: 3=DEAUTH_LEAVING)
[19431.486621] ath10k_pci 0000:02:00.0: failed to set inactivity time for vdev 0: -108
[19431.486625] ath10k_pci 0000:02:00.0: failed to setup powersave: -108
[19431.486626] ------------[ cut here ]------------
[19431.486627] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[19431.486647] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 ieee80211_bss_info_change_notify+0x178/0x180 [mac80211]
[19431.486648] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.486685]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.486726]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.486741] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.486742] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.486754] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.486765] RIP: 0010:ieee80211_bss_info_change_notify+0x178/0x180 [mac80211]
[19431.486765] Code: 85 c0 75 de e9 28 ff ff ff 48 8b b3 08 04 00 00 48 8d bb 28 04 00 00 48 85 f6 48 0f 44 f7 48 c7 c7 f0 cc 1c c1 e8 18 50 31 e6 <0f> 0b e9 41 ff ff ff 90 0f 1f 44 00 00 c6 87 c6 0a 00 00 00 c6 87 
[19431.486798] RSP: 0018:ffffbfa7c6553a70 EFLAGS: 00010286
[19431.486799] RAX: 0000000000000000 RBX: ffffa0634ef2c8c0 RCX: 0000000000000006
[19431.486801] RDX: 0000000000000007 RSI: 0000000000000086 RDI: ffffa0636e5d6730
[19431.486802] RBP: 0000000000020000 R08: 00000000000004c8 R09: 0000000000000000
[19431.486803] R10: 0000000000000000 R11: 0000000000000001 R12: ffffa063586e0760
[19431.486804] R13: ffffa0634ef2c8c0 R14: 0000000000000003 R15: ffffa0634ef2d150
[19431.486805] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.486806] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.486807] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.486808] Call Trace:
[19431.486826]  ieee80211_set_disassoc+0x84/0x5c0 [mac80211]
[19431.486843]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[19431.486861]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[19431.486876]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[19431.486891]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[19431.486902]  cfg80211_leave+0x26/0x40 [cfg80211]
[19431.486913]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[19431.486920]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[19431.486928]  ? ath10k_wmi_cmd_send+0x141/0x1b0 [ath10k_core]
[19431.486931]  ? addrconf_notify+0x77/0xb10
[19431.486935]  ? inetdev_event+0x76/0x4f0
[19431.486938]  notifier_call_chain+0x47/0x70
[19431.486942]  __dev_close_many+0x5f/0x110
[19431.486945]  dev_close_many+0x9f/0x160
[19431.486948]  dev_close.part.93+0x64/0xa0
[19431.486959]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.486976]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.486979]  ? rcu_exp_wait_wake+0x530/0x530
[19431.486981]  ? try_to_del_timer_sync+0x4d/0x80
[19431.486992]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.486995]  process_one_work+0x195/0x370
[19431.486997]  worker_thread+0x30/0x390
[19431.487000]  ? process_one_work+0x370/0x370
[19431.487001]  kthread+0x113/0x130
[19431.487003]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.487006]  ret_from_fork+0x35/0x40
[19431.487008] ---[ end trace 5eabcedfdcf66ea4 ]---
[19431.487201] ------------[ cut here ]------------
[19431.487202] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[19431.487235] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 __ieee80211_flush_queues+0x18d/0x1a0 [mac80211]
[19431.487236] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.487331]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.487375]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.487397] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.487398] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.487411] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.487429] RIP: 0010:__ieee80211_flush_queues+0x18d/0x1a0 [mac80211]
[19431.487435] Code: 45 31 f6 e9 1c ff ff ff 49 8b b4 24 08 04 00 00 49 81 c4 28 04 00 00 48 c7 c7 28 e8 1c c1 48 85 f6 49 0f 44 f4 e8 13 1a 2e e6 <0f> 0b e9 24 ff ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 90 0f 1f 44 
[19431.487472] RSP: 0018:ffffbfa7c6553a68 EFLAGS: 00010282
[19431.487474] RAX: 0000000000000000 RBX: ffffa063586e0760 RCX: 0000000000000006
[19431.487475] RDX: 0000000000000007 RSI: 0000000000000096 RDI: ffffa0636e5d6730
[19431.487476] RBP: 0000000000000001 R08: 00000000000004f8 R09: 0000000000000000
[19431.487477] R10: 0000000000000000 R11: 0000000000000001 R12: ffffa0634ef2cce8
[19431.487478] R13: 0000000000000001 R14: ffffa0634ef2d370 R15: 0000000000000001
[19431.487479] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.487481] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.487482] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.487483] Call Trace:
[19431.487503]  ieee80211_set_disassoc+0x330/0x5c0 [mac80211]
[19431.487521]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[19431.487539]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[19431.487555]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[19431.487571]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[19431.487583]  cfg80211_leave+0x26/0x40 [cfg80211]
[19431.487595]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[19431.487602]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[19431.487610]  ? ath10k_wmi_cmd_send+0x141/0x1b0 [ath10k_core]
[19431.487612]  ? addrconf_notify+0x77/0xb10
[19431.487616]  ? inetdev_event+0x76/0x4f0
[19431.487619]  notifier_call_chain+0x47/0x70
[19431.487622]  __dev_close_many+0x5f/0x110
[19431.487624]  dev_close_many+0x9f/0x160
[19431.487627]  dev_close.part.93+0x64/0xa0
[19431.487639]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.487658]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.487661]  ? rcu_exp_wait_wake+0x530/0x530
[19431.487663]  ? try_to_del_timer_sync+0x4d/0x80
[19431.487675]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.487678]  process_one_work+0x195/0x370
[19431.487681]  worker_thread+0x30/0x390
[19431.487683]  ? process_one_work+0x370/0x370
[19431.487685]  kthread+0x113/0x130
[19431.487687]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.487690]  ret_from_fork+0x35/0x40
[19431.487692] ---[ end trace 5eabcedfdcf66ea5 ]---
[19431.487699] ------------[ cut here ]------------
[19431.487700] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[19431.487725] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 __ieee80211_flush_queues+0x18d/0x1a0 [mac80211]
[19431.487725] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.487759]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.487801]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.487816] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.487817] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.487829] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.487845] RIP: 0010:__ieee80211_flush_queues+0x18d/0x1a0 [mac80211]
[19431.487845] Code: 45 31 f6 e9 1c ff ff ff 49 8b b4 24 08 04 00 00 49 81 c4 28 04 00 00 48 c7 c7 28 e8 1c c1 48 85 f6 49 0f 44 f4 e8 13 1a 2e e6 <0f> 0b e9 24 ff ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 90 0f 1f 44 
[19431.487878] RSP: 0018:ffffbfa7c6553a68 EFLAGS: 00010282
[19431.487880] RAX: 0000000000000000 RBX: ffffa063586e0760 RCX: 0000000000000006
[19431.487881] RDX: 0000000000000007 RSI: 0000000000000096 RDI: ffffa0636e5d6730
[19431.487882] RBP: 0000000000000001 R08: 0000000000000528 R09: 0000000000000000
[19431.487883] R10: ffffa06354fd3828 R11: 0000000000000001 R12: ffffa0634ef2cce8
[19431.487884] R13: 0000000000000001 R14: ffffa0634ef2d370 R15: 0000000000000000
[19431.487886] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.487887] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.487888] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.487889] Call Trace:
[19431.487906]  ieee80211_set_disassoc+0x36f/0x5c0 [mac80211]
[19431.487923]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[19431.487940]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[19431.487955]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[19431.487970]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[19431.487982]  cfg80211_leave+0x26/0x40 [cfg80211]
[19431.487994]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[19431.488001]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[19431.488009]  ? ath10k_wmi_cmd_send+0x141/0x1b0 [ath10k_core]
[19431.488011]  ? addrconf_notify+0x77/0xb10
[19431.488014]  ? inetdev_event+0x76/0x4f0
[19431.488017]  notifier_call_chain+0x47/0x70
[19431.488020]  __dev_close_many+0x5f/0x110
[19431.488022]  dev_close_many+0x9f/0x160
[19431.488025]  dev_close.part.93+0x64/0xa0
[19431.488037]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.488054]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.488057]  ? rcu_exp_wait_wake+0x530/0x530
[19431.488059]  ? try_to_del_timer_sync+0x4d/0x80
[19431.488071]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.488074]  process_one_work+0x195/0x370
[19431.488077]  worker_thread+0x30/0x390
[19431.488079]  ? process_one_work+0x370/0x370
[19431.488081]  kthread+0x113/0x130
[19431.488083]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.488086]  ret_from_fork+0x35/0x40
[19431.488088] ---[ end trace 5eabcedfdcf66ea6 ]---
[19431.488091] ------------[ cut here ]------------
[19431.488092] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[19431.488113] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 __sta_info_destroy_part1+0x4a9/0x580 [mac80211]
[19431.488114] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.488148]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.488189]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.488205] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.488206] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.488218] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.488230] RIP: 0010:__sta_info_destroy_part1+0x4a9/0x580 [mac80211]
[19431.488230] Code: 32 e6 e9 c9 fc ff ff 49 8b 84 24 08 04 00 00 49 8d b4 24 28 04 00 00 48 c7 c7 18 cf 1c c1 48 85 c0 48 0f 45 f0 e8 87 0c 31 e6 <0f> 0b e9 3f fd ff ff 65 8b 15 59 5e ea 3e 89 d2 48 0f a3 15 5f ff 
[19431.488263] RSP: 0018:ffffbfa7c65539f0 EFLAGS: 00010282
[19431.488265] RAX: 0000000000000000 RBX: ffffa063586e0760 RCX: 0000000000000006
[19431.488266] RDX: 0000000000000007 RSI: 0000000000000082 RDI: ffffa0636e5d6730
[19431.488267] RBP: ffffa06354fd3000 R08: 0000000000000558 R09: 0000000000000000
[19431.488268] R10: ffffa06354fd3828 R11: 0000000000000001 R12: ffffa0634ef2c8c0
[19431.488269] R13: ffffa0635bf0bba8 R14: ffffa06354fd3030 R15: ffffa06353a3c0c0
[19431.488271] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.488272] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.488273] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.488274] Call Trace:
[19431.488287]  __sta_info_flush+0xcc/0x1b0 [mac80211]
[19431.488306]  ieee80211_set_disassoc+0xb7/0x5c0 [mac80211]
[19431.488322]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[19431.488339]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[19431.488354]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[19431.488369]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[19431.488382]  cfg80211_leave+0x26/0x40 [cfg80211]
[19431.488394]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[19431.488401]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[19431.488409]  ? ath10k_wmi_cmd_send+0x141/0x1b0 [ath10k_core]
[19431.488412]  ? addrconf_notify+0x77/0xb10
[19431.488415]  ? inetdev_event+0x76/0x4f0
[19431.488418]  notifier_call_chain+0x47/0x70
[19431.488420]  __dev_close_many+0x5f/0x110
[19431.488423]  dev_close_many+0x9f/0x160
[19431.488425]  dev_close.part.93+0x64/0xa0
[19431.488437]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.488455]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.488458]  ? rcu_exp_wait_wake+0x530/0x530
[19431.488460]  ? try_to_del_timer_sync+0x4d/0x80
[19431.488472]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.488475]  process_one_work+0x195/0x370
[19431.488478]  worker_thread+0x30/0x390
[19431.488480]  ? process_one_work+0x370/0x370
[19431.488482]  kthread+0x113/0x130
[19431.488484]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.488487]  ret_from_fork+0x35/0x40
[19431.488489] ---[ end trace 5eabcedfdcf66ea7 ]---
[19431.488521] ------------[ cut here ]------------
[19431.488522] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[19431.488545] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 drv_sta_state+0x158/0x3f0 [mac80211]
[19431.488548] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.488699]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.488742]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.488758] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.488759] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.488771] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.488783] RIP: 0010:drv_sta_state+0x158/0x3f0 [mac80211]
[19431.488784] Code: 85 c9 75 e5 e9 5e ff ff ff 48 8b 83 08 04 00 00 48 8d b3 28 04 00 00 48 c7 c7 38 ce 1c c1 48 85 c0 48 0f 45 f0 e8 b8 33 31 e6 <0f> 0b 41 bc fb ff ff ff e9 30 ff ff ff 41 83 fc 02 0f 85 83 00 00 
[19431.488817] RSP: 0018:ffffbfa7c65539b8 EFLAGS: 00010286
[19431.488818] RAX: 0000000000000000 RBX: ffffa0634ef2c8c0 RCX: 0000000000000006
[19431.488819] RDX: 0000000000000007 RSI: 0000000000000096 RDI: ffffa0636e5d6730
[19431.488821] RBP: ffffa063586e0760 R08: 0000000000000589 R09: 0000000000000000
[19431.488821] R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000004
[19431.488823] R13: 0000000000000003 R14: ffffa063586e0cb0 R15: ffffa063586e0cb0
[19431.488824] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.488825] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.488826] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.488827] Call Trace:
[19431.488840]  sta_info_move_state+0x1a7/0x260 [mac80211]
[19431.488853]  __sta_info_destroy_part2+0x54/0x120 [mac80211]
[19431.488870]  __sta_info_flush+0x150/0x1b0 [mac80211]
[19431.488891]  ieee80211_set_disassoc+0xb7/0x5c0 [mac80211]
[19431.488910]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[19431.488931]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[19431.488950]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[19431.488968]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[19431.488983]  cfg80211_leave+0x26/0x40 [cfg80211]
[19431.488997]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[19431.489005]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[19431.489015]  ? ath10k_wmi_cmd_send+0x141/0x1b0 [ath10k_core]
[19431.489021]  ? addrconf_notify+0x77/0xb10
[19431.489026]  ? inetdev_event+0x76/0x4f0
[19431.489032]  notifier_call_chain+0x47/0x70
[19431.489037]  __dev_close_many+0x5f/0x110
[19431.489042]  dev_close_many+0x9f/0x160
[19431.489047]  dev_close.part.93+0x64/0xa0
[19431.489061]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.489081]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.489086]  ? rcu_exp_wait_wake+0x530/0x530
[19431.489090]  ? try_to_del_timer_sync+0x4d/0x80
[19431.489104]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.489109]  process_one_work+0x195/0x370
[19431.489114]  worker_thread+0x30/0x390
[19431.489119]  ? process_one_work+0x370/0x370
[19431.489123]  kthread+0x113/0x130
[19431.489127]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.489133]  ret_from_fork+0x35/0x40
[19431.489137] ---[ end trace 5eabcedfdcf66ea8 ]---
[19431.489159] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/sta_info.c:996 __sta_info_destroy_part2+0xe4/0x120 [mac80211]
[19431.489160] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.489195]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.489237]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.489252] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.489253] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.489266] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.489288] RIP: 0010:__sta_info_destroy_part2+0xe4/0x120 [mac80211]
[19431.489296] Code: 48 89 ef e8 2e de 4b e6 48 8b 43 50 48 89 df 48 8b a8 10 04 00 00 e8 fb cf ff ff 48 89 de 48 89 ef 5b 5d 41 5c e9 8c de ff ff <0f> 0b 80 bb 0c 01 00 00 00 74 81 45 31 c0 b9 01 00 00 00 48 89 da 
[19431.489386] RSP: 0018:ffffbfa7c6553a10 EFLAGS: 00010282
[19431.489388] RAX: 00000000fffffffb RBX: ffffa06354fd3000 RCX: 0000000000000006
[19431.489389] RDX: 0000000000000007 RSI: 0000000000000096 RDI: ffffa0636e5d6730
[19431.489390] RBP: ffffa063586e0760 R08: 0000000000000589 R09: 0000000000000000
[19431.489391] R10: 0000000000000000 R11: 0000000000000001 R12: ffffa0634ef2c8c0
[19431.489392] R13: 0000000000000000 R14: ffffa063586e0cb0 R15: ffffa063586e0cb0
[19431.489394] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.489395] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.489396] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.489397] Call Trace:
[19431.489411]  __sta_info_flush+0x150/0x1b0 [mac80211]
[19431.489428]  ieee80211_set_disassoc+0xb7/0x5c0 [mac80211]
[19431.489449]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[19431.489471]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[19431.489488]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[19431.489507]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[19431.489523]  cfg80211_leave+0x26/0x40 [cfg80211]
[19431.489537]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[19431.489545]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[19431.489555]  ? ath10k_wmi_cmd_send+0x141/0x1b0 [ath10k_core]
[19431.489559]  ? addrconf_notify+0x77/0xb10
[19431.489562]  ? inetdev_event+0x76/0x4f0
[19431.489565]  notifier_call_chain+0x47/0x70
[19431.489568]  __dev_close_many+0x5f/0x110
[19431.489571]  dev_close_many+0x9f/0x160
[19431.489573]  dev_close.part.93+0x64/0xa0
[19431.489585]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.489606]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.489615]  ? rcu_exp_wait_wake+0x530/0x530
[19431.489621]  ? try_to_del_timer_sync+0x4d/0x80
[19431.489637]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.489641]  process_one_work+0x195/0x370
[19431.489644]  worker_thread+0x30/0x390
[19431.489646]  ? process_one_work+0x370/0x370
[19431.489648]  kthread+0x113/0x130
[19431.489649]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.489653]  ret_from_fork+0x35/0x40
[19431.489654] ---[ end trace 5eabcedfdcf66ea9 ]---
[19431.489655] ------------[ cut here ]------------
[19431.489656] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[19431.489680] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 drv_sta_state+0x158/0x3f0 [mac80211]
[19431.489682] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.489722]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.489763]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.489779] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.489780] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.489791] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.489804] RIP: 0010:drv_sta_state+0x158/0x3f0 [mac80211]
[19431.489805] Code: 85 c9 75 e5 e9 5e ff ff ff 48 8b 83 08 04 00 00 48 8d b3 28 04 00 00 48 c7 c7 38 ce 1c c1 48 85 c0 48 0f 45 f0 e8 b8 33 31 e6 <0f> 0b 41 bc fb ff ff ff e9 30 ff ff ff 41 83 fc 02 0f 85 83 00 00 
[19431.489837] RSP: 0018:ffffbfa7c65539d0 EFLAGS: 00010282
[19431.489839] RAX: 0000000000000000 RBX: ffffa0634ef2c8c0 RCX: 0000000000000006
[19431.489840] RDX: 0000000000000007 RSI: 0000000000000086 RDI: ffffa0636e5d6730
[19431.489841] RBP: ffffa063586e0760 R08: 00000000000005eb R09: 0000000000000000
[19431.489842] R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000001
[19431.489843] R13: 0000000000000000 R14: ffffa063586e0cb0 R15: ffffa063586e0cb0
[19431.489845] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.489846] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.489847] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.489848] Call Trace:
[19431.489860]  __sta_info_destroy_part2+0x105/0x120 [mac80211]
[19431.489872]  __sta_info_flush+0x150/0x1b0 [mac80211]
[19431.489889]  ieee80211_set_disassoc+0xb7/0x5c0 [mac80211]
[19431.489906]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[19431.489923]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[19431.489938]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[19431.489952]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[19431.489965]  cfg80211_leave+0x26/0x40 [cfg80211]
[19431.489976]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[19431.489983]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[19431.489992]  ? ath10k_wmi_cmd_send+0x141/0x1b0 [ath10k_core]
[19431.489994]  ? addrconf_notify+0x77/0xb10
[19431.489997]  ? inetdev_event+0x76/0x4f0
[19431.490000]  notifier_call_chain+0x47/0x70
[19431.490003]  __dev_close_many+0x5f/0x110
[19431.490006]  dev_close_many+0x9f/0x160
[19431.490008]  dev_close.part.93+0x64/0xa0
[19431.490020]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.490038]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.490041]  ? rcu_exp_wait_wake+0x530/0x530
[19431.490043]  ? try_to_del_timer_sync+0x4d/0x80
[19431.490054]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.490057]  process_one_work+0x195/0x370
[19431.490060]  worker_thread+0x30/0x390
[19431.490062]  ? process_one_work+0x370/0x370
[19431.490064]  kthread+0x113/0x130
[19431.490065]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.490069]  ret_from_fork+0x35/0x40
[19431.490070] ---[ end trace 5eabcedfdcf66eaa ]---
[19431.490091] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/sta_info.c:1004 __sta_info_destroy_part2+0x10d/0x120 [mac80211]
[19431.490092] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.490126]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.490169]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.490185] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.490185] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.490197] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.490209] RIP: 0010:__sta_info_destroy_part2+0x10d/0x120 [mac80211]
[19431.490209] Code: ff 0f 0b 80 bb 0c 01 00 00 00 74 81 45 31 c0 b9 01 00 00 00 48 89 da 4c 89 e6 48 89 ef e8 ab ad ff ff 85 c0 0f 84 63 ff ff ff <0f> 0b e9 5c ff ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 90 0f 1f 44 
[19431.490242] RSP: 0018:ffffbfa7c6553a10 EFLAGS: 00010282
[19431.490244] RAX: 00000000fffffffb RBX: ffffa06354fd3000 RCX: 0000000000000006
[19431.490245] RDX: 0000000000000007 RSI: 0000000000000086 RDI: ffffa0636e5d6730
[19431.490246] RBP: ffffa063586e0760 R08: 00000000000005eb R09: 0000000000000000
[19431.490247] R10: 0000000000000000 R11: 0000000000000001 R12: ffffa0634ef2c8c0
[19431.490248] R13: 0000000000000000 R14: ffffa063586e0cb0 R15: ffffa063586e0cb0
[19431.490250] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.490251] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.490252] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.490253] Call Trace:
[19431.490265]  __sta_info_flush+0x150/0x1b0 [mac80211]
[19431.490282]  ieee80211_set_disassoc+0xb7/0x5c0 [mac80211]
[19431.490300]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[19431.490317]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[19431.490332]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[19431.490346]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[19431.490358]  cfg80211_leave+0x26/0x40 [cfg80211]
[19431.490370]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[19431.490377]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[19431.490385]  ? ath10k_wmi_cmd_send+0x141/0x1b0 [ath10k_core]
[19431.490387]  ? addrconf_notify+0x77/0xb10
[19431.490391]  ? inetdev_event+0x76/0x4f0
[19431.490394]  notifier_call_chain+0x47/0x70
[19431.490396]  __dev_close_many+0x5f/0x110
[19431.490399]  dev_close_many+0x9f/0x160
[19431.490402]  dev_close.part.93+0x64/0xa0
[19431.490414]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.490431]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.490434]  ? rcu_exp_wait_wake+0x530/0x530
[19431.490436]  ? try_to_del_timer_sync+0x4d/0x80
[19431.490448]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.490451]  process_one_work+0x195/0x370
[19431.490453]  worker_thread+0x30/0x390
[19431.490456]  ? process_one_work+0x370/0x370
[19431.490457]  kthread+0x113/0x130
[19431.490459]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.490462]  ret_from_fork+0x35/0x40
[19431.490464] ---[ end trace 5eabcedfdcf66eab ]---
[19431.490477] ------------[ cut here ]------------
[19431.490478] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[19431.490501] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 sta_set_sinfo+0x839/0x8e0 [mac80211]
[19431.490501] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.490622]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.490665]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.490680] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.490681] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.490693] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.490705] RIP: 0010:sta_set_sinfo+0x839/0x8e0 [mac80211]
[19431.490706] Code: 48 85 d2 75 e0 e9 aa f8 ff ff 48 8b b0 08 04 00 00 48 05 28 04 00 00 48 c7 c7 18 cf 1c c1 48 85 f6 48 0f 44 f0 e8 67 e4 30 e6 <0f> 0b e9 83 f8 ff ff 83 e0 0f c6 43 36 02 88 43 37 48 89 c8 48 c1 
[19431.490794] RSP: 0018:ffffbfa7c65539c0 EFLAGS: 00010282
[19431.490801] RAX: 0000000000000000 RBX: ffffa062bed02000 RCX: 0000000000000006
[19431.490807] RDX: 0000000000000007 RSI: 0000000000000082 RDI: ffffa0636e5d6730
[19431.490811] RBP: ffffa06354fd3000 R08: 000000000000064c R09: 0000000000000000
[19431.490813] R10: 0000000000000000 R11: 0000000000000001 R12: ffffa0634ef2c8c0
[19431.490816] R13: ffffa063586e0760 R14: ffffa06354fd3200 R15: 0000000000000001
[19431.490821] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.490827] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.490830] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.490834] Call Trace:
[19431.490841]  ? _cond_resched+0x15/0x40
[19431.490852]  ? kmem_cache_alloc_trace+0x15d/0x1c0
[19431.490867]  ? __sta_info_destroy_part2+0x86/0x120 [mac80211]
[19431.490880]  __sta_info_destroy_part2+0x9e/0x120 [mac80211]
[19431.490891]  __sta_info_flush+0x150/0x1b0 [mac80211]
[19431.490908]  ieee80211_set_disassoc+0xb7/0x5c0 [mac80211]
[19431.490924]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[19431.490942]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[19431.490957]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[19431.490972]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[19431.490987]  cfg80211_leave+0x26/0x40 [cfg80211]
[19431.491003]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[19431.491013]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[19431.491024]  ? ath10k_wmi_cmd_send+0x141/0x1b0 [ath10k_core]
[19431.491031]  ? addrconf_notify+0x77/0xb10
[19431.491034]  ? inetdev_event+0x76/0x4f0
[19431.491037]  notifier_call_chain+0x47/0x70
[19431.491040]  __dev_close_many+0x5f/0x110
[19431.491043]  dev_close_many+0x9f/0x160
[19431.491046]  dev_close.part.93+0x64/0xa0
[19431.491063]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.491085]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.491090]  ? rcu_exp_wait_wake+0x530/0x530
[19431.491094]  ? try_to_del_timer_sync+0x4d/0x80
[19431.491106]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.491109]  process_one_work+0x195/0x370
[19431.491115]  worker_thread+0x30/0x390
[19431.491119]  ? process_one_work+0x370/0x370
[19431.491121]  kthread+0x113/0x130
[19431.491123]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.491126]  ret_from_fork+0x35/0x40
[19431.491128] ---[ end trace 5eabcedfdcf66eac ]---
[19431.491165] ------------[ cut here ]------------
[19431.491166] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[19431.491188] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 ieee80211_bss_info_change_notify+0x178/0x180 [mac80211]
[19431.491188] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.491222]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.491266]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.491281] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.491282] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.491294] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.491306] RIP: 0010:ieee80211_bss_info_change_notify+0x178/0x180 [mac80211]
[19431.491307] Code: 85 c0 75 de e9 28 ff ff ff 48 8b b3 08 04 00 00 48 8d bb 28 04 00 00 48 85 f6 48 0f 44 f7 48 c7 c7 f0 cc 1c c1 e8 18 50 31 e6 <0f> 0b e9 41 ff ff ff 90 0f 1f 44 00 00 c6 87 c6 0a 00 00 00 c6 87 
[19431.491341] RSP: 0018:ffffbfa7c6553a70 EFLAGS: 00010286
[19431.491343] RAX: 0000000000000000 RBX: ffffa0634ef2c8c0 RCX: 0000000000000006
[19431.491344] RDX: 0000000000000007 RSI: 0000000000000086 RDI: ffffa0636e5d6730
[19431.491345] RBP: 000000000080309f R08: 0000000000000681 R09: 0000000000000000
[19431.491346] R10: ffffa06354fd3000 R11: 0000000000000001 R12: ffffa063586e0760
[19431.491347] R13: ffffa0634ef2c8c0 R14: 0000000000000003 R15: ffffa0634ef2d150
[19431.491349] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.491350] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.491351] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.491352] Call Trace:
[19431.491369]  ieee80211_set_disassoc+0x20f/0x5c0 [mac80211]
[19431.491385]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[19431.491402]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[19431.491416]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[19431.491431]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[19431.491443]  cfg80211_leave+0x26/0x40 [cfg80211]
[19431.491456]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[19431.491462]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[19431.491470]  ? ath10k_wmi_cmd_send+0x141/0x1b0 [ath10k_core]
[19431.491473]  ? addrconf_notify+0x77/0xb10
[19431.491476]  ? inetdev_event+0x76/0x4f0
[19431.491478]  notifier_call_chain+0x47/0x70
[19431.491481]  __dev_close_many+0x5f/0x110
[19431.491484]  dev_close_many+0x9f/0x160
[19431.491486]  dev_close.part.93+0x64/0xa0
[19431.491499]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.491516]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.491519]  ? rcu_exp_wait_wake+0x530/0x530
[19431.491521]  ? try_to_del_timer_sync+0x4d/0x80
[19431.491533]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.491536]  process_one_work+0x195/0x370
[19431.491539]  worker_thread+0x30/0x390
[19431.491542]  ? process_one_work+0x370/0x370
[19431.491543]  kthread+0x113/0x130
[19431.491545]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.491548]  ret_from_fork+0x35/0x40
[19431.491550] ---[ end trace 5eabcedfdcf66ead ]---
[19431.491552] ------------[ cut here ]------------
[19431.491553] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[19431.491574] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 drv_conf_tx+0x15b/0x1a0 [mac80211]
[19431.491574] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.491621]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.491645]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.491654] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.491655] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.491662] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.491669] RIP: 0010:drv_conf_tx+0x15b/0x1a0 [mac80211]
[19431.491669] Code: 41 5c 41 5d 41 5e c3 48 8b 93 08 04 00 00 48 8d b3 28 04 00 00 48 c7 c7 38 ce 1c c1 48 85 d2 48 0f 45 f2 89 c2 e8 75 2e 31 e6 <0f> 0b bd fb ff ff ff 5b 89 e8 5d 41 5c 41 5d 41 5e c3 41 0f b7 4e 
[19431.491689] RSP: 0018:ffffbfa7c6553a08 EFLAGS: 00010282
[19431.491690] RAX: 0000000000000000 RBX: ffffa0634ef2c8c0 RCX: 0000000000000006
[19431.491691] RDX: 0000000000000007 RSI: 0000000000000092 RDI: ffffa0636e5d6730
[19431.491691] RBP: 0000000000000000 R08: 00000000000006b1 R09: 0000000000000000
[19431.491692] R10: ffffa06354fd3000 R11: 0000000000000001 R12: ffffa063586e0760
[19431.491692] R13: 0000000000000000 R14: ffffbfa7c6553a56 R15: ffffa063586e0760
[19431.491693] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.491694] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.491695] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.491695] Call Trace:
[19431.491705]  ieee80211_set_wmm_default+0x1a5/0x3a0 [mac80211]
[19431.491715]  ieee80211_set_disassoc+0x21b/0x5c0 [mac80211]
[19431.491724]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[19431.491734]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[19431.491743]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[19431.491751]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[19431.491759]  cfg80211_leave+0x26/0x40 [cfg80211]
[19431.491766]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[19431.491770]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[19431.491774]  ? ath10k_wmi_cmd_send+0x141/0x1b0 [ath10k_core]
[19431.491776]  ? addrconf_notify+0x77/0xb10
[19431.491777]  ? inetdev_event+0x76/0x4f0
[19431.491779]  notifier_call_chain+0x47/0x70
[19431.491780]  __dev_close_many+0x5f/0x110
[19431.491782]  dev_close_many+0x9f/0x160
[19431.491783]  dev_close.part.93+0x64/0xa0
[19431.491791]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.491801]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.491802]  ? rcu_exp_wait_wake+0x530/0x530
[19431.491804]  ? try_to_del_timer_sync+0x4d/0x80
[19431.491810]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.491813]  process_one_work+0x195/0x370
[19431.491814]  worker_thread+0x30/0x390
[19431.491815]  ? process_one_work+0x370/0x370
[19431.491816]  kthread+0x113/0x130
[19431.491817]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.491819]  ret_from_fork+0x35/0x40
[19431.491820] ---[ end trace 5eabcedfdcf66eae ]---
[19431.491821] ------------[ cut here ]------------
[19431.491821] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[19431.491833] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 drv_conf_tx+0x15b/0x1a0 [mac80211]
[19431.491834] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.491853]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.491878]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.491887] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.491888] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.491894] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.491901] RIP: 0010:drv_conf_tx+0x15b/0x1a0 [mac80211]
[19431.491902] Code: 41 5c 41 5d 41 5e c3 48 8b 93 08 04 00 00 48 8d b3 28 04 00 00 48 c7 c7 38 ce 1c c1 48 85 d2 48 0f 45 f2 89 c2 e8 75 2e 31 e6 <0f> 0b bd fb ff ff ff 5b 89 e8 5d 41 5c 41 5d 41 5e c3 41 0f b7 4e 
[19431.491922] RSP: 0018:ffffbfa7c6553a08 EFLAGS: 00010282
[19431.491923] RAX: 0000000000000000 RBX: ffffa0634ef2c8c0 RCX: 0000000000000006
[19431.491923] RDX: 0000000000000007 RSI: 0000000000000092 RDI: ffffa0636e5d6730
[19431.491924] RBP: 0000000000000000 R08: 00000000000006e2 R09: 0000000000000000
[19431.491924] R10: ffffa06354fd3000 R11: 0000000000000001 R12: ffffa063586e0760
[19431.491925] R13: 0000000000000001 R14: ffffbfa7c6553a56 R15: ffffa063586e0760
[19431.491926] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.491927] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.491927] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.491928] Call Trace:
[19431.491937]  ieee80211_set_wmm_default+0x1a5/0x3a0 [mac80211]
[19431.491947]  ieee80211_set_disassoc+0x21b/0x5c0 [mac80211]
[19431.491956]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[19431.491966]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[19431.491975]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[19431.491983]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[19431.491991]  cfg80211_leave+0x26/0x40 [cfg80211]
[19431.491998]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[19431.492002]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[19431.492006]  ? ath10k_wmi_cmd_send+0x141/0x1b0 [ath10k_core]
[19431.492008]  ? addrconf_notify+0x77/0xb10
[19431.492009]  ? inetdev_event+0x76/0x4f0
[19431.492011]  notifier_call_chain+0x47/0x70
[19431.492013]  __dev_close_many+0x5f/0x110
[19431.492014]  dev_close_many+0x9f/0x160
[19431.492016]  dev_close.part.93+0x64/0xa0
[19431.492023]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.492032]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.492034]  ? rcu_exp_wait_wake+0x530/0x530
[19431.492035]  ? try_to_del_timer_sync+0x4d/0x80
[19431.492042]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.492045]  process_one_work+0x195/0x370
[19431.492047]  worker_thread+0x30/0x390
[19431.492048]  ? process_one_work+0x370/0x370
[19431.492049]  kthread+0x113/0x130
[19431.492050]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.492052]  ret_from_fork+0x35/0x40
[19431.492053] ---[ end trace 5eabcedfdcf66eaf ]---
[19431.492053] ------------[ cut here ]------------
[19431.492054] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[19431.492065] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 drv_conf_tx+0x15b/0x1a0 [mac80211]
[19431.492066] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.492085]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.492111]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.492119] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.492120] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.492127] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.492134] RIP: 0010:drv_conf_tx+0x15b/0x1a0 [mac80211]
[19431.492134] Code: 41 5c 41 5d 41 5e c3 48 8b 93 08 04 00 00 48 8d b3 28 04 00 00 48 c7 c7 38 ce 1c c1 48 85 d2 48 0f 45 f2 89 c2 e8 75 2e 31 e6 <0f> 0b bd fb ff ff ff 5b 89 e8 5d 41 5c 41 5d 41 5e c3 41 0f b7 4e 
[19431.492153] RSP: 0018:ffffbfa7c6553a08 EFLAGS: 00010282
[19431.492154] RAX: 0000000000000000 RBX: ffffa0634ef2c8c0 RCX: 0000000000000006
[19431.492154] RDX: 0000000000000007 RSI: 0000000000000092 RDI: ffffa0636e5d6730
[19431.492155] RBP: 0000000000000000 R08: 0000000000000713 R09: 0000000000000000
[19431.492155] R10: ffffa06354fd3000 R11: 0000000000000001 R12: ffffa063586e0760
[19431.492156] R13: 0000000000000002 R14: ffffbfa7c6553a56 R15: ffffa063586e0760
[19431.492157] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.492158] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.492159] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.492160] Call Trace:
[19431.492169]  ieee80211_set_wmm_default+0x1a5/0x3a0 [mac80211]
[19431.492178]  ieee80211_set_disassoc+0x21b/0x5c0 [mac80211]
[19431.492187]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[19431.492197]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[19431.492206]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[19431.492214]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[19431.492222]  cfg80211_leave+0x26/0x40 [cfg80211]
[19431.492229]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[19431.492233]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[19431.492237]  ? ath10k_wmi_cmd_send+0x141/0x1b0 [ath10k_core]
[19431.492239]  ? addrconf_notify+0x77/0xb10
[19431.492241]  ? inetdev_event+0x76/0x4f0
[19431.492242]  notifier_call_chain+0x47/0x70
[19431.492244]  __dev_close_many+0x5f/0x110
[19431.492245]  dev_close_many+0x9f/0x160
[19431.492247]  dev_close.part.93+0x64/0xa0
[19431.492254]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.492263]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.492265]  ? rcu_exp_wait_wake+0x530/0x530
[19431.492266]  ? try_to_del_timer_sync+0x4d/0x80
[19431.492273]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.492275]  process_one_work+0x195/0x370
[19431.492276]  worker_thread+0x30/0x390
[19431.492277]  ? process_one_work+0x370/0x370
[19431.492278]  kthread+0x113/0x130
[19431.492279]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.492281]  ret_from_fork+0x35/0x40
[19431.492282] ---[ end trace 5eabcedfdcf66eb0 ]---
[19431.492283] ------------[ cut here ]------------
[19431.492284] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[19431.492295] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 drv_conf_tx+0x15b/0x1a0 [mac80211]
[19431.492296] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.492316]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.492341]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.492350] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.492350] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.492357] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.492364] RIP: 0010:drv_conf_tx+0x15b/0x1a0 [mac80211]
[19431.492364] Code: 41 5c 41 5d 41 5e c3 48 8b 93 08 04 00 00 48 8d b3 28 04 00 00 48 c7 c7 38 ce 1c c1 48 85 d2 48 0f 45 f2 89 c2 e8 75 2e 31 e6 <0f> 0b bd fb ff ff ff 5b 89 e8 5d 41 5c 41 5d 41 5e c3 41 0f b7 4e 
[19431.492383] RSP: 0018:ffffbfa7c6553a08 EFLAGS: 00010282
[19431.492384] RAX: 0000000000000000 RBX: ffffa0634ef2c8c0 RCX: 0000000000000006
[19431.492385] RDX: 0000000000000007 RSI: 0000000000000092 RDI: ffffa0636e5d6730
[19431.492385] RBP: 0000000000000000 R08: 0000000000000744 R09: 0000000000000000
[19431.492386] R10: ffffa06354fd3000 R11: 0000000000000001 R12: ffffa063586e0760
[19431.492386] R13: 0000000000000003 R14: ffffbfa7c6553a56 R15: ffffa063586e0760
[19431.492387] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.492389] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.492389] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.492390] Call Trace:
[19431.492399]  ieee80211_set_wmm_default+0x1a5/0x3a0 [mac80211]
[19431.492408]  ieee80211_set_disassoc+0x21b/0x5c0 [mac80211]
[19431.492417]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[19431.492427]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[19431.492436]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[19431.492444]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[19431.492451]  cfg80211_leave+0x26/0x40 [cfg80211]
[19431.492459]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[19431.492463]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[19431.492467]  ? ath10k_wmi_cmd_send+0x141/0x1b0 [ath10k_core]
[19431.492469]  ? addrconf_notify+0x77/0xb10
[19431.492470]  ? inetdev_event+0x76/0x4f0
[19431.492472]  notifier_call_chain+0x47/0x70
[19431.492473]  __dev_close_many+0x5f/0x110
[19431.492475]  dev_close_many+0x9f/0x160
[19431.492476]  dev_close.part.93+0x64/0xa0
[19431.492483]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.492493]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.492495]  ? rcu_exp_wait_wake+0x530/0x530
[19431.492496]  ? try_to_del_timer_sync+0x4d/0x80
[19431.492503]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.492504]  process_one_work+0x195/0x370
[19431.492506]  worker_thread+0x30/0x390
[19431.492508]  ? process_one_work+0x370/0x370
[19431.492509]  kthread+0x113/0x130
[19431.492510]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.492511]  ret_from_fork+0x35/0x40
[19431.492512] ---[ end trace 5eabcedfdcf66eb1 ]---
[19431.492513] ------------[ cut here ]------------
[19431.492514] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[19431.492528] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 ieee80211_assign_vif_chanctx+0x3f6/0x440 [mac80211]
[19431.492529] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.492549]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.492574]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.492582] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.492583] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.492590] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.492599] RIP: 0010:ieee80211_assign_vif_chanctx+0x3f6/0x440 [mac80211]
[19431.492599] Code: 85 c0 75 e7 e9 be fc ff ff 48 8b 83 08 04 00 00 48 8d b3 28 04 00 00 48 c7 c7 b0 ea 1c c1 48 85 c0 48 0f 45 f0 e8 da b9 2d e6 <0f> 0b e9 96 fc ff ff 48 8b 83 08 04 00 00 48 8d b3 28 04 00 00 48 
[19431.492619] RSP: 0018:ffffbfa7c6553a20 EFLAGS: 00010282
[19431.492620] RAX: 0000000000000000 RBX: ffffa0634ef2c8c0 RCX: 0000000000000006
[19431.492620] RDX: 0000000000000007 RSI: 0000000000000082 RDI: ffffa0636e5d6730
[19431.492621] RBP: 0000000000000000 R08: 0000000000000775 R09: 0000000000000000
[19431.492622] R10: ffffa06354fd3000 R11: 0000000000000001 R12: ffffa063586e0760
[19431.492622] R13: ffffa062bed02718 R14: ffffa062bed026c0 R15: ffffa0634ef2d150
[19431.492623] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.492624] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.492625] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.492625] Call Trace:
[19431.492627]  ? lock_timer_base+0x67/0x80
[19431.492635]  __ieee80211_vif_release_channel+0x4f/0x140 [mac80211]
[19431.492643]  ieee80211_vif_release_channel+0x3a/0x50 [mac80211]
[19431.492652]  ieee80211_set_disassoc+0x288/0x5c0 [mac80211]
[19431.492661]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[19431.492671]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[19431.492680]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[19431.492688]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[19431.492696]  cfg80211_leave+0x26/0x40 [cfg80211]
[19431.492702]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[19431.492706]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[19431.492711]  ? ath10k_wmi_cmd_send+0x141/0x1b0 [ath10k_core]
[19431.492712]  ? addrconf_notify+0x77/0xb10
[19431.492714]  ? inetdev_event+0x76/0x4f0
[19431.492715]  notifier_call_chain+0x47/0x70
[19431.492717]  __dev_close_many+0x5f/0x110
[19431.492718]  dev_close_many+0x9f/0x160
[19431.492720]  dev_close.part.93+0x64/0xa0
[19431.492727]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.492738]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.492739]  ? rcu_exp_wait_wake+0x530/0x530
[19431.492740]  ? try_to_del_timer_sync+0x4d/0x80
[19431.492747]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.492749]  process_one_work+0x195/0x370
[19431.492750]  worker_thread+0x30/0x390
[19431.492752]  ? process_one_work+0x370/0x370
[19431.492752]  kthread+0x113/0x130
[19431.492753]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.492755]  ret_from_fork+0x35/0x40
[19431.492756] ---[ end trace 5eabcedfdcf66eb2 ]---
[19431.492757] ------------[ cut here ]------------
[19431.492757] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[19431.492769] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 ieee80211_bss_info_change_notify+0x178/0x180 [mac80211]
[19431.492770] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.492790]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.492814]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.492823] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.492824] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.492831] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.492837] RIP: 0010:ieee80211_bss_info_change_notify+0x178/0x180 [mac80211]
[19431.492838] Code: 85 c0 75 de e9 28 ff ff ff 48 8b b3 08 04 00 00 48 8d bb 28 04 00 00 48 85 f6 48 0f 44 f7 48 c7 c7 f0 cc 1c c1 e8 18 50 31 e6 <0f> 0b e9 41 ff ff ff 90 0f 1f 44 00 00 c6 87 c6 0a 00 00 00 c6 87 
[19431.492857] RSP: 0018:ffffbfa7c65539f0 EFLAGS: 00010282
[19431.492858] RAX: 0000000000000000 RBX: ffffa0634ef2c8c0 RCX: 0000000000000006
[19431.492859] RDX: 0000000000000007 RSI: 0000000000000082 RDI: ffffa0636e5d6730
[19431.492860] RBP: 0000000000004000 R08: 00000000000007a8 R09: 0000000000000000
[19431.492860] R10: ffffa06354fd3000 R11: 0000000000000001 R12: ffffa063586e0760
[19431.492861] R13: 0000000000000000 R14: ffffa062bed026c0 R15: ffffa0634ef2d150
[19431.492862] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.492862] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.492863] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.492863] Call Trace:
[19431.492872]  ieee80211_assign_vif_chanctx+0x2e0/0x440 [mac80211]
[19431.492874]  ? lock_timer_base+0x67/0x80
[19431.492882]  __ieee80211_vif_release_channel+0x4f/0x140 [mac80211]
[19431.492890]  ieee80211_vif_release_channel+0x3a/0x50 [mac80211]
[19431.492899]  ieee80211_set_disassoc+0x288/0x5c0 [mac80211]
[19431.492908]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[19431.492918]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[19431.492927]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[19431.492936]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[19431.492943]  cfg80211_leave+0x26/0x40 [cfg80211]
[19431.492950]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[19431.492953]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[19431.492959]  ? ath10k_wmi_cmd_send+0x141/0x1b0 [ath10k_core]
[19431.492960]  ? addrconf_notify+0x77/0xb10
[19431.492962]  ? inetdev_event+0x76/0x4f0
[19431.492963]  notifier_call_chain+0x47/0x70
[19431.492965]  __dev_close_many+0x5f/0x110
[19431.492966]  dev_close_many+0x9f/0x160
[19431.492968]  dev_close.part.93+0x64/0xa0
[19431.492975]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.492985]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.492986]  ? rcu_exp_wait_wake+0x530/0x530
[19431.492987]  ? try_to_del_timer_sync+0x4d/0x80
[19431.492994]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.492996]  process_one_work+0x195/0x370
[19431.492997]  worker_thread+0x30/0x390
[19431.492999]  ? process_one_work+0x370/0x370
[19431.493000]  kthread+0x113/0x130
[19431.493001]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.493002]  ret_from_fork+0x35/0x40
[19431.493003] ---[ end trace 5eabcedfdcf66eb3 ]---
[19431.493018] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:870 ieee80211_del_chanctx+0x141/0x150 [mac80211]
[19431.493018] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.493038]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.493063]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.493072] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.493072] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.493079] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.493088] RIP: 0010:ieee80211_del_chanctx+0x141/0x150 [mac80211]
[19431.493088] Code: 06 00 4d 85 e4 74 1e 49 8b 04 24 49 8b 7c 24 08 49 83 c4 18 48 89 de e8 dd 5f c6 e6 49 8b 04 24 48 85 c0 75 e6 e9 6c ff ff ff <0f> 0b e9 1e ff ff ff 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 55 53 
[19431.493107] RSP: 0018:ffffbfa7c6553a30 EFLAGS: 00010246
[19431.493108] RAX: 0000000000000000 RBX: ffffa063586e0760 RCX: dead000000000200
[19431.493109] RDX: ffffa063586e1158 RSI: ffffa062bed026c0 RDI: ffffa063586e0760
[19431.493109] RBP: ffffa062bed026c0 R08: ffffa062bed02118 R09: 0000000000000000
[19431.493110] R10: ffffa06354fd3000 R11: 0000000000000001 R12: ffffa0634ef2c8c0
[19431.493111] R13: ffffa062bed02718 R14: 0000000000000003 R15: ffffa0634ef2d150
[19431.493112] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.493113] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.493113] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.493114] Call Trace:
[19431.493122]  ieee80211_free_chanctx+0xa3/0xd0 [mac80211]
[19431.493129]  __ieee80211_vif_release_channel+0xf1/0x140 [mac80211]
[19431.493137]  ieee80211_vif_release_channel+0x3a/0x50 [mac80211]
[19431.493146]  ieee80211_set_disassoc+0x288/0x5c0 [mac80211]
[19431.493154]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[19431.493165]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[19431.493174]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[19431.493183]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[19431.493190]  cfg80211_leave+0x26/0x40 [cfg80211]
[19431.493197]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[19431.493200]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[19431.493205]  ? ath10k_wmi_cmd_send+0x141/0x1b0 [ath10k_core]
[19431.493206]  ? addrconf_notify+0x77/0xb10
[19431.493208]  ? inetdev_event+0x76/0x4f0
[19431.493209]  notifier_call_chain+0x47/0x70
[19431.493211]  __dev_close_many+0x5f/0x110
[19431.493212]  dev_close_many+0x9f/0x160
[19431.493214]  dev_close.part.93+0x64/0xa0
[19431.493221]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.493231]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.493233]  ? rcu_exp_wait_wake+0x530/0x530
[19431.493234]  ? try_to_del_timer_sync+0x4d/0x80
[19431.493241]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.493243]  process_one_work+0x195/0x370
[19431.493244]  worker_thread+0x30/0x390
[19431.493245]  ? process_one_work+0x370/0x370
[19431.493246]  kthread+0x113/0x130
[19431.493247]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.493249]  ret_from_fork+0x35/0x40
[19431.493250] ---[ end trace 5eabcedfdcf66eb4 ]---
[19431.493253] ath10k_pci 0000:02:00.0: failed to flush transmit queue (skip 1 ar-state 0): 1250
[19431.493356] ------------[ cut here ]------------
[19431.493356] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[19431.493373] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 drv_remove_interface+0xf5/0x100 [mac80211]
[19431.493373] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.493401]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.493435]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.493446] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.493447] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.493455] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.493463] RIP: 0010:drv_remove_interface+0xf5/0x100 [mac80211]
[19431.493463] Code: 85 c0 75 e8 5b 5d 41 5c c3 48 8b b3 08 04 00 00 48 81 c3 28 04 00 00 48 c7 c7 38 ce 1c c1 48 85 f6 48 0f 44 f3 e8 1b 35 31 e6 <0f> 0b 5b 5d 41 5c c3 0f 1f 40 00 0f 1f 44 00 00 41 57 41 56 41 55 
[19431.493486] RSP: 0018:ffffbfa7c6553c90 EFLAGS: 00010282
[19431.493488] RAX: 0000000000000000 RBX: ffffa0634ef2cce8 RCX: 0000000000000006
[19431.493488] RDX: 0000000000000007 RSI: 0000000000000086 RDI: ffffa0636e5d6730
[19431.493489] RBP: ffffa063586e0760 R08: 000000000000080e R09: 0000000000000000
[19431.493490] R10: 0000000000000000 R11: 0000000000000001 R12: ffffa063586e0b80
[19431.493490] R13: ffffa063586e0760 R14: ffffa063586e0ee8 R15: ffffa0634ef2d370
[19431.493492] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.493492] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.493493] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.493494] Call Trace:
[19431.493504]  ieee80211_do_stop+0x4f6/0x820 [mac80211]
[19431.493513]  ieee80211_stop+0x16/0x20 [mac80211]
[19431.493515]  __dev_close_many+0xa1/0x110
[19431.493516]  dev_close_many+0x9f/0x160
[19431.493518]  dev_close.part.93+0x64/0xa0
[19431.493527]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.493538]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.493540]  ? rcu_exp_wait_wake+0x530/0x530
[19431.493541]  ? try_to_del_timer_sync+0x4d/0x80
[19431.493549]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.493551]  process_one_work+0x195/0x370
[19431.493552]  worker_thread+0x30/0x390
[19431.493554]  ? process_one_work+0x370/0x370
[19431.493555]  kthread+0x113/0x130
[19431.493556]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.493558]  ret_from_fork+0x35/0x40
[19431.493559] ---[ end trace 5eabcedfdcf66eb5 ]---
[19431.493573] WARNING: CPU: 7 PID: 6608 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.c:39 drv_stop+0xe1/0xf0 [mac80211]
[19431.493574] Modules linked in: rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi dell_wmi wmi_bmof intel_rapl nls_ascii nls_cp437 btusb ath10k_pci x86_pkg_temp_thermal btrtl dell_laptop intel_powerclamp vfat btbcm ath10k_core btintel dell_smbios fat coretemp ath dcdbas bluetooth dell_wmi_descriptor drbg snd_soc_skl mac80211 kvm_intel snd_hda_codec_realtek snd_soc_skl_ipc snd_hda_codec_generic snd_soc_sst_ipc ansi_cprng snd_soc_sst_dsp cfg80211 snd_hda_ext_core ecdh_generic snd_soc_acpi kvm irqbypass crct10dif_pclmul crc32_pclmul snd_soc_core snd_compress snd_hda_intel uvcvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops ghash_clmulni_intel snd_hda_core videobuf2_v4l2 snd_hwdep intel_cstate videobuf2_common intel_uncore snd_pcm_oss videodev intel_rapl_perf snd_mixer_oss
[19431.493597]  media efi_pstore tpm_crb snd_pcm snd_timer rtsx_pci_ms mei_me snd iTCO_wdt serio_raw pcspkr efivars iTCO_vendor_support memstick soundcore hid_multitouch rfkill mei idma64 processor_thermal_device intel_soc_dts_iosf intel_pch_thermal ucsi_acpi typec_ucsi battery typec wmi intel_hid tpm_tis tpm_tis_core sparse_keymap int3403_thermal evdev tpm int340x_thermal_zone int3400_thermal rng_core acpi_thermal_rel acpi_pad ac pcc_cpufreq ecryptfs drbd lru_cache parport_pc sunrpc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hid_generic rtsx_pci_sdmmc
[19431.493626]  crc32c_intel mmc_core i915 i2c_algo_bit aesni_intel xhci_pci aes_x86_64 nvme crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[19431.493636] CPU: 7 PID: 6608 Comm: kworker/7:1 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[19431.493637] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[19431.493645] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[19431.493653] RIP: 0010:drv_stop+0xe1/0xf0 [mac80211]
[19431.493653] Code: 31 0a 00 48 85 ed 74 1d 48 8b 45 00 48 8b 7d 08 48 83 c5 18 48 89 de e8 8d c8 c9 e6 48 8b 45 00 48 85 c0 75 e7 e9 58 ff ff ff <0f> 0b 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 55 
[19431.493675] RSP: 0018:ffffbfa7c6553c98 EFLAGS: 00010246
[19431.493676] RAX: 0000000000000000 RBX: ffffa063586e0760 RCX: 0000000000000000
[19431.493677] RDX: ffffa063515fadc0 RSI: 0000000000000286 RDI: ffffa063586e0760
[19431.493678] RBP: ffffa063586e0ff0 R08: ffffbfa7c6553c20 R09: 0000000000000000
[19431.493678] R10: ffffbfa7c6553ca0 R11: 0000000000000040 R12: ffffa063586e0b80
[19431.493679] R13: ffffa063586e0760 R14: ffffa063586e0ee8 R15: ffffa0634ef2d370
[19431.493680] FS:  0000000000000000(0000) GS:ffffa0636e5c0000(0000) knlGS:0000000000000000
[19431.493681] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19431.493682] CR2: 00007f16ddfb6000 CR3: 000000012780a004 CR4: 00000000003606e0
[19431.493682] Call Trace:
[19431.493691]  ieee80211_do_stop+0x4df/0x820 [mac80211]
[19431.493700]  ieee80211_stop+0x16/0x20 [mac80211]
[19431.493702]  __dev_close_many+0xa1/0x110
[19431.493703]  dev_close_many+0x9f/0x160
[19431.493705]  dev_close.part.93+0x64/0xa0
[19431.493713]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[19431.493723]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[19431.493725]  ? rcu_exp_wait_wake+0x530/0x530
[19431.493726]  ? try_to_del_timer_sync+0x4d/0x80
[19431.493734]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[19431.493736]  process_one_work+0x195/0x370
[19431.493737]  worker_thread+0x30/0x390
[19431.493739]  ? process_one_work+0x370/0x370
[19431.493739]  kthread+0x113/0x130
[19431.493741]  ? kthread_create_worker_on_cpu+0x70/0x70
[19431.493742]  ret_from_fork+0x35/0x40
[19431.493744] ---[ end trace 5eabcedfdcf66eb6 ]---

--=-=-=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--=-=-=--
