Return-Path: <SRS0=eXlr=NK=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C185C4338F
	for <ath10k@archiver.kernel.org>; Thu, 19 Aug 2021 23:36:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20FBD6108F
	for <ath10k@archiver.kernel.org>; Thu, 19 Aug 2021 23:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20FBD6108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aFBl5gNRYwFOYQJCd26GJhk7MdY54OFP/QK0wivtsgo=; b=DX/zLVis84/92b
	N1OcBR2NmrG1daHVDAwwv6nbA1vr0hcihk82PQ+nYYasYB9fqCJHzMlnx6z2Q3SnM/iq5q6LVfmeL
	vpwG7k+N4xlKpBghPu63p3VAcimkW4vHjXq9aZk1Ni08oEl1yKHD3/5m+UEiKwkBHzYZhx5+1jumd
	9so0X8KbHdHOfTPDH7unTQh8n2GOmM24TAV/NEPv0sr+iXbEKWLZD2/0I8kkyp17TrMRFaP7Vqjs/
	8DgXhQwHrY38qq+idNFDtax2B3iQon7J/ERFQzsIMO/l1yYZmunXAoiZXITmDlAiNj8rR+5qCNMhZ
	8Ipr5WtfoktKCoqWTEFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGraF-009kwD-Qs; Thu, 19 Aug 2021 23:36:27 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGraA-009kvV-6E
 for ath10k@lists.infradead.org; Thu, 19 Aug 2021 23:36:26 +0000
Received: by mail-oi1-x236.google.com with SMTP id n27so10847314oij.0
 for <ath10k@lists.infradead.org>; Thu, 19 Aug 2021 16:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HTR1NAMnxq8tF5WhlJMpotqIGROeP6GqPvumdcju0fo=;
 b=MOe0Xa5k++pyt5Bm2ing/pbqT0IawY7nGsBZmbMlHPjnYPM1WrHVKWCMIr7HQhtCJq
 OX6dGUUq9zlTj1tO7r6hyQu1oNrmJvT3/RqeDXmJf0wZi9neVohctcYj/z0nVCuDyLU5
 uVWz/XpZjWrcHsAiHuoAMTq4xh1+ub6Wjho6DQcXQGNSmlicUeR8CJMuV7CUdx+pTq3n
 zdR/EJevxLLwqj50b/QBw7u8mvDdc3xb9j4oizi0ZuRDj3ZkMgvj4beZCQar+zO6fU7G
 qIeFzfLtvOy9UghbjQmaIPjHB0N7bza7buN5JPqmyCFnpkvW0ZTvIQZqp2IWcNPitIx5
 CotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HTR1NAMnxq8tF5WhlJMpotqIGROeP6GqPvumdcju0fo=;
 b=IIJr76VBo7XaPYOg9MVQFrfBkHmOUgD16vndnhMO45ixVh07p7qsEslCB1fLZmmoFV
 RgzSWozv59LUGm8KyatgBKITxdLKmIPy+ctF4i+095qhIX1rXzcFY+MYoDdTivhHZy7o
 vF55UJIzY7EY7nlPpkOqujfERk1H/Xivq6umRAsVQc8g72WGfGmDIGG/ukzjXAZTmqwM
 RVPZv3TNxgIb3U0Zg3Wl70SCwiAD66RJ7+h1Voa15F898/anuoDLWdGE/sL8eJzuXFkg
 CCx3tAZhUPsWuLmDx4vXRvvmKsPsYsw0ZrpVbjGiYoXTVJr1hmZbEFBTyt29Gy/ckfFB
 zxGw==
X-Gm-Message-State: AOAM531yJcjRFNViERiBIdnhXica1NAFO3Gt0cBDL81yeYTHbuFlr8hd
 Jsdc80P9KVqfCGIbT9bTB6xL6Q==
X-Google-Smtp-Source: ABdhPJwkI1cWOTvjEK/I228vAx5ccb8Ct2GItdTUAVPg5QglnTuNyRrVow9whuDHmMaZY1eXTyR9Lg==
X-Received: by 2002:aca:3e45:: with SMTP id l66mr897856oia.79.1629416181184;
 Thu, 19 Aug 2021 16:36:21 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id v19sm948301oic.31.2021.08.19.16.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 16:36:20 -0700 (PDT)
Date: Thu, 19 Aug 2021 16:37:43 -0700
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
Subject: Re: [RFC PATCH 01/15] power: add power sequencer subsystem
Message-ID: <YR7rR6d4nSRea1oX@ripper>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
 <20210817005507.1507580-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817005507.1507580-2-dmitry.baryshkov@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_163622_284475_4050D26A 
X-CRM114-Status: GOOD (  22.46  )
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

On Mon 16 Aug 17:54 PDT 2021, Dmitry Baryshkov wrote:

> Basing on MMC's pwrseq support code, add separate power sequencer
> subsystem. It will be used by other drivers to handle device power up
> requirements.
> 

Some more background to why we need a pwrseq framework wouldn't hurt.

[..]
> diff --git a/drivers/power/pwrseq/core.c b/drivers/power/pwrseq/core.c
> new file mode 100644
> index 000000000000..20485cae29aa
> --- /dev/null
> +++ b/drivers/power/pwrseq/core.c
> @@ -0,0 +1,411 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright 2021 (c) Linaro Ltd.
> +// Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +//
> +// Based on phy-core.c:
> +// Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com

