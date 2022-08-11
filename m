Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F25C19F2A
	for <ath10k@archiver.kernel.org>; Thu, 11 Aug 2022 15:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfHcv2QVYwLM9u4+0ujwTqc0W0lSLsAug7nkRr7J+Ss=; b=5DM4NIsgh0Fi41
	EE3BlBL4uNA5dThd0N2vd4cqCLdXtnIlhvNrWElBafAbu/MlhImJPgzcSCbbOXX0KYgqTjHNNDOo6
	QJi/E1zDVSsyKPNaDSlwOhUZMzqU8f2UxVMlmcbddovEHyKsv/wUTPR87JPen6aGLCz/ScHEoV2ta
	AT5OtZlqEFP8dtzywNjLL2uzUkYUGmLD3Pj6WFBjMOuD+Qr5GzNC/V72Nlec/EhoTuJlZj+MfWSp2
	UnUQonQJlRplNT8nWSZAxI5ZbZ1JvR9zxxEVOMOM3XE6Z28k8tmdPs2lUOAN+McxJHdJLU805TUQR
	K9L0MYv5iozxw2uB/L5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMA7Z-00DwGp-W0; Thu, 11 Aug 2022 15:29:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMA7W-00DwB3-Ek
	for ath10k@lists.infradead.org; Thu, 11 Aug 2022 15:29:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 28044615FA;
	Thu, 11 Aug 2022 15:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D6CC43470;
	Thu, 11 Aug 2022 15:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660231752;
	bh=ZrVVdqJ1lXbKlPTTe/MiF2IuGjRwNIlSt/ErmVMx+tA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g0d4Sukdx57W5vYnuAd3ExcTdQwFbz2L6+7ibgM3pCM9djIC1tb2xNxzZsy7/eh8F
	 9N7+HPWrXc2qooiawXLfTcL1NNRKKO8kdipJeoAWSLN8O/pAqJk9gRdvpZtozDImny
	 UqbpMo+ufTWv9tjcRhzWJvcR9ux4Tsq3+G9yw6s+Jsu+rxfQ34NSvFWuIrKjtB1XlC
	 38jAKE9xOxZcXR0L2z5QnJIP+J4kbWfSlDL8eDeb9MJn6gUyuWJUtEJsdwWvkamirQ
	 nzavdxCLGezYTnluAEBBMPCu+NfZpfyKyYlWxj+VDnEVBlLK2dLsKP0B6e+3J9RWMv
	 Llkl8GAJRipNQ==
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
Subject: [PATCH AUTOSEL 5.19 004/105] ath10k: fix misreported tx bandwidth for 160Mhz
Date: Thu, 11 Aug 2022 11:26:48 -0400
Message-Id: <20220811152851.1520029-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811152851.1520029-1-sashal@kernel.org>
References: <20220811152851.1520029-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_082914_550668_814F49D5 
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
index 771252dd6d4e..e8727c0b0171 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -3884,6 +3884,10 @@ ath10k_update_per_peer_tx_stats(struct ath10k *ar,
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
