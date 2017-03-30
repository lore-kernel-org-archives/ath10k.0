Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctdwW-0006km-IO
 for ath10k@lists.infradead.org; Thu, 30 Mar 2017 17:33:08 +0000
Received: by mail-qk0-x22c.google.com with SMTP id d201so16559128qkc.0
 for <ath10k@lists.infradead.org>; Thu, 30 Mar 2017 10:32:43 -0700 (PDT)
MIME-Version: 1.0
From: Chirag Shahani <chirag.shahani@gmail.com>
Date: Thu, 30 Mar 2017 10:32:42 -0700
Message-ID: <CAEi_5N3aP1F5ChkZ64jxpKmAAAEVwq0Ep_LGRnhFDfC6=N5v1w@mail.gmail.com>
Subject: firmware version 10.2.4.70.54 crash when running on centos-7.3(kernel
 version -> 3.10.0-514.el7.x86_64)
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

I am using the ath10_pci driver with firmware version 10.2.4.70.54
running on centos-7.3(kernel version -> 3.10.0-514.el7.x86_64). The
driver came with centos 7.3 install. Could you please confirm this
firmware is supported for this kernel version.

I have openVswitch installed and have wlan0 mapped to a port on the
ovs bridge. On starting ovs, wlan enters into promiscuous mode and the
ovs bridge does all the switching. I have ap_isolate=1 and hence all
the traffic is switched by the ovs bridge. I am however seeing crashes
in the firmware. After the crash, even restarting the hostapd does not
work. The only way to recover is to reboot the box.

PFA hostapd.conf

The crashes I am seeing are as follows and also the hostapd I am using.

