Return-Path: <SRS0=1k1S=FZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383D0C433DB
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 18:24:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1D86207CF
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 18:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1D86207CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+EVRIswYSLz+gP3hCecy+0KUQJjcZGBAxsVypzB+t4I=; b=12mzwkWF/0/QY/Ni64I7KKCeSN
	Z9pzhMlL5tfxqtBjp2Z4nZ0qC2SXdRJEtfwBI2tO3hDRax9gZf5Hxr0pmuHWLiRgZKvmI2OLXhtZh
	eSKcW6X8evlbJ6rHQVcliu4N5Q8f9laptL0Zk2CIph4n+fzN2WpA2wrKxUnyhaj+6A0kGZLI+ru7c
	FaXnB8/JTj95Liv4GAfNI3bCVw9mAplsYqDOxarGXGV11pnkgPuIRyVW+HzGrOKE/yxGbfSfkShi9
	YndZr0Q5XlJJIl2DGmp7fuKsJnUKDBWMtii099i4XrDGd0Pej+AxmCrYlnM+4Wd3YQ3y6OGn+JYN0
	9yeJMJBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krPqC-00049y-4X; Mon, 21 Dec 2020 18:23:28 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krPq7-00049U-0g
 for ath10k@lists.infradead.org; Mon, 21 Dec 2020 18:23:25 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608575003; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=S2DakKA1vosTrjIsbsXVh8dT8o3okJMOJDQvOtHEYhk=;
 b=w0R8qLbi7JHOuZ9QC4QbDK4Mdiy0oXXoq+HrxyAG47PG6OVev1gNC14PBXisnxEmLLpZ1KUS
 fFLR0/t9PGDJV1xNovqd1SEB071nupMCXhZWPuZq0i0DLL24cVDztw2aS1gTxHxeqX/yxq84
 l1zJa9PtfWp2Vafcm/QZ41MCCBw=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fe0e817b00c0d7ad4b0e7f9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Dec 2020 18:23:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 21F46C433ED; Mon, 21 Dec 2020 18:23:18 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E94B7C433CA;
 Mon, 21 Dec 2020 18:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E94B7C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: ath10k@lists.infradead.org
Subject: [PATCH] ath10k: remove unused struct ath10k::dev_type
Date: Mon, 21 Dec 2020 20:23:14 +0200
Message-Id: <1608574994-30706-1-git-send-email-kvalo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_132323_967852_5B8DF153 
X-CRM114-Status: GOOD (  11.57  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

It's unused so let's get rid of it. Compile tested only, no functional changes.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index f4be6bfb2539..cd206b16d68f 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1019,7 +1019,6 @@ struct ath10k {
 	enum ath10k_hw_rev hw_rev;
 	u16 dev_id;
 	u32 chip_id;
-	enum ath10k_dev_type dev_type;
 	u32 target_version;
 	u8 fw_version_major;
 	u32 fw_version_minor;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
