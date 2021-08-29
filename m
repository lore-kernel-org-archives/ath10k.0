Return-Path: <SRS0=gUy0=NU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1386C41537
	for <ath10k@archiver.kernel.org>; Sun, 29 Aug 2021 13:13:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 723DF60F39
	for <ath10k@archiver.kernel.org>; Sun, 29 Aug 2021 13:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 723DF60F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/bJbLUOp59LZcK+CWMwQjYisg8UOPMok3W2tBrfWgk=; b=LrphLxzql5P38l
	yTs7rFgXuW9SCinQ5WgfLlNmqAc1ackqhAo1ZxESVOH27K+89G+au2KDiLlDLMYVLW529ZYGU7kTh
	eZZWTHw7UK3G0VQgT8L9pdYjN9lX7kr60/82MgrK9LTGOAP1CTmrWi+Y7TqwFgyUzSshm7VoJFGOi
	92MDlrFqW4em44gAEk2yhZSB9rVcRgKW2aPWDG8PytH7like99VKtZLHbJeNxzu3bCQFEp3kS85TW
	Ndxo5hX4RSGBKD7xsgcn5Bk3s2y3LMY7ZDHJC0fTNQmU3BRUNcjvfKyY2okYNRmpsTryeWMqWkwNK
	28SYchnFmmKfDtvecomA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKKcr-00FWxj-6l; Sun, 29 Aug 2021 13:13:29 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKKce-00FWt2-6o
 for ath10k@lists.infradead.org; Sun, 29 Aug 2021 13:13:22 +0000
Received: by mail-lf1-x134.google.com with SMTP id p38so25417167lfa.0
 for <ath10k@lists.infradead.org>; Sun, 29 Aug 2021 06:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W90zCRw/gyIjKh5bN6AdA5a45jbpL+6W+rmSnj/xdRc=;
 b=MGtT4oebKOHyJUzHFk/GStnDRBlucvXQUdsvl3KqvG83GLCtg/sscD7aUZINgsWWxR
 mry9SHUjRz6j/EVknFswB9UJeqJc+HnyQYofSptX+47CH9Ql58haBaYJs90uxm4l2ATF
 HZVJLqaBdi40E8oRdmm2DKIQwzwImyoA5skuvtj15Bv9dhyyYqaJ9LbM8Eh6md+hckVJ
 ktYNRzdmui0t6n855ydf+ooRalLokWct1cGpCbqeYE3xHBu6sbMZC+6WmTmouvLOH/DQ
 VsHIFmJZWcKV4tYEZ1LMdwxFFSQaDPf3/4zqG4nB9OBSNwV1dkGh3RLs9xXTAFUsHS79
 Styg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W90zCRw/gyIjKh5bN6AdA5a45jbpL+6W+rmSnj/xdRc=;
 b=VAosyYSlun5xT4WaeiewYHrm0fFo5Xh2ROdTB9vuX/9dPoQxGHqP2Z1prKoJXh3U1J
 s8SUVxHGByzpK3MBNeXxsmYCS8XVHW9fa8A7jiiMyw8Ln6X2bpTlD2bMzBXrvclgJeZF
 jpK/+6nB3WFjG67atEAWIcp2ATZcVcMK7sYaqCDf2i3MydedCDbS70lpJTyYAFxxNvwM
 Sl6A4Wh99D0QdUrn6sQIwi6k/uNngmBStylLLpBITr0V1UhRCyYKb1QjUHkgN5zZmRCd
 IiwfJH8xnEmkWWp6zFTNj0oVHQ3yisdHGRTGbbrdw2lgxqcPfj0leRlax9WT4J2JDjs6
 dLnA==
X-Gm-Message-State: AOAM533OrJKUf2MT4nANGpvUFg0OQFMjvYf93IyA1leMOQnUbPHmdHG2
 tKYTb9483HPMVvpMbucA/JE2iw==
X-Google-Smtp-Source: ABdhPJz8ss1hZf/h7XEdWNe+VXrVLZ8dFiYzYa9JHOoN8i2WkbHCSfq9a7aQ5moet2JaOib5Pq53hA==
X-Received: by 2002:a05:6512:21d1:: with SMTP id
 d17mr14594374lft.588.1630242794541; 
 Sun, 29 Aug 2021 06:13:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id x13sm712503lfq.262.2021.08.29.06.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 06:13:14 -0700 (PDT)
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
Subject: [RFC v2 06/13] pwrseq: pwrseq_qca: implement fallback support
Date: Sun, 29 Aug 2021 16:12:58 +0300
Message-Id: <20210829131305.534417-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829131305.534417-1-dmitry.baryshkov@linaro.org>
References: <20210829131305.534417-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210829_061316_291516_A694AC17 
X-CRM114-Status: GOOD (  18.34  )
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

While we are waiting for all users of wcn399x-bt to be converted to the
pwrseq declaration in the device tree, provide support for the pwrseq
fallback: if the regulators are declared in the device itself, create
pwrseq instance. This way the hci_qca driver doesn't have to cope with
old and new dts bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/power/pwrseq/pwrseq_qca.c | 148 +++++++++++++++++++++++++++++-
 1 file changed, 147 insertions(+), 1 deletion(-)

diff --git a/drivers/power/pwrseq/pwrseq_qca.c b/drivers/power/pwrseq/pwrseq_qca.c
index 7aa5f2d94039..d01f1ef4626b 100644
--- a/drivers/power/pwrseq/pwrseq_qca.c
+++ b/drivers/power/pwrseq/pwrseq_qca.c
@@ -11,9 +11,11 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/pwrseq/driver.h>
+#include <linux/pwrseq/fallback.h>
 #include <linux/regulator/consumer.h>
 
 /* susclk rate */
