Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00247FA3726
	for <ath10k@archiver.kernel.org>; Fri,  2 Jan 2026 10:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhZD+26yEtIqCTAfVl9iT6ZYu15zs4sSgg8F7ighC/4=; b=v0JAdMSK6tIi6M/2eY4z/fZ7mx
	KIc0Jw20FGtVh09et7JDelWUuKTOxsuhsYYwbsN3H4gQJdD+5zmRVVVXM8+jtCUGOxpiJk4mu4ion
	l+iriDawhLEn+Fbt7vGtHKpAKIJxO3KwdNKFUXN2W5++C68xdOsR5HJwDUPMQwtrHGZLX4gC93I3V
	JKbzm5TyHN3wUJ2FgDktwCviB+fE5TIW1z2MZcA1k6ObJGjIN3/SqF/swp5uN+xMCYGeBHyLFI7tr
	ng9+KClxPBxzY5MuZCj3avdZbb8U1X6/GCr6QaAI0PoJns5H1AA1lK42M35tjWwv8W8cKfwYPbCjq
	sC/beW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbclp-000000085cV-0VIj;
	Fri, 02 Jan 2026 10:52:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcln-000000085bj-0zv2
	for ath10k@lists.infradead.org;
	Fri, 02 Jan 2026 10:52:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 837CD43DB8
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 10:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A09C116B1
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 10:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767351154;
	bh=mhZD+26yEtIqCTAfVl9iT6ZYu15zs4sSgg8F7ighC/4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=InwP9xW1I1ni08BlWGWK+GAPLve+MXWdoKdtr18MdtM9bF83RPLYXTL/LO5wfhsVV
	 2FVpYHiaVkLTWfu2SFY0Zu6nm4DP53mmoFHo2CIBJsJioSiCxZuN/G63RKPBz89sNO
	 VygW9iZcIfUvCZqP4BLQd7aooFXJDLzM0upAXsjfDCkWv0pVimk/JKi2BAltZY6j3p
	 oQJ0Fcbr124+NePC4LKGFpkKcPgUWjDCURZRYMBGQZMWjjGO/xdEtwZBbuxiAKT4P7
	 FP14WjR4nZmHPP1h4pB6ValPFNTqHR+PcsTiPpqKsZc1hOj7VnOwtMeAnSEk9CeLW6
	 Cd2yxy7XUDrUA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37fccf7035aso97182461fa.1
        for <ath10k@lists.infradead.org>; Fri, 02 Jan 2026 02:52:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWemBolgmnfNJobt7DGEee1QA/LoJdrpcu+gv79pRKPtvezV4nv1t9VF9G4uVTXitFjISI6qGE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzuqRcHax22LcAvhd8jNF8uTjxveVMwpaVZnPryQUG0CTnVnuDf
	xcjckux4r8gFZL1qk9FGJCIZSwqgwYuaWjX5WfRett7l7ulF52TT+0eOg8jZVJKd4E3WOkG+W5F
	ozPlvrA1W5feygWphCAHk1GpHaWuLZj6OXaHYuEGLIQ==
X-Google-Smtp-Source: AGHT+IEkijWZVdRyZfarXVptLNdfZhckPE7YTk4yGXdpMC27+XXwuO9MbWOVBe2OQdvs7v7NIIGKVSPwU/N6XBL+2jQ=
X-Received: by 2002:a05:651c:f16:b0:37b:b952:5e4 with SMTP id
 38308e7fff4ca-381216a3091mr116221171fa.43.1767351153062; Fri, 02 Jan 2026
 02:52:33 -0800 (PST)
MIME-Version: 1.0
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com> <20251231-wcn3990-pwrctl-v1-12-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-12-1ff4d6028ad5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 11:52:21 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mc_EMHUAoZo5KhBGkwX4+ahpD6mp1T+C_snZ1OYwyPnkA@mail.gmail.com>
X-Gm-Features: AQt7F2p_C5Mpx5B7tQglyUSRmxWjVo8OJ-K5UDM9nvA4aAjRO8UklT0vre9Z7fM
Message-ID: <CAMRc=Mc_EMHUAoZo5KhBGkwX4+ahpD6mp1T+C_snZ1OYwyPnkA@mail.gmail.com>
Subject: Re: [PATCH 12/14] arm64: dts: qcom: sda660-ifc6560: describe WiFi/BT properly
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
X-CRM114-CacheID: sfid-20260102_025235_295075_AA09B286 
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
> The onboard WiFi / BT device, WCN3990, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

