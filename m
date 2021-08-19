Return-Path: <SRS0=eXlr=NK=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0398DC4338F
	for <ath10k@archiver.kernel.org>; Thu, 19 Aug 2021 23:18:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEBDA61056
	for <ath10k@archiver.kernel.org>; Thu, 19 Aug 2021 23:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BEBDA61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mY1HjVMqEDsEkmDtdw4nCDLZRKFd2zV6WiUYMsrAJ7g=; b=WPFA9ZY9QxJ9Hu
	omM5rSby9urln1lSeo0sG1VNFpHn5GKGKboUnadh0bkfynRqON4KFleanVq+7nwuQacNIkcg9D7lw
	XjJ6zpyoDV3iu3ip0b0t5qohImZv9tj0Ta5bdcNEVlhvDAV+B4kWxejDSKheANw/mnzmq6I8pkNJa
	SxQMGEUUxCSRvjs9uYHuFkvgxSBGZg2l2XjV9VfwkPPB2Z7/NpDtRGbROhX1nZ0v7EM30owyjlU2R
	t/CMLnwAhOjHxNNFpT2V9adMQsSQ38v8bxi/d+CuDMsRO+10rXTntnKPhw3rGNabrRF5AJZ4xGXap
	95ZX53Gfl9XOK3GgK7Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGrIA-009imP-Bk; Thu, 19 Aug 2021 23:17:46 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGrI2-009ij8-DS
 for ath10k@lists.infradead.org; Thu, 19 Aug 2021 23:17:45 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 r38-20020a05683044a600b0051a2c6dd421so10789973otv.3
 for <ath10k@lists.infradead.org>; Thu, 19 Aug 2021 16:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dqgoJAQz3Mv7B0ZEGRvtaCqkcK4kqu5N3VSB9Do7xY4=;
 b=BMf23iSlOWarU9fDcULweKVfxlosd41Wfztfxi8DOr0ErrJ2WhFuCCJdroa4O3U6Y4
 Ornh+yHcbZUTjYugKoCBoMvCuzIam6M+JCV2WGHWTCt5Q87DYpGvI7XiogoqjDWvdBJq
 ndpRW8alwfoz9eRtKWAiyOOYuHxpm070gdIkFjgkcZQRsAYJhwuC10wddFnkpuuDXvId
 SdgUNgerTBW5jnZEmujJEh18/L85559JS7Mgk3us3PqXvJEoQFq08GdIqS/f1/cl8knE
 ZpLOcgtVLfQjQa1B0gpCqgHYebtUQqbo4TIy1POmSREhzGqokLYnjGXFMZKWIgQ4FXh5
 C37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dqgoJAQz3Mv7B0ZEGRvtaCqkcK4kqu5N3VSB9Do7xY4=;
 b=cXOn9EfaIxIteo/wUxmJ9/UreKcaKUl2NostOGFEL2p1qZ8Afql6G81m75iiNP9CAz
 q9vJgFd6i2yawhreEHd9t1ZFWwITWTZSPCioijs05RNkoYC0G95i4l+FnM01bniHGT3i
 0FQh7tBvtSE5sj/GKtBN6VCYKe9DN3EYeU5VZQh64IvWpofznK+oeUDME9p9hqMSRDyT
 CdEn+Uxa8+xw5YavtnxgmMYJcFwZ8McsDWWs5JF6/unZIw+gqQsghyTUZCkMtDzXIIrL
 LW+L97uHHJGiTvlbmAP/I1Jz3JlAG71i2+vyEJFLfu5xn05dOrK1KJga+vP7W8O+sdvu
 iTIw==
X-Gm-Message-State: AOAM532X7DTQzCkv/0vXQdFdE2sGEc/JaDUNwqJbZUqDeJzKuU7DaO/G
 FOfezBATsYZ96VEHc0mw8iRktw==
X-Google-Smtp-Source: ABdhPJyW/PO0aRB2JhV3QSCv+CbV97dGiXbm6pwAyuaGcZ90eIfRAKlNSig9OcjkDtMHhlGDTPhK9g==
X-Received: by 2002:a9d:bec:: with SMTP id 99mr13825165oth.187.1629415056421; 
 Thu, 19 Aug 2021 16:17:36 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id z26sm971827oih.3.2021.08.19.16.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 16:17:36 -0700 (PDT)
Date: Thu, 19 Aug 2021 16:18:59 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [RFC PATCH 10/15] pwrseq: add support for QCA BT+WiFi power
 sequencer
Message-ID: <YR7m43mURVJ8YufC@ripper>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
 <20210817005507.1507580-11-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817005507.1507580-11-dmitry.baryshkov@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_161738_540940_64161AF7 
X-CRM114-Status: GOOD (  19.68  )
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

