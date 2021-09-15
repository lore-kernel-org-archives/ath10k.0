Return-Path: <SRS0=MUiD=OF=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0ECAC433EF
	for <ath10k@archiver.kernel.org>; Wed, 15 Sep 2021 18:56:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EC6B60F5B
	for <ath10k@archiver.kernel.org>; Wed, 15 Sep 2021 18:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EC6B60F5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jle+87mWZpnpkbO9m5yhWEQAosxXGFm0/Sfg80Wwk84=; b=ZhjZO1byvWo6A7
	p2geVqwjnph9t0Yx9aI8sG9OdouarwcF675OIxAlRvTt0ALL6POGwFlirBkIexBcbEEBHfm+zWPgZ
	R8yJfD7sP7xDzyMR5PyBN/mSsn5MEecFHNXMG3IYF4LF4Rwhb+8X2mvd4H8Z70ktyFopXnj8uQSMy
	vWqxre1FJoE+AR3CClTXvzOvAOQlPC6qdTtAFqSt2iPODZc04HqRrYMZXoDFP4eZRPg3Ku1OoHjvq
	UQSd1RnxyjzjsNdS65ZsI1korKtKl61fGOISLAmvfqGsWR9YQo77AKtrAxgHtrSKlT32TGu0H9l8f
	XGO8GS5UQ04oV1Gd+EjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQa5F-009ja3-9L; Wed, 15 Sep 2021 18:56:37 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQa5C-009jZL-PE
 for ath10k@lists.infradead.org; Wed, 15 Sep 2021 18:56:36 +0000
Received: by mail-qk1-x736.google.com with SMTP id b64so4694176qkg.0
 for <ath10k@lists.infradead.org>; Wed, 15 Sep 2021 11:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=sXTQmBodNg5WTV0AyZ/PqLAipBdMijQBBzKn4s9bJ50=;
 b=jdH1EYERwJPdpLP4+yEjG2KwqvtS3y+L7z7R5m03cRjcXouy03PP5d8mjOuD2ePOGL
 2T1NbFLQbXr56VYvS8+KuShHlrcMmnkDtg8tG3/sFzVZ13dl4gwnEaMhBOj4e4ikV4So
 MDFX93tNhI0ImDlgLobrArKXA9WkN2KiB3g8fY0SSUzr/iTbFR+njKDObkwKQSESreHM
 w5PNUz9gQMDERiEGoOFsJbKFQL5KCZe9CFUNwsdsn178DGe4fqAposc7P3pxm1PAvmD8
 eiTlEgwdyZpcWwdupva3wow1HhiUTFXwtTFw+QM/XHamsNXxS3oF6vFGjLa6NeiC4UOu
 Diuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sXTQmBodNg5WTV0AyZ/PqLAipBdMijQBBzKn4s9bJ50=;
 b=vwxc3vqIXAw0CJXFaX0bPIHsTjT6dKNkBA+WLyJ1hIY94kIXMxx+IfI3v8kS9PJ7mb
 Noj8e0oX4lF9eWb1Ho5M7je3lzSeSze8jeK5RxLMEyGXPPe1hr/YIBoHbxaZskVF6CRx
 ZJg4Q7arqAG3shC76eiIEoD+3V88TlOT9yKasfxpsq0/N0lg/8+YOrwYsZC9RuaMvXVd
 J9n9atnGA6DPnJuwcCpFq2K6Sa1BUL+0ap3xTbUCfQSWyfIWzkASdZyEwZ7Dk+7kHOf4
 E+d3WEOrFwKzMy0HsfeQCNJOwlp77yHjBLwEjiQ1QLRxoHJOC2xQchWulIY+omFYaZm7
 mBHw==
X-Gm-Message-State: AOAM532SNpmGtIyb+hs5I/cnbYdycdU0KTynAUiaX8wQw24XXhEVPAEv
 YLEetoFzRiVoWu2Sikx4Ss7Hei9Q7W8=
