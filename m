Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clE2G-0006Em-IU
 for ath10k@lists.infradead.org; Tue, 07 Mar 2017 12:16:16 +0000
Received: by mail-oi0-x22d.google.com with SMTP id 62so100956049oih.2
 for <ath10k@lists.infradead.org>; Tue, 07 Mar 2017 04:15:51 -0800 (PST)
MIME-Version: 1.0
From: Chris Price <chris.price@dejero.com>
Date: Tue, 7 Mar 2017 07:15:49 -0500
Message-ID: <CALJ2kaGwPeryrU+ScJuB83vO-2zouTytkAFHZ86cKGj8W8WxkQ@mail.gmail.com>
Subject: Re: 4.9 Kernel panic on ACS and intermittent ability to host AP
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

> Could you share the logs with both driver and hostapd (-vvv), please?

# dmesg | grep ath
[    3.263913] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2
irq_mode 0 reset_mode 0
[    3.545202] ath10k_pci 0000:02:00.0: Direct firmware load for
ath10k/pre-cal-pci-0000:02:00.0.bin failed with error -2
[    3.545211] ath10k_pci 0000:02:00.0: Direct firmware load for
ath10k/cal-pci-0000:02:00.0.bin failed with error -2
[    3.547297] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target
0x05030000 chip_id 0x00340aff sub 1a3b:2260
[    3.547299] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1
tracing 1 dfs 0 testmode 0
[    3.547850] ath10k_pci 0000:02:00.0: firmware ver
WLAN.RM.4.4-00022-QCARMSWPZ-2 api 5 features wowlan,ignore-otp crc32
4d458559
[    3.612058] ath10k_pci 0000:02:00.0: board id is not exist in otp, ignore it
[    3.613345] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A
crc32 6fc88fe7
[    5.773868] ath10k_pci 0000:02:00.0: Unknown eventid: 90118
[    5.774460] ath10k_pci 0000:02:00.0: htt-ver 3.32 wmi-op 4 htt-op 3
cal otp max-sta 32 raw 0 hwcrypto 1
[    5.862557] ath: EEPROM regdomain: 0x6a
[    5.862558] ath: EEPROM indicates we should expect a direct regpair map
[    5.862560] ath: Country alpha2 being used: 00
[    5.862560] ath: Regpair used: 0x6a

# hostapd -dd /etc/hostapd/hostapd1.conf
random: Trying to read entropy from /dev/random
Configuration file: /etc/hostapd/hostapd1.conf
rfkill: initial event: idx=0 type=2 op=0 soft=0 hard=0
rfkill: initial event: idx=1 type=1 op=0 soft=0 hard=0
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
nl80211: interface ap1 in phy phy0
nl80211: Set mode ifindex 8 iftype 3 (AP)
nl80211: Setup AP(ap1) - device_ap_sme=0 use_monitor=0
nl80211: Subscribe to mgmt frames with AP handle 0x558e70e60dd0
nl80211: Register frame type=0xb0 (WLAN_FC_STYPE_AUTH)
nl_handle=0x558e70e60dd0 match=
nl80211: Register frame type=0x0 (WLAN_FC_STYPE_ASSOC_REQ)
nl_handle=0x558e70e60dd0 match=
nl80211: Register frame type=0x20 (WLAN_FC_STYPE_REASSOC_REQ)
nl_handle=0x558e70e60dd0 match=
nl80211: Register frame type=0xa0 (WLAN_FC_STYPE_DISASSOC)
nl_handle=0x558e70e60dd0 match=
nl80211: Register frame type=0xc0 (WLAN_FC_STYPE_DEAUTH)
nl_handle=0x558e70e60dd0 match=
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION)
nl_handle=0x558e70e60dd0 match=
nl80211: Register frame type=0x40 (WLAN_FC_STYPE_PROBE_REQ)
nl_handle=0x558e70e60dd0 match=
nl80211: Add own interface ifindex 8
nl80211: if_indices[16]: 8
nl80211: Do not indicate P2P_DEVICE support (p2p_device=1 driver param
not specified)
phy: phy0
BSS count 1, BSSID mask 00:00:00:00:00:00 (0 bits)
ap1: interface state UNINITIALIZED->COUNTRY_UPDATE
Previous country code 00, new country code CA
Continue interface setup after channel list update
ctrl_iface not configured!
random: Got 15/20 bytes from /dev/random
RTM_NEWLINK: ifi_index=8 ifname=ap1 operstate=0 linkmode=0
ifi_family=0 ifi_flags=0x1043 ([UP][RUNNING])
RTM_NEWLINK: ifi_index=8 ifname=ap1 operstate=2 linkmode=0
ifi_family=0 ifi_flags=0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 36 (NL80211_CMD_REG_CHANGE) received for ap1
nl80211: Regulatory domain change
 * initiator=1
 * type=0
 * alpha2=CA
