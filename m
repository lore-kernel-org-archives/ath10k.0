Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHYRE-0004mW-H1
 for ath10k@lists.infradead.org; Tue, 30 Oct 2018 18:08:26 +0000
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id C0A3921D28
 for <ath10k@lists.infradead.org>; Tue, 30 Oct 2018 14:08:06 -0400 (EDT)
Message-Id: <1540922886.3700604.1559938168.7431DD90@webmail.messagingengine.com>
From: nnet <nnet@fastmail.fm>
MIME-Version: 1.0
Subject: qca6174 and 4.19 error on resume from suspend
Date: Tue, 30 Oct 2018 11:08:06 -0700
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

Hello,

I get this on each resume from suspend (S3) since 4.19 (I'm not getting this with 4.18):

Oct 30 10:44:24 localhost  kernel: ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:1535
...
Oct 30 10:44:24 localhost kernel: ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00079-QCARMSWPZ-1 api 6 features wowlan,ignore-otp crc32 fd869beb
...
Oct 30 10:45:54 localhost kernel: WARNING: CPU: 1 PID: 14185 at drivers/net/wireless/ath/ath10k/mac.c:5625 ath10k_bss_info_changed+0xd2e/0xe70 [ath10>
...
Oct 30 10:45:54 localhost kernel: CPU: 1 PID: 14185 Comm: kworker/u16:38 Tainted: 4.19.0-1.vanilla.knurd.1.fc29.x86_64 #1
...
Oct 30 10:45:54 localhost kernel: Workqueue: events_unbound async_run_entry_fn
Oct 30 10:45:54 localhost kernel: RIP: 0010:ath10k_bss_info_changed+0xd2e/0xe70 [ath10k_core]
Oct 30 10:45:54 localhost kernel: Code: 89 c1 89 f2 4c 89 d7 48 c7 c6 58 17 b6 c0 4c 89 4c 24 10 89 44 24 08 e8 70 34 00 00 8b 44 24 08 4c 8b 4c 24 1>
Oct 30 10:45:54 localhost kernel: RSP: 0000:ffffbb8210b6fcc0 EFLAGS: 00010246
Oct 30 10:45:54 localhost kernel: RAX: 0000000000000000 RBX: ffff9ca3be21d3a0 RCX: 0000000000000000
Oct 30 10:45:54 localhost kernel: RDX: ffff9ca3ac6018b8 RSI: 0000000000000212 RDI: 0000000000000212
Oct 30 10:45:54 localhost kernel: RBP: 0000000002000000 R08: 0000000000200000 R09: 0000000000000000
Oct 30 10:45:54 localhost kernel: R10: 000000000000001f R11: ffff9ca3a7f70e00 R12: ffff9ca3be21d3a8
Oct 30 10:45:54 localhost kernel: R13: ffff9ca3ac601540 R14: ffff9ca3ac601540 R15: ffff9ca3be21d4f8
Oct 30 10:45:54 localhost kernel: FS:  0000000000000000(0000) GS:ffff9ca3c2440000(0000) knlGS:0000000000000000
Oct 30 10:45:54 localhost kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Oct 30 10:45:54 localhost kernel: CR2: 0000000000000000 CR3: 000000018720a001 CR4: 00000000003606e0
Oct 30 10:45:54 localhost kernel: Call Trace:
Oct 30 10:45:54 localhost kernel:  ? ath10k_conf_tx+0x7a/0x4b0 [ath10k_core]
Oct 30 10:45:54 localhost kernel:  ieee80211_bss_info_change_notify+0xab/0x1a0 [mac80211]
Oct 30 10:45:54 localhost kernel:  ieee80211_reconfig+0x656/0x12b0 [mac80211]
Oct 30 10:45:54 localhost kernel:  ? enqueue_entity+0xf6/0x680
Oct 30 10:45:54 localhost kernel:  wiphy_resume+0x7f/0x120 [cfg80211]
Oct 30 10:45:54 localhost kernel:  ? wiphy_suspend+0x270/0x270 [cfg80211]
Oct 30 10:45:54 localhost kernel:  dpm_run_callback+0x59/0x150
Oct 30 10:45:54 localhost kernel:  device_resume+0xac/0x1f0
Oct 30 10:45:54 localhost kernel:  async_resume+0x19/0x30
Oct 30 10:45:54 localhost kernel:  async_run_entry_fn+0x39/0x160
Oct 30 10:45:54 localhost kernel:  process_one_work+0x1a1/0x3a0
Oct 30 10:45:54 localhost kernel:  worker_thread+0x30/0x380
Oct 30 10:45:54 localhost kernel:  ? wq_update_unbound_numa+0x1a0/0x1a0
Oct 30 10:45:54 localhost kernel:  kthread+0x112/0x130
Oct 30 10:45:54 localhost kernel:  ? kthread_create_worker_on_cpu+0x70/0x70
Oct 30 10:45:54 localhost kernel:  ret_from_fork+0x35/0x40
Oct 30 10:45:54 localhost kernel: ---[ end trace 22a2cdec565049f3 ]---

Thanks

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
