Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2A6C433FE
	for <ath10k@archiver.kernel.org>; Sun,  9 Oct 2022 22:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0J+PCn81+Ui/wWEAVAVc3XvOLhYY/nXfrPJVA9uGVfc=; b=QvROzyjIqEMR7R
	sESbAy/IpO+u9idtWppQh01yZrreAzS5NIad0d9lCKHJUF3Eu4vqAMwdtjEMYJjb3dVL6uYA3tKin
	T1ZeeaLCyiKfj461lx9HE1uQZkaFdeGbkLTopR9MGpGMhGDtiWHRzJJ05H8Yh9Cz/jADOHqxYYN90
	apMpszvCHvWHQl0JqOcvEMBUiQU63RwR5RpuvgXg1HbK2+B1yYlJDmvz9EUbREcqMu6lFpH1e6DLo
	5IkdCVHOlO+oGcNI9LGaMEiA9GdJOLwPSGAbhcDZjBaNdZ3R2qCW4WoYNWsc8IO+L8LW4WHAAkKCs
	NYKmAkRJOcAPWWW6mEIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohecl-00GIg7-9Y; Sun, 09 Oct 2022 22:18:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohech-00GIbc-Aa
	for ath10k@lists.infradead.org; Sun, 09 Oct 2022 22:18:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 378D6B80E08;
	Sun,  9 Oct 2022 22:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA988C43470;
	Sun,  9 Oct 2022 22:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665353887;
	bh=UVZMA2RK0mPNN5VAO8y4/YIx8AFwayIMshF7l9Se24k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DN6qT3r6cj3w33JifhTN6fX3Dh/KwOPAgYuq7wPAJSgflngzCj96jNUwnmHP9EQVC
	 2QqwDJlyyE3pw+7uAYjR+MeUM5tn1v48rOzCUaOG1jILmGCEi5LgswMVVwzgDdTKqo
	 +lskP3BNpOvbI9rXHW/95o7xxcCiRqQAaIHRVWIFOHJxZlx4A85L4BT0DSvNiNnb+t
	 RZlrbSF1TD/GXgY1vLZ8avwCvVZTSid4OpumcWiayElE0DOwTiVBWFyRmJPhu64pwC
	 Xf96eVXzR8Xz2cYOaMPVDnha0zOgemlSq8nyRQc9QFDad+uW5T9G+P/dvU+DCtJmer
	 EILwxMl0nApZg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wen Gong <quic_wgong@quicinc.com>,
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
Subject: [PATCH AUTOSEL 5.19 54/73] wifi: ath10k: reset pointer after memory free to avoid potential use-after-free
Date: Sun,  9 Oct 2022 18:14:32 -0400
Message-Id: <20221009221453.1216158-54-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009221453.1216158-1-sashal@kernel.org>
References: <20221009221453.1216158-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_151815_553291_84B9A8F9 
X-CRM114-Status: GOOD (  11.08  )
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

From: Wen Gong <quic_wgong@quicinc.com>

[ Upstream commit 1e1cb8e0b73e6f39a9d4a7a15d940b1265387eb5 ]

When running suspend test, kernel crash happened in ath10k, and it is
fixed by commit b72a4aff947b ("ath10k: skip ath10k_halt during suspend
for driver state RESTARTING").

Currently the crash is fixed, but as a common code style, it is better
to set the pointer to NULL after memory is free.

This is to address the code style and it will avoid potential bug of
use-after-free.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00110-QCARMSWP-1
Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20220505092248.787-1-quic_wgong@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index fe34fcc00af0..55a520237263 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -301,12 +301,16 @@ void ath10k_htt_rx_free(struct ath10k_htt *htt)
 			  ath10k_htt_get_vaddr_ring(htt),
 			  htt->rx_ring.base_paddr);
 
+	ath10k_htt_config_paddrs_ring(htt, NULL);
+
 	dma_free_coherent(htt->ar->dev,
 			  sizeof(*htt->rx_ring.alloc_idx.vaddr),
 			  htt->rx_ring.alloc_idx.vaddr,
 			  htt->rx_ring.alloc_idx.paddr);
+	htt->rx_ring.alloc_idx.vaddr = NULL;
 
 	kfree(htt->rx_ring.netbufs_ring);
+	htt->rx_ring.netbufs_ring = NULL;
 }
 
 static inline struct sk_buff *ath10k_htt_rx_netbuf_pop(struct ath10k_htt *htt)
@@ -846,8 +850,10 @@ int ath10k_htt_rx_alloc(struct ath10k_htt *htt)
 			  ath10k_htt_get_rx_ring_size(htt),
 			  vaddr_ring,
 			  htt->rx_ring.base_paddr);
+	ath10k_htt_config_paddrs_ring(htt, NULL);
 err_dma_ring:
 	kfree(htt->rx_ring.netbufs_ring);
+	htt->rx_ring.netbufs_ring = NULL;
 err_netbuf:
 	return -ENOMEM;
 }
-- 
2.35.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
