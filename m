Return-Path: <SRS0=JzU8=NL=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9F4C4338F
	for <ath10k@archiver.kernel.org>; Fri, 20 Aug 2021 16:35:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC0566113E
	for <ath10k@archiver.kernel.org>; Fri, 20 Aug 2021 16:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC0566113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0lnFAq3jopNbuZOMXxx1Jd4h74urZuKTH0UcGdJhuXk=; b=E1Agpw3CsikEjt
	+dSiJDEBOMd0aBUo69zP+Uxh1EQxHt0AQg2r0RbZIrDmmBxW86Oagzbg5dyOLmkDFKPhvgvpM0iSc
	DPB2JXhfLSmpFxe9iRChSdeghIuupGmQETJEVyzp54GFevgAMT/56RixzuOaiWjiPmml3BKEtSyDv
	5SILy3tx/vjXlnc2BVS9ZRmYgWDetCLaD7/CGcGqun3KLVGhZwjYyf1/ewOfuDUsLKv1SyE3FKMxY
	l210VOO+fcw0gQbKYugs4LTYO2dNLnLrU4YzWVatj6Cpa1shRbpwkK7nrj0GrQ9vchOt30QplDApq
	AlCkXUnIsaYHmHEE6hSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH7T3-00BeGJ-8a; Fri, 20 Aug 2021 16:34:05 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH7Sy-00BeFf-Df
 for ath10k@lists.infradead.org; Fri, 20 Aug 2021 16:34:04 +0000
Received: by mail-ot1-x334.google.com with SMTP id
 h63-20020a9d14450000b02904ce97efee36so14995907oth.7
 for <ath10k@lists.infradead.org>; Fri, 20 Aug 2021 09:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/C8NeHo7GpZkUH1MXjk90wBsd8C6uuIwq8RGb1Hq5vo=;
 b=IZP6XmBG5SL2HxTLGkkDDx0/FLxPIdyJJdRIudKqB/cJ5PKq6qEgam/BDbPyMLfM7f
 0zg2lzUj8Xj4r6szTG6ovaYq+wgcPJhiyYiEed/J/YvFOCeyQytIO8nfzLWzRO9wn5y/
 RYFQhWyBWqpIh7r+V2m8XKlZDol/Dz1Ls5qJGa+LUgPV74FcDLUpFTLELob79i2r4t2Z
 7IVd9RkjubFRtkRPkv/3eOTKPUmKLUhfnfVKuUEtfupfUuv5Cc6AJD1qY2Nfu74lypAZ
 NWx69F5Bm/YiQ14jsu+6OnJ/QvCKOiwflMtD3A/w2W2cADV+eD2Bt6hx8RqKWw3+cAD/
 Conw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/C8NeHo7GpZkUH1MXjk90wBsd8C6uuIwq8RGb1Hq5vo=;
 b=PQCkkCHA8NxE6Bc801weDE7xTPsGl9czLjyRkSWYGQ+AkE+eGhHF5AYyjfbPiFEQNS
 xYSk6Kvr38OoMkFVW3xNxYpH1aSVrU+obWJ5b3APTUR0Da2z+moLrCZjf4tSsZkhkoG3
 ne4qeUyvc3c5Ac2JHy/yPbImOdEVh+eWkdPVJle4n9E6Fjw0uTIEA9/zvlMGR3zZXI90
 ltPX3Z6sbEAqaH9KJ7HI5t2f18OeDLj4LewpO7Ys8P/0XI7OatdQeG84seKAwQiVRyYf
 rOU7ZfemTZvTkdBeaO2mKiewi76jAL4rIh5oYY5ziNDgRJSDERO5jeR6iwbMeuIP1k9r
 dhlw==
X-Gm-Message-State: AOAM530Y3q5a7pHalT7IiBHgs8yd+VR6n4nEmyjY169hb1FvRy02la7W
 y0aVchcDT2Oqe1HzGsNRLqVYeQ==
X-Google-Smtp-Source: ABdhPJxBghjCh0btKNfjwzvGN2Vxx1KHZIfWf5hcsClQM0NLrJC694h/EB+IoLCQTcq+zXsFqp+5HA==
X-Received: by 2002:a9d:7ccc:: with SMTP id r12mr17883793otn.350.1629477239291; 
 Fri, 20 Aug 2021 09:33:59 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id r20sm202737oot.16.2021.08.20.09.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 09:33:58 -0700 (PDT)
