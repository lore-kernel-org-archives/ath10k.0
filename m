Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70383C43458
	for <ath10k@archiver.kernel.org>; Wed,  1 Jul 2026 09:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KW9lh2K1hAahuirGr9kTW9/S1N/x4cAospR02gArHJ0=; b=Bxs/5GsEGhWp/6crLpJMdaIRFo
	2lsSxAhWhZDBBNRwh2jGlHbKHjliGOrwYY4YZDOzy90L1YBV3U8mG6Fqe60c88s+jTofpv4tQDQv5
	aoJJDtal5x52Pgx5YPMOwDVfQkVs0ToF1BZpXJNodZMGgg+nfKosrW4z3zIxk//frebMmKm4NjKoX
	/krd5UONPBWllmknEfoeBvwsJwl8wCVnkwNJIgXzlvJNn3GrRdI+o5eZW10u08+bGb/b9oGqJ93wb
	DSG+/C5wwGYwKVD2iKSgEDOYo4aDkfa7pwLREtj+L5MWa6PF7nPeWRfzD1HOht1DjCMX1Fo1uFJnu
	cP9KA/mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werix-00000001GCx-3PiP;
	Wed, 01 Jul 2026 09:59:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weriw-00000001GCH-2e9Z
	for ath10k@lists.infradead.org;
	Wed, 01 Jul 2026 09:59:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C68A601EE
	for <ath10k@lists.infradead.org>; Wed,  1 Jul 2026 09:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9EA1F0155E
	for <ath10k@lists.infradead.org>; Wed,  1 Jul 2026 09:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782899957;
	bh=KW9lh2K1hAahuirGr9kTW9/S1N/x4cAospR02gArHJ0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=bcxMOZy9+wUR0cIUa+U1DVQq23msK1GibupFls02SsSVec7WdoW+TaetCQmXuipta
	 75k/2KwNSJr7otVAL4jymBh8anWy6sHRyFNjlIDfZmbmDfCTNsStAcOhv31x0ivjQf
	 ooL1jlEQVfHJR53vjnmqNJ9OthmUgRGXccG1cosaT90q7Jh7xUooxf99keLu2hIfL8
	 f81yxjgpJIHT0GXG1uSI+WmPQIl4G0Kieunbvsnd2Yy6HVPRSLyxlMOrRUjvg+fVAl
	 DUAWcbtn/H6ycrJNXoKzsP8lYflD/0GOP+hByBLl57HhPfnuqXzEXLvtq/Y6fM2GAv
	 eqFtVbdgNSa4w==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so560228e87.0
        for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 02:59:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqqIEibtF4dKwbaiFojC4OMbb4Qw9R5Sbarp6GTL6BtjVMfVirZLcu34dDzsVyTp0rW44KEeik=@lists.infradead.org
X-Gm-Message-State: AOJu0YxzehXdlqjNCP4hFg9Abcoa5qLgQj87wZl09v5ajP87y0xhS/EO
	QqQHGIQN5BXhGrR0H7UVZv9ZeXRoMnFomKC6xBlhLokc927MuO+5mLE5JFl/0mG+/zsT2xXphTh
	VuvLSLei4BYU8v6YS1L0hoIZ2+UBpunPV5MVQilGI2g==
X-Received: by 2002:a05:6512:2585:b0:5ae:bcf7:a741 with SMTP id
 2adb3069b0e04-5aec67a5104mr254124e87.18.1782899956542; Wed, 01 Jul 2026
 02:59:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 04:59:14 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 04:59:14 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260629-ipq5018-bluetooth-v2-2-02770f03b6bb@outlook.com>
MIME-Version: 1.0
References: <20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com> <20260629-ipq5018-bluetooth-v2-2-02770f03b6bb@outlook.com>
Date: Wed, 1 Jul 2026 04:59:14 -0500
X-Gmail-Original-Message-ID: <CAMRc=MejBiWKB74bz9ZD8HWgm+ZGG1ed7rRJsoaPFZcRWzC-kA@mail.gmail.com>
X-Gm-Features: AVVi8CeyT1GrSjfr-2uV0qlk0nwk3b4g-mFQbPvHBLEEqLDXk1SdAU72dFgl0qQ
Message-ID: <CAMRc=MejBiWKB74bz9ZD8HWgm+ZGG1ed7rRJsoaPFZcRWzC-kA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] Bluetooth: btqca: Add IPQ5018 support
To: george.moussalem@outlook.com
Cc: Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <jjohnson@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>, Saravana Kannan <saravanak@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 29 Jun 2026 15:01:45 +0200, George Moussalem via B4 Relay
<devnull+george.moussalem.outlook.com@kernel.org> said:
> From: George Moussalem <george.moussalem@outlook.com>
>
> Add the IPQ5018 SoC type and support for loading its firmware.
>
> The firmware tested has been taken from GPL sources of various router
> boards. Firmware files needed are:
> - qca/bt_fw_patch.mbn
> - qca/mpnv10.bin
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

