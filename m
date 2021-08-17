Return-Path: <SRS0=aPVg=NI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047F3C4320A
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:57:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C649360E78
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C649360E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEX2ohiTIk8efDIYLMtAVNRF8z9qzT6mYUMWWeJwWFU=; b=dO5iNn4WAzWqny
	dEJr+SsQB+CAz6Y3QoDNzEs2FL7kn5xYMSNa0DBrGlWfmkvfeEZtH2cOBzcfZctJ84Z4jJ8hmqn/5
	Ez5dNMGDrsQ09HtAtcjmJVb78UshnIaFTdm7eJNqi9KEOzZ0/NU8HlxyLPjBpxa7E1Bg+emlw8zK2
	XG9KwaVSgLfVlnU5tWzPSJ09ta2X/l/So4ZJPndVyjSa+jlp9GzrhggaPv5sfkUDSu0kTk7s+B/jz
	g0mg1uwPLUVccqNgUwrXrcWFba2BgC/yA2cDQUzNTp60JuHAYrSEEKIVJxA+NIP+fnNjT3RxePIHY
	k/Smh82xpUpRnUTga2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFnPY-000dHJ-2l; Tue, 17 Aug 2021 00:57:00 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnO2-000cDl-C7
 for ath10k@lists.infradead.org; Tue, 17 Aug 2021 00:55:28 +0000
Received: by mail-lj1-x234.google.com with SMTP id c12so17068473ljr.5
 for <ath10k@lists.infradead.org>; Mon, 16 Aug 2021 17:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TpzWYLTlVm4a1u+cpDX/DibFOc/Y83As8pftjQgWXKY=;
 b=q9pVfUjjkZl1dsYvBgGfBt7HOGtu8qETGZwnHj79FxZbGPuB6WTuhL+bUDVxMkCegv
 WEQR1iewhQkT/FqzCRDxANG/lounhB5oawM+/8Wvjz87lWryGQuJU1Ie+0L8IS/wI9xd
 6MQqcTbuWam46/QnO7n0r47+m4ZYylm/I0O1HTHqkqs/KB85IKXpeGKM+en0wo82yZ/W
 +wePJePJbzKU5tK97xy6yr5AwOC5V53tgIhaJs1E6spLUJAM9eiDG+8iQodQveBAnmPE
 Cr4OTMeadYhTN6g7Gvg91Z1gyUXuIDc2CvtECs4MkTfSy29nmzr39Mte6ecmEI1CyRtK
 aeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TpzWYLTlVm4a1u+cpDX/DibFOc/Y83As8pftjQgWXKY=;
 b=nQfnAlifMsto1bsVPdxqK4rAHfA83PBYOp1ofUqXtte4c5A745ZKCnlm9cLaBP5cJ+
 cICMNDQHI0e23Kgc1dZZYfnEdxWvXCwupAQEA5ZOY68TXytZR5bGd/dE9AfSQoPeCVx6
 GTW2/JrcY/Cp5308rsaWheQ6UXNUSJHDE0KijCUx3SBQ1MXAkYiB412HBOLAFjtC+PCk
 5WVmnkWTsReNTFUZ3Yisp9ewzeAGnKdd0lR0bLOkbf+1RtzsV9bEd2isLQAvHxbrXMaA
 G9q4Jh3676G7drrLmBYD2MCnxMZozpk3ASaqNhELrsIS3PSEHKA7p1bIKT2U85NPg31x
 Ux6Q==
X-Gm-Message-State: AOAM531K3ER5VraX/DKFC14e/IfH9H4tkF6TjQ6aoKqQvZlEQWXIFr1J
 FURe21lyO1+VvEWhxNISObGuWg==
X-Google-Smtp-Source: ABdhPJzVEZqzzw5axwOZZ57yFH4IQjnro9z1ocsbY1Qd55La4H98eGgaiJDN30TJHy6/Q48qtg1yYw==
X-Received: by 2002:a05:651c:1142:: with SMTP id
 h2mr776331ljo.289.1629161724341; 
 Mon, 16 Aug 2021 17:55:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z6sm40719lfb.251.2021.08.16.17.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 17:55:24 -0700 (PDT)
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
Subject: [RFC PATCH 14/15] WIP: PCI: qcom: use pwrseq to power up bus devices
Date: Tue, 17 Aug 2021 03:55:06 +0300
Message-Id: <20210817005507.1507580-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_175526_505147_ED765DE8 
X-CRM114-Status: GOOD (  14.64  )
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

Use bus-pwrseq device tree node to power up the devices on the bus. This
is to be rewritten with the proper code parsing the device tree and
powering up individual devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 13 +++++++++++++
 drivers/power/pwrseq/pwrseq_qca.c      |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 8a7a300163e5..a60d41fbcd6f 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -23,6 +23,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
@@ -1467,6 +1468,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	struct pcie_port *pp;
 	struct dw_pcie *pci;
 	struct qcom_pcie *pcie;
+	struct pwrseq *pwrseq;
 	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
@@ -1520,6 +1522,17 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	pp->ops = &qcom_pcie_dw_ops;
 
+	pwrseq = devm_pwrseq_get_optional(dev, "bus");
+	if (IS_ERR(pwrseq)) {
+		ret = PTR_ERR(pwrseq);
+		goto err_pm_runtime_put;
+	}
+	if (pwrseq) {
+		ret = pwrseq_full_power_on(pwrseq);
+		if (ret)
+			goto err_pm_runtime_put;
+	}
+
 	ret = phy_init(pcie->phy);
 	if (ret) {
 		pm_runtime_disable(&pdev->dev);
diff --git a/drivers/power/pwrseq/pwrseq_qca.c b/drivers/power/pwrseq/pwrseq_qca.c
index 3421a4821126..4107f0a9c05d 100644
--- a/drivers/power/pwrseq/pwrseq_qca.c
+++ b/drivers/power/pwrseq/pwrseq_qca.c
@@ -1,3 +1,4 @@
+#define DEBUG
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2021, Linaro Ltd.
-- 
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
