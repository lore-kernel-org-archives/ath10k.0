Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D489C433F5
	for <ath10k@archiver.kernel.org>; Thu,  9 Dec 2021 09:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wzSW93ed4sm+uUyfotO7gRn+v0eucYpL8ozBBLlcBg=; b=cqHo24xQnIzAuV
	tapkcuwsR3ToriilmWGOaH7LpEIN9Rhais9MvngIbtUf+T83uHq8wzq7fPhFz8QT1qL3HQpygwUCU
	WTBebfbKWigEt4RSK1BOVXPjchLDc41qUaRkNpUgAji8rtOS2y2c3Q8C6tkr3txe5XR5dL5p2dlo6
	1dzovhdpKHDp22p60tloHaO07AkrimlM1oZnC7EBJLEOll8lyuRVJqTsNdM4RqjePkXZCpGmxRSvc
	eycZF5D72mnP5DiL2bmsIZ3h8ZEI0jadoDnl6n/45pr0W2mmC9OdBd0HnG87jtQyzIYrjtCQWbOP7
	pdKijIlJRoae/SqxKTcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvFbQ-00FOR1-Gy; Thu, 09 Dec 2021 09:20:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvFWt-00FN38-LL
 for ath10k@lists.infradead.org; Thu, 09 Dec 2021 09:15:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 56428B8235A
 for <ath10k@lists.infradead.org>; Thu,  9 Dec 2021 09:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFC8C341C8;
 Thu,  9 Dec 2021 09:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639041353;
 bh=xwYdGutxAfsG1PdhuXlI/5zQ4TyEWKUigSAODOE4Hg4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k6qQvVvN1Y38C1lSb866t5LRXYjr4DVfie3epTJGfxnHAJhnvROBj09hBggqJwepa
 Hbr2IEST5OFgRPC9pBvKe6dIfvXjKQsBlxs2XA0TJvT5o7oyTg7kFxqmGv/r9LZH7U
 2mfal2EfUS/gRh9ycjH5LSC3FmgphaL0bUQyn6urnBAm8Ylc849bozOHf9Ylco2ZYi
 dKeP64B3IN7WhfG716J6pgUCfmwSB1d6l0my0Py2TT91woxYkN7newCrwgO4dx3+B4
 /u83p3WktZxcH3wrko9FiHkpKFvlF8uPE+eIaYQePZLuEod3dT5qtfC5qKSL+N4bBB
 BsuvhNG0bJTrA==
From: Kalle Valo <kvalo@kernel.org>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 2/2] ath10k: wmi: remove array of flexible structures
Date: Thu,  9 Dec 2021 11:15:45 +0200
Message-Id: <20211209091545.6098-2-kvalo@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211209091545.6098-1-kvalo@kernel.org>
References: <20211209091545.6098-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_011555_875370_AEEA345A 
X-CRM114-Status: GOOD (  11.65  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

I updated to sparse v0.6.4 and it warns:

drivers/net/wireless/ath/ath10k/wmi.c: note: in included file (through drivers/net/wireless/ath/ath10k/core.h):
drivers/net/wireless/ath/ath10k/wmi.h:3481:34: warning: array of flexible structures

Fix it by changing the type to u8 array, in struct wmi_phyerr_hdr_arg it's
stored as a void pointer anyway.

Compile tested only.

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 01bfd09a9d88..4abd12e78028 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -3478,7 +3478,9 @@ struct wmi_phyerr_event {
 	__le32 num_phyerrs;
 	__le32 tsf_l32;
 	__le32 tsf_u32;
-	struct wmi_phyerr phyerrs[];
+
+	/* array of struct wmi_phyerr */
+	u8 phyerrs[];
 } __packed;
 
 struct wmi_10_4_phyerr_event {
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
