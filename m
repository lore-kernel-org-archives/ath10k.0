Return-Path: <SRS0=Mu6E=H2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198B7C433DB
	for <ath10k@archiver.kernel.org>; Wed, 24 Feb 2021 12:51:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98D4164F40
	for <ath10k@archiver.kernel.org>; Wed, 24 Feb 2021 12:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98D4164F40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V8NDN23ZB+s7fEpJKx7iRkZGiBh/D+m7ASs6uEYHHSA=; b=W9APeIpVHc9BfJyiItBY8jhBLF
	3oyPWWtYNgQoQZNf7blZzpqYWGErnCvTvJA+9cdmT8zvDA/W/rE+r2co3lq5prZ/veMZEdq/zDe9M
	O/aDy2wVdfWcx2v4AVQB74J+8S67gHm6c66q2Spem9WtiwWpV4mnRl+Er3Ig+pcp3LOrBWBXiU+73
	aCctUeFfyKVqMebxJiE/erT2JX5w4vha2GO1oLXrHMuv9SdHMeCkUx37tPdFrrov3EYKHwsI0vwou
	6Cc6u7eaxWXiHhg/XIyY6EsjwOzK3N1QO9RNS7DRl7R9523sLkabc5SGbWhD/AqmMicMPI8HLaAQS
	C+GrFGxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEtce-0001sb-Ne; Wed, 24 Feb 2021 12:50:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEtcc-0001s0-Hj
 for ath10k@lists.infradead.org; Wed, 24 Feb 2021 12:50:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DEDD364DAF;
 Wed, 24 Feb 2021 12:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614171028;
 bh=TSUkDEg3idbCvGR1Il326oKHNcQCPo7tDTvdJZbZUeY=;
 h=From:To:Cc:Subject:Date:From;
 b=Zg9p1o4r8WxWMc8WrM2qcVMRtkKdFEHakKMRBxoHHM58msBSjKgdKugccqMyioOax
 JLVp8Jmnck3rcoae9mewdeFVre6DPOkOeaj+oYpTE1fjTaNPb0kPl0DZCgv4v8byWJ
 YrQZtZYJcdnNtubNk1Y68Nc+0vkMg6ostoFbY51lHdDKxgXOGNm3EL8JlQU4WXv+Cd
 U/WYc08/SSonYiSSqcYKzYMcgKlCuwL/OKv/HQ/R4yuxkCDRLUhf2wv/UyX5JbRYif
 sNpTWL+kk7GHBGXXX2rBsod9Y/1e0yzcq/4KgWgqZrmotYjMxdp6O170czg41AwnZn
 XAr4sGmHIhU0g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 01/67] ath10k: prevent deinitializing NAPI twice
