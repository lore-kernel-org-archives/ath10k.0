Return-Path: <SRS0=JzU8=NL=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96371C4338F
	for <ath10k@archiver.kernel.org>; Fri, 20 Aug 2021 08:11:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5034761037
	for <ath10k@archiver.kernel.org>; Fri, 20 Aug 2021 08:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5034761037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xi8Oy3me86SPfAPygC9qtFsU3dH73fRZmWmiw3QjsgM=; b=2eP2Vg4sNm6NNR
	hm665/FVTGWbLvQ6lGEuOXXg9e9+yX7MZbjw6s43J1chl9qpA5YdO8xwgUKZOKvAhFcOsYNc47VzZ
	qAC5dC03ZBYRAr9Vrb04aoGbnjEdL/zVWGThBHWNC6mAnmqP5FZzFU7ydGuXnkvvnlGoDvRC421vD
	iY3+motL6v847dc8YYb+z2x2HpIT7UOeLx8tRYC+FKb3IAdRBO2OcQpJakoz6jldz1EQxS5cTfBSo
	ho3EsmVmaZtPJwXWQS/TZsixpCpEV/Hj7qoSWP9R/OX5m5rTcQZtzhdANPAJrbBwW4PyQDJDaxAOi
	bQHW7Aq+N+PSv/DtyG8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGzc0-00AKfj-Jx; Fri, 20 Aug 2021 08:10:48 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGzbu-00AKey-CO
 for ath10k@lists.infradead.org; Fri, 20 Aug 2021 08:10:46 +0000
Received: by mail-qt1-x82a.google.com with SMTP id e15so6865441qtx.1
 for <ath10k@lists.infradead.org>; Fri, 20 Aug 2021 01:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g5IS6e3Hnyb2jRAb6f1KMnSZamwQJcSDoTsblYNlRlY=;
 b=AZ9hPtV94XSFU7TEKvhcU+et+rJ+GpExWH9lrUhoqWoy0ewHu2M34a/uO6l9DjkV3W
 f0oJk7nxCalOBi4OJVItLOhpuaLrPNMPtOlhahFsCqEnDmrPKqvI4ExcusqN0kmf2dmm
 X6aVP3hh5uVmOusZVgIhxqBCEvpuDtGXIU0bCJxnBEYFye8qFaFZb0rRPDeTD4tGclZw
 r6C1JJE68Lj5FmT8KeHnhA7VE0yN5hMhHlb84zbNqFmbhPEbOEPv33O68IOJr/4+cmXs
 8UuTDZzFcGnR83wrcms+xf3UQTABzatiaTOhd2YkS23GfoR9Q7lX2ajxwnwJ0ubC8bl1
 XkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g5IS6e3Hnyb2jRAb6f1KMnSZamwQJcSDoTsblYNlRlY=;
 b=OjB9M4iahIlQ8itfrtNnvf+txvV+0rWiG87cCANtrxF2MVsRJqD7ZPumX0GWQrWoYf
 PVx94WAaWr8pPtclajhkg7Ae+N2AcUbxLyScQw7oQYmC141OTrnV8diZlAhs6WukPyWE
 swp6Y+HaE26K7RE/YUDFbXT2P8I5PPw3nnkUv7uIGh+ELK5y4GoJvk+T7eAqfVHrhXat
 FQmBKxZ79TbvPW3ZypElVrc15ZNxIQe/9UNIrQgHx3RRdJ3A8FP7dfHq37bjbwlDbX4v
 UaTUcZmD+Aq6JKubU0HBa97yRuO+cMtFrc69ghQ9Wpq891y2+fVZCT53QD/SetWkowxY
 l94g==
X-Gm-Message-State: AOAM533O804rv/T9wO/ywx5sX/DQM6oJ8xD0JAirlSnzy4J0MP4SuRyC
 NgYOKCwLXcWRS/3GwZXdQ/JyxpPUZ+GI7Ax3O01Iig==
