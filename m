Return-Path: <SRS0=aPVg=NI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B802C43214
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:55:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ADCB60295
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0ADCB60295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRy+RYVNg6xod2rum3gjbdGG7pFLqgYj752md08zsts=; b=xkiQrgzwF0e7eC
	h3/BJQAG2u+t+LZV07yiIhjlVaUHMj7oadeI7u/DX71fqFzNpqKkuQThucnT1bHG6NYWHETy3OJ4A
	xOPYhrjev8rx4u9R6SUi5bRq7dE5ln4v36zM3q8ZiMLqGmr81ddawPYwykJZ5dujIiveNKkzbwZfN
	9fHOStwUYMOkns6KT/8reJYmAI+bHM4xl2W+kV8xWQ2ahxTB9c/2UT0fkwZj6MhSZno5kaWoWC5Dn
	r+DqnVP4W6QUcFKCZLYLzd/1xQyW9pnzlZ0GPl4qgf1LKHtEf24lW0ZzwLfs0dgy+OvOHYl4ldBhK
	OvV1Gtr/bWyl5PkgeKzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFnO6-000cGH-Lz; Tue, 17 Aug 2021 00:55:30 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnNt-000cA1-V3
 for ath10k@lists.infradead.org; Tue, 17 Aug 2021 00:55:23 +0000
Received: by mail-lj1-x231.google.com with SMTP id y6so13342904lje.2
 for <ath10k@lists.infradead.org>; Mon, 16 Aug 2021 17:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wdu5a/cMDbATqqiF4Vpee9GEfvuO3Zi0W+N+1NhGvAs=;
 b=KadqBNUFvId8+sROkIoWW2FnIiISPA/xpZWhqmtLgHDQHk5ltVM9Jgu60gY6RHkhhU
 LxZfK3sQvb2jKcgpbunWaDbUXqzuuNAoBiRd/+aZ6ZlKUbctO+qgDzwoU8spR3DMw9/R
 2ErU12GwvauMTdGSM+eBF1gUNlVHdg+JTKJ6WJ6UIq9jrevyeoLYCbT8n83RcBz5AgPA
 7ITGMU2aIZBqx+9cPVoj5uPuPEyFDbj3EsmIoCMwaCeme7ugesPolg0LvwnnyEYGVBd0
 HQkA6lOYvqUppAIJVQdlmtl51ODC6UeKWmNnXFk6X9c90iuFUn3oHF9d1QqEl3AV1jCG
 13Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wdu5a/cMDbATqqiF4Vpee9GEfvuO3Zi0W+N+1NhGvAs=;
 b=Bfo37Zocj2CwNvkREfRqbSCHe9jP5OPWgq9jRvXD0BOH6LnU/wu/tKQNTXbc0Fc43R
 f1Ww2mRiYFZi8whpJqb6G5hVVp8SYUnaXfPxY8VUihSOcooWoU60g8E3qRqF0g2sSFwL
 BN7gNGVp+1j3/F3uzYhNhs52bMuLEUythwFN1iCmc+nVSicq6qQNjOOZ07yLM9+lO/Rt
 RD/yUpuBPPvBMzTYwqtO7Ey2/ZjeqFvfhMR4pd24N2XNzYfJDbeP81K3NQEBr1E64cJG
 vIebkCB9Iq3nZJcJkKSVo8IuMAqnb8XnEc8n7690idQ64GG58INJYePfG2X3Eb+22+MA
 q5RQ==
X-Gm-Message-State: AOAM531e6DlE1MVNnkU5MSsF8jwaRLRvDGNj4ADNoKG4Tco59Cc40tCA
 Ti3WP1XkRh/MezuSmhSuq2G/Sg==
X-Google-Smtp-Source: ABdhPJyykVmUp2+uL524zpEVpdzv1pv0gVNB4w0uBgg1/3eS2V8TRDR8U1hnV+vjiLEctppv61IqLQ==
X-Received: by 2002:a05:651c:1257:: with SMTP id
 h23mr769675ljh.49.1629161716645; 
 Mon, 16 Aug 2021 17:55:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z6sm40719lfb.251.2021.08.16.17.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 17:55:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [RFC PATCH 04/15] ath10k: add support for pwrseq sequencing
Date: Tue, 17 Aug 2021 03:54:56 +0300
Message-Id: <20210817005507.1507580-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_175518_043072_D4AC762C 
X-CRM114-Status: GOOD (  19.04  )
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

Power sequencing for Qualcomm WiFi+BT chipsets are being reworked to use
pwrseq rather than individually handling all the regulators. Add support
for pwrseq to ath10k SNOC driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 63 ++++++++++++++++++++------
 drivers/net/wireless/ath/ath10k/snoc.h |  2 +
 2 files changed, 52 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index ea00fbb15601..870ed28d01a6 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -14,6 +14,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/of_address.h>
 #include <linux/iommu.h>
+#include <linux/pwrseq/consumer.h>
 
 #include "ce.h"
 #include "coredump.h"