Mar 29 10:38:18 localhost kernel: ath10k_pci 0000:04:00.0: firmware
crashed! (uuid 18ca97f3-80bb-4cad-a763-e4cb368d138b)
Mar 29 10:38:18 localhost kernel: ath10k_pci 0000:04:00.0: qca988x
hw2.0 target 0x4100016c chip_id 0x043222ff sub 0000:0000
Mar 29 10:38:18 localhost kernel: ath10k_pci 0000:04:00.0: kconfig
debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
Mar 29 10:38:18 localhost kernel: ath10k_pci 0000:04:00.0: firmware
ver 10.2.4.70.54 api 5 features no-p2p,raw-mode,mfp crc32 9d340dd9
Mar 29 10:38:18 localhost kernel: ath10k_pci 0000:04:00.0: board_file
api 1 bmi_id N/A crc32 bebc7c08
Mar 29 10:38:18 localhost kernel: ath10k_pci 0000:04:00.0: htt-ver 2.1
wmi-op 5 htt-op 2 cal otp max-sta 128 raw 0 hwcrypto 1
Mar 29 10:38:18 localhost kernel: ath10k_pci 0000:04:00.0: failed to
read diag value at 0xdf900804: -16
Mar 29 10:38:18 localhost kernel: ath10k_pci 0000:04:00.0: failed to
get memcpy hi address for firmware address 4: -16
Mar 29 10:38:18 localhost kernel: ath10k_pci 0000:04:00.0: failed to
read firmware dump area: -16
Mar 29 10:38:18 localhost kernel: ieee80211 phy0: Hardware restart was requested
Mar 29 10:38:18 localhost kernel: ath10k_pci 0000:04:00.0: failed to
read diag value at 0xdf900800: -16
Mar 29 10:38:18 localhost kernel: ath10k_pci 0000:04:00.0: failed to
poke copy engine: -16
Mar 29 10:38:18 localhost kernel: ath10k_pci 0000:04:00.0: failed to
read diag value at 0xdf900800: -16
Mar 29 10:38:18 localhost kernel: ath10k_pci 0000:04:00.0: failed to
poke copy engine: -16
Mar 29 10:38:18 localhost kernel: ath10k_pci 0000:04:00.0: failed to
read diag value at 0xdf900800: -16
Mar 29 10:38:18 localhost kernel: ath10k_pci 0000:04:00.0: failed to
poke copy engine: -16
Mar 29 10:38:21 localhost kernel: ath10k_pci 0000:04:00.0: failed to
read device register, device is gone
Mar 29 10:38:21 localhost kernel: ath10k_pci 0000:04:00.0: failed to
wait for target after cold reset: -5
Mar 29 10:38:21 localhost kernel: ath10k_pci 0000:04:00.0: firmware
crashed during chip reset
Mar 29 10:38:21 localhost kernel: ath10k_pci 0000:04:00.0: firmware
crashed! (uuid dfd81400-6bef-4995-990c-2e23e9e2f94b)
Mar 29 10:38:21 localhost kernel: ath10k_pci 0000:04:00.0: qca988x
hw2.0 target 0x4100016c chip_id 0x043222ff sub 0000:0000
Mar 29 10:38:21 localhost kernel: ath10k_pci 0000:04:00.0: kconfig
debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
Mar 29 10:38:21 localhost kernel: ath10k_pci 0000:04:00.0: firmware
ver 10.2.4.70.54 api 5 features no-p2p,raw-mode,mfp crc32 9d340dd9
Mar 29 10:38:21 localhost kernel: ath10k_pci 0000:04:00.0: board_file
api 1 bmi_id N/A crc32 bebc7c08
Mar 29 10:38:21 localhost kernel: ath10k_pci 0000:04:00.0: htt-ver 2.1
wmi-op 5 htt-op 2 cal otp max-sta 128 raw 0 hwcrypto 1
Mar 29 10:38:21 localhost kernel: ath10k_pci 0000:04:00.0: failed to
read firmware dump area: -28
Mar 29 10:38:21 localhost kernel: ath10k_pci 0000:04:00.0: failed to
reset chip: -5
Mar 29 10:38:21 localhost kernel: ath10k_pci 0000:04:00.0: Could not
init hif: -5
Mar 29 10:38:21 localhost kernel: ------------[ cut here ]------------
Mar 29 10:38:21 localhost kernel: WARNING: at net/mac80211/util.c:1821
ieee80211_reconfig+0x89/0xf30 [mac80211]()
Mar 29 10:38:21 localhost kernel: Hardware became unavailable during restart.
Mar 29 10:38:21 localhost kernel: Modules linked in: nfsv3
rpcsec_gss_krb5 nfsv4 dns_resolver nfs fscache cls_fw xt_mark
vport_vxlan vxlan ip6_udp_tunnel udp_tunnel vport_gre ip_gre ip_tunnel
gre 8021q garp mrp sch_htb sch_ingress veth ip6t_rpfilter ipt_REJECT
nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set
nfnetlink ebtable_nat ebtable_broute bridge stp llc ip6table_nat
ip6table_mangle ip6table_security ip6table_raw iptable_nat
iptable_mangle iptable_security iptable_raw ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter openvswitch
nf_conntrack_ipv6 nf_nat_ipv6 nf_conntrack_ipv4 nf_defrag_ipv4
nf_nat_ipv4 nf_defrag_ipv6 nf_nat nf_conntrack libcrc32c arc4
intel_powerclamp coretemp kvm_intel kvm ath10k_pci ath10k_core
irqbypass ath crc32_pclmul mac80211 ghash_clmulni_intel aesni_intel
lrw
Mar 29 10:38:21 localhost kernel: gf128mul glue_helper gpio_ich
ablk_helper cfg80211 cryptd iTCO_wdt iTCO_vendor_support rfkill
ipmi_ssif pcspkr sg lpc_ich i2c_i801 ipmi_msghandler i2c_ismt shpchp
nfsd auth_rpcgss nfs_acl lockd grace sunrpc ip_tables ext4 mbcache
jbd2 sd_mod crc_t10dif crct10dif_generic uas crct10dif_pclmul
crct10dif_common crc32c_intel ahci libahci usb_storage igb serio_raw
ptp libata pps_core i2c_algo_bit i2c_core dca fjes
Mar 29 10:38:21 localhost kernel: CPU: 0 PID: 23235 Comm: kworker/0:1
Not tainted 3.10.0-514.el7.x86_64 #1
Mar 29 10:38:21 localhost kernel: Hardware name: Nuage Networks 7850
NSG-E/7850 NSG-E, BIOS 5.6.5 02/24/2015
Mar 29 10:38:21 localhost kernel: Workqueue: events_freezable
ieee80211_restart_work [mac80211]
Mar 29 10:38:21 localhost kernel: ffff8800729ebd38 00000000393a2f4a
ffff8800729ebcf0 ffffffff81685fac
Mar 29 10:38:21 localhost kernel: ffff8800729ebd28 ffffffff81085820
ffff8801797a06e0 00000000fffffffb
Mar 29 10:38:21 localhost kernel: ffff8801797a1360 ffff8801797a06e0
0000000000000000 ffff8800729ebd90
Mar 29 10:38:21 localhost kernel: Call Trace:
Mar 29 10:38:21 localhost kernel: [<ffffffff81685fac>] dump_stack+0x19/0x1b
Mar 29 10:38:21 localhost kernel: [<ffffffff81085820>]
warn_slowpath_common+0x70/0xb0
Mar 29 10:38:21 localhost kernel: [<ffffffff810858bc>]
warn_slowpath_fmt+0x5c/0x80
Mar 29 10:38:21 localhost kernel: [<ffffffffa03e8664>] ?
drv_start+0x44/0xf0 [mac80211]
Mar 29 10:38:21 localhost kernel: [<ffffffffa0419069>]
ieee80211_reconfig+0x89/0xf30 [mac80211]
Mar 29 10:38:21 localhost kernel: [<ffffffffa03e5201>]
ieee80211_restart_work+0x91/0xd0 [mac80211]
Mar 29 10:38:21 localhost kernel: [<ffffffff810a7f3b>]
process_one_work+0x17b/0x470
Mar 29 10:38:21 localhost kernel: [<ffffffff810a8d76>] worker_thread+0x126/0x410
Mar 29 10:38:21 localhost kernel: [<ffffffff810a8c50>] ?
rescuer_thread+0x460/0x460
Mar 29 10:38:21 localhost kernel: [<ffffffff810b052f>] kthread+0xcf/0xe0
Mar 29 10:38:21 localhost kernel: [<ffffffff810b0460>] ?
kthread_create_on_node+0x140/0x140
Mar 29 10:38:21 localhost kernel: [<ffffffff81696518>] ret_from_fork+0x58/0x90
Mar 29 10:38:21 localhost kernel: [<ffffffff810b0460>] ?
kthread_create_on_node+0x140/0x140
Mar 29 10:38:21 localhost kernel: ---[ end trace e13d047e58b7320f ]---
Mar 29 10:38:21 localhost kernel: ------------[ cut here ]------------
Mar 29 10:38:21 localhost kernel: WARNING: at
net/mac80211/driver-ops.h:17 __sta_info_destroy_part1+0x468/0x4b0
[mac80211]()
Mar 29 10:38:21 localhost kernel: wlan0:  Failed check-sdata-in-driver
check, flags: 0x8
Mar 29 10:38:22 localhost kernel: Modules linked in: nfsv3
rpcsec_gss_krb5 nfsv4 dns_resolver nfs fscache cls_fw xt_mark
vport_vxlan vxlan ip6_udp_tunnel udp_tunnel vport_gre ip_gre ip_tunnel
gre 8021q garp mrp sch_htb sch_ingress veth ip6t_rpfilter ipt_REJECT
nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set
nfnetlink ebtable_nat ebtable_broute bridge stp llc ip6table_nat
ip6table_mangle ip6table_security ip6table_raw iptable_nat
iptable_mangle iptable_security iptable_raw ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter openvswitch
nf_conntrack_ipv6 nf_nat_ipv6 nf_conntrack_ipv4 nf_defrag_ipv4
nf_nat_ipv4 nf_defrag_ipv6 nf_nat nf_conntrack libcrc32c arc4
intel_powerclamp coretemp kvm_intel kvm ath10k_pci ath10k_core
irqbypass ath crc32_pclmul mac80211 ghash_clmulni_intel aesni_intel
lrw
Mar 29 10:38:22 localhost kernel: gf128mul glue_helper gpio_ich
ablk_helper cfg80211 cryptd iTCO_wdt iTCO_vendor_support rfkill
ipmi_ssif pcspkr sg lpc_ich i2c_i801 ipmi_msghandler i2c_ismt shpchp
nfsd auth_rpcgss nfs_acl lockd grace sunrpc ip_tables ext4 mbcache
jbd2 sd_mod crc_t10dif crct10dif_generic uas crct10dif_pclmul
crct10dif_common crc32c_intel ahci libahci usb_storage igb serio_raw
ptp libata pps_core i2c_algo_bit i2c_core dca fjes
Mar 29 10:38:22 localhost kernel: CPU: 0 PID: 23235 Comm: kworker/0:1
Tainted: G        W      ------------   3.10.0-514.el7.x86_64 #1
Mar 29 10:38:22 localhost kernel: Hardware name: Nuage Networks 7850
NSG-E/7850 NSG-E, BIOS 5.6.5 02/24/2015
Mar 29 10:38:22 localhost kernel: Workqueue: events_freezable
ieee80211_restart_work [mac80211]
Mar 29 10:38:22 localhost kernel: ffff8800729eb9c0 00000000393a2f4a
ffff8800729eb978 ffffffff81685fac
Mar 29 10:38:22 localhost kernel: ffff8800729eb9b0 ffffffff81085820
ffff880177bd88c0 ffff8801797a06e0
Mar 29 10:38:22 localhost kernel: ffff880178be3000 ffff880178be3030
ffff880036b53438 ffff8800729eba18
Mar 29 10:38:22 localhost kernel: Call Trace:
Mar 29 10:38:22 localhost kernel: [<ffffffff81685fac>] dump_stack+0x19/0x1b
Mar 29 10:38:22 localhost kernel: [<ffffffff81085820>]
warn_slowpath_common+0x70/0xb0
Mar 29 10:38:22 localhost kernel: [<ffffffff810858bc>]
warn_slowpath_fmt+0x5c/0x80
Mar 29 10:38:22 localhost kernel: [<ffffffffa03f4bec>] ?
ieee80211_sta_tear_down_BA_sessions+0x5c/0x70 [mac80211]
Mar 29 10:38:22 localhost kernel: [<ffffffffa03eb618>]
__sta_info_destroy_part1+0x468/0x4b0 [mac80211]
Mar 29 10:38:22 localhost kernel: [<ffffffffa03edd3c>]
__sta_info_flush+0x15c/0x1c0 [mac80211]
Mar 29 10:38:22 localhost kernel: [<ffffffffa0404088>]
ieee80211_stop_ap+0x138/0x340 [mac80211]
Mar 29 10:38:22 localhost kernel: [<ffffffffa0344cb4>]
__cfg80211_stop_ap+0x74/0x220 [cfg80211]
Mar 29 10:38:22 localhost kernel: [<ffffffffa0316390>]
__cfg80211_leave+0x100/0x150 [cfg80211]
Mar 29 10:38:22 localhost kernel: [<ffffffffa031640b>]
cfg80211_leave+0x2b/0x40 [cfg80211]
Mar 29 10:38:22 localhost kernel: [<ffffffffa03167c3>]
cfg80211_netdev_notifier_call+0x3a3/0x530 [cfg80211]
Mar 29 10:38:22 localhost kernel: [<ffffffff81691fbc>]
notifier_call_chain+0x4c/0x70
Mar 29 10:38:22 localhost kernel: [<ffffffff810b66a6>]
raw_notifier_call_chain+0x16/0x20
Mar 29 10:38:22 localhost kernel: [<ffffffff8156bacd>]
call_netdevice_notifiers_info+0x4d/0x80
Mar 29 10:38:22 localhost kernel: [<ffffffff8156bc49>]
__dev_close_many+0x59/0x100
Mar 29 10:38:22 localhost kernel: [<ffffffff8156be18>] dev_close_many+0x98/0x120
Mar 29 10:38:22 localhost kernel: [<ffffffff8156bf20>] dev_close+0x80/0xa0
Mar 29 10:38:22 localhost kernel: [<ffffffffa0315d35>]
cfg80211_shutdown_all_interfaces+0x45/0xb0 [cfg80211]
Mar 29 10:38:22 localhost kernel: [<ffffffffa04170d5>]
ieee80211_handle_reconfig_failure+0xa5/0xc0 [mac80211]
Mar 29 10:38:22 localhost kernel: [<ffffffffa0419071>]
ieee80211_reconfig+0x91/0xf30 [mac80211]
Mar 29 10:38:22 localhost kernel: [<ffffffffa03e5201>]
ieee80211_restart_work+0x91/0xd0 [mac80211]


Could you please let me know how to debug this and if you need any
info from my end.
Thank you,
--Chirag

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
