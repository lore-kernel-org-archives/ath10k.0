Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021D7C433EF
	for <ath10k@archiver.kernel.org>; Mon, 30 May 2022 14:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1GzlDklbuP9Er51Q5ctCNbObyfV1tg7C4sCkF/SnDc=; b=lk/LOn9bPTUR1K
	WZzS9nhMk9SyR/41K+CuCsWHkWf2ijwNquE3AWLdxKHjKDDAkneh0ZSuTPLExxwIIVHp++3/+p2Vu
	iHiJdk432rH5WA/ONCfPKLEtkbnZbCeKSWjhfAebiAvJdBsQy1C+EtmD5LRa5fBhC5m4xzvukdjiV
	H3VmEnoQYxCzsbjsvYCUvefuObm6w1VMIh+uI/NfwPOZyel5AhwiSkp0hQgjZ/HZ7gsPF4m5EFhKY
	YtE8aB2k3MzyE0RDC7uPcVm/PwZk2cJuXwOUYjm2oeCpE/8zD4h/xB7rWpqf0iK5G3x8s2ax/Y6BA
	INYQISm+cFCQHgwW1M3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvg2Y-0073EJ-Sk; Mon, 30 May 2022 14:06:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfi2-006rAm-1w
	for ath10k@lists.infradead.org; Mon, 30 May 2022 13:45:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7AF6160F38;
	Mon, 30 May 2022 13:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E00C3411C;
	Mon, 30 May 2022 13:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653918324;
	bh=YFNLJObT+99Vqbj49NVedidIb5fj3R9QH0Uzdy2Y1ZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KCRY13t9G+pwAWyp9N4dmQjrj0GWhUo9RjiQ9Z6dmIgZqnzwnwQX7syOVxeZg9Qz9
	 YPLjP3+nUhPT0Ck+ViVd4AnSlYtFyNinBCZtiXV2YXZSaNQ0sqrdNiF2bVE4C/Hu7K
	 AMQZHH7OgvW4oKHdvdCCPKulPFidarRFe8qKPzAjJpfOVW5C+3EvBquHC2ekfEJs36
	 RhcuU7kgWOOHkIRylo8XC5ukfp0uwpepheLAjzHgoGV+qoYKuEevgUXiiXGKKlVjhR
	 2N8/lLMzexXvEuJ5ZRqKJtdmhnDmY6zvYFBlL7Qg+mo+aRolzmsoP47/wl2RGxl+vk
	 lt6Hacn/ifNEA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Abhishek Kumar <kuabhs@chromium.org>,
	Wen Gong <quic_wgong@quicinc.com>,
	Brian Norris <briannorris@chromium.org>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 35/76] ath10k: skip ath10k_halt during suspend for driver state RESTARTING
