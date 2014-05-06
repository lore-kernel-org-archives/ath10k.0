Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x234.google.com ([2607:f8b0:400c:c01::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhcBh-0002P6-Qq
 for ath10k@lists.infradead.org; Tue, 06 May 2014 10:01:26 +0000
Received: by mail-ve0-f180.google.com with SMTP id db12so6844350veb.11
 for <ath10k@lists.infradead.org>; Tue, 06 May 2014 03:01:04 -0700 (PDT)
MIME-Version: 1.0
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 6 May 2014 06:00:43 -0400
Message-ID: <CAHqTa-22VFGSKGBq0BA+12GPz1yA87SUoYZ3J2z+RLt0VK_T4g@mail.gmail.com>
Subject: ath10k: kernel BUG at net/core/skbuff.c:147
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
To: ath10k <ath10k@lists.infradead.org>, Ben Greear <greearb@candelatech.com>

Here's another crash I'm getting sometimes.

This is with 3.2.26 kernel, mindspeed c2000 (armv7l) processor, and
backports built using kvalo's ath-next branch, with commit
v3.15-rc1-237-gd9bc4b9, firmware 10.1.467.2-1.

This didn't happen with the previous driver version I was using,
ath10k-stable-3.11-8.

[ 2045.452988] skb_under_panic: text:8332b3c4 len:77 put:26
head:ba768000 data:ba767ffe tail:0xba76804b end:0xba768f40 dev:<NULL>
[ 2045.464538] ------------[ cut here ]------------
[ 2045.469175] kernel BUG at net/core/skbuff.c:147!
[ 2045.473808] Internal error: Oops - undefined instruction: 0 [#1] SMP
[ 2045.480181] Modules linked in: ctr ccm nf_conntrack_netlink
auto_bridge(O) fci(O) nfnetlink ath9k_htc(O) mwifiex_usb(O) mwifiex(O)
ath10k_pci(O) ath10k_core(O) arc4 ath9k(O) mac80211(O) ath9k_common(O)
ath9k_hw(O) ath(O) cfg80211(O) compat(O) bmoca(O) xt_connmark
ip6table_mangle xt_CLASSIFY iptable_mangle xt_helper ip6t_REJECT
ip6t_LOG nf_conntrack_ipv6 nf_defrag_ipv6 ip6table_filter ip6_tables
nf_nat_rtsp nf_conntrack_rtsp nf_nat_h323 nf_conntrack_h323 nf_nat_irc
nf_conntrack_irc nf_nat_pptp nf_conntrack_pptp nf_conntrack_proto_gre
nf_nat_proto_gre nf_nat_sip nf_conntrack_sip nf_nat_tftp
nf_conntrack_tftp nf_nat_ftp nf_conntrack_ftp ipt_MASQUERADE
ipt_REJECT ipt_LOG xt_limit xt_pkttype xt_conntrack xt_tcpudp
iptable_nat nf_nat nf_conntrack_ipv4 nf_conntrack nf_defrag_ipv4
iptable_filter ip_tables x_tables pfe(O)
[ 2045.553187] CPU: 0    Tainted: G           O  (3.2.26 #1)
[ 2045.558614] PC is at skb_push+0x70/0x88
[ 2045.562476] LR is at console_unlock+0x1e0/0x270
[ 2045.567023] pc : [<84310c20>]    lr : [<840344b8>]    psr: 60000013
[ 2045.567028] sp : bf83be20  ip : bf83bd18  fp : bf83be54
[ 2045.578546] r10: 00000000  r9 : ba5c4116  r8 : ba767fe0
[ 2045.583788] r7 : 0000001a  r6 : 00000000  r5 : ba76804b  r4 : ba768000
[ 2045.590335] r3 : 84554504  r2 : 60000013  r1 : 60000093  r0 : 00000076
[ 2045.596884] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
Segment kernel
[ 2045.604216] Control: 10c53c7d  Table: 3f93c04a  DAC: 00000015
[ 2045.609982] Process ksoftirqd/0 (pid: 4, stack limit = 0xbf83a2f0)
[ 2045.616182] Stack: (0xbf83be20 to 0xbf83c000)
[ 2045.620557] be20: ba768000 ba767ffe ba76804b ba768f40 844e105c
bc659cc0 0000001a 00000002
[ 2045.628764] be40: bc2dae40 bc659cc0 bf83bf1c bf83be58 8332b3c4
84310bbc bf83bee0 8402dd38
[ 2045.636970] be60: bc659c44 bc659cac bc4cfe40 00000002 00000000
00000001 0000001c 00000002
[ 2045.645176] be80: bc12b060 00000000 bc6b06a0 00000001 00000006
bc659be0 00304188 0c96dc88
[ 2045.653382] bea0: 3178ff8c 024ebec1 0c96dc88 e090ff8c bf830080
bf83bec0 00000000 00000000
[ 2045.661588] bec0: 84dbb080 bf827040 bf83bf7c bf83bed8 843f4218
84028ed4 23959cef 00004d55
[ 2045.669794] bee0: bc579b40 bc6b06a0 bc12b05c 00000004 8453c080
bc659c88 bc659c8c bf83a000
[ 2045.678000] bf00: bd2fd418 8454ade0 00000000 8453a2f8 bf83bf4c
bf83bf20 8403a8f4 8332abe4
[ 2045.686206] bf20: 8403a854 bf83a000 00000006 84540058 bf83a000
00000001 84540040 00000100
[ 2045.694413] bf40: bf83bf8c bf83bf50 8403aca4 8403a860 843f9720
bf83a000 00000002 00000000
[ 2045.702618] bf60: 00000000 bf83a000 8457d2a0 843f9720 00000000
00000001 00000000 00000000
[ 2045.710824] bf80: bf83bfbc bf83bf90 8403ae34 8403abb4 00000000
bf835eec bf83bfc8 00000000
[ 2045.719030] bfa0: 8403ad8c 00000000 00000000 00000000 bf83bff4
bf83bfc0 84053c50 8403ad98
[ 2045.727236] bfc0: 00000000 00000000 00000000 00000000 bf83bfd0
bf83bfd0 bf835eec 84053bc4
[ 2045.735442] bfe0: 840379f0 00000013 00000000 bf83bff8 840379f0
84053bd0 1a000400 40817001
[ 2045.743642] Backtrace:
[ 2045.746140] [<84310bb0>] (skb_push+0x0/0x88) from [<8332b3c4>]
(ath10k_htt_txrx_compl_task+0x7ec/0xb5c [ath10k_core])
[ 2045.756784]  r6:bc659cc0 r5:bc2dae40 r4:00000002
[ 2045.761470] [<8332abd8>] (ath10k_htt_txrx_compl_task+0x0/0xb5c
[ath10k_core]) from [<8403a8f4>] (tasklet_action+0xa0/0x164)
[ 2045.772641] [<8403a854>] (tasklet_action+0x0/0x164) from
[<8403aca4>] (__do_softirq+0xfc/0x1e4)
[ 2045.781371] [<8403aba8>] (__do_softirq+0x0/0x1e4) from [<8403ae34>]
(run_ksoftirqd+0xa8/0x138)
[ 2045.790021] [<8403ad8c>] (run_ksoftirqd+0x0/0x138) from
[<84053c50>] (kthread+0x8c/0x94)
[ 2045.798141] [<84053bc4>] (kthread+0x0/0x94) from [<840379f0>]
(do_exit+0x0/0x6dc)
[ 2045.805646]  r7:00000013 r6:840379f0 r5:84053bc4 r4:bf835eec
[ 2045.811376] Code: e58dc004 e58d5008 e58de010 eb038add (e7f001f2)
[ 2045.817540] ---[ end trace 378b7c67b7ed1caa ]---
[ 2045.822176] Kernel panic - not syncing: Fatal exception in interrupt
[ 2045.828560] Backtrace:
[ 2045.831074] [<84011c08>] (dump_backtrace+0x0/0x108) from
[<843f35e8>] (dump_stack+0x18/0x1c)
[ 2045.839585]  r6:00000001 r5:845544a8 r4:84578970
[ 2045.843998] T: gfrg200-38.6a2-ap 1398981405 05/01 16:56:45 ntp=1
[ 2045.850340]  r3:84554504
[ 2045.852911] [<843f35d0>] (dump_stack+0x0/0x1c) from [<843f3650>]
(panic+0x64/0x1ac)
[ 2045.860608] [<843f35ec>] (panic+0x0/0x1ac) from [<84012038>]
(die+0x270/0x2d0)
[ 2045.867858]  r3:00000300 r2:bef23671 r1:00000000 r0:8449f3fc
[ 2045.873584]  r7:00000001
[ 2045.876146] [<84011dc8>] (die+0x0/0x2d0) from [<840120ec>]
(arm_notify_die+0x54/0x58)
[ 2045.884013] [<84012098>] (arm_notify_die+0x0/0x58) from
[<840082f0>] (do_undefinstr+0x11c/0x130)
[ 2045.892847] [<840081d4>] (do_undefinstr+0x0/0x130) from
[<8400dfac>] (__und_svc_finish+0x0/0x14)
[ 2045.901669] Exception stack(0xbf83bdd8 to 0xbf83be20)
[ 2045.906751] bdc0:
    00000076 60000093
[ 2045.914961] bde0: 60000013 84554504 ba768000 ba76804b 00000000
0000001a ba767fe0 ba5c4116
[ 2045.923176] be00: 00000000 bf83be54 bf83bd18 bf83be20 840344b8
84310c20 60000013 ffffffff
[ 2045.931389]  r7:00000000 r6:8400e294 r5:60000013 r4:84310c24
[ 2045.937169] [<84310bb0>] (skb_push+0x0/0x88) from [<8332b3c4>]
(ath10k_htt_txrx_compl_task+0x7ec/0xb5c [ath10k_core])
[ 2045.947822]  r6:bc659cc0 r5:bc2dae40 r4:00000002
[ 2045.952519] [<8332abd8>] (ath10k_htt_txrx_compl_task+0x0/0xb5c
[ath10k_core]) from [<8403a8f4>] (tasklet_action+0xa0/0x164)
[ 2045.963699] [<8403a854>] (tasklet_action+0x0/0x164) from
[<8403aca4>] (__do_softirq+0xfc/0x1e4)
[ 2045.972443] [<8403aba8>] (__do_softirq+0x0/0x1e4) from [<8403ae34>]
(run_ksoftirqd+0xa8/0x138)
[ 2045.981102] [<8403ad8c>] (run_ksoftirqd+0x0/0x138) from
[<84053c50>] (kthread+0x8c/0x94)
[ 2045.989250] [<84053bc4>] (kthread+0x0/0x94) from [<840379f0>]
(do_exit+0x0/0x6dc)
[ 2045.996769]  r7:00000013 r6:840379f0 r5:84053bc4 r4:bf835eec
[ 2046.002515] CPU1: stopping
[ 2046.005232] Backtrace:
[ 2046.007720] [<84011c08>] (dump_backtrace+0x0/0x108) from
[<843f35e8>] (dump_stack+0x18/0x1c)
[ 2046.016184]  r6:8454ade0 r5:84577f80 r4:00000001 r3:84554504
[ 2046.021918] [<843f35d0>] (dump_stack+0x0/0x1c) from [<840137bc>]
(handle_IPI+0xf8/0x160)
[ 2046.030039] [<840136c4>] (handle_IPI+0x0/0x160) from [<84008314>]
(do_IPI+0x10/0x14)
[ 2046.037805]  r8:0400406a r7:bf86bf9c r6:fff00100 r5:60000013 r4:8400ef0c
[ 2046.044402] r3:8400ef08
[ 2046.047056] [<84008304>] (do_IPI+0x0/0x14) from [<8400def8>]
(__irq_svc+0x38/0x90)
[ 2046.054649] Exception stack(0xbf86bf68 to 0xbf86bfb0)
[ 2046.059720] bf60:                   00000020 8454a880 bf86bfb0
00000000 bf86a000 843f9720
[ 2046.067926] bf80: 84577e44 8454eb04 0400406a 412fc091 00000000
bf86bfbc bf86bfc0 bf86bfb0
[ 2046.076129] bfa0: 8400ef08 8400ef0c 60000013 ffffffff
[ 2046.081204] [<8400eee0>] (default_idle+0x0/0x30) from [<8400f0ec>]
(cpu_idle+0x84/0xc8)
[ 2046.089241] [<8400f068>] (cpu_idle+0x0/0xc8) from [<843f03e8>]
(secondary_start_kernel+0x140/0x158)
[ 2046.098313]  r7:84577f70 r6:10c03c7d r5:8455a360 r4:00000002
[ 2046.104067] [<843f02a8>] (secondary_start_kernel+0x0/0x158) from
[<043efc74>] (0x43efc74)
[ 2046.112268]  r5:00000015 r4:3f86c06a
[ 2046.115884] Rebooting in 3 seconds..

Someone at work has partially analyzed it as follows:

"""
There is a change between the last backports and the new one involving how MSDU
sk_buffs are handled. It appears to be copying a chain of skbs to the
tail of the first skb.

The panic happens when there is insufficient headroom, which this
function doesn't change.
So though interesting, this doesn't appear to be involved in the panic.

[This patch seems to be from greearb, cc'd.]

+static int ath10k_unchain_msdu(struct sk_buff *msdu_head)
+{
+   struct sk_buff *next = msdu_head->next;
+   struct sk_buff *to_free = next;
+   int space;
+   int total_len = 0;
+
+   /* TODO:  Might could optimize this by using
+    * skb_try_coalesce or similar method to
+    * decrease copying, or maybe get mac80211 to
+    * provide a way to just receive a list of
+    * skb?
+    */
+
+   msdu_head->next = NULL;
+
+   /* Allocate total length all at once. */
+   while (next) {
+       total_len += next->len;
+       next = next->next;
+   }
+
+   space = total_len - skb_tailroom(msdu_head);
+   if ((space > 0) &&
+       (pskb_expand_head(msdu_head, 0, space, GFP_ATOMIC) < 0)) {
+       /* TODO:  bump some rx-oom error stat */
+       /* put it back together so we can free the
+        * whole list at once.
+        */
+       msdu_head->next = to_free;
+       return -1;
+   }
+
+   /* Walk list again, copying contents into
+    * msdu_head
+    */
+   next = to_free;
+   while (next) {
+       skb_copy_from_linear_data(next, skb_put(msdu_head, next->len),
+                     next->len);
+       next = next->next;
+   }
+
+   /* If here, we have consolidated skb.  Free the
+    * fragments and pass the main skb on up the
+    * stack.
+    */
+   ath10k_htt_rx_free_msdu_chain(to_free);
+   return 0;
+}


static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
                                 struct htt_rx_indication *rx)
{
...
       for (i = 0; i < num_mpdu_ranges; i++) {
               status = mpdu_ranges[i].mpdu_range_status;

               for (j = 0; j < mpdu_ranges[i].mpdu_count; j++) {
                       struct sk_buff *msdu_head, *msdu_tail;

                       msdu_head = NULL;
                       msdu_tail = NULL;
                       ret = ath10k_htt_rx_amsdu_pop(htt,      <-- HERE
                                                     &fw_desc,
                                                     &fw_desc_len,
                                                     &msdu_head,
                                                     &msdu_tail);
...
                       if (ret > 0 &&
                           ath10k_unchain_msdu(msdu_head) < 0) {        <-- HERE
                               ath10k_htt_rx_free_msdu_chain(msdu_head);
                               continue;
                       }

ath10k_unchain_msdu is the new routine pasted above which merges all
skbs into a single buffer.

ath10k_htt_rx_amsdu_pop contains the following comment at the end:

       /*
        * Don't refill the ring yet.
        *
        * First, the elements popped here are still in use - it is not
        * safe to overwrite them until the matching call to
        * mpdu_desc_list_next. Second, for efficiency it is preferable to
        * refill the rx ring with 1 PPDU's worth of rx buffers (something
        * like 32 x 3 buffers), rather than one MPDU's worth of rx buffers
        * (something like 3 buffers). Consequently, we'll rely on the txrx
        * SW to tell us when it is done pulling all the PPDU's rx buffers
        * out of the rx ring, and then refill it just once.
        */

       return msdu_chaining;
}


The comment isn't entirely correct, as there is no mpdu_desc_list_next
routine. Nonetheless it seems to say that the skbs are somehow still
in use and something needs to be done before they can be re-used, but
the new ath10k_unchain_msdu will definitely free some of these skbs
without doing anything special that I can see.
"""

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
