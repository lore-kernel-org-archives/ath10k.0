Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMJxC-0008Px-AP
 for ath10k@lists.infradead.org; Tue, 26 Aug 2014 16:50:44 +0000
Received: from [50.54.140.2] (50-54-140-2.evrt.wa.frontiernet.net
 [50.54.140.2])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 6C7F440BB5C
 for <ath10k@lists.infradead.org>; Tue, 26 Aug 2014 09:50:19 -0700 (PDT)
Message-ID: <53FCBACA.5010608@candelatech.com>
Date: Tue, 26 Aug 2014 09:50:18 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Splats after firmware crash.
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
To: ath10k <ath10k@lists.infradead.org>

Firmware is my CT firmware, so it is modified, but kernel is very close to
linux.ath tree, just some firmware debug logging patch applied, and it is unlikely
to cause any of these splats I think:


[  348.215891] ath10k: simulating hard firmware crash
[  348.216091] ath10k: firmware crashed! (uuid 0864d253-f2f4-4e18-a0ad-a37667dc003c)
[  348.222331] ath10k: qca988x hw2.0 (0x4100016c, 0x043202ff) fw 10.1.467-ct-swcrypt-diet-011 api 2 htt 2.1
[  348.222333] ath10k: debug 1 debugfs 1 tracing 1 dfs 1
[  348.224359] ath10k: firmware register dump:
[  348.227266] ath10k: [00]: 0x4100016C 0x000015B3 0x0099CA20 0x00955B31
[  348.232445] ath10k: [04]: 0x0099CA20 0x00060730 0x0000001F 0x00000011
[  348.237624] ath10k: [08]: 0x0000901A 0x0040C930 0x00000000 0x00415BF8
[  348.242801] ath10k: [12]: 0x00000009 0x00000003 0x009AC898 0x009AC8FB
[  348.247975] ath10k: [16]: 0x00958080 0x0094085D 0x00000000 0x00000000
[  348.253151] ath10k: [20]: 0x4099CA20 0x0040ACF4 0x0000000C 0x00000001
[  348.258330] ath10k: [24]: 0x809AC91E 0x0040AD54 0x00000000 0xC099CA20
[  348.263506] ath10k: [28]: 0x809A8F7A 0x0040ADD4 0x00400000 0x0041564C
[  348.268683] ath10k: [32]: 0x809A8703 0x0040AE24 0x0040AE48 0x00410ECC
[  348.273863] ath10k: [36]: 0x809486FA 0x0040AE44 0x00000001 0x00000000
[  348.279041] ath10k: [40]: 0x80948E2C 0x0040AEA4 0x0041D3E8 0x004114D4
[  348.284218] ath10k: [44]: 0x80942EB3 0x0040AEC4 0x0041D3E8 0x00000001
[  348.289393] ath10k: [48]: 0x80940F18 0x0040AF14 0x00000010 0x00403AC0
[  348.294568] ath10k: [52]: 0x80940EEA 0x0040AF44 0x00400000 0x00000000
[  348.299743] ath10k: [56]: 0x80940F31 0x0040AF64 0x00401C10 0x00400600
[  348.308955] ath10k: save-fw-dbg-buf, next-idx: 461 first-idx: 0  len: 190
[  348.308957] ath10k: Dropping dbg buffer due to crash since read.
[  348.310066] ath10k: boot hif stop
[  348.310992] ath10k: boot warm reset
[  348.310996] ath10k: boot host cpu intr cause: 0x00000000
[  348.311000] ath10k: boot target cpu intr cause: 0x0000400a
[  348.455367] ath10k: boot host cpu intr cause: 0x00000000
[  348.455373] ath10k: boot target cpu intr cause: 0x0000000a
[  348.455380] ath10k: boot target reset state: 0x00000800
[  348.556378] ath10k: boot warm reset complete
[  348.556402] ieee80211 wiphy1: Hardware restart was requested
[  348.557234] ath10k: mac monitor refs: promisc 0 monitor 0 cac 0
[  348.557279] ath10k: boot hif stop
[  348.557377] ath10k: boot warm reset
[  348.557382] ath10k: boot host cpu intr cause: 0x00000000
[  348.557387] ath10k: boot target cpu intr cause: 0x0000000a
[  348.702387] ath10k: boot host cpu intr cause: 0x00000000
[  348.702394] ath10k: boot target cpu intr cause: 0x0000000a
[  348.702403] ath10k: boot target reset state: 0x00000800
[  348.803394] ath10k: boot warm reset complete
[  348.805035] ath10k: boot hif power down
[  348.805038] ath10k: boot warm reset
[  348.805042] ath10k: boot host cpu intr cause: 0x00000000
[  348.805046] ath10k: boot target cpu intr cause: 0x0000000a
[  348.949348] ath10k: boot host cpu intr cause: 0x00000000
[  348.949355] ath10k: boot target cpu intr cause: 0x0000000a
[  348.949363] ath10k: boot target reset state: 0x00000800
[  349.050410] ath10k: boot warm reset complete
[  349.050421] ath10k: boot hif power up
[  349.050424] ath10k: boot warm reset
[  349.050430] ath10k: boot host cpu intr cause: 0x00000000
[  349.050435] ath10k: boot target cpu intr cause: 0x0000000a
[  349.195450] ath10k: boot host cpu intr cause: 0x00000000
[  349.195457] ath10k: boot target cpu intr cause: 0x0000000a
[  349.195465] ath10k: boot target reset state: 0x00000800
[  349.296437] ath10k: boot warm reset complete
[  349.296462] ath10k: boot init ce src ring id 0 entries 16 base_addr ffff8800c63b5000
[  349.296481] ath10k: boot ce dest ring id 1 entries 512 base_addr ffff880037874000
[  349.296500] ath10k: boot ce dest ring id 2 entries 32 base_addr ffff8800c6ab7000
[  349.296524] ath10k: boot init ce src ring id 3 entries 32 base_addr ffff8800c6b02000
[  349.296544] ath10k: boot init ce src ring id 4 entries 4096 base_addr ffff8800c6800000
[  349.296564] ath10k: boot init ce src ring id 7 entries 2 base_addr ffff880037899000
[  349.296579] ath10k: boot ce dest ring id 7 entries 2 base_addr ffff8800c6120000
[  349.296580] ath10k: boot waiting target to initialise
[  349.296584] ath10k: boot target indicator 2
[  349.296585] ath10k: boot target initialised
[  349.308092] ath10k: boot push board extended data addr 0x0
[  349.312292] ath10k: boot upload otp to 0x1234 len 7500
[  349.341922] ath10k: boot otp execute result 0
[  350.154559] ath10k: htt tx max num pending tx 1424
[  350.155248] ath10k: htt rx ring size 1024 fill_level 1000
[  350.155250] ath10k: boot hif start
[  351.155606] ath10k: failed to receive control response completion, polling..
[  351.155661] ath10k: boot htc service 'Control' ul pipe 0 dl pipe 1 eid 0 ready
[  351.155665] ath10k: boot htc ep 0 ul polled 0 dl polled 0
[  351.155669] ath10k: boot htc service 'Control' eid 0 TX flow control disabled
[  351.155673] ath10k: boot htc service HTT Data does not allocate target credits
[  352.155686] ath10k: Service connect timeout: -110
[  352.159133] ath10k: failed to connect htt (-110)
[  352.162485] ath10k: boot hif stop
[  352.163500] ath10k: boot warm reset
[  352.163505] ath10k: boot host cpu intr cause: 0x00000000
[  352.163508] ath10k: boot target cpu intr cause: 0x00000000
[  352.307706] ath10k: boot host cpu intr cause: 0x00000000
[  352.307713] ath10k: boot target cpu intr cause: 0x00000000
[  352.307720] ath10k: boot target reset state: 0x00000800
[  352.408711] ath10k: boot warm reset complete
[  352.410113] ath10k: Could not init core: -110
[  352.413211] ath10k: boot hif power down
[  352.413213] ath10k: boot warm reset
[  352.413219] ath10k: boot host cpu intr cause: 0x00000000
[  352.413223] ath10k: boot target cpu intr cause: 0x00000000
[  352.557725] ath10k: boot host cpu intr cause: 0x00000000
[  352.557732] ath10k: boot target cpu intr cause: 0x00000000
[  352.557740] ath10k: boot target reset state: 0x00000800
[  352.658733] ath10k: boot warm reset complete
[  352.658739] ------------[ cut here ]------------
[  352.658796] WARNING: CPU: 2 PID: 162 at /mnt/sda/home/greearb/git/linux.ath/net/mac80211/util.c:1660 ieee80211_reconfig+0x139/0xab7 [mac80211]()
[  352.658799] Hardware became unavailable during restart.
[  352.658802] Modules linked in: iptable_raw xt_CT nf_conntrack_netlink nfnetlink nf_nat_ipv4 nf_nat veth 8021q garp stp mrp llc fuse macvlan pktgen ip6table_filter ip6_tables ebtable_nat ebtables nfsv3 nfs_acl rpcsec_gss_krb5 auth_rpcgss oid_registry nfsv4 nfs lockd sunrpc fscache gpio_ich iTCO_wdt iTCO_vendor_support ppdev e1000e coretemp hwmon intel_powerclamp ath10k_pci ath10k_core ath kvm mac80211 serio_raw snd_hda_codec_realtek microcode snd_hda_codec_generic pcspkr ptp pps_core snd_hda_intel snd_hda_controller snd_hda_codec cfg80211 snd_hwdep snd_seq snd_seq_device shpchp snd_pcm i2c_i801 snd_timer snd soundcore lpc_ich parport_pc parport uinput ipv6 i915 i2c_algo_bit drm_kms_helper ata_generic pata_acpi drm i2c_core video [last unloaded: iptable_nat]
[  352.658878] CPU: 2 PID: 162 Comm: kworker/2:1 Tainted: G         C    3.16.0-wl-ath+ #16
[  352.658880] Hardware name: To be filled by O.E.M. To be filled by O.E.M./To be filled by O.E.M., BIOS 4.6.3 03/06/2012
[  352.658890] Workqueue: events ieee80211_restart_work [mac80211]
[  352.658892]  0000000000000009 ffff880220273c48 ffffffff8163d017 0000000000000006
[  352.658896]  ffff880220273c98 ffff880220273c88 ffffffff810cea7e ffff8800c6853748
[  352.658900]  ffffffffa04cb1a8 ffff8800c6850960 00000000ffffff92 ffff88022bd140c0
[  352.658904] Call Trace:
[  352.658912]  [<ffffffff8163d017>] dump_stack+0x4e/0x71
[  352.658917]  [<ffffffff810cea7e>] warn_slowpath_common+0x7c/0x96
[  352.658934]  [<ffffffffa04cb1a8>] ? ieee80211_reconfig+0x139/0xab7 [mac80211]
[  352.658936]  [<ffffffff810ceb2c>] warn_slowpath_fmt+0x41/0x43
[  352.658944]  [<ffffffffa06d1d78>] ? ath10k_start+0x1a8/0x1b4 [ath10k_core]
[  352.658960]  [<ffffffffa04cb1a8>] ieee80211_reconfig+0x139/0xab7 [mac80211]
[  352.658965]  [<ffffffff81643339>] ? mutex_unlock+0x9/0xb
[  352.658974]  [<ffffffffa04a49c8>] ieee80211_restart_work+0x5e/0x68 [mac80211]
[  352.658978]  [<ffffffff810e5aa8>] process_one_work+0x1f2/0x368
[  352.658981]  [<ffffffff810e5a14>] ? process_one_work+0x15e/0x368
[  352.658984]  [<ffffffff810e5eb9>] worker_thread+0x271/0x34e
[  352.658987]  [<ffffffff810e5c48>] ? process_scheduled_works+0x2a/0x2a
[  352.658992]  [<ffffffff810eb33e>] kthread+0xc4/0xcc
[  352.658996]  [<ffffffff81644602>] ? _raw_spin_unlock_irq+0x28/0x42
[  352.658999]  [<ffffffff810eb27a>] ? __kthread_parkme+0x5c/0x5c
[  352.659001]  [<ffffffff81644bfc>] ret_from_fork+0x7c/0xb0
[  352.659004]  [<ffffffff810eb27a>] ? __kthread_parkme+0x5c/0x5c
[  352.659006] ---[ end trace c5c000199dbf8dd0 ]---
[  352.659345] ------------[ cut here ]------------
[  352.659357] WARNING: CPU: 2 PID: 162 at /mnt/sda/home/greearb/git/linux.ath/net/mac80211/driver-ops.h:12 drv_ampdu_action.constprop.2+0x77/0x193 [mac80211]()
[  352.659359] vap1:  Failed check-sdata-in-driver check, flags: 0x0
[  352.659360] Modules linked in: iptable_raw xt_CT nf_conntrack_netlink nfnetlink nf_nat_ipv4 nf_nat veth 8021q garp stp mrp llc fuse macvlan pktgen ip6table_filter ip6_tables ebtable_nat ebtables nfsv3 nfs_acl rpcsec_gss_krb5 auth_rpcgss oid_registry nfsv4 nfs lockd sunrpc fscache gpio_ich iTCO_wdt iTCO_vendor_support ppdev e1000e coretemp hwmon intel_powerclamp ath10k_pci ath10k_core ath kvm mac80211 serio_raw snd_hda_codec_realtek microcode snd_hda_codec_generic pcspkr ptp pps_core snd_hda_intel snd_hda_controller snd_hda_codec cfg80211 snd_hwdep snd_seq snd_seq_device shpchp snd_pcm i2c_i801 snd_timer snd soundcore lpc_ich parport_pc parport uinput ipv6 i915 i2c_algo_bit drm_kms_helper ata_generic pata_acpi drm i2c_core video [last unloaded: iptable_nat]
[  352.659423] CPU: 2 PID: 162 Comm: kworker/2:1 Tainted: G        WC    3.16.0-wl-ath+ #16
[  352.659425] Hardware name: To be filled by O.E.M. To be filled by O.E.M./To be filled by O.E.M., BIOS 4.6.3 03/06/2012
[  352.659433] Workqueue: events ieee80211_restart_work [mac80211]
[  352.659434]  0000000000000009 ffff880220273718 ffffffff8163d017 0000000000000006
[  352.659439]  ffff880220273768 ffff880220273758 ffffffff810cea7e ffffffff823d1a10
[  352.659442]  ffffffffa04b042f ffff880220184ac0 ffff88020ecac000 ffff8800c6850960
[  352.659446] Call Trace:
[  352.659450]  [<ffffffff8163d017>] dump_stack+0x4e/0x71
[  352.659453]  [<ffffffff810cea7e>] warn_slowpath_common+0x7c/0x96
[  352.659465]  [<ffffffffa04b042f>] ? drv_ampdu_action.constprop.2+0x77/0x193 [mac80211]
[  352.659468]  [<ffffffff810ceb2c>] warn_slowpath_fmt+0x41/0x43
[  352.659480]  [<ffffffffa04b042f>] drv_ampdu_action.constprop.2+0x77/0x193 [mac80211]
[  352.659491]  [<ffffffffa04b0617>] ___ieee80211_stop_rx_ba_session+0xcc/0x14f [mac80211]
[  352.659503]  [<ffffffffa04b06e5>] __ieee80211_stop_rx_ba_session+0x4b/0x62 [mac80211]
[  352.659515]  [<ffffffffa04afc00>] ? ieee80211_start_tx_ba_cb+0x189/0x1a1 [mac80211]
[  352.659527]  [<ffffffffa04ae391>] ieee80211_sta_tear_down_BA_sessions+0x4e/0x5c [mac80211]
[  352.659536]  [<ffffffffa04a75e0>] __sta_info_destroy_part1+0x5d/0x1b2 [mac80211]
[  352.659543]  [<ffffffff81126297>] ? __call_rcu.constprop.63+0x1ea/0x1fe
[  352.659553]  [<ffffffffa04a911e>] __sta_info_flush+0x8f/0x175 [mac80211]
[  352.659567]  [<ffffffffa04bb1a7>] ieee80211_stop_ap+0x139/0x289 [mac80211]
[  352.659587]  [<ffffffffa035c5f4>] __cfg80211_stop_ap+0xac/0x1bf [cfg80211]
[  352.659596]  [<ffffffffa033cace>] __cfg80211_leave+0xfe/0x11e [cfg80211]
[  352.659604]  [<ffffffffa033cb17>] cfg80211_leave+0x29/0x39 [cfg80211]
[  352.659613]  [<ffffffffa033ccef>] cfg80211_netdev_notifier_call+0x1c8/0x4f1 [cfg80211]
[  352.659647]  [<ffffffff8110ece3>] ? lock_release+0x199/0x1ed
[  352.659655]  [<ffffffff810eec04>] notifier_call_chain+0x32/0x5c
[  352.659659]  [<ffffffff810eec4d>] __raw_notifier_call_chain+0x9/0xb
[  352.659663]  [<ffffffff810eec5e>] raw_notifier_call_chain+0xf/0x11
[  352.659671]  [<ffffffff8158309d>] call_netdevice_notifiers_info+0x4e/0x57
[  352.659675]  [<ffffffff815830b7>] call_netdevice_notifiers+0x11/0x13
[  352.659680]  [<ffffffff81583104>] __dev_close_many+0x4b/0xb7
[  352.659685]  [<ffffffff81584d50>] dev_close_many+0x6c/0xe9
[  352.659691]  [<ffffffff81584e08>] dev_close+0x3b/0x4f
[  352.659707]  [<ffffffffa033c6cc>] cfg80211_shutdown_all_interfaces+0x5c/0x88 [cfg80211]
[  352.659731]  [<ffffffffa04cb222>] ieee80211_reconfig+0x1b3/0xab7 [mac80211]
[  352.659740]  [<ffffffff81643339>] ? mutex_unlock+0x9/0xb
[  352.659754]  [<ffffffffa04a49c8>] ieee80211_restart_work+0x5e/0x68 [mac80211]
[  352.659760]  [<ffffffff810e5aa8>] process_one_work+0x1f2/0x368
[  352.659766]  [<ffffffff810e5a14>] ? process_one_work+0x15e/0x368
[  352.659773]  [<ffffffff810e5eb9>] worker_thread+0x271/0x34e
[  352.659779]  [<ffffffff810e5c48>] ? process_scheduled_works+0x2a/0x2a
[  352.659784]  [<ffffffff810eb33e>] kthread+0xc4/0xcc
[  352.659790]  [<ffffffff81644602>] ? _raw_spin_unlock_irq+0x28/0x42
[  352.659797]  [<ffffffff810eb27a>] ? __kthread_parkme+0x5c/0x5c
[  352.659803]  [<ffffffff81644bfc>] ret_from_fork+0x7c/0xb0
[  352.659808]  [<ffffffff810eb27a>] ? __kthread_parkme+0x5c/0x5c
[  352.659811] ---[ end trace c5c000199dbf8dd1 ]---
[  352.659816] vap1: HW problem - can not stop rx aggregation for 04:f0:21:0e:38:43 tid 0
[  352.659936] ------------[ cut here ]------------
[  352.659952] WARNING: CPU: 2 PID: 162 at /mnt/sda/home/greearb/git/linux.ath/net/mac80211/driver-ops.h:12 check_sdata_in_driver+0x4c/0x55 [mac80211]()
[  352.659955] vap1:  Failed check-sdata-in-driver check, flags: 0x0
[  352.659957] Modules linked in: iptable_raw xt_CT nf_conntrack_netlink nfnetlink nf_nat_ipv4 nf_nat veth 8021q garp stp mrp llc fuse macvlan pktgen ip6table_filter ip6_tables ebtable_nat ebtables nfsv3 nfs_acl rpcsec_gss_krb5 auth_rpcgss oid_registry nfsv4 nfs lockd sunrpc fscache gpio_ich iTCO_wdt iTCO_vendor_support ppdev e1000e coretemp hwmon intel_powerclamp ath10k_pci ath10k_core ath kvm mac80211 serio_raw snd_hda_codec_realtek microcode snd_hda_codec_generic pcspkr ptp pps_core snd_hda_intel snd_hda_controller snd_hda_codec cfg80211 snd_hwdep snd_seq snd_seq_device shpchp snd_pcm i2c_i801 snd_timer snd soundcore lpc_ich parport_pc parport uinput ipv6 i915 i2c_algo_bit drm_kms_helper ata_generic pata_acpi drm i2c_core video [last unloaded: iptable_nat]
[  352.660055] CPU: 2 PID: 162 Comm: kworker/2:1 Tainted: G        WC    3.16.0-wl-ath+ #16
[  352.660058] Hardware name: To be filled by O.E.M. To be filled by O.E.M./To be filled by O.E.M., BIOS 4.6.3 03/06/2012
[  352.660072] Workqueue: events ieee80211_restart_work [mac80211]
[  352.660075]  0000000000000009 ffff880220273848 ffffffff8163d017 0000000000000006
[  352.660081]  ffff880220273898 ffff880220273888 ffffffff810cea7e ffff8802106c75e8
[  352.660089]  ffffffffa04a6c3d ffff8802106c7001 ffff8800c6850960 ffff880220184ac0
[  352.660094] Call Trace:
[  352.660100]  [<ffffffff8163d017>] dump_stack+0x4e/0x71
[  352.660104]  [<ffffffff810cea7e>] warn_slowpath_common+0x7c/0x96
[  352.660119]  [<ffffffffa04a6c3d>] ? check_sdata_in_driver+0x4c/0x55 [mac80211]
[  352.660124]  [<ffffffff810ceb2c>] warn_slowpath_fmt+0x41/0x43
[  352.660139]  [<ffffffffa04a6c3d>] check_sdata_in_driver+0x4c/0x55 [mac80211]
[  352.660154]  [<ffffffffa04a7622>] __sta_info_destroy_part1+0x9f/0x1b2 [mac80211]
[  352.660163]  [<ffffffff81126297>] ? __call_rcu.constprop.63+0x1ea/0x1fe
[  352.660177]  [<ffffffffa04a911e>] __sta_info_flush+0x8f/0x175 [mac80211]
[  352.660196]  [<ffffffffa04bb1a7>] ieee80211_stop_ap+0x139/0x289 [mac80211]
[  352.660215]  [<ffffffffa035c5f4>] __cfg80211_stop_ap+0xac/0x1bf [cfg80211]
[  352.660227]  [<ffffffffa033cace>] __cfg80211_leave+0xfe/0x11e [cfg80211]
[  352.660239]  [<ffffffffa033cb17>] cfg80211_leave+0x29/0x39 [cfg80211]
[  352.660253]  [<ffffffffa033ccef>] cfg80211_netdev_notifier_call+0x1c8/0x4f1 [cfg80211]
[  352.660257]  [<ffffffff8110ece3>] ? lock_release+0x199/0x1ed
[  352.660262]  [<ffffffff810eec04>] notifier_call_chain+0x32/0x5c
[  352.660267]  [<ffffffff810eec4d>] __raw_notifier_call_chain+0x9/0xb
[  352.660271]  [<ffffffff810eec5e>] raw_notifier_call_chain+0xf/0x11
[  352.660276]  [<ffffffff8158309d>] call_netdevice_notifiers_info+0x4e/0x57
[  352.660280]  [<ffffffff815830b7>] call_netdevice_notifiers+0x11/0x13
[  352.660285]  [<ffffffff81583104>] __dev_close_many+0x4b/0xb7
[  352.660289]  [<ffffffff81584d50>] dev_close_many+0x6c/0xe9
[  352.660293]  [<ffffffff81584e08>] dev_close+0x3b/0x4f
[  352.660308]  [<ffffffffa033c6cc>] cfg80211_shutdown_all_interfaces+0x5c/0x88 [cfg80211]
[  352.660336]  [<ffffffffa04cb222>] ieee80211_reconfig+0x1b3/0xab7 [mac80211]
[  352.660341]  [<ffffffff81643339>] ? mutex_unlock+0x9/0xb
[  352.660358]  [<ffffffffa04a49c8>] ieee80211_restart_work+0x5e/0x68 [mac80211]
[  352.660363]  [<ffffffff810e5aa8>] process_one_work+0x1f2/0x368
[  352.660367]  [<ffffffff810e5a14>] ? process_one_work+0x15e/0x368
[  352.660373]  [<ffffffff810e5eb9>] worker_thread+0x271/0x34e
[  352.660378]  [<ffffffff810e5c48>] ? process_scheduled_works+0x2a/0x2a
[  352.660383]  [<ffffffff810eb33e>] kthread+0xc4/0xcc
[  352.660388]  [<ffffffff81644602>] ? _raw_spin_unlock_irq+0x28/0x42
[  352.660393]  [<ffffffff810eb27a>] ? __kthread_parkme+0x5c/0x5c
[  352.660398]  [<ffffffff81644bfc>] ret_from_fork+0x7c/0xb0
[  352.660402]  [<ffffffff810eb27a>] ? __kthread_parkme+0x5c/0x5c
[  352.660405] ---[ end trace c5c000199dbf8dd2 ]---
[  352.661301] ------------[ cut here ]------------
[  352.661358] WARNING: CPU: 2 PID: 162 at /mnt/sda/home/greearb/git/linux.ath/net/mac80211/driver-ops.h:12 check_sdata_in_driver+0x4c/0x55 [mac80211]()
[  352.661361] vap1:  Failed check-sdata-in-driver check, flags: 0x0
[  352.661362] Modules linked in: iptable_raw xt_CT nf_conntrack_netlink nfnetlink nf_nat_ipv4 nf_nat veth 8021q garp stp mrp llc fuse macvlan pktgen ip6table_filter ip6_tables ebtable_nat ebtables nfsv3 nfs_acl rpcsec_gss_krb5 auth_rpcgss oid_registry nfsv4 nfs lockd sunrpc fscache gpio_ich iTCO_wdt iTCO_vendor_support ppdev e1000e coretemp hwmon intel_powerclamp ath10k_pci ath10k_core ath kvm mac80211 serio_raw snd_hda_codec_realtek microcode snd_hda_codec_generic pcspkr ptp pps_core snd_hda_intel snd_hda_controller snd_hda_codec cfg80211 snd_hwdep snd_seq snd_seq_device shpchp snd_pcm i2c_i801 snd_timer snd soundcore lpc_ich parport_pc parport uinput ipv6 i915 i2c_algo_bit drm_kms_helper ata_generic pata_acpi drm i2c_core video [last unloaded: iptable_nat]
[  352.661445] CPU: 2 PID: 162 Comm: kworker/2:1 Tainted: G        WC    3.16.0-wl-ath+ #16
[  352.661447] Hardware name: To be filled by O.E.M. To be filled by O.E.M./To be filled by O.E.M., BIOS 4.6.3 03/06/2012
[  352.661468] Workqueue: events ieee80211_restart_work [mac80211]
[  352.661472]  0000000000000009 ffff8802202737b8 ffffffff8163d017 0000000000000006
[  352.661476]  ffff880220273808 ffff8802202737f8 ffffffff810cea7e ffff88022027c360
[  352.661481]  ffffffffa04c74bd ffff880220184a01 ffff8800c6850960 0000000000000001
[  352.661485] Call Trace:
[  352.661493]  [<ffffffff8163d017>] dump_stack+0x4e/0x71
[  352.661501]  [<ffffffff810cea7e>] warn_slowpath_common+0x7c/0x96
[  352.661539]  [<ffffffffa04c74bd>] ? check_sdata_in_driver+0x4c/0x55 [mac80211]
[  352.661545]  [<ffffffff810ceb2c>] warn_slowpath_fmt+0x41/0x43
[  352.661584]  [<ffffffffa04c74bd>] check_sdata_in_driver+0x4c/0x55 [mac80211]
[  352.661619]  [<ffffffffa04c7505>] drv_set_key+0x3f/0x108 [mac80211]
[  352.661651]  [<ffffffff8110bfbb>] ? lock_is_held+0x51/0x63
[  352.661690]  [<ffffffffa04c7edc>] __ieee80211_key_destroy+0x94/0x129 [mac80211]
[  352.661733]  [<ffffffffa04c880c>] ieee80211_free_sta_keys+0x9b/0xb6 [mac80211]
[  352.661764]  [<ffffffffa04a8f4c>] __sta_info_destroy_part2+0x3f/0x182 [mac80211]
[  352.661775]  [<ffffffff811258b3>] ? synchronize_rcu_expedited+0x74/0x1b3
[  352.661803]  [<ffffffffa04a9179>] __sta_info_flush+0xea/0x175 [mac80211]
[  352.661841]  [<ffffffffa04bb1a7>] ieee80211_stop_ap+0x139/0x289 [mac80211]
[  352.661870]  [<ffffffffa035c5f4>] __cfg80211_stop_ap+0xac/0x1bf [cfg80211]
[  352.661883]  [<ffffffffa033cace>] __cfg80211_leave+0xfe/0x11e [cfg80211]
[  352.661895]  [<ffffffffa033cb17>] cfg80211_leave+0x29/0x39 [cfg80211]
[  352.661908]  [<ffffffffa033ccef>] cfg80211_netdev_notifier_call+0x1c8/0x4f1 [cfg80211]
[  352.661912]  [<ffffffff8110ece3>] ? lock_release+0x199/0x1ed
[  352.661918]  [<ffffffff810eec04>] notifier_call_chain+0x32/0x5c
[  352.661922]  [<ffffffff810eec4d>] __raw_notifier_call_chain+0x9/0xb
[  352.661926]  [<ffffffff810eec5e>] raw_notifier_call_chain+0xf/0x11
[  352.661931]  [<ffffffff8158309d>] call_netdevice_notifiers_info+0x4e/0x57
[  352.661935]  [<ffffffff815830b7>] call_netdevice_notifiers+0x11/0x13
[  352.661939]  [<ffffffff81583104>] __dev_close_many+0x4b/0xb7
[  352.661943]  [<ffffffff81584d50>] dev_close_many+0x6c/0xe9
[  352.661946]  [<ffffffff81584e08>] dev_close+0x3b/0x4f
[  352.661958]  [<ffffffffa033c6cc>] cfg80211_shutdown_all_interfaces+0x5c/0x88 [cfg80211]
[  352.661980]  [<ffffffffa04cb222>] ieee80211_reconfig+0x1b3/0xab7 [mac80211]
[  352.661984]  [<ffffffff81643339>] ? mutex_unlock+0x9/0xb
[  352.661998]  [<ffffffffa04a49c8>] ieee80211_restart_work+0x5e/0x68 [mac80211]
[  352.662003]  [<ffffffff810e5aa8>] process_one_work+0x1f2/0x368
[  352.662007]  [<ffffffff810e5a14>] ? process_one_work+0x15e/0x368
[  352.662011]  [<ffffffff810e5eb9>] worker_thread+0x271/0x34e
[  352.662016]  [<ffffffff810e5c48>] ? process_scheduled_works+0x2a/0x2a
[  352.662019]  [<ffffffff810eb33e>] kthread+0xc4/0xcc
[  352.662023]  [<ffffffff81644602>] ? _raw_spin_unlock_irq+0x28/0x42
[  352.662028]  [<ffffffff810eb27a>] ? __kthread_parkme+0x5c/0x5c
[  352.662032]  [<ffffffff81644bfc>] ret_from_fork+0x7c/0xb0
[  352.662035]  [<ffffffff810eb27a>] ? __kthread_parkme+0x5c/0x5c
[  352.662038] ---[ end trace c5c000199dbf8dd3 ]---
[  352.662042] vap1: failed to remove key (0, 04:f0:21:0e:38:43) from hardware (-5)


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