X-Google-Smtp-Source: ABdhPJykvHLGPJLrte3XmQ+2fZnjn7MpEKijpvU45xzTfUuHaBNaF5vvWd95j2y77Xi7ngLBiT0SX8r507FJf1UymdA=
X-Received: by 2002:a05:622a:13c8:: with SMTP id
 p8mr16634457qtk.238.1629447040101; 
 Fri, 20 Aug 2021 01:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
 <20210817005507.1507580-11-dmitry.baryshkov@linaro.org>
 <YR7m43mURVJ8YufC@ripper>
In-Reply-To: <YR7m43mURVJ8YufC@ripper>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Aug 2021 11:10:29 +0300
Message-ID: <CAA8EJpr+=Yg2B_DzQWntW0GgvBfaSpAu0K+UD3NowdkusiYxrQ@mail.gmail.com>
Subject: Re: [RFC PATCH 10/15] pwrseq: add support for QCA BT+WiFi power
 sequencer
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Stanimir Varbanov <svarbanov@mm-sol.com>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 linux-mmc@vger.kernel.org, 
 open list <linux-kernel@vger.kernel.org>, linux-bluetooth@vger.kernel.org, 
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_011042_497213_5A610B17 
X-CRM114-Status: GOOD (  24.81  )
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

Hi,

