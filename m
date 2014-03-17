Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPhLZ-0002Pz-Bq
 for ath10k@lists.infradead.org; Mon, 17 Mar 2014 23:53:35 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s2HNr2Ov021821
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Mon, 17 Mar 2014 16:53:03 -0700
Message-ID: <53278ADD.4080205@candelatech.com>
Date: Mon, 17 Mar 2014 16:53:01 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Firmware crash/lockup on WLE900VX.
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

This is with my somewhat modified ath10k driver (mostly just
additional printks as far as this firmware is concerned),
and standard upstream firmware running in AP mode.

I guess the interesting question to me is why we cannot read
the firmware dump area address?

It all goes down hill from there and soft resets fail to
resolve the issue.

[245273.132602] IPv6: ADDRCONF(NETDEV_UP): vap0: link is not ready
[245273.159965] IPv6: ADDRCONF(NETDEV_CHANGE): vap1: link becomes ready
[245273.259178] IPv6: ADDRCONF(NETDEV_CHANGE): vap0: link becomes ready
[245498.059492] e1000e: eth1 NIC Link is Down
[245500.455638] e1000e: eth1 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: Rx/Tx
[246136.713414] ath10k: firmware crashed!
[246136.715802] ath10k: hardware name qca988x hw2.0 version 0x4100016c
[246136.720699] ath10k: firmware version: 10.1.467.1-1
[246136.736226] ath10k: failed to read FW dump area address: -16
[246451.587593] ath10k: key installation failed for vdev 0 peer 00:f0:21:0e:80:7f: -110
[246451.587604] vap1: failed to remove key (0, 00:f0:21:0e:80:7f) from hardware (-110)
[246454.593921] ath10k: could not remove peer wep key 0 (-11)
[246454.593926] ath10k: could not clear all peer wep keys for vdev 0: -11
[246454.593929] ath10k: Failed to disassociate station: 00:f0:21:0e:80:7f vdev 0 ret -11
[246454.593931] ------------[ cut here ]------------
[246454.593962] WARNING: CPU: 1 PID: 17319 at /mnt/sda/home/greearb/git/linux.ath/net/mac80211/sta_info.c:893 __sta_info_destroy_part2+0x62/0x15e [mac80211]()
[246454.593964] Modules linked in: iptable_raw xt_CT nf_nat_ipv4 nf_nat 8021q garp stp mrp llc fuse macvlan pktgen ip6table_filter ip6_tables ebtable_nat
ebtables nfsv3 nfs_acl rpcsec_gss_krb5 auth_rpcgss oid_registry nfsv4 nfs lockd sunrpc fscache pcspkr uinput ath10k_pci coretemp hwmon ath10k_core ath
intel_powerclamp mac80211 kvm snd_hda_codec_realtek snd_hda_codec_generic e1000e cfg80211 snd_hda_intel snd_hda_codec ptp snd_hwdep pps_core gpio_ich ppdev
iTCO_wdt shpchp iTCO_vendor_support parport_pc parport microcode serio_raw lpc_ich i2c_i801 snd_seq snd_seq_device snd_pcm snd_timer snd soundcore ipv6 i915
i2c_algo_bit drm_kms_helper ata_generic pata_acpi drm i2c_core video [last unloaded: iptable_nat]
[246454.594044] CPU: 1 PID: 17319 Comm: hostapd Tainted: G         C   3.14.0-rc6-wl-ath+ #3
[246454.594045] Hardware name: To be filled by O.E.M. To be filled by O.E.M./To be filled by O.E.M., BIOS 4.6.3 03/06/2012
[246454.594047]  0000000000000009 ffff8800bb597918 ffffffff815aaef5 0000000000000006
[246454.594050]  0000000000000000 ffff8800bb597958 ffffffff810c1aa8 ffff8800bb66c000
[246454.594052]  ffffffffa056b1a3 ffff8800bb66c000 ffff8800c60e45e0 ffff8800373c6800
[246454.594055] Call Trace:
[246454.594061]  [<ffffffff815aaef5>] dump_stack+0x4e/0x71
[246454.594067]  [<ffffffff810c1aa8>] warn_slowpath_common+0x77/0x91
[246454.594075]  [<ffffffffa056b1a3>] ? __sta_info_destroy_part2+0x62/0x15e [mac80211]
[246454.594078]  [<ffffffff810c1ad7>] warn_slowpath_null+0x15/0x17
[246454.594084]  [<ffffffffa056b1a3>] __sta_info_destroy_part2+0x62/0x15e [mac80211]
[246454.594091]  [<ffffffffa056b437>] __sta_info_destroy+0x25/0x2f [mac80211]
[246454.594099]  [<ffffffffa056b53d>] sta_info_destroy_addr_bss+0x37/0x57 [mac80211]
[246454.594110]  [<ffffffffa0579a1c>] ieee80211_del_station+0x18/0x25 [mac80211]
[246454.594119]  [<ffffffffa0308411>] nl80211_del_station+0x55/0x65 [cfg80211]
[246454.594124]  [<ffffffff81524c08>] genl_family_rcv_msg+0x246/0x2ba
[246454.594126]  [<ffffffff8152054c>] ? sock_put+0x12/0x22
[246454.594129]  [<ffffffff81524cb9>] genl_rcv_msg+0x3d/0x60
[246454.594131]  [<ffffffff81524c7c>] ? genl_family_rcv_msg+0x2ba/0x2ba
[246454.594133]  [<ffffffff81523a3a>] netlink_rcv_skb+0x3d/0x8a
[246454.594135]  [<ffffffff81523c37>] genl_rcv+0x24/0x34
[246454.594137]  [<ffffffff8152321a>] netlink_unicast+0xc6/0x147
[246454.594139]  [<ffffffff81523839>] netlink_sendmsg+0x59e/0x5e4
[246454.594141]  [<ffffffff81521a3b>] ? netlink_recvmsg+0x2ca/0x2e9
[246454.594145]  [<ffffffff814ea860>] __sock_sendmsg_nosec+0x25/0x27
[246454.594147]  [<ffffffff814ed1cf>] sock_sendmsg+0x5a/0x7b
[246454.594149]  [<ffffffff814edc7b>] ? move_addr_to_kernel+0x35/0x62
[246454.594152]  [<ffffffff814f7885>] ? verify_iovec+0x52/0xa5
[246454.594153]  [<ffffffff814edba5>] ___sys_sendmsg+0x21e/0x2bf
[246454.594156]  [<ffffffff814ea973>] ? sockfs_dname+0x1c/0x1c
[246454.594159]  [<ffffffff811a31c1>] ? destroy_inode+0x36/0x4f
[246454.594161]  [<ffffffff811a38a4>] ? evict+0x155/0x15d
[246454.594163]  [<ffffffff811837eb>] ? kmem_cache_free+0x34/0xa7
[246454.594165]  [<ffffffff8119fb43>] ? __d_free+0x4b/0x50
[246454.594167]  [<ffffffff811a7265>] ? mntput_no_expire+0x2e/0x126
[246454.594169]  [<ffffffff811a7385>] ? mntput+0x28/0x2a
[246454.594172]  [<ffffffff811909a0>] ? __fput+0x190/0x1b0
[246454.594175]  [<ffffffff814ee097>] __sys_sendmsg+0x3d/0x5b
[246454.594177]  [<ffffffff814ee0c2>] SyS_sendmsg+0xd/0x19
[246454.594181]  [<ffffffff815b59fd>] system_call_fastpath+0x1a/0x1f
[246454.594182] ---[ end trace 9d9631e0aba2fb1a ]---
[246457.594136] ath10k: Failed to delete peer 00:f0:21:0e:80:7f for vdev 0: -11
[246457.594140] ------------[ cut here ]------------
[246457.594171] WARNING: CPU: 1 PID: 17319 at /mnt/sda/home/greearb/git/linux.ath/net/mac80211/sta_info.c:901 __sta_info_destroy_part2+0xba/0x15e [mac80211]()
[246457.594173] Modules linked in: iptable_raw xt_CT nf_nat_ipv4 nf_nat 8021q garp stp mrp llc fuse macvlan pktgen ip6table_filter ip6_tables ebtable_nat
ebtables nfsv3 nfs_acl rpcsec_gss_krb5 auth_rpcgss oid_registry nfsv4 nfs lockd sunrpc fscache pcspkr uinput ath10k_pci coretemp hwmon ath10k_core ath
intel_powerclamp mac80211 kvm snd_hda_codec_realtek snd_hda_codec_generic e1000e cfg80211 snd_hda_intel snd_hda_codec ptp snd_hwdep pps_core gpio_ich ppdev
iTCO_wdt shpchp iTCO_vendor_support parport_pc parport microcode serio_raw lpc_ich i2c_i801 snd_seq snd_seq_device snd_pcm snd_timer snd soundcore ipv6 i915
i2c_algo_bit drm_kms_helper ata_generic pata_acpi drm i2c_core video [last unloaded: iptable_nat]
[246457.594250] CPU: 1 PID: 17319 Comm: hostapd Tainted: G        WC   3.14.0-rc6-wl-ath+ #3
[246457.594251] Hardware name: To be filled by O.E.M. To be filled by O.E.M./To be filled by O.E.M., BIOS 4.6.3 03/06/2012
[246457.594253]  0000000000000009 ffff8800bb597918 ffffffff815aaef5 0000000000000006
[246457.594256]  0000000000000000 ffff8800bb597958 ffffffff810c1aa8 ffff8800bb597968
[246457.594258]  ffffffffa056b1fb ffff8800bb66c000 00000000fffffff5 ffff8800373c6800
[246457.594261] Call Trace:
[246457.594267]  [<ffffffff815aaef5>] dump_stack+0x4e/0x71
[246457.594273]  [<ffffffff810c1aa8>] warn_slowpath_common+0x77/0x91
[246457.594281]  [<ffffffffa056b1fb>] ? __sta_info_destroy_part2+0xba/0x15e [mac80211]
[246457.594283]  [<ffffffff810c1ad7>] warn_slowpath_null+0x15/0x17
[246457.594290]  [<ffffffffa056b1fb>] __sta_info_destroy_part2+0xba/0x15e [mac80211]
[246457.594297]  [<ffffffffa056b437>] __sta_info_destroy+0x25/0x2f [mac80211]
[246457.594304]  [<ffffffffa056b53d>] sta_info_destroy_addr_bss+0x37/0x57 [mac80211]
[246457.594315]  [<ffffffffa0579a1c>] ieee80211_del_station+0x18/0x25 [mac80211]
[246457.594324]  [<ffffffffa0308411>] nl80211_del_station+0x55/0x65 [cfg80211]
[246457.594329]  [<ffffffff81524c08>] genl_family_rcv_msg+0x246/0x2ba
[246457.594331]  [<ffffffff8152054c>] ? sock_put+0x12/0x22
[246457.594334]  [<ffffffff81524cb9>] genl_rcv_msg+0x3d/0x60
[246457.594336]  [<ffffffff81524c7c>] ? genl_family_rcv_msg+0x2ba/0x2ba
[246457.594338]  [<ffffffff81523a3a>] netlink_rcv_skb+0x3d/0x8a
[246457.594340]  [<ffffffff81523c37>] genl_rcv+0x24/0x34
[246457.594342]  [<ffffffff8152321a>] netlink_unicast+0xc6/0x147
[246457.594344]  [<ffffffff81523839>] netlink_sendmsg+0x59e/0x5e4
[246457.594346]  [<ffffffff81521a3b>] ? netlink_recvmsg+0x2ca/0x2e9
[246457.594352]  [<ffffffff814ea860>] __sock_sendmsg_nosec+0x25/0x27
[246457.594354]  [<ffffffff814ed1cf>] sock_sendmsg+0x5a/0x7b
[246457.594356]  [<ffffffff814edc7b>] ? move_addr_to_kernel+0x35/0x62
[246457.594359]  [<ffffffff814f7885>] ? verify_iovec+0x52/0xa5
[246457.594360]  [<ffffffff814edba5>] ___sys_sendmsg+0x21e/0x2bf
[246457.594362]  [<ffffffff814ea973>] ? sockfs_dname+0x1c/0x1c
[246457.594365]  [<ffffffff811a31c1>] ? destroy_inode+0x36/0x4f
[246457.594367]  [<ffffffff811a38a4>] ? evict+0x155/0x15d
[246457.594370]  [<ffffffff811837eb>] ? kmem_cache_free+0x34/0xa7
[246457.594372]  [<ffffffff8119fb43>] ? __d_free+0x4b/0x50
[246457.594374]  [<ffffffff811a7265>] ? mntput_no_expire+0x2e/0x126
[246457.594376]  [<ffffffff811a7385>] ? mntput+0x28/0x2a
[246457.594379]  [<ffffffff811909a0>] ? __fput+0x190/0x1b0
[246457.594381]  [<ffffffff814ee097>] __sys_sendmsg+0x3d/0x5b
[246457.594383]  [<ffffffff814ee0c2>] SyS_sendmsg+0xd/0x19
[246457.594385]  [<ffffffff815b59fd>] system_call_fastpath+0x1a/0x1f
[246457.594387] ---[ end trace 9d9631e0aba2fb1b ]---
[246457.594389] vap1: sta-info-destroy: drv-sta-state error: -11, sta: 00:f0:21:0e:80:7f
[246462.597586] ath10k: key installation failed for vdev 0 peer 04:f0:21:0e:38:43: -11
[246462.597591] vap1: failed to remove key (0, 04:f0:21:0e:38:43) from hardware (-11)
[246465.603855] ath10k: could not remove peer wep key 0 (-11)
[246465.603860] ath10k: could not clear all peer wep keys for vdev 0: -11
[246465.603863] ath10k: Failed to disassociate station: 04:f0:21:0e:38:43 vdev 0 ret -11
[246468.604130] ath10k: Failed to delete peer 04:f0:21:0e:38:43 for vdev 0: -11
[246468.604134] vap1: sta-info-destroy: drv-sta-state error: -11, sta: 04:f0:21:0e:38:43
[246471.604400] ath10k: Failed to set beacon mode for vdev 0: -11
[246474.604670] ath10k: Failed to recalculate rts/cts prot for vdev 0: -11
[246477.604943] ath10k: Failed to set preamble for vdev 0: -11
[246480.605216] ath10k: key installation failed for vdev 0 peer 04:f0:21:03:38:99: -11
[246480.605222] vap1: failed to remove key (1, ff:ff:ff:ff:ff:ff) from hardware (-11)
[246483.611487] ath10k: key installation failed for vdev 0 peer 04:f0:21:03:38:99: -11
[246483.611491] vap1: failed to set key (1, ff:ff:ff:ff:ff:ff) to hardware (-11)


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
