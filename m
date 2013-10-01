Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VR4Qk-0001Es-H1
 for ath10k@lists.infradead.org; Tue, 01 Oct 2013 18:12:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Scheduling while atomic while setting the PS mode
Date: Tue, 1 Oct 2013 21:11:49 +0300
Message-ID: <87eh846eu2.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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

Hi,

I haven't been testing with all debug tests enabled for few days.
Enabled them now and see the BUG below. This is with commit 71bcca1ff7f.

Kalle

[  250.125852] ath10k_pci 0000:02:00.0: irq 49 for MSI/MSI-X
[  250.126959] ath10k: MSI interrupt handling
[  251.357561] ath10k: UART prints disabled
[  251.432475] ath10k: firmware 999.999.0.716 booted
[  251.443440] ath10k: htt target version 3.0
[  251.447488] BUG: scheduling while atomic: ip/2695/0x00000002
[  251.447604] INFO: lockdep is turned off.
[  251.447714] Modules linked in: ath10k_pci ath10k_core ath mac80211 cfg80211 [last unloaded: cfg80211]
[  251.449514] CPU: 1 PID: 2695 Comm: ip Tainted: G        W    3.11.0-wl-ath+ #77
[  251.449631] Hardware name: Hewlett-Packard HP ProBook 6540b/1722, BIOS 68CDD Ver. F.04 01/27/2010
[  251.449743]  00000000 00000000 eea437e8 c17859c9 edf75680 eea43804 c1781f31 c19a5e18
[  251.451591]  edf75960 00000a87 00000002 f4620000 eea43894 c178c533 00000000 00000002
[  251.453479]  00000001 00000000 c12f812f 00000000 edf75680 c1bbe000 c1a9aec8 eea43850
[  251.454499] Call Trace:
[  251.455469]  [<c17859c9>] dump_stack+0x4b/0x66
[  251.455597]  [<c1781f31>] __schedule_bug+0x64/0x76
[  251.455720]  [<c178c533>] __schedule+0x943/0xb30
[  251.455844]  [<c12f812f>] ? debug_object_activate+0x6f/0x150
[  251.455970]  [<c10ad8eb>] ? trace_hardirqs_off+0xb/0x10
[  251.456091]  [<c178e696>] ? _raw_spin_unlock_irqrestore+0x36/0x60
[  251.456211]  [<c10b3638>] ? trace_hardirqs_on_caller+0x18/0x1c0
[  251.456352]  [<c178c9d3>] schedule+0x23/0x60
[  251.456525]  [<c1789003>] schedule_timeout+0x103/0x280
[  251.457480]  [<f92e6ee0>] ? ieee80211_iterate_active_interfaces+0x130/0x130 [mac80211]
[  251.457610]  [<c1053140>] ? call_timer_fn+0x2c0/0x2c0
[  251.457738]  [<f939a38f>] ath10k_wmi_cmd_send+0xaf/0x110 [ath10k_core]
[  251.457861]  [<c106bdb0>] ? __init_waitqueue_head+0x60/0x60
[  251.457986]  [<f939c57a>] ath10k_wmi_set_psmode+0x6a/0x80 [ath10k_core]
[  251.458110]  [<f938e557>] ath10k_ps_iter+0x87/0x140 [ath10k_core]
[  251.458258]  [<f92e701a>] ieee80211_iterate_active_interfaces_atomic+0x13a/0x2c0 [mac80211]
[  251.458435]  [<f92e6ee0>] ? ieee80211_iterate_active_interfaces+0x130/0x130 [mac80211]
[  251.458613]  [<f938e4d0>] ? ath10k_configure_filter+0x3d0/0x3d0 [ath10k_core]
[  251.459542]  [<f938e775>] ath10k_config+0x165/0x310 [ath10k_core]
[  251.459685]  [<f92b2c05>] ieee80211_hw_config+0x85/0x620 [mac80211]
[  251.459824]  [<f92b2d5b>] ? ieee80211_hw_config+0x1db/0x620 [mac80211]
[  251.459968]  [<f92cd6ca>] ieee80211_do_open+0x65a/0x1650 [mac80211]
[  251.460091]  [<c107199f>] ? raw_notifier_call_chain+0x1f/0x30
[  251.460214]  [<c1632301>] ? call_netdevice_notifiers_info+0x1/0x70
[  251.460384]  [<f92ce720>] ieee80211_open+0x60/0x70 [mac80211]
[  251.460554]  [<c163839b>] __dev_open+0xab/0x120
[  251.461387]  [<c178e735>] ? _raw_spin_unlock_bh+0x35/0x40
[  251.461520]  [<c1638632>] __dev_change_flags+0x82/0x150
[  251.461641]  [<c16387b1>] dev_change_flags+0x21/0x60
[  251.461763]  [<c1645df0>] do_setlink+0x220/0x870
[  251.461886]  [<c115d6c9>] ? deactivate_slab+0x399/0x540
[  251.462007]  [<c12ffa0f>] ? nla_parse+0x1f/0xa0
[  251.462127]  [<c178e652>] ? _raw_spin_unlock+0x22/0x30
[  251.462247]  [<c1647309>] rtnl_newlink+0x349/0x530
[  251.462393]  [<c129d003>] ? selinux_task_to_inode+0xf3/0x170
[  251.463348]  [<c12a0ae2>] ? selinux_capable+0x32/0x40
[  251.463475]  [<c104f1b8>] ? ns_capable+0x38/0x70
[  251.463597]  [<c1646eee>] rtnetlink_rcv_msg+0x10e/0x1e0
[  251.463718]  [<c1645a34>] ? rtnl_lock+0x14/0x20
[  251.463838]  [<c1645a34>] ? rtnl_lock+0x14/0x20
[  251.463958]  [<c1646de0>] ? __rtnl_unlock+0x20/0x20
[  251.464080]  [<c165f81e>] netlink_rcv_skb+0x8e/0xb0
[  251.464200]  [<c1645a5c>] rtnetlink_rcv+0x1c/0x30
[  251.464340]  [<c165f1ab>] netlink_unicast+0x13b/0x180
[  251.465288]  [<c165f615>] netlink_sendmsg+0x375/0x3f0
[  251.465425]  [<c161bf8e>] sock_sendmsg+0xbe/0xe0
[  251.465550]  [<c1143254>] ? might_fault+0x94/0xa0
[  251.465673]  [<c12f0c82>] ? _copy_from_user+0x42/0x60
[  251.465794]  [<c16295f4>] ? verify_iovec+0x44/0xb0
[  251.465914]  [<c161c21f>] ___sys_sendmsg+0x21f/0x230
[  251.466035]  [<c1142cdf>] ? __do_fault+0x19f/0x4b0
[  251.466157]  [<c1121136>] ? unlock_page+0x46/0x50
[  251.466296]  [<c1142cee>] ? __do_fault+0x1ae/0x4b0
[  251.467227]  [<c11821bf>] ? fget_light+0x28f/0x440
[  251.467372]  [<c161e39e>] __sys_sendmsg+0x3e/0x70
[  251.467528]  [<c161e3e6>] SyS_sendmsg+0x16/0x20
[  251.467650]  [<c161e91f>] SyS_socketcall+0x11f/0x2e0
[  251.467771]  [<c10b3638>] ? trace_hardirqs_on_caller+0x18/0x1c0
[  251.467893]  [<c107072b>] ? up_write+0x1b/0x30
[  251.468016]  [<c17969ba>] sysenter_do_call+0x12/0x32
[  251.469317] ip (2695) used greatest stack depth: 4244 bytes left

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
