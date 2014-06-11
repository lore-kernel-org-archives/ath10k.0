Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.sablalik.us ([66.80.92.144])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WurhJ-0005em-Ve
 for ath10k@lists.infradead.org; Wed, 11 Jun 2014 23:12:51 +0000
Date: Wed, 11 Jun 2014 19:12:09 -0400
Subject: basic help request
From: Peter Sabat <pete@sablalik.us>
Message-ID: <CFBE5A89.B257D%pete@sablalik.us>
Mime-version: 1.0
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
To: ath10k@lists.infradead.org

Hoping that I can possibly get a pointer on what I=B9m doing wrong w/ ath10k
and hostapd.

I=B9m running a 3.14 kernel and installed the 3.15-rc-1 backports. I can
start hostapd, but no matter what I do, I can=B9t see the SSID. I have also
just tried to use N by itself.

I am using a WLE900V5-23 card.

The things that I=B9ve noticed so far is that I am unable to use the v2
firmware =AD additionally, even w/ the v1 firmware, I get a:

ath10k: Invalid firmware magic


Also, iw doesn=B9t seem to report everything :

iw wlan0 info:

Interface wlan0
	ifindex 3
	type AP
	wiphy 0







Here is some dmesg:

[Wed Jun 11 18:23:19 2014] ath10k_pci 0000:03:00.0: BAR 0: assigned [mem
0x90400000-0x905fffff 64bit]
[Wed Jun 11 18:23:19 2014] ath10k_pci 0000:03:00.0: enabling device (0000
-> 0002)
[Wed Jun 11 18:23:19 2014] ath10k_pci 0000:03:00.0: irq 116 for MSI/MSI-X
[Wed Jun 11 18:23:19 2014] ath10k: pci irq MSI
[Wed Jun 11 18:23:19 2014] ath10k: Invalid firmware magic
[Wed Jun 11 18:23:21 2014] ath10k: qca988x hw2.0 (0x4100016c) fw 1.0.0.636
api 1 htt 2.1
[Wed Jun 11 18:23:21 2014] ath: EEPROM regdomain: 0x0
[Wed Jun 11 18:23:21 2014] ath: EEPROM indicates default country code
should be used
[Wed Jun 11 18:23:21 2014] ath: doing EEPROM country->regdmn map search
[Wed Jun 11 18:23:21 2014] ath: country maps to regdmn code: 0x3a
[Wed Jun 11 18:23:21 2014] ath: Country alpha2 being used: US
[Wed Jun 11 18:23:21 2014] ath: Regpair used: 0x3a

[Wed Jun 11 18:57:43 2014] ath10k_pci 0000:03:00.0: irq 116 for MSI/MSI-X



LSPCI


03:00.0 Network controller: Qualcomm Atheros QCA988x 802.11ac Wireless
Network Adapter
	Flags: bus master, fast devsel, latency 0, IRQ 116
	Memory at 90400000 (64-bit, non-prefetchable) [size=3D2M]
	Expansion ROM at 90600000 [disabled] [size=3D64K]
	Capabilities: [40] Power Management version 2
	Capabilities: [50] MSI: Enable+ Count=3D1/8 Maskable+ 64bit-
	Capabilities: [70] Express Endpoint, MSI 00
	Capabilities: [100] Advanced Error Reporting
	Capabilities: [140] Virtual Channel
	Capabilities: [160] Device Serial Number 00-00-00-00-00-00-00-00

	Kernel driver in use: ath10k_pci


modinfo :


filename:       =

/lib/modules/3.14.4-scst/updates/drivers/net/wireless/ath/ath10k/ath10k_pci
.ko
firmware:       ath10k/QCA988X/hw2.0/board.bin
firmware:       ath10k/QCA988X/hw2.0/otp.bin
firmware:       ath10k/QCA988X/hw2.0/firmware.bin
license:        Dual BSD/GPL
description:    Driver support for Atheros QCA988X PCIe devices
author:         Qualcomm Atheros
version:        backported from Linux (v3.15-rc1-0-gc9eaa44) using
backports v3.15-rc1-1-0-g2a25483
srcversion:     2F02C56BB696ECC1D986D19
alias:          pci:v0000168Cd0000003Csv*sd*bc*sc*i*
depends:        ath10k_core,compat
vermagic:       3.14.4-scst SMP mod_unload modversions
parm:           ath10k_target_ps:Enable ath10k Target (SoC) PS option
(uint)

parm:           irq_mode:0: auto, 1: legacy, 2: msi (default: 0) (uint)




