Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cIzdd-0001yr-7e
 for ath10k@lists.infradead.org; Mon, 19 Dec 2016 15:14:06 +0000
Received: from [192.168.254.12] (h208.6.186.173.ip.windstream.net
 [173.186.6.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id E4D3840A7E2
 for <ath10k@lists.infradead.org>; Mon, 19 Dec 2016 07:07:30 -0800 (PST)
Message-ID: <5857F7B3.206@candelatech.com>
Date: Mon, 19 Dec 2016 07:07:31 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: ath10k truesize issue?
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

This warning is from the code below.  Anyone seen this recently?

I think this was from a 9984 NIC (we have several different
NICs in this chassis).


} else {
                 if (skb_shinfo(to)->nr_frags +
                     skb_shinfo(from)->nr_frags > MAX_SKB_FRAGS)
                         return false;

                 delta = from->truesize - SKB_TRUESIZE(skb_end_offset(from));
         }

         WARN_ON_ONCE(delta < len);

Dec 18 22:40:36 ct524-9933 kernel: WARNING: CPU: 7 PID: 0 at /home/greearb/git/linux-4.7.dev.y/net/core/skbuff.c:4283 skb_try_coalesce+0x402/0x410
Dec 18 22:40:36 ct524-9933 kernel: Modules linked in: nf_conntrack_netlink nf_conntrack nfnetlink wanlink(O) nf_defrag_ipv4 macvlan pktgen fuse vfat fat 
coretemp intel_rapl x86_pkg_temp_thermal intel_powerclamp kvm_intel kvm irqbypass ath10k_pci ath10k_core ath mac80211 iTCO_wdt iTCO_vendor_support ipmi_ssif 
cfg80211 hci_uart joydev i2c_i801 btbcm btqca btintel ie31200_edac bluetooth edac_core shpchp acpi_als tpm_tis kfifo_buf pinctrl_sunrisepoint intel_lpss_acpi 
ipmi_msghandler tpm industrialio video pinctrl_intel intel_lpss acpi_power_meter sch_fq_codel nfsd auth_rpcgss nfs_acl lockd grace sunrpc 8021q garp stp llc mrp 
ast drm_kms_helper ttm drm igb i2c_algo_bit ixgbe mdio hwmon dca ptp pps_core i2c_hid i2c_core fjes efivarfs ipv6 [last unloaded: nfnetlink]
Dec 18 22:40:36 ct524-9933 kernel: CPU: 7 PID: 0 Comm: swapper/7 Tainted: G           O    4.7.10+ #46
Dec 18 22:40:36 ct524-9933 kernel: Hardware name: Supermicro Super Server/X11SSM, BIOS 1.0b 12/29/2015
Dec 18 22:40:36 ct524-9933 kernel:  0000000000000000 ffff8804779c3688 ffffffff81409351 0000000000000000
Dec 18 22:40:36 ct524-9933 kernel:  0000000000000000 ffff8804779c36c8 ffffffff81103976 000010bb779c36a8
Dec 18 22:40:36 ct524-9933 kernel:  ffff88007ce1f800 00000000000005a8 ffff8804779c3724 ffff880075b85000
Dec 18 22:40:36 ct524-9933 kernel: Call Trace:
Dec 18 22:40:36 ct524-9933 kernel:  <IRQ> [<ffffffff81409351>] dump_stack+0x63/0x82
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff81103976>] __warn+0xc6/0xe0
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff81103a48>] warn_slowpath_null+0x18/0x20
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff81760c62>] skb_try_coalesce+0x402/0x410
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff817c7b79>] tcp_try_coalesce+0x39/0xa0
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff81761671>] ? skb_checksum+0x21/0x30
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff817c8322>] tcp_queue_rcv+0x52/0x140
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff817cee84>] tcp_rcv_established+0x364/0x6f0
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff817d9286>] tcp_v4_do_rcv+0x136/0x210
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff817dab49>] tcp_v4_rcv+0x8d9/0xaf0
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff8180a7f2>] ? iptable_filter_hook+0x22/0x60
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff817b4bdb>] ip_local_deliver_finish+0x9b/0x1f0
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff817b4edb>] ip_local_deliver+0x5b/0xd0
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff817b4b40>] ? ip_rcv_finish+0x3f0/0x3f0
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff817b486a>] ip_rcv_finish+0x11a/0x3f0
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff817b51af>] ip_rcv+0x25f/0x380
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff817b4750>] ? inet_del_offload+0x40/0x40
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff81773cb4>] __netif_receive_skb_core+0x684/0xa80
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff8124925a>] ? kmem_cache_free+0x17a/0x180
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff817740c3>] __netif_receive_skb+0x13/0x60
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff81774133>] netif_receive_skb_internal+0x23/0x90
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff817741b7>] netif_receive_skb+0x17/0x80
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffffa0a08d07>] ieee80211_deliver_skb+0x157/0x1b0 [mac80211]
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffffa0a0ad9a>] ieee80211_rx_handlers+0xa8a/0x2560 [mac80211]
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff8155717a>] ? dma_pte_clear_level+0x14a/0x190
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffffa0a0d077>] ieee80211_prepare_and_rx_handle+0x597/0x10a0 [mac80211]
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffffa0a0ddfa>] ieee80211_rx_napi+0x27a/0x930 [mac80211]
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffffa0c179cc>] ath10k_process_rx+0x2ac/0x4a0 [ath10k_core]
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffffa0c17bf5>] ath10k_htt_rx_h_deliver+0x35/0x80 [ath10k_core]
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffffa0c1a421>] ath10k_htt_txrx_compl_task+0xc91/0xe60 [ath10k_core]
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff81108afb>] tasklet_action+0x10b/0x120
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff81108eca>] __do_softirq+0xca/0x2b0
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff811091e9>] irq_exit+0x89/0x90
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff8102e69f>] do_IRQ+0x4f/0xd0
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff8184db42>] common_interrupt+0x82/0x82
Dec 18 22:40:36 ct524-9933 kernel:  <EOI> [<ffffffff816e8020>] ? cpuidle_enter_state+0x110/0x290
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff816e81c2>] cpuidle_enter+0x12/0x20
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff81144bb5>] call_cpuidle+0x25/0x40
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff81144f72>] cpu_startup_entry+0x2b2/0x370
Dec 18 22:40:36 ct524-9933 kernel: [<ffffffff8104d8cd>] start_secondary+0x14d/0x170
Dec 18 22:40:36 ct524-9933 kernel: ---[ end trace fa9eabf037886c79 ]---


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
