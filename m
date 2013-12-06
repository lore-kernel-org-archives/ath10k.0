Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp4.dhosting.pl ([195.88.50.41])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoyLz-0002J8-Ul
 for ath10k@lists.infradead.org; Fri, 06 Dec 2013 16:34:13 +0000
Received: from [10.0.8.60] (89-76-223-119.dynamic.chello.pl [89.76.223.119])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: tt@elnovel.com)
 by smtp.dpoczta.pl (smtp.dpoczta.pl) with ESMTPSA id 395B4EB141
 for <ath10k@lists.infradead.org>; Fri,  6 Dec 2013 17:33:47 +0100 (CET)
Message-ID: <52A1FC69.7080901@elnovel.com>
Date: Fri, 06 Dec 2013 17:33:45 +0100
From: Tomasz Tajmajer <tt@elnovel.com>
MIME-Version: 1.0
Subject: [BUG] QWLE900V5-18 - cannot achievie 3 spatial streams link
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
To: ath10k@lists.infradead.org

Hi,

Recently, I've been making quite a lot of tests with two QWLE900V5-18 
cards. I had some issues with the drivers (e.g. regarding the regulatory 
domain), but I've managed to fix them on my own. However, there is one 
issue that I cannot deal with.
I'm trying to get the highest throughput possible using 3x3 MIMO. The 
problem is that the wifi card does not set higher rates than 2x433.3Mbps 
(MCS 9, VHT-NSS 2). The specification says that it should be possible to 
have 3 spatial streams.
First, I thought it is a problem with some options of hostapd, but 
hostapd even does not allows me to set the [RX-STBC-12] or [RX-STBC-123] 
options. Only [RX-STBC-1] may be set in the configuration (what in fact, 
does not disallows the 2x433.3Mbps link, which is another issue).
Driver info shows that the driver should support 3 spatial streams.
I am not sure where is the problem, is it some bug in hostapd, which 
forces the card to use 2 spatial streams only or is it the driver, which 
does not enable 3 streams when it is possible. The physical connectivity 
(antennas etc.) is not the problem AFAIK.


The ath10k driver used for AP is a bit hacked to always report the US 
regd code

Some dumps for you:

iw version 3.13

iw phy phy0 info
Wiphy phy0
max # scan SSIDs: 16
max scan IEs length: 199 bytes
Coverage class: 0 (up to 0m)
Device supports AP-side u-APSD.
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
Band 2:
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
VHT Capabilities (0x338001b2):
Max MPDU length: 11454
Supported Channel Width: neither 160 nor 80+80
RX LDPC
short GI (80 MHz)
TX STBC
RX antenna pattern consistency
VHT RX MCS set:
1 streams: MCS 0-9
2 streams: MCS 0-9
3 streams: MCS 0-9
4 streams: not supported
5 streams: not supported
6 streams: not supported
7 streams: not supported
8 streams: not supported
VHT RX highest supported: 0 Mbps
VHT TX MCS set:
1 streams: MCS 0-9
2 streams: MCS 0-9
3 streams: MCS 0-9
4 streams: not supported
5 streams: not supported
6 streams: not supported
7 streams: not supported
8 streams: not supported
VHT TX highest supported: 0 Mbps
Bitrates (non-HT):
* 6.0 Mbps
* 9.0 Mbps
* 12.0 Mbps
* 18.0 Mbps
* 24.0 Mbps
* 36.0 Mbps
* 48.0 Mbps
* 54.0 Mbps
Frequencies:
* 5180 MHz [36] (20.0 dBm)
* 5200 MHz [40] (20.0 dBm) (no IR)
* 5220 MHz [44] (20.0 dBm)
* 5240 MHz [48] (20.0 dBm) (no IR)
* 5260 MHz [52] (20.0 dBm) (no IR, radar detection)
   DFS state: usable (for 110543 sec)
* 5280 MHz [56] (20.0 dBm) (no IR, radar detection)
   DFS state: usable (for 110543 sec)
* 5300 MHz [60] (20.0 dBm) (no IR, radar detection)
   DFS state: usable (for 110543 sec)