ap1: Event CHANNEL_LIST_CHANGED (30) received
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
ap1: nl80211: scan request
Scan requested (ret=0) - scan timeout 10 seconds
ap1: interface state COUNTRY_UPDATE->ACS
ap1: ACS-STARTED
Interface initialization will be completed in a callback (ACS)
nl80211: Event message available
nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for ap1
ap1: nl80211: Scan trigger
ap1: Event SCAN_STARTED (49) received
Unknown event 49
nl80211: Event message available
nl80211: Drv Event 42 (NL80211_CMD_REG_BEACON_HINT) received for ap1
nl80211: Regulatory beacon hint
ap1: Event CHANNEL_LIST_CHANGED (30) received
nl80211: Event message available
nl80211: Drv Event 42 (NL80211_CMD_REG_BEACON_HINT) received for ap1
nl80211: Regulatory beacon hint
ap1: Event CHANNEL_LIST_CHANGED (30) received
nl80211: Event message available
nl80211: Drv Event 42 (NL80211_CMD_REG_BEACON_HINT) received for ap1
nl80211: Regulatory beacon hint
ap1: Event CHANNEL_LIST_CHANGED (30) received
nl80211: Event message available
nl80211: Drv Event 42 (NL80211_CMD_REG_BEACON_HINT) received for ap1
nl80211: Regulatory beacon hint
ap1: Event CHANNEL_LIST_CHANGED (30) received
nl80211: Event message available
nl80211: Drv Event 42 (NL80211_CMD_REG_BEACON_HINT) received for ap1
nl80211: Regulatory beacon hint
ap1: Event CHANNEL_LIST_CHANGED (30) received
nl80211: Event message available
nl80211: Drv Event 42 (NL80211_CMD_REG_BEACON_HINT) received for ap1
nl80211: Regulatory beacon hint
ap1: Event CHANNEL_LIST_CHANGED (30) received
RTM_NEWLINK: ifi_index=8 ifname=ap1 wext ifi_family=0 ifi_flags=0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for ap1
ap1: nl80211: New scan results available
nl80211: Scan included frequencies: 2412 2417 2422 2427 2432 2437 2442
2447 2452 2457 2462 5180 5200 5220 5240 5260 5280 5300 5320 5500 5520
5540 5560 5580 5660 5680 5700 5720 5745 5765 5785 5805 5825
ap1: Event SCAN_RESULTS (3) received
ACS: Using survey based algorithm (acs_num_scans=5)
nl80211: Fetch survey data
nl80211: Freq survey dump event (freq=2412 MHz noise=-101
channel_time=150 busy_time=62 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2417 MHz noise=-101
channel_time=149 busy_time=30 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2422 MHz noise=-102
channel_time=149 busy_time=118 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2427 MHz noise=-102
channel_time=149 busy_time=21 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2432 MHz noise=-104
channel_time=149 busy_time=42 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2437 MHz noise=-104
channel_time=149 busy_time=28 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2442 MHz noise=-105
channel_time=149 busy_time=52 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2447 MHz noise=-106
channel_time=149 busy_time=63 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2452 MHz noise=-105
channel_time=149 busy_time=54 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2457 MHz noise=-105
channel_time=149 busy_time=46 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2462 MHz noise=-106
channel_time=149 busy_time=122 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5180 MHz noise=-100
channel_time=146 busy_time=11 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5200 MHz noise=-43
channel_time=149 busy_time=63 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5220 MHz noise=-100
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5240 MHz noise=-100
channel_time=149 busy_time=4 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5260 MHz noise=-100
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5280 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5300 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5320 MHz noise=-98
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5500 MHz noise=-43
channel_time=149 busy_time=61 tx_time=0 rx_time=0 filled=0007)
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
nl80211: Freq survey dump event (freq=5745 MHz noise=-96
channel_time=149 busy_time=10 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5765 MHz noise=-43
channel_time=149 busy_time=106 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5785 MHz noise=-96
channel_time=149 busy_time=21 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5805 MHz noise=-96
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5825 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
ap1: Event SURVEY (48) received
ACS: Scanning 2 / 5
ap1: nl80211: scan request
Scan requested (ret=0) - scan timeout 30 seconds
nl80211: Event message available
nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for ap1
ap1: nl80211: Scan trigger
ap1: Event SCAN_STARTED (49) received
Unknown event 49
RTM_NEWLINK: ifi_index=8 ifname=ap1 wext ifi_family=0 ifi_flags=0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for ap1
ap1: nl80211: New scan results available
nl80211: Scan included frequencies: 2412 2417 2422 2427 2432 2437 2442
2447 2452 2457 2462 5180 5200 5220 5240 5260 5280 5300 5320 5500 5520
5540 5560 5580 5660 5680 5700 5720 5745 5765 5785 5805 5825
ap1: Event SCAN_RESULTS (3) received
ACS: Using survey based algorithm (acs_num_scans=5)
nl80211: Fetch survey data
nl80211: Freq survey dump event (freq=2412 MHz noise=-54
channel_time=149 busy_time=129 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2417 MHz noise=-101
channel_time=149 busy_time=91 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2422 MHz noise=-101
channel_time=149 busy_time=79 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2427 MHz noise=-102
channel_time=149 busy_time=78 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2432 MHz noise=-103
channel_time=149 busy_time=98 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2437 MHz noise=-104
channel_time=149 busy_time=42 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2442 MHz noise=-104
channel_time=149 busy_time=56 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2447 MHz noise=-105
channel_time=149 busy_time=86 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2452 MHz noise=-105
channel_time=149 busy_time=123 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2457 MHz noise=-106
channel_time=149 busy_time=69 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2462 MHz noise=-106
channel_time=149 busy_time=39 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5180 MHz noise=-100
channel_time=149 busy_time=15 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5200 MHz noise=-43
channel_time=149 busy_time=66 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5220 MHz noise=-100
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5240 MHz noise=-99
channel_time=149 busy_time=3 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5260 MHz noise=-100
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5280 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5300 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5320 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5500 MHz noise=-43
channel_time=149 busy_time=62 tx_time=0 rx_time=0 filled=0007)
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
nl80211: Freq survey dump event (freq=5745 MHz noise=-96
channel_time=149 busy_time=5 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5765 MHz noise=-43
channel_time=149 busy_time=106 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5785 MHz noise=-96
channel_time=149 busy_time=2 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5805 MHz noise=-97
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5825 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
ap1: Event SURVEY (48) received
ACS: Scanning 3 / 5
ap1: nl80211: scan request
Scan requested (ret=0) - scan timeout 30 seconds
nl80211: Event message available
nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for ap1
ap1: nl80211: Scan trigger
ap1: Event SCAN_STARTED (49) received
Unknown event 49
RTM_NEWLINK: ifi_index=8 ifname=ap1 wext ifi_family=0 ifi_flags=0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for ap1
ap1: nl80211: New scan results available
nl80211: Scan included frequencies: 2412 2417 2422 2427 2432 2437 2442
2447 2452 2457 2462 5180 5200 5220 5240 5260 5280 5300 5320 5500 5520
5540 5560 5580 5660 5680 5700 5720 5745 5765 5785 5805 5825
ap1: Event SCAN_RESULTS (3) received
ACS: Using survey based algorithm (acs_num_scans=5)
nl80211: Fetch survey data
nl80211: Freq survey dump event (freq=2412 MHz noise=-101
channel_time=149 busy_time=14 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2417 MHz noise=-101
channel_time=149 busy_time=17 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2422 MHz noise=-102
channel_time=149 busy_time=62 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2427 MHz noise=-102
channel_time=149 busy_time=74 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2432 MHz noise=-103
channel_time=149 busy_time=36 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2437 MHz noise=-104
channel_time=149 busy_time=25 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2442 MHz noise=-105
channel_time=149 busy_time=31 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2447 MHz noise=-105
channel_time=149 busy_time=62 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2452 MHz noise=-105
channel_time=149 busy_time=59 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2457 MHz noise=-106
channel_time=149 busy_time=62 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2462 MHz noise=-106
channel_time=149 busy_time=106 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5180 MHz noise=-100
channel_time=149 busy_time=20 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5200 MHz noise=-43
channel_time=149 busy_time=66 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5220 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
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
channel_time=149 busy_time=61 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5520 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5540 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5560 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5580 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5660 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5680 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5700 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5720 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5745 MHz noise=-96
channel_time=149 busy_time=13 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5765 MHz noise=-43
channel_time=149 busy_time=107 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5785 MHz noise=-96
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5805 MHz noise=-97
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5825 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
ap1: Event SURVEY (48) received
ACS: Scanning 4 / 5
ap1: nl80211: scan request
Scan requested (ret=0) - scan timeout 30 seconds
nl80211: Event message available
nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for ap1
ap1: nl80211: Scan trigger
ap1: Event SCAN_STARTED (49) received
Unknown event 49
RTM_NEWLINK: ifi_index=8 ifname=ap1 wext ifi_family=0 ifi_flags=0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for ap1
ap1: nl80211: New scan results available
nl80211: Scan included frequencies: 2412 2417 2422 2427 2432 2437 2442
2447 2452 2457 2462 5180 5200 5220 5240 5260 5280 5300 5320 5500 5520
5540 5560 5580 5660 5680 5700 5720 5745 5765 5785 5805 5825
ap1: Event SCAN_RESULTS (3) received
ACS: Using survey based algorithm (acs_num_scans=5)
nl80211: Fetch survey data
nl80211: Freq survey dump event (freq=2412 MHz noise=-101
channel_time=149 busy_time=108 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2417 MHz noise=-101
channel_time=149 busy_time=64 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2422 MHz noise=-102
channel_time=149 busy_time=88 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2427 MHz noise=-102
channel_time=149 busy_time=76 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2432 MHz noise=-104
channel_time=149 busy_time=64 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2437 MHz noise=-105
channel_time=149 busy_time=37 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2442 MHz noise=-105
channel_time=149 busy_time=80 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2447 MHz noise=-105
channel_time=149 busy_time=100 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2452 MHz noise=-105
channel_time=149 busy_time=123 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2457 MHz noise=-106
channel_time=149 busy_time=89 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2462 MHz noise=-106
channel_time=149 busy_time=34 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5180 MHz noise=-100
channel_time=149 busy_time=6 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5200 MHz noise=-43
channel_time=149 busy_time=68 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5220 MHz noise=-100
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5240 MHz noise=-100
channel_time=149 busy_time=3 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5260 MHz noise=-100
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5280 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5300 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5320 MHz noise=-98
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5500 MHz noise=-43
channel_time=149 busy_time=60 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5520 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5540 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5560 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5580 MHz noise=-96
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
channel_time=149 busy_time=6 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5765 MHz noise=-43
channel_time=149 busy_time=106 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5785 MHz noise=-96
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5805 MHz noise=-96
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5825 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
ap1: Event SURVEY (48) received
ACS: Scanning 5 / 5
ap1: nl80211: scan request
Scan requested (ret=0) - scan timeout 30 seconds
nl80211: Event message available
nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for ap1
ap1: nl80211: Scan trigger
ap1: Event SCAN_STARTED (49) received
Unknown event 49
random: Got 5/5 bytes from /dev/random
RTM_NEWLINK: ifi_index=8 ifname=ap1 wext ifi_family=0 ifi_flags=0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for ap1
ap1: nl80211: New scan results available
nl80211: Scan included frequencies: 2412 2417 2422 2427 2432 2437 2442
2447 2452 2457 2462 5180 5200 5220 5240 5260 5280 5300 5320 5500 5520
5540 5560 5580 5660 5680 5700 5720 5745 5765 5785 5805 5825
ap1: Event SCAN_RESULTS (3) received
ACS: Using survey based algorithm (acs_num_scans=5)
nl80211: Fetch survey data
nl80211: Freq survey dump event (freq=2412 MHz noise=-101
channel_time=149 busy_time=21 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2417 MHz noise=-102
channel_time=149 busy_time=21 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2422 MHz noise=-102
channel_time=149 busy_time=69 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2427 MHz noise=-102
channel_time=149 busy_time=53 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2432 MHz noise=-104
channel_time=149 busy_time=61 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2437 MHz noise=-104
channel_time=149 busy_time=37 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2442 MHz noise=-105
channel_time=149 busy_time=32 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2447 MHz noise=-105
channel_time=149 busy_time=69 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2452 MHz noise=-105
channel_time=149 busy_time=75 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2457 MHz noise=-107
channel_time=149 busy_time=83 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=2462 MHz noise=-106
channel_time=149 busy_time=46 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5180 MHz noise=-100
channel_time=149 busy_time=56 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5200 MHz noise=-43
channel_time=149 busy_time=68 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5220 MHz noise=-99
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5240 MHz noise=-100
channel_time=149 busy_time=4 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5260 MHz noise=-100
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5280 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5300 MHz noise=-99
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5320 MHz noise=-98
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5500 MHz noise=-43
channel_time=149 busy_time=60 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5520 MHz noise=-97
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5540 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5560 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5580 MHz noise=-96
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
channel_time=149 busy_time=11 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5765 MHz noise=-43
channel_time=149 busy_time=107 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5785 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5805 MHz noise=-97
channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
nl80211: Freq survey dump event (freq=5825 MHz noise=-96
channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
ap1: Event SURVEY (48) received
ACS: Trying survey-based ACS
ACS: Unable to collect survey data
ACS: All study options have failed
Interface initialization failed
ap1: interface state ACS->DISABLED
ap1: AP-DISABLED
ACS: Possibly channel configuration is invalid, please report this
along with your config file.
ACS: Failed to start
ap1: AP-DISABLED
ap1: Deauthenticate all stations
nl80211: send_mlme - da= ff:ff:ff:ff:ff:ff noack=0 freq=0 no_cck=0
offchanok=0 wait_time=0 fc=0xc0 (WLAN_FC_STYPE_DEAUTH) nlmode=3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=0
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=0 wait=0 no_cck=0 no_ack=0 offchanok=0
CMD_FRAME - hexdump(len=26): c0 00 00 00 ff ff ff ff ff ff f0 03 8c 4a
64 fd f0 03 8c 4a 64 fd 00 00 03 00
nl80211: Frame command failed: ret=-22 (Invalid argument) (freq=0 wait=0)
hostapd_free_hapd_data: Interface ap1 wasn't started
hostapd_deinit_driver: driver=0x558e6f5cf9c0 drv_priv=0x558e70e625e0
-> hapd_deinit
nl80211: Remove monitor interface: refcount=0
nl80211: Remove beacon (ifindex=8)
netlink: Operstate: ifindex=8 linkmode=0 (kernel-control), operstate=6
(IF_OPER_UP)
nl80211: Set mode ifindex 8 iftype 2 (STATION)
nl80211: Teardown AP(ap1) - device_ap_sme=0 use_monitor=0
nl80211: Unsubscribe mgmt frames handle 0x8888dd06f86e8559 (AP teardown)
hostapd_deinit_driver:bss[0]->drv_priv=0x558e70e625e0
hostapd_cleanup_iface_partial(0x558e70e603c0)
Interface ap1 disabled
ap1: interface state DISABLED->DISABLED
hostapd_interface_deinit_free(0x558e70e603c0)
hostapd_interface_deinit_free: num_bss=1 conf->num_bss=1
hostapd_interface_deinit(0x558e70e603c0)
hostapd_bss_deinit: deinit bss ap1
hostapd_cleanup(hapd=0x558e70e616e0 (ap1))
hostapd_free_hapd_data: Interface ap1 wasn't started
hostapd_interface_deinit_free: driver=0x558e6f5cf9c0 drv_priv=(nil) ->
hapd_deinit
hostapd_interface_free(0x558e70e603c0)
hostapd_interface_free: free hapd 0x558e70e616e0
hostapd_cleanup_iface(0x558e70e603c0)
hostapd_cleanup_iface_partial(0x558e70e603c0)
hostapd_cleanup_iface: free iface=0x558e70e603c0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
