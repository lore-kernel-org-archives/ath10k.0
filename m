Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from universe.cdot.in ([49.128.111.121])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cedoL-0006Yr-VJ
 for ath10k@lists.infradead.org; Fri, 17 Feb 2017 08:22:41 +0000
Received: from [192.168.25.86] (kavitha-H55M-S2.cdotb.ernet.in [192.168.25.86])
 by universe.cdot.in (8.14.4/8.13.1) with ESMTP id v1H8GcrB008865
 for <ath10k@lists.infradead.org>; Fri, 17 Feb 2017 13:46:38 +0530
From: kavitam <kavitam@cdot.in>
Subject: ath10k: MESH points are associated ,but not pinging each other
Message-ID: <23bb1977-84b5-23f7-2637-2016a1d4c864@cdot.in>
Date: Fri, 17 Feb 2017 08:20:23 +0530
MIME-Version: 1.0
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

Hi All,

I have created two mesh points on two different IEEE802.11 system(t1024 
based WiFi AP) using following steps:

$sudo iw phy phy0 interface add mesh0 type mp
$sudo ifconfig mesh0 0.0.0.0 up
$sudo wpa_supplicant -Dnl80211 -B -i mesh0 -c 
/mnt/jffs2/conf/mesh0_encp.conf
$sleep 5
$sudo brctl addif br0 mesh0

Both Mesh points are associated.But  these points are not pinging from 
each other.Follwoing error message has been seen on the serial prompt 
while executing station dump on either of the system :

$sudo iw mesh0 station dump

WARNING: at faaf9548 [verbose debug info unavailable]
Modules linked in: ath10k_pci(O) ath10k_core(O) ath(O) mac80211(O) cfg80211(O) compat(O)
uio_pdrv_genirq
CPU: 0 PID: 2712 Comm: wpa_supplicant Tainted: G           O 3.12.37-rt51+ #23
task: e29764c0 ti: e38d4000 task.ti: e38d4000
NIP: faaf9548 LR: faafddc8 CTR: c06663a0
REGS: e38d5880 TRAP: 0700   Tainted: G           O  (3.12.37-rt51+)
MSR: 00029002 <CE,EE,ME>  CR: 22044444  XER: 20000000

GPR00: faafddc8 e38d5930 e29764c0 ef1e6d20 efa06624 0000000f 0005803c 00200000
GPR08: 00000000 00000005 00000000 05be4900 82044448 10107770 00000000 00000001
GPR16: 00000004 000000f0 0000000b 00000021 101199ee 00000001 e38d5e68 00000008
GPR24: e2cf5c00 ef1e6d20 c5a59600 ef1e6c20 efa06618 efa06624 c5a59600 00000000
NIP [faaf9548] ath10k_install_peer_wep_keys+0x28/0x250 [ath10k_core]
LR [faafddc8] ath10k_station_assoc+0x258/0x430 [ath10k_core]
Call Trace:
[e38d5930] [fab0f658] ath10k_wmi_op_gen_peer_set_param+0x28/0x90 [ath10k_core] (unreliable)
[e38d5960] [faafddc8] ath10k_station_assoc+0x258/0x430 [ath10k_core]
[e38d5ae0] [faafe184] ath10k_sta_state+0x1e4/0x7b0 [ath10k_core]
[e38d5b30] [fa4f87b4] sta_info_move_state+0x274/0x340 [mac80211]
[e38d5b40] [fa5114b8] sta_apply_auth_flags.isra.42+0x88/0x1e0 [mac80211]
[e38d5b60] [fa511c6c] ieee80211_change_station+0x11c/0x320 [mac80211]
[e38d5b90] [f999dcf0] nl80211_set_station+0x290/0x2e0 [cfg80211]
[e38d5c00] [c052148c] genl_rcv_msg+0x23c/0x3f0
[e38d5c50] [c05207f0] netlink_rcv_skb+0x130/0x150
[e38d5c70] [c0521238] genl_rcv+0x38/0x50
[e38d5c80] [c051ffc0] netlink_unicast+0x170/0x1f0
[e38d5cb0] [c0520400] netlink_sendmsg+0x290/0x3b0
[e38d5d00] [c04b8910] sock_sendmsg+0x70/0xb0
[e38d5da0] [c04ba2d0] ___sys_sendmsg.part.29+0x2c0/0x2d0
[e38d5ec0] [c04bb644] __sys_sendmsg+0x54/0xa0
[e38d5f10] [c04bbe78] SyS_socketcall+0x178/0x2b0
[e38d5f40] [c000fb04] ret_from_syscall+0x0/0x3c
--- Exception: c01 at 0xfbf4f6c
     LR = 0xffac1a0
Instruction dump:
91210028 4bfffee4 9421ffd0 7c0802a6 90010034 bf210014 81230038 83430034
81290000 552907fa 2b890001 41de002c <0fe00000> 3bc0ffea 80010034 7fc3f378
---[ end trace 56617f0f443657ab ]---
0 ath10k_pci 0000:01:00.0: failed to install peer wep keys for vdev 0: -22
ath10k_pci 0000:01:00.0: failed to associate station 04:f0:21:1d:77:68 for vdev 0: -22
station dump
Station 04:f0:21:1d:77:68 (on mesh0)
         inactive time:  351 ms
         rx bytes:       2122
         rx packets:     24
         tx bytes:       1196
         tx packets:     8
         tx retries:     0
         tx failed:      0
         signal:         -54 dBm
         signal avg:     -52 dBm
         Toffset:        642048384 us
         tx bitrate:     1.0 MBit/s
         rx bitrate:     1.0 MBit/s
         mesh llid:      0
         mesh plid:      0
         mesh plink:     ESTAB
         mesh local PS mode:     ACTIVE
         mesh peer PS mode:      UNKNOWN
         mesh non-peer PS mode:  ACTIVE

System Details:

Kernel : 3.12 rt 51+ (SDK 1.9)

ath10K driver: backport-4.4.2-1

Ath10K firmware: firmware-5.bin_10.2.4.70.59-2

The ath10k_core driver has been inserted in rawmode while creating mesh 
interface.

Please help me to test Mesh using ath10K driver.

Thanks & Regards,

Kavita




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