Date: Wed, 24 Feb 2021 07:49:19 -0500
Message-Id: <20210224125026.481804-1-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_075030_770631_8076868D 
X-CRM114-Status: GOOD (  12.42  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 Wen Gong <wgong@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: Wen Gong <wgong@codeaurora.org>

[ Upstream commit e2f8b74e58cb1560c1399ba94a470b770e858259 ]

It happened "Kernel panic - not syncing: hung_task: blocked tasks" when
test simulate crash and ifconfig down/rmmod meanwhile.

Test steps:

1.Test commands, either can reproduce the hang for PCIe, SDIO and SNOC.
echo soft > /sys/kernel/debug/ieee80211/phy0/ath10k/simulate_fw_crash;sleep 0.05;ifconfig wlan0 down
echo soft > /sys/kernel/debug/ieee80211/phy0/ath10k/simulate_fw_crash;rmmod ath10k_sdio
echo hw-restart > /sys/kernel/debug/ieee80211/phy0/ath10k/simulate_fw_crash;rmmod ath10k_pci

2. dmesg:
[ 5622.548630] ath10k_sdio mmc1:0001:1: simulating soft firmware crash
[ 5622.655995] ieee80211 phy0: Hardware restart was requested
[ 5776.355164] INFO: task shill:1572 blocked for more than 122 seconds.
[ 5776.355687] INFO: task kworker/1:2:24437 blocked for more than 122 seconds.
[ 5776.359812] Kernel panic - not syncing: hung_task: blocked tasks
[ 5776.359836] CPU: 1 PID: 55 Comm: khungtaskd Tainted: G        W         4.19.86 #137
[ 5776.359846] Hardware name: MediaTek krane sku176 board (DT)
[ 5776.359855] Call trace:
[ 5776.359868]  dump_backtrace+0x0/0x170
[ 5776.359881]  show_stack+0x20/0x2c
[ 5776.359896]  dump_stack+0xd4/0x10c
[ 5776.359916]  panic+0x12c/0x29c
[ 5776.359937]  hung_task_panic+0x0/0x50
[ 5776.359953]  kthread+0x120/0x130
[ 5776.359965]  ret_from_fork+0x10/0x18
[ 5776.359986] SMP: stopping secondary CPUs
[ 5776.360012] Kernel Offset: 0x141ea00000 from 0xffffff8008000000
[ 5776.360026] CPU features: 0x0,2188200c
[ 5776.360035] Memory Limit: none

command "ifconfig wlan0 down" or "rmmod ath10k_sdio" will be blocked
callstack of ifconfig:
[<0>] __switch_to+0x120/0x13c
[<0>] msleep+0x28/0x38
[<0>] ath10k_sdio_hif_stop+0x24c/0x294 [ath10k_sdio]
[<0>] ath10k_core_stop+0x50/0x78 [ath10k_core]
[<0>] ath10k_halt+0x120/0x178 [ath10k_core]
[<0>] ath10k_stop+0x4c/0x8c [ath10k_core]
[<0>] drv_stop+0xe0/0x1e4 [mac80211]
[<0>] ieee80211_stop_device+0x48/0x54 [mac80211]
[<0>] ieee80211_do_stop+0x678/0x6f8 [mac80211]
[<0>] ieee80211_stop+0x20/0x30 [mac80211]
[<0>] __dev_close_many+0xb8/0x11c
[<0>] __dev_change_flags+0xe0/0x1d0
[<0>] dev_change_flags+0x30/0x6c
[<0>] devinet_ioctl+0x370/0x564
[<0>] inet_ioctl+0xdc/0x304
[<0>] sock_do_ioctl+0x50/0x288
[<0>] compat_sock_ioctl+0x1b4/0x1aac
[<0>] __se_compat_sys_ioctl+0x100/0x26fc
[<0>] __arm64_compat_sys_ioctl+0x20/0x2c
[<0>] el0_svc_common+0xa4/0x154
[<0>] el0_svc_compat_handler+0x2c/0x38
[<0>] el0_svc_compat+0x8/0x18
[<0>] 0xffffffffffffffff

callstack of rmmod:
[<0>] __switch_to+0x120/0x13c
[<0>] msleep+0x28/0x38
[<0>] ath10k_sdio_hif_stop+0x294/0x31c [ath10k_sdio]
[<0>] ath10k_core_stop+0x50/0x78 [ath10k_core]
[<0>] ath10k_halt+0x120/0x178 [ath10k_core]
[<0>] ath10k_stop+0x4c/0x8c [ath10k_core]
[<0>] drv_stop+0xe0/0x1e4 [mac80211]
[<0>] ieee80211_stop_device+0x48/0x54 [mac80211]
[<0>] ieee80211_do_stop+0x678/0x6f8 [mac80211]
[<0>] ieee80211_stop+0x20/0x30 [mac80211]
[<0>] __dev_close_many+0xb8/0x11c
[<0>] dev_close_many+0x70/0x100
[<0>] dev_close+0x4c/0x80
[<0>] cfg80211_shutdown_all_interfaces+0x50/0xcc [cfg80211]
[<0>] ieee80211_remove_interfaces+0x58/0x1a0 [mac80211]
[<0>] ieee80211_unregister_hw+0x40/0x100 [mac80211]
[<0>] ath10k_mac_unregister+0x1c/0x44 [ath10k_core]
[<0>] ath10k_core_unregister+0x38/0x7c [ath10k_core]
[<0>] ath10k_sdio_remove+0x8c/0xd0 [ath10k_sdio]
[<0>] sdio_bus_remove+0x48/0x108
[<0>] device_release_driver_internal+0x138/0x1ec
[<0>] driver_detach+0x6c/0xa8
[<0>] bus_remove_driver+0x78/0xa8
[<0>] driver_unregister+0x30/0x50
[<0>] sdio_unregister_driver+0x28/0x34
[<0>] cleanup_module+0x14/0x6bc [ath10k_sdio]
[<0>] __arm64_sys_delete_module+0x1e0/0x22c
[<0>] el0_svc_common+0xa4/0x154
[<0>] el0_svc_compat_handler+0x2c/0x38
[<0>] el0_svc_compat+0x8/0x18
[<0>] 0xffffffffffffffff

SNOC:
[  647.156863] Call trace:
[  647.162166] [<ffffff80080855a4>] __switch_to+0x120/0x13c
[  647.164512] [<ffffff800899d8b8>] __schedule+0x5ec/0x798
[  647.170062] [<ffffff800899dad8>] schedule+0x74/0x94
[  647.175050] [<ffffff80089a0848>] schedule_timeout+0x314/0x42c
[  647.179874] [<ffffff80089a0a14>] schedule_timeout_uninterruptible+0x34/0x40
[  647.185780] [<ffffff80082a494>] msleep+0x28/0x38
[  647.192546] [<ffffff800117ec4c>] ath10k_snoc_hif_stop+0x4c/0x1e0 [ath10k_snoc]
[  647.197439] [<ffffff80010dfbd8>] ath10k_core_stop+0x50/0x7c [ath10k_core]
[  647.204652] [<ffffff80010c8f48>] ath10k_halt+0x114/0x16c [ath10k_core]
[  647.211420] [<ffffff80010cad68>] ath10k_stop+0x4c/0x88 [ath10k_core]
[  647.217865] [<ffffff8000fdbf54>] drv_stop+0x110/0x244 [mac80211]
[  647.224367] [<ffffff80010147ac>] ieee80211_stop_device+0x48/0x54 [mac80211]
[  647.230359] [<ffffff8000ff3eec>] ieee80211_do_stop+0x6a4/0x73c [mac80211]
[  647.237033] [<ffffff8000ff4500>] ieee80211_stop+0x20/0x30 [mac80211]
[  647.243942] [<ffffff80087e39b8>] __dev_close_many+0xa0/0xfc
[  647.250435] [<ffffff80087e3888>] dev_close_many+0x70/0x100
[  647.255651] [<ffffff80087e3a60>] dev_close+0x4c/0x80
[  647.261244] [<ffffff8000f1ba54>] cfg80211_shutdown_all_interfaces+0x44/0xcc [cfg80211]
[  647.266383] [<ffffff8000ff3fdc>] ieee80211_remove_interfaces+0x58/0x1b4 [mac80211]
[  647.274128] [<ffffff8000fda540>] ieee80211_unregister_hw+0x50/0x120 [mac80211]
[  647.281659] [<ffffff80010ca314>] ath10k_mac_unregister+0x1c/0x44 [ath10k_core]
[  647.288839] [<ffffff80010dfc94>] ath10k_core_unregister+0x48/0x90 [ath10k_core]
[  647.296027] [<ffffff800117e598>] ath10k_snoc_remove+0x5c/0x150 [ath10k_snoc]
[  647.303229] [<ffffff80085625fc>] platform_drv_remove+0x28/0x50
[  647.310517] [<ffffff80085601a4>] device_release_driver_internal+0x114/0x1b8
[  647.316257] [<ffffff80085602e4>] driver_detach+0x6c/0xa8
[  647.323021] [<ffffff800855e5b8>] bus_remove_driver+0x78/0xa8
[  647.328571] [<ffffff800856107c>] driver_unregister+0x30/0x50
[  647.334213] [<ffffff8008562674>] platform_driver_unregister+0x1c/0x28
[  647.339876] [<ffffff800117fefc>] cleanup_module+0x1c/0x120 [ath10k_snoc]
[  647.346196] [<ffffff8008143ab8>] SyS_delete_module+0x1dc/0x22c

PCIe:
[  615.392770] rmmod           D    0  3523   3458 0x00000080
[  615.392777] Call Trace:
[  615.392784]  __schedule+0x617/0x7d3
[  615.392791]  ? __mod_timer+0x263/0x35c
[  615.392797]  schedule+0x62/0x72
[  615.392803]  schedule_timeout+0x8d/0xf3
[  615.392809]  ? run_local_timers+0x6b/0x6b
[  615.392814]  msleep+0x1b/0x22
[  615.392824]  ath10k_pci_hif_stop+0x68/0xd6 [ath10k_pci]
[  615.392844]  ath10k_core_stop+0x44/0x67 [ath10k_core]
[  615.392859]  ath10k_halt+0x102/0x153 [ath10k_core]
[  615.392873]  ath10k_stop+0x38/0x75 [ath10k_core]
[  615.392893]  drv_stop+0x9a/0x13c [mac80211]
[  615.392915]  ieee80211_do_stop+0x772/0x7cd [mac80211]
[  615.392937]  ieee80211_stop+0x1a/0x1e [mac80211]
[  615.392945]  __dev_close_many+0x9e/0xf0
[  615.392952]  dev_close_many+0x62/0xe8
[  615.392958]  dev_close+0x54/0x7d
[  615.392975]  cfg80211_shutdown_all_interfaces+0x6e/0xa5 [cfg80211]
[  615.393021]  ieee80211_remove_interfaces+0x52/0x1aa [mac80211]
[  615.393049]  ieee80211_unregister_hw+0x54/0x136 [mac80211]
[  615.393068]  ath10k_mac_unregister+0x19/0x4a [ath10k_core]
[  615.393091]  ath10k_core_unregister+0x39/0x7e [ath10k_core]
[  615.393104]  ath10k_pci_remove+0x3d/0x7f [ath10k_pci]
[  615.393117]  pci_device_remove+0x41/0xa6
[  615.393129]  device_release_driver_internal+0x123/0x1ec
[  615.393140]  driver_detach+0x60/0x90
[  615.393152]  bus_remove_driver+0x72/0x9f
[  615.393164]  pci_unregister_driver+0x1e/0x87
[  615.393177]  SyS_delete_module+0x1d7/0x277
[  615.393188]  do_syscall_64+0x6b/0xf7
[  615.393199]  entry_SYSCALL_64_after_hwframe+0x41/0xa6

The test command run simulate_fw_crash firstly and it call into
ath10k_sdio_hif_stop from ath10k_core_restart, then napi_disable
is called and bit NAPI_STATE_SCHED is set. After that, function
ath10k_sdio_hif_stop is called again from ath10k_stop by command
"ifconfig wlan0 down" or "rmmod ath10k_sdio", then command blocked.

It is blocked by napi_synchronize, napi_disable will set bit with
NAPI_STATE_SCHED, and then napi_synchronize will enter dead loop
becuase bit NAPI_STATE_SCHED is set by napi_disable.

function of napi_synchronize
static inline void napi_synchronize(const struct napi_struct *n)
{
	if (IS_ENABLED(CONFIG_SMP))
		while (test_bit(NAPI_STATE_SCHED, &n->state))
			msleep(1);
	else
		barrier();
}

function of napi_disable
void napi_disable(struct napi_struct *n)
{
	might_sleep();
	set_bit(NAPI_STATE_DISABLE, &n->state);

	while (test_and_set_bit(NAPI_STATE_SCHED, &n->state))
		msleep(1);
	while (test_and_set_bit(NAPI_STATE_NPSVC, &n->state))
		msleep(1);

	hrtimer_cancel(&n->timer);

	clear_bit(NAPI_STATE_DISABLE, &n->state);
}

Add flag for it avoid the hang and crash.

Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00049
Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00110-QCARMSWP-1
Tested-on: WCN3990 hw1.0 SNOC hw1.0 WLAN.HL.3.1-01307.1-QCAHLSWMTPL-2

Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/1598617348-2325-1-git-send-email-wgong@codeaurora.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/ahb.c  |  5 ++---
 drivers/net/wireless/ath/ath10k/core.c | 25 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/core.h |  5 +++++
 drivers/net/wireless/ath/ath10k/pci.c  |  7 ++++---
 drivers/net/wireless/ath/ath10k/sdio.c |  5 ++---
 drivers/net/wireless/ath/ath10k/snoc.c |  6 +++---
 6 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index 05a61975c83f4..869524852fbaa 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -626,7 +626,7 @@ static int ath10k_ahb_hif_start(struct ath10k *ar)
 {
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot ahb hif start\n");
 
-	napi_enable(&ar->napi);
+	ath10k_core_napi_enable(ar);
 	ath10k_ce_enable_interrupts(ar);
 	ath10k_pci_enable_legacy_irq(ar);
 
@@ -644,8 +644,7 @@ static void ath10k_ahb_hif_stop(struct ath10k *ar)
 	ath10k_ahb_irq_disable(ar);
 	synchronize_irq(ar_ahb->irq);
 
-	napi_synchronize(&ar->napi);
-	napi_disable(&ar->napi);
+	ath10k_core_napi_sync_disable(ar);
 
 	ath10k_pci_flush(ar);
 }
diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index eeb6ff6aa2e1e..a419ec7130f97 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2305,6 +2305,31 @@ void ath10k_core_start_recovery(struct ath10k *ar)
 }
 EXPORT_SYMBOL(ath10k_core_start_recovery);
 
