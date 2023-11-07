Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA22C4332F
	for <ath10k@archiver.kernel.org>; Tue,  7 Nov 2023 12:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oaOmH0aQ2rQRPWTJLLPzAioe8pUBZnY6N+hES/EXB0I=; b=bLtzObtAkNstVO
	7A8KKzCN0MWr4E7UaNpuBqSY5DTqGMgUdNqXeKbEw1s2txNFdzGF9WnXpKLTiqURWTKumlrgAl1v9
	yw5/zIAQI+lEuZMRxqqnjtPkESTFaJfNl8yTiiWbEcfKaah+QWX2K+tirMw1LEpHA9JIwcXjjtzX2
	dl+6GPZW2MazfGYYxTZGeqeWkEwiFzitTL7BmeCZ8UJev1HOaSjunI0SUb56/PgA18V7A3a0jxcF0
	DyLbxKXAcGNsTbuolR/UhKsp3XCoZ/rBdBP4h0bfSPFRw5cm0K/asWl2t4D6khh1oQ/kk78Uf6WTg
	fjWixnC+6v8x4uCQAmJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0KxI-001RPE-03;
	Tue, 07 Nov 2023 12:13:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0KxF-001RMN-0G
	for ath10k@lists.infradead.org;
	Tue, 07 Nov 2023 12:13:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9056AB816AC;
	Tue,  7 Nov 2023 12:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37763C433CA;
	Tue,  7 Nov 2023 12:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699359191;
	bh=auizaxjZWo181eTIjXWSFYxTaHqzBhVli8xUWRJcofo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X45mnEXxxxgx3DZ9EgCxqKnhehn+l9aKJcVLztuZQW3zai+qQfdP/fIvPwIxyRLJP
	 DOXtllbE2zAKy1jFEh3D8I5mMAzUPC6fHZRqmkjbLijGiqqEordeaVogja2Lk36SEU
	 XI9KLcXpfxqpoJmEIxL0ojNP5wiBs1KDY3LKEqWBS+r9+kLgrHzQYtnkIWvlPozvIe
	 1AjkZVgS8brVaYAVuDWUNoWHnRmwIXtCkH7YeHNZxhvB4Pr+VvOFsdrJKxprWUHjfm
	 cc7YFa5vVCmSjQcKRisAksPndVXnxQnnvOqAPDXx1Y46Ivw/ky7wLH9O1Jn8mgamnr
	 OW7/izF9YOOjw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	quic_jjohnson@quicinc.com,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 7/9] wifi: ath10k: Don't touch the CE interrupt registers after power up
Date: Tue,  7 Nov 2023 07:12:50 -0500
Message-ID: <20231107121256.3758858-7-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107121256.3758858-1-sashal@kernel.org>
References: <20231107121256.3758858-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.259
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_041313_396142_C5B12B5F 
X-CRM114-Status: GOOD (  14.48  )
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

From: Douglas Anderson <dianders@chromium.org>

[ Upstream commit 170c75d43a77dc937c58f07ecf847ba1b42ab74e ]

