Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22d.google.com ([2607:f8b0:400c:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfKoa-0004qF-PR
 for ath10k@lists.infradead.org; Wed, 30 Apr 2014 03:04:09 +0000
Received: by mail-vc0-f173.google.com with SMTP id ik5so1443711vcb.32
 for <ath10k@lists.infradead.org>; Tue, 29 Apr 2014 20:03:46 -0700 (PDT)
MIME-Version: 1.0
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 29 Apr 2014 23:03:26 -0400
Message-ID: <CAHqTa-31TAb=9+xyPzBVcEiipnN0_uV8mzSpEBD_sJVS1RDXZg@mail.gmail.com>
Subject: ath10k fails to recover from simulated firmware crash in AP mode
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
To: ath10k <ath10k@lists.infradead.org>

This is on a 3.2.26 kernel, mindspeed c2000 processor (ARMv7l), using
backports-v3.15-rc1 with today's kvalo/ath-next merged in (ie. commit
d9bc4b9b69 from Apr 23).

Steps:
- modprobe ath10k_pci reset_mode=1  (this hardware crashes if you cold reset it)
- start hostapd (40 MHz channel in this case)
- do not connect any clients
- echo hard >/sys/kernel/debug/ieee80211/*/ath10k/simulate_fw_crash

Expected:
- Device recovers from firmware crash

Actual:
- Suspicious messages suggesting the driver did not shut down properly
and/or the firmware did not recover using warm reset.


<6>[  117.335666] ath10k: simulating hard firmware crash
<3>[  117.335866] ath10k: firmware crashed!
<3>[  117.339767] ath10k: hardware name qca988x hw2.0 version 0x4100016c
<3>[  117.346162] ath10k: firmware version: 10.1.467.2-1
<3>[  117.352022] ath10k: target register Dump Location: 0x00401930
<3>[  117.358820] ath10k: target Register Dump
<3>[  117.362759] ath10k: [00]: 0x4100016C 0x00000000 0x0097F8D2 0x00000000
<3>[  117.369240] ath10k: [04]: 0x00000000 0x00000000 0x00000000 0x00000000
<3>[  117.375722] ath10k: [08]: 0x00000000 0x00000000 0x00000000 0x00000000
<3>[  117.382186] ath10k: [12]: 0x00000000 0x00000000 0x00000000 0x00000000
<3>[  117.388656] ath10k: [16]: 0x00000000 0x00000000 0x00000000 0x0097F8D2
<3>[  117.395126] ath10k: [20]: 0x00000000 0x00401930 0x00000000 0x00000000
<3>[  117.401589] ath10k: [24]: 0x00000000 0x00000000 0x00000000 0x00000000
<3>[  117.408055] ath10k: [28]: 0x00000000 0x00000000 0x00000000 0x00000000
<3>[  117.414523] ath10k: [32]: 0x00000000 0x00000000 0x00000000 0x00000000
<3>[  117.420987] ath10k: [36]: 0x00000000 0x00000000 0x00000000 0x00000000
<3>[  117.427456] ath10k: [40]: 0x00000000 0x00000000 0x00000000 0x00000000
<3>[  117.433924] ath10k: [44]: 0x00000000 0x00000000 0x00000000 0x00000000
<3>[  117.440387] ath10k: [48]: 0x00000000 0x00000000 0x00000000 0x00000000
<3>[  117.446854] ath10k: [52]: 0x00000000 0x00000000 0x00000000 0x00000000
<3>[  117.453316] ath10k: [56]: 0x00000000 0x00000000 0x00000000 0x00000000
<4>[  120.453939] ath10k: failed to put down monitor vdev 1: -11
<4>[  123.453987] ath10k: failed to to request monitor vdev 1 stop: -11
<4>[  128.454241] ath10k: failed to synchronise monitor vdev 1: -110
<4>[  128.460126] ath10k: failed to stop monitor vdev: -110
<4>[  131.463251] ath10k: failed to request wmi monitor vdev 1 removal: -11
<4>[  131.469722] ath10k: failed to delete monitor vdev: -11
<6>[  132.003203] ieee80211 phy2: Hardware restart was requested
<4>[  132.263439] ath10k: device has crashed during init
<3>[  132.268259] ath10k: failed to wait for target to init: -70
<4>[  132.533086] ath10k: failed to power up target using warm reset: -70
<3>[  132.539385] ath10k: Could not init hif: -70
<3>[  136.970998] hostapd-wlan1:
<7>[  137.283716] hostapd-wlan1: nl80211: Ignore event for foreign ifindex 10
<7>[  137.393819] hostapd-wlan1: nl80211: Ignore dellink event for
foreign ifindex 10
<7>[  137.487964] hostapd-wlan1: nl80211: Ignore event for foreign ifindex 14
<7>[  137.488524] hostapd-wlan1: nl80211: Ignore event for foreign ifindex 14
<7>[  137.575623] hostapd-wlan1: nl80211: Ignore event for foreign ifindex 14
<7>[  137.613597] hostapd-wlan1: nl80211: Ignore dellink event for
foreign ifindex 14
<6>[  137.717616] br0: port 3(wlan0) entering forwarding state
<7>[  137.718248] hostapd-wlan1: nl80211: Ignore event for foreign ifindex 5
<7>[  137.718272] hostapd-wlan1: nl80211: Ignore event for foreign ifindex 5
<7>[  137.718286] hostapd-wlan1: nl80211: Ignore event for foreign ifindex 5
<7>[  144.206467] *LOG_UPLOAD_START*
<4>[  184.804735] ath10k: failed to set beacon mode for vdev 0: -108
<4>[  184.810727] ath10k: failed to recalculate rts/cts prot for vdev 0: -108
<4>[  184.817426] ath10k: failed to set preamble for vdev 0: -108
<7>[  184.823188] hostapd-wlan1: OLBC HT not detected anymore
<7>[  184.823209] hostapd-wlan1: hostapd_ht_operation_update current
operation mode=0x15
<7>[  184.823226] hostapd-wlan1: hostapd_ht_operation_update new
operation mode=0x4 changes=2
<7>[  184.823240] hostapd-wlan1: nl80211: Set beacon (beacon_set=1)
<7>[  184.823258] hostapd-wlan1: nl80211: Beacon head -
hexdump(len=69): 80 00 00 00 ff ff ff ff ff ff 00 03 07 12 22 01 00 03
07 12 22 01 00 00 00 00 00 00 00 00 00 00 64 00 01 00 00 12 41 56 45
52 59 5f 42 75 31 5f 54 65 73 74 57 69 66 69 01 08 8c 12 98 24 b0 48
60 6c 03 01 95
<7>[  184.823298] hostapd-wlan1: nl80211: Beacon tail -
hexdump(len=123): 07 0c 55 53 20 24 04 11 34 04 17 95 05 1e 2d 1a 0e
00 1b ff ff ff 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00
00 00 3d 16 95 05 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 7f 08 00 00 00 00 00 00 00 40 bf 0c b2 01 80 33 ea ff 00 00
ea ff 00 00 c0 05 01 9b 00 fc ff dd 18 00 50 f2 02 01 01 00 00 03 a4
00 00 27 a4 00 00 42 43 5d 00 62 32 2e 00
<7>[  184.823333] hostapd-wlan1: nl80211: ifindex=12
<7>[  184.823344] hostapd-wlan1: nl80211: beacon_int=100
<7>[  184.823355] hostapd-wlan1: nl80211: dtim_period=2
<7>[  184.823366] hostapd-wlan1: nl80211: ssid - hexdump_ascii(len=18):
<7>[  184.823379] hostapd-wlan1:      41 56 45 52 59 5f 42 75 31 5f 54
65 73 74 57 69   AVERY_Bu1_TestWi
<7>[  184.823393] hostapd-wlan1:      66 69
                 fi
<7>[  184.823407] hostapd-wlan1: nl80211: hidden SSID not in use
<7>[  184.823418] hostapd-wlan1: nl80211: privacy=0
<7>[  184.823429] hostapd-wlan1: nl80211: auth_algs=0x1
<7>[  184.823439] hostapd-wlan1: nl80211: wpa_version=0x0
<7>[  184.823456] hostapd-wlan1: nl80211: key_mgmt_suites=0x2
<7>[  184.823468] hostapd-wlan1: nl80211: pairwise_ciphers=0x1
<7>[  184.823480] hostapd-wlan1: nl80211: group_cipher=0x1
<7>[  184.823492] hostapd-wlan1: nl80211: beacon_ies -
hexdump(len=10): 7f 08 00 00 00 00 00 00 00 40
<7>[  184.823506] hostapd-wlan1: nl80211: proberesp_ies -
hexdump(len=10): 7f 08 00 00 00 00 00 00 00 40
<7>[  184.823521] hostapd-wlan1: nl80211: assocresp_ies -
hexdump(len=10): 7f 08 00 00 00 00 00 00 00 40

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
