Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.sablalik.us ([66.80.92.144])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wux64-0001NH-G0
 for ath10k@lists.infradead.org; Thu, 12 Jun 2014 04:58:45 +0000
Date: Thu, 12 Jun 2014 00:58:05 -0400
Subject: Re: basic help request
From: Peter Sabat <pete@sablalik.us>
Message-ID: <CFBEA45B.B25BF%pete@sablalik.us>
In-Reply-To: <5399261C.9010906@candelatech.com>
Mime-version: 1.0
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

So I grabbed it again - I just did a wget before, maybe something got
garbled there.


Thanks again for the help though.




But we have some progress it seems:

[Thu Jun 12 00:28:49 2014] ath10k_pci 0000:03:00.0: BAR 0: assigned [mem
0x90400000-0x905fffff 64bit]
[Thu Jun 12 00:28:49 2014] ath10k_pci 0000:03:00.0: irq 116 for MSI/MSI-X
[Thu Jun 12 00:28:49 2014] ath10k: pci irq MSI
[Thu Jun 12 00:28:50 2014] ath10k: qca988x hw2.0 (0x4100016c) fw
10.1.467.2-1 api 2 htt 2.1
[Thu Jun 12 00:28:51 2014] ath: EEPROM regdomain: 0x0
[Thu Jun 12 00:28:51 2014] ath: EEPROM indicates default country code
should be used
[Thu Jun 12 00:28:51 2014] ath: doing EEPROM country->regdmn map search
[Thu Jun 12 00:28:51 2014] ath: country maps to regdmn code: 0x3a
[Thu Jun 12 00:28:51 2014] ath: Country alpha2 being used: US
[Thu Jun 12 00:28:51 2014] ath: Regpair used: 0x3a



additionally :

root@server2:~/build/ath-master/drivers/net/wireless/ath/ath10k# hostapd
/etc/hostapd/test.conf
Configuration file: /etc/hostapd/test.conf
wlan0: interface state UNINITIALIZED->COUNTRY_UPDATE
ACS: Automatic channel selection started, this may take a bit
wlan0: interface state COUNTRY_UPDATE->ACS
wlan0: ACS-STARTED
wlan0: ACS-COMPLETED freq=5220 channel=44
wlan0: interface state ACS->HT_SCAN
Using interface wlan0 with hwaddr 04:f0:21:0c:a6:5c and ssid "ath10k-test"
wlan0: interface state HT_SCAN->ENABLED
wlan0: AP-ENABLED




info still shows old FW though :


root@server2:/lib/firmware/ath10k/QCA988X/hw2.0# modinfo ath10k_pci
filename:       
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






But still no SSID visible!!  argh



Have the .conf at bare minimum

ctrl_interface=/var/run/hostapd
country_code=US
bridge=br0
interface=wlan0
driver=nl80211
ssid=ath10k-test
hw_mode=a
channel=44
ieee80211n=1






