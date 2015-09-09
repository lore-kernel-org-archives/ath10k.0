Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZnwT-0000kZ-M4
 for ath10k@lists.infradead.org; Wed, 09 Sep 2015 22:34:15 +0000
Received: by qkfj65 with SMTP id j65so1057892qkf.3
 for <ath10k@lists.infradead.org>; Wed, 09 Sep 2015 15:33:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55CCDBF9.2050205@candelatech.com>
References: <55CCDBF9.2050205@candelatech.com>
Date: Thu, 10 Sep 2015 01:33:51 +0300
Message-ID: <CAJn6HhvrmvXFTyxAuxXpbVmQZK6qSRKXJPJkwBY3NfjgPHWECw@mail.gmail.com>
Subject: Re: New CT firmware beta-15 available.
From: Igor Pavlov <igor.arabesc.pavlov@gmail.com>
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
Cc: Ben Greear <greearb@candelatech.com>

I have a few logs from my usage of the
firmware-2-ct-full-community.bin (md5:
b89acccb0bd595d53767cfeab85daa9e).
The host OS is the OpenWRT v15.05-rc3

# lspci -nn -qq
00:05.0 Network controller [0280]: Qualcomm Atheros QCA986x/988x
802.11ac Wireless Network Adapter [168c:003c]
00:06.0 Network controller [0280]: Qualcomm Atheros QCA986x/988x
802.11ac Wireless Network Adapter [168c:003c]

The 1st adapter is the Embedded Works EW5260AC (QCA9880-2R4E).
The 2nd adapter is the Doodle Labs ACM-DB-3 (QCA9890).
I have no idea why they have the same PCI ID's. It may be ok.

#1

