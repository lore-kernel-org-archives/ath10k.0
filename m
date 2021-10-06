Return-Path: <SRS0=0INN=O2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423B8C433FE
	for <ath10k@archiver.kernel.org>; Wed,  6 Oct 2021 03:55:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DB11611C1
	for <ath10k@archiver.kernel.org>; Wed,  6 Oct 2021 03:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DB11611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWxXSvIEqeL80F1YhpOqfbOHuqfBNb+Dk3cIHBaR27g=; b=riLpDIlp+04ZOp
	vP6LC7X+Bw65fscVj4tlou5zaT0oK6Bbwtz3OxXuaqge81WHW7aGOGRKgc6yMhsaLQ4kPwviRV1xm
	HxHbgGko4KcNvImF5DDelbtDuAHed9mRHTt5/tgfmu3WE8saxvOBU+yAp47atl7/07pxVJi8/7zIi
	npOyMH7sfeb+vydGzOEiIaVfh81OaKK2w6EK9wAkFycaEm1iq415Lv0YVYigkMFi5EJNSkWCzJwnx
	jlGERpONCgXHzsxhy25VxjWLN/c3qr6H4egsYMkYQ2hqmxRs9/AOj9UqozQ9QzndjxN+x5yqUVvnm
	wX/+o9m9Yuxiw31hoFHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXy11-00CiHZ-41; Wed, 06 Oct 2021 03:54:47 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXy0Z-00Chwu-Pf
 for ath10k@lists.infradead.org; Wed, 06 Oct 2021 03:54:22 +0000
Received: by mail-lf1-x133.google.com with SMTP id i24so4407692lfj.13
 for <ath10k@lists.infradead.org>; Tue, 05 Oct 2021 20:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=20pfiPj2Llz4cGLyPgKlOrfQmUN7w2lzAc5IpSkv3GI=;
 b=IXkrOb5Iz/JfPhzwI6v3Kgqqknyi/+bInvUv07kFzlxnKMk7JFNeHghZz54DiHXAIs
 Zhuj6VbGzDcX16B0S3Gf44y4VWWpqDq/uN3SHSd9RXjCx7bMgdiLf0skAmQj5ibRB+SP
 bMr8EDVuYCvdaAVEvrY6+z63Q/Vdb+mAL5YNkN+e0Ef7X0Y+psZvfNO2+41l1qiCx9MW
 wZlre7qC58F/fnFMGA+c/nzKZ7BjHhtKSDPzsID+876qdzyc2jcb7OokLuxaaEDGi/Up
 NIfEoUCeX3eCvIRWnv6ylatWevkMaY+xdMXtmguz5z6yj5/eZe6cDBzSIi8MUReYCyIj
 /aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=20pfiPj2Llz4cGLyPgKlOrfQmUN7w2lzAc5IpSkv3GI=;
 b=z9umzMrXeeb1rkBhdoOxCZhhySJre73zZQTuBNxH8PGxNKQPxt+H66UWmvF5DwSkwv
 RInmwDdddnZFGyw/mVyv/REgaSCyaxlEd5gyntp3WkGHKsDUAxgeYO/0X6PdayGd2Ta7
 pzfhWDLZXgGCjF90p+rHWZBaOw+V9I19r6f8HycOtJk+J7NNcFtpWt+Z3FNa0J4MjSIq
 ViPxGyK0dD0nqAdowdR6yPfJ+Au376ZXu7ok0KpVdaRKOmOKfsYWZt30OT1SlE46FYyj
 5SyO+IDWnPYith8pg5OEiH4eSezKylSIpP7sJckMzAt8hc/TGi7JG26Yam53G+vBZsAk
 Y2GA==
X-Gm-Message-State: AOAM533g8dAAK0ybZNohu7kzIUAjrqnQjwoQe5v9orieWlze7x9lVh3t
 /Puw4E2lelHulgK0cmIep+mUpQ==
X-Google-Smtp-Source: ABdhPJx2PiFO+bVt8FwHx7jFT762AVaMkoQ2aY0tZJ1LZSdXu3KJP7oFaqeQQPTPuEqluhV/4Q2+3A==
X-Received: by 2002:a05:6512:1293:: with SMTP id
 u19mr7205262lfs.218.1633492458405; 
 Tue, 05 Oct 2021 20:54:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s4sm2142967lfd.103.2021.10.05.20.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 20:54:17 -0700 (PDT)
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
Subject: [PATCH v1 08/15] pwrseq: pwrseq_qca: implement fallback support
Date: Wed,  6 Oct 2021 06:54:00 +0300
Message-Id: <20211006035407.1147909-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_205419_897028_8C36DC40 
X-CRM114-Status: GOOD (  18.45  )
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
 drivers/power/pwrseq/pwrseq_qca.c | 155 +++++++++++++++++++++++++++++-
 1 file changed, 154 insertions(+), 1 deletion(-)

diff --git a/drivers/power/pwrseq/pwrseq_qca.c b/drivers/power/pwrseq/pwrseq_qca.c
index c15508cc80d2..f237cf2f1880 100644
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
@@ -369,5 +371,156 @@ static struct platform_driver pwrseq_qca_driver = {
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
+	struct pwrseq *pwrseq;
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
+	pwrseq = devm_pwrseq_create(dev, &pwrseq_qca_ops);
+	if (IS_ERR(pwrseq))
+		return pwrseq;
+
+	pwrseq_set_drvdata(pwrseq, &fallback->qca_one);
+
+	return pwrseq;
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
