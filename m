Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot0-x233.google.com ([2607:f8b0:4003:c0f::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1crO6R-0004QF-HJ
 for ath10k@lists.infradead.org; Fri, 24 Mar 2017 12:14:04 +0000
Received: by mail-ot0-x233.google.com with SMTP id a12so366745ota.0
 for <ath10k@lists.infradead.org>; Fri, 24 Mar 2017 05:13:38 -0700 (PDT)
MIME-Version: 1.0
From: Chris Price <chris.price@dejero.com>
Date: Fri, 24 Mar 2017 08:13:36 -0400
Message-ID: <CALJ2kaGBUyjtDDNQj-rLDK-J--ObZ+e5P_KVkaZfa4UtYUUMdQ@mail.gmail.com>
Subject: QCA6174 ACS failure on first attempt
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
To: ath10k@lists.infradead.org

I mentioned this in another thread, but I now have better information
and thought it appropriate to create a thread just for this issue.

My kernel is as follows.
# uname -r
4.11.0-rc3-wt-ath+

I've built this directly from the sources at hash 4af3c7bf12da and
upgraded a vanilla Debian stretch RC2 install. Note that I've tried
several kernels and this problem seems to be present in all of them.

My card presents as follows.
# lspci -v
02:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless
Network Adapter (rev 32)
Subsystem: AzureWave QCA6174 802.11ac Wireless Network Adapter
Flags: bus master, fast devsel, latency 0, IRQ 132
Memory at df000000 (64-bit, non-prefetchable) [size=2M]
Capabilities: [40] Power Management version 3
Capabilities: [50] MSI: Enable+ Count=1/8 Maskable+ 64bit-
Capabilities: [70] Express Endpoint, MSI 00
Capabilities: [100] Advanced Error Reporting
Capabilities: [148] Virtual Channel
Capabilities: [168] Device Serial Number 00-00-00-00-00-00-00-00
Capabilities: [178] Latency Tolerance Reporting
Capabilities: [180] L1 PM Substates
Kernel driver in use: ath10k_pci
Kernel modules: ath10k_pci

My hostapd version and config file are as follows.
# hostapd -v
hostapd v2.4
User space daemon for IEEE 802.11 AP management,
IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator
Copyright (c) 2002-2015, Jouni Malinen <j@w1.fi> and contributors
# cat /etc/hostapd/hostapd1.conf
interface=wlp2s0
driver=nl80211
hw_mode=a
channel=0
ieee80211d=1
country_code=CA
ieee80211ac=1
ssid=test5
auth_algs=1
wpa=2
wpa_key_mgmt=WPA-PSK
rsn_pairwise=CCMP
wpa_passphrase=testtest

When trying to host an 5GHz AP using ACS, the first attempt after
inserting the drivers into the kernel always fails. See the verbose
logs below.
# hostapd -dd /etc/hostapd/hostapd1.conf
random: Trying to read entropy from /dev/random
Configuration file: /etc/hostapd/hostapd1.conf
rfkill: initial event: idx=0 type=2 op=0 soft=0 hard=0
rfkill: initial event: idx=5 type=1 op=0 soft=0 hard=0
nl80211: TDLS supported
nl80211: TDLS external setup
nl80211: Supported cipher 00-0f-ac:1
nl80211: Supported cipher 00-0f-ac:5
nl80211: Supported cipher 00-0f-ac:2
nl80211: Supported cipher 00-0f-ac:4
nl80211: Supported cipher 00-0f-ac:6
nl80211: Supports Probe Response offload in AP mode
nl80211: Using driver-based off-channel TX
nl80211: Use separate P2P group interface (driver advertised support)
nl80211: Enable multi-channel concurrent (driver advertised support)
nl80211: use P2P_DEVICE support
nl80211: interface wlp2s0 in phy phy0
nl80211: Set mode ifindex 8 iftype 3 (AP)
nl80211: Setup AP(wlp2s0) - device_ap_sme=0 use_monitor=0
nl80211: Subscribe to mgmt frames with AP handle 0x55d2a118d100
nl80211: Register frame type=0xb0 (WLAN_FC_STYPE_AUTH)
nl_handle=0x55d2a118d100 match=
nl80211: Register frame type=0x0 (WLAN_FC_STYPE_ASSOC_REQ)
nl_handle=0x55d2a118d100 match=
nl80211: Register frame type=0x20 (WLAN_FC_STYPE_REASSOC_REQ)
nl_handle=0x55d2a118d100 match=
nl80211: Register frame type=0xa0 (WLAN_FC_STYPE_DISASSOC)
nl_handle=0x55d2a118d100 match=
nl80211: Register frame type=0xc0 (WLAN_FC_STYPE_DEAUTH)
nl_handle=0x55d2a118d100 match=
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION)
nl_handle=0x55d2a118d100 match=
nl80211: Register frame type=0x40 (WLAN_FC_STYPE_PROBE_REQ)
nl_handle=0x55d2a118d100 match=
nl80211: Add own interface ifindex 8
nl80211: if_indices[16]: 8
phy: phy0
BSS count 1, BSSID mask 00:00:00:00:00:00 (0 bits)
wlp2s0: interface state UNINITIALIZED->COUNTRY_UPDATE
Previous country code 00, new country code CA
Continue interface setup after channel list update
ctrl_iface not configured!
random: Got 20/20 bytes from /dev/random
RTM_NEWLINK: ifi_index=8 ifname=wlp2s0 operstate=0 linkmode=0
ifi_family=0 ifi_flags=0x1043 ([UP][RUNNING])
RTM_NEWLINK: ifi_index=8 ifname=wlp2s0 operstate=2 linkmode=0
ifi_family=0 ifi_flags=0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 36 (NL80211_CMD_REG_CHANGE) received for wlp2s0
nl80211: Regulatory domain change
 * initiator=1
 * type=0
 * alpha2=CA
wlp2s0: Event CHANNEL_LIST_CHANGED (28) received
Channel list updated - continue setup
nl80211: Regulatory information - country=CA (DFS-FCC)
nl80211: 2402-2472 @ 40 MHz 30 mBm
nl80211: 5170-5250 @ 80 MHz 17 mBm
nl80211: 5250-5330 @ 80 MHz 24 mBm (DFS)
nl80211: 5490-5600 @ 80 MHz 24 mBm (DFS)
nl80211: 5650-5730 @ 80 MHz 24 mBm (DFS)
nl80211: 5735-5835 @ 80 MHz 30 mBm
nl80211: Added 802.11b mode based on 802.11g information
Allowed channel: mode=1 chan=1 freq=2412 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=2 freq=2417 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=3 freq=2422 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=4 freq=2427 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=5 freq=2432 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=6 freq=2437 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=7 freq=2442 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=8 freq=2447 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=9 freq=2452 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=10 freq=2457 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=11 freq=2462 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=1 freq=2412 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=2 freq=2417 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=3 freq=2422 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=4 freq=2427 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=5 freq=2432 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=6 freq=2437 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=7 freq=2442 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=8 freq=2447 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=9 freq=2452 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=10 freq=2457 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=11 freq=2462 MHz max_tx_power=30 dBm
ACS: Automatic channel selection started, this may take a bit
ACS: Scanning 1 / 5
wlp2s0: nl80211: scan request
Scan requested (ret=0) - scan timeout 10 seconds
wlp2s0: interface state COUNTRY_UPDATE->ACS
wlp2s0: ACS-STARTED
Interface initialization will be completed in a callback (ACS)
nl80211: Event message available
nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for wlp2s0
wlp2s0: nl80211: Scan trigger
wlp2s0: Event SCAN_STARTED (47) received
Unknown event 47
nl80211: Event message available
nl80211: Drv Event 42 (NL80211_CMD_REG_BEACON_HINT) received for wlp2s0
nl80211: Regulatory beacon hint
wlp2s0: Event CHANNEL_LIST_CHANGED (28) received
nl80211: Event message available
nl80211: Drv Event 42 (NL80211_CMD_REG_BEACON_HINT) received for wlp2s0
nl80211: Regulatory beacon hint
wlp2s0: Event CHANNEL_LIST_CHANGED (28) received
nl80211: Event message available
nl80211: Drv Event 42 (NL80211_CMD_REG_BEACON_HINT) received for wlp2s0
nl80211: Regulatory beacon hint
wlp2s0: Event CHANNEL_LIST_CHANGED (28) received
nl80211: Event message available
nl80211: Drv Event 42 (NL80211_CMD_REG_BEACON_HINT) received for wlp2s0
nl80211: Regulatory beacon hint
wlp2s0: Event CHANNEL_LIST_CHANGED (28) received
nl80211: Event message available
nl80211: Drv Event 42 (NL80211_CMD_REG_BEACON_HINT) received for wlp2s0
nl80211: Regulatory beacon hint
wlp2s0: Event CHANNEL_LIST_CHANGED (28) received
nl80211: Event message available
nl80211: Drv Event 42 (NL80211_CMD_REG_BEACON_HINT) received for wlp2s0
nl80211: Regulatory beacon hint
wlp2s0: Event CHANNEL_LIST_CHANGED (28) received
RTM_NEWLINK: ifi_index=8 ifname=wlp2s0 wext ifi_family=0 ifi_flags=0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for wlp2s0
wlp2s0: nl80211: New scan results available
nl80211: Scan included frequencies: 2412 2417 2422 2427 2432 2437 2442
2447 2452 2457 2462 5180 5200 5220 5240 5260 5280 5300 5320 5500 5520
5540 5560 5580 5660 5680 5700 5720 5745 5765 5785 5805 5825
wlp2s0: Event SCAN_RESULTS (3) received
ACS: Using survey based algorithm (acs_num_scans=5)
nl80211: Fetch survey data
nl80211: Freq survey dump event (freq=2412 MHz noise=-99
channel_time=150 busy_time=79 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2417 MHz noise=-100
channel_time=149 busy_time=71 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2422 MHz noise=-101
channel_time=149 busy_time=44 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2427 MHz noise=-101
channel_time=149 busy_time=26 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2432 MHz noise=-102
channel_time=149 busy_time=39 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2437 MHz noise=-104
channel_time=149 busy_time=78 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2442 MHz noise=-104
channel_time=149 busy_time=36 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2447 MHz noise=-105
channel_time=149 busy_time=21 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2452 MHz noise=-106
channel_time=149 busy_time=80 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2457 MHz noise=-105
channel_time=149 busy_time=26 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2462 MHz noise=-106
channel_time=149 busy_time=18 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5180 MHz noise=-99
channel_time=146 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5200 MHz noise=-43
channel_time=149 busy_time=89 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5220 MHz noise=-99
channel_time=149 busy_time=3 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5240 MHz noise=-99
channel_time=149 busy_time=4 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5260 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5280 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5300 MHz noise=-98
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5320 MHz noise=-99
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5500 MHz noise=-43
channel_time=149 busy_time=83 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5520 MHz noise=-97
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5540 MHz noise=-97
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5560 MHz noise=-96
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5580 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5660 MHz noise=-97
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5680 MHz noise=-97
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5700 MHz noise=-97
channel_time=149 busy_time=2 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5720 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5745 MHz noise=-97
channel_time=149 busy_time=18 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5765 MHz noise=-43
channel_time=149 busy_time=105 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5785 MHz noise=-95
channel_time=149 busy_time=38 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5805 MHz noise=-97
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5825 MHz noise=-96
channel_time=149 busy_time=2 tx_time=0 rx_time=0 filled=0007)
wlp2s0: Event SURVEY (46) received
ACS: Scanning 2 / 5
wlp2s0: nl80211: scan request
Scan requested (ret=0) - scan timeout 30 seconds
nl80211: Event message available
nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for wlp2s0
wlp2s0: nl80211: Scan trigger
wlp2s0: Event SCAN_STARTED (47) received
Unknown event 47
RTM_NEWLINK: ifi_index=8 ifname=wlp2s0 wext ifi_family=0 ifi_flags=0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for wlp2s0
wlp2s0: nl80211: New scan results available
nl80211: Scan included frequencies: 2412 2417 2422 2427 2432 2437 2442
2447 2452 2457 2462 5180 5200 5220 5240 5260 5280 5300 5320 5500 5520
5540 5560 5580 5660 5680 5700 5720 5745 5765 5785 5805 5825
wlp2s0: Event SCAN_RESULTS (3) received
ACS: Using survey based algorithm (acs_num_scans=5)
nl80211: Fetch survey data
nl80211: Freq survey dump event (freq=2412 MHz noise=-99
channel_time=149 busy_time=35 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2417 MHz noise=-100
channel_time=149 busy_time=24 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2422 MHz noise=-101
channel_time=149 busy_time=36 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2427 MHz noise=-102
channel_time=149 busy_time=23 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2432 MHz noise=-103
channel_time=149 busy_time=51 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2437 MHz noise=-104
channel_time=149 busy_time=99 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2442 MHz noise=-104
channel_time=149 busy_time=79 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2447 MHz noise=-105
channel_time=149 busy_time=111 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2452 MHz noise=-105
channel_time=149 busy_time=6 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2457 MHz noise=-106
channel_time=149 busy_time=41 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2462 MHz noise=-106
channel_time=149 busy_time=58 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5180 MHz noise=-99
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5200 MHz noise=-43
channel_time=149 busy_time=97 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5220 MHz noise=-99
channel_time=149 busy_time=14 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5240 MHz noise=-99
channel_time=149 busy_time=8 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5260 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5280 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5300 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5320 MHz noise=-98
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5500 MHz noise=-43
channel_time=149 busy_time=84 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5520 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5540 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5560 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5580 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5660 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5680 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5700 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5720 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5745 MHz noise=-97
channel_time=149 busy_time=29 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5765 MHz noise=-43
channel_time=149 busy_time=106 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5785 MHz noise=-95
channel_time=149 busy_time=13 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5805 MHz noise=-97
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5825 MHz noise=-96
channel_time=149 busy_time=5 tx_time=0 rx_time=0 filled=0007)
wlp2s0: Event SURVEY (46) received
ACS: Scanning 3 / 5
wlp2s0: nl80211: scan request
Scan requested (ret=0) - scan timeout 30 seconds
nl80211: Event message available
nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for wlp2s0
wlp2s0: nl80211: Scan trigger
wlp2s0: Event SCAN_STARTED (47) received
Unknown event 47
RTM_NEWLINK: ifi_index=8 ifname=wlp2s0 wext ifi_family=0 ifi_flags=0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for wlp2s0
wlp2s0: nl80211: New scan results available
nl80211: Scan included frequencies: 2412 2417 2422 2427 2432 2437 2442
2447 2452 2457 2462 5180 5200 5220 5240 5260 5280 5300 5320 5500 5520
5540 5560 5580 5660 5680 5700 5720 5745 5765 5785 5805 5825
wlp2s0: Event SCAN_RESULTS (3) received
ACS: Using survey based algorithm (acs_num_scans=5)
nl80211: Fetch survey data
nl80211: Freq survey dump event (freq=2412 MHz noise=-99
channel_time=149 busy_time=48 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2417 MHz noise=-100
channel_time=149 busy_time=28 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2422 MHz noise=-101
channel_time=149 busy_time=22 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2427 MHz noise=-102
channel_time=149 busy_time=55 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2432 MHz noise=-102
channel_time=149 busy_time=62 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2437 MHz noise=-104
channel_time=149 busy_time=60 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2442 MHz noise=-104
channel_time=149 busy_time=47 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2447 MHz noise=-105
channel_time=149 busy_time=22 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2452 MHz noise=-106
channel_time=149 busy_time=20 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2457 MHz noise=-106
channel_time=149 busy_time=48 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2462 MHz noise=-106
channel_time=149 busy_time=17 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5180 MHz noise=-99
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5200 MHz noise=-43
channel_time=149 busy_time=97 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5220 MHz noise=-99
channel_time=149 busy_time=3 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5240 MHz noise=-99
channel_time=149 busy_time=4 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5260 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5280 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5300 MHz noise=-98
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5320 MHz noise=-98
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5500 MHz noise=-43
channel_time=149 busy_time=82 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5520 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5540 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5560 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5580 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5660 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5680 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5700 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5720 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5745 MHz noise=-96
channel_time=149 busy_time=25 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5765 MHz noise=-43
channel_time=149 busy_time=107 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5785 MHz noise=-95
channel_time=149 busy_time=12 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5805 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5825 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
wlp2s0: Event SURVEY (46) received
ACS: Scanning 4 / 5
wlp2s0: nl80211: scan request
Scan requested (ret=0) - scan timeout 30 seconds
nl80211: Event message available
nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for wlp2s0
wlp2s0: nl80211: Scan trigger
wlp2s0: Event SCAN_STARTED (47) received
Unknown event 47
RTM_NEWLINK: ifi_index=8 ifname=wlp2s0 wext ifi_family=0 ifi_flags=0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for wlp2s0
wlp2s0: nl80211: New scan results available
nl80211: Scan included frequencies: 2412 2417 2422 2427 2432 2437 2442
2447 2452 2457 2462 5180 5200 5220 5240 5260 5280 5300 5320 5500 5520
5540 5560 5580 5660 5680 5700 5720 5745 5765 5785 5805 5825
wlp2s0: Event SCAN_RESULTS (3) received
ACS: Using survey based algorithm (acs_num_scans=5)
nl80211: Fetch survey data
nl80211: Freq survey dump event (freq=2412 MHz noise=-99
channel_time=149 busy_time=67 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2417 MHz noise=-99
channel_time=149 busy_time=45 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2422 MHz noise=-101
channel_time=149 busy_time=25 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2427 MHz noise=-102
channel_time=149 busy_time=44 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2432 MHz noise=-102
channel_time=149 busy_time=44 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2437 MHz noise=-104
channel_time=149 busy_time=80 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2442 MHz noise=-104
channel_time=149 busy_time=58 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2447 MHz noise=-104
channel_time=149 busy_time=73 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2452 MHz noise=-106
channel_time=149 busy_time=13 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2457 MHz noise=-106
channel_time=149 busy_time=74 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2462 MHz noise=-106
channel_time=149 busy_time=17 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5180 MHz noise=-99
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5200 MHz noise=-43
channel_time=149 busy_time=96 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5220 MHz noise=-99
channel_time=149 busy_time=26 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5240 MHz noise=-99
channel_time=149 busy_time=3 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5260 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5280 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5300 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5320 MHz noise=-98
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5500 MHz noise=-43
channel_time=149 busy_time=84 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5520 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5540 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5560 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5580 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5660 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5680 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5700 MHz noise=-97
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5720 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5745 MHz noise=-97
channel_time=149 busy_time=22 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5765 MHz noise=-43
channel_time=149 busy_time=105 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5785 MHz noise=-95
channel_time=149 busy_time=34 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5805 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5825 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
wlp2s0: Event SURVEY (46) received
ACS: Scanning 5 / 5
wlp2s0: nl80211: scan request
Scan requested (ret=0) - scan timeout 30 seconds
nl80211: Event message available
nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for wlp2s0
wlp2s0: nl80211: Scan trigger
wlp2s0: Event SCAN_STARTED (47) received
Unknown event 47
RTM_NEWLINK: ifi_index=8 ifname=wlp2s0 wext ifi_family=0 ifi_flags=0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for wlp2s0
wlp2s0: nl80211: New scan results available
nl80211: Scan included frequencies: 2412 2417 2422 2427 2432 2437 2442
2447 2452 2457 2462 5180 5200 5220 5240 5260 5280 5300 5320 5500 5520
5540 5560 5580 5660 5680 5700 5720 5745 5765 5785 5805 5825
wlp2s0: Event SCAN_RESULTS (3) received
ACS: Using survey based algorithm (acs_num_scans=5)
nl80211: Fetch survey data
nl80211: Freq survey dump event (freq=2412 MHz noise=-99
channel_time=149 busy_time=38 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2417 MHz noise=-100
channel_time=149 busy_time=29 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2422 MHz noise=-101
channel_time=149 busy_time=29 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2427 MHz noise=-102
channel_time=149 busy_time=48 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2432 MHz noise=-103
channel_time=149 busy_time=47 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2437 MHz noise=-105
channel_time=149 busy_time=28 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2442 MHz noise=-105
channel_time=149 busy_time=31 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2447 MHz noise=-105
channel_time=149 busy_time=65 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2452 MHz noise=-106
channel_time=149 busy_time=4 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2457 MHz noise=-106
channel_time=149 busy_time=25 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2462 MHz noise=-106
channel_time=149 busy_time=79 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5180 MHz noise=-99
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5200 MHz noise=-43
channel_time=149 busy_time=94 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5220 MHz noise=-99
channel_time=149 busy_time=2 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5240 MHz noise=-99
channel_time=149 busy_time=3 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5260 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5280 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5300 MHz noise=-98
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5320 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5500 MHz noise=-43
channel_time=149 busy_time=84 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5520 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5540 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5560 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5580 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5660 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5680 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5700 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5720 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5745 MHz noise=-97
channel_time=149 busy_time=24 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5765 MHz noise=-43
channel_time=149 busy_time=107 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5785 MHz noise=-95
channel_time=149 busy_time=13 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5805 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5825 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
wlp2s0: Event SURVEY (46) received
ACS: Trying survey-based ACS
ACS: Unable to collect survey data
ACS: All study options have failed
Interface initialization failed
wlp2s0: interface state ACS->DISABLED
wlp2s0: AP-DISABLED
ACS: Possibly channel configuration is invalid, please report this
along with your config file.
ACS: Failed to start
wlp2s0: AP-DISABLED
wlp2s0: Deauthenticate all stations
nl80211: send_mlme - da= ff:ff:ff:ff:ff:ff noack=0 freq=0 no_cck=0
offchanok=0 wait_time=0 fc=0xc0 (WLAN_FC_STYPE_DEAUTH) nlmode=3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=0
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=0 wait=0 no_cck=0 no_ack=0 offchanok=0
CMD_FRAME - hexdump(len=26): c0 00 00 00 ff ff ff ff ff ff f0 03 8c 4a
65 dd f0 03 8c 4a 65 dd 00 00 03 00
nl80211: Frame command failed: ret=-22 (Invalid argument) (freq=0 wait=0)
hostapd_free_hapd_data: Interface wlp2s0 wasn't started
hostapd_deinit_driver: driver=0x55d29fa47d00 drv_priv=0x55d2a118e930
-> hapd_deinit
nl80211: deinit ifname=wlp2s0 disabled_11b_rates=0
nl80211: Remove monitor interface: refcount=0
nl80211: Remove beacon (ifindex=8)
netlink: Operstate: ifindex=8 linkmode=0 (kernel-control), operstate=6
(IF_OPER_UP)
nl80211: Set mode ifindex 8 iftype 2 (STATION)
nl80211: Teardown AP(wlp2s0) - device_ap_sme=0 use_monitor=0
nl80211: Unsubscribe mgmt frames handle 0x8888dd5a29905989 (AP teardown)
hostapd_deinit_driver:bss[0]->drv_priv=0x55d2a118e930
hostapd_cleanup_iface_partial(0x55d2a118c710)
Interface wlp2s0 disabled
wlp2s0: interface state DISABLED->DISABLED
hostapd_interface_deinit_free(0x55d2a118c710)
hostapd_interface_deinit_free: num_bss=1 conf->num_bss=1
hostapd_interface_deinit(0x55d2a118c710)
wlp2s0: interface state DISABLED->DISABLED
hostapd_bss_deinit: deinit bss wlp2s0
wlp2s0: AP-DISABLED
hostapd_cleanup(hapd=0x55d2a118d900 (wlp2s0))
hostapd_free_hapd_data: Interface wlp2s0 wasn't started
hostapd_interface_deinit_free: driver=0x55d29fa47d00 drv_priv=(nil) ->
hapd_deinit
hostapd_interface_free(0x55d2a118c710)
hostapd_interface_free: free hapd 0x55d2a118d900
hostapd_cleanup_iface(0x55d2a118c710)
hostapd_cleanup_iface_partial(0x55d2a118c710)
hostapd_cleanup_iface: free iface=0x55d2a118c710


The next (and subsequent) attempts are always successful, as far as I can tell.
# hostapd -dd /etc/hostapd/hostapd1.conf
random: Trying to read entropy from /dev/random
Configuration file: /etc/hostapd/hostapd1.conf
rfkill: initial event: idx=0 type=2 op=0 soft=0 hard=0
rfkill: initial event: idx=5 type=1 op=0 soft=0 hard=0
nl80211: TDLS supported
nl80211: TDLS external setup
nl80211: Supported cipher 00-0f-ac:1
nl80211: Supported cipher 00-0f-ac:5
nl80211: Supported cipher 00-0f-ac:2
nl80211: Supported cipher 00-0f-ac:4
nl80211: Supported cipher 00-0f-ac:6
nl80211: Supports Probe Response offload in AP mode
nl80211: Using driver-based off-channel TX
nl80211: Use separate P2P group interface (driver advertised support)
nl80211: Enable multi-channel concurrent (driver advertised support)
nl80211: use P2P_DEVICE support
nl80211: interface wlp2s0 in phy phy0
nl80211: Set mode ifindex 8 iftype 3 (AP)
nl80211: Setup AP(wlp2s0) - device_ap_sme=0 use_monitor=0
nl80211: Subscribe to mgmt frames with AP handle 0x558bef681100
nl80211: Register frame type=0xb0 (WLAN_FC_STYPE_AUTH)
nl_handle=0x558bef681100 match=
nl80211: Register frame type=0x0 (WLAN_FC_STYPE_ASSOC_REQ)
nl_handle=0x558bef681100 match=
nl80211: Register frame type=0x20 (WLAN_FC_STYPE_REASSOC_REQ)
nl_handle=0x558bef681100 match=
nl80211: Register frame type=0xa0 (WLAN_FC_STYPE_DISASSOC)
nl_handle=0x558bef681100 match=
nl80211: Register frame type=0xc0 (WLAN_FC_STYPE_DEAUTH)
nl_handle=0x558bef681100 match=
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION)
nl_handle=0x558bef681100 match=
nl80211: Register frame type=0x40 (WLAN_FC_STYPE_PROBE_REQ)
nl_handle=0x558bef681100 match=
nl80211: Add own interface ifindex 8
nl80211: if_indices[16]: 8
phy: phy0
BSS count 1, BSSID mask 00:00:00:00:00:00 (0 bits)
wlp2s0: interface state UNINITIALIZED->COUNTRY_UPDATE
Previous country code CA, new country code CA
nl80211: Regulatory information - country=CA (DFS-FCC)
nl80211: 2402-2472 @ 40 MHz 30 mBm
nl80211: 5170-5250 @ 80 MHz 17 mBm
nl80211: 5250-5330 @ 80 MHz 24 mBm (DFS)
nl80211: 5490-5600 @ 80 MHz 24 mBm (DFS)
nl80211: 5650-5730 @ 80 MHz 24 mBm (DFS)
nl80211: 5735-5835 @ 80 MHz 30 mBm
nl80211: Added 802.11b mode based on 802.11g information
Allowed channel: mode=1 chan=1 freq=2412 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=2 freq=2417 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=3 freq=2422 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=4 freq=2427 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=5 freq=2432 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=6 freq=2437 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=7 freq=2442 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=8 freq=2447 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=9 freq=2452 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=10 freq=2457 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=11 freq=2462 MHz max_tx_power=30 dBm
Allowed channel: mode=2 chan=36 freq=5180 MHz max_tx_power=17 dBm
Allowed channel: mode=2 chan=40 freq=5200 MHz max_tx_power=17 dBm
Allowed channel: mode=2 chan=44 freq=5220 MHz max_tx_power=17 dBm
Allowed channel: mode=2 chan=48 freq=5240 MHz max_tx_power=17 dBm
Allowed channel: mode=2 chan=149 freq=5745 MHz max_tx_power=30 dBm
Allowed channel: mode=2 chan=157 freq=5785 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=1 freq=2412 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=2 freq=2417 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=3 freq=2422 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=4 freq=2427 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=5 freq=2432 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=6 freq=2437 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=7 freq=2442 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=8 freq=2447 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=9 freq=2452 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=10 freq=2457 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=11 freq=2462 MHz max_tx_power=30 dBm
ACS: Automatic channel selection started, this may take a bit
ACS: Scanning 1 / 5
wlp2s0: nl80211: scan request
nl80211: Scan frequency 5180 MHz
nl80211: Scan frequency 5200 MHz
nl80211: Scan frequency 5220 MHz
nl80211: Scan frequency 5240 MHz
nl80211: Scan frequency 5745 MHz
nl80211: Scan frequency 5785 MHz
Scan requested (ret=0) - scan timeout 10 seconds
wlp2s0: interface state COUNTRY_UPDATE->ACS
wlp2s0: ACS-STARTED
Interface initialization will be completed in a callback (ACS)
ctrl_iface not configured!
random: Got 20/20 bytes from /dev/random
RTM_NEWLINK: ifi_index=8 ifname=wlp2s0 operstate=2 linkmode=0
ifi_family=0 ifi_flags=0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for wlp2s0
wlp2s0: nl80211: Scan trigger
wlp2s0: Event SCAN_STARTED (47) received
Unknown event 47
RTM_NEWLINK: ifi_index=8 ifname=wlp2s0 wext ifi_family=0 ifi_flags=0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for wlp2s0
wlp2s0: nl80211: New scan results available
nl80211: Scan included frequencies: 5180 5200 5220 5240 5745 5785
wlp2s0: Event SCAN_RESULTS (3) received
ACS: Using survey based algorithm (acs_num_scans=5)
nl80211: Fetch survey data
nl80211: Freq survey dump event (freq=2412 MHz noise=-99
channel_time=149 busy_time=38 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2417 MHz noise=-100
channel_time=149 busy_time=29 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2422 MHz noise=-101
channel_time=149 busy_time=29 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2427 MHz noise=-102
channel_time=149 busy_time=48 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2432 MHz noise=-103
channel_time=149 busy_time=47 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2437 MHz noise=-105
channel_time=149 busy_time=28 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2442 MHz noise=-105
channel_time=149 busy_time=31 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2447 MHz noise=-105
channel_time=149 busy_time=65 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2452 MHz noise=-106
channel_time=149 busy_time=4 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2457 MHz noise=-106
channel_time=149 busy_time=25 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2462 MHz noise=-106
channel_time=149 busy_time=79 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5180 MHz noise=-99
channel_time=146 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5200 MHz noise=-43
channel_time=149 busy_time=95 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5220 MHz noise=-99
channel_time=149 busy_time=18 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5240 MHz noise=-100
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5260 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5280 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5300 MHz noise=-98
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5320 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5500 MHz noise=-43
channel_time=149 busy_time=84 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5520 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5540 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5560 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5580 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5660 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5680 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5700 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5720 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5745 MHz noise=-97
channel_time=149 busy_time=25 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5765 MHz noise=-43
channel_time=149 busy_time=107 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5785 MHz noise=-95
channel_time=149 busy_time=36 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5805 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5825 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
wlp2s0: Event SURVEY (46) received
ACS: Scanning 2 / 5
wlp2s0: nl80211: scan request
nl80211: Scan frequency 5180 MHz
nl80211: Scan frequency 5200 MHz
nl80211: Scan frequency 5220 MHz
nl80211: Scan frequency 5240 MHz
nl80211: Scan frequency 5745 MHz
nl80211: Scan frequency 5785 MHz
Scan requested (ret=0) - scan timeout 30 seconds
nl80211: Event message available
nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for wlp2s0
wlp2s0: nl80211: Scan trigger
wlp2s0: Event SCAN_STARTED (47) received
Unknown event 47
RTM_NEWLINK: ifi_index=8 ifname=wlp2s0 wext ifi_family=0 ifi_flags=0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for wlp2s0
wlp2s0: nl80211: New scan results available
nl80211: Scan included frequencies: 5180 5200 5220 5240 5745 5785
wlp2s0: Event SCAN_RESULTS (3) received
ACS: Using survey based algorithm (acs_num_scans=5)
nl80211: Fetch survey data
nl80211: Freq survey dump event (freq=2412 MHz noise=-99
channel_time=149 busy_time=38 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2417 MHz noise=-100
channel_time=149 busy_time=29 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2422 MHz noise=-101
channel_time=149 busy_time=29 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2427 MHz noise=-102
channel_time=149 busy_time=48 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2432 MHz noise=-103
channel_time=149 busy_time=47 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2437 MHz noise=-105
channel_time=149 busy_time=28 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2442 MHz noise=-105
channel_time=149 busy_time=31 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2447 MHz noise=-105
channel_time=149 busy_time=65 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2452 MHz noise=-106
channel_time=149 busy_time=4 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2457 MHz noise=-106
channel_time=149 busy_time=25 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2462 MHz noise=-106
channel_time=149 busy_time=79 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5180 MHz noise=-99
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5200 MHz noise=-43
channel_time=149 busy_time=89 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5220 MHz noise=-99
channel_time=149 busy_time=2 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5240 MHz noise=-99
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5260 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5280 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5300 MHz noise=-98
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5320 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5500 MHz noise=-43
channel_time=149 busy_time=84 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5520 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5540 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5560 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5580 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5660 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5680 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5700 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5720 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5745 MHz noise=-97
channel_time=149 busy_time=26 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5765 MHz noise=-43
channel_time=149 busy_time=107 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5785 MHz noise=-95
channel_time=149 busy_time=14 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5805 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5825 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
wlp2s0: Event SURVEY (46) received
ACS: Scanning 3 / 5
wlp2s0: nl80211: scan request
nl80211: Scan frequency 5180 MHz
nl80211: Scan frequency 5200 MHz
nl80211: Scan frequency 5220 MHz
nl80211: Scan frequency 5240 MHz
nl80211: Scan frequency 5745 MHz
nl80211: Scan frequency 5785 MHz
Scan requested (ret=0) - scan timeout 30 seconds
nl80211: Event message available
nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for wlp2s0
wlp2s0: nl80211: Scan trigger
wlp2s0: Event SCAN_STARTED (47) received
Unknown event 47
RTM_NEWLINK: ifi_index=8 ifname=wlp2s0 wext ifi_family=0 ifi_flags=0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for wlp2s0
wlp2s0: nl80211: New scan results available
nl80211: Scan included frequencies: 5180 5200 5220 5240 5745 5785
wlp2s0: Event SCAN_RESULTS (3) received
ACS: Using survey based algorithm (acs_num_scans=5)
nl80211: Fetch survey data
nl80211: Freq survey dump event (freq=2412 MHz noise=-99
channel_time=149 busy_time=38 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2417 MHz noise=-100
channel_time=149 busy_time=29 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2422 MHz noise=-101
channel_time=149 busy_time=29 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2427 MHz noise=-102
channel_time=149 busy_time=48 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2432 MHz noise=-103
channel_time=149 busy_time=47 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2437 MHz noise=-105
channel_time=149 busy_time=28 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2442 MHz noise=-105
channel_time=149 busy_time=31 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2447 MHz noise=-105
channel_time=149 busy_time=65 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2452 MHz noise=-106
channel_time=149 busy_time=4 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2457 MHz noise=-106
channel_time=149 busy_time=25 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2462 MHz noise=-106
channel_time=149 busy_time=79 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5180 MHz noise=-99
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5200 MHz noise=-43
channel_time=149 busy_time=92 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5220 MHz noise=-99
channel_time=149 busy_time=2 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5240 MHz noise=-99
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5260 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5280 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5300 MHz noise=-98
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5320 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5500 MHz noise=-43
channel_time=149 busy_time=84 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5520 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5540 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5560 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5580 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5660 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5680 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5700 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5720 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5745 MHz noise=-97
channel_time=149 busy_time=24 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5765 MHz noise=-43
channel_time=149 busy_time=107 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5785 MHz noise=-95
channel_time=149 busy_time=20 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5805 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5825 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
wlp2s0: Event SURVEY (46) received
ACS: Scanning 4 / 5
wlp2s0: nl80211: scan request
nl80211: Scan frequency 5180 MHz
nl80211: Scan frequency 5200 MHz
nl80211: Scan frequency 5220 MHz
nl80211: Scan frequency 5240 MHz
nl80211: Scan frequency 5745 MHz
nl80211: Scan frequency 5785 MHz
Scan requested (ret=0) - scan timeout 30 seconds
nl80211: Event message available
nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for wlp2s0
wlp2s0: nl80211: Scan trigger
wlp2s0: Event SCAN_STARTED (47) received
Unknown event 47
RTM_NEWLINK: ifi_index=8 ifname=wlp2s0 wext ifi_family=0 ifi_flags=0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for wlp2s0
wlp2s0: nl80211: New scan results available
nl80211: Scan included frequencies: 5180 5200 5220 5240 5745 5785
wlp2s0: Event SCAN_RESULTS (3) received
ACS: Using survey based algorithm (acs_num_scans=5)
nl80211: Fetch survey data
nl80211: Freq survey dump event (freq=2412 MHz noise=-99
channel_time=149 busy_time=38 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2417 MHz noise=-100
channel_time=149 busy_time=29 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2422 MHz noise=-101
channel_time=149 busy_time=29 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2427 MHz noise=-102
channel_time=149 busy_time=48 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2432 MHz noise=-103
channel_time=149 busy_time=47 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2437 MHz noise=-105
channel_time=149 busy_time=28 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2442 MHz noise=-105
channel_time=149 busy_time=31 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2447 MHz noise=-105
channel_time=149 busy_time=65 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2452 MHz noise=-106
channel_time=149 busy_time=4 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2457 MHz noise=-106
channel_time=149 busy_time=25 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2462 MHz noise=-106
channel_time=149 busy_time=79 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5180 MHz noise=-99
channel_time=149 busy_time=2 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5200 MHz noise=-43
channel_time=149 busy_time=93 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5220 MHz noise=-99
channel_time=149 busy_time=3 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5240 MHz noise=-99
channel_time=149 busy_time=2 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5260 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5280 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5300 MHz noise=-98
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5320 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5500 MHz noise=-43
channel_time=149 busy_time=84 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5520 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5540 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5560 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5580 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5660 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5680 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5700 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5720 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5745 MHz noise=-97
channel_time=149 busy_time=22 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5765 MHz noise=-43
channel_time=149 busy_time=107 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5785 MHz noise=-95
channel_time=149 busy_time=28 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5805 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5825 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
wlp2s0: Event SURVEY (46) received
ACS: Scanning 5 / 5
wlp2s0: nl80211: scan request
nl80211: Scan frequency 5180 MHz
nl80211: Scan frequency 5200 MHz
nl80211: Scan frequency 5220 MHz
nl80211: Scan frequency 5240 MHz
nl80211: Scan frequency 5745 MHz
nl80211: Scan frequency 5785 MHz
Scan requested (ret=0) - scan timeout 30 seconds
nl80211: Event message available
nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for wlp2s0
wlp2s0: nl80211: Scan trigger
wlp2s0: Event SCAN_STARTED (47) received
Unknown event 47
RTM_NEWLINK: ifi_index=8 ifname=wlp2s0 wext ifi_family=0 ifi_flags=0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for wlp2s0
wlp2s0: nl80211: New scan results available
nl80211: Scan included frequencies: 5180 5200 5220 5240 5745 5785
wlp2s0: Event SCAN_RESULTS (3) received
ACS: Using survey based algorithm (acs_num_scans=5)
nl80211: Fetch survey data
nl80211: Freq survey dump event (freq=2412 MHz noise=-99
channel_time=149 busy_time=38 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2417 MHz noise=-100
channel_time=149 busy_time=29 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2422 MHz noise=-101
channel_time=149 busy_time=29 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2427 MHz noise=-102
channel_time=149 busy_time=48 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2432 MHz noise=-103
channel_time=149 busy_time=47 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2437 MHz noise=-105
channel_time=149 busy_time=28 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2442 MHz noise=-105
channel_time=149 busy_time=31 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2447 MHz noise=-105
channel_time=149 busy_time=65 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2452 MHz noise=-106
channel_time=149 busy_time=4 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2457 MHz noise=-106
channel_time=149 busy_time=25 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2462 MHz noise=-106
channel_time=149 busy_time=79 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5180 MHz noise=-99
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5200 MHz noise=-43
channel_time=149 busy_time=92 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5220 MHz noise=-100
channel_time=149 busy_time=4 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5240 MHz noise=-99
channel_time=149 busy_time=4 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5260 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5280 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5300 MHz noise=-98
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5320 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5500 MHz noise=-43
channel_time=149 busy_time=84 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5520 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5540 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5560 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5580 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5660 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5680 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5700 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5720 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5745 MHz noise=-96
channel_time=149 busy_time=25 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5765 MHz noise=-43
channel_time=149 busy_time=107 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5785 MHz noise=-96
channel_time=149 busy_time=10 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5805 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5825 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
wlp2s0: Event SURVEY (46) received
ACS: Trying survey-based ACS
ACS: Survey analysis for channel 36 (5180 MHz)
ACS: 1: min_nf=-99 interference_factor=0.00684932 nf=-99 time=146 busy=1 rx=0
ACS: 2: min_nf=-99 interference_factor=0.00671141 nf=-99 time=149 busy=1 rx=0
ACS: 3: min_nf=-99 interference_factor=0.00671141 nf=-99 time=149 busy=1 rx=0
ACS: 4: min_nf=-99 interference_factor=0.0134228 nf=-99 time=149 busy=2 rx=0
ACS: 5: min_nf=-99 interference_factor=0.00671141 nf=-99 time=149 busy=1 rx=0
ACS:  * interference factor average: 0.00808127
ACS: Survey analysis for channel 40 (5200 MHz)
ACS: 1: min_nf=-43 interference_factor=0.637606 nf=-43 time=149 busy=95 rx=0
ACS: 2: min_nf=-43 interference_factor=0.597336 nf=-43 time=149 busy=89 rx=0
ACS: 3: min_nf=-43 interference_factor=0.617471 nf=-43 time=149 busy=92 rx=0
ACS: 4: min_nf=-43 interference_factor=0.624183 nf=-43 time=149 busy=93 rx=0
ACS: 5: min_nf=-43 interference_factor=0.617471 nf=-43 time=149 busy=92 rx=0
ACS:  * interference factor average: 0.618813
ACS: Survey analysis for channel 44 (5220 MHz)
ACS: 1: min_nf=-100 interference_factor=0.120805 nf=-99 time=149 busy=18 rx=0
ACS: 2: min_nf=-100 interference_factor=0.0134228 nf=-99 time=149 busy=2 rx=0
ACS: 3: min_nf=-100 interference_factor=0.0134228 nf=-99 time=149 busy=2 rx=0
ACS: 4: min_nf=-100 interference_factor=0.0201342 nf=-99 time=149 busy=3 rx=0
ACS: 5: min_nf=-100 interference_factor=0.0268456 nf=-100 time=149 busy=4 rx=0
ACS:  * interference factor average: 0.0389262
ACS: Survey analysis for channel 48 (5240 MHz)
ACS: 1: min_nf=-100 interference_factor=0.00671141 nf=-100 time=149 busy=1 rx=0
ACS: 2: min_nf=-100 interference_factor=0.00671141 nf=-99 time=149 busy=1 rx=0
ACS: 3: min_nf=-100 interference_factor=0.00671141 nf=-99 time=149 busy=1 rx=0
ACS: 4: min_nf=-100 interference_factor=0.0134228 nf=-99 time=149 busy=2 rx=0
ACS: 5: min_nf=-100 interference_factor=0.0268456 nf=-99 time=149 busy=4 rx=0
ACS:  * interference factor average: 0.0120805
ACS: Survey analysis for channel 149 (5745 MHz)
ACS: 1: min_nf=-97 interference_factor=0.167785 nf=-97 time=149 busy=25 rx=0
ACS: 2: min_nf=-97 interference_factor=0.174497 nf=-97 time=149 busy=26 rx=0
ACS: 3: min_nf=-97 interference_factor=0.161074 nf=-97 time=149 busy=24 rx=0
ACS: 4: min_nf=-97 interference_factor=0.147651 nf=-97 time=149 busy=22 rx=0
ACS: 5: min_nf=-97 interference_factor=0.167785 nf=-96 time=149 busy=25 rx=0
ACS:  * interference factor average: 0.163758
ACS: Survey analysis for channel 157 (5785 MHz)
ACS: 1: min_nf=-96 interference_factor=0.241611 nf=-95 time=149 busy=36 rx=0
ACS: 2: min_nf=-96 interference_factor=0.0939597 nf=-95 time=149 busy=14 rx=0
ACS: 3: min_nf=-96 interference_factor=0.134228 nf=-95 time=149 busy=20 rx=0
ACS: 4: min_nf=-96 interference_factor=0.187919 nf=-95 time=149 busy=28 rx=0
ACS: 5: min_nf=-96 interference_factor=0.0671141 nf=-96 time=149 busy=10 rx=0
ACS:  * interference factor average: 0.144966
ACS: Survey analysis for selected bandwidth 20 MHz
ACS:  * channel 36: total interference = 0.00808127
ACS:  * channel 40: total interference = 0.618813
ACS:  * channel 44: total interference = 0.0389262
ACS:  * channel 48: total interference = 0.0120805
ACS:  * channel 149: total interference = 0.163758
ACS:  * channel 157: total interference = 0.144966
ACS: Ideal channel is 36 (5180 MHz) with total interference factor of 0.00808127
ACS: Adjusting VHT center frequency
wlp2s0: ACS-COMPLETED freq=5180 channel=36
Completing interface initialization
Mode: IEEE 802.11a  Channel: 36  Frequency: 5180 MHz
DFS 0 channels required radar detection
nl80211: Set freq 5180 (ht_enabled=0, vht_enabled=1, bandwidth=20 MHz,
cf1=5180 MHz, cf2=0 MHz)
  * freq=5180
  * vht_enabled=1
  * ht_enabled=0
  * bandwidth=20
  * channel_width=1
  * center_freq1=5180
  * center_freq2=0
RATE[0] rate=60 flags=0x1
RATE[1] rate=90 flags=0x0
RATE[2] rate=120 flags=0x1
RATE[3] rate=180 flags=0x0
RATE[4] rate=240 flags=0x1
RATE[5] rate=360 flags=0x0
RATE[6] rate=480 flags=0x0
RATE[7] rate=540 flags=0x0
hostapd_setup_bss(hapd=0x558bef681900 (wlp2s0), first=1)
wlp2s0: Flushing old station entries
nl80211: flush -> DEL_STATION wlp2s0 (all)
wlp2s0: Deauthenticate all stations
nl80211: send_mlme - da= ff:ff:ff:ff:ff:ff noack=0 freq=0 no_cck=0
offchanok=0 wait_time=0 fc=0xc0 (WLAN_FC_STYPE_DEAUTH) nlmode=3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=5180
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=5180 wait=0 no_cck=0 no_ack=0 offchanok=0
CMD_FRAME - hexdump(len=26): c0 00 00 00 ff ff ff ff ff ff f0 03 8c 4a
65 dd f0 03 8c 4a 65 dd 00 00 02 00
nl80211: Frame command failed: ret=-16 (Device or resource busy)
(freq=5180 wait=0)
wpa_driver_nl80211_set_key: ifindex=8 (wlp2s0) alg=0 addr=(nil)
key_idx=0 set_tx=0 seq_len=0 key_len=0
wpa_driver_nl80211_set_key: ifindex=8 (wlp2s0) alg=0 addr=(nil)
key_idx=1 set_tx=0 seq_len=0 key_len=0
wpa_driver_nl80211_set_key: ifindex=8 (wlp2s0) alg=0 addr=(nil)
key_idx=2 set_tx=0 seq_len=0 key_len=0
wpa_driver_nl80211_set_key: ifindex=8 (wlp2s0) alg=0 addr=(nil)
key_idx=3 set_tx=0 seq_len=0 key_len=0
Using interface wlp2s0 with hwaddr f0:03:8c:4a:65:dd and ssid "test5"
Deriving WPA PSK based on passphrase
SSID - hexdump_ascii(len=5):
     74 65 73 74 35                                    test5
PSK (ASCII passphrase) - hexdump_ascii(len=8): [REMOVED]
PSK (from passphrase) - hexdump(len=32): [REMOVED]
Get randomness: len=32 entropy=195
GMK - hexdump(len=32): [REMOVED]
Get randomness: len=32 entropy=163
Key Counter - hexdump(len=32): [REMOVED]
WPA: Delay group state machine start until Beacon frames have been configured
nl80211: Set beacon (beacon_set=0)
nl80211: Beacon head - hexdump(len=56): 80 00 00 00 ff ff ff ff ff ff
f0 03 8c 4a 65 dd f0 03 8c 4a 65 dd 00 00 00 00 00 00 00 00 00 00 64
00 11 00 00 05 74 65 73 74 35 01 08 8c 12 98 24 b0 48 60 6c 03 01 24
nl80211: Beacon tail - hexdump(len=67): 07 0c 43 41 20 24 04 11 95 01
1e 9d 01 1e 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac
02 00 00 7f 08 04 00 00 02 00 00 00 40 bf 0c 00 00 00 00 fa ff 00 00
fa ff 00 00 c0 05 00 24 00 fc ff
nl80211: ifindex=8
nl80211: beacon_int=100
nl80211: dtim_period=2
nl80211: ssid - hexdump_ascii(len=5):
     74 65 73 74 35                                    test5
  * beacon_int=100
nl80211: proberesp (offload) - hexdump(len=123): 50 00 00 00 00 00 00
00 00 00 f0 03 8c 4a 65 dd f0 03 8c 4a 65 dd 00 00 00 00 00 00 00 00
00 00 64 00 11 00 00 05 74 65 73 74 35 01 08 8c 12 98 24 b0 48 60 6c
03 01 24 07 0c 43 41 20 24 04 11 95 01 1e 9d 01 1e 30 14 01 00 00 0f
ac 04 01 00 00 0f ac 04 01 00 00 0f ac 02 00 00 7f 08 04 00 00 02 00
00 00 40 bf 0c 00 00 00 00 fa ff 00 00 fa ff 00 00 c0 05 00 24 00 fc
ff
nl80211: hidden SSID not in use
nl80211: privacy=1
nl80211: auth_algs=0x1
nl80211: wpa_version=0x2
nl80211: key_mgmt_suites=0x2
nl80211: pairwise_ciphers=0x18
nl80211: group_cipher=0x10
nl80211: beacon_ies - hexdump(len=10): 7f 08 04 00 00 02 00 00 00 40
nl80211: proberesp_ies - hexdump(len=10): 7f 08 04 00 00 02 00 00 00 40
nl80211: assocresp_ies - hexdump(len=10): 7f 08 04 00 00 02 00 00 00 40
WPA: Start group state machine to set initial keys
WPA: group state machine entering state GTK_INIT (VLAN-ID 0)
Get randomness: len=16 entropy=131
GTK - hexdump(len=16): [REMOVED]
WPA: group state machine entering state SETKEYSDONE (VLAN-ID 0)
wpa_driver_nl80211_set_key: ifindex=8 (wlp2s0) alg=3
addr=0x558beec861b1 key_idx=1 set_tx=1 seq_len=0 key_len=16
nl80211: KEY_DATA - hexdump(len=16): [REMOVED]
   broadcast key
nl80211: Set wlp2s0 operstate 0->1 (UP)
netlink: Operstate: ifindex=8 linkmode=-1 (no change), operstate=6 (IF_OPER_UP)
wlp2s0: interface state ACS->ENABLED
wlp2s0: AP-ENABLED
wlp2s0: Setup of interface done.
RTM_NEWLINK: ifi_index=8 ifname=wlp2s0 operstate=6 linkmode=0
ifi_family=0 ifi_flags=0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: RTM_NEWLINK: ifi_index=8 ifname=wlp2s0 ifi_family=0
ifi_flags=0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlp2s0)


The following script has so far been able to always cause a failure on
the next attempt.
#!/bin/bash

rmmod ath10k_pci
rmmod ath10k_core
rmmod ath
rmmod mac80211
rmmod cfg80211

modprobe ath10k_pci
udevadm trigger

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
