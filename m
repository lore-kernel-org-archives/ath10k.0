Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC577FA3726
	for <ath10k@archiver.kernel.org>; Fri,  2 Jan 2026 10:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCx5AAentnk4QBvWh8rauxDanszvphvmntZcvGZ11JI=; b=R59MJZBQ2iA83LLHIkNUdDPEsy
	o3b598vU6YJv417liyIv3p1UKlPEkoDfNtvhOyfbbE1mqBtVvDWLs8x+ZE/Fpzpx8g3OeHNLpV0ja
	/txhRkB5vjDX7qdyrjl1AWfYKCP860AnunZ9fXpFxMR8sh3M0zg8vW59WJa4xM+Mbf6fRUzd3ty2R
	xig0KffmCpK2RS5vtFDP2sfttfBblx1SU9SuzRozkOrrbri9NCI4Ms9OyjEWVLneso1tdMkgjV7T+
	2llJFR+SWtluXuAVkhG/xsM/nuHDmiwcBrv+0aQvZ4OxX4ENBAxlP44bAF+ZF43z9fom87kaMuEL3
	mZccC65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbckc-000000085Ls-1Ovo;
	Fri, 02 Jan 2026 10:51:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbckZ-000000085LM-3BEK
	for ath10k@lists.infradead.org;
	Fri, 02 Jan 2026 10:51:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CD8F44312
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 10:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE814C2BCB7
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 10:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767351079;
	bh=xCx5AAentnk4QBvWh8rauxDanszvphvmntZcvGZ11JI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ERchD51MB1D4chMBJnCAi3SlK+C9HNN5rmPtujFRTW8r6NnDnucrebDxccoXl7/0R
	 ZWpl22I5yZrov0ltt9Vf6sk551xg3AUMgpU62J/vZ87U8HYO5t2rNHQCwETVRkjftK
	 uFAzt+sBNagP3oIFuSvi95VYnrb5M6UBeDktEPv6wsNl9uMQyZWPO6ycuqga7/Iyls
	 w274UfqoFddWQibz4WQ2psUy9IoxMI8JtTU9lxvT7a6eRqMPRciuyVCHhXMDxpiG+j
	 tejjZaDRbGs4l6+5x34zDXLaAm3w1fz5g9lybkAar8YP00xCmvjHaDA4DSUERoBg1L
	 4kP1R9X0ZHpZA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37bbb36c990so110769951fa.0
        for <ath10k@lists.infradead.org>; Fri, 02 Jan 2026 02:51:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU74xYdQIq8Vb2sTsA/Sno5qNUDL1xRC7U+cLlQNKDquM3DriEqA4EarH37CXlG03Ea6yLMGCo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0VJd/too1xAmll6vwYPKr5b/XP7eNcd26Hoav7ETyW/9lzBdL
	lwkjpo/M1h+EGsB2/EICQ126o643vyUlMM9UFfpXh1rskPN0xEvWnUDqJDA/H8Fw4jCGepT0U5I
	7HuSE5nmay19ES6QumW/XnpNz93MyTOB1B5CKMlNKeA==
X-Google-Smtp-Source: AGHT+IHsTD9adaJDmyGmY1It23ntuHwPKruzTO4CUZ5lqrhgY5dCs2ctjbHSYlm1/KVO3NQ94ib9c9b+lWmDxYLnems=
X-Received: by 2002:a05:651c:50f:b0:37e:6884:6756 with SMTP id
 38308e7fff4ca-3812081e6dbmr136602621fa.14.1767351077385; Fri, 02 Jan 2026
 02:51:17 -0800 (PST)
MIME-Version: 1.0
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com> <20251231-wcn3990-pwrctl-v1-10-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-10-1ff4d6028ad5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 11:51:03 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf+FFEQPb1vvaY09_P=jCuzzFw_ZyaV7xB3BEdbWveU1w@mail.gmail.com>
X-Gm-Features: AQt7F2pqkjKwFIx8hZpIu-TfXbr4Nzd5pfqyrhbXe7nGgy4iKw45mcVh-sFbf3Y
Message-ID: <CAMRc=Mf+FFEQPb1vvaY09_P=jCuzzFw_ZyaV7xB3BEdbWveU1w@mail.gmail.com>
Subject: Re: [PATCH 10/14] arm64: dts: qcom: qrb2210-rb1: describe WiFi/BT properly
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
X-CRM114-CacheID: sfid-20260102_025119_822822_E6AC4D8F 
X-CRM114-Status: UNSURE (   9.16  )
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
> The onboard WiFi / BT device, WCN3950, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

