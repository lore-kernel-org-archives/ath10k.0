Return-Path: <SRS0=aCQL=MO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F71C4338F
	for <ath10k@archiver.kernel.org>; Thu, 22 Jul 2021 19:31:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C80560EB1
	for <ath10k@archiver.kernel.org>; Thu, 22 Jul 2021 19:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C80560EB1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ojab.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+O/VCMJAh+fobukx5FQB7m/aaxYqVVoQfDfkTBNpVgw=; b=FdtQrLrzPaMsMq
	dia/EpKBVr9I0ZY8sgcDwvOsdoUBtOu6G8sqBV7F1vtP817N4KI2ynk6LqR8X/7vK4yPCJvqEZpct
	nXsjCQfm1ULTO/tlW0/XFpYgMkxPhEu27WFQzF8TPWtsG+1iNLfGTFj6u77mPSAzbUiV8VV3Tk5zj
	DjNzxubcCZ86LAJzzbPPKBdQwuRPXIn0HoYsc/aqGO+swH5Xrd4ody2B0i3dq1TDrSphKUxI32e3j
	1EJdsadKeOHnGs7aHgnSwEovHN2pUij7L+4MRpMu4mqJ5G+t+cGBxC65wExaDB3bfEJiUICSWECGH
	8/iiiWl0k77/R/2QBvbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6eP4-002ZNq-HF; Thu, 22 Jul 2021 19:30:42 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6eP1-002ZNM-5a
 for ath10k@lists.infradead.org; Thu, 22 Jul 2021 19:30:41 +0000
Received: by mail-lf1-x12a.google.com with SMTP id v6so10197497lfp.6
 for <ath10k@lists.infradead.org>; Thu, 22 Jul 2021 12:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ojab.ru; s=ojab;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ki3EP487cHlKuJ8BiqZxtwSYC7B4SnWzmdp/UL5pFnk=;
 b=mfpcCjAgt8VnvUgRMgumJXzjEXRNrkL3py5aTk+1LV/vsKMx0cqZvEixFsf0yc8KFe
 ETx+LR45QTT4sYGWN7VSFazuAe3C1x3wB9pazgl6tZDiTr9Kdd76pt1bCqhWcTXE0Ugm
 8CuS7rIlHJwhGjVad+BVJUQix1FuYzrJNbLzNfziUWy2b+7vBy3N5zg4gQ3VgEh612f1
 mS+mNWCOEHOPnOU0jSVAvvlIjgXnqgGkwPkyb0gOgllWevhGevwpIl3c3Po+CGYZjQlZ
 ipsBTzQrffsE67Sjbu9TjTyXCVUJ9zf1MX45+DmqLcseV7Ibbd/yhUCG/WQrP5CtjEUI
 JDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ki3EP487cHlKuJ8BiqZxtwSYC7B4SnWzmdp/UL5pFnk=;
 b=cnsGhorOfErOuQipgvPN+J2K5ImFZo6ZETHXZ32CZ1wZ3rAyI63IWqrObw0k5jlB0s
 jjAMxrecyYInB17J4kHtmgbu0Swn7s1kGMTZ3sdcjpfSYM16BUQsWdg7OkFYIU4TmDTy
 MtlCq6yOEVAYDNzu60Ic1hH+uuedeDqONsWkFHiQxtzolcw6xPbCfT9yE7ParBVSg+ai
 qVOCgfIrYZ4FZiChGPvwcvm3lNlo8OIdNAjxtQbP2Xthx6pV4H6avK1kNAxUgLmrKsVD
 3EY7auhmFkcd0LFNQ3vbQdtPpcGDreCTGs3KkMkptIj3pfmyrZOnhvwuDwIubSfFd1Lh
 cgmA==
X-Gm-Message-State: AOAM531lGzO5VCo8ce9+p4jG0ONdbF8bJZe8OnDfZCeryBaKrCGOCi4j
 hvEKWAFpE8F9Mk6I9BHUOJaNkA==
X-Google-Smtp-Source: ABdhPJwEsuMO5wqqYtkztd0Y+meQb5roqH3WyT+0VBq7dzbd2tAOaqH0lRXxnfnnpX20pzcB6cON4w==
X-Received: by 2002:a05:6512:3393:: with SMTP id
 h19mr649086lfg.58.1626982236011; 
 Thu, 22 Jul 2021 12:30:36 -0700 (PDT)
Received: from ojab.ru ([2a03:e2c0:1ce::2])
 by smtp.gmail.com with ESMTPSA id e5sm3198061ljk.51.2021.07.22.12.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 12:30:35 -0700 (PDT)
From: ojab <ojab@ojab.ru>
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Cc: ojab <ojab@ojab.ru>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ath10k: don't fail if IRAM write fails
Date: Thu, 22 Jul 2021 19:29:37 +0000
Message-Id: <20210722192937.4847-1-ojab@ojab.ru>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_123039_646801_9B889660 
X-CRM114-Status: GOOD (  12.54  )
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

After reboot with kernel & firmware updates I found `failed to copy
target iram contents:` in dmesg and missing wlan interfaces for both
of my QCA9984 compex cards. Rolling back kernel/firmware didn't fixed
it, so while I have no idea what's actually happening, I don't see why
we should fail in this case, looks like some optional firmware ability
that could be skipped.

Also with additional logging there is
```
[    6.839858] ath10k_pci 0000:04:00.0: No hardware memory
[    6.841205] ath10k_pci 0000:04:00.0: failed to copy target iram contents: -12
[    6.873578] ath10k_pci 0000:07:00.0: No hardware memory
[    6.875052] ath10k_pci 0000:07:00.0: failed to copy target iram contents: -12
```
so exact branch could be seen.
---
 drivers/net/wireless/ath/ath10k/core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 2f9be182fbfb..d9fd5294e142 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2691,8 +2691,10 @@ static int ath10k_core_copy_target_iram(struct ath10k *ar)
 	u32 len, remaining_len;
 
 	hw_mem = ath10k_coredump_get_mem_layout(ar);
-	if (!hw_mem)
+	if (!hw_mem) {
+		ath10k_warn(ar, "No hardware memory");
 		return -ENOMEM;
+	}
 
 	for (i = 0; i < hw_mem->region_table.size; i++) {
 		tmp = &hw_mem->region_table.regions[i];
@@ -2702,8 +2704,10 @@ static int ath10k_core_copy_target_iram(struct ath10k *ar)
 		}
 	}
 
-	if (!mem_region)
+	if (!mem_region) {
+		ath10k_warn(ar, "No memory region");
 		return -ENOMEM;
+	}
 
 	for (i = 0; i < ar->wmi.num_mem_chunks; i++) {
 		if (ar->wmi.mem_chunks[i].req_id ==
@@ -2917,7 +2921,6 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 		if (status) {
 			ath10k_warn(ar, "failed to copy target iram contents: %d",
 				    status);
-			goto err_hif_stop;
 		}
 	}
 
-- 
2.32.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
