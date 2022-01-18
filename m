Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACB5C433F5
	for <ath10k@archiver.kernel.org>; Tue, 18 Jan 2022 03:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BeKnq2lc3h7Co+OWroLHy9jXl7iWAocQZrfXPAlz0c=; b=MQ7EZ22YglqsoC
	emcQST1c+wBke3hJphkKAyEDDkduSU0xB7Qm0/SWdj0K4CWiFIv8ePE/JxMI7UnfJme2b5Ir4RLfJ
	Rv5Ok5Wgsm4EoDOAT3dz4NZUbSHhMzqpPKxgvgmjnoBuT1GdRmhfWdkM0g4AtvNo1cbgA3M7BVYEF
	7m3ykP4KNaieJOEq01JRfznFmbs79vl6bIWIWXEgZOkp0NAaIKoq3kP8+D+9xN0evq6kfcTCRQJQ0
	6iEFs8cKsxqDtd20+vkdI7ntDevTRDC7093pRx3TWNkfH53foboDIVE1IbUJdfp9fHHqG5M6hUK91
	lF1Fqrc+Qs1HmuWRWa0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9exN-00HMfH-4A; Tue, 18 Jan 2022 03:14:49 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9eSC-00H4Kx-DH
 for ath10k@lists.infradead.org; Tue, 18 Jan 2022 02:42:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0B58DB81269;
 Tue, 18 Jan 2022 02:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913F4C36AF5;
 Tue, 18 Jan 2022 02:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642473753;
 bh=HBx2Z0bo2vlrE7hqQN6Os7uEULxdugf4B9uv+P7rybc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rCwPVPN29lp49RVsu1TkrLdlUhZUJ24Y81+LKx/Z30DXJPkIeF2rhES/KbDGpvx9s
 /rRbFvV5IR7MN32j2PJXVFLPFZuY9TjorRXaqBS3JKUo5FX57tKUiPJSiU+jgCA1pe
 LxL6qURW6r+GuamDZZvy7vn7PX3dCFoQm6o4GfI/7a0vi0jHarN9WgeSsY6lSZkglF
 +nAixBBXZvsU3Q7xpvXAywrY0PQVAz6p5capTl9U/DUWexmVlW9fnkrW3VY5Y9VX7x
 afCyDlBVqOkO5fhxCdp4av2l5EnwUqKjj/WmIp9APEqOh1yU0X75bY4AgD84RkMfna
 dmoATNO4pQXyg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sebastian Gottschall <s.gottschall@dd-wrt.com>,
 Kalle Valo <quic_kvalo@quicinc.com>, Sasha Levin <sashal@kernel.org>,
 kvalo@kernel.org, davem@davemloft.net, kuba@kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 054/116] ath10k: Fix tx hanging
Date: Mon, 17 Jan 2022 21:39:05 -0500
Message-Id: <20220118024007.1950576-54-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118024007.1950576-1-sashal@kernel.org>
References: <20220118024007.1950576-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_184236_659985_904C24B6 
X-CRM114-Status: GOOD (  11.83  )
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
index 1fc0a312ab587..5f67da47036cf 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -147,6 +147,9 @@ void ath10k_htt_tx_dec_pending(struct ath10k_htt *htt)
 	htt->num_pending_tx--;
 	if (htt->num_pending_tx == htt->max_num_pending_tx - 1)
 		ath10k_mac_tx_unlock(htt->ar, ATH10K_TX_PAUSE_Q_FULL);
+
+	if (htt->num_pending_tx == 0)
+		wake_up(&htt->empty_tx_wq);
 }
 
 int ath10k_htt_tx_inc_pending(struct ath10k_htt *htt)
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index aefe1f7f906c0..f51f1cf2c6a40 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -82,8 +82,6 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 	flags = skb_cb->flags;
 	ath10k_htt_tx_free_msdu_id(htt, tx_done->msdu_id);
 	ath10k_htt_tx_dec_pending(htt);
-	if (htt->num_pending_tx == 0)
-		wake_up(&htt->empty_tx_wq);
 	spin_unlock_bh(&htt->tx_lock);
 
 	rcu_read_lock();
-- 
2.34.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
