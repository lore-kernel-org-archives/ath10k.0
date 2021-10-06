Return-Path: <SRS0=0INN=O2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1523DC433F5
	for <ath10k@archiver.kernel.org>; Wed,  6 Oct 2021 03:56:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D79A9611C1
	for <ath10k@archiver.kernel.org>; Wed,  6 Oct 2021 03:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D79A9611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXlOilLoGIiy+aA7gIjxfFRzV+Wtmca60gSEBlhxpWA=; b=orOyAgpYXnQ2oP
	wGmiOMj76k34lQT9WE9sZyf8qviYDUOvqJ7dgG/WV8csxeidjePaewLEHb9wI2n2S23S5sG2nrUYg
	9BmQ/G37WPP7Elo0emsvpfRkFJ0/WG/JBWgsF+t6P8h1UJEV53WUszf8dbfIJ9FJcktLPZosewVi7
	qTYTahk58VbbDKjdfdegLNniHf9PhtZduUo1DlcO049Poi46LB3/33LRAT/qwsO9uNbJ64eUi8Eqe
	2mzZFm8+xKOQMK0tQ6UPm4iFR9DqJ20I1hIMXf97Vi0FVQhZ5FKbFz0Fl7vhlXpnNzZoOPwytUYb4
	aZHxWplVznYsWyhsQ3IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXy25-00Cj3E-Ph; Wed, 06 Oct 2021 03:55:54 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXy0f-00Ci0a-Q5
 for ath10k@lists.infradead.org; Wed, 06 Oct 2021 03:54:27 +0000
Received: by mail-lf1-x136.google.com with SMTP id y26so4462566lfa.11
 for <ath10k@lists.infradead.org>; Tue, 05 Oct 2021 20:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cntTQV+8xT1gaPRWwmEttMqurpErGQCflfEN/t0ShBw=;
 b=nI8QFgOb018OHBusf4YC2JeMjW54+ysmQEB8kR7Xsem1gHesZm4WMMnTqiCIMiIJic
 WI7/wxQI+UPOYHBu3IM8HVi9QtbP9cW2z7Dw6JKWTuCV4ApU9PGZzJrmoVoO8ohQJUx2
 ofFLe3i5sE2uwNgAtXM+eSdn8y8WAry7pokGo4W4zYARZ5um+aTBPwVaXMYetwnPHqnt
 EukYtJv6K7yZzw+gQsNKLblw67yWlUpB+YUL310GiTZMoiBbS2CMLfTpElLBXjmOdr5n
 Qg+qq3q8Cw/VMVHNvozcdAKgFGZYFF40fyNeJ64thfSGSgOSto4way/p2ww9JO/ImxaM
 5Lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cntTQV+8xT1gaPRWwmEttMqurpErGQCflfEN/t0ShBw=;
 b=hCkKTkEvIHQICdwwhbgpZlx22mMWV1RIVFC9FurPy77Mk+6rWKIhhxpT26D6bxW2kw
 Ax4PGHUfclHO5ZuT9gN5oPrFAdJSy6XwML5J9YddEbLDI3knZG/ZOl1Xrigd4QO6Sclk
 7gEENSa7RFVtKy/PPXwCZhzTAWElpfPU0Fpgxt+QedLbWOsWEB/jCM2wOWC6FrkudC0K
 HSZ0UuAdqmjBKNm9YVMkHOMZJgYF5Go38G+7h+wyTMjgFe/p8AloJsj1xpL0oQvZeyE0
 kbrJQRoc3jVlpQPzFjCFZkxYbH1NVkYCRdHrZcz9UWVp6E7UU5mjbWNuTXbq3jx577TW
 S+gQ==
X-Gm-Message-State: AOAM530w34jC3qxsuFqkXyKgnnpcNCjPTz7+41IRuFDI/84KrQUJ+4ZL
 lrB4IlQYtqy90vKKc/330ju7rA==
X-Google-Smtp-Source: ABdhPJxsUvRGDiX/+G1NjVUXp066qhnPQIzeN7/ovvdbZrBswOTRoBoS6GwOzADjXLYmhRy7xOhHcw==
X-Received: by 2002:ac2:59d0:: with SMTP id x16mr7310130lfn.107.1633492464220; 
 Tue, 05 Oct 2021 20:54:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s4sm2142967lfd.103.2021.10.05.20.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 20:54:23 -0700 (PDT)
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
Subject: [PATCH v1 14/15] WIP: PCI: qcom: use pwrseq to power up bus devices
Date: Wed,  6 Oct 2021 06:54:06 +0300
Message-Id: <20211006035407.1147909-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_205425_890433_76248D6A 
X-CRM114-Status: GOOD (  13.65  )
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
 1 file changed, 13 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 8a7a300163e5..f398283912c7 100644
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
 
+	pwrseq = devm_pwrseq_get(dev, "bus");
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
-- 
2.33.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