[ 7475.763269] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
skipped old beacon
... (a lot of them)
[376051.167238] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
skipped old beacon
[376053.124595] wlan0: failed to remove key (0, xx:xx:xx:xx:xx:xx)
from hardware (-11)
[376055.370656] ath10k_warn: 41 callbacks suppressed
[376055.371099] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
skipped old beacon
...
[376056.088326] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
skipped old beacon
[376056.127516] ath10k_pci 0000:00:05.0: failed to delete peer
yy:yy:yy:yy:yy:yy for vdev 0: -11
[376056.128253] ------------[ cut here ]------------
[376056.128677] WARNING: CPU: 0 PID: 1699 at
/home/buildbot/slave-local/x86_64/build/build_dir/target-x86_64_uClibc-0.9.33.2/linux-x86_64/compat-wireless-2015-03-09/net/mac80211/sta_info.c:909
sta_set_sinfo+0x659/0x710 [mac80211]()
[376056.130364] Modules linked in: pppoe ppp_async iptable_nat pppox
ppp_generic nf_nat_ipv4 nf_conntrack_ipv6 nf_conntrack_ipv4 ipt_REJECT
ipt_MASQUERADE xt_time xt_tcpudp xt_tcpmss xt_statistic xt_state
xt_recent xt_nat xt_multiport xt_mark xt_mac xt_limit xt_length xt_id
xt_hl xt_helper xt_ecn xt_dscp xt_conntrack xt_connmark xt_connlimit
xt_connbytes xt_comment xt_TCPMSS xt_REDIRECT xt_LOG xt_HL xt_DSCP
xt_CT xt_CLASSIFY slhc r8169 nf_reject_ipv4 nf_nat_masquerade_ipv4
nf_nat_ftp nf_nat nf_log_ipv4 nf_defrag_ipv6 nf_defrag_ipv4
nf_conntrack_rtcache nf_conntrack_ftp iptable_raw iptable_mangle
iptable_filter ipt_ECN ip_tables e1000e crc_ccitt act_connmark
nf_conntrack act_skbedit act_mirred em_u32 cls_u32 cls_tcindex
cls_flow cls_route cls_fw sch_hfsc sch_ingress ath10k_pci ath10k_core
ath mac80211 cfg80211 compat ip6t_REJECT nf_reject_ipv6 nf_log_ipv6
nf_log_common ip6table_raw ip6table_mangle ip6table_filter ip6_tables
x_tables e1000 ifb ipv6 arc4 crypto_blkcipher ptp pps_core mii
[376056.139315] CPU: 0 PID: 1699 Comm: hostapd Not tainted 3.18.17 #1
[376056.139847]  0000000000000000 0000000000000009 ffffffff813df544
0000000000000000
[376056.140564]  ffffffff8103d29d ffff88000ed06000 ffff88000ef30d40
ffff88000e26f730
[376056.141283]  ffff88000ecda740 0000000000000000 ffffffffa00fcb39
000000000de2b740
[376056.141999] Call Trace:
[376056.142234]  [<ffffffff813df544>] ? dump_stack+0x41/0x51
[376056.142705]  [<ffffffff8103d29d>] ? warn_slowpath_common+0x6d/0x90
[376056.143248]  [<ffffffffa00fcb39>] ? sta_set_sinfo+0x659/0x710 [mac80211]
[376056.143835]  [<ffffffffa00fcc11>] ? __sta_info_destroy+0x21/0x30 [mac80211]
[376056.144440]  [<ffffffffa00fcca2>] ?
sta_info_destroy_addr_bss+0x32/0x50 [mac80211]
[376056.145103]  [<ffffffffa00c17c8>] ?
cfg80211_check_station_change+0xba8/0xf30 [cfg80211]
[376056.145808]  [<ffffffff8135ccc5>] ? genl_family_rcv_msg+0x285/0x300
[376056.146356]  [<ffffffff8135cdb5>] ? genl_rcv_msg+0x75/0xa0
[376056.146836]  [<ffffffff8135cd40>] ? genl_family_rcv_msg+0x300/0x300
[376056.147381]  [<ffffffff8135c12d>] ? netlink_rcv_skb+0x3d/0x90
[376056.147883]  [<ffffffff8135ca2f>] ? genl_rcv+0x1f/0x30
[376056.148336]  [<ffffffff8135bab9>] ? netlink_unicast+0x119/0x200
[376056.148850]  [<ffffffff8135bf67>] ? netlink_sendmsg+0x347/0x3c0
[376056.149361]  [<ffffffff8131f313>] ? sock_sendmsg+0x63/0x80
[376056.149834]  [<ffffffff81320e72>] ? move_addr_to_kernel+0x22/0x40
[376056.150363]  [<ffffffff8132cae8>] ? verify_iovec+0x58/0xc0
[376056.150844]  [<ffffffff81320a47>] ? ___sys_sendmsg.part.34+0x207/0x230
[376056.151410]  [<ffffffff81320ba1>] ? ___sys_recvmsg.part.35+0x131/0x180
[376056.151978]  [<ffffffff81060656>] ? pick_next_task_fair+0x126/0x3f0
[376056.152523]  [<ffffffff810f5a7f>] ? __inode_wait_for_writeback+0x5f/0xa0
[376056.153102]  [<ffffffff811071b2>] ? fsnotify_clear_marks_by_inode+0x22/0x120
[376056.153709]  [<ffffffff81320046>] ? sock_destroy_inode+0x16/0x30
[376056.154233]  [<ffffffff810e7a48>] ? __dentry_kill+0x168/0x1a0
[376056.154737]  [<ffffffff810e7bb1>] ? dput+0x131/0x160
[376056.155178]  [<ffffffff810d55ec>] ? __fput+0x17c/0x1b0
[376056.155631]  [<ffffffff813219a6>] ? __sys_sendmsg+0x46/0x70
[376056.156111]  [<ffffffff813e39c9>] ? system_call_fastpath+0x12/0x17
[376056.156650] ---[ end trace b976155855a8d0dd ]---
[376056.157260] ath10k_pci 0000:00:05.0: cipher 0 is not supported
[376056.157785] ------------[ cut here ]------------
[376056.158201] WARNING: CPU: 0 PID: 1699 at
/home/buildbot/slave-local/x86_64/build/build_dir/target-x86_64_uClibc-0.9.33.2/linux-x86_64/compat-wireless-2015-03-09/net/mac80211/sta_info.c:901
sta_set_sinfo+0x599/0x710 [mac80211]()
[376056.159905] Modules linked in: pppoe ppp_async iptable_nat pppox
ppp_generic nf_nat_ipv4 nf_conntrack_ipv6 nf_conntrack_ipv4 ipt_REJECT
ipt_MASQUERADE xt_time xt_tcpudp xt_tcpmss xt_statistic xt_state
xt_recent xt_nat xt_multiport xt_mark xt_mac xt_limit xt_length xt_id
xt_hl xt_helper xt_ecn xt_dscp xt_conntrack xt_connmark xt_connlimit
xt_connbytes xt_comment xt_TCPMSS xt_REDIRECT xt_LOG xt_HL xt_DSCP
xt_CT xt_CLASSIFY slhc r8169 nf_reject_ipv4 nf_nat_masquerade_ipv4
nf_nat_ftp nf_nat nf_log_ipv4 nf_defrag_ipv6 nf_defrag_ipv4
nf_conntrack_rtcache nf_conntrack_ftp iptable_raw iptable_mangle
iptable_filter ipt_ECN ip_tables e1000e crc_ccitt act_connmark
nf_conntrack act_skbedit act_mirred em_u32 cls_u32 cls_tcindex
cls_flow cls_route cls_fw sch_hfsc sch_ingress ath10k_pci ath10k_core
ath mac80211 cfg80211 compat ip6t_REJECT nf_reject_ipv6 nf_log_ipv6
nf_log_common ip6table_raw ip6table_mangle ip6table_filter ip6_tables
x_tables e1000 ifb ipv6 arc4 crypto_blkcipher ptp pps_core mii
[376056.168869] CPU: 0 PID: 1699 Comm: hostapd Tainted: G        W
 3.18.17 #1
