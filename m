Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4BFC433FE
	for <ath10k@archiver.kernel.org>; Wed, 19 Oct 2022 06:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIQq9lN7m39Fvevyv0GrV6Ma08Hesm6gSSL6nNtoj+8=; b=01+hNCxlD/gq+L
	500aSQMTjye4FwPgtvK+qoyQvLEvVe7ODXnFqQ2E1bdWMgC8uiJ8mc5H58ifhLT0xN0meaUxVZmLX
	xgA5+4PHNqKboabM2x/9Jn5+NwjeNUv9fUPDJHbs9lOzXYcHCSwHmRv6q4okek+hnYghZpNNea4k4
	vADxPdGJ+o9XYDdhBzhT3kv1quKCdlkPrHXpBppqLxHkPrYr7iT8woO3zbXydjHSy4vyiII/maagY
	iUsY8mJLbYIaXF8ooEwGvw1pbFP5K+2y66LcnSRs1emzL/zgsRhqPj8dR/U9lbDhnTRXp4a7YcZwO
	OTSdyRFK+m4Vb5hIJGYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol2B0-00FNuA-Ff; Wed, 19 Oct 2022 06:03:38 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol2Ax-00FNiu-FB
	for ath10k@lists.infradead.org; Wed, 19 Oct 2022 06:03:37 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-3321c2a8d4cso158189887b3.5
        for <ath10k@lists.infradead.org>; Tue, 18 Oct 2022 23:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s5DB7EnWinUCVvHnFkWiifLYJ7ZYVSrywNKSXQZJdFI=;
        b=zVYtNmW6565ZCEXxTkDChTvQvHXVZBJgGadsGALKU3QKMGV7PrXldFeksaQiPFFwos
         gOa5LHUXC9ENeji5ixZomlslrjXs7gRNn5sa4/rC/7oX9vcohhS7XlO8sDMJLXWscr+q
         bF06XsYuYWzUbcYRDjzfQO7njw5hC0lUkvvqRBtzHG+VCf+kO0dojSk2HwepiWXgSYBP
         78G6I41n+j4b5oQ86dSQb0agTuBmkZQLAXpLW2ShZuHRDidswcSNmuHVA4Q/JlRHChj1
         CVLKFFo1MbwWbp2VHMZdc2bMjhHGPyCYYpL8L1H7itzUSN66IyZ5++j9CAcdb550Y7AK
         nt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5DB7EnWinUCVvHnFkWiifLYJ7ZYVSrywNKSXQZJdFI=;
        b=ONWcg5ostcxUyOUwnaKHVDeS35UbEYvLLVmena4mkfVTtHLFtcP37YSzxMwQeg+Fl+
         cTEGdqmPsvkdJucXnb9XXAVIeteW+iVcTJhy3/8l/VZLTpRFNx7On/VLQXj6OQ0MKzpn
         aa73VOpGwN4YjphzLSTyBy9iq5WsSWtR2piA5+DMmFulBIHj9aPYDwYeQ7AqAIqyHjhf
         HVQmn3MW5Q5YRGUnvQ1Dursq+QwRZ/ZbdC8rCSc1Tg9vnxzSr8jDa6V4WzSZ7TVeODRH
         IIAcGp0l3puhiRam4Of6t0Sj51BGOhASg3Q4jXNBshfX/HhVWSTaFhIjrEXvRkx09NY8
         c6Aw==
X-Gm-Message-State: ACrzQf0Havn/snPZPX+su0ERiEOiB2ZOO8p6EO1GoJgZXEBHxGBmGwoJ
	SKwmu407M3+fJdZdaOvQuwZost+OILwVOr60e426aA==
X-Google-Smtp-Source: AMsMyM6pJW+QkixNplXOsyqax6puLF7anBgDILMTra0UqNAILCFqM+RlWPnUCA7ntqHj/xXFKBs5j8LsVWWer2PZbHY=
X-Received: by 2002:a81:4881:0:b0:361:5080:91fe with SMTP id
 v123-20020a814881000000b00361508091femr5409889ywa.485.1666159413839; Tue, 18
 Oct 2022 23:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org> <Y0hr9XTGAg8Q6K6y@google.com>
In-Reply-To: <Y0hr9XTGAg8Q6K6y@google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 19 Oct 2022 09:03:22 +0300
Message-ID: <CAA8EJppuGbDGb1D-yf2WL77U1bqx1QQStQeDArWmGFCUiOtnww@mail.gmail.com>
Subject: Re: [PATCH v1 00/15] create power sequencing subsystem
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>, linux-arm-msm@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_230335_537430_B35F3BCC 
X-CRM114-Status: GOOD (  27.77  )
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

Ho,

On Thu, 13 Oct 2022 at 22:50, Matthias Kaehlcke <mka@chromium.org> wrote:
> Do you still plan to refresh this series?
>
> I know there have been multiple attempts to get something similar
> landed in the past 10 year or so. Your series didn't seem to get
> much pushback from maintainers, might be worth sending a refresh :)

Yes, I hope to return to it eventually. I just had no time for it lately.

> On Wed, Oct 06, 2021 at 06:53:52AM +0300, Dmitry Baryshkov wrote:
> > This is a proposed power sequencer subsystem. This is a
> > generification of the MMC pwrseq code. The subsystem tries to abstract
> > the idea of complex power-up/power-down/reset of the devices.
> >
> > The primary set of devices that promted me to create this patchset is
> > the Qualcomm BT+WiFi family of chips. They reside on serial+platform
> > or serial + SDIO interfaces (older generations) or on serial+PCIe (newer
> > generations).  They require a set of external voltage regulators to be
> > powered on and (some of them) have separate WiFi and Bluetooth enable
> > GPIOs.
> >
> > The major drawback for now is the lack of proper PCIe integration
> > At this moment support for PCIe is hacked up to be able to test the
> > PCIe part of qca6390. Proper PCIe support would require automatically
> > powering up the devices before the scan basing on the proper device
> > structure in the device tree. This two last patches are noted as WIP and
> > are included into the patchset for the purpose of testing WiFi on newer
> > chips (like qca6390/qca6391).
> >
> > Changes since RFC v2:
> >  - Add documentation for the pwrseq code. Document data structures,
> >    macros and exported functions.
> >  - Export of_pwrseq_xlate_onecell()
> >  - Add separate pwrseq_set_drvdata() function to follow the typical API
> >    design
> >  - Remove pwrseq_get_optional()/devm_pwrseq_get_optional()
> >  - Moved code to handle old mmc-pwrseq binding to the MMC patch
> >  - Split of_pwrseq_xlate_onecell() support to a separate patch
> >
> > Changes since RFC v1:
> >  - Provider pwrseq fallback support
> >  - Implement fallback support in pwrseq_qca.
> >  - Mmove susclk handling to pwrseq_qca.
> >  - Significantly simplify hci_qca.c changes, by dropping all legacy
> >    code. Now hci_qca uses only pwrseq calls to power up/down bluetooth
> >    parts of the chip.
> >
> >
> >
> >
> > _______________________________________________
> > ath10k mailing list
> > ath10k@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/ath10k



-- 
With best wishes
Dmitry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