On Mon 16 Aug 17:55 PDT 2021, Dmitry Baryshkov wrote:
[..]
> diff --git a/drivers/power/pwrseq/pwrseq_qca.c b/drivers/power/pwrseq/pwrseq_qca.c
> new file mode 100644
> index 000000000000..3421a4821126
> --- /dev/null
> +++ b/drivers/power/pwrseq/pwrseq_qca.c
> @@ -0,0 +1,290 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021, Linaro Ltd.
> + *
> + * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> + *
> + * Power Sequencer for Qualcomm WiFi + BT SoCs
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/pwrseq/driver.h>
> +#include <linux/regulator/consumer.h>
> +
> +/*
> + * Voltage regulator information required for configuring the
> + * QCA WiFi+Bluetooth chipset
> + */
> +struct qca_vreg {
> +	const char *name;
> +	unsigned int load_uA;
> +};
> +
> +struct qca_device_data {
> +	struct qca_vreg vddio;

Any particular reason why this isn't just the first entry in vregs and
operated as part of the bulk API?

> +	struct qca_vreg *vregs;
> +	size_t num_vregs;
> +	bool has_bt_en;
> +	bool has_wifi_en;
> +};
> +
> +struct pwrseq_qca;
> +struct pwrseq_qca_one {
> +	struct pwrseq_qca *common;
> +	struct gpio_desc *enable;
> +};
> +
> +#define PWRSEQ_QCA_WIFI 0
> +#define PWRSEQ_QCA_BT 1
> +
> +#define PWRSEQ_QCA_MAX 2
> +
> +struct pwrseq_qca {
> +	struct regulator *vddio;
> +	struct gpio_desc *sw_ctrl;
> +	struct pwrseq_qca_one pwrseq_qcas[PWRSEQ_QCA_MAX];
> +	int num_vregs;
> +	struct regulator_bulk_data vregs[];
> +};
> +
> +static int pwrseq_qca_power_on(struct pwrseq *pwrseq)
> +{
> +	struct pwrseq_qca_one *qca_one = pwrseq_get_data(pwrseq);
> +	int ret;
> +
> +	if (qca_one->common->vddio) {

devm_regulator_get() doesn't return NULL, so this is always true.

> +		ret = regulator_enable(qca_one->common->vddio);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(qca_one->common->num_vregs, qca_one->common->vregs);
> +	if (ret)
> +		goto vddio_off;
> +
> +	if (qca_one->enable) {
> +		gpiod_set_value_cansleep(qca_one->enable, 0);
> +		msleep(50);
> +		gpiod_set_value_cansleep(qca_one->enable, 1);
> +		msleep(150);
> +	}
> +
> +	if (qca_one->common->sw_ctrl) {
> +		bool sw_ctrl_state = gpiod_get_value_cansleep(qca_one->common->sw_ctrl);
> +		dev_dbg(&pwrseq->dev, "SW_CTRL is %d", sw_ctrl_state);
> +	}
> +
> +	return 0;
> +
> +vddio_off:
> +	regulator_disable(qca_one->common->vddio);
> +
> +	return ret;
> +}
[..]
> +static int pwrseq_qca_probe(struct platform_device *pdev)
> +{
> +	struct pwrseq_qca *pwrseq_qca;
> +	struct pwrseq *pwrseq;
> +	struct pwrseq_provider *provider;
> +	struct device *dev = &pdev->dev;
> +	struct pwrseq_onecell_data *onecell;
> +	const struct qca_device_data *data;
> +	int ret, i;
> +
> +	data = device_get_match_data(dev);
> +	if (!data)
> +		return -EINVAL;
> +
> +	pwrseq_qca = devm_kzalloc(dev, struct_size(pwrseq_qca, vregs, data->num_vregs), GFP_KERNEL);
> +	if (!pwrseq_qca)
> +		return -ENOMEM;
> +
> +	onecell = devm_kzalloc(dev, struct_size(onecell, pwrseqs, PWRSEQ_QCA_MAX), GFP_KERNEL);
> +	if (!onecell)
> +		return -ENOMEM;
> +
> +	ret = pwrseq_qca_regulators_init(dev, pwrseq_qca, data);
> +	if (ret)
> +		return ret;
> +
> +	if (data->has_wifi_en) {
> +		pwrseq_qca->pwrseq_qcas[PWRSEQ_QCA_WIFI].enable = devm_gpiod_get(dev, "wifi-enable", GPIOD_OUT_LOW);
> +		if (IS_ERR(pwrseq_qca->pwrseq_qcas[PWRSEQ_QCA_WIFI].enable)) {
> +			return dev_err_probe(dev, PTR_ERR(pwrseq_qca->pwrseq_qcas[PWRSEQ_QCA_WIFI].enable),
> +					"failed to acquire WIFI enable GPIO\n");
> +		}
> +	}
> +
> +	if (data->has_bt_en) {
> +		pwrseq_qca->pwrseq_qcas[PWRSEQ_QCA_BT].enable = devm_gpiod_get(dev, "bt-enable", GPIOD_OUT_LOW);
> +		if (IS_ERR(pwrseq_qca->pwrseq_qcas[PWRSEQ_QCA_BT].enable)) {
> +			return dev_err_probe(dev, PTR_ERR(pwrseq_qca->pwrseq_qcas[PWRSEQ_QCA_BT].enable),
> +					"failed to acquire BT enable GPIO\n");
> +		}
> +	}
> +
> +	pwrseq_qca->sw_ctrl = devm_gpiod_get_optional(dev, "swctrl", GPIOD_IN);
> +	if (IS_ERR(pwrseq_qca->sw_ctrl)) {
> +		return dev_err_probe(dev, PTR_ERR(pwrseq_qca->sw_ctrl),
> +				"failed to acquire SW_CTRL gpio\n");
> +	} else if (!pwrseq_qca->sw_ctrl)
> +		dev_info(dev, "No SW_CTRL gpio\n");

Some {} around the else as well please.

Regards,
Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