[376056.169498]  0000000000000000 0000000000000009 ffffffff813df544
0000000000000000
[376056.170221]  ffffffff8103d29d ffff88000ed00000 ffff88000ef30d40
ffff88000e26f730
[376056.170934]  ffff88000ecda740 0000000000000000 ffffffffa00fca79
000000000de2b740
[376056.171654] Call Trace:
[376056.171886]  [<ffffffff813df544>] ? dump_stack+0x41/0x51
[376056.172354]  [<ffffffff8103d29d>] ? warn_slowpath_common+0x6d/0x90
[376056.172898]  [<ffffffffa00fca79>] ? sta_set_sinfo+0x599/0x710 [mac80211]
[376056.173482]  [<ffffffffa00fcc11>] ? __sta_info_destroy+0x21/0x30 [mac80211]
[376056.174093]  [<ffffffffa00fcca2>] ?
sta_info_destroy_addr_bss+0x32/0x50 [mac80211]
[376056.174760]  [<ffffffffa00c17c8>] ?
cfg80211_check_station_change+0xba8/0xf30 [cfg80211]
[376056.175467]  [<ffffffff8135ccc5>] ? genl_family_rcv_msg+0x285/0x300
[376056.176016]  [<ffffffff8135cdb5>] ? genl_rcv_msg+0x75/0xa0
[376056.176498]  [<ffffffff8135cd40>] ? genl_family_rcv_msg+0x300/0x300
[376056.177048]  [<ffffffff8135c12d>] ? netlink_rcv_skb+0x3d/0x90
[376056.177555]  [<ffffffff8135ca2f>] ? genl_rcv+0x1f/0x30
[376056.178009]  [<ffffffff8135bab9>] ? netlink_unicast+0x119/0x200
[376056.178531]  [<ffffffff8135bf67>] ? netlink_sendmsg+0x347/0x3c0
[376056.179054]  [<ffffffff8131f313>] ? sock_sendmsg+0x63/0x80
[376056.179538]  [<ffffffff81320e72>] ? move_addr_to_kernel+0x22/0x40
[376056.180071]  [<ffffffff8132cae8>] ? verify_iovec+0x58/0xc0
[376056.180554]  [<ffffffff81320a47>] ? ___sys_sendmsg.part.34+0x207/0x230
[376056.181123]  [<ffffffff811071b2>] ? fsnotify_clear_marks_by_inode+0x22/0x120
[376056.181735]  [<ffffffff81320046>] ? sock_destroy_inode+0x16/0x30
[376056.182260]  [<ffffffff810e7a48>] ? __dentry_kill+0x168/0x1a0
[376056.182764]  [<ffffffff810e7bb1>] ? dput+0x131/0x160
[376056.183205]  [<ffffffff810d55ec>] ? __fput+0x17c/0x1b0
[376056.183660]  [<ffffffff813219a6>] ? __sys_sendmsg+0x46/0x70
[376056.184153]  [<ffffffff813e39c9>] ? system_call_fastpath+0x12/0x17
[376056.184696] ---[ end trace b976155855a8d0de ]---
[379888.155644] ath10k_warn: 16 callbacks suppressed
[379888.156191] ath10k_pci 0000:00:05.0: Spurious quick kickout for
STA yy:yy:yy:yy:yy:yy

