Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcKYE-0003eV-H0
 for ath10k@lists.infradead.org; Mon, 09 Jul 2018 01:01:16 +0000
Received: by mail-pf0-x22c.google.com with SMTP id c21-v6so7763468pfn.8
 for <ath10k@lists.infradead.org>; Sun, 08 Jul 2018 18:01:03 -0700 (PDT)
MIME-Version: 1.0
From: Ansuel Smith <ansuelsmth@gmail.com>
Date: Mon, 9 Jul 2018 03:00:51 +0200
Message-ID: <CA+_ehUwejcTt5u+yf35jNeJ0KtRtVDatevhv2mZeq+qDDCfKnw@mail.gmail.com>
Subject: kernel panic
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

By executing this command

cat /sys/kernel/debug/ieee80211/phy1/ath10k/tpc_stats
cat /sys/kernel/debug/ieee80211/phy1/ath10k/tpc_stats_final i get
can't access tpc_stats

Can someone check this?

i get this kernel panic

[ 1380.213122] Kernel panic - not syncing: stack-protector: Kernel
stack is corrupted in: bf7fad20 [ 1380.213122] [ 1380.213187] CPU1:
stopping [ 1380.222380] CPU: 1 PID: 3414 Comm: cat Not tainted 4.14.53
#0 [ 1380.224892] Hardware name: Generic DT based system [
1380.230755] [<c030f8e8>] (unwind_backtrace) from [<c030bb2c>]
(show_stack+0x14/0x20) [ 1380.235423] [<c030bb2c>] (show_stack) from
[<c07846d8>] (dump_stack+0x88/0x9c) [ 1380.243314] [<c07846d8>]
(dump_stack) from [<c030eb58>] (handle_IPI+0xf4/0x1a8) [ 1380.250343]
[<c030eb58>] (handle_IPI) from [<c03014b8>] (gic_handle_irq+0x9c/0xb8)
[ 1380.257546] [<c03014b8>] (gic_handle_irq) from [<c030c70c>]
(__irq_svc+0x6c/0x90) [ 1380.265176] Exception stack(0xdb7cbce8 to
0xdb7cbd30) [ 1380.272753] bce0: 00000002 0000004e 00000000 00000004
e0965145 bf809f78 [ 1380.277797] bd00: bf809f78 db7cbd8c 00000014
e0a65000 c07dffa0 000ffecf 00000043 db7cbd38 [ 1380.285941] bd20:
c079877c c0798780 80000013 ffffffff [ 1380.294096] [<c030c70c>]
(__irq_svc) from [<c0798780>] (vsnprintf+0x74/0x490) [ 1380.299129]
[<c0798780>] (vsnprintf) from [<c0798c34>] (scnprintf+0x28/0x54) [
1380.306328] [<c0798c34>] (scnprintf) from [<bf7e3334>]
(ath10k_info+0xe8/0x1dc [ath10k_core]) [ 1380.313580] [<bf7e3334>]
(ath10k_info [ath10k_core]) from [<bf7e534c>]
(ath10k_tpc_stats_open+0x30c/0x40c [ath10k_core]) [ 1380.321853]
[<bf7e534c>] (ath10k_tpc_stats_open [ath10k_core]) from [<c04a48c8>]
(full_proxy_open+0x168/0x20c) [ 1380.332737] [<c04a48c8>]
(full_proxy_open) from [<c03e39e4>]
(do_dentry_open.constprop.4+0x208/0x344) [ 1380.342538] [<c03e39e4>]
(do_dentry_open.constprop.4) from [<c03f6310>]
(path_openat+0xd00/0x10b0) [ 1380.351821] [<c03f6310>] (path_openat)
from [<c03f7624>] (do_filp_open+0x68/0xc0) [ 1380.360679] [<c03f7624>]
(do_filp_open) from [<c03e4c8c>] (do_sys_open+0x16c/0x20c) [
1380.368233] [<c03e4c8c>] (do_sys_open) from [<c0307f60>]
(ret_fast_syscall+0x0/0x54) [ 1380.375697] Rebooting in 3 seconds.. [
1384.384703] BUG: scheduling while atomic: swapper/0/0/0x00000100 [
1384.384732] Modules linked in: pppoe ppp_async ath10k_pci ath10k_core
ath pptp pppox ppp_mppe ppp_generic mac80211 iptable_nat ipt_REJECT
ipt_MASQUERADE cfg80211 xt_time xt_tcpudp xt_tcpmss xt_statistic
xt_state xt_recent xt_nat xt_multiport xt_mark xt_mac xt_limit
xt_length xt_hl xt_helper xt_esp xt_ecn xt_dscp xt_conntrack
xt_connmark xt_connlimit xt_connbytes xt_comment xt_TCPMSS xt_REDIRECT
xt_LOG xt_HL xt_FLOWOFFLOAD xt_DSCP xt_CLASSIFY usbserial slhc
nf_reject_ipv4 nf_nat_rtsp nf_nat_redirect nf_nat_masquerade_ipv4
nf_conntrack_ipv4 nf_nat_ipv4 nf_log_ipv4 nf_flow_table_hw
nf_flow_table nf_defrag_ipv4 nf_conntrack_rtsp nf_conntrack_rtcache
nf_conntrack_netlink iptable_mangle iptable_filter ipt_ah ipt_ECN
ip_tables crc_ccitt compat chaoskey fuse sch_cake act_skbedit
act_mirred em_u32 cls_u32 [ 1384.437764] cls_tcindex cls_flow
cls_route cls_fw sch_tbf sch_htb sch_hfsc sch_ingress ledtrig_usbport
xt_set ip_set_list_set ip_set_hash_netiface ip_set_hash_netport
ip_set_hash_netnet ip_set_hash_net ip_set_hash_netportnet
ip_set_hash_mac ip_set_hash_ipportnet ip_set_hash_ipportip
ip_set_hash_ipport ip_set_hash_ipmark ip_set_hash_ip
ip_set_bitmap_port ip_set_bitmap_ipmac ip_set_bitmap_ip ip_set
nfnetlink ip6t_NPT ip6t_MASQUERADE nf_nat_masquerade_ipv6 ip6table_nat
nf_conntrack_ipv6 nf_defrag_ipv6 nf_nat_ipv6 nf_nat nf_conntrack
ip6t_REJECT nf_reject_ipv6 nf_log_ipv6 nf_log_common ip6table_mangle
ip6table_filter ip6_

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
