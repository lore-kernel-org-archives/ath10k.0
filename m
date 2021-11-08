Return-Path: <SRS0=svwy=P4=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00401C433F5
	for <ath10k@archiver.kernel.org>; Tue,  9 Nov 2021 01:22:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB59A6052B
	for <ath10k@archiver.kernel.org>; Tue,  9 Nov 2021 01:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB59A6052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4oHHoYuqHb2c8bcKs2vYf/uMb72OQ2b914r7crmOV4=; b=JzqO7nJjO6L2+A
	YgQtRvsC1q6nRS10CmjH/dXNRV5DDsUOh9VuzNQDJ2UoldWk2lFF1pEG+Ky7QBuVOPMica+iof7Ro
	tL8W4e+TIyw1eWDx2nLIIp6ZLqH/Tci36PCvBIPwDAGgj6TSUlGQ0iLH3JE0j8ONjaYs9rvGp36r/
	3CWTCB2x1iw9JkfnoctStwCzkBtbDLdvbGWBaUAIXyoZLRjXH5z4Z7Zg+NgKV45kHIt0H5ZwMJfSj
	ECLy5jI0XhuSiGvQJpyUWUUfkjmqCOsiP3Dt4MaZIcH0aRxcZ5nFqAT40q8L2iXJwsM2lP7BgnrhR
	KjzCnJ9+v9dfS1sz4A7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkFq8-000Imj-2I; Tue, 09 Nov 2021 01:22:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkFZM-000Ca3-C5
 for ath10k@lists.infradead.org; Tue, 09 Nov 2021 01:05:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B73096120D;
 Tue,  9 Nov 2021 01:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636419899;
 bh=hHiNAa3I2wCEZ5cOE5Wg+rHBmePlZ+fvG55HTsZLcLg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u7M+k8PHQetilxoOHejbjIyNE7UxC9nrwhlf9QjDt0SKNVqMRXuq+hIwPTWD4eqSu
 yeSDAL1KZ0ioelXH8eC0BcOG7nHmU3Gx93I0+8ZBvZXYt1MZMMSu+BGi01mqFsgoCg
 NslFRXQUP47DOsoDXdx7hex/OK0RQ2+jLycGYATmn6FBMKoKjw6TgjM/sOSJKOc+4g
 gWfZ+Bjt+O4HLmxg2MWn9itmfFZzNhX6fP4RR21MAFom5HAeQBmURGdJhpudJB2yFi
 hrYULbVg00ego3wWDdGfkLw0PxG9/nWu7uhJzLfdcLLNrPSxdWc1ZAzMDbK7lrhNDc
 x5HIcGrqypfkQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alagu Sankar <alagusankar@silex-india.com>,
 Erik Stromdahl <erik.stromdahl@gmail.com>,
 Fabio Estevam <festevam@denx.de>, Kalle Valo <kvalo@codeaurora.org>,
 Sasha Levin <sashal@kernel.org>, davem@davemloft.net, kuba@kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 18/74] ath10k: high latency fixes for beacon buffer
Date: Mon,  8 Nov 2021 12:48:45 -0500
Message-Id: <20211108174942.1189927-18-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108174942.1189927-1-sashal@kernel.org>
References: <20211108174942.1189927-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_170500_498319_74379885 
X-CRM114-Status: GOOD (  11.21  )
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

From: Alagu Sankar <alagusankar@silex-india.com>

[ Upstream commit e263bdab9c0e8025fb7f41f153709a9cda51f6b6 ]

Beacon buffer for high latency devices does not use DMA. other similar
buffer allocation methods in the driver have already been modified for
high latency path. Fix the beacon buffer allocation left out in the
earlier high latency changes.

Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
[fabio: adapt it to use ar->bus_param.dev_type ]
Signed-off-by: Fabio Estevam <festevam@denx.de>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/20210818232627.2040121-1-festevam@denx.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 31 ++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 20e248fd43642..603f817ae3a59 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -985,8 +985,12 @@ static void ath10k_mac_vif_beacon_cleanup(struct ath10k_vif *arvif)
 	ath10k_mac_vif_beacon_free(arvif);
 
 	if (arvif->beacon_buf) {
-		dma_free_coherent(ar->dev, IEEE80211_MAX_FRAME_LEN,
-				  arvif->beacon_buf, arvif->beacon_paddr);
+		if (ar->bus_param.dev_type == ATH10K_DEV_TYPE_HL)
+			kfree(arvif->beacon_buf);
+		else
+			dma_free_coherent(ar->dev, IEEE80211_MAX_FRAME_LEN,
+					  arvif->beacon_buf,
+					  arvif->beacon_paddr);
 		arvif->beacon_buf = NULL;
 	}
 }
@@ -5251,10 +5255,17 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	if (vif->type == NL80211_IFTYPE_ADHOC ||
 	    vif->type == NL80211_IFTYPE_MESH_POINT ||
 	    vif->type == NL80211_IFTYPE_AP) {
-		arvif->beacon_buf = dma_alloc_coherent(ar->dev,
-						       IEEE80211_MAX_FRAME_LEN,
-						       &arvif->beacon_paddr,
-						       GFP_ATOMIC);
+		if (ar->bus_param.dev_type == ATH10K_DEV_TYPE_HL) {
+			arvif->beacon_buf = kmalloc(IEEE80211_MAX_FRAME_LEN,
+						    GFP_KERNEL);
+			arvif->beacon_paddr = (dma_addr_t)arvif->beacon_buf;
+		} else {
+			arvif->beacon_buf =
+				dma_alloc_coherent(ar->dev,
+						   IEEE80211_MAX_FRAME_LEN,
+						   &arvif->beacon_paddr,
+						   GFP_ATOMIC);
+		}
 		if (!arvif->beacon_buf) {
 			ret = -ENOMEM;
 			ath10k_warn(ar, "failed to allocate beacon buffer: %d\n",
@@ -5469,8 +5480,12 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 
 err:
 	if (arvif->beacon_buf) {
-		dma_free_coherent(ar->dev, IEEE80211_MAX_FRAME_LEN,
-				  arvif->beacon_buf, arvif->beacon_paddr);
+		if (ar->bus_param.dev_type == ATH10K_DEV_TYPE_HL)
+			kfree(arvif->beacon_buf);
+		else
+			dma_free_coherent(ar->dev, IEEE80211_MAX_FRAME_LEN,
+					  arvif->beacon_buf,
+					  arvif->beacon_paddr);
 		arvif->beacon_buf = NULL;
 	}
 
-- 
2.33.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
