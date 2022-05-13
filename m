Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE8EC433F5
	for <ath10k@archiver.kernel.org>; Fri, 13 May 2022 15:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XEcMAm3qM35TJEG//b5OPvoCb64GlCdz3zh2DPmSh/Q=; b=pgaoBR69C5wCLk
	hCfd28MP2GnPOrdKuEOhkbxwOJGOlnrSxJCeExyGtwl54uG6la0d4bSoZh+MgSqQWtZ88lkHLJUqf
	I0mEjHlnUL13hbRFyrSUXztPeqt8qJIaDMP4KdZ0+uHgpQ1O+JXIsKw2b3KoAkiIilZaQnVDBaDy+
	JHXeGaeRF9fyBWOUgS12rXG6/eM8Z4/Vadw7nqaIGUwKywZfBQc9NAq1xw5W7MZu58FkKhxtSczOl
	PSqQncHeusJ7GNLCCu5kKkqWVIvxm25TKityqiVwtD0c9uN0WpLcTjA7KWLOtcyN9fKqBYLi0AEtD
	KpAcBhniLe/JtMqulUWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npX0x-00Gc1y-FM; Fri, 13 May 2022 15:15:35 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npX0v-00GbzU-6P
 for ath10k@lists.infradead.org; Fri, 13 May 2022 15:15:34 +0000
Received: by mail-wr1-x42f.google.com with SMTP id v12so11834908wrv.10
 for <ath10k@lists.infradead.org>; Fri, 13 May 2022 08:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4kMBq3ML8i4Cw0yoGEU+fJc6+bgjz8wLr/JmgXqi+0Y=;
 b=sSPnHzKsfAMHfdJZEceCGudvpiXtlhgaJ1KH/jFERZw+Cwc4GNQJYDOsKkIwlRr1SG
 zkWovpQQtEag6AdaxK7LyAXiyW4g8aA5dcLn+9igMe8Z3FYGQlwHPZ1wvRN/wEYYdiHu
 hMkkGjyQ+Tg2fqdGTUSLDTrNDPk2ljGdh5zd3aZlkZJpJe6aTklZSUiwHBRbGGHQYQGu
 ok9S/0Q9HjL69n9v7eso0j2N64NbQr2B6Zd/FL9ssgXm67yxf6bgcK+dfcKAnLT9EwdE
 5ObekqAsaYhfBzkthbhzG+YTC8/USyXkFJr1R21N2xOWBQa1TszxvMOXXJCCK3dpGgXF
 HzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4kMBq3ML8i4Cw0yoGEU+fJc6+bgjz8wLr/JmgXqi+0Y=;
 b=cv7v2S94f7p8kCsQb2SQVpmeTgNpPKN3ayqEb6WuMQndEg2Dt+SjQHU07M94UbtJSj
 TUPwGU+rO2WugaKXRN7R1S+i3AkzS8Ij899CzQkQ16yFl2R7ycJAvV48b8ZzViI1+j64
 x0oJoPaUBVxrewn5ei1fzLwiaM03h6pPl2xOPeAWmTeFje23knd/J95l+5MFqSgCQh1Q
 pTuZn/xqeEC4b5kphRBoKOGZqPf10iRDqRvNmiDFLixw8nSuCZBTmIYWkXMbcs9XPqjR
 J4LJcKyZ9r9L28AygHbwkh9Qyf1pu2TaKajU98xLqyexFR/3BKoPYH/3CoCxc/PJV5CI
 j/gw==
X-Gm-Message-State: AOAM5325tQDTCKulNuiFbD7Bqg/4wB2mZfY7C72crHp23kTkbeUPPHvt
 pL1WT+DsmrfothZMq0AHytK9ew==
X-Google-Smtp-Source: ABdhPJxYzFSnDNuHEGkraj3axUSnYZQ3NLj17U3JhPBsXfiJv7WzEL40kF+makqi7xt9BaGY90jGXw==
X-Received: by 2002:a05:6000:86:b0:20a:d7be:e09b with SMTP id
 m6-20020a056000008600b0020ad7bee09bmr4325701wrx.398.1652454929639; 
 Fri, 13 May 2022 08:15:29 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 y15-20020a05600c364f00b003945237fea1sm2741440wmq.0.2022.05.13.08.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 08:15:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Govind Singh <govinds@codeaurora.org>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ath10k: do not enforce interrupt trigger type
Date: Fri, 13 May 2022 17:15:16 +0200
Message-Id: <20220513151516.357549-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_081533_257342_0A272DD6 
X-CRM114-Status: GOOD (  11.69  )
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

Interrupt line can be configured on different hardware in different way,
even inverted.  Therefore driver should not enforce specific trigger
type - edge rising - but instead rely on Devicetree to configure it.

All Qualcomm DTSI with WCN3990 define the interrupt type as level high,
so the mismatch between DTSI and driver causes rebind issues:

  $ echo 18800000.wifi > /sys/bus/platform/drivers/ath10k_snoc/unbind
  $ echo 18800000.wifi > /sys/bus/platform/drivers/ath10k_snoc/bind
  [   44.763114] irq: type mismatch, failed to map hwirq-446 for interrupt-controller@17a00000!
  [   44.763130] ath10k_snoc 18800000.wifi: error -ENXIO: IRQ index 0 not found
  [   44.763140] ath10k_snoc 18800000.wifi: failed to initialize resource: -6

Fixes: c963a683e701 ("ath10k: add resource init and deinit for WCN3990")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Separate question is whether DTS has a proper interrupt type (level
high) configured...
---
 drivers/net/wireless/ath/ath10k/snoc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 607e8164bf98..5576ad9fd116 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1249,13 +1249,12 @@ static void ath10k_snoc_init_napi(struct ath10k *ar)
 static int ath10k_snoc_request_irq(struct ath10k *ar)
 {
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
-	int irqflags = IRQF_TRIGGER_RISING;
 	int ret, id;
 
 	for (id = 0; id < CE_COUNT_MAX; id++) {
 		ret = request_irq(ar_snoc->ce_irqs[id].irq_line,
-				  ath10k_snoc_per_engine_handler,
-				  irqflags, ce_name[id], ar);
+				  ath10k_snoc_per_engine_handler, 0,
+				  ce_name[id], ar);
 		if (ret) {
 			ath10k_err(ar,
 				   "failed to register IRQ handler for CE %d: %d\n",
-- 
2.32.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
