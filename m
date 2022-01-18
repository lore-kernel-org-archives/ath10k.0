Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DACC433F5
	for <ath10k@archiver.kernel.org>; Tue, 18 Jan 2022 03:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Rjd98qrwj/OTNOae7NRNk0F99Wi3AnUZYn7XHed9KU=; b=kaar07SH1mJpB8
	uQKog76w6QJp91jnUqGLE9oiVT6l0uHfIYUufaGqDdtoZF3q1Nu5tHjXYs0E+OdO0ELwso9ZK9er2
	s+Crk/T0CswLIYoWA1iHBprGj45NDeMZ6MltEiPPhNRGgl844/9ya5Htc7u/tP4Cc6kdmAQCkBmZ4
	T7gIVmsYpdDqkTD70Z2/WufeieRyYQ0AzxOAqrr9a6E7BxHDHBy/oU0Pn33U4W3qHssM6L+Y5wEhl
	LyUqdJt3WvqjkBBne+byEbH4Nxu7JYcNRUhtygMzev092X0djkTUonKFMrw9faDZHv22ytqJGLdsz
	kj6ZcItGFXkzZhjuzCoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9fHJ-00HV7l-Iu; Tue, 18 Jan 2022 03:35:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9eZg-00H8Ry-QA
 for ath10k@lists.infradead.org; Tue, 18 Jan 2022 02:50:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 529EF611DF;
 Tue, 18 Jan 2022 02:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7A0C36AF5;
 Tue, 18 Jan 2022 02:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642474219;
 bh=9oG4xj9ttTijGI2JUk52wdOZci4nJijHpeKVd81ia/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Re3cMTzOn9SRADsMWQ7Xncaviwk+Yb6k5Wjs2CZPqiLL8dAal/voIgk3SxgK9Vp0g
 FI/5IGo5usIfvW6wPmxjsR9QOg6FbcSsOXAjOiWqF6i0P5uZfNlOGkiPteOLFmgE/h
 m3wX0cbCxMVrNxb/bNUN97HFOSB9UDiEX8oLv1EWiJJZtoQI1ZpKUYkX4fSVCE8zWP
 dMzvi7M7xuIYB+TtJXcsfZPSDEB5pCmIpo0OLaA6Ml1QNm+6DznPaSq53qLEHDPevJ
 rvVTqqKWiwfqXpULIK8wMEsTXxbqQmrSeeaMN2LTINPXvBlpEnL9S6IrSnAk2Clg5G
 pQpgGOWfzc6yA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sebastian Gottschall <s.gottschall@dd-wrt.com>,
 Kalle Valo <quic_kvalo@quicinc.com>, Sasha Levin <sashal@kernel.org>,
 kvalo@kernel.org, davem@davemloft.net, kuba@kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 28/56] ath10k: Fix tx hanging
Date: Mon, 17 Jan 2022 21:48:40 -0500
Message-Id: <20220118024908.1953673-28-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118024908.1953673-1-sashal@kernel.org>
References: <20220118024908.1953673-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_185020_983285_CD985293 
X-CRM114-Status: GOOD (  11.63  )
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

From: Sebastian Gottschall <s.gottschall@dd-wrt.com>

[ Upstream commit e8a91863eba3966a447d2daa1526082d52b5db2a ]

While running stress tests in roaming scenarios (switching ap's every 5
seconds, we discovered a issue which leads to tx hangings of exactly 5
seconds while or after scanning for new accesspoints. We found out that
this hanging is triggered by ath10k_mac_wait_tx_complete since the
empty_tx_wq was not wake when the num_tx_pending counter reaches zero.
To fix this, we simply move the wake_up call to htt_tx_dec_pending,
since this call was missed on several locations within the ath10k code.

Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20210505085806.11474-1-s.gottschall@dd-wrt.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 3 +++
 drivers/net/wireless/ath/ath10k/txrx.c   | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 685faac1368fd..21f5fb68b2046 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -158,6 +158,9 @@ void ath10k_htt_tx_dec_pending(struct ath10k_htt *htt)
 	htt->num_pending_tx--;
 	if (htt->num_pending_tx == htt->max_num_pending_tx - 1)
 		ath10k_mac_tx_unlock(htt->ar, ATH10K_TX_PAUSE_Q_FULL);
+
+	if (htt->num_pending_tx == 0)
+		wake_up(&htt->empty_tx_wq);
 }
 
 int ath10k_htt_tx_inc_pending(struct ath10k_htt *htt)
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index 9999c8c40269d..e6705a30f3799 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -90,8 +90,6 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 
 	ath10k_htt_tx_free_msdu_id(htt, tx_done->msdu_id);
 	ath10k_htt_tx_dec_pending(htt);
-	if (htt->num_pending_tx == 0)
-		wake_up(&htt->empty_tx_wq);
 	spin_unlock_bh(&htt->tx_lock);
 
 	dma_unmap_single(dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
-- 
2.34.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
