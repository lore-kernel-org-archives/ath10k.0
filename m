Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5Y6C-0008BG-SZ
 for ath10k@lists.infradead.org; Wed, 04 Sep 2019 16:25:38 +0000
Received: by mail-qk1-x742.google.com with SMTP id f10so20175349qkg.7
 for <ath10k@lists.infradead.org>; Wed, 04 Sep 2019 09:25:36 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?UGhpIE5ndXnhu4VuIMSQw6xuaA==?= <phind.uet@gmail.com>
Date: Thu, 5 Sep 2019 00:25:24 +0800
Message-ID: <CAL5WHMJ0mWDzYd8Zzu0Rb+QN8gqhccRMvuf8Zcef3t2wrqk6xQ@mail.gmail.com>
Subject: Kernel crash on IPQ4019 board when running Iperf.
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

I have IPQ4019 boards, these boards have on-board radio, and currently
running OpenWrt (kernel 4.14).
I set up one board as AP mode and another one as Station mode using
ath-10k firmware version: 10.4-3.6-00140 with ath10k driver to carry
out the testing, they can connect well. However, when I running iperf
test on these two, they crash randomly. If I plug two QCA9880 PCIe
cards and run Iperf on them, there won't be any problems.

Commands runned:
Board 1: iperf -s -i1
Board2:  iperf -c192.168.1.2 -i1 -P4 -t100000

