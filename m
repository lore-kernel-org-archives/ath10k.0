Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2504CD37B9
	for <ath10k@archiver.kernel.org>; Mon, 11 May 2026 10:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IENORfZd5dSYQkrNitKAXWYKfDtZSTBMvfDRDDw/UDU=; b=IjjLUy7RrIL+JW8L2inhyn+6jZ
	/+9NgYxZhvbN7Xd8WxEWrsvKa+Hv31KMZq0wmBtaq11h5rfdF1oxQup+qP7RKNkA6aS2HM0P/QKpH
	am+94gEtKn136OCpjwAUYuF0GAl0CZxZfq/kNHpHxiCL+EaAWMb8sAH+sVu7a3BZ5fzjl1QU/1dPJ
	1XFZlt45sYEV9qOljSuMCIsWpCwNlrhoeSF12DPuibo5WakF4JP75PZnpeUlP96YSqIwUEy49R3kZ
	bD3V6b+N//88Bc2Eiv5VPh4ib6KqirJPR9cmSkOqGTnPzI6Qk+6ct90a5b8VRD20etrXpWZ+zzL5v
	m/A8YvIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNzu-0000000D7cE-25or;
	Mon, 11 May 2026 10:36:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNzr-0000000D7bq-3Nqh
	for ath10k@lists.infradead.org;
	Mon, 11 May 2026 10:36:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1747D44514
	for <ath10k@lists.infradead.org>; Mon, 11 May 2026 10:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0611C4AF10
	for <ath10k@lists.infradead.org>; Mon, 11 May 2026 10:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778495782;
	bh=IENORfZd5dSYQkrNitKAXWYKfDtZSTBMvfDRDDw/UDU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=UTuAx685dUHhXY1vmr4J20mhBA7yb5/tBU2HA3whjbnByMPWJp90i2ZMTYOSC0EeA
	 Wwl8i9/vk8aPLtXV1CowQWl6Ut8EyCvV2uU6bPQPmeM9W4L++LuVWNXWs15zLAhMUG
	 oe00G4W2qZLaXZCVpfV7uH9nxTTUHzoc0M9H72ivRlX/NAn3LVomvj2CJasqtJ1WUm
	 tPHdaHVYOtydmAMXf3ylAL2/vQdBzceGQOLw5N4QZSIQZSl3MSH3Ei0GcJVr/pOvgN
	 wiLfPjS7r8jPIGlFPwqqGobTQsXEFTmIUQ8RK3Qa44ZIevkoE2xiv28sEybqbi+4d0
	 h9EytHNbVCG2w==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a8721851e2so4395821e87.0
        for <ath10k@lists.infradead.org>; Mon, 11 May 2026 03:36:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/XjarkIqPd1YU7t+/pA9aELtrn2VFoJ1Poz6lIKGMwJyPEELwTf801OOGWo92VOs87eYTcToc=@lists.infradead.org
X-Gm-Message-State: AOJu0YznBPGloR4O2Nu91tYv9dPvFQr4zi1Wp/PVS12DRl7F7i/DQ0zr
	XMz5VbUM24OQbf2j7ud5kFz5Opm0ORYVgVjE+AFmz94plsvyhXX3Yh5YgkKp8yvv21/4hyHPx4f
	IoA1gf8PtKsHVgkGHZM+oVoX5wacB1QlGizO7srvLPg==
X-Received: by 2002:a05:6512:3e1c:b0:5a8:b966:7b1f with SMTP id
 2adb3069b0e04-5a8b9667b9amr3508208e87.16.1778495781398; Mon, 11 May 2026
 03:36:21 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 03:36:18 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 03:36:18 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260507-block-as-nvmem-v2-5-bf17edd5134e@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com> <20260507-block-as-nvmem-v2-5-bf17edd5134e@oss.qualcomm.com>
Date: Mon, 11 May 2026 03:36:18 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdi5DuwhewSpaPCJCWWkmw57pLPx3snSyV_gtBN1gWtMw@mail.gmail.com>
X-Gm-Features: AVHnY4LRJOdRAiXXJAqk3x0LB0U9Hhhkl-SHYK7hw0ni4PNj3Dx_sfKHg57uYFk
Message-ID: <CAMRc=Mdi5DuwhewSpaPCJCWWkmw57pLPx3snSyV_gtBN1gWtMw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, daniel@makrotopia.org, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_033623_881001_9E1123F0 
X-CRM114-Status: UNSURE (   7.07  )
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

On Thu, 7 May 2026 17:24:40 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> Factor out the common NVMEM EUI-48 retrieval logic from
> of_get_mac_address_nvmem() into a new of_get_nvmem_eui48() helper that
> accepts the NVMEM cell name as a parameter. This allows other subsystems
> (e.g. Bluetooth) to reuse the same lookup-validate-copy pattern with a
> different cell name, without duplicating code.
>
> of_get_mac_address_nvmem() is updated to call of_get_nvmem_eui48() with
> "mac-address", preserving its existing behavior.
>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