Iw list:
Wiphy phy0
	Band 1:
		Capabilities: 0x19e3
			RX LDPC
			HT20/HT40
			Static SM Power Save
			RX HT20 SGI
			RX HT40 SGI
			TX STBC
			RX STBC 1-stream
			Max AMSDU length: 7935 bytes
			DSSS/CCK HT40
		Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
		Minimum RX AMPDU time spacing: 8 usec (0x06)
		HT TX/RX MCS rate indexes supported: 0-23
		Frequencies:
			* 5180 MHz [36] (17.0 dBm)
			* 5200 MHz [40] (17.0 dBm)
			* 5220 MHz [44] (17.0 dBm)
			* 5240 MHz [48] (17.0 dBm)
			* 5260 MHz [52] (23.0 dBm) (passive scanning, no IBSS, radar detection)
			* 5280 MHz [56] (23.0 dBm) (passive scanning, no IBSS, radar detection)
			* 5300 MHz [60] (23.0 dBm) (passive scanning, no IBSS, radar detection)
			* 5320 MHz [64] (23.0 dBm) (passive scanning, no IBSS, radar detection)
			* 5500 MHz [100] (disabled)
			* 5520 MHz [104] (disabled)
			* 5540 MHz [108] (disabled)
			* 5560 MHz [112] (disabled)
			* 5580 MHz [116] (disabled)
			* 5600 MHz [120] (disabled)
			* 5620 MHz [124] (disabled)
			* 5640 MHz [128] (disabled)
			* 5660 MHz [132] (disabled)
			* 5680 MHz [136] (disabled)
			* 5700 MHz [140] (disabled)
			* 5745 MHz [149] (30.0 dBm)
			* 5765 MHz [153] (30.0 dBm)
			* 5785 MHz [157] (30.0 dBm)
			* 5805 MHz [161] (30.0 dBm)
			* 5825 MHz [165] (30.0 dBm)
		Bitrates (non-HT):
			* 6.0 Mbps
			* 9.0 Mbps
			* 12.0 Mbps
			* 18.0 Mbps
			* 24.0 Mbps
			* 36.0 Mbps
			* 48.0 Mbps
			* 54.0 Mbps
	max # scan SSIDs: 16
	max scan IEs length: 199 bytes
	Coverage class: 0 (up to 0m)
	Supported Ciphers:
		* WEP40 (00-0f-ac:1)
		* WEP104 (00-0f-ac:5)
		* TKIP (00-0f-ac:2)
		* CCMP (00-0f-ac:4)
		* CMAC (00-0f-ac:6)
	Available Antennas: TX 0 RX 0
	Supported interface modes:
		 * IBSS
		 * managed
		 * AP
		 * AP/VLAN
		 * monitor
		 * P2P-client
		 * P2P-GO
	software interface modes (can always be added):
		 * AP/VLAN
		 * monitor
	valid interface combinations:
		 * #{ managed, P2P-client } <=3D 8, #{ P2P-GO } <=3D 3, #{ AP } <=3D 7,
		   total <=3D 8, #channels <=3D 1, STA/AP BI must match
	Supported commands:
		 * new_interface
		 * set_interface
		 * new_key
		 * new_beacon
		 * new_station
		 * new_mpath
		 * set_mesh_params
		 * set_bss
		 * authenticate
		 * associate
		 * deauthenticate
		 * disassociate
		 * join_ibss
		 * join_mesh
		 * remain_on_channel
		 * set_tx_bitrate_mask
		 * action
		 * frame_wait_cancel
		 * set_wiphy_netns
		 * set_channel
		 * set_wds_peer
		 * Unknown command (84)
		 * Unknown command (87)
		 * Unknown command (85)
		 * Unknown command (89)
		 * Unknown command (92)
		 * Unknown command (104)
		 * connect
		 * disconnect
	Supported TX frame types:
		 * IBSS: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 0xb0
0xc0 0xd0 0xe0 0xf0
		 * managed: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 0xb0
0xc0 0xd0 0xe0 0xf0
		 * AP: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 0xb0 0xc0
0xd0 0xe0 0xf0
		 * AP/VLAN: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 0xb0
0xc0 0xd0 0xe0 0xf0
		 * mesh point: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0
0xb0 0xc0 0xd0 0xe0 0xf0
		 * P2P-client: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0
0xb0 0xc0 0xd0 0xe0 0xf0
		 * P2P-GO: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 0xb0
0xc0 0xd0 0xe0 0xf0
		 * Unknown mode (10): 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90
0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
	Supported RX frame types:
		 * IBSS: 0x40 0xb0 0xc0 0xd0
		 * managed: 0x40 0xd0
		 * AP: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
		 * AP/VLAN: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
		 * mesh point: 0xb0 0xc0 0xd0
		 * P2P-client: 0x40 0xd0
		 * P2P-GO: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
		 * Unknown mode (10): 0x40 0xd0
	Device supports AP-side u-APSD.
	HT Capability overrides:
		 * MCS: ff ff ff ff ff ff ff ff ff ff
		 * maximum A-MSDU length
		 * supported channel width
		 * short GI for 40 MHz
		 * max A-MPDU length exponent
		 * min MPDU start spacing
	Device supports TX status socket option.
	Device supports HT-IBSS.






Any help would be greatly appreciated.

Pete





_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
