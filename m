Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFFBC25B75
	for <ath10k@archiver.kernel.org>; Wed, 15 May 2024 19:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FP5LyQsEGquqKItcS87RpeQ08Gmx+s5LG2B/J1Ts8Iw=; b=5ENUuF6Jy75u/o1f1oLSk3H8Jd
	bbsZlDLV3qLEGaYF93yf7ykVQxzlVp4aNSOYqvnVypcqOJAuvee3KIIcmyfKfrOzpZSAvKNatbIOT
	Xo8//l0OxSf9edrK3mJYfccqv8aZ8B6/1MReyKGv9X/dZPlL70NLH1pUC3kdUmCkKdMfGllMEN5ks
	MWpWgy6Q+4EUq0qk6kuXqZ5hcKgGNjz87phn0QTPEk7ujv7OBQPiDWLi+CM9MTaa+vIX/hszjs3WO
	6oUIBTV7wypy7nX2vocYDu/UpkIHHhSKh6wjLTIjQYOxg09TmdHSEXYNQqGXRvGQttCAIbPwPwrkF
	YSeBnzNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7K6u-00000002gAw-3ZEg;
	Wed, 15 May 2024 19:16:20 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7K6r-00000002gAG-0NYG
	for ath10k@lists.infradead.org;
	Wed, 15 May 2024 19:16:19 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-62036051972so80613577b3.1
        for <ath10k@lists.infradead.org>; Wed, 15 May 2024 12:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715800574; x=1716405374; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FP5LyQsEGquqKItcS87RpeQ08Gmx+s5LG2B/J1Ts8Iw=;
        b=i7PG1aGdhwofeLEPGPuHoiybverr/NjsptGV90gQLI9MY4SdatdAYDWS53L0YlpXz4
         P6Qj9P0HMZRTCsy3q4xojHEqEdbDWGR5t6sourc1rXRrzjJlXQRICQ8oIJXYSV0VyQGW
         zRXGlCtFlHPFWR2OKOL5M50adH0kg0IPRAwXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715800574; x=1716405374;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FP5LyQsEGquqKItcS87RpeQ08Gmx+s5LG2B/J1Ts8Iw=;
        b=u0gewEmQsG77Ds3wZs95XMwR+Cy+VqZHVBmY2TFJoRHNT0Rr4gd66KKTyMyIMOHPlF
         RI0M5iCwtHa2sA9Cq/DUglzk0u81zgQE84gTWZaPZv3ldT7Qa/L5iOgzVaaQyiHIxuWC
         J4HFl5T5bSCv+Mej7ULoN8NxfWmMQGiCfnK+DksAynrzTL7MTspDPaRH/CteBDKr4sqN
         xmQ3KkrPHIKS/wz/aABQj7E0ks8L5tSImSrhDlFmzX1TXHdBwYg9PqLeVRQA18zzbsyN
         BdSU/I8skpbmMr/XzJ5RflQNVVvCqEbfNo+iMSaER9eM5uyqQtyE0jmAGQtot/MMULOZ
         EfTg==
X-Forwarded-Encrypted: i=1; AJvYcCVz7OyDyQYoFpMKqvSkKN2J3n+5CR9479FC6OMhIbOszE0VzgG16LHG5Vo9HkYkBb1i/6wQcZeujletSwsXonHRctDFbIrh8PJtTQ==
X-Gm-Message-State: AOJu0YyCTnYib/dqmw/xQilt6StEePXYPxvdOCX14MscGx36NIQ40q6e
	Ix89fZxat4veB3WHcEhsltmBFMS5FrfEe+j5p79q/WIS+ekyifd88pE5rdsNkxvBpo8kQQj05pI
	1EMVb/o3Z1wnIldbOqc3jOjIxKl3FmCWzei21
X-Google-Smtp-Source: AGHT+IEZFVp0/9J3vEYY3DeetifpNlyI7Reu7bida3ovANfhBvDsm0gF8xGPrJXaQaXknjiNqesUsWMhYeDWThoRIkM=
X-Received: by 2002:a25:6b41:0:b0:de5:568a:9a9 with SMTP id
 3f1490d57ef6-dee4f2f7f74mr14602381276.38.1715800572793; Wed, 15 May 2024
 12:16:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 May 2024 12:16:11 -0700
MIME-Version: 1.0
In-Reply-To: <20240511-ath10k-snoc-dep-v1-1-9666e3af5c27@linaro.org>
References: <20240511-ath10k-snoc-dep-v1-1-9666e3af5c27@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 15 May 2024 12:16:11 -0700
Message-ID: <CAE-0n52ptoRRQEL1G9vTZ7ExemrUSmV2Km=uts_E7wBeoz_GcA@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath10k: fix QCOM_RPROC_COMMON dependency
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Kalle Valo <kvalo@kernel.org>, Rakesh Pillai <quic_pillair@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_121617_187230_DC8157AF 
X-CRM114-Status: UNSURE (   6.25  )
X-CRM114-Notice: Please train this message.
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Quoting Dmitry Baryshkov (2024-05-11 03:49:59)
> If ath10k_snoc is built-in, while Qualcomm remoteprocs are built as
> modules, compilation fails with:
>
> /usr/bin/aarch64-linux-gnu-ld: drivers/net/wireless/ath/ath10k/snoc.o: in function `ath10k_modem_init':
> drivers/net/wireless/ath/ath10k/snoc.c:1534: undefined reference to `qcom_register_ssr_notifier'
> /usr/bin/aarch64-linux-gnu-ld: drivers/net/wireless/ath/ath10k/snoc.o: in function `ath10k_modem_deinit':
> drivers/net/wireless/ath/ath10k/snoc.c:1551: undefined reference to `qcom_unregister_ssr_notifier'
>
> Add corresponding dependency to ATH10K_SNOC Kconfig entry so that it's
> built as module if QCOM_RPROC_COMMON is built as module too.
>
> Fixes: 747ff7d3d742 ("ath10k: Don't always treat modem stop events as crashes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

