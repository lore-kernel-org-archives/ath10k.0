Return-Path: <SRS0=eXlr=NK=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD64C4338F
	for <ath10k@archiver.kernel.org>; Thu, 19 Aug 2021 23:43:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 921B36108F
	for <ath10k@archiver.kernel.org>; Thu, 19 Aug 2021 23:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 921B36108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vviOjtmcogc3rXR35Q0vUvI8974pZlBGbum/8ab9RjU=; b=xnpHK6FGR5A5fc
	tSiY1pKC4nuqKC0rxDmnedTj0PSoj2VGIPrH12u8aEcj2EJswI8/u8Xu0wThqVqx+IN5OM/r3w0cd
	gsORSXDDgBo/p9RR9YPBfw4dH94zJVX4VXxbgwDysOz0eW7O6476aNnAxVcZlqjXUK6V7jDRIIGl8
	6ROrEM6IaaZy7mfg/eOmHGpQx4d0hDv+Ruod9iBEfLPWHKW22W1DtozNdXi6lx0SZpwXkPBGlJ6qr
	LzuZEO4a1Y6Z3wr6yrig2nMUuw7pUHeGFyQjY8piu8QWUA6GnRQOnB+O5QuCbpkv+UrHKCFz0m8YE
	K1h33yCSQ78qHQIk4YTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGrgk-009lT7-83; Thu, 19 Aug 2021 23:43:10 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGrge-009lSA-Ge
 for ath10k@lists.infradead.org; Thu, 19 Aug 2021 23:43:08 +0000
Received: by mail-oi1-x22f.google.com with SMTP id n27so10866086oij.0
 for <ath10k@lists.infradead.org>; Thu, 19 Aug 2021 16:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8LHZxCEWR5/C4vnwOrp7U43kFfte1OHNOyXMODVHA5A=;
 b=eElLfnhKFd3yW9Uwfwg4ay/PWquxMgQp7A3/vCvgyeg+XrrSjsvEM1fvDeQ6ftAim6
 8+ntIVwMzPYywiaGr/seW2o4K+wIinmrS0eHMHyszkSDtqcpnlzpTPiapaoE/U17o7rU
 yO4YU7xRue4Vtzvvg4bq3iNNHFPdCE762BxVmGuSoJno/QV3EEhly0VHleUjEojGJaDN
 dTun/wU4p3/n5/+OkIYIFQNTsuyTK9OZ+uJ14qe0k2CwQRc1Bj4XJEXlNdn5yeAXxgCs
 Q+/WXhEBjdWiXi/qQHavSWMrMZ9OUUiUqa4BO7xZJzc9KQpFYVDqTX7emoc0ycEU6b7c
 wa/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8LHZxCEWR5/C4vnwOrp7U43kFfte1OHNOyXMODVHA5A=;
 b=NW5ZnrZnHoy9MDMPgC/ef/JYXwVzRldHwP2RotgkgQFQHb/HTfn0YkuQfOtWKwzULb
 jglvavw1ALmOq3wU8inB0KlumAJFiA9OyeBmEJVQRWrutZAWRvn9NQsEu65FPTSHeqbX
 AP0g+FfcAtrX6Uuh0w5pbgki5mBEdhpN6mKWrA1txwW3IULK/j2aZymp/Ac6QJsB2zxS
 eyxwxF79ltf7/aiG5RC39yCtOQrxmlS3Sb8gopPexvzOJalYNiv3MaB404iWUtnEY218
 QLaqT9Z/BH/l72P62UoYWoQWILYczmrakC+AYar3R7W8eYq7HCDl51q5+vO885MyMEmk
 L8rw==
X-Gm-Message-State: AOAM532k8EQ/y3dQUFIGZTf80C5K42Nu7rFZ0UeUMfS1+QcG8MjDqeRR
 obs4PYljLbmlf3jmBv9rmTV91g==
X-Google-Smtp-Source: ABdhPJw1Q4apWWBHVYYvewNXXvqK3Xr2GzQSAu+2VXBrcwCXMXMTH9UZhRAI49Wn+01q1dGlrCzfkA==
X-Received: by 2002:aca:1308:: with SMTP id e8mr926649oii.15.1629416583563;
 Thu, 19 Aug 2021 16:43:03 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id w14sm1040972otl.58.2021.08.19.16.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 16:43:03 -0700 (PDT)
Date: Thu, 19 Aug 2021 16:44:26 -0700
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
Subject: Re: [RFC PATCH 14/15] WIP: PCI: qcom: use pwrseq to power up bus
 devices
Message-ID: <YR7s2vK7jdUssx+A@ripper>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
 <20210817005507.1507580-15-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817005507.1507580-15-dmitry.baryshkov@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_164304_607364_4E397D2C 
X-CRM114-Status: GOOD (  21.66  )
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

> Use bus-pwrseq device tree node to power up the devices on the bus. This
> is to be rewritten with the proper code parsing the device tree and
> powering up individual devices.
> 

How about describing the PCI device in DT and having the PCIe controller
dig it up up from there? Although we won't have a struct device until
later, so perhaps we need the of-based pwrseq_get() for that.

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 13 +++++++++++++
>  drivers/power/pwrseq/pwrseq_qca.c      |  1 +
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 8a7a300163e5..a60d41fbcd6f 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -23,6 +23,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
> @@ -1467,6 +1468,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  	struct pcie_port *pp;
>  	struct dw_pcie *pci;
>  	struct qcom_pcie *pcie;
> +	struct pwrseq *pwrseq;
>  	int ret;
>  
>  	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> @@ -1520,6 +1522,17 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  
>  	pp->ops = &qcom_pcie_dw_ops;
>  
> +	pwrseq = devm_pwrseq_get_optional(dev, "bus");
> +	if (IS_ERR(pwrseq)) {
> +		ret = PTR_ERR(pwrseq);
> +		goto err_pm_runtime_put;
> +	}
> +	if (pwrseq) {
> +		ret = pwrseq_full_power_on(pwrseq);
> +		if (ret)
> +			goto err_pm_runtime_put;
> +	}
> +
>  	ret = phy_init(pcie->phy);
>  	if (ret) {
>  		pm_runtime_disable(&pdev->dev);
> diff --git a/drivers/power/pwrseq/pwrseq_qca.c b/drivers/power/pwrseq/pwrseq_qca.c
> index 3421a4821126..4107f0a9c05d 100644
> --- a/drivers/power/pwrseq/pwrseq_qca.c
> +++ b/drivers/power/pwrseq/pwrseq_qca.c
> @@ -1,3 +1,4 @@
> +#define DEBUG
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (c) 2021, Linaro Ltd.
> -- 
> 2.30.2
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