root@server2:/etc/hostapd# hostapd -d /etc/hostapd/test2.conf
random: Trying to read entropy from /dev/random
Configuration file: /etc/hostapd/test2.conf
rfkill: initial event: idx=6 type=1 op=0 soft=0 hard=0
nl80211: Supported cipher 00-0f-ac:1
nl80211: Supported cipher 00-0f-ac:5
nl80211: Supported cipher 00-0f-ac:2
nl80211: Supported cipher 00-0f-ac:4
nl80211: Supported cipher 00-0f-ac:6
nl80211: Using driver-based off-channel TX
nl80211: interface wlan0 in phy phy6
nl80211: Set mode ifindex 10 iftype 3 (AP)
nl80211: Setup AP(wlan0) - device_ap_sme=0 use_monitor=0
nl80211: Subscribe to mgmt frames with AP handle 0x1a0a480
nl80211: Register frame type=0xb0 nl_handle=0x1a0a480 match=
nl80211: Register frame type=0x0 nl_handle=0x1a0a480 match=
nl80211: Register frame type=0x20 nl_handle=0x1a0a480 match=
nl80211: Register frame type=0xa0 nl_handle=0x1a0a480 match=
nl80211: Register frame type=0xc0 nl_handle=0x1a0a480 match=
nl80211: Register frame type=0xd0 nl_handle=0x1a0a480 match=
nl80211: Register frame type=0x40 nl_handle=0x1a0a480 match=
nl80211: Add own interface ifindex 4
nl80211: if_indices[16]: 4
nl80211: Add own interface ifindex 10
nl80211: if_indices[16]: 4 10
nl80211: Adding interface wlan0 into bridge br0
phy: phy6
BSS count 1, BSSID mask 00:00:00:00:00:00 (0 bits)
wlan0: interface state UNINITIALIZED->COUNTRY_UPDATE
Previous country code US, new country code US
nl80211: Regulatory information - country=US
nl80211: 2402-2472 @ 40 MHz 30 mBm
nl80211: 5170-5250 @ 80 MHz 17 mBm
nl80211: 5250-5330 @ 80 MHz 23 mBm (DFS)
nl80211: 5735-5835 @ 80 MHz 30 mBm
nl80211: 57240-63720 @ 2160 MHz 40 mBm
hw vht capab: 0x338001b2, conf vht capab: 0x0
Completing interface initialization
Mode: IEEE 802.11a  Channel: 44  Frequency: 5220 MHz
DFS 0 channels required radar detection
nl80211: Set freq 5220 (ht_enabled=1, vht_enabled=0, bandwidth=20 MHz,
cf1=5220 MHz, cf2=0 MHz)
RATE[0] rate=60 flags=0x1
RATE[1] rate=90 flags=0x0
RATE[2] rate=120 flags=0x1
RATE[3] rate=180 flags=0x0
RATE[4] rate=240 flags=0x1
RATE[5] rate=360 flags=0x0
RATE[6] rate=480 flags=0x0
RATE[7] rate=540 flags=0x0
hostapd_setup_bss(hapd=0x1a099d0 (wlan0), first=1)
wlan0: Flushing old station entries
nl80211: flush -> DEL_STATION wlan0 (all)
wlan0: Deauthenticate all stations
nl80211: send_mlme - noack=0 freq=0 no_cck=0 offchanok=0 wait_time=0
fc=0xc0 nlmode=3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=5220
nl80211: send_frame -> send_frame_cmd
nl80211: Frame command failed: ret=-16 (Device or resource busy)
(freq=5220 wait=0)
wpa_driver_nl80211_set_key: ifindex=10 (wlan0) alg=0 addr=(nil) key_idx=0
set_tx=0 seq_len=0 key_len=0
wpa_driver_nl80211_set_key: ifindex=10 (wlan0) alg=0 addr=(nil) key_idx=1
set_tx=0 seq_len=0 key_len=0
wpa_driver_nl80211_set_key: ifindex=10 (wlan0) alg=0 addr=(nil) key_idx=2
set_tx=0 seq_len=0 key_len=0
wpa_driver_nl80211_set_key: ifindex=10 (wlan0) alg=0 addr=(nil) key_idx=3
set_tx=0 seq_len=0 key_len=0
Using interface wlan0 with hwaddr 04:f0:21:0c:a6:5c and ssid "ath10k-test"
nl80211: Set beacon (beacon_set=0)
nl80211: Beacon head - hexdump(len=62): 80 00 00 00 ff ff ff ff ff ff 04
f0 21 0c a6 5c 04 f0 21 0c a6 5c 00 00 00 00 00 00 00 00 00 00 64 00 01 00
00 0b 61 74 68 31 30 6b 2d 74 65 73 74 01 08 8c 12 98 24 b0 48 60 6c 03 01
2c
nl80211: Beacon tail - hexdump(len=88): 2d 1a 0c 00 1b ff ff ff 00 00 00
00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 2c 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 00 00 00 00 00 00 00
40 dd 18 00 50 f2 02 01 01 00 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32
2f 00
nl80211: ifindex=10
nl80211: beacon_int=100
nl80211: dtim_period=2
nl80211: ssid - hexdump_ascii(len=11):
     61 74 68 31 30 6b 2d 74 65 73 74                  ath10k-test