Date: Fri, 20 Aug 2021 09:35:21 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 linux-mmc@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 linux-bluetooth@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [RFC PATCH 10/15] pwrseq: add support for QCA BT+WiFi power
 sequencer
Message-ID: <YR/ZyVrkmfVd0a8r@ripper>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
 <20210817005507.1507580-11-dmitry.baryshkov@linaro.org>
 <YR7m43mURVJ8YufC@ripper>
 <CAA8EJpr+=Yg2B_DzQWntW0GgvBfaSpAu0K+UD3NowdkusiYxrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAA8EJpr+=Yg2B_DzQWntW0GgvBfaSpAu0K+UD3NowdkusiYxrQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_093400_548410_446B3F1D 
X-CRM114-Status: GOOD (  27.66  )
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

On Fri 20 Aug 01:10 PDT 2021, Dmitry Baryshkov wrote:

> Hi,
> 
> On Fri, 20 Aug 2021 at 02:17, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Mon 16 Aug 17:55 PDT 2021, Dmitry Baryshkov wrote:
> > [..]
> > > diff --git a/drivers/power/pwrseq/pwrseq_qca.c b/drivers/power/pwrseq/pwrseq_qca.c
> > > new file mode 100644
> > > index 000000000000..3421a4821126
> > > --- /dev/null
> > > +++ b/drivers/power/pwrseq/pwrseq_qca.c
> > > @@ -0,0 +1,290 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2021, Linaro Ltd.
> > > + *
> > > + * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > + *
> > > + * Power Sequencer for Qualcomm WiFi + BT SoCs
> > > + */
> > > +
> > > +#include <linux/delay.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/pwrseq/driver.h>
> > > +#include <linux/regulator/consumer.h>
> > > +
> > > +/*
> > > + * Voltage regulator information required for configuring the
> > > + * QCA WiFi+Bluetooth chipset
> > > + */
> > > +struct qca_vreg {
> > > +     const char *name;
> > > +     unsigned int load_uA;
> > > +};
> > > +
> > > +struct qca_device_data {
> > > +     struct qca_vreg vddio;
> >
> > Any particular reason why this isn't just the first entry in vregs and
> > operated as part of the bulk API?
> 
> Because VDDIO should be up before bringing the rest of the power
> sources (at least for wcn39xx). This is usually the case since VDDIO
> is S4A, but I'd still prefer to express this in the code.
> And register_bulk_enable powers up all the supplies asynchronously,
> thus it can not guarantee that the first entry would be powered up
> first.
> 

Ahh, forgot about the async nature of bulk_enable. Make the code a
little ugly, but it needs to be done like that.

Thinking about it, isn't there a required minimum time between vddio and
the others in the wcn specification?

> >
> > > +     struct qca_vreg *vregs;
> > > +     size_t num_vregs;
> > > +     bool has_bt_en;
> > > +     bool has_wifi_en;
> > > +};
> > > +
> > > +struct pwrseq_qca;
> > > +struct pwrseq_qca_one {
> > > +     struct pwrseq_qca *common;
> > > +     struct gpio_desc *enable;
> > > +};
> > > +
> > > +#define PWRSEQ_QCA_WIFI 0
> > > +#define PWRSEQ_QCA_BT 1
> > > +
> > > +#define PWRSEQ_QCA_MAX 2
> > > +
> > > +struct pwrseq_qca {
> > > +     struct regulator *vddio;
> > > +     struct gpio_desc *sw_ctrl;
> > > +     struct pwrseq_qca_one pwrseq_qcas[PWRSEQ_QCA_MAX];
> > > +     int num_vregs;
> > > +     struct regulator_bulk_data vregs[];
> > > +};
> > > +
> > > +static int pwrseq_qca_power_on(struct pwrseq *pwrseq)
> > > +{
> > > +     struct pwrseq_qca_one *qca_one = pwrseq_get_data(pwrseq);
> > > +     int ret;
> > > +
> > > +     if (qca_one->common->vddio) {
> >
> > devm_regulator_get() doesn't return NULL, so this is always true.
> 
> This is more of the safety guard for the cases when the qca doesn't
> have the special vddio supply.
> 

If you think there's such a case coming up, then it makes sense.
On the flip side, debugging the resulting panic when someone adds a new
compatible without vddio is very minor...


I think this looks good then.

Regards,
Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
