Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01165CDC188
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 12:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/AXtsquxLed+ySE06dARKOfxnmgZRXhHOdHAbXM3ER8=; b=qCWmc+3Plm9DLgZTRgR5mpHyS+
	Q4qMdIkBT/KX+g5uh9rF6X/KDOj4y0v1qRl+yKdwZYKiusV7U+j3SBma8lNRg6aOnCSFZT1hVYtZO
	vyulob2wstZixINZkBv392nRE98Gn1FLQkj1YeJbs1NWXxfl9F7lcthDouDihLmGx6HTDq7QEz53f
	4ca006jKrllA5LQF6cI6tXn1P3NGtpcrfGgGHclf0+T9gpyEb6c3fq9yv+vU9Uq4yeFh2SJ6IK5hv
	J2juz70/NpdVQet+cFquCJv/kSpOl1ZiEt4J2SSh63E57BNj5JYfL2MUKxSx/6dOD2aNrPWK7GBO3
	FkUHkOnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6Kg-0000000D0mD-254t;
	Tue, 06 Jan 2026 12:38:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6Kd-0000000D0lL-15QN
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 12:38:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE9B043D6B
	for <ath10k@lists.infradead.org>; Tue,  6 Jan 2026 12:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD617C19421
	for <ath10k@lists.infradead.org>; Tue,  6 Jan 2026 12:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767703118;
	bh=/WJ3FXylxb75JjfkAYrSDskdl0Pr5JcXSOfrWa9vX2M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eBijw961FdVqdQ5lzqU/ESM00AOiadOqx+ua0ZRGi8NdxZOi0LmsS4uMs8po6Cb0O
	 5TMhTC1pqRmu5yMhNHRR+d9WYEpa5PYeh2yArJhCA70XzCJpBcWfx41mNkMu0g87H7
	 xo89EoRPkf34wKF1WWhYht/GJw/1OcOhYW0wZp+ouQonriPSRbIJVqOczclQENQpIe
	 N8Gjs/7c0iTXE66WYqZPBMwfi2/XNAtnLCMO3RPd6DP97ZzSdEoYSqQ4ZTSfsUnQ12
	 xGnHMMTQLsb/EQJU/s/eAr+K2BKAJOufY6CAyLHUMxqYPkOXol0F+D/fjg/dimDcik
	 qXCIufIZGv6/A==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-598efcf3a89so908197e87.1
        for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 04:38:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPAWoiHsb5oj58Ebjn3NqhM4+wry0wt6xZM9Fe2Ok4S8XDbCYoSQjlPODyfhuADjvvx/Xiybw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnvrKmz9uG7GyvlYAZWLfZlJdIZ0AW0B0wxCvCcbuaZ4fsMYlr
	26/yDkAL6b4hv29haVNCOoRZA+eiZ9rouoJuTY7StY8vOnOBMNCa3mwq1c2mjfawaUTi/1m1zDu
	Uavs9vusEgrmutbiCIAErXQ1wBvkR9vFe9YVocuXkmQ==
X-Google-Smtp-Source: AGHT+IH/5oi/Mm4ylt/aH4A15j/ljVlSgxeG2MAOav7Sf6QITgCC+i0rM7ktFn11IEgwttpux/NAggqCjE5gcEsv344=
X-Received: by 2002:a05:6512:4010:b0:598:f2e1:f616 with SMTP id
 2adb3069b0e04-59b652b8202mr751335e87.29.1767703117392; Tue, 06 Jan 2026
 04:38:37 -0800 (PST)
MIME-Version: 1.0
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com> <20260106-wcn3990-pwrctl-v2-3-0386204328be@oss.qualcomm.com>
In-Reply-To: <20260106-wcn3990-pwrctl-v2-3-0386204328be@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 6 Jan 2026 13:38:25 +0100
X-Gmail-Original-Message-ID: <CAMRc=McxGOejmegC9KaNLpCbxSL_CWmPC2PwfQGxQ+vaHg+rOw@mail.gmail.com>
X-Gm-Features: AQt7F2rrsJVu7GLT96AFg8gb0rDx8lEL223Ap08R9PVwfe0DiaVCdXK84QTL9yQ
Message-ID: <CAMRc=McxGOejmegC9KaNLpCbxSL_CWmPC2PwfQGxQ+vaHg+rOw@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] Bluetooth: qca: fix ROM version reading on
 WCN3998 chips
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
X-CRM114-CacheID: sfid-20260106_043839_491113_85FB2880 
X-CRM114-Status: GOOD (  15.34  )
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

On Tue, Jan 6, 2026 at 2:01=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> WCN3998 uses a bit different format for rom version:
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
> Fixes: 523760b7ff88 ("Bluetooth: hci_qca: Added support for WCN3998")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 7c958d6065be..86a48d009d1b 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -804,6 +804,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baud=
rate,
>          */
>         if (soc_type =3D=3D QCA_WCN3988)
>                 rom_ver =3D ((soc_ver & 0x00000f00) >> 0x05) | (soc_ver &=
 0x0000000f);
> +       else if (soc_type =3D=3D QCA_WCN3998)
> +               rom_ver =3D ((soc_ver & 0x0000f000) >> 0x07) | (soc_ver &=
 0x0000000f);
>         else
>                 rom_ver =3D ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver &=
 0x0000000f);
>
>
> --
> 2.47.3
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