@@ -42,7 +43,6 @@ static char *const ce_name[] = {
 };
 
 static const char * const ath10k_regulators[] = {
-	"vdd-0.8-cx-mx",
 	"vdd-1.8-xo",
 	"vdd-1.3-rfa",
 	"vdd-3.3-ch0",
@@ -1010,10 +1010,17 @@ static int ath10k_hw_power_on(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power on\n");
 
-	ret = regulator_bulk_enable(ar_snoc->num_vregs, ar_snoc->vregs);
+	if (ar_snoc->pwrseq)
+		ret = pwrseq_full_power_on(ar_snoc->pwrseq);
+	else
+		ret = regulator_bulk_enable(ar_snoc->num_vregs, ar_snoc->vregs);
 	if (ret)
 		return ret;
 
+	ret = regulator_enable(ar_snoc->vreg_cx_mx);
+	if (ret)
+		goto vreg_bulk_off;
+
 	ret = clk_bulk_prepare_enable(ar_snoc->num_clks, ar_snoc->clks);
 	if (ret)
 		goto vreg_off;
@@ -1021,7 +1028,13 @@ static int ath10k_hw_power_on(struct ath10k *ar)
 	return ret;
 
 vreg_off:
-	regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
+	regulator_disable(ar_snoc->vreg_cx_mx);
+vreg_bulk_off:
+	if (ar_snoc->pwrseq)
+		pwrseq_power_off(ar_snoc->pwrseq);
+	else
+		regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
+
 	return ret;
 }
 
@@ -1033,6 +1046,14 @@ static int ath10k_hw_power_off(struct ath10k *ar)
 
 	clk_bulk_disable_unprepare(ar_snoc->num_clks, ar_snoc->clks);
 
+	regulator_disable(ar_snoc->vreg_cx_mx);
+
+	if (ar_snoc->pwrseq) {
+		pwrseq_power_off(ar_snoc->pwrseq);
+
+		return 0;
+	}
+
 	return regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
 }
 
@@ -1691,20 +1712,36 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
 		goto err_release_resource;
 	}
 
-	ar_snoc->num_vregs = ARRAY_SIZE(ath10k_regulators);
-	ar_snoc->vregs = devm_kcalloc(&pdev->dev, ar_snoc->num_vregs,
-				      sizeof(*ar_snoc->vregs), GFP_KERNEL);
-	if (!ar_snoc->vregs) {
-		ret = -ENOMEM;
+	ar_snoc->pwrseq = devm_pwrseq_get_optional(&pdev->dev, "wifi");
+	if (IS_ERR(ar_snoc->pwrseq)) {
+		ret = PTR_ERR(ar_snoc->pwrseq);
+		if (ret != -EPROBE_DEFER)
+			ath10k_warn(ar, "failed to acquire pwrseq: %d\n", ret);
 		goto err_free_irq;
 	}
-	for (i = 0; i < ar_snoc->num_vregs; i++)
-		ar_snoc->vregs[i].supply = ath10k_regulators[i];
 
-	ret = devm_regulator_bulk_get(&pdev->dev, ar_snoc->num_vregs,
-				      ar_snoc->vregs);
-	if (ret < 0)
+	if (!ar_snoc->pwrseq) {
+		ar_snoc->num_vregs = ARRAY_SIZE(ath10k_regulators);
+		ar_snoc->vregs = devm_kcalloc(&pdev->dev, ar_snoc->num_vregs,
+				sizeof(*ar_snoc->vregs), GFP_KERNEL);
+		if (!ar_snoc->vregs) {
+			ret = -ENOMEM;
+			goto err_free_irq;
+		}
+		for (i = 0; i < ar_snoc->num_vregs; i++)
+			ar_snoc->vregs[i].supply = ath10k_regulators[i];
+
+		ret = devm_regulator_bulk_get(&pdev->dev, ar_snoc->num_vregs,
+				ar_snoc->vregs);
+		if (ret < 0)
+			goto err_free_irq;
+	}
+
+	ar_snoc->vreg_cx_mx = devm_regulator_get(&pdev->dev, "vdd-0.8-cx-mx");
+	if (IS_ERR(ar_snoc->vreg_cx_mx)) {
+		ret = PTR_ERR(ar_snoc->vreg_cx_mx);
 		goto err_free_irq;
+	}
 
 	ar_snoc->num_clks = ARRAY_SIZE(ath10k_clocks);
 	ar_snoc->clks = devm_kcalloc(&pdev->dev, ar_snoc->num_clks,
diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
index 5095d1893681..16cfd72180cd 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.h
+++ b/drivers/net/wireless/ath/ath10k/snoc.h
@@ -72,8 +72,10 @@ struct ath10k_snoc {
 	struct timer_list rx_post_retry;
 	struct regulator_bulk_data *vregs;
 	size_t num_vregs;
+	struct regulator *vreg_cx_mx;
 	struct clk_bulk_data *clks;
 	size_t num_clks;
+	struct pwrseq *pwrseq;
 	struct ath10k_qmi *qmi;
 	unsigned long flags;
 	bool xo_cal_supported;
-- 
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