nl80211: hidden SSID not in use
nl80211: privacy=0
nl80211: auth_algs=0x3
nl80211: wpa_version=0x0
nl80211: key_mgmt_suites=0x2
nl80211: pairwise_ciphers=0x1
nl80211: group_cipher=0x1
nl80211: beacon_ies - hexdump(len=10): 7f 08 00 00 00 00 00 00 00 40
nl80211: proberesp_ies - hexdump(len=10): 7f 08 00 00 00 00 00 00 00 40
nl80211: assocresp_ies - hexdump(len=10): 7f 08 00 00 00 00 00 00 00 40
nl80211: Set wlan0 operstate 0->1 (UP)
netlink: Operstate: ifindex=10 linkmode=-1 (no change), operstate=6
(IF_OPER_UP)
wlan0: interface state COUNTRY_UPDATE->ENABLED
wlan0: AP-ENABLED 
wlan0: Setup of interface done.
ctrl_iface not configured!
random: Got 18/20 bytes from /dev/random
RTM_NEWLINK: ifi_index=10 ifname=wlan0 operstate=2 linkmode=0
ifi_flags=0x1003 ([UP])
RTM_NEWLINK: ifi_index=10 ifname=wlan0 operstate=2 linkmode=0
ifi_flags=0x1003 ([UP])
RTM_NEWLINK: ifi_index=10 ifname=wlan0 operstate=2 linkmode=0 master=4
ifi_flags=0x1003 ([UP])
RTM_NEWLINK: ifi_index=10 ifname=wlan0 master=4 operstate=2
ifi_flags=0x1003 ([UP])
nl80211: Add ifindex 4 for bridge br0
nl80211: Add own interface ifindex 4
nl80211: ifindex 4 already in the list
RTM_NEWLINK: ifi_index=4 ifname=br0 operstate=6 linkmode=0
ifi_flags=0x11043 ([UP][RUNNING][LOWER_UP])
wlan0: Event INTERFACE_STATUS (5) received
Unknown event 5
RTM_NEWLINK: ifi_index=10 ifname=wlan0 master=4 operstate=6
ifi_flags=0x11043 ([UP][RUNNING][LOWER_UP])
nl80211: Add ifindex 4 for bridge br0
nl80211: Add own interface ifindex 4
nl80211: ifindex 4 already in the list
RTM_NEWLINK: ifi_index=10 ifname=wlan0 master=4 operstate=6
ifi_flags=0x11043 ([UP][RUNNING][LOWER_UP])
nl80211: Add ifindex 4 for bridge br0
nl80211: Add own interface ifindex 4
nl80211: ifindex 4 already in the list
RTM_NEWLINK: ifi_index=10 ifname=wlan0 master=4 operstate=6
ifi_flags=0x11043 ([UP][RUNNING][LOWER_UP])
nl80211: Add ifindex 4 for bridge br0
nl80211: Add own interface ifindex 4
nl80211: ifindex 4 already in the list
RTM_NEWLINK: ifi_index=10 ifname=wlan0 operstate=6 linkmode=0 master=4
ifi_flags=0x11043 ([UP][RUNNING][LOWER_UP])
random: Got 2/2 bytes from /dev/random








On 6/12/14, 12:01 AM, "Ben Greear" <greearb@candelatech.com> wrote:

>
>
>On 06/11/2014 04:46 PM, Peter Sabat wrote:
>> As instructed  :)
>> 
>> 
>> 
>> -rwxr-xr-x 1 root root  24347 Jun 11 19:32 firmware-2.bin
>> -rwxr-xr-x 1 root root   2116 Jan 30 08:41 board.bin
>> -rwxr-xr-x 1 root root 249093 Jan 30 08:41 firmware.bin
>> -rwxr-xr-x 1 root root   5402 Jan 30 08:41 otp.bin
>
>That firmware-2.bin looks way too small, should be around 200kbytes.
>
>Where did you get it from?
>
>Thanks,
>Ben
>
>-- 
>Ben Greear <greearb@candelatech.com>
>Candela Technologies Inc  http://www.candelatech.com
>
>_______________________________________________
>ath10k mailing list
>ath10k@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/ath10k




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
