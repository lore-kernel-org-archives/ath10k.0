Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16807E9410B
	for <ath10k@archiver.kernel.org>; Fri,  2 Jan 2026 10:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEyHPqFv3DA6YQvHPfOh/cYjkTzRnhwKg+vXWLIIHCI=; b=FjwLgt5rKM7o7+w7k5yDWcD9s1
	dhIbQsCE8+l6QNk6OfgW/ZPreQEajVvOYfvfHuSHXXj7UEI92UclE8JC+lzq6DrDf5Ax4XS58GE+G
	TAJFbwC11czwj4z9znc9J2ir7pGBat5YTbj3AsBM6wNB+BQ+K7svNaiAMBe4owdIb5YJS41LrDFST
	Etr+bVrFeq3QXvmNrhkJTrXgeaCcTOgV+MHua0ISDgbVB/aBkNhfQCD9tBhK3TJGTH+Tfqmx3H5tm
	hLmBVjR9fq1nxAPZHp4dbiFFDy9N+FaM3MCEAOunGuIYZGSBhXCO6k4HvwL9P/q26V1E4X4byIZbs
	jnegkjOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbclL-000000085W3-3HtW;
	Fri, 02 Jan 2026 10:52:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbclK-000000085Vh-0CTV
	for ath10k@lists.infradead.org;
	Fri, 02 Jan 2026 10:52:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21E0560126
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 10:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC5DC116B1
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 10:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767351124;
	bh=xXAn347RsD6hgQZouoWZ55FlGcQUQLUmECm4fuYlljE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cMcF12wgtYhlzl3OOC513tR9kI9YefWSLw6YLI3AnXUMeelHrOOT4o+H0j0sNKARv
	 Zs1/81nmx3Wl6bc+FmsVPDXOLJSNr6OfB8t2kkxf5FkgzepQ2iBV1MizSmnuaO7ePC
	 RQthPeORjpyl49BIEsKNXPi+P7NAqjbOgQz5ugkqFLk/6l4wyphx1FmGJmTQRYH5Lk
	 +Fk973WN8BwfCra57/+VnE5j+0UHmcYO7HWfIy2hOUjaLtMxQTOOQE+ETLo7ZT7ICW
	 yxvxwhGJknjpsm3uNDgUAnOP7ywqgZOI+5/ZZhHP4E/Z/2iiSd+nWp/jBNm2pUE79S
	 SIZRiw6uk26ww==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37bb8bef4cdso114301901fa.3
        for <ath10k@lists.infradead.org>; Fri, 02 Jan 2026 02:52:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUx6Z47wkMr0xvbB9nnTuwFOg64wOyuEWvxA7zy/Jvj5InFx8WekKGJvgyUZI6cpgDc+Hk7AJY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZqrxM14nQzpw1aj3f8FKg8kIL4I1Gt1puL06reOcBbFFCwWJW
	lFIHRLfDdHstbwkzvuGnb6wt1BFzFSnTiYarXNeHV7DIFjR76HRKA1oLLD7DMnpVGuPjhsRWQxo
	wZmYVYOb+RRP8sJ7+6Jc2iLWyPF2ua6xVuEuicAxWFQ==
X-Google-Smtp-Source: AGHT+IGEB230wg4WPQ884wIw4d+xKW3xm3mX9tpow6yKELEID6v10VfXcSi9Pm/TOi4IGufi44ofR27WYzi/tTVG1Cg=
X-Received: by 2002:a05:651c:3244:b0:37f:cc5b:de41 with SMTP id
 38308e7fff4ca-3812158ffddmr117742161fa.9.1767351123504; Fri, 02 Jan 2026
 02:52:03 -0800 (PST)
MIME-Version: 1.0
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com> <20251231-wcn3990-pwrctl-v1-14-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-14-1ff4d6028ad5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 11:51:51 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeT8PH+TXX9pYgqb3eo61zt0JqorRDSJV-LPNDmuwyYFQ@mail.gmail.com>
X-Gm-Features: AQt7F2pouAlQJ-sMEsiHWRttM9wH4yG7LpdTIHvF2QWzScSglHBPWDDULB8nrvY
Message-ID: <CAMRc=MeT8PH+TXX9pYgqb3eo61zt0JqorRDSJV-LPNDmuwyYFQ@mail.gmail.com>
Subject: Re: [PATCH 14/14] arm64: dts: qcom: sm8150-hdk: describe WiFi/BT properly
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
> Properly describe the PMU present as a part of the onboard WCN3998
> WiFi/BT chip. Enable Bluetooth part of the chip too.
>
> [    5.479978] Bluetooth: hci0: setting up wcn399x
> [    5.633763] Bluetooth: hci0: QCA Product ID   :0x0000000a
> [    5.645350] Bluetooth: hci0: QCA SOC Version  :0x40010224
> [    5.650906] Bluetooth: hci0: QCA ROM Version  :0x00001001
> [    5.665173] Bluetooth: hci0: QCA Patch Version:0x00006699
> [    5.679356] Bluetooth: hci0: QCA controller version 0x02241001
> [    5.691109] Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
> [    6.680102] Bluetooth: hci0: QCA Downloading qca/crnv21.bin
> [    6.842948] Bluetooth: hci0: QCA setup on UART is completed
>
> [   81.510709] ath10k_snoc 18800000.wifi: qmi chip_id 0x30224 chip_family=
 0x4001 board_id 0x55 soc_id 0x40060000
> [   81.521713] ath10k_snoc 18800000.wifi: qmi fw_version 0x32040163 fw_bu=
ild_timestamp 2019-10-08 05:42 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.H=
L.3.2.0-00355-QCAHLSWMTPLZ-1
> [   81.554143] ath10k_snoc 18800000.wifi: failed to fetch board data for =
bus=3Dsnoc,qmi-board-id=3D55,qmi-chip-id=3D30224,variant=3DQualcomm_sm8150h=
dk from ath10k/WCN3990/hw1.0/board-2.bin
> [   85.467464] ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008=
 chip_id 0x00000000 sub 0000:0000
> [   85.478132] ath10k_snoc 18800000.wifi: kconfig debug 0 debugfs 0 traci=
ng 0 dfs 0 testmode 0
> [   85.487223] ath10k_snoc 18800000.wifi: firmware ver  api 5 features wo=
wlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> [   85.758168] ath10k_snoc 18800000.wifi: htt-ver 3.73 wmi-op 4 htt-op 3 =
cal file max-sta 32 raw 0 hwcrypto 1
> [   85.901630] ath10k_snoc 18800000.wifi: invalid MAC address; choosing r=
andom
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