On Fri, 20 Aug 2021 at 02:17, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 16 Aug 17:55 PDT 2021, Dmitry Baryshkov wrote:
> [..]
> > diff --git a/drivers/power/pwrseq/pwrseq_qca.c b/drivers/power/pwrseq/pwrseq_qca.c
> > new file mode 100644
> > index 000000000000..3421a4821126
> > --- /dev/null
> > +++ b/drivers/power/pwrseq/pwrseq_qca.c
> > @@ -0,0 +1,290 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2021, Linaro Ltd.
> > + *
> > + * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > + *
> > + * Power Sequencer for Qualcomm WiFi + BT SoCs
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pwrseq/driver.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +/*
> > + * Voltage regulator information required for configuring the
> > + * QCA WiFi+Bluetooth chipset
> > + */
> > +struct qca_vreg {
> > +     const char *name;
> > +     unsigned int load_uA;
> > +};
> > +
> > +struct qca_device_data {
> > +     struct qca_vreg vddio;
>
> Any particular reason why this isn't just the first entry in vregs and
> operated as part of the bulk API?

Because VDDIO should be up before bringing the rest of the power
sources (at least for wcn39xx). This is usually the case since VDDIO
is S4A, but I'd still prefer to express this in the code.
And register_bulk_enable powers up all the supplies asynchronously,
thus it can not guarantee that the first entry would be powered up
first.

>
> > +     struct qca_vreg *vregs;
> > +     size_t num_vregs;
> > +     bool has_bt_en;
> > +     bool has_wifi_en;
> > +};
> > +
> > +struct pwrseq_qca;
> > +struct pwrseq_qca_one {
> > +     struct pwrseq_qca *common;
> > +     struct gpio_desc *enable;
> > +};
> > +
> > +#define PWRSEQ_QCA_WIFI 0
> > +#define PWRSEQ_QCA_BT 1
> > +
> > +#define PWRSEQ_QCA_MAX 2
> > +
> > +struct pwrseq_qca {
> > +     struct regulator *vddio;
> > +     struct gpio_desc *sw_ctrl;
> > +     struct pwrseq_qca_one pwrseq_qcas[PWRSEQ_QCA_MAX];
> > +     int num_vregs;
> > +     struct regulator_bulk_data vregs[];
> > +};
> > +
> > +static int pwrseq_qca_power_on(struct pwrseq *pwrseq)
> > +{
> > +     struct pwrseq_qca_one *qca_one = pwrseq_get_data(pwrseq);
> > +     int ret;
> > +
> > +     if (qca_one->common->vddio) {
>
> devm_regulator_get() doesn't return NULL, so this is always true.

This is more of the safety guard for the cases when the qca doesn't
have the special vddio supply.

>
> > +             ret = regulator_enable(qca_one->common->vddio);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     ret = regulator_bulk_enable(qca_one->common->num_vregs, qca_one->common->vregs);
> > +     if (ret)
> > +             goto vddio_off;
> > +
> > +     if (qca_one->enable) {
> > +             gpiod_set_value_cansleep(qca_one->enable, 0);
> > +             msleep(50);
> > +             gpiod_set_value_cansleep(qca_one->enable, 1);
> > +             msleep(150);
> > +     }
> > +
> > +     if (qca_one->common->sw_ctrl) {
> > +             bool sw_ctrl_state = gpiod_get_value_cansleep(qca_one->common->sw_ctrl);
> > +             dev_dbg(&pwrseq->dev, "SW_CTRL is %d", sw_ctrl_state);
> > +     }
> > +
> > +     return 0;
> > +
> > +vddio_off:
> > +     regulator_disable(qca_one->common->vddio);
> > +
> > +     return ret;
> > +}
> [..]
> > +static int pwrseq_qca_probe(struct platform_device *pdev)
> > +{
> > +     struct pwrseq_qca *pwrseq_qca;
> > +     struct pwrseq *pwrseq;
> > +     struct pwrseq_provider *provider;
> > +     struct device *dev = &pdev->dev;
> > +     struct pwrseq_onecell_data *onecell;
> > +     const struct qca_device_data *data;
> > +     int ret, i;
> > +
> > +     data = device_get_match_data(dev);
> > +     if (!data)
> > +             return -EINVAL;
> > +
> > +     pwrseq_qca = devm_kzalloc(dev, struct_size(pwrseq_qca, vregs, data->num_vregs), GFP_KERNEL);
> > +     if (!pwrseq_qca)
> > +             return -ENOMEM;
> > +
> > +     onecell = devm_kzalloc(dev, struct_size(onecell, pwrseqs, PWRSEQ_QCA_MAX), GFP_KERNEL);
> > +     if (!onecell)
> > +             return -ENOMEM;
> > +
> > +     ret = pwrseq_qca_regulators_init(dev, pwrseq_qca, data);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (data->has_wifi_en) {
> > +             pwrseq_qca->pwrseq_qcas[PWRSEQ_QCA_WIFI].enable = devm_gpiod_get(dev, "wifi-enable", GPIOD_OUT_LOW);
> > +             if (IS_ERR(pwrseq_qca->pwrseq_qcas[PWRSEQ_QCA_WIFI].enable)) {
> > +                     return dev_err_probe(dev, PTR_ERR(pwrseq_qca->pwrseq_qcas[PWRSEQ_QCA_WIFI].enable),
> > +                                     "failed to acquire WIFI enable GPIO\n");
> > +             }
> > +     }
> > +
> > +     if (data->has_bt_en) {
> > +             pwrseq_qca->pwrseq_qcas[PWRSEQ_QCA_BT].enable = devm_gpiod_get(dev, "bt-enable", GPIOD_OUT_LOW);
> > +             if (IS_ERR(pwrseq_qca->pwrseq_qcas[PWRSEQ_QCA_BT].enable)) {
> > +                     return dev_err_probe(dev, PTR_ERR(pwrseq_qca->pwrseq_qcas[PWRSEQ_QCA_BT].enable),
> > +                                     "failed to acquire BT enable GPIO\n");
> > +             }
> > +     }
> > +
> > +     pwrseq_qca->sw_ctrl = devm_gpiod_get_optional(dev, "swctrl", GPIOD_IN);
> > +     if (IS_ERR(pwrseq_qca->sw_ctrl)) {
> > +             return dev_err_probe(dev, PTR_ERR(pwrseq_qca->sw_ctrl),
> > +                             "failed to acquire SW_CTRL gpio\n");
> > +     } else if (!pwrseq_qca->sw_ctrl)
> > +             dev_info(dev, "No SW_CTRL gpio\n");
>
> Some {} around the else as well please.

ack

>
> Regards,
> Bjorn



-- 
With best wishes
Dmitry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