@@ -367,5 +369,149 @@ static struct platform_driver pwrseq_qca_driver = {
 	},
 };
 
-module_platform_driver(pwrseq_qca_driver);
+struct pwrseq_qca_fallback {
+	struct pwrseq_qca_one qca_one;
+	struct pwrseq_qca_common common;
+};
+
+static const struct of_device_id pwrseq_qca_bt_of_match[] = {
+	{ .compatible = "qcom,qca6174-bt" },
+	{ .compatible = "qcom,qca6390-bt", .data = &qca_soc_data_qca6390},
+	{ .compatible = "qcom,qca9377-bt" },
+	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990 },
+	{ .compatible = "qcom,wcn3991-bt", .data = &qca_soc_data_wcn3990 },
+	{ .compatible = "qcom,wcn3998-bt", .data = &qca_soc_data_wcn3998 },
+	{ .compatible = "qcom,wcn6750-bt", .data = &qca_soc_data_wcn6750 },
+	{ /* sentinel */ },
+};
+
+static const struct qca_device_data qca_soc_data_wifi = {
+	.vregs = {
+		{ "vdd-1.8-xo", 80000  },
+		{ "vdd-1.3-rfa", 300000 },
+		{ "vdd-3.3-ch0", 450000 },
+		{ "vdd-3.3-ch1", 450000 },
+	},
+	.num_vregs = 4,
+};
+
+static const struct of_device_id pwrseq_qca_wifi_of_match[] = {
+	{ .compatible = "qcom,wcn3990-wifi", .data = &qca_soc_data_wifi },
+	{ /* sentinel */ }
+};
+
+static struct pwrseq * pwrseq_qca_fallback_get(struct device *dev)
+{
+	struct pwrseq_qca_fallback *fallback;
+	const struct of_device_id *match;
+	const struct qca_device_data *data;
+	struct gpio_desc *gpiod;
+	int ret;
+
+	match = of_match_device(pwrseq_qca_bt_of_match, dev);
+	if (!match)
+		return ERR_PTR(-ENODEV);
+
+	data = match->data;
+	if (!data)
+		data = &qca_soc_data_default;
+
+	fallback = devm_kzalloc(dev, struct_size(fallback, common.vregs, data->num_vregs), GFP_KERNEL);
+	if (!data)
+		return ERR_PTR(-ENOMEM);
+
+	fallback->qca_one.common = &fallback->common;
+
+	ret = pwrseq_qca_common_init(dev, &fallback->common, data);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (data->has_enable_gpios) {
+		gpiod = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+		if (IS_ERR(gpiod))
+			return ERR_PTR(dev_err_probe(dev, PTR_ERR(gpiod), "failed to acquire enable GPIO\n"));
+		fallback->qca_one.enable = gpiod;
+	}
+
+	/* If we have no control over device's enablement, make sure that sleep clock is always running */
+	if (!fallback->common.vddio ||
+	    !fallback->common.num_vregs ||
+	    !fallback->qca_one.enable) {
+		ret = clk_set_rate(fallback->common.susclk, SUSCLK_RATE_32KHZ);
+		if (ret)
+			return ERR_PTR(ret);
+
+		ret = clk_prepare_enable(fallback->common.susclk);
+		if (ret)
+			return ERR_PTR(ret);
+
+		ret = devm_add_action_or_reset(dev, pwrseq_qca_unprepare_susclk, &fallback->common);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
+	return devm_pwrseq_create(dev, &pwrseq_qca_ops, &fallback->qca_one);
+}
+
+static struct pwrseq * pwrseq_qca_fallback_get_bt(struct device *dev, const char *id)
+{
+	if (strcmp(id, "bt"))
+		return ERR_PTR(-ENODEV);
+
+	return pwrseq_qca_fallback_get(dev);
+}
+
+static struct pwrseq * pwrseq_qca_fallback_get_wifi(struct device *dev, const char *id)
+{
+	if (strcmp(id, "wifi"))
+		return ERR_PTR(-ENODEV);
+
+	return pwrseq_qca_fallback_get(dev);
+}
+
+static struct pwrseq_fallback pwrseq_qca_fallback_bt = {
+	.get = pwrseq_qca_fallback_get_bt,
+	.of_match_table = pwrseq_qca_bt_of_match,
+};
+
+static struct pwrseq_fallback pwrseq_qca_fallback_wifi = {
+	.get = pwrseq_qca_fallback_get_wifi,
+	.of_match_table = pwrseq_qca_wifi_of_match,
+};
+
+static int __init pwrseq_qca_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&pwrseq_qca_driver);
+	if (ret)
+		return ret;
+
+	ret = pwrseq_fallback_register(&pwrseq_qca_fallback_bt);
+	if (ret)
+		goto err_bt;
+
+	ret = pwrseq_fallback_register(&pwrseq_qca_fallback_wifi);
+	if (ret)
+		goto err_wifi;
+
+	return 0;
+
+err_wifi:
+	pwrseq_fallback_unregister(&pwrseq_qca_fallback_bt);
+err_bt:
+	platform_driver_unregister(&pwrseq_qca_driver);
+
+	return ret;
+}
+module_init(pwrseq_qca_init);
+
+static void __exit pwrseq_qca_exit(void)
+{
+	pwrseq_fallback_unregister(&pwrseq_qca_fallback_wifi);
+	pwrseq_fallback_unregister(&pwrseq_qca_fallback_bt);
+	platform_driver_unregister(&pwrseq_qca_driver);
+}
+module_exit(pwrseq_qca_exit);
+
 MODULE_LICENSE("GPL v2");
-- 
2.33.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
