Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dANVE-0002jO-AK
 for ath10k@lists.infradead.org; Mon, 15 May 2017 21:26:07 +0000
From: greearb@candelatech.com
Subject: [PATCH 2/3] ath10k:  Fix napi related crash when otp fails.
Date: Mon, 15 May 2017 14:25:39 -0700
Message-Id: <1494883540-18558-2-git-send-email-greearb@candelatech.com>
In-Reply-To: <1494883540-18558-1-git-send-email-greearb@candelatech.com>
References: <1494883540-18558-1-git-send-email-greearb@candelatech.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

The failure case is something like this:

otp fails (probably because BMI timeout was too short)
so core_start fails
so the entire firmware load fails..but since it was not ever
started properly, then it is not stopped as far as PCI is concerned.
So, napi is not released.

A bit later, maybe, the driver succeeds in loading and then we have a
BUG splat.

------------[ cut here ]------------
kernel BUG at /home/greearb/git/linux-4.9.dev.y/include/linux/netdevice.h:515!
invalid opcode: 0000 [#1] PREEMPT SMP
Modules linked in: nf_conntrack_netlink nf_conntrack nfnetlink nf_defrag_ipv4 bridge ath10k_pci ath10k_core 8021q garp mrp stp llc bnep bluetooth fuse macv]
CPU: 1 PID: 3651 Comm: wpa_supplicant Not tainted 4.9.27+ #35
Hardware name: To be filled by O.E.M. To be filled by O.E.M./ChiefRiver, BIOS 4.6.5 06/07/2013
task: ffff8802111f0000 task.stack: ffffc90001fb4000
RIP: 0010:[<ffffffffa1498d33>]  [<ffffffffa1498d33>] ath10k_pci_hif_power_up+0x173/0x180 [ath10k_pci]
RSP: 0018:ffffc90001fb7c30  EFLAGS: 00010246
RAX: 0000000000000008 RBX: ffff880212bc2bc0 RCX: 0000000000082004
RDX: ffffc9000d282000 RSI: ffffc9000d282000 RDI: 000000000fd0a000
RBP: ffffc90001fb7c40 R08: 0000000000200000 R09: 0000000000000101
R10: 0000000000000d00 R11: 0000000000000003 R12: 0000000000082000
R13: ffff880212beaef8 R14: 0000000000000000 R15: ffff8802134c1118
FS:  00007f476575c800(0000) GS:ffff88021e240000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f3da950b490 CR3: 0000000212b5a000 CR4: 00000000001406e0
Stack:
 ffff880212bc2bc0 ffff880212bc0700 ffffc90001fb7c68 ffffffffa1429281
 ffff8802134c0000 ffff880212bc0700 0000000000000000 ffffc90001fb7c90
 ffffffffa07cb818 ffff8802134c0000 ffff880212bc0700 0000000000000000
Call Trace:
 [<ffffffffa1429281>] ath10k_start+0x51/0x5c0 [ath10k_core]
 [<ffffffffa07cb818>] drv_start+0x38/0x140 [mac80211]
 [<ffffffffa07e2cc5>] ieee80211_do_open+0x2c5/0x990 [mac80211]
 [<ffffffffa07e33e0>] ieee80211_open+0x50/0x60 [mac80211]
 [<ffffffff817a9f2a>] __dev_open+0xaa/0x120
 [<ffffffff817aa208>] __dev_change_flags+0x98/0x160
 [<ffffffff817aa2f4>] dev_change_flags+0x24/0x60
 [<ffffffff8182388e>] devinet_ioctl+0x5ee/0x6c0
 [<ffffffff8182535b>] inet_ioctl+0x4b/0x70
 [<ffffffff81787430>] sock_do_ioctl+0x20/0x50
 [<ffffffff81787936>] sock_ioctl+0x1d6/0x2a0
 [<ffffffff8128d24b>] do_vfs_ioctl+0x8b/0x5b0
 [<ffffffff8178adbd>] ? __sys_recvmsg+0x3d/0x70
 [<ffffffff8128d7e4>] SyS_ioctl+0x74/0x80
 [<ffffffff8188a83b>] entry_SYSCALL_64_fastpath+0x1e/0xad
Code: ff ff ff 89 c2 48 89 df 48 c7 c6 10 d3 49 a1 e8 34 1d f9 ff 48 89 df e8 2c f9 ff ff 44 89 e0 c6 83 0e 74 02 00 01 5b 41 5c 5d c3 <0f> 0b 66 66 2e 0f
RIP  [<ffffffffa1498d33>] ath10k_pci_hif_power_up+0x173/0x180 [ath10k_pci]
 RSP <ffffc90001fb7c30>
---[ end trace b6dede286ed70e39 ]---

The BUG in question is this:

/**
 *      napi_enable - enable NAPI scheduling
 *      @n: NAPI context
 *
 * Resume NAPI from being scheduled on this context.
 * Must be paired with napi_disable.
 */
static inline void napi_enable(struct napi_struct *n)
{
        BUG_ON(!test_bit(NAPI_STATE_SCHED, &n->state));
        smp_mb__before_atomic();
        clear_bit(NAPI_STATE_SCHED, &n->state);
        clear_bit(NAPI_STATE_NPSVC, &n->state);
}

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index a715677..ad544b2 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1806,7 +1806,7 @@ static int ath10k_core_pre_cal_config(struct ath10k *ar)
 
 	ret = ath10k_download_and_run_otp(ar);
 	if (ret) {
-		ath10k_err(ar, "failed to run otp: %d\n", ret);
+		ath10k_err(ar, "failed to run otp: %d  (pre-cal-config)\n", ret);
 		return ret;
 	}
 
@@ -1860,7 +1860,7 @@ static int ath10k_download_cal_data(struct ath10k *ar)
 
 	ret = ath10k_download_and_run_otp(ar);
 	if (ret) {
-		ath10k_err(ar, "failed to run otp: %d\n", ret);
+		ath10k_err(ar, "failed to run otp: %d (download-cal-data)\n", ret);
 		return ret;
 	}
 
@@ -2783,7 +2783,11 @@ static void ath10k_core_register_work(struct work_struct *work)
 
 	status = ath10k_core_probe_fw(ar);
 	if (status) {
-		ath10k_err(ar, "could not probe fw (%d)\n", status);
+		ath10k_err(ar, "could not probe fw (%d), releasing napi\n", status);
+		/* Make sure that NAPI state is cleaned up, it can otherwise fail
+		 * to be cleaned up in some error cases.
+		 */
+		napi_disable(&ar->napi);
 		goto err;
 	}
 
-- 
2.4.11


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
