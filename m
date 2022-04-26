Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CB7C433EF
	for <ath10k@archiver.kernel.org>; Tue, 26 Apr 2022 22:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bN2RwyCuwvo1rkTkwFboK+2EuRjpi5oyEZzG45gNmZg=; b=lZz+7ujeC0RW1Q
	P1QNL37xF8olVenNo2oabX+3DWlNZOQGQd95Ij31jifuUP5rF3Qq3jq9Tc48fRVU7+FzDjbsmTFII
	1xbw0fdOas/KL3+emlFnuzYdPrMObiF8n7WPaVHROceF9obVGFD1lQ1OmSGZn9hJ22C24ZizPEvwR
	Pn4AxFhQqR9Dv7Nuhy/vmmvksed9SziTx/e/2mJ8z8ffmjiR6ZcHI4pCxBZ9DnKot3oLrpvq97FH1
	6GDJ2wCrU59JkYQb/snK+z1qbYXUKGRao71BuMgDdItHhmA2VaXOba7brVeURt5TMcJ4tz5UacE1T
	C6V/FC8rzUQNDLHY4Peg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njTXt-00GQcQ-9j; Tue, 26 Apr 2022 22:20:33 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njTXq-00GQbm-5P
 for ath10k@lists.infradead.org; Tue, 26 Apr 2022 22:20:31 +0000
Received: by mail-pf1-x42a.google.com with SMTP id j6so16882111pfe.13
 for <ath10k@lists.infradead.org>; Tue, 26 Apr 2022 15:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JVRFURdG76Dl9sspocpqmwwFtBArwWcQWqjE+72v8EI=;
 b=d1V64UADOytbZfDzDvJ3VfAxmezyXbcsGjfZlN6KFb9k94Y8qkdpcxCILHBfHoIv9Z
 2p2c4EuBMpr1yUDRGvvafKoyb2R1/Xd1I2D+0IbIL92O+pMDCjQ+1HkUZusQ8tws7BOb
 31dCkpLYVicv+Ok4o8bMN5GU/tu4pwAvuS3Cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JVRFURdG76Dl9sspocpqmwwFtBArwWcQWqjE+72v8EI=;
 b=P+f24I3JEYf3P2ptNRW44/+zgmxhg2xq0vwARb/BnrtY4jjnbBCpQ2avpwwzPmkg2T
 ReRJbqxd4U1l5xRXRy0lA6hHECQ/DCxj+XrVtQoxCzvhulDPdGbtNN6/iyNHjHFudLpM
 6Qa/8ACw2wJxFOtFlJzmYf7QaQ/MzrgT6R154tSEmhQRCJdZ9NRteUJsVZP+i0zV6VJ+
 pIL4QpmIlvBqXNibQfA3yt9I+sqKhDcPAqo38jfW0KkvyR1dLiJa2f2u3zjOiE1ng4l6
 8tmRJFXpVdNDWYE+NjUBy9yU/5/YVri41/PY0O1toxUy66PCnbif45mVaxFPVTRQuaS8
 Qa6A==
X-Gm-Message-State: AOAM53186NPzRdpmf0cgJdjzZrAKpq+/UiWb0+01TChlgATrbpp5jcQW
 Sh4g66byEb4PjxnL0O3HQxaQMQ==
X-Google-Smtp-Source: ABdhPJzHnDPpa/XWh62VMiNx0ZNq8fNu0fcxeXXhNFJA5lFTWuZ6hQZaUyNDQQ3ibJy4N+tQ1Y+u/g==
X-Received: by 2002:aa7:8096:0:b0:50c:e24a:3bf8 with SMTP id
 v22-20020aa78096000000b0050ce24a3bf8mr26662983pff.29.1651011628708; 
 Tue, 26 Apr 2022 15:20:28 -0700 (PDT)
Received: from kuabhs-cdev.c.googlers.com.com
 (240.111.247.35.bc.googleusercontent.com. [35.247.111.240])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a62d442000000b0050d404f837fsm8029107pfl.156.2022.04.26.15.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 15:20:27 -0700 (PDT)
From: Abhishek Kumar <kuabhs@chromium.org>
To: kvalo@kernel.org
Cc: quic_wgong@quicinc.com, kuabhs@chromium.org, briannorris@chromium.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2] ath10k: skip ath10k_halt during suspend for driver state
 RESTARTING
Date: Tue, 26 Apr 2022 22:19:55 +0000
Message-Id: <20220426221859.v2.1.I650b809482e1af8d0156ed88b5dc2677a0711d46@changeid>
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_152030_257633_D40083AC 
X-CRM114-Status: GOOD (  17.62  )
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
---

Changes in v2:
- Fixed typo, replaced ath11k by ath10k in the comments.
- Adjusted the position of my S-O-B tag.
- Added the Tested-on tag.

 drivers/net/wireless/ath/ath10k/mac.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index d804e19a742a..e9c1f11fef0a 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5345,8 +5345,22 @@ static void ath10k_stop(struct ieee80211_hw *hw)
 
 	mutex_lock(&ar->conf_mutex);
 	if (ar->state != ATH10K_STATE_OFF) {
-		if (!ar->hw_rfkill_on)
-			ath10k_halt(ar);
+		if (!ar->hw_rfkill_on) {
+			/* If the current driver state is RESTARTING but not yet
+			 * fully RESTARTED because of incoming suspend event,
+			 * then ath10k_halt is already called via
+			 * ath10k_core_restart and should not be called here.
+			 */
+			if (ar->state != ATH10K_STATE_RESTARTING)
+				ath10k_halt(ar);
+			else
+				/* Suspending here, because when in RESTARTING
+				 * state, ath10k_core_stop skips
+				 * ath10k_wait_for_suspend.
+				 */
+				ath10k_wait_for_suspend(ar,
+							WMI_PDEV_SUSPEND_AND_DISABLE_INTR);
+		}
 		ar->state = ATH10K_STATE_OFF;
 	}
 	mutex_unlock(&ar->conf_mutex);
-- 
2.36.0.464.gb9c8b46e94-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
