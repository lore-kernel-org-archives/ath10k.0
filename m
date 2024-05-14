Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B34CC04FFE
	for <ath10k@archiver.kernel.org>; Tue, 14 May 2024 17:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFjF07guL4YJ8MNqfG2pfvFMxWns1uZ1eiLMXaPYclg=; b=HY5S6yvGMPwPc33yGjGuJbnaPg
	1Rvaigr9x5UCDFjVJg0qyhtDTYdlDFgJjQuoApwY2tB32wYD5pE3yv1sGcAjxiHvRq9qmzv7GAY9o
	t9TMPQvlwgQdK1q3evfQfEm6XpFCF6XfsjdFupAq8R+p0qarXI9D5y+jjvby6qTRHArvtbVvhxPMQ
	I4bi7PyPCzfCVGnEfXFe6jR5uMfJgbZuWZSOn+9+aafoPkYu1n0mYB8geJcLn968f2CKXBJeHdUMZ
	eWsZbXmYsD0+jmoWLKsCAcbwGNnHfgJkDuOYGSvPzeCLL7fVAcS60Gnt/sp3qLep8/NMGjodGgn5B
	K1KBAWRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wDp-0000000GhyX-0BuY;
	Tue, 14 May 2024 17:45:53 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wDm-0000000GhxW-3paT
	for ath10k@lists.infradead.org;
	Tue, 14 May 2024 17:45:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7B0E2CE12A3
	for <ath10k@lists.infradead.org>; Tue, 14 May 2024 17:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F8AC32786
	for <ath10k@lists.infradead.org>; Tue, 14 May 2024 17:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715708747;
	bh=FOjLC9GTIUd1WGRSxLT8Kv9gyt6FdbEbbp3ZmLp/5Pw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VKImCysY3bcey58jwKO+qoQW0bnHVN/etyfwMudeR25DbYzK3YhTvWmr+708I78H5
	 D+awgxvAly3K1xsLtDkDRg63v4rcI0H6IsJD5h45j8oGdQwqlDINPektsflqTDqMwe
	 ECiDPAgaAkZgANH/wGE68CXphZKkSwNH6rjkwMQCeuKa9J1eoYRzu0bWrProSMYzrL
	 d3U1BghkuKONFSdgXJpIBALNCuhKOBXlAendOTCxizkioLVt7hv7tFgHrf6u05wvY8
	 6P70X6yHq3fs19WW6xZDGI4g8LAgCiKineGFS9Nql2tCuIequp45hrqIUz32/yGau7
	 dd5V/fRiJ9FEA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51f99f9e0faso6764567e87.2
        for <ath10k@lists.infradead.org>; Tue, 14 May 2024 10:45:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUz4u3NuARuax9Ehd1ntUK09wEpC75LqglSHNFE8LsnQiu5jDjDE87HNVQrNpQ73WZJdqL2Sq5aNc7l2Ce0Tdd06jGfT8QRYdQyiQ==
X-Gm-Message-State: AOJu0YyyFsHDRV1bxHQLBrtKvislt0KlCP4+m47MbDb0YOqzKiYXP7BO
	IjSUzYXP24QFiak70kj9WhdzeztVURsK+ARna/Iz8wjEKbUJ92f5MMmC/ZuxhvA3FxzuQTlyYiO
	9+RAFvSZ3mX6UlBDEBT0AbXS99C0=
X-Google-Smtp-Source: AGHT+IFNbI6Bd5BRsGSVHMrS8noqYrRTepjcaaqy5bW0mLMfJcq2tUemTq2/g8JEYAe2AL1nwXz7wo3BaTt9cfiD81I=
X-Received: by 2002:a05:6512:b15:b0:51a:ca75:9ffe with SMTP id
 2adb3069b0e04-5221057b50bmr12345399e87.42.1715708746044; Tue, 14 May 2024
 10:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240511-ath10k-snoc-dep-v1-1-9666e3af5c27@linaro.org> <12a208d7-f36b-4953-abff-323a15452b3c@quicinc.com>
In-Reply-To: <12a208d7-f36b-4953-abff-323a15452b3c@quicinc.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 15 May 2024 02:45:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNASyBNbxm-e+iZ=7pOJg-a-Zm84O6RNcqiUjZQH7f9r3Lw@mail.gmail.com>
Message-ID: <CAK7LNASyBNbxm-e+iZ=7pOJg-a-Zm84O6RNcqiUjZQH7f9r3Lw@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath10k: fix QCOM_RPROC_COMMON dependency
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kalle Valo <kvalo@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
	Rakesh Pillai <quic_pillair@quicinc.com>, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_104551_341142_22B35288 
X-CRM114-Status: GOOD (  22.77  )
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

On Tue, May 14, 2024 at 11:43=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicin=
c.com> wrote:
>
> On 5/11/2024 3:49 AM, Dmitry Baryshkov wrote:
> > If ath10k_snoc is built-in, while Qualcomm remoteprocs are built as
> > modules, compilation fails with:
> >
> > /usr/bin/aarch64-linux-gnu-ld: drivers/net/wireless/ath/ath10k/snoc.o: =
in function `ath10k_modem_init':
> > drivers/net/wireless/ath/ath10k/snoc.c:1534: undefined reference to `qc=
om_register_ssr_notifier'
> > /usr/bin/aarch64-linux-gnu-ld: drivers/net/wireless/ath/ath10k/snoc.o: =
in function `ath10k_modem_deinit':
> > drivers/net/wireless/ath/ath10k/snoc.c:1551: undefined reference to `qc=
om_unregister_ssr_notifier'
> >
> > Add corresponding dependency to ATH10K_SNOC Kconfig entry so that it's
> > built as module if QCOM_RPROC_COMMON is built as module too.
> >
> > Fixes: 747ff7d3d742 ("ath10k: Don't always treat modem stop events as c=
rashes")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/net/wireless/ath/ath10k/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wire=
less/ath/ath10k/Kconfig
> > index e6ea884cafc1..4f385f4a8cef 100644
> > --- a/drivers/net/wireless/ath/ath10k/Kconfig
> > +++ b/drivers/net/wireless/ath/ath10k/Kconfig
> > @@ -45,6 +45,7 @@ config ATH10K_SNOC
> >       depends on ATH10K
> >       depends on ARCH_QCOM || COMPILE_TEST
> >       depends on QCOM_SMEM
> > +     depends on QCOM_RPROC_COMMON || QCOM_RPROC_COMMON=3Dn
> >       select QCOM_SCM
> >       select QCOM_QMI_HELPERS
> >       help
> >
> > ---
> > base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
> > change-id: 20240511-ath10k-snoc-dep-862a9da2e6bb
>
> I see how this fixes the problem, but this doesn't seem like an ideal
> solution. The fact that the *_ssr_notifier() functions are correctly prot=
ected
> by conditional compilation ideally should mean that clients don't need to=
 call
> call out this as a dependency. Otherwise, it would mean we'd need to do t=
his
> for all feature flags.


It depends on if qcom_common.c is optional for ath10k_snoc.

If it is optional, this patch is correct.


If it is mandatory
depends on QCOM_RPROC_COMMON


>
> +linux-kbuild just to make sure there isn't a better approach.


Commit 28d49e171676afb7df7f47798391364af9abed7f suggested

  depends on BAR || !BAR

but

  depends on BAR || BAR=3Dn

works equivalently.



>
> /jeff
>
>


--=20
Best Regards
Masahiro Yamada

