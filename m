Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22b.google.com ([2607:f8b0:400c:c01::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wg1jX-00042O-CD
 for ath10k@lists.infradead.org; Fri, 02 May 2014 00:53:48 +0000
Received: by mail-ve0-f171.google.com with SMTP id jy13so4743128veb.30
 for <ath10k@lists.infradead.org>; Thu, 01 May 2014 17:53:25 -0700 (PDT)
MIME-Version: 1.0
From: Avery Pennarun <apenwarr@gmail.com>
Date: Thu, 1 May 2014 20:53:05 -0400
Message-ID: <CAHqTa-2AK0czy-dS5buc+H-0vzamS0w5+Hkr8vootG2fC-9SjQ@mail.gmail.com>
Subject: "peer-unmap-event: unknown peer id 2" and kernel panic
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

This is with 3.2.26 kernel, mindspeed c2000 (armv7l) processor, and
backports built using kvalo's ath-next branch, with commit
v3.15-rc1-237-gd9bc4b9, firmware 10.1.467.2-1.

Anybody else seeing errors like this?  Anything I should check for?

This one happened during boot.  The driver was already loaded at the
time; this crash happened instantly upon loading hostapd.  It doesn't
happen every time.  I don't know how we'd have a peer already
registered at the time (or what peer-unmap-event is).

[   23.939344] ath10k: peer-unmap-event: unknown peer id 2
[   24.202125] Internal error: Oops - undefined instruction: 0 [#1] SMP
[   24.208510] Modules linked in: ctr ccm nf_conntrack_netlink
auto_bridge(O) fci(O) nfnetlink ath9k_htc(O) mwifiex_usb(O) mwifiex(O)
ath10k_pci(O) ath10k_core(O) arc4 ath9k(O) mac80211(O) ath9k_common(O)
ath9k_hw(O) ath(O) cfg80211(O) compat(O) bmoca(O) xt_connmark
ip6table_mangle xt_CLASSIFY iptable_mangle xt_helper ip6t_REJECT
ip6t_LOG nf_conntrack_ipv6 nf_defrag_ipv6 ip6table_filter ip6_tables
nf_nat_rtsp nf_conntrack_rtsp nf_nat_h323 nf_conntrack_h323 nf_nat_irc
nf_conntrack_irc nf_nat_pptp nf_conntrack_pptp nf_conntrack_proto_gre
nf_nat_proto_gre nf_nat_sip nf_conntrack_sip nf_nat_tftp
nf_conntrack_tftp nf_nat_ftp nf_conntrack_ftp ipt_MASQUERADE
ipt_REJECT ipt_LOG xt_limit xt_pkttype xt_conntrack xt_tcpudp
iptable_nat nf_nat nf_conntrack_ipv4 nf_conntrack nf_defrag_ipv4
iptable_filter ip_tables x_tables pfe(O)
[   24.281595] CPU: 1    Tainted: G           O  (3.2.26 #1)
[   24.287033] PC is at 0xbc797ee4
[   24.290194] LR is at skb_release_head_state+0x70/0xf8
[   24.295267] pc : [<bc797ee4>]    lr : [<843114f0>]    psr: 40000013
[   24.295272] sp : bc6f7c58  ip : bc6f7c70  fp : bc6f7c6c
[   24.306791] r10: 00000000  r9 : bc655d5c  r8 : 8454da48
[   24.312033] r7 : 845a53bc  r6 : 00000000  r5 : bc790e40  r4 : bc790e40
[   24.318581] r3 : bc797d60  r2 : 00000000  r1 : 00000000  r0 : 00000000
[   24.325131] Flags: nZcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
[   24.332288] Control: 10c53c7d  Table: 3bae404a  DAC: 00000015
[   24.338054] Process hostapd (pid: 1788, stack limit = 0xbc6f62f0)
[   24.344167] Stack: (0xbc6f7c58 to 0xbc6f8000)
[   24.348538] 7c40:
    bc790e40 bc790e40
[   24.356745] 7c60: bc6f7c84 bc6f7c70 843111d4 8431148c 84577ca4
bc655be0 bc6f7c9c bc6f7c88
[   24.364952] 7c80: 84311384 843111cc bc655be0 0000002e bc6f7cac
bc6f7ca0 8431c138 843112f4
[   24.373158] 7ca0: bc6f7cd4 bc6f7cb0 8332b7f0 8431c100 bc655be0
bc655500 00100100 00200200
[   24.381365] 7cc0: bc655f18 bc655f10 bc6f7cec bc6f7cd8 8332a284
8332b740 00000000 bc655500
[   24.389572] 7ce0: bc6f7d04 bc6f7cf0 83328834 8332a27c 00000000
00000000 bc6f7d3c bc6f7d08
[   24.397778] 7d00: 8332520c 83328804 00000001 bc655f0c bc6f7d10
bc655500 bc655ef8 bd06eab8
[   24.405985] 7d20: bc654c00 00000100 bd06e3a0 bc654b00 bc6f7d54
bc6f7d40 8332531c 83325138
[   24.414192] 7d40: bc654b00 bc65519c bc6f7d74 bc6f7d58 832ab9a4
833252e8 00000000 bc65519c
[   24.422399] 7d60: bc65519c bd06eab8 bc6f7dd4 bc6f7d78 832958ac
832ab92c bc6f7d94 bc6f7d88
[   24.430605] 7d80: bd06e000 00000000 bd06e3a0 60000013 00000001
bc654bb8 bc6f7de4 bc6f7da8
[   24.438811] 7da0: 843343ec 843f65bc bc6f7e00 bd06e000 bc6f7e00
00000001 00001003 00000001
[   24.447017] 7dc0: 00000000 00000001 bc6f7de4 bc6f7dd8 83295960
83295160 bc6f7dfc bc6f7de8
[   24.455224] 7de0: 8431c68c 83295954 bd06e000 00001002 bc6f7e14
bc6f7e00 8431c6f0 8431c604
[   24.463430] 7e00: bd06e058 bd06e058 bc6f7e34 bc6f7e18 8431ea90
8431c6cc bd06e000 00001003
[   24.471637] 7e20: 7eba9a98 bc6f7e78 bc6f7e54 bc6f7e38 8431eba0
8431e9ec 00008914 bd2628ac
[   24.479844] 7e40: bc6f6000 7eba9a98 bc6f7ed4 bc6f7e58 843720ec
8431eb94 00000020 bd2628ac
[   24.488049] 7e60: bd06e000 00000000 bc6f7e88 bd2628a0 00000014
00000000 6e616c77 00000031
[   24.496255] 7e80: 00000000 00000000 00001002 00000000 00000000
00000000 00001002 00000000
[   24.504461] 7ea0: 00000000 00000000 00000000 00008914 bf6b2bc0
7eba9a98 bbaf5700 8400e504
[   24.512667] 7ec0: bc6f6000 00000000 bc6f7ee4 bc6f7ed8 84373438
84371dc4 bc6f7f04 bc6f7ee8
[   24.520873] 7ee0: 843087f8 843732a8 843085ec bbaf5700 bf6b2bc0
7eba9a98 bc6f7f7c bc6f7f08
[   24.529080] 7f00: 840ec364 843085f8 bf6b0558 00000008 bc6f7f2c
bc6f7f20 fffffff7 bc6f7f80
[   24.537286] 7f20: bc6f7f84 7eba99a4 00000129 7eba99a4 00000000
bf4e14a0 00000129 8400e504
[   24.545493] 7f40: bc6f6000 00000000 bc6f7fa4 bc6f7f58 8430a8b4
84308914 00000007 00008914
[   24.553699] 7f60: 7eba9a98 bbaf5700 8400e504 00000000 bc6f7fa4
bc6f7f80 840ec404 840ebdf4
[   24.561904] 7f80: 00000024 00000000 00000001 7eba9a98 00000007
00000036 00000000 bc6f7fa8
[   24.570110] 7fa0: 8400e380 840ec3d0 00000001 7eba9a98 00000007
00008914 7eba9a98 00001002
[   24.578315] 7fc0: 00000001 7eba9a98 00000007 00000036 00000000
0000000a ffffffff 00000000
[   24.586522] 7fe0: 0138a430 7eba9a90 00045dbc 2ae2adcc 20000010
00000007 00000000 00000000
[   24.594722] Backtrace:
[   24.597199] [<84311480>] (skb_release_head_state+0x0/0xf8) from
[<843111d4>] (__kfree_skb+0x14/0x128)
[   24.606447]  r5:bc790e40 r4:bc790e40
[   24.610064] [<843111c0>] (__kfree_skb+0x0/0x128) from [<84311384>]
(consume_skb+0x9c/0xc8)
[   24.618353]  r4:bc655be0 r3:84577ca4
[   24.621971] [<843112e8>] (consume_skb+0x0/0xc8) from [<8431c138>]
(dev_kfree_skb_any+0x44/0x48)
[   24.630697]  r5:0000002e r4:bc655be0
[   24.634336] [<8431c0f4>] (dev_kfree_skb_any+0x0/0x48) from
[<8332b7f0>] (ath10k_htt_rx_detach+0xbc/0x124 [ath10k_core])
[   24.645170] [<8332b734>] (ath10k_htt_rx_detach+0x0/0x124
[ath10k_core]) from [<8332a284>] (ath10k_htt_detach+0x14/0x8b8
[ath10k_core])
[   24.657308] [<8332a270>] (ath10k_htt_detach+0x0/0x8b8
[ath10k_core]) from [<83328834>] (ath10k_core_stop+0x3c/0x48
[ath10k_core])
[   24.668994]  r4:bc655500 r3:00000000
[   24.672619] [<833287f8>] (ath10k_core_stop+0x0/0x48 [ath10k_core])
from [<8332520c>] (ath10k_halt+0xe0/0x1b0 [ath10k_core])
[   24.683782]  r4:00000000 r3:00000000
[   24.687406] [<8332512c>] (ath10k_halt+0x0/0x1b0 [ath10k_core]) from
[<8332531c>] (ath10k_stop+0x40/0x7c [ath10k_core])
[   24.698206] [<833252dc>] (ath10k_stop+0x0/0x7c [ath10k_core]) from
[<832ab9a4>] (ieee80211_stop_device+0x84/0x17c [mac80211])
[   24.709545]  r5:bc65519c r4:bc654b00
[   24.713200] [<832ab920>] (ieee80211_stop_device+0x0/0x17c
[mac80211]) from [<832958ac>]
(ieee80211_del_virtual_monitor+0x8e8/0x984 [mac80211])
[   24.726018]  r6:bd06eab8 r5:bc65519c r4:bc65519c r3:00000000
[   24.731779] [<83295154>] (ieee80211_del_virtual_monitor+0x190/0x984
[mac80211]) from [<83295960>] (ieee80211_stop+0x18/0x20 [mac80211])
[   24.744010] [<83295948>] (ieee80211_stop+0x0/0x20 [mac80211]) from
[<8431c68c>] (__dev_close_many+0x94/0xc8)
[   24.753872] [<8431c5f8>] (__dev_close_many+0x0/0xc8) from
[<8431c6f0>] (__dev_close+0x30/0x48)
[   24.762510]  r5:00001002 r4:bd06e000
[   24.766128] [<8431c6c0>] (__dev_close+0x0/0x48) from [<8431ea90>]
(__dev_change_flags+0xb0/0x130)
[   24.775033] [<8431e9e0>] (__dev_change_flags+0x0/0x130) from
[<8431eba0>] (dev_change_flags+0x18/0x4c)
[   24.784367]  r7:bc6f7e78 r6:7eba9a98 r5:00001003 r4:bd06e000
[   24.790108] [<8431eb88>] (dev_change_flags+0x0/0x4c) from
[<843720ec>] (devinet_ioctl+0x334/0x770)
[   24.799094]  r6:7eba9a98 r5:bc6f6000 r4:bd2628ac r3:00008914
[   24.804828] [<84371db8>] (devinet_ioctl+0x0/0x770) from
[<84373438>] (inet_ioctl+0x19c/0x1c8)
[   24.813393] [<8437329c>] (inet_ioctl+0x0/0x1c8) from [<843087f8>]
(sock_ioctl+0x20c/0x25c)
[   24.821696] [<843085ec>] (sock_ioctl+0x0/0x25c) from [<840ec364>]
(do_vfs_ioctl+0x57c/0x5dc)
[   24.830159]  r6:7eba9a98 r5:bf6b2bc0 r4:bbaf5700 r3:843085ec
[   24.835896] [<840ebde8>] (do_vfs_ioctl+0x0/0x5dc) from [<840ec404>]
(sys_ioctl+0x40/0x64)
[   24.844112] [<840ec3c4>] (sys_ioctl+0x0/0x64) from [<8400e380>]
(ret_fast_syscall+0x0/0x30)
[   24.852488]  r7:00000036 r6:00000007 r5:7eba9a98 r4:00000001
[   24.858218] Code: 84059930 0000001e bd121be0 be68a4c8 (7ec9aa38)
[   24.864504] br0: port 3(wlan0) entering learning state
[   24.865680] dhclient6: XMT: Forming Info-Request, 2790 ms elapsed.
[   24.865701] dhclient6: XMT: Info-Request on wan0, interval 3510ms.
[   24.880058] .
[   24.883857] ---[ end trace dd0174d961805448 ]---
[   24.888683] Kernel panic - not syncing: Fatal exception

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
