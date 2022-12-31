Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53B2C4332F
	for <ath10k@archiver.kernel.org>; Sat, 31 Dec 2022 18:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v7+5LfS9EJizXyksQizF8zdf4vwXSsl5xWOhZ8Bmbrw=; b=ktDPMh7HP5kakz
	pGnx9A32GnkqZMJOvKdtXQui67dohZ8M7lN9cBqPXiYqNP2tf2276WShDqwVDmCdnK2OQ7BqN6djU
	MGUEzAfE77vUN6VJKkn6AfD12MWw8iw7P4cjiQ/d4wn+sQj0VLQ/zf5lM8Ta/iNkNoEnv9Uw32Vz+
	a8Oc4uwNjDVgP7lLkWv2Dcjp2cKaSOAiIoaDpnLGQa96EEYIWmZz/g4MiFUrP1E8Zcupf58LU+P2o
	gIanjQxsmKNWMv2HSOZQkYWychDL6e2O/r309zAbswUrCVHQP9D7XP/UFqURdty8SGpBvu8g+7cNq
	5YRXT+WSMgqZAZ2z1LyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBgvE-0091Q7-II; Sat, 31 Dec 2022 18:49:32 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBguj-00915X-Sw
	for ath10k@lists.infradead.org; Sat, 31 Dec 2022 18:49:04 +0000
Received: by mail-qt1-x832.google.com with SMTP id z12so19461654qtv.5
        for <ath10k@lists.infradead.org>; Sat, 31 Dec 2022 10:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vtremblay.dev; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8I7DamyMfOTlRgYzePUvGyq8r9a6UUaVf2NjpcU8dEo=;
        b=dyhm9ivpNXU8mH45UJKrhvwBUU7vAUJWKAU7Kv7HmRZCf/W3C99kRGSUcMnUT6UktH
         hQzD1wxAJDokZhXSrRcWuAgdZZvLhzm0gV1/Jy8KHUwSJbqokzJQQmiiec2LFPOiFb8b
         yCj9tEeL6h+BmjBBzGe3/Rzv6UCeNc7bBoFZu/Gp0lLxPIPuWUI7+37MSt9Bw/GygOS7
         LrO/mdR4FmTeGEP3oBj2FbrUkpqNvofJQFab9lbybEpKQRjrY0FZ4JYKDPjHKMR3eev/
         YwCtbBRBAKJbdbUpGFwCqQJJsPjMvQYhT7QNT/xAx1To7yAimpdLUsRBLNJS41c1Exjf
         lxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8I7DamyMfOTlRgYzePUvGyq8r9a6UUaVf2NjpcU8dEo=;
        b=UWqDuV6vAO0RpfWNLczv5RID+z1FmRlJhKFJwnTlPWPcmKFOrEnwKBEwlbTqROj186
         tZT98vUURBE6e9FvsVfKhWhO7fLldXgW58JJiLIdOiW/SBzUhu8RB/4c/PIAyK0TFQy9
         qFcYLzRvHpgCb93qHX2VfpFfh1Q2u0igWsUHyYriUmVMY3V+KFNPAVolY8ZfQXCRKEBj
         MgSz8RGlaMSVC7nuwFQq4L1R1/9vjVOKrEOUzGKHgG4s9DSkg8L47QqlkLvUUpJHDt2I
         m/g0F6Y3FIyRLMOcFvlJ9sKeBMGqCjaNEcadOOt/hz0T8BX3wrMx5pspAMZ+KIcUlPTx
         ncxw==
X-Gm-Message-State: AFqh2ko6gBSMlbhhUSOa0wl/I7yXKpxYp0errNIttWu6DK7hrn4//bWK
	ACc/MSS7OboUwyN/pUAm5+EN5tq7UjOB8R/XtTU=
X-Google-Smtp-Source: AMrXdXvnV0o5X6jg96H5huihDnCZWzyJr6RzcACxmdpa0ZpDbWCvRz/Hx88U9LkGN1xXGQnDXAaWng==
X-Received: by 2002:ac8:6999:0:b0:3a7:ee15:d94c with SMTP id o25-20020ac86999000000b003a7ee15d94cmr48820440qtq.47.1672512539724;
        Sat, 31 Dec 2022 10:48:59 -0800 (PST)
Received: from vtremblay.. (modemcable190.194-177-173.mc.videotron.ca. [173.177.194.190])
        by smtp.gmail.com with ESMTPSA id t3-20020ac85303000000b0039cba52974fsm14951951qtn.94.2022.12.31.10.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 10:48:59 -0800 (PST)
From: Vincent Tremblay <vincent@vtremblay.dev>
To: 
Cc: ath10k@lists.infradead.org,
	vincent@vtremblay.dev
Subject: [PATCH] ath10k: read qcom,coexist-support as a u32
Date: Sat, 31 Dec 2022 13:48:56 -0500
Message-Id: <20221231184856.329282-1-vincent@vtremblay.dev>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_104902_194428_8AAF3019 
X-CRM114-Status: GOOD (  16.29  )
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

Read qcom,coexist-support as a u32 instead of a u8

When we set the property to <1> in the DT (as specified in the doc),
"of_property_read_u8" read 0 instead of 1. This is because of the data format. 

By default <1> is written with 32 bits. 
The problem is that the driver is trying to read a u8.

The difference can be visualized using hexdump in a running device:
Default 32 bits output:
=======================
0000000 0000 0100
0000004

8 bits output:
==============
0000000 0001
0000001

By changing "of_property_read_u8" by "of_property_read_u32", the driver
is aligned with the documentation and is able to read the value without
modifying the DT.

The other solution would be to force the value in the DT to be saved as
an 8 bits value (qcom,coexist-support = /bits/ 8 <1>), 
which is against the doc and less intuitive.

Validation:
===========
The patch was tested on a real device and we can see in the debug logs
that the feature is properly initialized:

[  109.102097] ath10k_ahb a000000.wifi: boot coex_support 1 coex_gpio_pin 52

Signed-off-by: Vincent Tremblay <vincent@vtremblay.dev>
---
 drivers/net/wireless/ath/ath10k/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 5eb131ab916f..802d6a12dc1e 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2355,14 +2355,14 @@ static int ath10k_download_cal_data(struct ath10k *ar)
 static void ath10k_core_fetch_btcoex_dt(struct ath10k *ar)
 {
 	struct device_node *node;
-	u8 coex_support = 0;
+	u32 coex_support = 0;
 	int ret;
 
 	node = ar->dev->of_node;
 	if (!node)
 		goto out;
 
-	ret = of_property_read_u8(node, "qcom,coexist-support", &coex_support);
+	ret = of_property_read_u32(node, "qcom,coexist-support", &coex_support);
 	if (ret) {
 		ar->coex_support = true;
 		goto out;
-- 
2.37.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
