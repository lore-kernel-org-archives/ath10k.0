Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE56C48BC3
	for <ath10k@archiver.kernel.org>; Mon, 19 Feb 2024 22:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OzrnpRRkFvIZstOU4+rXZ++bwzZ4/ZEkkWA4xAuIZiQ=; b=AD8nJNyU9m2W1+IFWmCITYpnt4
	1i3xXpy9gM66nPf0G84LCuiWFWiv8Y2WKCz0DBKUKJXg4X25wM31/qJ6sbq4Udgt8rXWCLGtiiG97
	rQVA+Saml1kDk3qsTPJ94vh4A58cpRKws7+XRiNSjT3heOQnemL0w2Jyo5+pxVdjQNPOR8LwLyanm
	YkOo2MlcsB/qRp7I1G7iP4OwJT2ML5EER6d94e/UDwQ1hUKlTu3b8ZoJYQFxkht8AC/aZtFMVPVkz
	05nxItqcQ3dp48K+9LhEBJqWdXXT1OtrzZKKoWW43lH0AXPB3vpuvsFpDKCR6urOn07miSTl7tRoW
	FjWwYMFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcC3a-0000000CN1P-21yP;
	Mon, 19 Feb 2024 22:24:14 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcC3X-0000000CN0e-2uyM
	for ath10k@lists.infradead.org;
	Mon, 19 Feb 2024 22:24:12 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-dc6d24737d7so4145308276.0
        for <ath10k@lists.infradead.org>; Mon, 19 Feb 2024 14:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708381449; x=1708986249; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OzrnpRRkFvIZstOU4+rXZ++bwzZ4/ZEkkWA4xAuIZiQ=;
        b=s2roQkxV9VZXUxsDiH9wRLyUqizdUU6JC9+4waCZ3Hhiuuj+/dkXlSZKJxW9ipRjCJ
         FegJuJNfXgjB8Cr9K5MHmBe8uwaIWnhPiop3aJiTSfOli1YAJD9LyVHKtM1pXQ7WXklo
         y9nwKyNnxQB3kK+AOlCg1x8qTcd0CVEjUH+s2tN3Ilgv/xIwBKnzi9Ejlqfwuj+YV12y
         b/sOrIxkM5eQrf5/T1oXHFfzu3A7MPGtCMbMQcvpHTxyW8fZgFWk8vVMJLMx+GF0ljWb
         uqh3fXtYZ5DGHBGMJ4RlkGZqcYYnePyiS7yN/UlzAYv114G4XF+PazfygJE6RrZZHAZy
         hCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708381449; x=1708986249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzrnpRRkFvIZstOU4+rXZ++bwzZ4/ZEkkWA4xAuIZiQ=;
        b=WXeDb/T11lou7s2WqYKOf3swxHeUYImpoOpVAfazYh+NyENncUyI3/gAulFHBuMxmE
         Bo78zNCMtEQz4ujs2XDIEa6ROJSWZxnZkG5cPGr842aB9LCrD4XuTXjABf9bSq+bOnXN
         1OvXRUnvYZw3AUChknq5bjSUlqfMK7cvpklJg3VWJdFBc/Hhljyo+4cu2DUBSV3vc5nF
         885QZkSfzKC5VC9IMLmBre55pXPKSAkVfWy1bN4jElj3U0C/BFsGAuqEpgH+NJMGze+J
         cnz4t8JJb2PTrB3cMSxmaNwZ6Gw2MvIOtzloRn3wOpJvqgZwL7D/vhXmhDG8SY27u3yi
         uNYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY5KaD8rAISLCdS213rNbbFMLe8LXBKWV+dtij8VRJijgivg2t+Gdeuaboq0jwV/BjzGDx01RFQLdVzi5HwqUsaq1KcpTVY+Wmxg==
