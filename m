Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA51CCD8C9F
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 11:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5NAJHcxzb5iVdVk5j6K75Yy6lO9LRzQdplxfReb0dE=; b=oLq1IbBUlz5621X8E5KpdrcBQI
	bKufqsRfB+8A+1thcKVWRoneA+pyeZufhY/4DaWudRgre2SE7bxYGfkfxHTGSFk1xKe1gqoEMjZ6i
	UwkU+rvbac+EKJJw0Fu4P/sLAqTltAUI2AYQM3CR5K6iEawF6RTas8L7MRYtyL6e4S+XxPopAQrWw
	jRveGCP/esHeI3n+2ZnJGxtLcGyOniPXJphCnxw+UKcrxX6muZzMVXedcGegcLoAw2SRoXPp+xFRU
	YEayfLT7vA3zYlvWd2ND/eieQYWYqEnFg64zgeyKnX2HtJUxTWcI2RBG9K3utnDYNPgLr9K4faDlP
	mAYReEzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWY19-00000003Pqz-2Yt6;
	Mon, 08 Jun 2026 11:19:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWY18-00000003Pqk-1HxA
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 11:19:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 05A0A445B4
	for <ath10k@lists.infradead.org>; Mon,  8 Jun 2026 11:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE861F00A0F
	for <ath10k@lists.infradead.org>; Mon,  8 Jun 2026 11:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780917581;
	bh=f5NAJHcxzb5iVdVk5j6K75Yy6lO9LRzQdplxfReb0dE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=IBsVzN3ogan36/89OV9DntGbgRlO4EaXnUSl9l4MdOfxxYGiF7wtHMJ/Vre/u0SPh
	 6LrQTxHcl/GimI+L88il4sYmFnvjJli3ro9qv4gcbWUAVdIu2VUru9+5iChQS6CNf0
	 KOmZtnyvu8OnqHxbc9gn5ZS/iqm1RYFnLXvzbgiyt4LafFAHIzykDtrfrc1igLJ8Vw
	 QlAMaOmQZnPR7o9OoVQKyTqFJ3ywv6pRPR18ji/sJftlYY7BHSWJ8CCqsT33hbU+tE
	 RwAB7znD0I9tXF5KTsW+Hgfc3DWr44iQYOYqZ0/oivzKPLv6P5hZc1SKl8GJgG8R2t
	 MhNqn2aBDsiSg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa66893e9fso4692090e87.1
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 04:19:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+zRB3YlA30VqR9bQWAykP61aKyw4IRaEgVKCk3WtkfhZk4Zh9VwIrjVlROVDU9tyF2COENiUY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdpkDGruT/8fHpzvOsysM4k72Zs6ComurHiWVrJ4Y9p411UZ65
	949WEwnNcmJ3ovis+UvdHSzYpiaft3yTzjLMcrEdGAd518+ze2Ga6EdkIH/xNUpdZSfEdVbhUTz
	G3yPIsGZcHqNtYFzVAfMJkZ2r9qxT6Hvz+riXOcwgHQ==
X-Received: by 2002:a05:6512:33cc:b0:5aa:6aba:76f8 with SMTP id
 2adb3069b0e04-5aa87bc8d69mr3784333e87.30.1780917580513; Mon, 08 Jun 2026
 04:19:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:19:38 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:19:38 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260608-block-as-nvmem-v3-6-82681f50aa35@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com> <20260608-block-as-nvmem-v3-6-82681f50aa35@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 04:19:38 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdRZ_7jzDErZOxeBYE+awL2fe1KcKqC=Yi1gDD28ra=zg@mail.gmail.com>
X-Gm-Features: AVVi8Cew2n-YmjEp_T_Fkca1TPT0Dv6DfUiL88X7yEcZLGkS30SEi9F-0nG9RjI
Message-ID: <CAMRc=MdRZ_7jzDErZOxeBYE+awL2fe1KcKqC=Yi1gDD28ra=zg@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
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

On Mon, 8 Jun 2026 12:50:43 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> Some devices store the Bluetooth BD address in non-volatile
> memory, which can be accessed through the NVMEM framework.
> Similar to Ethernet or WiFi MAC addresses, add support for
> reading the BD address from a 'local-bd-address' NVMEM cell.
>
> As with the device-tree provided BD address, add a quirk to
> indicate whether a device or platform should attempt to read
> the address from NVMEM when no valid in-chip address is present.
> Also add a quirk to indicate if the address is stored in
> big-endian byte order.
>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