+void ath10k_core_napi_enable(struct ath10k *ar)
+{
+	lockdep_assert_held(&ar->conf_mutex);
+
+	if (test_bit(ATH10K_FLAG_NAPI_ENABLED, &ar->dev_flags))
+		return;
+
+	napi_enable(&ar->napi);
+	set_bit(ATH10K_FLAG_NAPI_ENABLED, &ar->dev_flags);
+}
+EXPORT_SYMBOL(ath10k_core_napi_enable);
+
+void ath10k_core_napi_sync_disable(struct ath10k *ar)
+{
+	lockdep_assert_held(&ar->conf_mutex);
+
+	if (!test_bit(ATH10K_FLAG_NAPI_ENABLED, &ar->dev_flags))
+		return;
+
+	napi_synchronize(&ar->napi);
+	napi_disable(&ar->napi);
+	clear_bit(ATH10K_FLAG_NAPI_ENABLED, &ar->dev_flags);
+}
+EXPORT_SYMBOL(ath10k_core_napi_sync_disable);
+
 static void ath10k_core_restart(struct work_struct *work)
 {
 	struct ath10k *ar = container_of(work, struct ath10k, restart_work);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 51f7e960e2977..f4be6bfb25392 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -868,6 +868,9 @@ enum ath10k_dev_flags {
 
 	/* Indicates that ath10k device is during recovery process and not complete */
 	ATH10K_FLAG_RESTARTING,
+
+	/* protected by conf_mutex */
+	ATH10K_FLAG_NAPI_ENABLED,
 };
 
 enum ath10k_cal_mode {
@@ -1308,6 +1311,8 @@ static inline bool ath10k_peer_stats_enabled(struct ath10k *ar)
 
 extern unsigned long ath10k_coredump_mask;
 
+void ath10k_core_napi_sync_disable(struct ath10k *ar);
+void ath10k_core_napi_enable(struct ath10k *ar);
 struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 				  enum ath10k_bus bus,
 				  enum ath10k_hw_rev hw_rev,
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 2328df09875ce..e7fde635e0eef 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1958,7 +1958,7 @@ static int ath10k_pci_hif_start(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot hif start\n");
 
-	napi_enable(&ar->napi);
+	ath10k_core_napi_enable(ar);
 
 	ath10k_pci_irq_enable(ar);
 	ath10k_pci_rx_post(ar);
@@ -2075,8 +2075,9 @@ static void ath10k_pci_hif_stop(struct ath10k *ar)
 
 	ath10k_pci_irq_disable(ar);
 	ath10k_pci_irq_sync(ar);
-	napi_synchronize(&ar->napi);
-	napi_disable(&ar->napi);
+
+	ath10k_core_napi_sync_disable(ar);
+
 	cancel_work_sync(&ar_pci->dump_work);
 
 	/* Most likely the device has HTT Rx ring configured. The only way to
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index c415090d1f37c..b746052737e0b 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1859,7 +1859,7 @@ static int ath10k_sdio_hif_start(struct ath10k *ar)
 	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
 	int ret;
 
-	napi_enable(&ar->napi);
+	ath10k_core_napi_enable(ar);
 
 	/* Sleep 20 ms before HIF interrupts are disabled.
 	 * This will give target plenty of time to process the BMI done
@@ -1992,8 +1992,7 @@ static void ath10k_sdio_hif_stop(struct ath10k *ar)
 
 	spin_unlock_bh(&ar_sdio->wr_async_lock);
 
-	napi_synchronize(&ar->napi);
-	napi_disable(&ar->napi);
+	ath10k_core_napi_sync_disable(ar);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index bf9a8cb713dc0..2c2df0b8b3fd9 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -915,8 +915,7 @@ static void ath10k_snoc_hif_stop(struct ath10k *ar)
 	if (!test_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags))
 		ath10k_snoc_irq_disable(ar);
 
-	napi_synchronize(&ar->napi);
-	napi_disable(&ar->napi);
+	ath10k_core_napi_sync_disable(ar);
 	ath10k_snoc_buffer_cleanup(ar);
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot hif stop\n");
 }
@@ -926,7 +925,8 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 
 	bitmap_clear(ar_snoc->pending_ce_irqs, 0, CE_COUNT_MAX);
-	napi_enable(&ar->napi);
+
+	ath10k_core_napi_enable(ar);
 	ath10k_snoc_irq_enable(ar);
 	ath10k_snoc_rx_post(ar);
 
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