Date: Mon, 30 May 2022 09:43:25 -0400
Message-Id: <20220530134406.1934928-35-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530134406.1934928-1-sashal@kernel.org>
References: <20220530134406.1934928-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_064526_301727_6BDE32B2 
X-CRM114-Status: GOOD (  19.07  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: Abhishek Kumar <kuabhs@chromium.org>

[ Upstream commit b72a4aff947ba807177bdabb43debaf2c66bee05 ]

Double free crash is observed when FW recovery(caused by wmi
timeout/crash) is followed by immediate suspend event. The FW recovery
is triggered by ath10k_core_restart() which calls driver clean up via
ath10k_halt(). When the suspend event occurs between the FW recovery,
the restart worker thread is put into frozen state until suspend completes.
The suspend event triggers ath10k_stop() which again triggers ath10k_halt()
The double invocation of ath10k_halt() causes ath10k_htt_rx_free() to be
called twice(Note: ath10k_htt_rx_alloc was not called by restart worker
thread because of its frozen state), causing the crash.

To fix this, during the suspend flow, skip call to ath10k_halt() in
ath10k_stop() when the current driver state is ATH10K_STATE_RESTARTING.
Also, for driver state ATH10K_STATE_RESTARTING, call
ath10k_wait_for_suspend() in ath10k_stop(). This is because call to
ath10k_wait_for_suspend() is skipped later in
[ath10k_halt() > ath10k_core_stop()] for the driver state
ATH10K_STATE_RESTARTING.

The frozen restart worker thread will be cancelled during resume when the
device comes out of suspend.

Below is the crash stack for reference:

[  428.469167] ------------[ cut here ]------------
[  428.469180] kernel BUG at mm/slub.c:4150!
[  428.469193] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
[  428.469219] Workqueue: events_unbound async_run_entry_fn
[  428.469230] RIP: 0010:kfree+0x319/0x31b
[  428.469241] RSP: 0018:ffffa1fac015fc30 EFLAGS: 00010246
[  428.469247] RAX: ffffedb10419d108 RBX: ffff8c05262b0000
[  428.469252] RDX: ffff8c04a8c07000 RSI: 0000000000000000
[  428.469256] RBP: ffffa1fac015fc78 R08: 0000000000000000
[  428.469276] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  428.469285] Call Trace:
[  428.469295]  ? dma_free_attrs+0x5f/0x7d
[  428.469320]  ath10k_core_stop+0x5b/0x6f
[  428.469336]  ath10k_halt+0x126/0x177
[  428.469352]  ath10k_stop+0x41/0x7e
[  428.469387]  drv_stop+0x88/0x10e
[  428.469410]  __ieee80211_suspend+0x297/0x411
[  428.469441]  rdev_suspend+0x6e/0xd0
[  428.469462]  wiphy_suspend+0xb1/0x105
[  428.469483]  ? name_show+0x2d/0x2d
[  428.469490]  dpm_run_callback+0x8c/0x126
[  428.469511]  ? name_show+0x2d/0x2d
[  428.469517]  __device_suspend+0x2e7/0x41b
[  428.469523]  async_suspend+0x1f/0x93
[  428.469529]  async_run_entry_fn+0x3d/0xd1
[  428.469535]  process_one_work+0x1b1/0x329
[  428.469541]  worker_thread+0x213/0x372
[  428.469547]  kthread+0x150/0x15f
[  428.469552]  ? pr_cont_work+0x58/0x58
[  428.469558]  ? kthread_blkcg+0x31/0x31

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Co-developed-by: Wen Gong <quic_wgong@quicinc.com>
Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
Reviewed-by: Brian Norris <briannorris@chromium.org>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20220426221859.v2.1.I650b809482e1af8d0156ed88b5dc2677a0711d46@changeid
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index b59d482d9c23..b61cd275fbda 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5170,13 +5170,29 @@ static int ath10k_start(struct ieee80211_hw *hw)
 static void ath10k_stop(struct ieee80211_hw *hw)
 {
 	struct ath10k *ar = hw->priv;
+	u32 opt;
 
 	ath10k_drain_tx(ar);
 
 	mutex_lock(&ar->conf_mutex);
 	if (ar->state != ATH10K_STATE_OFF) {
-		if (!ar->hw_rfkill_on)
-			ath10k_halt(ar);
+		if (!ar->hw_rfkill_on) {
+			/* If the current driver state is RESTARTING but not yet
+			 * fully RESTARTED because of incoming suspend event,
+			 * then ath10k_halt() is already called via
+			 * ath10k_core_restart() and should not be called here.
+			 */
+			if (ar->state != ATH10K_STATE_RESTARTING) {
+				ath10k_halt(ar);
+			} else {
+				/* Suspending here, because when in RESTARTING
+				 * state, ath10k_core_stop() skips
+				 * ath10k_wait_for_suspend().
+				 */
+				opt = WMI_PDEV_SUSPEND_AND_DISABLE_INTR;
+				ath10k_wait_for_suspend(ar, opt);
+			}
+		}
 		ar->state = ATH10K_STATE_OFF;
 	}
 	mutex_unlock(&ar->conf_mutex);
-- 
2.35.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