* 5320 MHz [64] (20.0 dBm) (no IR, radar detection)
   DFS state: usable (for 110543 sec)
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
* 5745 MHz [149] (disabled)
* 5765 MHz [153] (disabled)
* 5785 MHz [157] (disabled)
* 5805 MHz [161] (disabled)
* 5825 MHz [165] (disabled)
Supported commands:
  * new_interface
  * set_interface
  * new_key
  * start_ap
  * new_station
  * new_mpath
  * set_mesh_config
  * set_bss
  * authenticate
  * associate
  * deauthenticate
  * disassociate
  * join_ibss
  * join_mesh
  * remain_on_channel
  * set_tx_bitrate_mask
  * frame
  * frame_wait_cancel
  * set_wiphy_netns
  * set_channel
  * set_wds_peer
  * probe_client
  * set_noack_map
  * register_beacons
  * start_p2p_device
  * set_mcast_rate
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
  * P2P-device: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 
0xb0 0xc0 0xd0 0xe0 0xf0
Supported RX frame types:
  * IBSS: 0x40 0xb0 0xc0 0xd0
  * managed: 0x40 0xd0
  * AP: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
  * AP/VLAN: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
  * mesh point: 0xb0 0xc0 0xd0
  * P2P-client: 0x40 0xd0
  * P2P-GO: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
  * P2P-device: 0x40 0xd0
software interface modes (can always be added):
  * AP/VLAN
  * monitor
valid interface combinations:
  * #{ managed, P2P-client } <= 8, #{ P2P-GO } <= 3, #{ AP } <= 7,
    total <= 8, #channels <= 1, STA/AP BI must match
HT Capability overrides:
  * MCS: ff ff ff ff ff ff ff ff ff ff
  * maximum A-MSDU length
  * supported channel width
  * short GI for 40 MHz
  * max A-MPDU length exponent
  * min MPDU start spacing
Device supports TX status socket option.
Device supports HT-IBSS.
Device supports scan flush.


hostapd --version
hostapd v2.1-devel


dmesg (AP)
[ 4808.976236 <tel:%5B%204808.976236>] Loading modules backported from 
Linux version next-20131129-0-gae5be52
[ 4808.976243 <tel:%5B%204808.976243>] Backport generated by 
backports.git backports-20131129-0-g8a36e16
[ 4808.982669 <tel:%5B%204808.982669>] cfg80211: Calling CRDA to update 
world regulatory domain
[ 4810.814727] ath10k_pci 0000:06:00.0: BAR 0: assigned [mem 
0xf7200000-0xf73fffff 64bit]
[ 4810.819406] ath10k: MSI-X didn't succeed (1), trying MSI
[ 4810.819480] ath10k_pci 0000:06:00.0: irq 49 for MSI/MSI-X
[ 4810.819513] ath10k: MSI interrupt handling
[ 4810.861220] ath10k: Hardware name qca988x hw2.0 version 0x4100016c
[ 4811.749751] ath10k: UART prints disabled
[ 4811.756642] ath10k: firmware 10.1.389 booted
[ 4811.766282] ath10k: htt target version 2.1
[ 4811.767324] ath: EEPROM regdomain: 0x60
[ 4811.767328] ath: EEPROM indicates we should expect a direct regpair map
[ 4811.767333] ath: Country alpha2 being used: h7
[ 4811.767336] ath: Regpair used: 0x60
[ 4811.782155] IPv6: ADDRCONF(NETDEV_UP): wlan2: link is not ready


dmesg (STA)
[110825.598266] Loading modules backported from Linux version 
next-20131129-0-gae5be52
[110825.598271] Backport generated by backports.git 
backports-20131129-0-g8a36e16
[110825.603361] cfg80211: Calling CRDA to update world regulatory domain
[110827.515449] ath10k_pci 0000:0c:00.0: BAR 0: assigned [mem 
0xece00000-0xecffffff 64bit]
[110827.515883] ath10k: MSI-X didn't succeed (1), trying MSI
[110827.516037] ath10k_pci 0000:0c:00.0: irq 47 for MSI/MSI-X
[110827.516114] ath10k: MSI interrupt handling
[110827.561579] ath10k: Hardware name qca988x hw2.0 version 0x4100016c
[110828.778794] ath10k: UART prints disabled
[110828.785405] ath10k: firmware 999.999.0.636 booted
[110828.795890] ath10k: htt target version 2.1
[110828.797409] ath: EEPROM regdomain: 0x0
[110828.797413] ath: EEPROM indicates default country code should be used
[110828.797417] ath: doing EEPROM country->regdmn map search
[110828.797422] ath: country maps to regdmn code: 0x3a
[110828.797426] ath: Country alpha2 being

BR,

-- 
Tomasz Tajmajer,
Embedded Systems Engineer,
Elnovel Sp. z o.o. [Ltd.] (elnovel.com)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
