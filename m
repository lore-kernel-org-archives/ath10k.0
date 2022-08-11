Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73628C19F2A
	for <ath10k@archiver.kernel.org>; Thu, 11 Aug 2022 15:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHOxQkWTcwR4jv0R7lSOGNAHsLUCBtbLI5E3BJmuJkA=; b=uPgG3FN5zMqPGs
	Ce+PCkt8EoHtjrOxeA6Ui+1Xx7UpdgSC98jLvDtSg7W5Q75B1lCvSfkFpICI3fxl2Iu2U7kwUYhNo
	sQ7WvjShz7Dyf9PVx04uRPuGyrtzHyH3TKIUEHslLBJtC7Idg5yde071NeuB/yrVfAABghHAleepj
	Uu2vCh10+QgBfGVC9YwMBpMilfMjBGfAZD0+6FvbfUMIoArAFQ1qFhodDCtx7dNeU1eEwtsdmIXL6
	HShswTj3bNEGIDjMXd3HN1PzxwI2tceR1A2eirmQReZZF0I8aUOizzGNy7SO42fCQ9eJHoMwSA4xR
	pbbRLkaB+PqFSHIraNmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMAYW-00EXBm-8M; Thu, 11 Aug 2022 15:57:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMAYP-00EX48-Be
	for ath10k@lists.infradead.org; Thu, 11 Aug 2022 15:57:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E19E561307;
	Thu, 11 Aug 2022 15:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7114CC433C1;
	Thu, 11 Aug 2022 15:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660233420;
	bh=6ZWUFGHzj3t1dR5Jc/nh1Z2SbkQ3ZS2lBDADQz965o4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tQYpOuAILVmhw5xOzjPNYEgMLB7Ad9VRKnYMRewQTfWGu+LSmu+250596rwuj7kUS
	 ihpog0V1FfNljQdezMxG5VgDWgMjjlpNDyvgEQiJ2d4lQQ/RCbck2pu7+SGlCD0Vmx
	 oeQTCbclWrwXHQwymG9CiUtBgtbhGoegNSKrFg9t4autMr0ek/9oIf0DXuo6kTWhXm
	 rKaRrLZ5tI++5yHcGusxLRWJN6bWjfFTqRiDgeblYM2F0EnYvLw5hbYFjnfojo2fMl
	 fjDRQcmFp6FgJRebw9/ka1piXqRvcJBQwWTarM7WkJl74WUjMOwJbXxbp2/ikxr6JV
	 rDPRxYXL+HIXQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Maxime Bizon <mbizon@freebox.fr>,
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
Subject: [PATCH AUTOSEL 5.15 04/69] ath10k: fix misreported tx bandwidth for 160Mhz
Date: Thu, 11 Aug 2022 11:55:13 -0400
Message-Id: <20220811155632.1536867-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811155632.1536867-1-sashal@kernel.org>
References: <20220811155632.1536867-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_085701_469218_CB1C31FC 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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

From: Maxime Bizon <mbizon@freebox.fr>

[ Upstream commit 75a7062e533e309a9ca0812c69f3ac3cefadb8b1 ]

Because of this missing switch case, 160Mhz transmit was reported as
20Mhz, leading to wrong airtime calculation and AQL limiting max
throughput.

Tested-on: QCA9984 hw2.0 PCI 10.4-3.10-00047

Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/cd2735a40da7f4fcc5323e3fca3775e7b5402ece.camel@freebox.fr
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index adbaeb67eedf..59595001e2d9 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -3759,6 +3759,10 @@ ath10k_update_per_peer_tx_stats(struct ath10k *ar,
 		arsta->tx_info.status.rates[0].flags |=
 				IEEE80211_TX_RC_80_MHZ_WIDTH;
 		break;
+	case RATE_INFO_BW_160:
+		arsta->tx_info.status.rates[0].flags |=
+				IEEE80211_TX_RC_160_MHZ_WIDTH;
+		break;
 	}
 
 	if (peer_stats->succ_pkts) {
-- 
2.35.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
