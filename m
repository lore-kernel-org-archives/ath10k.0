Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-co1nam03on0094.outbound.protection.outlook.com
 ([104.47.40.94] helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWXA6-0005Y7-TD
 for ath10k@lists.infradead.org; Wed, 25 Jan 2017 23:39:37 +0000
From: Kevin Dious <Kevin.Dious@ubiqomm.com>
Subject: Re: ath10k + OpenWRT + ath10k firmware 10.2.2.60.14 - Crash
Date: Wed, 25 Jan 2017 23:39:09 +0000
Message-ID: <BLUPR06MB8682BCD53C888879F9B4E68E0740@BLUPR06MB868.namprd06.prod.outlook.com>
References: <BLUPR06MB868ABBAAB6D6107EECB885FE0740@BLUPR06MB868.namprd06.prod.outlook.com>
In-Reply-To: <BLUPR06MB868ABBAAB6D6107EECB885FE0740@BLUPR06MB868.namprd06.prod.outlook.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

To whomever may can help,

I'm writing because I am having an issue with ath10k + OpenWRT + ath10k fir=
mware 10.2.2.60.14.

Currently my company has a license to the AR9888 firmware. =A0We have versi=
on 10.2.2.60.14. =A0I know this is a rather old version but this is what we=
 have access to for now. =A0We are able to build the firmware and we are wo=
rking on making some custom firmware  changes. =A0I am working with OpenWRT=
 15.05 and a Compex WPJ344 board and a AR9888 802.11ac chip.

After building the firmware, I am left with several binaries including athw=
lan.bin and otp.bin. =A0I run the following command to use the firmware enc=
oder to create the firmware binary:

qca-swiss-army-knife/tools/scripts/ath10k$ python ath10k-fwencoder -c --otp=
 otp.bin --firmware athwlan.bin --set-fw-api 3 --set-wmi-op-version 10.2 --=
set-htt-op-version unset


I am using the ath10k-fwencoder script found here:
https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath10=
k/ath10k-fwencoder

I then copy the firmware to the correct location so that it is created when=
 I build my OpenWRT image. =A0After I copy the device image to memory, I bo=
ot the device. =A0During bootup I see the following logs:




[ =A0 11.940000] PCI: Enabling device 0000:00:00.0 (0000 -> 0002)
[ =A0 11.950000] ath10k_pci 0000:00:00.0: pci irq legacy interrupts 0 irq_m=
ode 0 reset_mode 0
[ =A0 12.170000] ath10k_pci 0000:00:00.0: Direct firmware load for ath10k/c=
al-pci-0000:00:00.0.bin failed with error -2
[ =A0 12.180000] ath10k_pci 0000:00:00.0: Falling back to user helper
[ =A0 12.270000] firmware ath10k!cal-pci-0000:00:00.0.bin: firmware_loading=
_store: map pages failed
[ =A0 12.280000] ath10k_pci 0000:00:00.0: Direct firmware load for ath10k/Q=
CA988X/hw2.0/firmware-5.bin failed with error -2
[ =A0 12.290000] ath10k_pci 0000:00:00.0: Falling back to user helper
[ =A0 12.390000] firmware ath10k!QCA988X!hw2.0!firmware-5.bin: firmware_loa=
ding_store: map pages failed
[ =A0 12.400000] ath10k_pci 0000:00:00.0: could not fetch firmware file 'at=
h10k/QCA988X/hw2.0/firmware-5.bin': -11
[ =A0 12.410000] ath10k_pci 0000:00:00.0: Direct firmware load for ath10k/Q=
CA988X/hw2.0/firmware-4.bin failed with error -2
[ =A0 12.420000] ath10k_pci 0000:00:00.0: Falling back to user helper
[ =A0 12.520000] firmware ath10k!QCA988X!hw2.0!firmware-4.bin: firmware_loa=
ding_store: map pages failed
[ =A0 12.530000] ath10k_pci 0000:00:00.0: could not fetch firmware file 'at=
h10k/QCA988X/hw2.0/firmware-4.bin': -11
[ =A0 12.540000] ath10k_pci 0000:00:00.0: qca988x hw2.0 target 0x4100016c c=
hip_id 0x043222ff sub 0000:0000
[ =A0 12.550000] ath10k_pci 0000:00:00.0: kconfig debug 0 debugfs 1 tracing=
 0 dfs 1 testmode 1
[ =A0 12.570000] ath10k_pci 0000:00:00.0: firmware ver =A0api 3 features =
=A0crc32 167fdc70
[ =A0 12.600000] ath10k_pci 0000:00:00.0: Direct firmware load for ath10k/Q=
CA988X/hw2.0/board-2.bin failed with error -2
[ =A0 12.610000] ath10k_pci 0000:00:00.0: Falling back to user helper
[ =A0 12.700000] firmware ath10k!QCA988X!hw2.0!board-2.bin: firmware_loadin=
g_store: map pages failed
[ =A0 12.710000] ath10k_pci 0000:00:00.0: board_file api 1 bmi_id N/A crc32=
 bebc7c08
[ =A0 13.730000] ath10k_pci 0000:00:00.0: htt-ver 2.1 wmi-op 3 htt-op 2 cal=
 otp max-sta 128 raw 0 hwcrypto 1

 And when I review the /etc/config/wireless once the=A0bootup process=A0is =
complete=A0file I see that AR9888 shows up as a PCI card (radio0):
=A0

config wifi-device =A0radio0
=A0 =A0 =A0 =A0 option type =A0 =A0 mac80211
=A0 =A0 =A0 =A0 option channel =A036
=A0 =A0 =A0 =A0 option hwmode =A0 11a
=A0 =A0 =A0 =A0 option path =A0 =A0 'pci0000:00/0000:00:00.0'
=A0 =A0 =A0 =A0 option htmode =A0 VHT80
=A0 =A0 =A0 =A0 # REMOVE THIS LINE TO ENABLE WIFI:
=A0 =A0 =A0 =A0 option disabled 1


config wifi-iface
=A0 =A0 =A0 =A0 option device =A0 radio0
=A0 =A0 =A0 =A0 option network =A0lan
=A0 =A0 =A0 =A0 option mode =A0 =A0 ap
=A0 =A0 =A0 =A0 option ssid =A0 =A0 OpenWrt
=A0 =A0 =A0 =A0 option encryption none


config wifi-device =A0radio1
=A0 =A0 =A0 =A0 option type =A0 =A0 mac80211
=A0 =A0 =A0 =A0 option channel =A011
=A0 =A0 =A0 =A0 option hwmode =A0 11g
=A0 =A0 =A0 =A0 option path =A0 =A0 'platform/ar934x_wmac'
=A0 =A0 =A0 =A0 option htmode =A0 HT20
=A0 =A0 =A0 =A0 # REMOVE THIS LINE TO ENABLE WIFI:
=A0 =A0 =A0 =A0 option disabled 1


config wifi-iface
=A0 =A0 =A0 =A0 option device =A0 radio1
=A0 =A0 =A0 =A0 option network =A0lan
=A0 =A0 =A0 =A0 option mode =A0 =A0 ap
=A0 =A0 =A0 =A0 option ssid =A0 =A0 OpenWrt
=A0 =A0 =A0 =A0 option encryption none


However, when I try to enable the AR9888 card and boot it up (calling "eifi=
" at the command line) I get the following error. =A0The firmware crashes a=
nd the device tries to restart it again, and this continues forever.


I am not sure how to make sense of the firware crash dump there. =A0Has any=
one seen anything like this before? =A0Or have any tips about how to interp=
ret this firmware dump that ath10k gives? =A0I am happy to provide any addi=
tional requested details. =A0Thank you.



root@OpenWrt:/# [ =A0114.440000] ath10k_pci 0000:00:00.0: failed to receive=
 initialized event from target: 00000000
[ =A0115.560000] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[ =A0115.570000] device wlan0 entered promiscuous mode
[ =A0115.730000] ath10k_pci 0000:00:00.0: no channel configured; ignoring f=
rame(s)!
[ =A0115.890000] br-lan: port 2(wlan0) entered forwarding state
[ =A0115.900000] br-lan: port 2(wlan0) entered forwarding state
[ =A0115.910000] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[ =A0117.260000] ath10k_pci 0000:00:00.0: firmware crashed! (uuid a55a5b20-=
c144-4a53-be4e-916bbeb09686)
[ =A0117.270000] ath10k_pci 0000:00:00.0: qca988x hw2.0 target 0x4100016c c=
hip_id 0x043222ff sub 0000:0000
[ =A0117.280000] ath10k_pci 0000:00:00.0: kconfig debug 0 debugfs 1 tracing=
 0 dfs 1 testmode 1
[ =A0117.290000] ath10k_pci 0000:00:00.0: firmware ver 65.14.0.0 api 3 feat=
ures =A0crc32 167fdc70
[ =A0117.300000] ath10k_pci 0000:00:00.0: board_file api 1 bmi_id N/A crc32=
 bebc7c08
[ =A0117.310000] ath10k_pci 0000:00:00.0: htt-ver 2.1 wmi-op 3 htt-op 2 cal=
 otp max-sta 128 raw 0 hwcrypto 1
[ =A0117.320000] ath10k_pci 0000:00:00.0: firmware register dump:
[ =A0117.330000] ath10k_pci 0000:00:00.0: [00]: 0x4100016C 0x00000000 0x004=
14C64 0x00414C64
[ =A0117.330000] ath10k_pci 0000:00:00.0: [04]: 0x00414C64 0x00060530 0x000=
0001F 0x00000001
[ =A0117.340000] ath10k_pci 0000:00:00.0: [08]: 0x0040AE04 0x00400000 0x000=
00007 0x00000000
[ =A0117.350000] ath10k_pci 0000:00:00.0: [12]: 0x00000002 0xFFFFFFFF 0x009=
58360 0x0095836B
[ =A0117.360000] ath10k_pci 0000:00:00.0: [16]: 0x809B02B0 0x0040AD94 0x004=
0AE04 0x00400000
[ =A0117.370000] ath10k_pci 0000:00:00.0: [20]: 0x00000000 0x00000000 0x000=
00000 0x0040F6A0
[ =A0117.380000] ath10k_pci 0000:00:00.0: [24]: 0x809AF9C0 0x0040ADC4 0x000=
00001 0x0040AE04
[ =A0117.380000] ath10k_pci 0000:00:00.0: [28]: 0x0041397C 0x00000001 0x004=
0AE08 0x00000002
[ =A0117.390000] ath10k_pci 0000:00:00.0: [32]: 0x00000007 0x00000000 0x000=
00000 0x00413964
[ =A0117.400000] ath10k_pci 0000:00:00.0: [36]: 0x809BD4EF 0x0040ADE4 0x004=
11B0C 0x00411B30
[ =A0117.410000] ath10k_pci 0000:00:00.0: [40]: 0x00000001 0x00000000 0x009=
55A00 0x0040F6B0
[ =A0117.420000] ath10k_pci 0000:00:00.0: [44]: 0x809BCD0C 0x0040AE04 0x000=
00001 0x00000000
[ =A0117.420000] ath10k_pci 0000:00:00.0: [48]: 0x0040AE04 0x00000001 0x004=
13964 0x00411D50
[ =A0117.430000] ath10k_pci 0000:00:00.0: [52]: 0x809BCA78 0x0040AEA4 0x004=
1F294 0x0041216C
[ =A0117.440000] ath10k_pci 0000:00:00.0: [56]: 0x00413964 0x0040AE34 0x004=
124AC 0x004124AC
[ =A0117.550000] ieee80211 phy0: Hardware restart was requested
[ =A0117.900000] br-lan: port 2(wlan0) entered forwarding state
[ =A0118.820000] ath10k_pci 0000:00:00.0: device successfully recovered
[ =A0126.050000] device wlan0 left promiscuous mode
[ =A0126.050000] br-lan: port 2(wlan0) entered disabled state
[ =A0126.120000] ath10k_pci 0000:00:00.0: firmware crashed! (uuid f91615b9-=
9daa-4e2d-9295-7fa34a773157)
[ =A0126.130000] ath10k_pci 0000:00:00.0: qca988x hw2.0 target 0x4100016c c=
hip_id 0x043222ff sub 0000:0000
[ =A0126.140000] ath10k_pci 0000:00:00.0: kconfig debug 0 debugfs 1 tracing=
 0 dfs 1 testmode 1
[ =A0126.150000] ath10k_pci 0000:00:00.0: firmware ver 65.14.0.0 api 3 feat=
ures =A0crc32 167fdc70
[ =A0126.160000] ath10k_pci 0000:00:00.0: board_file api 1 bmi_id N/A crc32=
 bebc7c08
[ =A0126.170000] ath10k_pci 0000:00:00.0: htt-ver 2.1 wmi-op 3 htt-op 2 cal=
 otp max-sta 128 raw 0 hwcrypto 1
[ =A0126.180000] ath10k_pci 0000:00:00.0: firmware register dump:
[ =A0126.190000] ath10k_pci 0000:00:00.0: [00]: 0x4100016C 0x00000000 0x004=
14C64 0x00414C64
[ =A0126.200000] ath10k_pci 0000:00:00.0: [04]: 0x00414C64 0x00060530 0x000=
0001F 0x00000001
[ =A0126.200000] ath10k_pci 0000:00:00.0: [08]: 0x0040AE04 0x00400000 0x000=
00007 0x00000000
[ =A0126.210000] ath10k_pci 0000:00:00.0: [12]: 0x00000002 0x00000000 0x009=
57F04 0x00957F12
[ =A0126.220000] ath10k_pci 0000:00:00.0: [16]: 0x809B02B0 0x0040AD94 0x004=
0AE04 0x00400000
[ =A0126.230000] ath10k_pci 0000:00:00.0: [20]: 0x00000000 0x00000000 0x000=
00000 0x0040F6A0
[ =A0126.240000] ath10k_pci 0000:00:00.0: [24]: 0x809AF9C0 0x0040ADC4 0x000=
00001 0x0040AE04
[ =A0126.240000] ath10k_pci 0000:00:00.0: [28]: 0x0041397C 0x00000001 0x004=
0AE08 0x00000002
[ =A0126.250000] ath10k_pci 0000:00:00.0: [32]: 0x00000007 0x00000000 0x000=
00000 0x00413964
[ =A0126.260000] ath10k_pci 0000:00:00.0: [36]: 0x809BD4EF 0x0040ADE4 0x004=
11B0C 0x00411B30
[ =A0126.270000] ath10k_pci 0000:00:00.0: [40]: 0x00000001 0x00000000 0x009=
55A00 0x0040F6B0
[ =A0126.280000] ath10k_pci 0000:00:00.0: [44]: 0x809BCD0C 0x0040AE04 0x000=
00001 0x00000000
[ =A0126.280000] ath10k_pci 0000:00:00.0: [48]: 0x0040AE04 0x00000001 0x004=
13964 0x00411D50
[ =A0126.290000] ath10k_pci 0000:00:00.0: [52]: 0x809BCA78 0x0040AEA4 0x004=
1F294 0x0041216C
[ =A0126.300000] ath10k_pci 0000:00:00.0: [56]: 0x00413964 0x0040AE34 0x004=
124AC 0x004124AC
[ =A0126.310000] ath10k_pci 0000:00:00.0: failed to flush transmit queue (s=
kip 1 ar-state 1): 500
[ =A0126.420000] ieee80211 phy0: Hardware restart was requested
[ =A0126.420000] ath10k_pci 0000:00:00.0: failed to submit AP/IBSS self-pee=
r removal on vdev 0: -143
[ =A0126.430000] ath10k_pci 0000:00:00.0: failed to delete WMI vdev 0: -143
[ =A0126.440000] ath10k_pci 0000:00:00.0: removing stale peer 04:f0:21:1a:7=
b:3d from vdev_id 0
[ =A0128.080000] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[ =A0128.090000] device wlan0 entered promiscuous mode
[ =A0128.250000] ath10k_pci 0000:00:00.0: no channel configured; ignoring f=
rame(s)!
[ =A0128.410000] br-lan: port 2(wlan0) entered forwarding state
[ =A0128.420000] br-lan: port 2(wlan0) entered forwarding state
[ =A0128.420000] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[ =A0130.420000] br-lan: port 2(wlan0) entered forwarding state
[ =A0154.520000] ath10k_pci 0000:00:00.0: firmware crashed! (uuid a33b7858-=
5887-4ba9-9210-4ac3295bf196)
[ =A0154.530000] ath10k_pci 0000:00:00.0: qca988x hw2.0 target 0x4100016c c=
hip_id 0x043222ff sub 0000:0000
[ =A0154.540000] ath10k_pci 0000:00:00.0: kconfig debug 0 debugfs 1 tracing=
 0 dfs 1 testmode 1
[ =A0154.550000] ath10k_pci 0000:00:00.0: firmware ver 65.14.0.0 api 3 feat=
ures =A0crc32 167fdc70
[ =A0154.560000] ath10k_pci 0000:00:00.0: board_file api 1 bmi_id N/A crc32=
 bebc7c08
[ =A0154.570000] ath10k_pci 0000:00:00.0: htt-ver 2.1 wmi-op 3 htt-op 2 cal=
 otp max-sta 128 raw 0 hwcrypto 1
[ =A0154.580000] ath10k_pci 0000:00:00.0: firmware register dump:
[ =A0154.590000] ath10k_pci 0000:00:00.0: [00]: 0x4100016C 0x00000000 0x004=
14C64 0x00414C64
[ =A0154.590000] ath10k_pci 0000:00:00.0: [04]: 0x00414C64 0x00060530 0x000=
0001F 0x00000001
[ =A0154.600000] ath10k_pci 0000:00:00.0: [08]: 0x0040AE04 0x00400000 0x000=
00007 0x00000000
[ =A0154.610000] ath10k_pci 0000:00:00.0: [12]: 0x00000002 0xFFFFFFFF 0x009=
58360 0x0095836B
[ =A0154.620000] ath10k_pci 0000:00:00.0: [16]: 0x809B02B0 0x0040AD94 0x004=
0AE04 0x00400000
[ =A0154.630000] ath10k_pci 0000:00:00.0: [20]: 0x00000000 0x00000000 0x000=
00000 0x0040F6A0
[ =A0154.630000] ath10k_pci 0000:00:00.0: [24]: 0x809AF9C0 0x0040ADC4 0x000=
00001 0x0040AE04
[ =A0154.640000] ath10k_pci 0000:00:00.0: [28]: 0x0041397C 0x00000001 0x004=
0AE08 0x00000002
[ =A0154.650000] ath10k_pci 0000:00:00.0: [32]: 0x00000007 0x00000000 0x000=
00000 0x00413964
[ =A0154.660000] ath10k_pci 0000:00:00.0: [36]: 0x809BD4EF 0x0040ADE4 0x004=
11B0C 0x00411B30
[ =A0154.670000] ath10k_pci 0000:00:00.0: [40]: 0x00000001 0x00000000 0x009=
55A00 0x0040F6B0
[ =A0154.670000] ath10k_pci 0000:00:00.0: [44]: 0x809BCD0C 0x0040AE04 0x000=
00001 0x00000000
[ =A0154.680000] ath10k_pci 0000:00:00.0: [48]: 0x0040AE04 0x00000001 0x004=
13964 0x00411D50
[ =A0154.690000] ath10k_pci 0000:00:00.0: [52]: 0x809BCA78 0x0040AEA4 0x004=
1F294 0x0041216C
[ =A0154.700000] ath10k_pci 0000:00:00.0: [56]: 0x00413964 0x0040AE34 0x004=
124AC 0x004124AC
[ =A0154.810000] ieee80211 phy0: Hardware restart was requested
[ =A0156.070000] ath10k_pci 0000:00:00.0: device successfully recovered
[ =A0157.710000] ath10k_pci 0000:00:00.0: firmware crashed! (uuid 2a52de2f-=
f701-4a1e-86c5-30ff75995af5)
[ =A0157.720000] ath10k_pci 0000:00:00.0: qca988x hw2.0 target 0x4100016c c=
hip_id 0x043222ff sub 0000:0000
[ =A0157.730000] ath10k_pci 0000:00:00.0: kconfig debug 0 debugfs 1 tracing=
 0 dfs 1 testmode 1
[ =A0157.740000] ath10k_pci 0000:00:00.0: firmware ver 65.14.0.0 api 3 feat=
ures =A0crc32 167fdc70
[ =A0157.750000] ath10k_pci 0000:00:00.0: board_file api 1 bmi_id N/A crc32=
 bebc7c08
[ =A0157.760000] ath10k_pci 0000:00:00.0: htt-ver 2.1 wmi-op 3 htt-op 2 cal=
 otp max-sta 128 raw 0 hwcrypto 1
[ =A0157.770000] ath10k_pci 0000:00:00.0: firmware register dump:
[ =A0157.780000] ath10k_pci 0000:00:00.0: [00]: 0x4100016C 0x00000000 0x004=
14C64 0x00414C64
[ =A0157.780000] ath10k_pci 0000:00:00.0: [04]: 0x00414C64 0x00060530 0x000=
0001F 0x00000001
[ =A0157.790000] ath10k_pci 0000:00:00.0: [08]: 0x0040AE04 0x00400000 0x000=
00007 0x00000000
[ =A0157.800000] ath10k_pci 0000:00:00.0: [12]: 0x00000002 0x00000000 0x009=
57F04 0x00957F12
[ =A0157.810000] ath10k_pci 0000:00:00.0: [16]: 0x809B02B0 0x0040AD94 0x004=
0AE04 0x00400000
[ =A0157.820000] ath10k_pci 0000:00:00.0: [20]: 0x00000000 0x00000000 0x000=
00000 0x0040F6A0
[ =A0157.820000] ath10k_pci 0000:00:00.0: [24]: 0x809AF9C0 0x0040ADC4 0x000=
00001 0x0040AE04
[ =A0157.830000] ath10k_pci 0000:00:00.0: [28]: 0x0041397C 0x00000001 0x004=
0AE08 0x00000002
[ =A0157.840000] ath10k_pci 0000:00:00.0: [32]: 0x00000007 0x00000000 0x000=
00000 0x00413964
[ =A0157.850000] ath10k_pci 0000:00:00.0: [36]: 0x809BD4EF 0x0040ADE4 0x004=
11B0C 0x00411B30
[ =A0157.860000] ath10k_pci 0000:00:00.0: [40]: 0x00000001 0x00000000 0x009=
55A00 0x0040F6B0
[ =A0157.860000] ath10k_pci 0000:00:00.0: [44]: 0x809BCD0C 0x0040AE04 0x000=
00001 0x00000000
[ =A0157.870000] ath10k_pci 0000:00:00.0: [48]: 0x0040AE04 0x00000001 0x004=
13964 0x00411D50
[ =A0157.880000] ath10k_pci 0000:00:00.0: [52]: 0x809BCA78 0x0040AEA4 0x004=
1F294 0x0041216C
[ =A0157.890000] ath10k_pci 0000:00:00.0: [56]: 0x00413964 0x0040AE34 0x004=
124AC 0x004124AC
[ =A0158.000000] ieee80211 phy0: Hardware restart was requested
[ =A0159.260000] ath10k_pci 0000:00:00.0: device successfully recovered





      =

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