crash log:
[  4] 896.0-897.0 sec  4.05 MBytes  34.0 Mbits/sec
[  5] 896.0-897.0 sec  7.81 MBytes  65.5 Mbits/sec
[  6] 896.0-897.0 sec  6.21 MBytes  52.1 Mbits/sec
[  7] 896.0-897.0 sec  7.77 MBytes  65.2 Mbits/sec
[SUM] 896.0-897.0 sec  25.8 MBytes   217 Mbits/sec
[ 1011.524291] Unable to handle kernel paging request at virtual
address 10c0387d
[ 1011.524329] pgd = c0204000
[ 1011.530421] [10c0387d] *pgd=00000000
[ 1011.533101] Internal error: Oops: 5 [#1] SMP ARM
[ 1011.536828] Modules linked in: pppoe ppp_async ath10k_pci
ath10k_core ath pppox ppp_generic nf_conntrack_ipv6 mac80211
iptable_nat ipt_REJECT ipt_MASQUERADE cfg80211 xt_time xt_tcpudp
xt_state xt_nat xt_multiport xt_mark xt_mac xt_limit xt_conntrack
xt_comment xt_TCPMSS xt_REDIRECT xt_LOG xt_FLOWOFFLOAD slhc
nf_reject_ipv4 nf_nat_redirect nf_nat_masquerade_ipv4
nf_conntrack_ipv4 nf_nat_ipv4 nf_nat nf_log_ipv4 nf_flow_table_hw
nf_flow_table nf_defrag_ipv6 nf_defrag_ipv4 nf_conntrack_rtcache
nf_conntrack iptable_mangle iptable_filter ip_tables crc_ccitt compat
ip6t_REJECT nf_reject_ipv6 nf_log_ipv6 nf_log_common ip6table_mangle
ip6table_filter ip6_tables x_tables leds_gpio xhci_plat_hcd xhci_pci
xhci_hcd dwc3 dwc3_of_simple gpio_button_hotplug
[ 1011.584566] CPU: 2 PID: 0 Comm: swapper/2 Not tainted 4.14.42 #0
[ 1011.606799] Hardware name: Generic DT based system
[ 1011.613048] task: cf833700 task.stack: cf85a000
[ 1011.617653] PC is at prepare_to_wait+0x8/0x6c
[ 1011.622076] LR is at __wait_on_bit+0x28/0xb8
[ 1011.626586] pc : [<c0348848>]    lr : [<c0719714>]    psr: 60000013
[ 1011.630929] sp : cf85bfc8  ip : 00000000  fp : cf85bfec
[ 1011.636917] r10: 00000000  r9 : 410fc075  r8 : 8020406a
[ 1011.642126] r7 : c0a242d0  r6 : 10c0387d  r5 : 00000000  r4 : 10c0387d
[ 1011.647338] r3 : 00000000  r2 : 00000000  r1 : 10c0387d  r0 : c0a242d0
[ 1011.653937] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[ 1011.660447] Control: 10c5387d  Table: 8e0e006a  DAC: 00000051
[ 1011.667648] Process swapper/2 (pid: 0, stack limit = 0xcf85a210)
[ 1011.673379] Stack: (0xcf85bfc8 to 0xcf85c000)
[ 1011.679459] bfc0:                   cf85a000 00000000 10c0387d
c0a242d0 8020406a c0719714
[ 1011.683717] bfe0: 00000084 00000051 00000000 c0349820 8f84c06a
8030170c 5c5c5c5c aaaaaaaa
[ 1011.691888] [<c0348848>] (prepare_to_wait) from [<c0719714>]
(__wait_on_bit+0x28/0xb8)
[ 1011.700039] Code: e28dd00c e49df004 e92d41f0 e1a04001 (e5913000)
[ 1011.708016] ---[ end trace 523dfd1ef585a835 ]---
[ 1011.714060] Kernel panic - not syncing: Fatal exception
[ 1011.718710] CPU0: stopping
[ 1011.723644] CPU: 0 PID: 7 Comm: ksoftirqd/0 Tainted: G      D
  4.14.42 #0
[ 1011.726418] Hardware name: Generic DT based system
[ 1011.733998] [<c030eaf0>] (unwind_backtrace) from [<c030b01c>]
(show_stack+0x10/0x14)
[ 1011.738591] [<c030b01c>] (show_stack) from [<c0704a28>]
(dump_stack+0x88/0x9c)
[ 1011.746485] [<c0704a28>] (dump_stack) from [<c030ddf8>]
(handle_IPI+0xe4/0x18c)
[ 1011.753512] [<c030ddf8>] (handle_IPI) from [<c030143c>]
(gic_handle_irq+0x8c/0x90)
[ 1011.760716] [<c030143c>] (gic_handle_irq) from [<c030bb8c>]
(__irq_svc+0x6c/0x90)
[ 1011.768348] Exception stack(0xcf851d98 to 0xcf851de0)
[ 1011.775898] 1d80:
    cd0a32ac 0000012c
[ 1011.780944] 1da0: cd9fa300 82200000 00000000 cd0a3180 cd9fa300
cf925840 00000040 00000000
[ 1011.789104] 1dc0: ce2b9580 cf851e4c 0000012c cf851de8 bf2c359c
bf2c35a0 60000013 ffffffff
[ 1011.797342] [<c030bb8c>] (__irq_svc) from [<bf2c35a0>]
(ath10k_htt_txrx_compl_task+0x91c/0x1260 [ath10k_core])
[ 1011.805514] [<bf2c35a0>] (ath10k_htt_txrx_compl_task [ath10k_core])
from [<bf2fd6ec>] (ath10k_pci_napi_poll+0x6c/0xe8 [ath10k_pci])
[ 1011.815347] [<bf2fd6ec>] (ath10k_pci_napi_poll [ath10k_pci]) from
[<c061eebc>] (net_rx_action+0x138/0x2fc)
[ 1011.827043] [<c061eebc>] (net_rx_action) from [<c0301520>]
(__do_softirq+0xe0/0x240)
[ 1011.836763] [<c0301520>] (__do_softirq) from [<c031b0ac>]
(run_ksoftirqd+0x30/0x50)
[ 1011.844664] [<c031b0ac>] (run_ksoftirqd) from [<c0334b54>]
(smpboot_thread_fn+0x198/0x1ac)
[ 1011.852044] [<c0334b54>] (smpboot_thread_fn) from [<c03317b0>]
(kthread+0x12c/0x138)
[ 1011.860375] [<c03317b0>] (kthread) from [<c0307908>]
(ret_from_fork+0x14/0x2c)
[ 1011.868265] CPU3: stopping
[ 1011.875291] CPU: 3 PID: 1245 Comm: iperf Tainted: G      D         4.14.42 #0
[ 1011.877980] Hardware name: Generic DT based system
[ 1011.885204] [<c030eaf0>] (unwind_backtrace) from [<c030b01c>]
(show_stack+0x10/0x14)
[ 1011.889890] [<c030b01c>] (show_stack) from [<c0704a28>]
(dump_stack+0x88/0x9c)
[ 1011.897784] [<c0704a28>] (dump_stack) from [<c030ddf8>]
(handle_IPI+0xe4/0x18c)
[ 1011.904811] [<c030ddf8>] (handle_IPI) from [<c030143c>]
(gic_handle_irq+0x8c/0x90)
[ 1011.912017] [<c030143c>] (gic_handle_irq) from [<c030bb8c>]
(__irq_svc+0x6c/0x90)
[ 1011.919650] Exception stack(0xcdde3e40 to 0xcdde3e88)
[ 1011.927208] 3e40: cf23ec00 cebcd5a0 c053b7b0 c053aa38 cf23ec00
00000006 0001c205 00000000
[ 1011.932247] 3e60: cdde3f80 ce9a7c00 00000002 00000000 00005401
cdde3e90 c052e018 c0535884
[ 1011.940397] 3e80: a0000013 ffffffff
[ 1011.948560] [<c030bb8c>] (__irq_svc) from [<c0535884>]
(tty_ldisc_ref_wait+0x0/0x34)
[ 1011.951863] [<c0535884>] (tty_ldisc_ref_wait) from [<ce9a7c00>] (0xce9a7c00)
[ 1011.959843] CPU1: stopping
[ 1011.966871] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D
4.14.42 #0
[ 1011.969386] Hardware name: Generic DT based system
[ 1011.976607] [<c030eaf0>] (unwind_backtrace) from [<c030b01c>]
(show_stack+0x10/0x14)
[ 1011.981382] [<c030b01c>] (show_stack) from [<c0704a28>]
(dump_stack+0x88/0x9c)
[ 1011.989278] [<c0704a28>] (dump_stack) from [<c030ddf8>]
(handle_IPI+0xe4/0x18c)
[ 1011.996304] [<c030ddf8>] (handle_IPI) from [<c030143c>]
(gic_handle_irq+0x8c/0x90)
[ 1012.003509] [<c030143c>] (gic_handle_irq) from [<c030bb8c>]
(__irq_svc+0x6c/0x90)
[ 1012.011141] Exception stack(0xcf859f80 to 0xcf859fc8)
[ 1012.018699] 9f80: 00000001 00000000 00000000 c0313f40 ffffe000
c0a03c70 c0a03c24 00000000
[ 1012.023738] 9fa0: 00000000 410fc075 00000000 00000000 cf859fc8
cf859fd0 c03081c0 c03081c4
[ 1012.031890] 9fc0: 60000013 ffffffff
[ 1012.040050] [<c030bb8c>] (__irq_svc) from [<c03081c4>]
(arch_cpu_idle+0x34/0x38)
[ 1012.043360] [<c03081c4>] (arch_cpu_idle) from [<c0349500>]
(do_idle+0xdc/0x1a0)
[ 1012.050996] [<c0349500>] (do_idle) from [<c0349820>]
(cpu_startup_entry+0x18/0x1c)
[ 1012.058022] [<c0349820>] (cpu_startup_entry) from [<8030170c>] (0x8030170c)
[ 1012.065667] Rebooting in 3 seconds..

Any suggestions for further debugging?

Thanks,

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
