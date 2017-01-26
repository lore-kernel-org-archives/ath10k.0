Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bl2nam02on0102.outbound.protection.outlook.com
 ([104.47.38.102] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWpvR-0004F0-Nt
 for ath10k@lists.infradead.org; Thu, 26 Jan 2017 19:41:46 +0000
From: Kevin Dious <Kevin.Dious@ubiqomm.com>
Subject: Re: ath10k + OpenWRT + ath10k firmware 10.2.2.60.14 - Crash
Date: Thu, 26 Jan 2017 19:41:17 +0000
Message-ID: <BLUPR06MB868F752D392CD881E0FFFA6E0770@BLUPR06MB868.namprd06.prod.outlook.com>
References: <BLUPR06MB868ABBAAB6D6107EECB885FE0740@BLUPR06MB868.namprd06.prod.outlook.com>
 <BLUPR06MB8682BCD53C888879F9B4E68E0740@BLUPR06MB868.namprd06.prod.outlook.com>
 <CAJ-Vmokm1ZYJUfEcwvg49Q3v=G6c=TVnfSsAn-+BgcPHZ+muOg@mail.gmail.com>
 <BLUPR06MB86859F97513770F64B72784E0770@BLUPR06MB868.namprd06.prod.outlook.com>
 <BLUPR06MB868447C715B572A777EB7ABE0770@BLUPR06MB868.namprd06.prod.outlook.com>,
 <CAJ-VmonSzmo_2QaKccxUoTWTHXiK_MN4_JWYv5r-GFsQXY4sAQ@mail.gmail.com>
In-Reply-To: <CAJ-VmonSzmo_2QaKccxUoTWTHXiK_MN4_JWYv5r-GFsQXY4sAQ@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Adrian (and anyone else who chimes in),

Thank you for your help.  I'm a bit new to this so I really appreciate your=
 help.  Please let me know if enabling any additional debug logs or taking =
any additional steps would be helpful.  The wireless chip I am using is the=
 AR9888 which is an 802.11ac wireless chip capable of 2.4Ghz and 5Ghz.  I a=
m focuse don bringing it up as a 802.11ac 5GHz mode.

Per your instructions I enabled the WMI and MAC debugging but doing the fol=
lowing after the device booted up (but before bringing up the wifi chip):
root@OpenWrt:/# echo 0x12 > /sys/module/ath10k_core/parameters/debug_mask

Then I brought up the wifi device by doing the following (the device is dis=
abled by default at bootup):

a. Editing the /etc/config/wireless file to set the channel to 149, change =
the hwmode from "11a" to "11ac", enable radio0 and saving it (changed the o=
ption disabled from "1" to "0"):

config wifi-device  radio0
        option type     mac80211
        option channel  149
        option hwmode   11ac
        option path     'pci0000:00/0000:00:00.0'
        option htmode   VHT80
        # REMOVE THIS LINE TO ENABLE WIFI:
        option disabled 0

config wifi-iface
        option device   radio0
        option network  lan
        option mode     ap
        option ssid     OpenWrt_Kevin
        option encryption none

config wifi-device  radio1
        option type     mac80211
        option channel  11
        option hwmode   11g
        option path     'platform/ar934x_wmac'
        option htmode   HT20
        # REMOVE THIS LINE TO ENABLE WIFI:
        option disabled 1

config wifi-iface
        option device   radio1
        option network  lan
        option mode     ap
        option ssid     OpenWrt
        option encryption none


b. type "wifi" at th eocmmand prompt

Below are the dmesg logs (used grep and filtered on "ath10k"):

root@OpenWrt:/# dmesg | grep ath10k


[   11.970000] ath10k_pci 0000:00:00.0: pci irq legacy interrupts 0 irq_mod=
e 0 reset_mode 0
[   12.190000] ath10k_pci 0000:00:00.0: Direct firmware load for ath10k/cal=
-pci-0000:00:00.0.bin failed with error -2
[   12.200000] ath10k_pci 0000:00:00.0: Falling back to user helper
[   12.290000] firmware ath10k!cal-pci-0000:00:00.0.bin: firmware_loading_s=
tore: map pages failed
[   12.300000] ath10k_pci 0000:00:00.0: Direct firmware load for ath10k/QCA=
988X/hw2.0/firmware-5.bin failed with error -2
[   12.310000] ath10k_pci 0000:00:00.0: Falling back to user helper
[   12.410000] firmware ath10k!QCA988X!hw2.0!firmware-5.bin: firmware_loadi=
ng_store: map pages failed
[   12.420000] ath10k_pci 0000:00:00.0: could not fetch firmware file 'ath1=
0k/QCA988X/hw2.0/firmware-5.bin': -11
[   12.430000] ath10k_pci 0000:00:00.0: Direct firmware load for ath10k/QCA=
988X/hw2.0/firmware-4.bin failed with error -2
[   12.440000] ath10k_pci 0000:00:00.0: Falling back to user helper
[   12.540000] firmware ath10k!QCA988X!hw2.0!firmware-4.bin: firmware_loadi=
ng_store: map pages failed
[   12.550000] ath10k_pci 0000:00:00.0: could not fetch firmware file 'ath1=
0k/QCA988X/hw2.0/firmware-4.bin': -11
[   12.560000] ath10k_pci 0000:00:00.0: qca988x hw2.0 target 0x4100016c chi=
p_id 0x043222ff sub 0000:0000
[   12.570000] ath10k_pci 0000:00:00.0: kconfig debug 1 debugfs 1 tracing 0=
 dfs 1 testmode 1
[   12.590000] ath10k_pci 0000:00:00.0: firmware ver  api 3 features  crc32=
 11ebb35d
[   12.620000] ath10k_pci 0000:00:00.0: Direct firmware load for ath10k/QCA=
988X/hw2.0/board-2.bin failed with error -2
[   12.630000] ath10k_pci 0000:00:00.0: Falling back to user helper
[   12.720000] firmware ath10k!QCA988X!hw2.0!board-2.bin: firmware_loading_=
store: map pages failed
[   12.730000] ath10k_pci 0000:00:00.0: board_file api 1 bmi_id N/A crc32 b=
ebc7c08
[   13.750000] ath10k_pci 0000:00:00.0: htt-ver 2.1 wmi-op 3 htt-op 2 cal o=
tp max-sta 128 raw 0 hwcrypto 1
[   93.220000] ath10k_pci 0000:00:00.0: wmi svc: 00000000: 0e 00 00 00 07 0=
0 00 00 07 00 00 00 09 00 00 00  ................
[   93.220000] ath10k_pci 0000:00:00.0: wmi svc: 00000010: 0f 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00  ................
[   93.220000] ath10k_pci 0000:00:00.0: wmi svc: 00000020: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00  ................
[   93.220000] ath10k_pci 0000:00:00.0: wmi svc: 00000030: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00  ................
[   93.220000] ath10k_pci 0000:00:00.0: wmi event service ready min_tx_powe=
r 0x0000003f max_tx_power 0x0000003f ht_cap 0x0000085b vht_cap 0x338001b2 s=
w_ver0 0x4100000e sw_ver1 0x00000000 1
[   93.220000] ath10k_pci 0000:00:00.0: wmi chunk 0 len 64380 requested, ad=
dr 0x6420000
[   93.220000] ath10k_pci 0000:00:00.0: wmi init 10.2
[   93.240000] ath10k_pci 0000:00:00.0: wmi event ready sw_version 10905190=
54 abi_version 1 mac_addr 04:f0:21:1a:7b:3d status 0
[   93.240000] ath10k_pci 0000:00:00.0: wmi disable pktlog
[   93.240000] ath10k_pci 0000:00:00.0: wmi pdev set param 30 value 1
[   93.240000] ath10k_pci 0000:00:00.0: wmi pdev set param 10 value 1
[   93.240000] ath10k_pci 0000:00:00.0: wmi pdev set param 41 value 0
[   93.240000] ath10k_pci 0000:00:00.0: wmi pdev set param 1 value 3
[   93.240000] ath10k_pci 0000:00:00.0: wmi pdev set param 2 value 3
[   93.250000] ath10k_pci 0000:00:00.0: wmi pdev set param 31 value 0
[   93.250000] ath10k_pci 0000:00:00.0: wmi pdev set param 33 value 1
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [0/25] freq 5180 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [1/25] freq 5200 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [2/25] freq 5220 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [3/25] freq 5240 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [4/25] freq 5260 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [5/25] freq 5280 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [6/25] freq 5300 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [7/25] freq 5320 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [8/25] freq 5500 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [9/25] freq 5520 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [10/25] freq 5540 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [11/25] freq 5560 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [12/25] freq 5580 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [13/25] freq 5600 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [14/25] freq 5620 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [15/25] freq 5640 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [16/25] freq 5660 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [17/25] freq 5680 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [18/25] freq 5700 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [19/25] freq 5720 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [20/25] freq 5745 maxpo=
wer 60 regpower 60 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [21/25] freq 5765 maxpo=
wer 60 regpower 60 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [22/25] freq 5785 maxpo=
wer 60 regpower 60 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [23/25] freq 5805 maxpo=
wer 60 regpower 60 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: mac channel [24/25] freq 5825 maxpo=
wer 60 regpower 60 antenna 0 mode 0
[   93.250000] ath10k_pci 0000:00:00.0: wmi pdev regdomain rd 3a rd2g 3a rd=
5g 3a ctl2g 10 ctl5g 10 dfs_region 1
[   93.260000] ath10k_pci 0000:00:00.0: mac create vdev 0 map ffff
[   93.260000] ath10k_pci 0000:00:00.0: mac vdev create 0 (add interface) t=
ype 1 subtype 0 bcnmode single-buf
[   93.260000] ath10k_pci 0000:00:00.0: WMI vdev create: id 0 type 1 subtyp=
e 0 macaddr 04:f0:21:1a:7b:3d
[   93.260000] ath10k_pci 0000:00:00.0: vdev param 0 not supported by firmw=
are
[   93.260000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 32 value 2
[   93.260000] ath10k_pci 0000:00:00.0: wmi peer create vdev_id 0 peer_addr=
 04:f0:21:1a:7b:3d
[   93.260000] ath10k_pci 0000:00:00.0: wmi pdev set param 13 value 320
[   93.260000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 38 value =
3747
[   93.260000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 39 value =
3895
[   93.260000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 40 value =
3900
[   93.260000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 1 value -1
[   93.260000] ath10k_pci 0000:00:00.0: mac txpower 0
[   93.260000] ath10k_pci 0000:00:00.0: wmi pdev set param 3 value 0
[   93.260000] ath10k_pci 0000:00:00.0: wmi pdev set param 4 value 0
[   93.260000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[   93.260000] ath10k_pci 0000:00:00.0: mac vdev 0 cts_prot 0
[   93.260000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 43 value =
17
[   93.260000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 24 value 0
[   93.260000] ath10k_pci 0000:00:00.0: mac vdev 0 slot_time 1
[   93.260000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 7 value 1
[   93.260000] ath10k_pci 0000:00:00.0: mac vdev 0 preamble 1n
[   93.260000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 8 value 1
[   93.260000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[   93.260000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[   93.260000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[   93.260000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[   93.260000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[   93.270000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[   93.280000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[   93.280000] ath10k_pci 0000:00:00.0: wmi 10x start scan
[   93.280000] ath10k_pci 0000:00:00.0: scan event started type 1 reason 3 =
freq 0 req_id 40961 scan_id 40960 vdev_id 0 state starting (1)
[   93.280000] ath10k_pci 0000:00:00.0: scan event bss channel type 4 reaso=
n 3 freq 0 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
[   93.280000] ath10k_pci 0000:00:00.0: scan event foreign channel type 8 r=
eason 3 freq 5745 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
[   93.280000] ath10k_pci 0000:00:00.0: chan info err_code 0 freq 5745 cmd_=
flags 0 noise_floor 0 rx_clear_count 1588630 cycle_count 4634863
[   93.430000] ath10k_pci 0000:00:00.0: scan event bss channel type 4 reaso=
n 3 freq 5745 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
[   93.430000] ath10k_pci 0000:00:00.0: chan info err_code 0 freq 5745 cmd_=
flags 1 noise_floor -107 rx_clear_count 2508924 cycle_count 17485800
[   93.430000] ath10k_pci 0000:00:00.0: scan event foreign channel type 8 r=
eason 3 freq 5765 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
[   93.430000] ath10k_pci 0000:00:00.0: chan info err_code 0 freq 5765 cmd_=
flags 0 noise_floor 0 rx_clear_count 2509759 cycle_count 17838999
[   93.580000] ath10k_pci 0000:00:00.0: scan event bss channel type 4 reaso=
n 3 freq 5765 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
[   93.580000] ath10k_pci 0000:00:00.0: chan info err_code 0 freq 5765 cmd_=
flags 1 noise_floor -106 rx_clear_count 2781472 cycle_count 30689936
[   93.580000] ath10k_pci 0000:00:00.0: scan event completed type 2 reason =
0 freq 5765 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
[   93.580000] ath10k_pci 0000:00:00.0: mac chanctx add freq 5765 width 3 p=
tr 85cbc6b0
[   93.580000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[   93.580000] ath10k_pci 0000:00:00.0: mac chanctx assign ptr 85cbc6b0 vde=
v_id 0
[   93.580000] ath10k_pci 0000:00:00.0: mac vdev 0 start center_freq 5765 p=
hymode 11ac-vht80
[   93.580000] ath10k_pci 0000:00:00.0: wmi vdev start id 0x0 flags: 0x0, f=
req 5765, mode 10, ch_flags: 0xA000000, max_power: 60
[   93.590000] ath10k_pci 0000:00:00.0: WMI_VDEV_START_RESP_EVENTID
[   93.590000] ath10k_pci 0000:00:00.0: mac vdev_id 0 txpower 30
[   93.590000] ath10k_pci 0000:00:00.0: mac txpower 30
[   93.590000] ath10k_pci 0000:00:00.0: wmi pdev set param 3 value 60
[   93.590000] ath10k_pci 0000:00:00.0: wmi pdev set param 4 value 60
[   93.590000] ath10k_pci 0000:00:00.0: mac chanctx change freq 5765 width =
3 ptr 85cbc6b0 changed 2
[   93.590000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 3 value 1=
00
[   93.590000] ath10k_pci 0000:00:00.0: mac vdev 0 beacon_interval 100
[   93.590000] ath10k_pci 0000:00:00.0: vdev 0 set beacon tx mode to stagge=
red
[   93.590000] ath10k_pci 0000:00:00.0: wmi pdev set param 7 value 0
[   93.590000] ath10k_pci 0000:00:00.0: mac vdev 0 dtim_period 2
[   93.590000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 13 value 2
[   93.590000] ath10k_pci 0000:00:00.0: wmi mgmt vdev up id 0x0 assoc id 0 =
bssid 04:f0:21:1a:7b:3d
[   93.590000] ath10k_pci 0000:00:00.0: mac vdev 0 up
[   93.590000] ath10k_pci 0000:00:00.0: mac vdev_id 0 txpower 30
[   93.590000] ath10k_pci 0000:00:00.0: mac txpower 30
[   93.590000] ath10k_pci 0000:00:00.0: WMI_TBTTOFFSET_UPDATE_EVENTID
[   93.590000] ath10k_pci 0000:00:00.0: wmi pdev set param 3 value 60
[   93.590000] ath10k_pci 0000:00:00.0: wmi pdev set param 4 value 60
[   93.590000] ath10k_pci 0000:00:00.0: mac vdev 0 cts_prot 0
[   93.590000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 43 value =
17
[   93.590000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 24 value 0
[   93.590000] ath10k_pci 0000:00:00.0: mac vdev 0 slot_time 2
[   93.590000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 7 value 2
[   93.590000] ath10k_pci 0000:00:00.0: mac vdev 0 preamble 2n
[   93.590000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 8 value 2
[   93.620000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[   93.620000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[   93.620000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[   93.620000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[   93.620000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[   93.680000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[   94.220000] ath10k_pci 0000:00:00.0: wmi event debug mesg len 164
[   95.360000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[   96.410000] ath10k_pci 0000:00:00.0: firmware crashed! (uuid 7a4754d1-99=
4d-49d0-9d25-ca362d51279d)
[   96.420000] ath10k_pci 0000:00:00.0: qca988x hw2.0 target 0x4100016c chi=
p_id 0x043222ff sub 0000:0000
[   96.430000] ath10k_pci 0000:00:00.0: kconfig debug 1 debugfs 1 tracing 0=
 dfs 1 testmode 1
[   96.450000] ath10k_pci 0000:00:00.0: firmware ver 65.14.0.0 api 3 featur=
es  crc32 11ebb35d
[   96.460000] ath10k_pci 0000:00:00.0: board_file api 1 bmi_id N/A crc32 b=
ebc7c08
[   96.460000] ath10k_pci 0000:00:00.0: htt-ver 2.1 wmi-op 3 htt-op 2 cal o=
tp max-sta 128 raw 0 hwcrypto 1
[   96.470000] ath10k_pci 0000:00:00.0: firmware register dump:
[   96.480000] ath10k_pci 0000:00:00.0: [00]: 0x4100016C 0x00000000 0x00414=
C64 0x00414C64
[   96.490000] ath10k_pci 0000:00:00.0: [04]: 0x00414C64 0x00060530 0x00000=
01F 0x00000001
[   96.500000] ath10k_pci 0000:00:00.0: [08]: 0x0040AE04 0x00400000 0x00000=
007 0x00000000
[   96.500000] ath10k_pci 0000:00:00.0: [12]: 0x00000002 0x00000000 0x00957=
F04 0x00957F12
[   96.510000] ath10k_pci 0000:00:00.0: [16]: 0x809B02B0 0x0040AD94 0x0040A=
E04 0x00400000
[   96.520000] ath10k_pci 0000:00:00.0: [20]: 0x00000000 0x00000000 0x00000=
000 0x0040F6A0
[   96.530000] ath10k_pci 0000:00:00.0: [24]: 0x809AF9C0 0x0040ADC4 0x00000=
001 0x0040AE04
[   96.540000] ath10k_pci 0000:00:00.0: [28]: 0x0041397C 0x00000001 0x0040A=
E08 0x00000002
[   96.540000] ath10k_pci 0000:00:00.0: [32]: 0x00000007 0x00000000 0x00000=
000 0x00413964
[   96.550000] ath10k_pci 0000:00:00.0: [36]: 0x809BD4EF 0x0040ADE4 0x00411=
B0C 0x00411B30
[   96.560000] ath10k_pci 0000:00:00.0: [40]: 0x00000001 0x00000000 0x00955=
A00 0x0040F6B0
[   96.570000] ath10k_pci 0000:00:00.0: [44]: 0x809BCD0C 0x0040AE04 0x00000=
001 0x00000000
[   96.580000] ath10k_pci 0000:00:00.0: [48]: 0x0040AE04 0x00000001 0x00413=
964 0x00411D50
[   96.590000] ath10k_pci 0000:00:00.0: [52]: 0x809BCA78 0x0040AEA4 0x0041F=
294 0x0041216C
[   96.590000] ath10k_pci 0000:00:00.0: [56]: 0x00413964 0x0040AE34 0x00412=
4AC 0x004124AC
[   96.700000] ath10k_pci 0000:00:00.0: wmi disable pktlog
[   97.910000] ath10k_pci 0000:00:00.0: wmi svc: 00000000: 0e 00 00 00 07 0=
0 00 00 07 00 00 00 09 00 00 00  ................
[   97.910000] ath10k_pci 0000:00:00.0: wmi svc: 00000010: 0f 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00  ................
[   97.910000] ath10k_pci 0000:00:00.0: wmi svc: 00000020: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00  ................
[   97.910000] ath10k_pci 0000:00:00.0: wmi svc: 00000030: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00  ................
[   97.910000] ath10k_pci 0000:00:00.0: wmi event service ready min_tx_powe=
r 0x0000003f max_tx_power 0x0000003f ht_cap 0x0000085b vht_cap 0x338001b2 s=
w_ver0 0x4100000e sw_ver1 0x00000000 1
[   97.910000] ath10k_pci 0000:00:00.0: wmi chunk 0 len 64380 requested, ad=
dr 0x6420000
[   97.910000] ath10k_pci 0000:00:00.0: wmi init 10.2
[   97.930000] ath10k_pci 0000:00:00.0: wmi event ready sw_version 10905190=
54 abi_version 1 mac_addr 04:f0:21:1a:7b:3d status 0
[   97.940000] ath10k_pci 0000:00:00.0: wmi disable pktlog
[   97.940000] ath10k_pci 0000:00:00.0: wmi pdev set param 30 value 1
[   97.940000] ath10k_pci 0000:00:00.0: wmi pdev set param 10 value 1
[   97.940000] ath10k_pci 0000:00:00.0: wmi pdev set param 41 value 0
[   97.940000] ath10k_pci 0000:00:00.0: wmi pdev set param 1 value 3
[   97.940000] ath10k_pci 0000:00:00.0: wmi pdev set param 2 value 3
[   97.950000] ath10k_pci 0000:00:00.0: wmi pdev set param 31 value 0
[   97.950000] ath10k_pci 0000:00:00.0: wmi pdev set param 33 value 1
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [0/25] freq 5180 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [1/25] freq 5200 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [2/25] freq 5220 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [3/25] freq 5240 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [4/25] freq 5260 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [5/25] freq 5280 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [6/25] freq 5300 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [7/25] freq 5320 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [8/25] freq 5500 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [9/25] freq 5520 maxpow=
er 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [10/25] freq 5540 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [11/25] freq 5560 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [12/25] freq 5580 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [13/25] freq 5600 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [14/25] freq 5620 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [15/25] freq 5640 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [16/25] freq 5660 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [17/25] freq 5680 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [18/25] freq 5700 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [19/25] freq 5720 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [20/25] freq 5745 maxpo=
wer 60 regpower 60 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [21/25] freq 5765 maxpo=
wer 60 regpower 60 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [22/25] freq 5785 maxpo=
wer 60 regpower 60 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [23/25] freq 5805 maxpo=
wer 60 regpower 60 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: mac channel [24/25] freq 5825 maxpo=
wer 60 regpower 60 antenna 0 mode 0
[   97.950000] ath10k_pci 0000:00:00.0: wmi pdev regdomain rd 3a rd2g 3a rd=
5g 3a ctl2g 10 ctl5g 10 dfs_region 1
[   97.950000] ath10k_pci 0000:00:00.0: mac create vdev 0 map ffff
[   97.950000] ath10k_pci 0000:00:00.0: mac vdev create 0 (add interface) t=
ype 1 subtype 0 bcnmode single-buf
[   97.950000] ath10k_pci 0000:00:00.0: WMI vdev create: id 0 type 1 subtyp=
e 0 macaddr 04:f0:21:1a:7b:3d
[   97.950000] ath10k_pci 0000:00:00.0: vdev param 0 not supported by firmw=
are
[   97.950000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 32 value 2
[   97.950000] ath10k_pci 0000:00:00.0: wmi peer create vdev_id 0 peer_addr=
 04:f0:21:1a:7b:3d
[   97.950000] ath10k_pci 0000:00:00.0: wmi pdev set param 13 value 320
[   97.950000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 38 value =
3747
[   97.950000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 39 value =
3895
[   97.950000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 40 value =
3900
[   97.950000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 1 value -1
[   97.950000] ath10k_pci 0000:00:00.0: mac txpower 30
[   97.950000] ath10k_pci 0000:00:00.0: wmi pdev set param 3 value 60
[   97.950000] ath10k_pci 0000:00:00.0: wmi pdev set param 4 value 60
[   97.950000] ath10k_pci 0000:00:00.0: mac chanctx add freq 5765 width 3 p=
tr 85cbc6b0
[   97.950000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[   97.950000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[   97.950000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[   97.950000] ath10k_pci 0000:00:00.0: mac chanctx assign ptr 85cbc6b0 vde=
v_id 0
[   97.950000] ath10k_pci 0000:00:00.0: mac vdev 0 start center_freq 5765 p=
hymode 11ac-vht80
[   97.950000] ath10k_pci 0000:00:00.0: wmi vdev start id 0x0 flags: 0x0, f=
req 5765, mode 10, ch_flags: 0xA000000, max_power: 60
[   97.960000] ath10k_pci 0000:00:00.0: WMI_VDEV_START_RESP_EVENTID
[   97.960000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[   97.960000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[   97.960000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[   97.960000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[   97.960000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 3 value 1=
00
[   97.960000] ath10k_pci 0000:00:00.0: mac vdev 0 beacon_interval 100
[   97.960000] ath10k_pci 0000:00:00.0: vdev 0 set beacon tx mode to stagge=
red
[   97.960000] ath10k_pci 0000:00:00.0: wmi pdev set param 7 value 0
[   97.960000] ath10k_pci 0000:00:00.0: mac vdev 0 dtim_period 2
[   97.960000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 13 value 2
[   97.960000] ath10k_pci 0000:00:00.0: wmi mgmt vdev up id 0x0 assoc id 0 =
bssid 04:f0:21:1a:7b:3d
[   97.960000] ath10k_pci 0000:00:00.0: mac vdev 0 up
[   97.960000] ath10k_pci 0000:00:00.0: mac vdev 0 cts_prot 0
[   97.960000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 43 value =
17
[   97.960000] ath10k_pci 0000:00:00.0: WMI_TBTTOFFSET_UPDATE_EVENTID
[   97.960000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 24 value 0
[   97.960000] ath10k_pci 0000:00:00.0: mac vdev 0 slot_time 2
[   97.960000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 7 value 2
[   97.960000] ath10k_pci 0000:00:00.0: mac vdev 0 preamble 2n
[   97.960000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 8 value 2
[   97.960000] ath10k_pci 0000:00:00.0: mac vdev_id 0 txpower 30
[   97.960000] ath10k_pci 0000:00:00.0: mac txpower 30
[   97.960000] ath10k_pci 0000:00:00.0: wmi pdev set param 3 value 60
[   97.960000] ath10k_pci 0000:00:00.0: wmi pdev set param 4 value 60
[   97.960000] ath10k_pci 0000:00:00.0: device successfully recovered
[   98.910000] ath10k_pci 0000:00:00.0: wmi event debug mesg len 164
[  103.750000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[  103.750000] ath10k_pci 0000:00:00.0: wmi mgmt vdev down id 0x0
[  103.750000] ath10k_pci 0000:00:00.0: mac chanctx unassign ptr 85cbc6b0 v=
dev_id 0
[  103.750000] ath10k_pci 0000:00:00.0: wmi vdev stop id 0x0
[  103.820000] ath10k_pci 0000:00:00.0: firmware crashed! (uuid 563f5bdf-68=
41-4997-a2a0-998be6eb3bc9)
[  103.830000] ath10k_pci 0000:00:00.0: qca988x hw2.0 target 0x4100016c chi=
p_id 0x043222ff sub 0000:0000
[  103.840000] ath10k_pci 0000:00:00.0: kconfig debug 1 debugfs 1 tracing 0=
 dfs 1 testmode 1
[  103.860000] ath10k_pci 0000:00:00.0: firmware ver 65.14.0.0 api 3 featur=
es  crc32 11ebb35d
[  103.860000] ath10k_pci 0000:00:00.0: board_file api 1 bmi_id N/A crc32 b=
ebc7c08
[  103.870000] ath10k_pci 0000:00:00.0: htt-ver 2.1 wmi-op 3 htt-op 2 cal o=
tp max-sta 128 raw 0 hwcrypto 1
[  103.880000] ath10k_pci 0000:00:00.0: firmware register dump:
[  103.890000] ath10k_pci 0000:00:00.0: [00]: 0x4100016C 0x00000000 0x00414=
C64 0x00414C64
[  103.900000] ath10k_pci 0000:00:00.0: [04]: 0x00414C64 0x00060530 0x00000=
01F 0x00000001
[  103.910000] ath10k_pci 0000:00:00.0: [08]: 0x0040AE04 0x00400000 0x00000=
007 0x00000000
[  103.910000] ath10k_pci 0000:00:00.0: [12]: 0x00000002 0x00000000 0x00957=
F04 0x00957F12
[  103.920000] ath10k_pci 0000:00:00.0: [16]: 0x809B02B0 0x0040AD94 0x0040A=
E04 0x00400000
[  103.930000] ath10k_pci 0000:00:00.0: [20]: 0x00000000 0x00000000 0x00000=
000 0x0040F6A0
[  103.940000] ath10k_pci 0000:00:00.0: [24]: 0x809AF9C0 0x0040ADC4 0x00000=
001 0x0040AE04
[  103.950000] ath10k_pci 0000:00:00.0: [28]: 0x0041397C 0x00000001 0x0040A=
E08 0x00000002
[  103.950000] ath10k_pci 0000:00:00.0: [32]: 0x00000007 0x00000000 0x00000=
000 0x00413964
[  103.960000] ath10k_pci 0000:00:00.0: [36]: 0x809BD4EF 0x0040ADE4 0x00411=
B0C 0x00411B30
[  103.970000] ath10k_pci 0000:00:00.0: [40]: 0x00000001 0x00000000 0x00955=
A00 0x0040F6B0
[  103.980000] ath10k_pci 0000:00:00.0: [44]: 0x809BCD0C 0x0040AE04 0x00000=
001 0x00000000
[  103.990000] ath10k_pci 0000:00:00.0: [48]: 0x0040AE04 0x00000001 0x00413=
964 0x00411D50
[  103.990000] ath10k_pci 0000:00:00.0: [52]: 0x809BCA78 0x0040AEA4 0x0041F=
294 0x0041216C
[  104.000000] ath10k_pci 0000:00:00.0: [56]: 0x00413964 0x0040AE34 0x00412=
4AC 0x004124AC
[  104.010000] ath10k_pci 0000:00:00.0: mac chanctx remove freq 5765 width =
3 ptr 85cbc6b0
[  104.010000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[  104.010000] ath10k_pci 0000:00:00.0: failed to flush transmit queue (ski=
p 1 ar-state 1): 500
[  104.120000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[  104.120000] ath10k_pci 0000:00:00.0: wmi peer delete vdev_id 0 peer_addr=
 04:f0:21:1a:7b:3d
[  104.120000] ath10k_pci 0000:00:00.0: failed to submit AP/IBSS self-peer =
removal on vdev 0: -143
[  104.130000] ath10k_pci 0000:00:00.0: mac vdev 0 delete (remove interface)
[  104.130000] ath10k_pci 0000:00:00.0: WMI vdev delete id 0
[  104.130000] ath10k_pci 0000:00:00.0: failed to delete WMI vdev 0: -143
[  104.140000] ath10k_pci 0000:00:00.0: removing stale peer 04:f0:21:1a:7b:=
3d from vdev_id 0
[  104.150000] ath10k_pci 0000:00:00.0: wmi disable pktlog
[  105.730000] ath10k_pci 0000:00:00.0: wmi svc: 00000000: 0e 00 00 00 07 0=
0 00 00 07 00 00 00 09 00 00 00  ................
[  105.730000] ath10k_pci 0000:00:00.0: wmi svc: 00000010: 0f 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00  ................
[  105.730000] ath10k_pci 0000:00:00.0: wmi svc: 00000020: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00  ................
[  105.730000] ath10k_pci 0000:00:00.0: wmi svc: 00000030: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00  ................
[  105.730000] ath10k_pci 0000:00:00.0: wmi event service ready min_tx_powe=
r 0x0000003f max_tx_power 0x0000003f ht_cap 0x0000085b vht_cap 0x338001b2 s=
w_ver0 0x4100000e sw_ver1 0x00000000 1
[  105.730000] ath10k_pci 0000:00:00.0: wmi chunk 0 len 64380 requested, ad=
dr 0x6420000
[  105.730000] ath10k_pci 0000:00:00.0: wmi init 10.2
[  105.760000] ath10k_pci 0000:00:00.0: wmi event ready sw_version 10905190=
54 abi_version 1 mac_addr 04:f0:21:1a:7b:3d status 0
[  105.760000] ath10k_pci 0000:00:00.0: wmi disable pktlog
[  105.760000] ath10k_pci 0000:00:00.0: wmi pdev set param 30 value 1
[  105.760000] ath10k_pci 0000:00:00.0: wmi pdev set param 10 value 1
[  105.760000] ath10k_pci 0000:00:00.0: wmi pdev set param 41 value 0
[  105.760000] ath10k_pci 0000:00:00.0: wmi pdev set param 1 value 3
[  105.760000] ath10k_pci 0000:00:00.0: wmi pdev set param 2 value 3
[  105.770000] ath10k_pci 0000:00:00.0: wmi pdev set param 31 value 0
[  105.770000] ath10k_pci 0000:00:00.0: wmi pdev set param 33 value 1
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [0/25] freq 5180 maxpow=
er 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [1/25] freq 5200 maxpow=
er 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [2/25] freq 5220 maxpow=
er 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [3/25] freq 5240 maxpow=
er 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [4/25] freq 5260 maxpow=
er 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [5/25] freq 5280 maxpow=
er 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [6/25] freq 5300 maxpow=
er 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [7/25] freq 5320 maxpow=
er 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [8/25] freq 5500 maxpow=
er 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [9/25] freq 5520 maxpow=
er 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [10/25] freq 5540 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [11/25] freq 5560 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [12/25] freq 5580 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [13/25] freq 5600 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [14/25] freq 5620 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [15/25] freq 5640 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [16/25] freq 5660 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [17/25] freq 5680 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [18/25] freq 5700 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [19/25] freq 5720 maxpo=
wer 46 regpower 46 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [20/25] freq 5745 maxpo=
wer 60 regpower 60 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [21/25] freq 5765 maxpo=
wer 60 regpower 60 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [22/25] freq 5785 maxpo=
wer 60 regpower 60 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [23/25] freq 5805 maxpo=
wer 60 regpower 60 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: mac channel [24/25] freq 5825 maxpo=
wer 60 regpower 60 antenna 0 mode 0
[  105.770000] ath10k_pci 0000:00:00.0: wmi pdev regdomain rd 3a rd2g 3a rd=
5g 3a ctl2g 10 ctl5g 10 dfs_region 1
[  105.770000] ath10k_pci 0000:00:00.0: mac create vdev 0 map ffff
[  105.770000] ath10k_pci 0000:00:00.0: mac vdev create 0 (add interface) t=
ype 1 subtype 0 bcnmode single-buf
[  105.770000] ath10k_pci 0000:00:00.0: WMI vdev create: id 0 type 1 subtyp=
e 0 macaddr 04:f0:21:1a:7b:3d
[  105.770000] ath10k_pci 0000:00:00.0: vdev param 0 not supported by firmw=
are
[  105.770000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 32 value 2
[  105.770000] ath10k_pci 0000:00:00.0: wmi peer create vdev_id 0 peer_addr=
 04:f0:21:1a:7b:3d
[  105.770000] ath10k_pci 0000:00:00.0: wmi pdev set param 13 value 320
[  105.770000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 38 value =
3747
[  105.770000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 39 value =
3895
[  105.770000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 40 value =
3900
[  105.770000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 1 value -1
[  105.770000] ath10k_pci 0000:00:00.0: mac txpower 0
[  105.770000] ath10k_pci 0000:00:00.0: wmi pdev set param 3 value 0
[  105.770000] ath10k_pci 0000:00:00.0: wmi pdev set param 4 value 0
[  105.770000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[  105.770000] ath10k_pci 0000:00:00.0: mac vdev 0 cts_prot 0
[  105.770000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 43 value =
17
[  105.770000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 24 value 0
[  105.780000] ath10k_pci 0000:00:00.0: mac vdev 0 slot_time 1
[  105.780000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 7 value 1
[  105.780000] ath10k_pci 0000:00:00.0: mac vdev 0 preamble 1n
[  105.780000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 8 value 1
[  105.780000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[  105.780000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[  105.780000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[  105.780000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[  105.780000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[  105.790000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[  105.790000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[  105.800000] ath10k_pci 0000:00:00.0: wmi 10x start scan
[  105.800000] ath10k_pci 0000:00:00.0: scan event started type 1 reason 3 =
freq 0 req_id 40961 scan_id 40960 vdev_id 0 state starting (1)
[  105.800000] ath10k_pci 0000:00:00.0: scan event bss channel type 4 reaso=
n 3 freq 0 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
[  105.800000] ath10k_pci 0000:00:00.0: scan event foreign channel type 8 r=
eason 3 freq 5745 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
[  105.800000] ath10k_pci 0000:00:00.0: chan info err_code 0 freq 5745 cmd_=
flags 0 noise_floor 0 rx_clear_count 1601308 cycle_count 4784683
[  105.950000] ath10k_pci 0000:00:00.0: scan event bss channel type 4 reaso=
n 3 freq 5745 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
[  105.950000] ath10k_pci 0000:00:00.0: chan info err_code 0 freq 5745 cmd_=
flags 1 noise_floor -106 rx_clear_count 1879424 cycle_count 17635268
[  105.950000] ath10k_pci 0000:00:00.0: scan event foreign channel type 8 r=
eason 3 freq 5765 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
[  105.950000] ath10k_pci 0000:00:00.0: chan info err_code 0 freq 5765 cmd_=
flags 0 noise_floor 0 rx_clear_count 1943346 cycle_count 17988467
[  106.100000] ath10k_pci 0000:00:00.0: scan event bss channel type 4 reaso=
n 3 freq 5765 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
[  106.100000] ath10k_pci 0000:00:00.0: chan info err_code 0 freq 5765 cmd_=
flags 1 noise_floor -106 rx_clear_count 2944042 cycle_count 30838964
[  106.100000] ath10k_pci 0000:00:00.0: scan event completed type 2 reason =
0 freq 5765 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
[  106.100000] ath10k_pci 0000:00:00.0: mac chanctx add freq 5765 width 3 p=
tr 8677ea30
[  106.100000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[  106.100000] ath10k_pci 0000:00:00.0: mac chanctx assign ptr 8677ea30 vde=
v_id 0
[  106.100000] ath10k_pci 0000:00:00.0: mac vdev 0 start center_freq 5765 p=
hymode 11ac-vht80
[  106.100000] ath10k_pci 0000:00:00.0: wmi vdev start id 0x0 flags: 0x0, f=
req 5765, mode 10, ch_flags: 0xA000000, max_power: 60
[  106.110000] ath10k_pci 0000:00:00.0: WMI_VDEV_START_RESP_EVENTID
[  106.110000] ath10k_pci 0000:00:00.0: mac vdev_id 0 txpower 30
[  106.110000] ath10k_pci 0000:00:00.0: mac txpower 30
[  106.110000] ath10k_pci 0000:00:00.0: wmi pdev set param 3 value 60
[  106.110000] ath10k_pci 0000:00:00.0: wmi pdev set param 4 value 60
[  106.110000] ath10k_pci 0000:00:00.0: mac chanctx change freq 5765 width =
3 ptr 8677ea30 changed 2
[  106.110000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 3 value 1=
00
[  106.110000] ath10k_pci 0000:00:00.0: mac vdev 0 beacon_interval 100
[  106.110000] ath10k_pci 0000:00:00.0: vdev 0 set beacon tx mode to stagge=
red
[  106.110000] ath10k_pci 0000:00:00.0: wmi pdev set param 7 value 0
[  106.110000] ath10k_pci 0000:00:00.0: mac vdev 0 dtim_period 2
[  106.110000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 13 value 2
[  106.110000] ath10k_pci 0000:00:00.0: wmi mgmt vdev up id 0x0 assoc id 0 =
bssid 04:f0:21:1a:7b:3d
[  106.110000] ath10k_pci 0000:00:00.0: mac vdev 0 up
[  106.110000] ath10k_pci 0000:00:00.0: mac vdev_id 0 txpower 30
[  106.110000] ath10k_pci 0000:00:00.0: mac txpower 30
[  106.110000] ath10k_pci 0000:00:00.0: WMI_TBTTOFFSET_UPDATE_EVENTID
[  106.110000] ath10k_pci 0000:00:00.0: wmi pdev set param 3 value 60
[  106.110000] ath10k_pci 0000:00:00.0: wmi pdev set param 4 value 60
[  106.130000] ath10k_pci 0000:00:00.0: mac vdev 0 cts_prot 0
[  106.130000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 43 value =
17
[  106.130000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 24 value 0
[  106.130000] ath10k_pci 0000:00:00.0: mac vdev 0 slot_time 2
[  106.130000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 7 value 2
[  106.130000] ath10k_pci 0000:00:00.0: mac vdev 0 preamble 2n
[  106.130000] ath10k_pci 0000:00:00.0: wmi vdev id 0x0 set param 8 value 2
[  106.130000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[  106.130000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[  106.130000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[  106.130000] ath10k_pci 0000:00:00.0: wmi pdev set wmm params
[  106.140000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[  106.200000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[  106.730000] ath10k_pci 0000:00:00.0: wmi event debug mesg len 164
[  107.750000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[  107.750000] ath10k_pci 0000:00:00.0: wmi mgmt vdev down id 0x0
[  107.750000] ath10k_pci 0000:00:00.0: mac chanctx unassign ptr 8677ea30 v=
dev_id 0
[  107.750000] ath10k_pci 0000:00:00.0: wmi vdev stop id 0x0
[  107.820000] ath10k_pci 0000:00:00.0: firmware crashed! (uuid 5a1c3c4f-ac=
e2-4ea8-893d-63ecf3c02c4b)
[  107.830000] ath10k_pci 0000:00:00.0: qca988x hw2.0 target 0x4100016c chi=
p_id 0x043222ff sub 0000:0000
[  107.840000] ath10k_pci 0000:00:00.0: kconfig debug 1 debugfs 1 tracing 0=
 dfs 1 testmode 1
[  107.850000] ath10k_pci 0000:00:00.0: firmware ver 65.14.0.0 api 3 featur=
es  crc32 11ebb35d
[  107.860000] ath10k_pci 0000:00:00.0: board_file api 1 bmi_id N/A crc32 b=
ebc7c08
[  107.870000] ath10k_pci 0000:00:00.0: htt-ver 2.1 wmi-op 3 htt-op 2 cal o=
tp max-sta 128 raw 0 hwcrypto 1
[  107.880000] ath10k_pci 0000:00:00.0: firmware register dump:
[  107.890000] ath10k_pci 0000:00:00.0: [00]: 0x4100016C 0x00000000 0x00414=
C64 0x00414C64
[  107.890000] ath10k_pci 0000:00:00.0: [04]: 0x00414C64 0x00060530 0x00000=
01F 0x00000001
[  107.900000] ath10k_pci 0000:00:00.0: [08]: 0x0040AE04 0x00400000 0x00000=
007 0x00000000
[  107.910000] ath10k_pci 0000:00:00.0: [12]: 0x00000002 0x00000000 0x00957=
F04 0x00957F12
[  107.920000] ath10k_pci 0000:00:00.0: [16]: 0x809B02B0 0x0040AD94 0x0040A=
E04 0x00400000
[  107.930000] ath10k_pci 0000:00:00.0: [20]: 0x00000000 0x00000000 0x00000=
000 0x0040F6A0
[  107.930000] ath10k_pci 0000:00:00.0: [24]: 0x809AF9C0 0x0040ADC4 0x00000=
001 0x0040AE04
[  107.940000] ath10k_pci 0000:00:00.0: [28]: 0x0041397C 0x00000001 0x0040A=
E08 0x00000002
[  107.950000] ath10k_pci 0000:00:00.0: [32]: 0x00000007 0x00000000 0x00000=
000 0x00413964
[  107.960000] ath10k_pci 0000:00:00.0: [36]: 0x809BD4EF 0x0040ADE4 0x00411=
B0C 0x00411B30
[  107.970000] ath10k_pci 0000:00:00.0: [40]: 0x00000001 0x00000000 0x00955=
A00 0x0040F6B0
[  107.970000] ath10k_pci 0000:00:00.0: [44]: 0x809BCD0C 0x0040AE04 0x00000=
001 0x00000000
[  107.980000] ath10k_pci 0000:00:00.0: [48]: 0x0040AE04 0x00000001 0x00413=
964 0x00411D50
[  107.990000] ath10k_pci 0000:00:00.0: [52]: 0x809BCA78 0x0040AEA4 0x0041F=
294 0x0041216C
[  108.000000] ath10k_pci 0000:00:00.0: [56]: 0x00413964 0x0040AE34 0x00412=
4AC 0x004124AC
[  108.010000] ath10k_pci 0000:00:00.0: mac chanctx remove freq 5765 width =
3 ptr 8677ea30
[  108.010000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[  108.010000] ath10k_pci 0000:00:00.0: failed to flush transmit queue (ski=
p 1 ar-state 1): 500
[  108.020000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[  108.120000] ath10k_pci 0000:00:00.0: mac monitor recalc started? 0 neede=
d? 0 allowed? 1
[  108.120000] ath10k_pci 0000:00:00.0: wmi peer delete vdev_id 0 peer_addr=
 04:f0:21:1a:7b:3d
[  108.120000] ath10k_pci 0000:00:00.0: failed to submit AP/IBSS self-peer =
removal on vdev 0: -143
[  108.130000] ath10k_pci 0000:00:00.0: mac vdev 0 delete (remove interface)
[  108.130000] ath10k_pci 0000:00:00.0: WMI vdev delete id 0
[  108.130000] ath10k_pci 0000:00:00.0: failed to delete WMI vdev 0: -143
[  108.140000] ath10k_pci 0000:00:00.0: removing stale peer 04:f0:21:1a:7b:=
3d from vdev_id 0
[  108.150000] ath10k_pci 0000:00:00.0: wmi disable pktlog


From: adrian.chadd@gmail.com <adrian.chadd@gmail.com> on behalf of Adrian C=
hadd <adrian@freebsd.org>
Sent: Wednesday, January 25, 2017 4:15 PM
To: Kevin Dious
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k + OpenWRT + ath10k firmware 10.2.2.60.14 - Crash
=A0   =

Hi,

https://wireless.wiki.kernel.org/en/users/Drivers/ath10k/debug should help!


en:users:drivers:ath10k:debug [Linux Wireless]
wireless.wiki.kernel.org
ath10k contains various debug log levels (check drivers/net/wireless/ath/at=
h10k/debug.h for up-to-date list): enum ath10k_debug_mask { ATH10K_DBG_PCI =
...




-adrian


On 25 January 2017 at 16:10, Kevin Dious <Kevin.Dious@ubiqomm.com> wrote:
> Adrian,
>
>
>
>
>
> Thanks for the prompt reply.
>
> How exactly do I enable WMI/MAC debugging?=A0 I am a little new to this w=
ith ath10k.=A0 Is this the correct way to do it (use the -d flag when runni=
ng the firmware encoder script)?=A0 Just want to be sure.
>
> kevin@kevin-XPS-8700:~/compex_board_build/qca-swiss-army-knife/tools/scri=
pts/ath10k$ python ath10k-fwencoder -c --otp otp.bin --firmware athwlan.bin=
 --set-fw-api 3 --set-wmi-op-version 10.2 --set-htt-op-version unset -d
> DEBUG: adding id 1 len(value) 4padding_len 0
> DEBUG: adding id 4 len(value) 6869padding_len 3
> DEBUG: adding id 3 len(value) 224758padding_len 2
> DEBUG: adding id 5 len(value) 4padding_len 0
> firmware-3.bin created: 231684 B
> kevin@kevin-XPS-8700:~/compex_board_build/qca-swiss-army-knife/tools/scri=
pts/ath10k$
>
>
> Thank you.
>
> Kevin
>
> From: adrian.chadd@gmail.com <adrian.chadd@gmail.com> on behalf of Adrian=
 Chadd <adrian@freebsd.org>
> Sent: Wednesday, January 25, 2017 4:05:05 PM
> To: Kevin Dious
> Cc: ath10k@lists.infradead.org
> Subject: Re: ath10k + OpenWRT + ath10k firmware 10.2.2.60.14 - Crash
>
> Hiya,
>
> Can you enable WMI/MAC debugging when you load it up? Knowing which
> command(s) it's sent before it does would be helpful.
>
> It'd also be useful to know if it's something silly, like it thinking
> it's a 2G device when QCA9888 is definitely 5G...
>
>
> -a
>
    =

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