The typical format is:

// SPDX using C++ style comment
/*
 * Copyright stuff using C style comment
 */

> +
> +#include <linux/device.h>
> +#include <linux/idr.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/pwrseq/consumer.h>
> +#include <linux/pwrseq/driver.h>
> +#include <linux/slab.h>
> +
> +#define	to_pwrseq(a)	(container_of((a), struct pwrseq, dev))

No need for the extra parenthesis around container_of()

> +
> +static DEFINE_IDA(pwrseq_ida);
> +static DEFINE_MUTEX(pwrseq_provider_mutex);
> +static LIST_HEAD(pwrseq_provider_list);
> +
> +struct pwrseq_provider {
> +	struct device		*dev;
> +	struct module		*owner;
> +	struct list_head	list;
> +	void			*data;
> +	struct pwrseq * (*of_xlate)(void *data, struct of_phandle_args *args);
> +};
> +
> +void pwrseq_put(struct device *dev, struct pwrseq *pwrseq)
> +{
> +	device_link_remove(dev, &pwrseq->dev);
> +
> +	module_put(pwrseq->owner);
> +	put_device(&pwrseq->dev);
> +}
> +EXPORT_SYMBOL_GPL(pwrseq_put);
> +
> +static struct pwrseq_provider *of_pwrseq_provider_lookup(struct device_node *node)
> +{
> +	struct pwrseq_provider *pwrseq_provider;
> +
> +	list_for_each_entry(pwrseq_provider, &pwrseq_provider_list, list) {
> +		if (pwrseq_provider->dev->of_node == node)
> +			return pwrseq_provider;
> +	}
> +
> +	return ERR_PTR(-EPROBE_DEFER);
> +}
> +
> +static struct pwrseq *_of_pwrseq_get(struct device *dev, const char *id)
> +{
> +	struct pwrseq_provider *pwrseq_provider;
> +	struct pwrseq *pwrseq;
> +	struct of_phandle_args args;
> +	char prop_name[64]; /* 64 is max size of property name */
> +	int ret;
> +
> +	snprintf(prop_name, 64, "%s-pwrseq", id);

sizeof(prop_name), to avoid giving others a chance to "fix" it later?

> +	ret = of_parse_phandle_with_args(dev->of_node, prop_name, "#pwrseq-cells", 0, &args);
> +	if (ret) {
> +		struct device_node *dn;
> +
> +		/*
> +		 * Parsing failed. Try locating old bindings for mmc-pwrseq,
> +		 * which did not use #pwrseq-cells.
> +		 */
> +		if (strcmp(id, "mmc"))
> +			return ERR_PTR(-ENODEV);
> +
> +		dn = of_parse_phandle(dev->of_node, prop_name, 0);
> +		if (!dn)
> +			return ERR_PTR(-ENODEV);
> +
> +		args.np = dn;
> +		args.args_count = 0;
> +	}
> +
> +	mutex_lock(&pwrseq_provider_mutex);
> +	pwrseq_provider = of_pwrseq_provider_lookup(args.np);
> +	if (IS_ERR(pwrseq_provider) || !try_module_get(pwrseq_provider->owner)) {
> +		pwrseq = ERR_PTR(-EPROBE_DEFER);
> +		goto out_unlock;
> +	}
> +
> +	if (!of_device_is_available(args.np)) {
> +		dev_warn(pwrseq_provider->dev, "Requested pwrseq is disabled\n");
> +		pwrseq = ERR_PTR(-ENODEV);
> +		goto out_put_module;
> +	}
> +
> +	pwrseq = pwrseq_provider->of_xlate(pwrseq_provider->data, &args);
> +
> +out_put_module:
> +	module_put(pwrseq_provider->owner);
> +
> +out_unlock:
> +	mutex_unlock(&pwrseq_provider_mutex);
> +	of_node_put(args.np);
> +
> +	return pwrseq;
> +}
> +
[..]
> +int pwrseq_pre_power_on(struct pwrseq *pwrseq)
> +{
> +	if (pwrseq && pwrseq->ops->pre_power_on)
> +		return pwrseq->ops->pre_power_on(pwrseq);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(pwrseq_pre_power_on);
> +
> +int pwrseq_power_on(struct pwrseq *pwrseq)

Wouldn't it make sense to refcount the power on/off operations and at
least warn about unbalanced disables?

My concern is related to the qca-driver's reliance on the regulator
framework to refcount the on/off of the shared resources and additional
power_off from either the WiFi or BT client would result in the other
client getting its power disabled unexpectedly - which might be
annoying to debug.

> +{
> +	if (pwrseq && pwrseq->ops->power_on)
> +		return pwrseq->ops->power_on(pwrseq);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(pwrseq_power_on);
> +
> +void pwrseq_power_off(struct pwrseq *pwrseq)
> +{
> +	if (pwrseq && pwrseq->ops->power_off)
> +		pwrseq->ops->power_off(pwrseq);
> +}
> +EXPORT_SYMBOL_GPL(pwrseq_power_off);
> +
> +void pwrseq_reset(struct pwrseq *pwrseq)
> +{
> +	if (pwrseq && pwrseq->ops->reset)
> +		pwrseq->ops->reset(pwrseq);
> +}
> +EXPORT_SYMBOL_GPL(pwrseq_reset);
> +

Regards,
Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