X-Google-Smtp-Source: ABdhPJzq3oPBis7GB2dp6r4F+wutCEQ4x+GyEgOJ6oNnTqczdoaFmt9yVvc0SdInJHu3/cFX+YuvrA==
X-Received: by 2002:a05:620a:1455:: with SMTP id
 i21mr1467688qkl.116.1631732191660; 
 Wed, 15 Sep 2021 11:56:31 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:38c5:675f:1e0:5e11:1b48:4db0])
 by smtp.gmail.com with ESMTPSA id q22sm555783qtn.25.2021.09.15.11.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 11:56:31 -0700 (PDT)
From: Peter Oh <ebmajor.dev@gmail.com>
To: ath10k@lists.infradead.org,
	kvalo@qca.qualcomm.com
Cc: Peter Oh <ebmajor.dev@gmail.com>, linux-wireless@vger.kernel.org,
 andreas.tepe@debitel.net
Subject: [PATCH] ath: regdom: extend South Korea regulatory domain support
Date: Wed, 15 Sep 2021 11:56:11 -0700
Message-Id: <20210915185611.6195-1-ebmajor.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_115634_884331_6D4D9FDA 
X-CRM114-Status: UNSURE (   9.77  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

South Korea manufacturer, Samsung, has extended South Korea
regulatory domain pair with 0x5F and has used it for their
devices such as Samsung Galaxy book. Hence add support
0x5F as a regulatory domain pair along with extended country
code, 413.

Signed-off-by: Peter Oh <ebmajor.dev@gmail.com>
Signed-off-by: Andreas Tepe <andreas.tepe@debitel.net>
---
 drivers/net/wireless/ath/regd.h        | 1 +
 drivers/net/wireless/ath/regd_common.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/regd.h b/drivers/net/wireless/ath/regd.h
index 8d5a16b558e6..774419c7f442 100644
--- a/drivers/net/wireless/ath/regd.h
+++ b/drivers/net/wireless/ath/regd.h
@@ -126,6 +126,7 @@ enum CountryCode {
 	CTRY_KOREA_ROC = 410,
 	CTRY_KOREA_ROC2 = 411,
 	CTRY_KOREA_ROC3 = 412,
+	CTRY_KOREA_ROC4 = 413,
 	CTRY_KUWAIT = 414,
 	CTRY_LATVIA = 428,
 	CTRY_LEBANON = 422,
diff --git a/drivers/net/wireless/ath/regd_common.h b/drivers/net/wireless/ath/regd_common.h
index c4bd26e65949..cdb1e9a23734 100644
--- a/drivers/net/wireless/ath/regd_common.h
+++ b/drivers/net/wireless/ath/regd_common.h
@@ -76,6 +76,7 @@ enum EnumRd {
 	APL7_FCCA = 0x5C,
 	APL8_WORLD = 0x5D,
 	APL9_WORLD = 0x5E,
+	APL10_WORLD = 0x5F,
 
 	WOR0_WORLD = 0x60,
 	WOR1_WORLD = 0x61,
@@ -204,6 +205,7 @@ static struct reg_dmn_pair_mapping regDomainPairs[] = {
 	{APL6_WORLD, CTL_ETSI, CTL_ETSI},
 	{APL8_WORLD, CTL_ETSI, CTL_ETSI},
 	{APL9_WORLD, CTL_ETSI, CTL_ETSI},
+	{APL10_WORLD, CTL_ETSI, CTL_ETSI},
 
 	{APL3_FCCA, CTL_FCC, CTL_FCC},
 	{APL7_FCCA, CTL_FCC, CTL_FCC},
@@ -426,6 +428,7 @@ static struct country_code_to_enum_rd allCountries[] = {
 	{CTRY_KOREA_ROC, APL9_WORLD, "KR"},
 	{CTRY_KOREA_ROC2, APL2_WORLD, "K2"},
 	{CTRY_KOREA_ROC3, APL9_WORLD, "K3"},
+	{CTRY_KOREA_ROC4, APL10_WORLD, "K4"},
 	{CTRY_KUWAIT, ETSI3_WORLD, "KW"},
 	{CTRY_LATVIA, ETSI1_WORLD, "LV"},
 	{CTRY_LEBANON, NULL1_WORLD, "LB"},
-- 
2.22.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
