Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90C7FA3726
	for <ath10k@archiver.kernel.org>; Fri,  2 Jan 2026 10:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++N4oU6j1RUiKK9UE3P/jRCn1sFUVQE6hBvuMdCpIwg=; b=UPLHpEMA7XpTUzcZi9qh/xAEo3
	R/12417HWqlPjBAj1LPSo79yGMpL4vbEFPbg0AMNnzkdxRf6c3PGfEywQ6bueaBO0QBHy9BIkKoYV
	T4u9K4H2GSyW22MgU5uN8JsqjX36FauanSpO8UUehE43kGZVur2YpM/uqLooxQsBg2HdXXslAExLo
	cqb93uKobublBE8z0rxx6WsN8NJxMDleJEzO+JrYjdBxfOH/v/UCJTdiCDw3UmAjGULc4ahMQ+vlz
	2b+2iNTEdeR02Ac7vKZSUOW+RR0kbLLCe+2sKJCR2s/yvEJXWK+STbV32sFGuT8bktgaudoxyg8pU
	g95+wF/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcqP-0000000866b-39YS;
	Fri, 02 Jan 2026 10:57:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcqN-0000000866H-0Wbw
	for ath10k@lists.infradead.org;
	Fri, 02 Jan 2026 10:57:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7049043DB8
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 10:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53475C19423
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 10:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767351438;
	bh=++N4oU6j1RUiKK9UE3P/jRCn1sFUVQE6hBvuMdCpIwg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RY4PZqWkZ4cj4mGAbTkNfYfflY1d62XwekKfzzwhYGAPqMaO8/gKBJdLMSwSKE0Ry
	 vE6KLAi7pYlmHGJscxRt/Wdo2c5T4wtwr2s5sGtS8hkhA5Gje4FaiO9v2bLR2cr2O4
	 hCrMmwn6DMAtwysZmO1WdtGc8kdrmK1unTdFfxR3nl92Y9h61yED394BLP6EFs9ikd
	 13Oh0D4YtLFoljTlp7PljwKpCOi5qbwslJ+1jjv0BA47WR4iGXRd+IZXDlvB9GB/k+
	 Gd2NPQxg/JzXxd4Z8RmdJEihcFKzjQXJYr6tbhO7l5ubzi4AvGzU4Q6T5i27VzAjRS
	 Q1oOGEvE4/rtg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5942b58ac81so9737181e87.2
        for <ath10k@lists.infradead.org>; Fri, 02 Jan 2026 02:57:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVhctjUFVfosluQ47JRNPdQOFcIJ8SVKe4DJVAilwOOXKU23HKGYoh2x+fdqFVXtK4FkIEUhVI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0dPI3c86N2IQjTouCp8k6FHUnkypdV7JP/okaSc2l89GT8az4
	IM2roLtTWV5A3odJxuu/I0QtHFlvm7DB660fjLaWzjHc9lXFt80Sdh2e9Adg3D9xN+aorZlDPpa
	lLm4tDWazERC5jL8YSK1tMlXYdCWbcgjJP+II7zucQg==
X-Google-Smtp-Source: AGHT+IH7UClkfKSL9o0IyUvVqCuCUzyF1Fl/7eE9ZBq3Fcg9opKiKnrqvysGr/g9X3iKm+++K/xIFNN3S2f1rN0ocKc=
X-Received: by 2002:a05:6512:4020:b0:594:2e9b:f28f with SMTP id
 2adb3069b0e04-59a17d7203amr14881198e87.7.1767351436956; Fri, 02 Jan 2026
 02:57:16 -0800 (PST)
MIME-Version: 1.0
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com> <20251231-wcn3990-pwrctl-v1-2-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-2-1ff4d6028ad5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 11:57:04 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeTeYvonCostCDjW1M3LPSxQeWsLW=KziOXC6UO7XJ7-w@mail.gmail.com>
X-Gm-Features: AQt7F2rbYGQpmqcDgHn3YY6rLPZYpWQ4KhJGUlNFoil6eYDE-QawXo4wPu2S78o
Message-ID: <CAMRc=MeTeYvonCostCDjW1M3LPSxQeWsLW=KziOXC6UO7XJ7-w@mail.gmail.com>
Subject: Re: [PATCH 02/14] Bluetooth: qca: enable pwrseq support for WCN39xx devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Matthias Kaehlcke <mka@chromium.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_025719_183545_60116F51 
X-CRM114-Status: UNSURE (   9.36  )
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

On Wed, Dec 31, 2025 at 12:36=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
> voltages over internal rails. Implement support for using powersequencer
> for this family of QCA devices in addition to using regulators.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

