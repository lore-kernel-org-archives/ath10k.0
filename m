Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8GS6-0000ip-LD
 for ath10k@lists.infradead.org; Tue, 28 Jan 2014 21:44:15 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s0SLhhTi007919
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Tue, 28 Jan 2014 13:43:44 -0800
Message-ID: <52E8248F.8090601@candelatech.com>
Date: Tue, 28 Jan 2014 13:43:43 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: ath10k crash on firmware crash.
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

I don't think I've seen this one (or at least not recently).
...

Firmware had just crashed, then OS crashed:

ATH10K_DBG_BUFFER:
ath10k: [1] next: 0x4127f4 buf: 0x4106e4 sz: 1500 len: 0 count: 0 free: 0
ath10k: ctl_resp never came in (-110)
ath10k: failed to connect to HTC: -110
ath10k: could not init core (-110)
BUG: unable to handle kernel NULL pointer dereference at           (null)
IP: [<ffffffffa0b355c1>] ath10k_ce_send+0x1d/0x15d [ath10k_pci]
PGD 0
Oops: 0000 [#1] PREEMPT SMP
Modules linked in: ath10k_pci ath10k_core ath5k ath9k ath9k_common ath9k_hw ath mac80211 cfg80211 nf_nat_ipv4 ]
CPU: 1 PID: 36 Comm: kworker/1:1 Tainted: G        WC   3.13.0-rc8-wl-ath+ #8
Hardware name: To be filled by O.E.M. To be filled by O.E.M./HURONRIVER, BIOS 4.6.5 05/02/2012
Workqueue: events ieee80211_restart_work [mac80211]
task: ffff880215b521c0 ti: ffff880215e18000 task.ti: ffff880215e18000
RIP: 0010:[<ffffffffa0b355c1>]  [<ffffffffa0b355c1>] ath10k_ce_send+0x1d/0x15d [ath10k_pci]
RSP: 0018:ffff880215e19af8  EFLAGS: 00010292
RAX: ffff880215e19b10 RBX: 0000000000000000 RCX: 0000000000000018
RDX: 00000000d9ccf800 RSI: ffff8800c965ad00 RDI: 0000000000000000
RBP: ffff880215e19b58 R08: 0000000000000002 R09: 0000000000000000
R10: ffffffff812e1a23 R11: 0000000000000292 R12: 0000000000000018
R13: 0000000000000000 R14: 0000000000000002 R15: ffff88021562d700
FS:  0000000000000000(0000) GS:ffff88021fa80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000001a0d000 CR4: 00000000000407e0
Stack:
 d9ccf8000d47df40 ffffffffa0b367a0 ffff880215e19b10 0000000000000010
 ffff880215e19b68 ffff880215e19b28 0000000000000018 ffff8800c965ad00
 0000000000000018 0000000000000000 0000000000000002 ffff88021562d700
Call Trace:
 [<ffffffffa0b3251d>] ath10k_pci_hif_send_head+0xa7/0xcb [ath10k_pci]
 [<ffffffffa0b16cbe>] ath10k_htc_send+0x23d/0x2d0 [ath10k_core]
 [<ffffffffa0b1a169>] ath10k_wmi_cmd_send_nowait+0x5d/0x85 [ath10k_core]
 [<ffffffffa0b1aaef>] ath10k_wmi_cmd_send+0x62/0x115 [ath10k_core]
 [<ffffffff814e8abd>] ? __netdev_alloc_skb+0x4b/0x9b
 [<ffffffffa0b1c438>] ath10k_wmi_vdev_set_param+0x91/0xa3 [ath10k_core]
 [<ffffffffa0b0e0d5>] ath10k_mac_set_rts+0x3e/0x40 [ath10k_core]
 [<ffffffffa0b0e1d0>] ath10k_set_frag_threshold+0x5e/0x9c [ath10k_core]
 [<ffffffffa09d60eb>] ieee80211_reconfig+0x12a/0x7b3 [mac80211]
 [<ffffffff815a8069>] ? mutex_unlock+0x9/0xb
 [<ffffffffa09b3a40>] ieee80211_restart_work+0x5e/0x68 [mac80211]
 [<ffffffff810c01d0>] process_one_work+0x1d7/0x2fc
 [<ffffffff810c0166>] ? process_one_work+0x16d/0x2fc
 [<ffffffff810c06c8>] worker_thread+0x12e/0x1fb
 [<ffffffff810c059a>] ? rescuer_thread+0x27b/0x27b
 [<ffffffff810c5aee>] kthread+0xb5/0xbd
 [<ffffffff815a9220>] ? _raw_spin_unlock_irq+0x28/0x42
 [<ffffffff810c5a39>] ? __kthread_parkme+0x5c/0x5c
 [<ffffffff815ae04c>] ret_from_fork+0x7c/0xb0
 [<ffffffff810c5a39>] ? __kthread_parkme+0x5c/0x5c
Code: df ff d0 48 83 c4 18 5b 41 5c 41 5d 5d c3 55 48 89 e5 41 57 41 56 45 89 c6 41 55 41 54 41 89 cc 53 48 89
RIP  [<ffffffffa0b355c1>] ath10k_ce_send+0x1d/0x15d [ath10k_pci]
 RSP <ffff880215e19af8>
CR2: 0000000000000000
---[ end trace 0ff0538694d604c2 ]---

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