X-Gm-Message-State: AOJu0YwUZAWPxOmcex8/uOkm5hrmtD75IEa1spu546NGZwi5LnACQVot
	jdwDI0uqqjFk3FEsrPG94pTXoISbtTou5HgzitA2yBDzhehLnVub7HLqb6M1/Q/9ie4Y7Ibyc7C
	6JOBmTlv69PGgAHRVirwAaTQ1+vmb9vBFZ1RlrQ==
X-Google-Smtp-Source: AGHT+IGC2SHUpgIeiRanQrH9qLO1ovUw3m2HxObJFK2it7sg4bghpkXlhep6npR0xO7Xf+MsMOgjnP6VfQwj68oLYTw=
X-Received: by 2002:a25:adc9:0:b0:dcd:63f8:ba32 with SMTP id
 d9-20020a25adc9000000b00dcd63f8ba32mr11579688ybe.65.1708381449555; Mon, 19
 Feb 2024 14:24:09 -0800 (PST)
MIME-Version: 1.0
References: <20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org> <08c312f4-f3d3-4980-b998-b28026b5180f@quicinc.com>
In-Reply-To: <08c312f4-f3d3-4980-b998-b28026b5180f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 20 Feb 2024 00:23:58 +0200
Message-ID: <CAA8EJprXguHxzYxC2W_HQ8u4MExSWs0o71Lyp6OhpWNYXWw79w@mail.gmail.com>
Subject: Re: [PATCH RFC 0/4] wifi: ath10k: support board-specific firmware overrides
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_142411_761398_614B4670 
X-CRM114-Status: GOOD (  21.34  )
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

On Mon, 12 Feb 2024 at 22:56, Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>
> On 1/30/2024 8:38 AM, Dmitry Baryshkov wrote:
> > On WCN3990 platforms actual firmware, wlanmdsp.mbn, is sideloaded to the
> > modem DSP via the TQFTPserv. These MBN files are signed by the device
> > vendor, can only be used with the particular SoC or device.
> >
> > Unfortunately different firmware versions come with different features.
> > For example firmware for SDM845 doesn't use single-chan-info-per-channel
> > feature, while firmware for QRB2210 / QRB4210 requires that feature.
> >
> > Allow board DT files to override the subdir of the fw dir used to lookup
> > the firmware-N.bin file decribing corresponding WiFi firmware.
> > For example, adding firmware-name = "qrb4210" property will make the
> > driver look for the firmware-N.bin first in ath10k/WCN3990/hw1.0/qrb4210
> > directory and then fallback to the default ath10k/WCN3990/hw1.0 dir.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Dmitry Baryshkov (4):
> >       dt-bindings: net: wireless: ath10k: describe firmware-name property
> >       wifi: ath10k: support board-specific firmware overrides
> >       arm64: dts: qcom: qrb2210-rb1: add firmware-name qualifier to WiFi node
> >       arm64: dts: qcom: qrb4210-rb1: add firmware-name qualifier to WiFi node
> >
> >  .../devicetree/bindings/net/wireless/qcom,ath10k.yaml         |  6 ++++++
> >  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts                      |  1 +
> >  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts                      |  1 +
> >  drivers/net/wireless/ath/ath10k/core.c                        | 11 ++++++++++-
> >  drivers/net/wireless/ath/ath10k/core.h                        |  2 ++
> >  drivers/net/wireless/ath/ath10k/snoc.c                        |  3 +++
> >  6 files changed, 23 insertions(+), 1 deletion(-)
> > ---
> > base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
> > change-id: 20240130-wcn3990-firmware-path-7a05a0cf8107
> >
> > Best regards,
> This series looks OK to me, but would like Kalle to review as well

Kalle, gracious ping. This is my proposal to fix the issue that we
have discussed at some point, wlanmdsp.mbn for sdm845 and for qcm2290
/ sm6115 have different features, resulting in kernel log being
spammed on the RB1 / RB2 boards.

-- 
With best wishes
Dmitry

