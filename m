Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF516C47BEA
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 11:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1Ot5WSQbZmf/qjliJQBzG52hCFBHboUV7sYHRFrG34=; b=KfY0UTZPCazenPxwcMwz0R4cy/
	Y/akLF0XUllu2XCkY8lKIXgrCHrVV2L6XFFsDcehEWAerM7op1xbjA6u6P92hnf+MHZGLfnktOV29
	dWwXkfep1P2fJClEzEwFn6m9x4IUapm7rVkfgLIJzh6hZ5+SFMiuGo3svnr47ZEzdamBPuheBfMa/
	+1V3OXOjHki4hEdttFoDdLq72rtjpju7sgDtcADJmSxLYwaoBHq7PrCPI4HG+oSwC+IwGZIqeOBz6
	Idiq4QVIg49CWkIum2UAYDUJoBrrjYvxMBzkyNvtGqeT/gZYhXgwTZjeRB5bweqgdZ+eh+XCrCni+
	1agIgwuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5KC-0000000Ct9v-0LQD;
	Tue, 06 Jan 2026 11:34:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5KA-0000000Ct8l-2BIZ
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 11:34:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF26A60152
	for <ath10k@lists.infradead.org>; Tue,  6 Jan 2026 11:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D231C19422
	for <ath10k@lists.infradead.org>; Tue,  6 Jan 2026 11:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767699244;
	bh=e7aQPfqZchv7cdvTlfV1PMxXNwB4FVHC6zfkDDRF1xc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D3pWQotsytWQtCtlHl5KBBCHpCDnrh7CFamjX4YScQ7WoLh13Zl9OaZHtoCtxxxl3
	 o0QGkHNE4AHUeZuUk5AJtntDfydeVGfflbOafjnQfozmfyrnJn1MaRBqBdaVHykAzY
	 mOXtOYE837Zcjo6/WqWZp+vYxZnlPesQJdM/nfQAOAW4yjdVeqZZTeWQBJ+w9K0264
	 G3//SWOkJj73OT7eYK2X5D3hskxFA9Bo6bJEdpCNwP/m1bGkuD9X7ja82R2IJM2InP
	 czZFhnEW5bVPb3TQMvEURHBmVHoV/4180rwsrSsV9pNvOtqDKyMpqH5CzAzax77nBt
	 R/IIOShwS8LAg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59584301f0cso1029560e87.0
        for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 03:34:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXg2fMub1YVWqsfbJh91WoNSVypy56Yze7in4UiBYcSP/B9QATC+09K70NyHAykl8/ZHS+DMPQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwaPOFaWINIfjhBf12I9nDVArzfVg3/ZyIrBsSihHs8TJf0kwrX
	B1y/PlqoaL9V5QIQ/Sj7Fbzg6qG4GFoZplHnWoDQoQ30CAHqMrbWYrJ1n1dwFRHOOhyVW6MWLyp
	PaLiVPL8LQrL3NeS2arLd4k2EZAmoJuACuTaj62/Iog==
X-Google-Smtp-Source: AGHT+IH6WUvrwJ3e6JIw+OZTKRmcLjomwAx5325+HpSyUiSTaP3mUf/7LgYZd13U9tO3lCh2JtbVraYQqOh0LYYUFzc=
X-Received: by 2002:a05:6512:32c7:b0:595:82ed:ff28 with SMTP id
 2adb3069b0e04-59b65258a07mr1027826e87.32.1767699243013; Tue, 06 Jan 2026
 03:34:03 -0800 (PST)
MIME-Version: 1.0
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
 <20260106-wcn3990-pwrctl-v2-1-0386204328be@oss.qualcomm.com> <20260106-excellent-pygmy-puffin-97f7d5@quoll>
In-Reply-To: <20260106-excellent-pygmy-puffin-97f7d5@quoll>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 6 Jan 2026 12:33:50 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfVsFY1T_PpT8nQ5AjcYrk_hy2Rgd6L0-Z7L0oB8D0uMw@mail.gmail.com>
X-Gm-Features: AQt7F2pSNlyD56O3PupToeH6RHiDz4jFG1ufbKtVNPwZRdtJy5ouVmj8OutkSdU
Message-ID: <CAMRc=MfVsFY1T_PpT8nQ5AjcYrk_hy2Rgd6L0-Z7L0oB8D0uMw@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] regulator: dt-bindings: qcom,wcn3990-pmu:
 describe PMUs on WCN39xx
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Matthias Kaehlcke <mka@chromium.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jan 6, 2026 at 9:00=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Tue, Jan 06, 2026 at 03:01:11AM +0200, Dmitry Baryshkov wrote:
> > WCN3990 and other similar WiFi/BT chips incorporate a simple on-chip PM=
U
> > (clearly described as such in the documentation). Provide DT schema
> > covering other Qualcomm WiFi/BT chips to cover these devices too.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  .../bindings/regulator/qcom,wcn3990-pmu.yaml       | 100 +++++++++++++=
++++++++
> >  1 file changed, 100 insertions(+)
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>

Mark, the bindings describe a device controlled by a pwrseq driver for
which C changes are later in the series. Is it alright if I take it
through the pwrseq tree?

Bart

