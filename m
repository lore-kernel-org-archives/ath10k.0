Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BD9C4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 23:27:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14641610CF
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 23:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14641610CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZYZY+pTC+RvhEqhQRysM2yQkqGwbFOyw+/GuKckTGGI=; b=Sa9sSd+3jR/KjQ
	G0uYw0jxq4O4coVMBOxw6tdPaV0DkJZfRuUj0sgjh+zgP8Q5OJOoI7uYRxMAsAntq8YjSIvB/SbQw
	AWtqnb2a99tA1XsWnYyEF0nmrmiGyHrq/wYx5a2TJTMeE3/fcIw0c11qqw4sJeQbPT8ZTfUBD16sL
	8dr8zqiEf/NF6yBTHQUXvx1QYHp70VF9FueJgByYWbBTY9SW+2AlB+AopRiu5ywdUA5PDg9rGBUzS
	3D6c5Kd+l7/sCBEUq2EJGkoaFLjpd2EQPqUM7dQ6bAFwTS5AEFDlReQxQsksU941ncEvsiyik/sWk
	n4gYFgow+s8CiLoSpL5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGUxi-006omJ-Rk; Wed, 18 Aug 2021 23:27:10 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGUxZ-006oll-92
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 23:27:05 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2804:14c:485:504a:609d:5443:34fc:77bc])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: festevam@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0CFCF80F30;
 Thu, 19 Aug 2021 01:26:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1629329218;
 bh=s6e4Ese2VIMrxJ7iyVt3pQ+bRy1WssQdFGiizMnyVWk=;
 h=From:To:Cc:Subject:Date:From;
 b=mwvQKN49+SlILw9eldAn08MYYfTq53nQl3gjlkAAMYN9FUKZjnC9argrZkh8PWVTx
 YNPO5HXYi/UW1CbDRRe8SgiRRxjacfypwvR4RthdJ97IBIP3KQNF/906udRu46nD2q
 //fzsgtjaC1LGvBWilFGCDfASX7rDVYXb2ix0uV/VcidOWnIYlxhKt/rlaKjmOljNU
 N/FXU0qPT5hS56SzL63iVdwffzd2seq155kdm+cTK1OKgW67lpPh950+iHtZwJ8Nij
 s9cJkxNfwqblyEPEuPTRDxgiOAYJvNR2q8YjMcn3inUj7J+E0w1+nRy0FLXpRtHI38
 LkcRHYLoLqFbQ==
From: Fabio Estevam <festevam@denx.de>
To: kvalo@codeaurora.org
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, hch@lst.de,
 erik.stromdahl@gmail.com, peter.oh@eero.com, aspriel@gmail.com,
 marex@denx.de, alagusankar@silex-india.com,
 Fabio Estevam <festevam@denx.de>
Subject: [PATCH v3] ath10k: high latency fixes for beacon buffer
Date: Wed, 18 Aug 2021 20:26:27 -0300
Message-Id: <20210818232627.2040121-1-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_162701_709605_39A5784A 
X-CRM114-Status: GOOD (  10.61  )
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

Beacon buffer for high latency devices does not use DMA. other similar
buffer allocation methods in the driver have already been modified for
high latency path. Fix the beacon buffer allocation left out in the
earlier high latency changes.

Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
[fabio: adapt it to use ar->bus_param.dev_type ]
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Pick Alagu's patch:
https://patchwork.kernel.org/project/ath10k/patch/20190417191503.18814-3-erik.stromdahl@gmail.com/

 drivers/net/wireless/ath/ath10k/mac.c | 31 ++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index c272b290fa73..7ca68c81d9b6 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -993,8 +993,12 @@ static void ath10k_mac_vif_beacon_cleanup(struct ath10k_vif *arvif)
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
@@ -5576,10 +5580,17 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
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
@@ -5794,8 +5805,12 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 
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
2.25.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
