Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D23CC43458
	for <ath10k@archiver.kernel.org>; Wed,  1 Jul 2026 09:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydO8Ft5Urm5M09KG8cScRhJ3iye6Vu29eRTcwv+lefo=; b=QN4bkI4JAUIQNXRgez/UAEwXQw
	wLx+O/EVQEftM/60RkNxz0xJY1zg3SaljIWQy3HSbFt2w+34t9PgXl1WZ+pqg8uYL494N+XU+6QNA
	pBbJEgs33bQb77r4h38hsPO1+4UBVq8ybzsMOnJC4Gj0rbz0yoS6pV8gdAVweX0obW90gjTEiNbsT
	S6FHXQ8iZ5UISI61kmE0OZ7QBPGCv5B7i4zUls50ozKclA7hdIqCwpgxfcD0Eu3OGn5LVzKDmm3rx
	aTxYd5Sx86L6Isj67a4BUqRymDE4vaEULcYOKWzuIosnG224A4V++o5Zt8UizBuy75QygXlPhtIjs
	KtEF92YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weriL-00000001Fqx-007P;
	Wed, 01 Jul 2026 09:58:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weriJ-00000001Fqo-3pej
	for ath10k@lists.infradead.org;
	Wed, 01 Jul 2026 09:58:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F08C44061
	for <ath10k@lists.infradead.org>; Wed,  1 Jul 2026 09:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E6C1F00ACA
	for <ath10k@lists.infradead.org>; Wed,  1 Jul 2026 09:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782899919;
	bh=ydO8Ft5Urm5M09KG8cScRhJ3iye6Vu29eRTcwv+lefo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=MaL/yjKM23uRludhdmmZ/pKii3StVcH78bbsWWybDYwbISt2i7e25j9KBm/ltPtyN
	 XGTqeiB7Ui1fTWOKe6cmbDOaCa0Gh2ukI1Blgh4/JscEquN0V7NidxbWcCsMFv+Jd5
	 zQ0wlXT1RcXbBR8YbeJ4zQJVuoPwzoSktWAr5ZLETC3SShkGudys8nIebgKuotKHkP
	 IX/H5FlnXGYAgS4ozo7QnUmxjTPjq8d3Ak552DqwKFVad8dtMolWhL9gdsliRc1QHb
	 BhmUGZrXTuZoVIIBCLI8L+AAXP/DLxfCSDDCslKePeVul25emIdooLYApll/O+VzH1
	 yilRymzKctFNQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aec201b582so451494e87.1
        for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 02:58:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp/538lNPo5osAL9a/xpTNTC8OyTnQdlR1oU+a/T6PsDuZFkGMRfC3mds381c/X3XFi/j2F12I=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEzMvhI+etOfAFMGAcXeUBTIDLxqUoEq/tO4rlqiGUHCA1bYYB
	yTQ+ipJjFx5YYdaMGsawMnxWcK+B9Y4VIN83PMyhK6JpCbOkAKNgaasiXKxLEEa1CyZwD/IkWHF
	jypQr8iY/s06HGo87ozrXVtCQklQGlA3cFuaTjGIxbg==
X-Received: by 2002:a05:6512:a34d:b0:5ae:b952:6c with SMTP id
 2adb3069b0e04-5aec6797747mr213198e87.13.1782899917728; Wed, 01 Jul 2026
 02:58:37 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 05:58:36 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 05:58:36 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260629-ipq5018-bluetooth-v2-3-02770f03b6bb@outlook.com>
MIME-Version: 1.0
References: <20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com> <20260629-ipq5018-bluetooth-v2-3-02770f03b6bb@outlook.com>
Date: Wed, 1 Jul 2026 05:58:36 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfTh4-RM7R-Ku=MFjo2EQLoe9dt5-AFBtrMx+zZJRHKLQ@mail.gmail.com>
X-Gm-Features: AVVi8CcMVsM_VtMs4RD3avK1gS-7SxkMAq-P9mHbEgm5Sdw31SbqOo7iHTS4Zj8
Message-ID: <CAMRc=MfTh4-RM7R-Ku=MFjo2EQLoe9dt5-AFBtrMx+zZJRHKLQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] firmware: qcom: scm: Add support for setting
 Bluetooth power modes
To: george.moussalem@outlook.com
Cc: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
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
	Philipp Zabel <p.zabel@pengutronix.de>
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

On Mon, 29 Jun 2026 15:01:46 +0200, George Moussalem via B4 Relay
<devnull+george.moussalem.outlook.com@kernel.org> said:
> From: George Moussalem <george.moussalem@outlook.com>
>
> The Bluetooth subsystem (BTSS) on the IPQ5018 SoC supports setting power
> modes which are required to be configured through a Secure Channel
> Manager (SCM) call to TrustZone. However, not all Trusted Execution
> Environment (QSEE) images support this call, so first check if the call
> is available.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

