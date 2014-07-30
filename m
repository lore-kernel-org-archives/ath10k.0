Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCW61-00005F-0Y
 for ath10k@lists.infradead.org; Wed, 30 Jul 2014 15:47:17 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 296CD40A7E2
 for <ath10k@lists.infradead.org>; Wed, 30 Jul 2014 08:46:54 -0700 (PDT)
Message-ID: <53D9136E.8050908@candelatech.com>
Date: Wed, 30 Jul 2014 08:46:54 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Crash in hacked kernel with CT firmware.
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

Not sure how relevant this is to upstream, but just in case someone
wants to look at it:

Kernel is modified 3.14.14+, with a good bit of backported ath10k and some
patches of my own to help stabilize ath10k with my workload and to support
CT firmware features.

http://dmz2.candelatech.com/git/gitweb.cgi?p=linux-3.14.dev.y/.git;a=summary

Firmware is CT firmware, and it has a bug in this test case where it crashes
fairly often upon removal of a vdev after some traffic tests have been
running.  Likely this firmware bug is something that I have added or
at least exacerbated, and I am working on fixing it.

But, when it crashes, it takes the kernel down shortly afterwards
in a reliable manner:

[firmware crashes]

ath10k: failed with wmi_cmd_timeout 4 times, attempting hardware reset.
sta2: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta3: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta4: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta5: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta12: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta13: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta15: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta16: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta17: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta18: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta21: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta22: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta23: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta30: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta31: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta32: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta33: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta34: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta35: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta36: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta37: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta38: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta39: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta40: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta41: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta42: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta43: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta44: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta45: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta46: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta47: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta48: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta49: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta50: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta51: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta52: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta53: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta54: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta55: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta56: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta57: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta58: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta59: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta60: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta61: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta62: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting
sta63: Failed to send nullfunc to AP 04:f0:21:37:e3:2e after 1000ms, disconnecting


BUG: unable to handle kernel NULL pointer dereference at 0000000000000068
IP: [<ffffffffa06a318d>] ath10k_txrx_tx_unref+0x91/0x3c7 [ath10k_core]
PGD 44cf64067 PUD 449c87067 PMD 0
Oops: 0000 [#1] PREEMPT SMP
Modules linked in: nf_conntrack_netlink nfnetlink nf_nat_ipv4 nf_nat 8021q garp stp mrp llc m]
CPU: 0 PID: 5945 Comm: ip Tainted: G        WC O 3.14.14+ #38
Hardware name: Supermicro X9SRL-F/X9SRL-F, BIOS 3.0a 12/05/2013
task: ffff88043675c2a0 ti: ffff88043e4d4000 task.ti: ffff88043e4d4000
RIP: 0010:[<ffffffffa06a318d>]  [<ffffffffa06a318d>] ath10k_txrx_tx_unref+0x91/0x3c7 [ath10k_]
RSP: 0018:ffff88043e4d54b8  EFLAGS: 00010282
RAX: 0000000000000007 RBX: 0000000000000000 RCX: 0000000000000001
RDX: ffff880449e7c000 RSI: 0000000000000007 RDI: 0000000000000008
RBP: ffff88043e4d54e8 R08: 0000000000000000 R09: ffffffffa06a24b7
R10: ffffffffa06a24b7 R11: 0000000000000000 R12: ffff88043e4d5502
R13: ffff88046b02b428 R14: ffff88046c74e098 R15: ffff88046b02bc78
FS:  00007fe6c9271740(0000) GS:ffff88047fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000068 CR3: 0000000443978000 CR4: 00000000001407f0
Stack:
 0000000000000007 ffff88046b02b428 0000000000000007 ffff88046b02b568
 ffff88046b02b908 ffff88046b02bc78 ffff88043e4d5528 ffffffffa06a28b4
 ffff88043e4d5528 0001000000071c28 ffff88046b02b428 ffff88046b02b428
Call Trace:
 [<ffffffffa06a28b4>] ath10k_htt_tx_detach+0x70/0xd1 [ath10k_core]
 [<ffffffffa06a04cf>] ath10k_htt_detach+0x16/0x1b [ath10k_core]
 [<ffffffffa069eab3>] ath10k_core_stop+0x4f/0x70 [ath10k_core]
 [<ffffffffa069ae32>] ath10k_halt+0xde/0x161 [ath10k_core]
 [<ffffffffa069aeed>] ath10k_stop+0x38/0x89 [ath10k_core]
 [<ffffffffa05b0ae6>] ieee80211_stop_device+0x58/0x84 [mac80211]
 [<ffffffffa069541c>] ? spin_lock_bh+0x9/0xb [ath10k_core]
 [<ffffffffa059d0d3>] ieee80211_do_stop+0x625/0x67d [mac80211]
 [<ffffffff810fdf6a>] ? trace_hardirqs_on+0xd/0xf
 [<ffffffff810c6d42>] ? __local_bh_enable_ip+0xaf/0xd9
 [<ffffffff815d8156>] ? _raw_spin_unlock_bh+0x31/0x35
 [<ffffffff8153a693>] ? dev_deactivate_many+0x129/0x172
 [<ffffffffa059d140>] ieee80211_stop+0x15/0x19 [mac80211]
 [<ffffffff8151beff>] __dev_close_many+0x95/0xba
 [<ffffffff8151bfa5>] __dev_close+0x48/0x67
 [<ffffffff81522696>] __dev_change_flags+0xa6/0x14a
 [<ffffffff8152276d>] dev_change_flags+0x23/0x59
 [<ffffffff8152c318>] do_setlink+0x2d7/0x793
 [<ffffffff8152ef6e>] rtnl_newlink+0x36f/0x5a7
 [<ffffffff8152ed0a>] ? rtnl_newlink+0x10b/0x5a7


(gdb) l *(ath10k_txrx_tx_unref+0x91)
0xe18d is in ath10k_txrx_tx_unref (/mnt/sda/home/greearb/git/linux-3.14.dev.y/drivers/net/wireless/ath/ath10k/txrx.c:109).
104		}
105	
106		msdu = htt->pending_tx[tx_done->msdu_id];
107		skb_cb = ATH10K_SKB_CB(msdu);
108	
109		dma_unmap_single(dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
110	
111		if (skb_cb->htt.txbuf)
112			dma_pool_free(htt->tx_pool,
113				      skb_cb->htt.txbuf,
(gdb)


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
