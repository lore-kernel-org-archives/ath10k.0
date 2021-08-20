Return-Path: <SRS0=JzU8=NL=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C7CC4338F
	for <ath10k@archiver.kernel.org>; Fri, 20 Aug 2021 08:51:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F184F6103A
	for <ath10k@archiver.kernel.org>; Fri, 20 Aug 2021 08:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F184F6103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+g/X0WmxrXy/oL2j8J+4N+s7MP2wfQFaBmvBNtwsie8=; b=prxqznYSHFqtHp
	oMA/5KU5zZ+uoSpnBXx8hxzQDmu8iYCyauKOBaP6V/IPsT/goLuhjxrpu5JzuEfRpsdYZooGR7bfi
	9twi/LVFN4aLTAZwYuIb0+/7KLOJAtrYUupStBj1ltxnYDIA5/bnBOLMtXsjFwhAl9UBmSR5jvCPt
	1gqt/Bfk4SNpLbBiT9mYr0kyVPakybUFA4rDQmIuH4n6ter9JffYGaG+2B2SJha1QvIRTBj2hJWuV
	EEvotjagMuDg6skCIiyBrt2VtI8Yy0VXB4YQ1BcmCXmREl2QoJbWSRS42UXTI+KTIaHiSs0XRtYuG
	+BRyvqEccaVe5LCrV9VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH0EI-00ART6-HH; Fri, 20 Aug 2021 08:50:22 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH0ED-00ARRx-6l
 for ath10k@lists.infradead.org; Fri, 20 Aug 2021 08:50:21 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id e18so188895qvo.1
 for <ath10k@lists.infradead.org>; Fri, 20 Aug 2021 01:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SvhAeR492M8EeJTTsM7VxBsaJ8w8PTYW6CNfHJ9BY2c=;
 b=dKLqKUJhPoyCJWDUu8gJmjjE0Wc3rdqQkmBcmfkwom8eSKEyeb8rOpa4aupFDqivwV
 VRU0qIuQrbVN0Ha4h5IF4dJMIt7G6fy8Ip/cpeCDRQx2J/VqQW28GSLRSHv2Jt0Dbcg7
 gkECVHdOZbmswNg9/PsZhRkVS0bXWp/UZ0nL5ET9j5+/DoAWCrAjkD/sP1HCYsxemvX7
 x7whEy0Hs49bDP4HdIYRvYY8oDAAE5CuZhvjCCAtkyC6AyZG2H1J5CCgJN8WeJcoMDwo
 2vAJYsgWHNjAi+R1OjOm7ppdpCeL4TmH1ILRGmwSQCSdM1NZvTkEBLdUO4YpS9c0clBQ
 Noag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SvhAeR492M8EeJTTsM7VxBsaJ8w8PTYW6CNfHJ9BY2c=;
 b=K2qinBDX5VOY9JKMSDU9OvsIxKXIDva6SVuzMlCxY6kmEUOg7hLKSEqD3r/nVkDMtn
 GjUXBz3MsACOJWVGBVuBtwws+LM4IRtlMU9D2wZJzP1JfYe6qiyRRlUbn/69STtb2BvW
 8rixwfRZ0RbzJs/yM9oFqRAWQyRP5ByFRTam5x7j6ncDzYMnhCluL3vHQgorO+lP1lJy
 JAvDMpH+wQI3Hcnz7w1YUFfWsLUve9YbftkKq3Ff8dMKv6gd8oJFJxLMuXMr8IYYVB6H
 HzlG1Ad6bm1arzMi+e7b7vDo4j8D4b5G9Q5aFEDHpinJZCIzVTN7tDzc7tVgwGL1AwVQ
 433g==
X-Gm-Message-State: AOAM532UUNK/IOiJrLmX9PKIuK6CxMqu6Kdybv+Hl8HsalO+oosw0l54
 fZHEU/A+9QTsBDL76bk4gtcrrDKRHLrn7PaxyrL2lg==
