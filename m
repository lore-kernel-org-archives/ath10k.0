Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPQ2n-0007kg-TI
 for ath10k@lists.infradead.org; Wed, 12 Aug 2015 07:01:51 +0000
Received: by wijp15 with SMTP id p15so204925403wij.0
 for <ath10k@lists.infradead.org>; Wed, 12 Aug 2015 00:01:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJn6Hhtz=nT49xROZYRHiUi-8+79VYNc8Lju=F7p_DDbU+70LA@mail.gmail.com>
References: <CAJn6Hhtz=nT49xROZYRHiUi-8+79VYNc8Lju=F7p_DDbU+70LA@mail.gmail.com>
Date: Wed, 12 Aug 2015 09:01:25 +0200
Message-ID: <CA+BoTQn=byNm+hSJ04QF3=NxDkTu_dOMuYPC3s3PgHKhHT+ASA@mail.gmail.com>
Subject: Re: [10.1.467.2-1] No SSID in the air
From: Michal Kazior <michal.kazior@tieto.com>
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
To: Igor Pavlov <igor.arabesc.pavlov@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 12 August 2015 at 00:48, Igor Pavlov <igor.arabesc.pavlov@gmail.com> wrote:
> I have an issue with 10.1.467.2-1 firmware - SSID disappears from the
> air within a few hours from the launch of an access-point software.
> I'm using OpenWrt 15.05-rc3 as an OS and a QCA9880 v2 based WiFi adapter.
>
> There are repeating messages in the system console:
>
> [324035.117841] ath10k_warn: 50 callbacks suppressed
> [324035.126637] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [324035.220322] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [324035.322824] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [324035.425270] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [324035.527811] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [324035.630281] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [324035.712817] ath10k_pci 0000:00:05.0: Spurious quick kickout for
> STA xx:xx:xx:xx:xx:xx
> [324035.721568] ath10k_pci 0000:00:05.0: Spurious quick kickout for
> STA yy:yy:yy:yy:yy:yy
> [324035.732879] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [324035.835361] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> ...
>
> Then I changed firmware to the Candelatech's
> firmware-2-ct-full-community.bin (it's beta-15, I think). It's working
> for a day, but there's the following output in the console:
>
> [15331.556099] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15331.658618] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15331.761139] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15331.863636] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15331.966167] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15332.068767] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15332.171227] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15332.273745] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15332.376242] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15332.478767] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15334.401723] ------------[ cut here ]------------
> [15334.405688] WARNING: CPU: 0 PID: 1699 at
> /home/buildbot/slave-local/x86_64/build/build_dir/target-x86_64_uClibc-0.9.33.2/linux-x86_64/compat-wireless-2015-03-09/net/mac80211/sta_info.c:909
> sta_set_sinfo+0x659/0x710 [mac80211]()
> [15334.421678] Modules linked in: pppoe ppp_async iptable_nat pppox
> ppp_generic nf_nat_ipv4 nf_conntrack_ipv6 nf_conntrack_ipv4 ipt_REJECT
> ipt_MASQUERADE xt_time xt_tcpudp xt_tcpmss xt_statistic xt_state
> xt_recent xt_nat xt_multiport xt_mark xt_mac xt_limit xt_length xt_id
> xt_hl xt_helper xt_ecn xt_dscp xt_conntrack xt_connmark xt_connlimit
> xt_connbytes xt_comment xt_TCPMSS xt_REDIRECT xt_LOG xt_HL xt_DSCP
> xt_CT xt_CLASSIFY slhc r8169 nf_reject_ipv4 nf_nat_masquerade_ipv4
> nf_nat_ftp nf_nat nf_log_ipv4 nf_defrag_ipv6 nf_defrag_ipv4
> nf_conntrack_rtcache nf_conntrack_ftp iptable_raw iptable_mangle
> iptable_filter ipt_ECN ip_tables e1000e crc_ccitt act_connmark
> nf_conntrack act_skbedit act_mirred em_u32 cls_u32 cls_tcindex
> cls_flow cls_route cls_fw sch_hfsc sch_ingress ath10k_pci ath10k_core
> ath mac80211 cfg80211 compat ip6t_REJECT nf_reject_ipv6 nf_log_ipv6
> nf_log_common ip6table_raw ip6table_mangle ip6table_filter ip6_tables
> x_tables e1000 ifb ipv6 arc4 crypto_blkcipher ptp pps_core mii
> [15334.508476] CPU: 0 PID: 1699 Comm: hostapd Not tainted 3.18.17 #1
> [15334.513515]  0000000000000000 0000000000000009 ffffffff813df544
> 0000000000000000
> [15334.520310]  ffffffff8103d29d ffff88000e6bc000 ffff88000e788d40
> ffff88000ecfb730
> [15334.527151]  ffff88000e6b2740 0000000000000000 ffffffffa00fcb39
> ffff88000e70a1c0
> [15334.534096] Call Trace:
> [15334.536241]  [<ffffffff813df544>] ? dump_stack+0x41/0x51
> [15334.540543]  [<ffffffff8103d29d>] ? warn_slowpath_common+0x6d/0x90
> [15334.545642]  [<ffffffffa00fcb39>] ? sta_set_sinfo+0x659/0x710 [mac80211]
> [15334.551094]  [<ffffffffa00fcc11>] ? __sta_info_destroy+0x21/0x30 [mac80211]
> [15334.556819]  [<ffffffffa00fcca2>] ?
> sta_info_destroy_addr_bss+0x32/0x50 [mac80211]
> [15334.563075]  [<ffffffffa00c17c8>] ?
> cfg80211_check_station_change+0xba8/0xf30 [cfg80211]
> [15334.569613]  [<ffffffff8135ccc5>] ? genl_family_rcv_msg+0x285/0x300
> [15334.574774]  [<ffffffff8135cdb5>] ? genl_rcv_msg+0x75/0xa0
> [15334.579250]  [<ffffffff8135cd40>] ? genl_family_rcv_msg+0x300/0x300
> [15334.584410]  [<ffffffff8135c12d>] ? netlink_rcv_skb+0x3d/0x90
> [15334.589021]  [<ffffffff8135ca2f>] ? genl_rcv+0x1f/0x30
> [15334.593408]  [<ffffffff8135bab9>] ? netlink_unicast+0x119/0x200
> [15334.596826]  [<ffffffff8135bf67>] ? netlink_sendmsg+0x347/0x3c0
> [15334.599640]  [<ffffffff8131f313>] ? sock_sendmsg+0x63/0x80
> [15334.602322]  [<ffffffff81320e72>] ? move_addr_to_kernel+0x22/0x40
> [15334.605156]  [<ffffffff8132cae8>] ? verify_iovec+0x58/0xc0
> [15334.607751]  [<ffffffff81320a47>] ? ___sys_sendmsg.part.34+0x207/0x230
> [15334.610810]  [<ffffffff81320ba1>] ? ___sys_recvmsg.part.35+0x131/0x180
> [15334.613934]  [<ffffffff81060656>] ? pick_next_task_fair+0x126/0x3f0
> [15334.616871]  [<ffffffff810f5a7f>] ? __inode_wait_for_writeback+0x5f/0xa0
> [15334.620019]  [<ffffffff811071b2>] ? fsnotify_clear_marks_by_inode+0x22/0x120
> [15334.623347]  [<ffffffff81320046>] ? sock_destroy_inode+0x16/0x30
> [15334.626162]  [<ffffffff810e7a48>] ? __dentry_kill+0x168/0x1a0
> [15334.628894]  [<ffffffff810e7bb1>] ? dput+0x131/0x160
> [15334.631256]  [<ffffffff810d55ec>] ? __fput+0x17c/0x1b0
> [15334.633777]  [<ffffffff813219a6>] ? __sys_sendmsg+0x46/0x70
> [15334.636419]  [<ffffffff813e39c9>] ? system_call_fastpath+0x12/0x17
> [15334.639351] ---[ end trace 97da1af6d0d2e5cb ]---
> [15336.682094] ath10k_warn: 41 callbacks suppressed
> [15336.682887] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15336.784608] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15336.887139] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15336.989644] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15337.092180] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15337.194685] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15337.297223] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15337.399746] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15337.502271] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [15337.604789] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
> skipped old beacon
> [18934.163332] ath10k_warn: 22 callbacks suppressed
> [18934.166516] ath10k_pci 0000:00:05.0: Spurious quick kickout for STA
> zz:zz:zz:zz:zz:zz
> [29356.544292] CE: hpet2 increased min_delta_ns to 28800 nsec
> [29356.544584] CE: hpet2 increased min_delta_ns to 43200 nsec
> [29356.544850] CE: hpet2 increased min_delta_ns to 64800 nsec
> [71227.201511] CE: hpet2 increased min_delta_ns to 97200 nsec
> [71227.201945] CE: hpet2 increased min_delta_ns to 145800 nsec

Both issues seem to be related to wmi mgmt tx starvation. This is a
known problem.

You might want to try one of the these 10.2.4 firmware images:
  https://github.com/kvalo/ath10k-firmware/tree/master/10.2.4/untested


Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
