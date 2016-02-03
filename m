Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x244.google.com ([2607:f8b0:4001:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aR3B4-0005d5-0R
 for ath10k@lists.infradead.org; Wed, 03 Feb 2016 19:33:22 +0000
Received: by mail-ig0-x244.google.com with SMTP id mw1so3039549igb.2
 for <ath10k@lists.infradead.org>; Wed, 03 Feb 2016 11:33:01 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 3 Feb 2016 11:33:01 -0800
Message-ID: <CABy9W5nGFA7r0dr-7jVj_i4uEAmn5dywKdiUpCNgS6=H-Z7JOg@mail.gmail.com>
Subject: SWBA errors and no ssid
From: Ann Lo <annlo.tech@gmail.com>
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

Hello,

We are seeking for expert opinions on "SWBA errors" and any possible
workarounds. If we run AP+client mode, and the client scans for an
nonexistent ssid, then "SWBA errors" happen easily. From this point
on, the ssid of the AP is no longer visible. We use kernel 3.14.28,
Qualcomm firmware 10.1.167.3-1, and WLE900VX. Qualcomm firmware
999.999.0.636 has the same problem except that it does not report
"SWBA errors". Is it possible that we can fix this problem by porting
some patches?

Details of errors
============
[ 3455.101199] ath10k: SWBA overrun on vdev 0
[ 3455.203616] ath10k: SWBA overrun on vdev 0
[ 3455.305992] ath10k: SWBA overrun on vdev 0
[ 3455.408389] ath10k: SWBA overrun on vdev 0
[ 3455.510768] ath10k: SWBA overrun on vdev 0
[ 3455.613164] ath10k: SWBA overrun on vdev 0
[ 3455.715557] ath10k: SWBA overrun on vdev 0
[ 3455.817992] ath10k: SWBA overrun on vdev 0
[ 3455.920360] ath10k: SWBA overrun on vdev 0
[ 3456.022768] ath10k: SWBA overrun on vdev 0
[ 3457.946735] uap0: failed to remove key (0, a4:2b:8c:04:6d:a8) from
hardware (-11)
[ 3460.118597] net_ratelimit: 40 callbacks suppressed
[ 3460.123463] ath10k: SWBA overrun on vdev 0
[ 3460.221003] ath10k: SWBA overrun on vdev 0
[ 3460.323398] ath10k: SWBA overrun on vdev 0
[ 3460.425785] ath10k: SWBA overrun on vdev 0
[ 3460.528186] ath10k: SWBA overrun on vdev 0
[ 3460.630568] ath10k: SWBA overrun on vdev 0
[ 3460.732971] ath10k: SWBA overrun on vdev 0
[ 3460.835370] ath10k: SWBA overrun on vdev 0
[ 3460.937767] ath10k: SWBA overrun on vdev 0
[ 3460.946679] ath10k: could not remove peer wep key 0 (-11)
[ 3460.952134] ------------[ cut here ]------------
[ 3460.956874] WARNING: CPU: 0 PID: 4349 at
net/mac80211/sta_info.c:894 __sta_info_destroy_part2+0x124/0x18c()
[ 3460.966703] Modules linked in: ath10k_pci ath10k_core ath usb_f_ecm
g_ether usb_f_rndis libcomposite u_ether
[ 3460.976913] CPU: 0 PID: 4349 Comm: hostapd Not tainted 3.14.28 #1
[ 3460.983379] [<80015418>] (unwind_backtrace) from [<80011708>]
(show_stack+0x10/0x14)
[ 3460.991237] [<80011708>] (show_stack) from [<805d5d44>]
(dump_stack+0x7c/0xbc)
[ 3460.998567] [<805d5d44>] (dump_stack) from [<8002d408>]
(warn_slowpath_common+0x70/0x8c)
[ 3461.006776] [<8002d408>] (warn_slowpath_common) from [<8002d4c0>]
(warn_slowpath_null+0x1c/0x24)
[ 3461.015602] [<8002d4c0>] (warn_slowpath_null) from [<805a6278>]
(__sta_info_destroy_part2+0x124/0x18c)
[ 3461.024988] [<805a6278>] (__sta_info_destroy_part2) from
[<805a6300>] (__sta_info_destroy+0x20/0x28)
[ 3461.034224] [<805a6300>] (__sta_info_destroy) from [<805a6370>]
(sta_info_destroy_addr_bss+0x28/0x40)
[ 3461.043676] [<805a6370>] (sta_info_destroy_addr_bss) from
[<8044dc74>] (genl_rcv_msg+0x230/0x390)
[ 3461.052658] [<8044dc74>] (genl_rcv_msg) from [<8044d218>]
(netlink_rcv_skb+0xb4/0xd8)
[ 3461.060591] [<8044d218>] (netlink_rcv_skb) from [<8044da34>]
(genl_rcv+0x24/0x34)
[ 3461.068149] [<8044da34>] (genl_rcv) from [<8044cb98>]
(netlink_unicast+0x150/0x1d4)
[ 3461.075842] [<8044cb98>] (netlink_unicast) from [<8044cf8c>]
(netlink_sendmsg+0x2b8/0x394)
[ 3461.084188] [<8044cf8c>] (netlink_sendmsg) from [<8040fa6c>]
(sock_sendmsg+0x88/0xac)
[ 3461.092312] [<8040fa6c>] (sock_sendmsg) from [<80410d88>]
(___sys_sendmsg.part.34+0x284/0x290)
[ 3461.101050] [<80410d88>] (___sys_sendmsg.part.34) from [<80411e6c>]
(__sys_sendmsg+0x4c/0x7c)
[ 3461.109664] [<80411e6c>] (__sys_sendmsg) from [<8000e4a0>]
(ret_fast_syscall+0x0/0x30)
[ 3461.117706] ---[ end trace 8aae701f637ad7b2 ]---


Thanks,
Ann

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
