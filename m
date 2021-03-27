Return-Path: <SRS0=ZFlJ=IZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4758C433DB
	for <ath10k@archiver.kernel.org>; Sat, 27 Mar 2021 00:14:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C629619FC
	for <ath10k@archiver.kernel.org>; Sat, 27 Mar 2021 00:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C629619FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LG/qZIM0LwTuWh0FdBXWuIQqezDlVtuErrKIkXbQSOM=; b=m+IMkTYnXdScGjQ5W0PE9IiEG
	K6bN+c3BA+nj1jSuB5Z7GWTuuVGvLyKKR/uOWf/t5TrWsZzJXLeyFCba8Qi+f3hfrW1j8hD3qrVmZ
	WV+CkxItXPm6c8He7GRjpp5JdfhJ/fUUI3OwdXL5tGQM6Xtebb0CFRhNEzhS5rh6mR/fUwXoY7VaK
	7T+f+ECx6t3kb9wUKWXZh59gUrPmfOeleJRcCHrMZQk2I/NKCbK6qPVpqaZLJOEJszBqrRXhL8Kxe
	wE8kCYpBV9xdnH5h4kMyGZZeWct1sgmKFgLz1f4ahQRUHcPuTuZAWzsq2qpz8BToeowHNIdTkF4Dz
	QPsLTt/Yg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPwaq-004Ykq-Ry; Sat, 27 Mar 2021 00:14:20 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPwal-004YkP-Q4
 for ath10k@lists.infradead.org; Sat, 27 Mar 2021 00:14:18 +0000
Received: by mail-lf1-f42.google.com with SMTP id m12so10137655lfq.10
 for <ath10k@lists.infradead.org>; Fri, 26 Mar 2021 17:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SEcUk0EunwKzPM97F5uKAKJTsTQwxZ5rqKq25o2rWsk=;
 b=hcbClB+nN/rFRxtBWjZX4Lk/62TIaPPeUaSYPDaPWfgawGJHjBT2/PBSNzNrNLcPYU
 Nlp2I8P8l6svNFi4Q3OLU5xQKqazb8V3I9L7WFb1dZxBpJ9spGLq3JX++aPNnhBMdAw7
 /KTqbk4k04U9Fh99TcTeRjLHj9q3ewps2eTXiN+bamqCLLEPBsD7VDAC97fdjrZjyQDm
 J0Cd1ADSIdGueVPk2tKZB7XcOFJ2jkTAWy9IDltvmvzgeK11M1BwL9RHWZA5MTBxFOBU
 iXaqtL+bFDQzig2ZkpVFRwnI5x+k6LW6YiEGjswkQFqk7oG9sEnUNOkVn2x7K0wVZLzQ
 9scA==
X-Gm-Message-State: AOAM531PBhu1tjpFWSSThbfHDZlZNyaze3kuQspGUUybyH0KXGRfqrzM
 enm/Ej75o50IRrR8ERtU2tM=
X-Google-Smtp-Source: ABdhPJwEVBAE3qKqw210nGGw3dr7TjeUGuqo7YWb7wiIf7rFqesRT4vsCS7XhGpR62hq2S4BArj0Ag==
X-Received: by 2002:a05:6512:405:: with SMTP id
 u5mr9253215lfk.574.1616804051808; 
 Fri, 26 Mar 2021 17:14:11 -0700 (PDT)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id n11sm1020676lfe.243.2021.03.26.17.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 17:14:11 -0700 (PDT)
Date: Sat, 27 Mar 2021 01:14:10 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Kalle Valo <kvalo@codeaurora.org>,
 Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, vtolkm@gmail.com,
 Rob Herring <robh@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jason Cooper <jason@lakedaemon.net>, linux-pci@vger.kernel.org,
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: Disallow retraining link for Atheros QCA98xx chips
 on non-Gen1 PCIe bridges
Message-ID: <YF540gjh156QIirA@rocinante>
References: <20210326124326.21163-1-pali@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326124326.21163-1-pali@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_001416_686297_38106C1C 
X-CRM114-Status: GOOD (  17.48  )
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

Hi Pali,

Thank you for sending the patch over!

[...]
> +static int pcie_change_tls_to_gen1(struct pci_dev *parent)

Just a nitpick, so feel free to ignore it.  I would just call the
variable "dev" as we pass a pointer to a particular device, but it does
not matter as much, so I am leaving this to you.

[...]
> +	if (ret == 0) {

You prefer this style over "if (!ret)"?  Just asking in the view of the
style that seem to be preferred in the code base at the moment.

> +		/* Verify that new value was really set */
> +		pcie_capability_read_word(parent, PCI_EXP_LNKCTL2, &reg16);
> +		if ((reg16 & PCI_EXP_LNKCTL2_TLS) != PCI_EXP_LNKCTL2_TLS_2_5GT)
> +			ret = -EINVAL;

I am wondering about this verification - did you have a case where the
device would not properly set its capability, or accept the write and do
nothing?

> +	if (ret != 0)

I think "if (ret)" would be fine to use here, unless you prefer being
more explicit.  See my question about style above.

>  static bool pcie_retrain_link(struct pcie_link_state *link)
>  {
>  	struct pci_dev *parent = link->pdev;
>  	unsigned long end_jiffies;
>  	u16 reg16;
> +	u32 reg32;
> +
> +		/* Check if link is capable of higher speed than 2.5 GT/s and needs quirk */
> +		pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &reg32);
> +		if ((reg32 & PCI_EXP_LNKCAP_SLS) > PCI_EXP_LNKCAP_SLS_2_5GB) {

I wonder if moving this check to pcie_change_tls_to_gen1() would make
more sense?  It would then make this function a little cleaner.  What do
you think?

[...]
> +static void quirk_no_bus_reset_and_no_retrain_link(struct pci_dev *dev)
> +{
> +	dev->dev_flags |= PCI_DEV_FLAGS_NO_BUS_RESET | PCI_DEV_FLAGS_NO_RETRAIN_LINK_WHEN_NOT_GEN1;
> +}
[...]

I know that the style has been changed to allow 100 characters width and
that checkpatch.pl now also does not warn about line length, as per
commit bdc48fa11e46 ("checkpatch/coding-style: deprecate 80-column
warning"), but I think Bjorn still prefers 80 characters, thus this line
above might have to be aligned.

Krzysztof

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
