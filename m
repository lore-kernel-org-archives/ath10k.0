Return-Path: <SRS0=izlz=HM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61971C433E0
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 00:42:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2199564E26
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 00:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2199564E26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7H4WrAEOqHXkeH+4Zu51c/T678QMIGJ0wsN08nM9djA=; b=Xbu13D31j5cuHl+9lZ2QxCr4S
	jkfC/7HqZQwPBjDSV/M0lQLJ/JZ7dzc87E5aRka4BrrQfWynsKeZE2sjHFXvxMBFX5h4qswfb7lI9
	7A2dOJ15sXaSTdxP/OjicDdE9puE0ROznOdsyGPvRAhlv5HPAy7DnEXV2BdnGsqQuWAMGWzU/9N+O
	mYfXIDleWpDlYYsp41aQONaopjU9NQeB3/eogajsr2a26WcNQ62KXFRayo3ZFd3C7tRgtPSz3pBEH
	d6ZCohlQD5fh7OS+Muv1o1VjMGXI7tOPLbK6ICKUpakfpBl1Zn1DdrsbeON2t3Un1pykzB3gU1q4K
	NWwQpkyYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9dad-0001FI-9z; Wed, 10 Feb 2021 00:42:43 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9daa-0001EJ-4b
 for ath10k@lists.infradead.org; Wed, 10 Feb 2021 00:42:40 +0000
Received: by mail-ot1-x32c.google.com with SMTP id e5so256493otb.11
 for <ath10k@lists.infradead.org>; Tue, 09 Feb 2021 16:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lSxRQe0NkuXvIC4LukBFAaQnS+eadT8rfkVxfIWM+A0=;
 b=CALrMMBCEUbB8CMtagKUhuHyyPH7YzI4dGisIXZAIC0QFUvYm0rwn/tZPFXXErx5QM
 GP8j/k1nlTROOjPRVG3EoZbP3sg8sWz61Bu9aFzBxZw7XvaFI1lVTf1FeaXnSZri5hY8
 qBhy39vwsrJqLSQLOVw+fq5m2l8KLvuKd+3Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lSxRQe0NkuXvIC4LukBFAaQnS+eadT8rfkVxfIWM+A0=;
 b=ce0GH4YnQo2mISB8GcOEezC1VqIqtZNkRpmSXh3N8CZ0y+caQQYiFxh02jJQ4w/bKg
 qGhGiT2Qlqc0a9mkCfIeJTa7cMXksYkykv6ANFzejXS8JuJlEYyt8JxIs6GqjDJYXX/r
 ldYijKR7rU6b4MuXAgVTfASQXB7s5IQ0xZztwAikhCmfHWeMg+NdjZB+o1yuUzTPRPc2
 UpOMMY7UTIFhwIyziJSC00+MrO88kxqX2IHmaba2Bi2GDVoySmY74TCu1bxwseqWZHVK
 3cujhzDb1MJxfLDDepIb5xnXjaFZ391szMH+UBddKGLiajUDMescyuT47izeCpP8m2vU
 8GHw==
X-Gm-Message-State: AOAM532pOAHB5CFiOg3BnJhxwuzGhGvytw4wTZW6tulQNm+kYcDk2S/d
 dG5HwuUWe45MejrDfVPys0O32Q==
X-Google-Smtp-Source: ABdhPJwhMYzaqq232uAzJkcr5mlDWVQmCT0WHImd9fGHVfEjYCTxeS0NBNDzY8hl72uY1rvdPGJLLA==
X-Received: by 2002:a9d:6003:: with SMTP id h3mr243308otj.23.1612917758613;
 Tue, 09 Feb 2021 16:42:38 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id s123sm103060oos.3.2021.02.09.16.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:42:38 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: kvalo@codeaurora.org,
	davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH 5/5] ath10k: reduce invalid ht params rate message noise
Date: Tue,  9 Feb 2021 17:42:26 -0700
Message-Id: <76a816d983e6c4d636311738396f97971b5523fb.1612915444.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1612915444.git.skhan@linuxfoundation.org>
References: <cover.1612915444.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_194240_238650_86839163 
X-CRM114-Status: GOOD (  10.67  )
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

ath10k_mac_get_rate_flags_ht() floods dmesg with the following messages,
when it fails to find a match for mcs=7 and rate=1440.

supported_ht_mcs_rate_nss2:
{7,  {1300, 2700, 1444, 3000} }

ath10k_pci 0000:02:00.0: invalid ht params rate 1440 100kbps nss 2 mcs 7

dev_warn_ratelimited() isn't helping the noise. Use dev_warn_once()
instead.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3545ce7dce0a..276321f0cfdd 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8970,8 +8970,9 @@ static void ath10k_mac_get_rate_flags_ht(struct ath10k *ar, u32 rate, u8 nss, u8
 		*bw |= RATE_INFO_BW_40;
 		*flags |= RATE_INFO_FLAGS_SHORT_GI;
 	} else {
-		ath10k_warn(ar, "invalid ht params rate %d 100kbps nss %d mcs %d",
-			    rate, nss, mcs);
+		dev_warn_once(ar->dev,
+			      "invalid ht params rate %d 100kbps nss %d mcs %d",
+			      rate, nss, mcs);
 	}
 }
 
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