#2

...
[69284.327377] ath10k_pci 0000:00:05.0: failed to add peer
xx:xx:xx:xx:xx:xx for vdev 0 when adding a new sta: -105
...
[69284.365197] ath10k_pci 0000:00:05.0: failed to add peer
xx:xx:xx:xx:xx:xx for vdev 0 when adding a new sta: -105
[69296.111608] ath10k_warn: 4 callbacks suppressed
[69296.112057] ath10k_pci 0000:00:05.0: failed to add peer
xx:xx:xx:xx:xx:xx for vdev 0 when adding a new sta: -105
...
[69307.886488] ath10k_pci 0000:00:05.0: failed to add peer
xx:xx:xx:xx:xx:xx for vdev 0 when adding a new sta: -105
[69312.147837] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
skipped old beacon
[69312.968019] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
skipped old beacon
[69315.838662] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
skipped old beacon
...

#3

[39061.412447] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
skipped old beacon
...
[39062.335152] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
skipped old beacon
[39064.306407] wlan0: failed to remove key (0, xx:xx:xx:xx:xx:xx) from
hardware (-11)
[39066.538512] ath10k_warn: 41 callbacks suppressed
[39066.539038] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
skipped old beacon
...
[39067.256165] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
skipped old beacon
[39067.309893] ath10k_pci 0000:00:05.0: failed to delete peer
yy:yy:yy:yy:yy:yy for vdev 0: -11
[39067.310857] ------------[ cut here ]------------
[39067.311399] WARNING: CPU: 0 PID: 1779 at
/home/buildbot/slave-local/x86_64/build/build_dir/target-x86_64_uClibc-0.9.33.2/linux-x86_64/compat-wireless-2015-03-09/net/mac80211/sta_info.c:909
sta_set_sinfo+0x659/0x710 [mac80211]()
[39067.313562] Modules linked in: pppoe ppp_async iptable_nat pppox
ppp_generic nf_nat_ipv4 nf_conntrack_ipv6 nf_conntrack_ipv4 ipt_REJECT
ipt_MASQUERADE xt_time xt_tcpudp xt_tcpmss xt_statistic xt_state
xt_recent xt_nat xt_multiport xt_mark xt_mac xt_limit xt_length xt_id
xt_hl xt_helper xt_ecn xt_dscp xt_conntrack xt_connmark xt_connlimit
xt_connbytes xt_comment xt_TCPMSS xt_REDIRECT xt_LOG xt_HL xt_DSCP
xt_CT xt_CLASSIFY slhc r8169 nf_reject_ipv4 nf_nat_masquerade_ipv4
nf_nat_ftp nf_nat nf_log_ipv4 nf_defrag_ipv6 nf_defrag_ipv4
nf_conntrack_rtcache nf_conntrack_ftp iptable_raw iptable_mangle
iptable_filter ipt_ECN ip_tables e1000e crc_ccitt act_connmark
nf_conntrack act_skbedit act_mirred em_u32 cls_u32 cls_tcindex
cls_flow cls_route cls_fw sch_hfsc sch_ingress ath10k_pci ath10k_core
ath mac80211 cfg80211 compat ip6t_REJECT nf_reject_ipv6 nf_log_ipv6
nf_log_common ip6table_raw ip6table_mangle ip6table_filter ip6_tables
x_tables e1000 ifb ipv6 arc4 crypto_blkcipher ptp pps_core mii
[39067.323939] CPU: 0 PID: 1779 Comm: hostapd Not tainted 3.18.17 #1
[39067.324485]  0000000000000000 0000000000000009 ffffffff813df544
0000000000000000
[39067.325205]  ffffffff8103d29d ffff88000eddf000 ffff88000e6f0d40
ffff88000d93b730
[39067.325928]  ffff88000dd92740 0000000000000000 ffffffffa00fcb39
000000000dcc2700
[39067.326669] Call Trace:
[39067.326900]  [<ffffffff813df544>] ? dump_stack+0x41/0x51
[39067.327375]  [<ffffffff8103d29d>] ? warn_slowpath_common+0x6d/0x90
[39067.327916]  [<ffffffffa00fcb39>] ? sta_set_sinfo+0x659/0x710 [mac80211]
[39067.328501]  [<ffffffffa00fcc11>] ? __sta_info_destroy+0x21/0x30 [mac80211]
[39067.329101]  [<ffffffffa00fcca2>] ?
sta_info_destroy_addr_bss+0x32/0x50 [mac80211]
[39067.329770]  [<ffffffffa00c17c8>] ?
cfg80211_check_station_change+0xba8/0xf30 [cfg80211]
[39067.330484]  [<ffffffff8135ccc5>] ? genl_family_rcv_msg+0x285/0x300
[39067.331032]  [<ffffffff8135cdb5>] ? genl_rcv_msg+0x75/0xa0
[39067.331513]  [<ffffffff8135cd40>] ? genl_family_rcv_msg+0x300/0x300
[39067.332058]  [<ffffffff8135c12d>] ? netlink_rcv_skb+0x3d/0x90
[39067.332558]  [<ffffffff8135ca2f>] ? genl_rcv+0x1f/0x30
[39067.333007]  [<ffffffff8135bab9>] ? netlink_unicast+0x119/0x200
[39067.333525]  [<ffffffff8135bf67>] ? netlink_sendmsg+0x347/0x3c0
[39067.334036]  [<ffffffff8131f313>] ? sock_sendmsg+0x63/0x80
[39067.334513]  [<ffffffff81320e72>] ? move_addr_to_kernel+0x22/0x40
[39067.335040]  [<ffffffff8132cae8>] ? verify_iovec+0x58/0xc0
[39067.335517]  [<ffffffff81320a47>] ? ___sys_sendmsg.part.34+0x207/0x230
[39067.336085]  [<ffffffff81320ba1>] ? ___sys_recvmsg.part.35+0x131/0x180
[39067.336653]  [<ffffffff81060656>] ? pick_next_task_fair+0x126/0x3f0
[39067.337198]  [<ffffffff810f5a7f>] ? __inode_wait_for_writeback+0x5f/0xa0
[39067.337777]  [<ffffffff811071b2>] ? fsnotify_clear_marks_by_inode+0x22/0x120
[39067.338386]  [<ffffffff81320046>] ? sock_destroy_inode+0x16/0x30
[39067.338908]  [<ffffffff810e7a48>] ? __dentry_kill+0x168/0x1a0
[39067.339410]  [<ffffffff810e7bb1>] ? dput+0x131/0x160
[39067.339841]  [<ffffffff810d55ec>] ? __fput+0x17c/0x1b0
[39067.340287]  [<ffffffff813219a6>] ? __sys_sendmsg+0x46/0x70
[39067.340779]  [<ffffffff813e39c9>] ? system_call_fastpath+0x12/0x17
[39067.341310] ---[ end trace c3f6cd2181514f7b ]---
[39067.341984] ath10k_pci 0000:00:05.0: cipher 0 is not supported
[39067.342497] ------------[ cut here ]------------
[39067.342922] WARNING: CPU: 0 PID: 1779 at
/home/buildbot/slave-local/x86_64/build/build_dir/target-x86_64_uClibc-0.9.33.2/linux-x86_64/compat-wireless-2015-03-09/net/mac80211/sta_info.c:901
sta_set_sinfo+0x599/0x710 [mac80211]()
[39067.344615] Modules linked in: pppoe ppp_async iptable_nat pppox
ppp_generic nf_nat_ipv4 nf_conntrack_ipv6 nf_conntrack_ipv4 ipt_REJECT
ipt_MASQUERADE xt_time xt_tcpudp xt_tcpmss xt_statistic xt_state
xt_recent xt_nat xt_multiport xt_mark xt_mac xt_limit xt_length xt_id
xt_hl xt_helper xt_ecn xt_dscp xt_conntrack xt_connmark xt_connlimit
xt_connbytes xt_comment xt_TCPMSS xt_REDIRECT xt_LOG xt_HL xt_DSCP
xt_CT xt_CLASSIFY slhc r8169 nf_reject_ipv4 nf_nat_masquerade_ipv4
nf_nat_ftp nf_nat nf_log_ipv4 nf_defrag_ipv6 nf_defrag_ipv4
nf_conntrack_rtcache nf_conntrack_ftp iptable_raw iptable_mangle
iptable_filter ipt_ECN ip_tables e1000e crc_ccitt act_connmark
nf_conntrack act_skbedit act_mirred em_u32 cls_u32 cls_tcindex
cls_flow cls_route cls_fw sch_hfsc sch_ingress ath10k_pci ath10k_core
ath mac80211 cfg80211 compat ip6t_REJECT nf_reject_ipv6 nf_log_ipv6
nf_log_common ip6table_raw ip6table_mangle ip6table_filter ip6_tables
x_tables e1000 ifb ipv6 arc4 crypto_blkcipher ptp pps_core mii
[39067.353685] CPU: 0 PID: 1779 Comm: hostapd Tainted: G        W
3.18.17 #1
[39067.354314]  0000000000000000 0000000000000009 ffffffff813df544
0000000000000000
[39067.355028]  ffffffff8103d29d ffff88000e6bf000 ffff88000e6f0d40
ffff88000d93b730
[39067.355777]  ffff88000dd92740 0000000000000000 ffffffffa00fca79
000000000dcc2700
[39067.356488] Call Trace:
[39067.356715]  [<ffffffff813df544>] ? dump_stack+0x41/0x51
[39067.357178]  [<ffffffff8103d29d>] ? warn_slowpath_common+0x6d/0x90
[39067.357717]  [<ffffffffa00fca79>] ? sta_set_sinfo+0x599/0x710 [mac80211]
[39067.358309]  [<ffffffffa00fcc11>] ? __sta_info_destroy+0x21/0x30 [mac80211]
[39067.358928]  [<ffffffffa00fcca2>] ?
sta_info_destroy_addr_bss+0x32/0x50 [mac80211]
[39067.359593]  [<ffffffffa00c17c8>] ?
cfg80211_check_station_change+0xba8/0xf30 [cfg80211]
[39067.360298]  [<ffffffff8135ccc5>] ? genl_family_rcv_msg+0x285/0x300
[39067.360875]  [<ffffffff8135cdb5>] ? genl_rcv_msg+0x75/0xa0
[39067.361348]  [<ffffffff8135cd40>] ? genl_family_rcv_msg+0x300/0x300
[39067.361887]  [<ffffffff8135c12d>] ? netlink_rcv_skb+0x3d/0x90
[39067.362384]  [<ffffffff8135ca2f>] ? genl_rcv+0x1f/0x30
[39067.362830]  [<ffffffff8135bab9>] ? netlink_unicast+0x119/0x200
[39067.363343]  [<ffffffff8135bf67>] ? netlink_sendmsg+0x347/0x3c0
[39067.363863]  [<ffffffff8131f313>] ? sock_sendmsg+0x63/0x80
[39067.364344]  [<ffffffff81320e72>] ? move_addr_to_kernel+0x22/0x40
[39067.364876]  [<ffffffff8132cae8>] ? verify_iovec+0x58/0xc0
[39067.365350]  [<ffffffff81320a47>] ? ___sys_sendmsg.part.34+0x207/0x230
[39067.365919]  [<ffffffff81320ba1>] ? ___sys_recvmsg.part.35+0x131/0x180
[39067.366483]  [<ffffffff8131fe21>] ? sockfd_lookup_light+0x11/0x70
[39067.367016]  [<ffffffff810d55ec>] ? __fput+0x17c/0x1b0
[39067.367473]  [<ffffffff813219a6>] ? __sys_sendmsg+0x46/0x70
[39067.367972]  [<ffffffff813e39c9>] ? system_call_fastpath+0x12/0x17
[39067.368520] ---[ end trace c3f6cd2181514f7c ]---
[42801.354141] ath10k_warn: 8 callbacks suppressed
[42801.354554] ath10k_pci 0000:00:05.0: Spurious quick kickout for STA
yy:yy:yy:yy:yy:yy
[62612.023120] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
skipped old beacon
...
[63185.118114] ath10k_pci 0000:00:05.0: SWBA overrun on vdev 0,
skipped old beacon

--
Igor

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
