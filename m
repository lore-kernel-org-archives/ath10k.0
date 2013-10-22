Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYfAS-0008Rq-6M
 for ath10k@lists.infradead.org; Tue, 22 Oct 2013 16:50:53 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id r9MGoQHd026049
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Tue, 22 Oct 2013 09:50:26 -0700
Message-ID: <5266ACD2.7080204@candelatech.com>
Date: Tue, 22 Oct 2013 09:50:26 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Firmware crash and kernel crash when associating second STA to same
 AP.
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

I didn't really expect this to work yet, but for the record, here is
what happens when you create a second station and ask it to associate
to the same AP as the first station.

It looks like the ath10k crash is similar or same to the other
problem I saw on station restart.  I am going to see if I can
figure out how to at least mitigate this crash as it is going
to make debugging the firmware even more difficult.

If anyone has any hints on how to figure out where the
firmware crashed based on the dump below, please let me know
(privately, if that seems appropriate).


Last login: Mon Oct 21 17:16:51 from 192.168.100.236
[root@ct523-9292 ~]# IPv6: ADDRCONF(NETDEV_UP): sta300: link is not ready
sta300: authenticate with 00:03:83:3d:30:aa
ath10k: Failed to add peer: 00:03:83:3d:30:aa for VDEV: 1
ath10k: vdev setup failed -110
sta300: send auth to 00:03:83:3d:30:aa (try 1/3)
ath10k: firmware crashed!
ath10k: hardware name qca988x hw2.0 version 0x4100016c
ath10k: firmware version: 1.0.0.636
ath10k: target register Dump Location: 0x00401930
ath10k: target Register Dump
ath10k: [00]: 0x4100016C 0x00000000 0x0098B7DA 0x00000000
ath10k: [04]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [08]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [12]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [16]: 0x00000000 0x00000000 0x00000000 0x0098B7DA
ath10k: [20]: 0x00000000 0x00401930 0x00000000 0x00000000
ath10k: [24]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [28]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [32]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [36]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [40]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [44]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [48]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [52]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [56]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: Completion buffers are full
ieee80211 wiphy2: Hardware restart was requested
ath10k: tx failed (-108). dropping packet.
sta300: send auth to 00:03:83:3d:30:aa (try 2/3)
ath10k: MSI-X interrupt handling (8 intrs)
sta300: send auth to 00:03:83:3d:30:aa (try 3/3)
sta300: authentication with 00:03:83:3d:30:aa timed out
ath10k: Target stalled
BUG: unable to handle kernel NULL pointer dereference at 0000000000000008
IP: [<ffffffffa04af334>] ath10k_ce_completed_send_next+0x48/0x10d [ath10k_pci]
PGD 0
Oops: 0000 [#1] PREEMPT SMP
Modules linked in: rpcsec_gss_krb5 auth_rpcgss oid_registry nfsv4 nfs fscache nf_nat_ipv4 nf_nat veth 8021q]
CPU: 2 PID: 23 Comm: ksoftirqd/2 Tainted: G        WC   3.12.0-rc5-wl+ #1
Hardware name: To be filled by O.E.M. To be filled by O.E.M./HURONRIVER, BIOS 4.6.5 05/02/2012
task: ffff8802163a0000 ti: ffff88021639e000 task.ti: ffff88021639e000
RIP: 0010:[<ffffffffa04af334>]  [<ffffffffa04af334>] ath10k_ce_completed_send_next+0x48/0x10d [ath10k_pci]
RSP: 0018:ffff88021639fc88  EFLAGS: 00010246
RAX: 0000000000006363 RBX: ffff880215a3d410 RCX: ffff88021639fd18
RDX: 0000000000057400 RSI: ffff88021639fd20 RDI: ffff880215a3d408
RBP: ffff88021639fce8 R08: ffff88021639fd1c R09: ffff88020c463fd8
R10: 000000000000b5cf R11: 000000000000b5cf R12: ffff88020d6fd720
R13: ffff88021639fd20 R14: 0000000000000000 R15: ffff88021639fd14
FS:  0000000000000000(0000) GS:ffff88021fb00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000008 CR3: 0000000001a0d000 CR4: 00000000000407e0
Stack:
 ffff88021639fcd8 ffffffff810bd4df ffff88021639fd1c ffff88021639fd18
 0000000000000000 ffff880215a3d408 ffff88021639fce8 ffff88020d6fd720
 ffff880215a3d000 ffff880215a3d410 ffff88020d6fd720 ffff880215a3d0a8
Call Trace:
 [<ffffffff810bd4df>] ? __wake_up_common+0x49/0x80
 [<ffffffffa04ad23d>] ath10k_pci_ce_send_done+0xd3/0xef [ath10k_pci]
 [<ffffffff810a1670>] ? _local_bh_enable_ip.isra.15+0x1e/0x9b
 [<ffffffffa04af473>] ath10k_ce_per_engine_service+0x7a/0xab [ath10k_pci]
 [<ffffffffa04ac24a>] ath10k_pci_ce_tasklet+0x15/0x17 [ath10k_pci]
 [<ffffffff810a1600>] tasklet_action+0x7b/0xcd
 [<ffffffff810a17d7>] __do_softirq+0xbb/0x175
 [<ffffffff810a18af>] run_ksoftirqd+0x1e/0x3b
 [<ffffffff810bcfa9>] smpboot_thread_fn+0x1f9/0x217
 [<ffffffff810bcdb0>] ? test_ti_thread_flag.constprop.3+0x11/0x11
 [<ffffffff810bcdb0>] ? test_ti_thread_flag.constprop.3+0x11/0x11
 [<ffffffff810b6a8e>] kthread+0x88/0x90
 [<ffffffff810b6a06>] ? __kthread_parkme+0x60/0x60
 [<ffffffff8157160c>] ret_from_fork+0x7c/0xb0
 [<ffffffff810b6a06>] ? __kthread_parkme+0x60/0x60
Code: 48 89 4d b8 4c 89 45 b0 48 8b 80 a0 01 00 00 48 05 08 04 00 00 48 89 c7 48 89 45 c8 e8 df f8 ff ff 4c
RIP  [<ffffffffa04af334>] ath10k_ce_completed_send_next+0x48/0x10d [ath10k_pci]
 RSP <ffff88021639fc88>
CR2: 0000000000000008
---[ end trace decd329ee4470646 ]---
Kernel panic - not syncing: Fatal exception in interrupt
drm_kms_helper: panic occurred, switching back to text console

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
