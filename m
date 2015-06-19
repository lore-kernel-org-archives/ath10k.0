Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from bl4ckb0x.de ([5.9.63.241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z5ugg-0007sY-OB
 for ath10k@lists.infradead.org; Fri, 19 Jun 2015 11:42:25 +0000
Received: from mail.bl4ckb0x.com (bl4ckb0x.de
 [IPv6:2a01:4f8:161:64ec:5:9:63:241])
 by bl4ckb0x.de (Postfix) with ESMTPSA id F2B671F400F1
 for <ath10k@lists.infradead.org>; Fri, 19 Jun 2015 13:41:55 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 19 Jun 2015 13:41:55 +0200
From: Conrad Kostecki <ck+ath10k@bl4ckb0x.de>
Subject: Firmware sometimes crashing
Message-ID: <3b21f415743af0507ea089d6b7be83b1@bl4ckb0x.de>
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

Hi!
I am still having many problems with kernel 4.0.x and my two ath10k 
cards.
With Kernel 3.19 and older FW, those problems are gone..

After a fresh start, I have to try a few times,
until finally my cards come up or fail to be started.

With "start", I mean, that the interface cannot be set UP.

[...]
nl80211: Supported cipher 00-0f-ac:1
nl80211: Supported cipher 00-0f-ac:5
nl80211: Supported cipher 00-0f-ac:2
nl80211: Supported cipher 00-0f-ac:4
nl80211: Supported cipher 00-0f-ac:6
nl80211: Using driver-based off-channel TX
nl80211: interface wlp7s0 in phy phy0
nl80211: Set mode ifindex 7 iftype 3 (AP)
nl80211: Failed to set interface 7 to mode 3: -16 (Device or resource 
busy)
nl80211: Try mode change after setting interface down
nl80211: Set mode ifindex 7 iftype 3 (AP)
nl80211: Mode change succeeded while interface is down
Could not set interface wlp7s0 flags (UP): Resource temporarily 
unavailable
nl80211: Failed to set interface up after switching mode
nl80211: Interface mode change to 3 from 3 failed
nl80211: Could not configure driver mode
nl80211: deinit ifname=wlp7s0 disabled_11b_rates=0
nl80211: Remove monitor interface: refcount=0
nl80211: Remove beacon (ifindex=7)
netlink: Operstate: ifindex=7 linkmode=0 (kernel-control), operstate=6 
(IF_OPER_UP)
nl80211: Set mode ifindex 7 iftype 2 (STATION)
nl80211: Teardown AP(wlp7s0) - device_ap_sme=0 use_monitor=0
nl80211 driver initialization failed.
[...]

Logs only show:
[511574.240052] ath10k_pci 0000:07:00.0: failed to set kickout threshold 
on vdev 0: -11
[511574.240060] ath10k_pci 0000:07:00.0: failed to set vdev 0 kickout 
parameters: -11
[511583.240060] ath10k_pci 0000:07:00.0: could not suspend target (-11)

After running 1-2 days, I am getting a lot of:
[511195.093208] ath10k_pci 0000:07:00.0: Spurious quick kickout for STA 
xx:xx:xx:32:ac:4d
[511195.093216] ath10k_pci 0000:07:00.0: Spurious quick kickout for STA 
xx:xx:xx:57:07:1a
[511201.093527] ath10k_warn: 2 callbacks suppressed

After stopping hostapd, the firmware is sometimes crashing:
[511207.691108] ath10k_pci 0000:07:00.0: removing stale peer 
d8:75:33:57:07:1a from vdev_id 0
[511207.691121] ath10k_pci 0000:07:00.0: removing stale peer 
10:68:3f:32:ac:4d from vdev_id 0
[511207.691139] ath10k_pci 0000:07:00.0: received addba event for 
invalid peer_id: 195
[511207.691181] ath10k_pci 0000:07:00.0: peer-unmap-event: unknown peer 
id 195
[511207.691454] ath10k_pci 0000:07:00.0: firmware crashed! (uuid n/a)
[511207.691464] ath10k_pci 0000:07:00.0: qca988x hw2.0 (0x4100016c, 
0x043202ff) fw 10.2-00082-4-2 api 4 htt 2.1 wmi 3 cal otp max_sta 128
[511207.691469] ath10k_pci 0000:07:00.0: debug 0 debugfs 0 tracing 0 dfs 
1 testmode 0
[511207.693497] ath10k_pci 0000:07:00.0: firmware register dump:
[511207.693503] ath10k_pci 0000:07:00.0: [00]: 0x4100016C 0x000015B3 
0x009979A3 0x00955B31
[511207.693509] ath10k_pci 0000:07:00.0: [04]: 0x009979A3 0x00060330 
0x00000017 0x00000000
[511207.693514] ath10k_pci 0000:07:00.0: [08]: 0x0041FDA4 0x0041FA54 
0x00448370 0x004483C0
[511207.693519] ath10k_pci 0000:07:00.0: [12]: 0x00000009 0x00000000 
0x00958360 0x0095836B
[511207.693525] ath10k_pci 0000:07:00.0: [16]: 0x00958080 0x0094085D 
0x00000000 0x00000000
[511207.693530] ath10k_pci 0000:07:00.0: [20]: 0x409979A3 0x0040AC44 
0x00000000 0x573375D8
[511207.693536] ath10k_pci 0000:07:00.0: [24]: 0x8099F6E7 0x0040ACA4 
0x00000000 0xC09979A3
[511207.693541] ath10k_pci 0000:07:00.0: [28]: 0x8099E0A3 0x0040ACC4 
0x0043D0D8 0x0043DB98
[511207.693546] ath10k_pci 0000:07:00.0: [32]: 0x8099F8E6 0x0040ACE4 
0x0043D0D8 0x00000000
[511207.693552] ath10k_pci 0000:07:00.0: [36]: 0x809B38C0 0x0040AD14 
0x00009011 0x0040F258
[511207.693557] ath10k_pci 0000:07:00.0: [40]: 0x809AFD68 0x0040AD94 
0x00400000 0x004166A8
[511207.693562] ath10k_pci 0000:07:00.0: [44]: 0x809BDA75 0x0040ADE4 
0x0040AE08 0x00411D44
[511207.693567] ath10k_pci 0000:07:00.0: [48]: 0x809486FA 0x0040AE04 
0x00000001 0x00000000
[511207.693573] ath10k_pci 0000:07:00.0: [52]: 0x80948E2C 0x0040AEA4 
0x0041E424 0x00412350
[511207.693578] ath10k_pci 0000:07:00.0: [56]: 0x809BCF0D 0x0040AEC4 
0x0041E424 0x00000001
[511207.693643] ath10k_pci 0000:07:00.0: could not suspend target (-108)
[511207.781887] ath10k_pci 0000:07:00.0: cannot restart a device that 
hasn't been started

The problem seems not to be hostap,
as simple commands like ifconfig up/down are also not working and can 
(not always!) crash firmware.

Any Ideas?

Conrad

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
