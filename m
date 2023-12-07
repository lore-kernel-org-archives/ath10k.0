Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91F0C4167B
	for <ath10k@archiver.kernel.org>; Thu,  7 Dec 2023 16:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lyhxrpfp+75Q27I2sJ7iqWke8b01A5JKGENoBisxmEg=; b=k+/hbQKHUl0vThHF9Gr3MuoJpJ
	b9bI17k0jM3XUyFkaotFPBe/uijKntQqqXtnuVdXNREWIMi+eXyAdU/LOdg/ABL36LoQd4JAqcdcd
	hWAHsDNaDSzzjv4PPabYC/mG7Gl1T853qSq833/M7942D5J7UUzJM0MmO7bp28h92xcGkuS7pUzw/
	uT64fw8MCcSifTwjyBwoIJdNXKW8nxdTG1CNLJFGHAgQX9uAW/sZLzaU7jeTqMf4f92FE/BpkTyh9
	YOK1GcAIqBTlYcZi8z91qClBT49nTBxnoSRkM73Izb4dzY/QK+ggoIOdnFYTV11WL60vkCo4DEVPZ
	CZuN828Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBHZE-00DS14-1y;
	Thu, 07 Dec 2023 16:49:40 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBHZB-00DS0i-0L
	for ath10k@lists.infradead.org;
	Thu, 07 Dec 2023 16:49:38 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a1e7971db2aso126876066b.3
        for <ath10k@lists.infradead.org>; Thu, 07 Dec 2023 08:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701967773; x=1702572573; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lyhxrpfp+75Q27I2sJ7iqWke8b01A5JKGENoBisxmEg=;
        b=IkrO+scncaVsM6WFIFP6Jzq80Meboclv+Bsx1THEtttQoNQpXlTCOpFZeIUmUE0qP1
         H0SwOn/8IqOrPvbjpFByETFj1H6HHUMa+Ay3jR8iHEQHns8MzvpDVgLIhinjBoyFR7fF
         llLCC6sf8FOjU6PbWLvYYzMdTbp8qE371if1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701967773; x=1702572573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lyhxrpfp+75Q27I2sJ7iqWke8b01A5JKGENoBisxmEg=;
        b=jvJVoHYRZCtih05JiFdrQWXYlSc8QeVMWQWSfYSekQLyJIbzP4nNqn67FVufjyoapO
         Zh/RxNFubEEynwuhV8pHXzkWSSkvD7DORvzMuxyZdNBnz0CjbkpuEaqAfTeNEpNpGoh7
         jBVpzeUbWlGC4zd4VYRyPixH8cE2r3zNqSZKZR/dkke14o2YDty6KExn3Nl1xfKVyKHb
         X5C+NJquP/XGwhD/eZaA3o7tQqkUQUhUvEJiz9YgKY2SoJVBMDUDr21nGgfo78BX1yjU
         kpbOD2T8n+5+em8mUXO7U/ms8NZwaVL1jYyg38Fbgvkzch9Em3/yrZIO5LBzYVNI83pb
         ldHw==
X-Gm-Message-State: AOJu0YxaPQUvvnAplKzz/5dfzSB/XeRBO4on12JGyIwV3ALT/6C692wZ
	g5L6GvD5bpgCR/geZBUwCKL61gpAjCrkYosYJczJO/mQ
X-Google-Smtp-Source: AGHT+IGQgu5igoHsMqpxf/C9y8jSRdWQL80W6RZR0pJWWIiRP37VmAnkxgDeeBXtgHBmBx0sanLhHw==
X-Received: by 2002:a17:906:20dd:b0:a1e:437c:6a6a with SMTP id c29-20020a17090620dd00b00a1e437c6a6amr1047258ejc.78.1701967773084;
        Thu, 07 Dec 2023 08:49:33 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709066d0c00b00a1ca6f5f189sm1049634ejr.179.2023.12.07.08.49.32
        for <ath10k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 08:49:32 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40b367a0a12so67275e9.1
        for <ath10k@lists.infradead.org>; Thu, 07 Dec 2023 08:49:32 -0800 (PST)
X-Received: by 2002:a05:600c:22d8:b0:40b:4221:4085 with SMTP id
 24-20020a05600c22d800b0040b42214085mr206272wmg.1.1701967772109; Thu, 07 Dec
 2023 08:49:32 -0800 (PST)
MIME-Version: 1.0
References: <20230630151842.1.If764ede23c4e09a43a842771c2ddf99608f25f8e@changeid>
 <CAMSo37XcwAn9znSQ8202LUTdBKLDz94QJ9i43aXya5LHs-4GiQ@mail.gmail.com> <87wmtqnk3y.fsf@kernel.org>
In-Reply-To: <87wmtqnk3y.fsf@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 Dec 2023 08:49:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VHHCsjJmVWDXN4g3U=-_SLWc2iWqbAdZPOykn+QMQojw@mail.gmail.com>
Message-ID: <CAD=FV=VHHCsjJmVWDXN4g3U=-_SLWc2iWqbAdZPOykn+QMQojw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Don't touch the CE interrupt registers after
 power up
To: Kalle Valo <kvalo@kernel.org>
Cc: Yongqin Liu <yongqin.liu@linaro.org>, ath10k@lists.infradead.org, 
	Abhishek Kumar <kuabhs@chromium.org>, Youghandhar Chintala <quic_youghand@quicinc.com>, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	John Stultz <jstultz@google.com>, Viktor Martensson <vmartensson@google.com>, 
	Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_084937_187984_BCB17893 
X-CRM114-Status: GOOD (  26.66  )
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

Hi,

On Thu, Dec 7, 2023 at 6:49=E2=80=AFAM Kalle Valo <kvalo@kernel.org> wrote:
>
> > Recently during our Android build test on the Dragonboard 845c board,
> > with the Android Common Kernel android11-5.4-lts and android12-5.4-lts =
branches,
> >
> > we found there are some ufshcd related changes printed,
> > and the serial console gets stuck, no response for input,
> > and the Android boot is stuck at the animation window.
> >
> > The problem is reported here
> >     https://issuetracker.google.com/issues/314366682
> > You could check there for more log details.
> >
> > And with some bisection, I found it's related to this commit,
> > when I revert this commit, the problem is gone.
> >
> > So replied here, not sure if you have any idea about it,
> > or any suggestions on what we should do next to resolve the problem?
>
> FWIW we don't support Android kernels, only kernel.org releases.

Right. If the problem also reproduces on mainline Linux then that
would be interesting to know. I think db845c is at least somewhat well
supported by mainline so it should be possible to test it there.

If I had to guess, I'd think that probably the CE interrupts are
firing nonstop for you and not getting handled. Then those constant
interrupts are (presumably) causing the UFS controller to timeout. If
this is true, the question is: why? Maybe you could use ftrace to
confirm this by adding some traces to
ath10k_snoc_per_engine_handler()? There's a way to get ftrace buffers
dumped on panic (or, if you use kdb, it has a command for it).

If this reproduces on mainline and it's not obvious how to fix this, I
don't object to a revert. As per the description of the original
patch, the problem being fixed was fairly rare and I didn't have a way
to reproduce it. The fix seemed safe to me and we've been using it on
Chromebooks based on sc7180, but if it had to get reverted it wouldn't
be the end of the world.

-Doug