As talked about in commit d66d24ac300c ("ath10k: Keep track of which
interrupts fired, don't poll them"), if we access the copy engine
register at a bad time then ath10k can go boom. However, it's not
necessarily easy to know when it's safe to access them.

The ChromeOS test labs saw a crash that looked like this at
shutdown/reboot time (on a chromeos-5.15 kernel, but likely the
problem could also reproduce upstream):

Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
...
CPU: 4 PID: 6168 Comm: reboot Not tainted 5.15.111-lockdep-19350-g1d624fe6758f #1 010b9b233ab055c27c6dc88efb0be2f4e9e86f51
Hardware name: Google Kingoftown (DT)
...
pc : ath10k_snoc_read32+0x50/0x74 [ath10k_snoc]
lr : ath10k_snoc_read32+0x24/0x74 [ath10k_snoc]
...
Call trace:
ath10k_snoc_read32+0x50/0x74 [ath10k_snoc ...]
ath10k_ce_disable_interrupt+0x190/0x65c [ath10k_core ...]
ath10k_ce_disable_interrupts+0x8c/0x120 [ath10k_core ...]
ath10k_snoc_hif_stop+0x78/0x660 [ath10k_snoc ...]
ath10k_core_stop+0x13c/0x1ec [ath10k_core ...]
ath10k_halt+0x398/0x5b0 [ath10k_core ...]
ath10k_stop+0xfc/0x1a8 [ath10k_core ...]
drv_stop+0x148/0x6b4 [mac80211 ...]
ieee80211_stop_device+0x70/0x80 [mac80211 ...]
ieee80211_do_stop+0x10d8/0x15b0 [mac80211 ...]
ieee80211_stop+0x144/0x1a0 [mac80211 ...]
__dev_close_many+0x1e8/0x2c0
dev_close_many+0x198/0x33c
dev_close+0x140/0x210
cfg80211_shutdown_all_interfaces+0xc8/0x1e0 [cfg80211 ...]
ieee80211_remove_interfaces+0x118/0x5c4 [mac80211 ...]
ieee80211_unregister_hw+0x64/0x1f4 [mac80211 ...]
ath10k_mac_unregister+0x4c/0xf0 [ath10k_core ...]
ath10k_core_unregister+0x80/0xb0 [ath10k_core ...]
ath10k_snoc_free_resources+0xb8/0x1ec [ath10k_snoc ...]
ath10k_snoc_shutdown+0x98/0xd0 [ath10k_snoc ...]
platform_shutdown+0x7c/0xa0
device_shutdown+0x3e0/0x58c
kernel_restart_prepare+0x68/0xa0
kernel_restart+0x28/0x7c

Though there's no known way to reproduce the problem, it makes sense
that it would be the same issue where we're trying to access copy
engine registers when it's not allowed.

Let's fix this by changing how we "disable" the interrupts. Instead of
tweaking the copy engine registers we'll just use disable_irq() and
enable_irq(). Then we'll configure the interrupts once at power up
time.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20230630151842.1.If764ede23c4e09a43a842771c2ddf99608f25f8e@changeid
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index b6762fe2efe26..29d52f7b4336d 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -821,12 +821,20 @@ static void ath10k_snoc_hif_get_default_pipe(struct ath10k *ar,
 
 static inline void ath10k_snoc_irq_disable(struct ath10k *ar)
 {
-	ath10k_ce_disable_interrupts(ar);
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
+	int id;
+
+	for (id = 0; id < CE_COUNT_MAX; id++)
+		disable_irq(ar_snoc->ce_irqs[id].irq_line);
 }
 
 static inline void ath10k_snoc_irq_enable(struct ath10k *ar)
 {
-	ath10k_ce_enable_interrupts(ar);
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
+	int id;
+
+	for (id = 0; id < CE_COUNT_MAX; id++)
+		enable_irq(ar_snoc->ce_irqs[id].irq_line);
 }
 
 static void ath10k_snoc_rx_pipe_cleanup(struct ath10k_snoc_pipe *snoc_pipe)
@@ -1042,6 +1050,8 @@ static int ath10k_snoc_hif_power_up(struct ath10k *ar,
 		goto err_free_rri;
 	}
 
+	ath10k_ce_enable_interrupts(ar);
+
 	return 0;
 
 err_free_rri:
@@ -1196,8 +1206,8 @@ static int ath10k_snoc_request_irq(struct ath10k *ar)
 
 	for (id = 0; id < CE_COUNT_MAX; id++) {
 		ret = request_irq(ar_snoc->ce_irqs[id].irq_line,
-				  ath10k_snoc_per_engine_handler, 0,
-				  ce_name[id], ar);
+				  ath10k_snoc_per_engine_handler,
+				  IRQF_NO_AUTOEN, ce_name[id], ar);
 		if (ret) {
 			ath10k_err(ar,
 				   "failed to register IRQ handler for CE %d: %d",
-- 
2.42.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
