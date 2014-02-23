Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22a.google.com ([2a00:1450:400c:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHgOk-0000R3-GM
 for ath10k@lists.infradead.org; Sun, 23 Feb 2014 21:15:43 +0000
Received: by mail-we0-f170.google.com with SMTP id w62so4118049wes.1
 for <ath10k@lists.infradead.org>; Sun, 23 Feb 2014 13:15:19 -0800 (PST)
Received: from [192.168.1.22] (178-116-9-163.access.telenet.be.
 [178.116.9.163])
 by mx.google.com with ESMTPSA id ha1sm36416954wjc.23.2014.02.23.13.15.18
 for <ath10k@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Sun, 23 Feb 2014 13:15:18 -0800 (PST)
Message-ID: <530A64E5.2040401@intec.ugent.be>
Date: Sun, 23 Feb 2014 22:15:17 +0100
From: Bart Jooris <bart.jooris@gmail.com>
MIME-Version: 1.0
Subject: nl80211: Failed to set channel
References: <00ea01cee403$5331f1e0$f995d5a0$@sparklan.com>
 <00d101cee597$e8c57480$ba505d80$@sparklan.com>
 <52A592B7.9000806@intec.ugent.be>
 <006301cef71c$d850ec10$88f2c430$@sparklan.com>
 <52A98706.7080907@intec.ugent.be>
 <008d01cef722$2a9c05e0$7fd411a0$@sparklan.com>
 <52A9DEF9.8080305@intec.ugent.be>
 <012e01cef7e0$99017e70$cb047b50$@sparklan.com>
 <52AACFB9.8080901@intec.ugent.be>
 <006301cefa3c$44c07b50$ce4171f0$@sparklan.com>
 <52AEC26B.2060400@intec.ugent.be>
 <007f01cefa41$8a940de0$9fbc29a0$@sparklan.com>
 <52AEE61F.5030505@intec.ugent.be>
 <006b01cefacb$6c0b2d60$44218820$@sparklan.com>
 <52B00B10.3050300@intec.ugent.be>
 <004b01cefb9d$04a543e0$0defcba0$@sparklan.com>
 <52B2AE75.9050206@intec.ugent.be>
 <00df01cf0090$05944f10$10bced30$@sparklan.com>
 <52B9672E.9000701@intec.ugent.be>
 <008c01cf012e$e59563d0$b0c02b70$@sparklan.com>
In-Reply-To: <008c01cf012e$e59563d0$b0c02b70$@sparklan.com>
Reply-To: Bart.Jooris@intec.ugent.be
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

Dear,

I'm currently experimenting with the WPEA-351AC Sparklan cards but I'm
unable to set up an 802.11 ac link.

I followed the instructions on:
http://wireless.kernel.org/en/users/Drivers/ath10k/configuration
and ended up with an "*Could not set channel for kernel driver*" when
running hostapd.

I Googled _ath10k "nl80211: Failed to set channel"_ and found this link
<http://www.google.be/url?q=http://blog.gmane.org/gmane.linux.kernel.wireless.general/page%3D73&sa=U&ei=hl4KU8meJuaBywP-hIGACA&ved=0CCAQFjAA&usg=AFQjCNF7b2XIZ8mhtPS2TY73OzgcFxlsLw>.
So it seems that at least some one else has the same problem, but
unfortunately the server above gave up :-(
I'm not sure that I am on the right list, but maybe someone can give the
right direction?

In the mean time I'm building linux-3.13.5

Thanks in advance,

Best regards,

Bart

This is my config:

hardware:
DSS-1300 <http://www.cartft.com/catalog/il/1566> - Intel(R) Core(TM)
i5-2540M CPU @ 2.60GHz - 8GB RAM - SSD 64GB

OS:
Ubuntu 13.10 with networkmanager in off state.

some commands:

    bjooris@DSS-1300-1:~/hostap/hostapd$ sudo lspci -k | grep -A 3 -i
    "*Wireless*"
    03:00.0 Network controller: Qualcomm Atheros QCA988x 802.11ac
    Wireless Network Adapter
    Kernel driver in use: ath10k_pci


    bjooris@DSS-1300-1:~/hostap/hostapd$ modinfo *ath10k_pci*
    filename:
    /lib/modules/3.11.0-12-generic/kernel/drivers/net/wireless/ath/ath10k/ath10k_pci.ko
    firmware: ath10k/QCA988X/hw2.0/board.bin
    firmware: ath10k/QCA988X/hw2.0/otp.bin
    firmware: ath10k/QCA988X/hw2.0/firmware.bin
    firmware: ath10k/QCA988X/hw1.0/board.bin
    firmware: ath10k/QCA988X/hw1.0/otp.bin
    firmware: ath10k/QCA988X/hw1.0/firmware.bin
    license: Dual BSD/GPL
    description: Driver support for Atheros QCA988X PCIe devices
    author: Qualcomm Atheros
    srcversion: 851066A82059149AA86F04E
    alias: pci:v0000168Cd0000003Csv*sd*bc*sc*i*
    alias: pci:v0000168Cd0000ABCDsv*sd*bc*sc*i*
    depends: ath10k_core
    intree: Y
    vermagic: 3.11.0-12-generic SMP mod_unload modversions
    parm: ath10k_target_ps:Enable ath10k Target (SoC) PS option (uint)



    bjooris@DSS-1300-1:~/hostap/hostapd$ modinfo *ath10k_core*
    filename:
    /lib/modules/3.11.0-12-generic/kernel/drivers/net/wireless/ath/ath10k/ath10k_core.ko
    license: Dual BSD/GPL
    description: Core module for QCA988X PCIe devices.
    author: Qualcomm Atheros
    srcversion: 2018AB1EB57597874B1D026
    depends: cfg80211,mac80211,ath
    intree: Y
    vermagic: 3.11.0-12-generic SMP mod_unload modversions
    parm: debug_mask:Debugging mask (uint)
    parm: uart_print:Uart target debugging (bool)
    parm: p2p:Enable ath10k P2P support (uint)



    bjooris@DSS-1300-1:~/hostap/hostapd$ .*/hostapd -v*
    hostapd v2.2-devel
    User space daemon for IEEE 802.11 AP management,
    IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator
    Copyright (c) 2002-2014, Jouni Malinen <j@w1.fi> and contributors


    bjooris@DSS-1300-1:~/hostap/hostapd$*cat 80211ac_test.conf *
    interface=wlan0
    driver=nl80211
    ssid=atk10k_80211AC
    hw_mode=a
    channel=44
    #country_code=FI
    #ieee80211d=1
    #ieee80211h=1
    ht_capab=[HT40+]
    ieee80211n=1
    *ieee80211ac=1*
    vht_oper_chwidth=1
    vht_oper_centr_freq_seg0_idx=42



    bjooris@DSS-1300-1:~/hostap/hostapd$ *sudo ./hostapd
    ./80211ac_test.conf -dddd*
    random: Trying to read entropy from /dev/random
    Configuration file: ./80211ac_test.conf
    nl80211: Could not add multicast membership for vendor events: -2
    (No such file or directory)
    rfkill: initial event: idx=0 type=1 op=0 soft=0 hard=0
    nl80211: Supported cipher 00-0f-ac:1
    nl80211: Supported cipher 00-0f-ac:5
    nl80211: Supported cipher 00-0f-ac:2
    nl80211: Supported cipher 00-0f-ac:4
    nl80211: Supported cipher 00-0f-ac:6
    nl80211: Using driver-based off-channel TX
    nl80211: Use separate P2P group interface (driver advertised support)
    nl80211: interface wlan0 in phy phy0
    nl80211: Set mode ifindex 4 iftype 3 (AP)
    nl80211: Setup AP(wlan0) - device_ap_sme=0 use_monitor=0
    nl80211: Subscribe to mgmt frames with AP handle 0x21d8430
    nl80211: Register frame type=0xb0 nl_handle=0x21d8430 match=
    nl80211: Register frame type=0x0 nl_handle=0x21d8430 match=
    nl80211: Register frame type=0x20 nl_handle=0x21d8430 match=
    nl80211: Register frame type=0xa0 nl_handle=0x21d8430 match=
    nl80211: Register frame type=0xc0 nl_handle=0x21d8430 match=
    nl80211: Register frame type=0xd0 nl_handle=0x21d8430 match=
    nl80211: Register frame type=0x40 nl_handle=0x21d8430 match=
    nl80211: Add own interface ifindex 4
    phy: phy0
    BSS count 1, BSSID mask 00:00:00:00:00:00 (0 bits)
    nl80211: Regulatory information - country=FI
    nl80211: 2402-2482 @ 40 MHz 20 mBm
    nl80211: 5170-5250 @ 40 MHz 20 mBm
    nl80211: 5250-5330 @ 40 MHz 20 mBm
    nl80211: 5490-5710 @ 40 MHz 27 mBm
    nl80211: 57240-65880 @ 2160 MHz 40 mBm
    Allowed channel: mode=2 chan=36 freq=5180 MHz max_tx_power=20 dBm
    Allowed channel: mode=2 chan=40 freq=5200 MHz max_tx_power=20 dBm
    Allowed channel: mode=2 chan=44 freq=5220 MHz max_tx_power=20 dBm
    Allowed channel: mode=2 chan=48 freq=5240 MHz max_tx_power=20 dBm
    hw vht capab: 0x338001b2, conf vht capab: 0x0
    wlan0: interface state UNINITIALIZED->HT_SCAN
    Scan for neighboring BSSes prior to enabling 40 MHz channel
    40 MHz affected channel range: [5210,5250] MHz
    wlan0: nl80211: scan request
    nl80211: Scan frequency 5220 MHz
    nl80211: Scan frequency 5240 MHz
    Scan requested (ret=0) - scan timeout 10 seconds
    Interface initialization will be completed in a callback
    ctrl_iface not configured!
    RTM_NEWLINK: ifi_index=4 ifname=wlan0 operstate=2 linkmode=0
    ifi_flags=0x1003 ([UP])
    nl80211: Event message available
    nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for wlan0
    wlan0: nl80211: Scan trigger
    wlan0: Event SCAN_STARTED (49) received
    Unknown event 49
    nl80211: Beacon event message available
    wlan0: Event RX_MGMT (20) received
    Unknown Broadcom information element ignored (type=52 len=26)
    unknown vendor specific information element ignored (vendor OUI
    00:13:92 len=8)
    Add randomness: count=1 entropy=0
    random pool - hexdump(len=128): [REMOVED]
    random_mix_pool - hexdump(len=16): [REMOVED]
    random_mix_pool - hexdump(len=12): [REMOVED]
    random pool - hexdump(len=128): [REMOVED]
    nl80211: Event message available
    nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for wlan0
    wlan0: nl80211: New scan results available
    nl80211: Scan included frequencies: 5220 5240
    wlan0: Event SCAN_RESULTS (3) received
    nl80211: Received scan results (1 BSSes)
    Unknown Broadcom information element ignored (type=52 len=26)
    unknown vendor specific information element ignored (vendor OUI
    00:13:92 len=8)
    Unknown Broadcom information element ignored (type=52 len=26)
    unknown vendor specific information element ignored (vendor OUI
    00:13:92 len=8)
    HT40: control channel: 44 secondary channel: 48
    Completing interface initialization
    Mode: IEEE 802.11a Channel: 44 Frequency: 5220 MHz
    DFS 0 channels required radar detection
    nl80211: Set freq 5220 (ht_enabled=1, vht_enabled=1, bandwidth=80
    MHz, cf1=5210 MHz, cf2=0 MHz)
    nl80211: Failed to set channel (freq=5220): -22 (Invalid argument)
    *Could not set channel for kernel driver*
    RTM_NEWLINK: ifi_index=4 ifname=wlan0 wext ifi_flags=0x1003 ([UP])
    random: Got 9/20 bytes from /dev/random



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
