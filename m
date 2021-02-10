Return-Path: <SRS0=izlz=HM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738D5C433DB
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 00:43:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EB4164E4F
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 00:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EB4164E4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+f27dOXDwHMmcNezxZ8xdfVtI3Uw8awsIKVG3DpZEqw=; b=QOMOa05EuMuyVZwVajqRO34Xg
	7NtH1Q3LZyfSTGeEtSWgBhu3rEpjUirqHwcJyyA1CjrM3hfpxxcmhbH5erhbZnbnNw5y7ZsMPN5fX
	iJN7IzpBJ4V+1PZ4uIPVitk3FwC46Pby6iP7VkEvXw/f9grVaWMDyscbMO3wSc70tbUrqzQE+39og
	V1cDSpV4mBXC5p3z5us0Gq3MU6za4jDd0mbCgZv8iabdDhVMgPtte4Rs4bwdsprh7G4E4srKrK2T4
	BLnKEqJIy9AmXjWyOKL52cdbDfnE/70OPmRWh5I8tu5C2UBtZodGRyq9RyaSYflNMMIZwUXNLHsQe
	Q0TVK9KKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9dac-0001F8-K7; Wed, 10 Feb 2021 00:42:42 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9daZ-0001E4-15
 for ath10k@lists.infradead.org; Wed, 10 Feb 2021 00:42:40 +0000
Received: by mail-oi1-x230.google.com with SMTP id g84so223037oib.0
 for <ath10k@lists.infradead.org>; Tue, 09 Feb 2021 16:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MVSZTT1h7rg/Bji9PEZgBTdOFc1Uv4h/Ji7bDyaOHUI=;
 b=b2vrzFxHfxSWjiku00Fz3a6ecUxKY3t2TA0ZzSD7MG6YCM8ajrR7O2gxN7GLKC0rrC
 FVbuFVlPE0yeTOQlclSOdWDAZdh2akjPV49OJuSExxHxugqDN4N8XLofPBw9tHtZ205Y
 S3uPZv6Ya+G7CILfj3nxGLLgYE/xenGdXkgrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MVSZTT1h7rg/Bji9PEZgBTdOFc1Uv4h/Ji7bDyaOHUI=;
 b=DQ5rQ0T1F8SX2nJxN/TYGZHFGjzYQ8Qq2XAkpgePkrXy2yUI+f4CgTNBNn3E2/a+jc
 SOsjccgejUxWZ4e8r7Cu9epNMzJ/TPeGLkX0IAWHk0ykXiIsVZnysi7DrIWOcSLg7TOL
 Q7y3WGP/Ya3F86UbhRjJ0WIlyTYGdhM0u7AavKXjcDxySX2FcBUTukG/XiKc+18XgEB1
 TlsGxJOv1Ysy9Dcb9J0pxti0zWQjUclyQ6QZU0kxPg8N2pYlCIFhpA5Tm+dQ8slGVezR
 dgvd7juKbpsugQEMQZ+0N4E3KnJB0WxOfRbikcCERBNeHFJiAsU+GfBfVR5WhkLzs1Gu
 ZjUw==
X-Gm-Message-State: AOAM532Du6CzRz3VYv0Puz3OUmUTs+riV5NXDz3CT9bjyo92j7Lf8EsM
 Ymk1Us8utVEKdVNEfPes2I56sw==
X-Google-Smtp-Source: ABdhPJzy8O/u6gQ1mql56Asz4MrIdqm2ujZLVWA9B95vdv7w6LIFLxn2QJpAEovPx21tylnZEk7yJA==
X-Received: by 2002:aca:8d0:: with SMTP id 199mr294690oii.94.1612917756994;
 Tue, 09 Feb 2021 16:42:36 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id s123sm103060oos.3.2021.02.09.16.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:42:36 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: kvalo@codeaurora.org,
	davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH 4/5] ath10k: detect conf_mutex held ath10k_drain_tx() calls
Date: Tue,  9 Feb 2021 17:42:25 -0700
Message-Id: <a980abfb143f5240375f3f1046f0f26971c695e6.1612915444.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1612915444.git.skhan@linuxfoundation.org>
References: <cover.1612915444.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_194239_717746_4D6C939E 
X-CRM114-Status: GOOD (  10.62  )
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

ath10k_drain_tx() must not be called with conf_mutex held as workers can
use that also. Add check to detect conf_mutex held calls.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 53f92945006f..3545ce7dce0a 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4566,6 +4566,7 @@ static void ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 /* Must not be called with conf_mutex held as workers can use that also. */
 void ath10k_drain_tx(struct ath10k *ar)
 {
+	WARN_ON(lockdep_is_held(&ar->conf_mutex));
 	/* make sure rcu-protected mac80211 tx path itself is drained */
 	synchronize_net();
 
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