X-Google-Smtp-Source: ABdhPJy/QJn6fSqlmsALEyKeczIYJGYK90zosKS269iQJbHQVvas6xuChnmDApCtJxPNdNz0fntXs47ZI4/8W6cdsu4=
X-Received: by 2002:a05:6214:126:: with SMTP id
 w6mr18974742qvs.61.1629449415210; 
 Fri, 20 Aug 2021 01:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
 <20210817005507.1507580-15-dmitry.baryshkov@linaro.org>
 <YR7s2vK7jdUssx+A@ripper>
In-Reply-To: <YR7s2vK7jdUssx+A@ripper>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Aug 2021 11:50:04 +0300
Message-ID: <CAA8EJpptHqBR=deRaf72iGqXtWX5+3EgE4nKKGCPE7Cg9R0PBg@mail.gmail.com>
Subject: Re: [RFC PATCH 14/15] WIP: PCI: qcom: use pwrseq to power up bus
 devices
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
X-CRM114-CacheID: sfid-20210820_015017_324948_1B556A7C 
X-CRM114-Status: GOOD (  26.97  )
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

On Fri, 20 Aug 2021 at 02:43, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 16 Aug 17:55 PDT 2021, Dmitry Baryshkov wrote:
>
> > Use bus-pwrseq device tree node to power up the devices on the bus. This
> > is to be rewritten with the proper code parsing the device tree and
> > powering up individual devices.
> >
>
> How about describing the PCI device in DT and having the PCIe controller
> dig it up up from there? Although we won't have a struct device until
> later, so perhaps we need the of-based pwrseq_get() for that.

Yes, this is the plan. Currently I just wanted to have a way to power
up the PCIe part of the chip and be able to test that.
In the previous attempts to provide qca6390 support, Rob has clearly
stated that we'd have to have the following device tree snippet:

pcie0 {
    bridge@0,0 {
        qca6390@1,0 {
            supplies-or-whatever = ....;
        };
    };
};

>
> Regards,
> Bjorn
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom.c | 13 +++++++++++++
> >  drivers/power/pwrseq/pwrseq_qca.c      |  1 +
> >  2 files changed, 14 insertions(+)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 8a7a300163e5..a60d41fbcd6f 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -23,6 +23,7 @@
> >  #include <linux/pm_runtime.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/phy/phy.h>
> > +#include <linux/pwrseq/consumer.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/reset.h>
> >  #include <linux/slab.h>
> > @@ -1467,6 +1468,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
> >       struct pcie_port *pp;
> >       struct dw_pcie *pci;
> >       struct qcom_pcie *pcie;
> > +     struct pwrseq *pwrseq;
> >       int ret;
> >
> >       pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> > @@ -1520,6 +1522,17 @@ static int qcom_pcie_probe(struct platform_device *pdev)
> >
> >       pp->ops = &qcom_pcie_dw_ops;
> >
> > +     pwrseq = devm_pwrseq_get_optional(dev, "bus");
> > +     if (IS_ERR(pwrseq)) {
> > +             ret = PTR_ERR(pwrseq);
> > +             goto err_pm_runtime_put;
> > +     }
> > +     if (pwrseq) {
> > +             ret = pwrseq_full_power_on(pwrseq);
> > +             if (ret)
> > +                     goto err_pm_runtime_put;
> > +     }
> > +
> >       ret = phy_init(pcie->phy);
> >       if (ret) {
> >               pm_runtime_disable(&pdev->dev);
> > diff --git a/drivers/power/pwrseq/pwrseq_qca.c b/drivers/power/pwrseq/pwrseq_qca.c
> > index 3421a4821126..4107f0a9c05d 100644
> > --- a/drivers/power/pwrseq/pwrseq_qca.c
> > +++ b/drivers/power/pwrseq/pwrseq_qca.c
> > @@ -1,3 +1,4 @@
> > +#define DEBUG
> >  // SPDX-License-Identifier: GPL-2.0-only
> >  /*
> >   * Copyright (c) 2021, Linaro Ltd.
> > --
> > 2.30.2
> >



-- 
With best wishes
Dmitry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
