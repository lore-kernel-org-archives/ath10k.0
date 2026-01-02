Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAEFEEE25C
	for <ath10k@archiver.kernel.org>; Fri,  2 Jan 2026 11:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ed7RDAjwn9iwBRh42Afbw093dRBayGQXTzTuSH3+kwY=; b=lcu6JvLanzN94gnYr9/P6LigKe
	EfJ95q2TW/mCYDJQ3OOVBSrG9TmMJSInR06JUFB6qo2azenzj0Fw8Gh8DZOid5T3OIX5vwhYewtGM
	Ueyut1q3xymM9SfEu65iAdtinNKoMfNscovvxHygwePcORqM2P5SWjwSXDq4Iyigy8UCVtGtadiJ2
	YnVllSTnvQ+2YXxHz+LpPhlk7KxZTNsKYHXFLkXNGKuyMdwHKAW57eWRo3cuYcsLgsN9pUjzlGDMj
	mah6z/MSy3J13c1y9z4dsUR0tX/y5IYLx53HIVytaSjrmFYRJ0UEq8IqoutMblO7RSCfZIWd67c2R
	ELUnJYCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbd0K-000000086vb-02A0;
	Fri, 02 Jan 2026 11:07:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbd0I-000000086v2-1XSz
	for ath10k@lists.infradead.org;
	Fri, 02 Jan 2026 11:07:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 606834433F
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 11:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3464EC2BCB4
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 11:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767352053;
	bh=F3aAq1jYJGU16fmEaHx+dz6wHtwN6K43frkZB/dF+gw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WRcvgxz0HW5gFOGurq0UpE0B0xN9dmpje2rYOOV+eVdNlar+kzozmxOt0Ua1hmz4v
	 I6+vSc9myTGMEag7+Y5IfHcmyAdB+eVmpsigJUVV0g1S2/iK8rQ9rcubKvJ1bVYFGx
	 ShnwRm4bPGAts6PUjA0jvw/Km6eYxe+nzYrnCW7H+Lg+o1pFKFY28yna5BxvQNqN1U
	 IiQpQmPsGB2zRCs2N6NBUhdn3ALVnN0DnhfCpmJ2oxBlpgLO0835VunD7lEzZytAfs
	 aD+ex8M5/e3hVB+tT3qQCDlh9OwPem9bCKgIH/ExynBraCDBtcA8CXKZ5jmJ214s7v
	 C4D+XHbXB3kUQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37b495ce059so91074341fa.0
        for <ath10k@lists.infradead.org>; Fri, 02 Jan 2026 03:07:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9zXutCpBKKm4rQDnTctyr9uim5j/ehO8ZA9uYl63ocDrMnT3NZbAsJSMlMVv947VPbCGNP4M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9UURhwEssStSv3RdisyHdFS+x+sR1o4JAgZ5NzRH0FmOlI75G
	HbIDrNRvYNt76ZfaSMhOuoDc6vTNTrSUD+qd4TkI2T/vPdmswFE09nsKbPCtU/TVI0XtXdK9Qpy
	vywoH9vFDKz3l+myW4GmYvwIZNxN5qmAyDTlD3+GaOA==
X-Google-Smtp-Source: AGHT+IECDXlql60R3DMIWp9kjLwxAHDu8fuxvKIOIfP1h3fonlqom3qIu6aeomXPr7jXdMs2XMEBzNiyaL5yGx8uDT0=
X-Received: by 2002:a05:651c:31dc:b0:372:8f0d:b0bc with SMTP id
 38308e7fff4ca-3812152aa1amr115769131fa.9.1767352051710; Fri, 02 Jan 2026
 03:07:31 -0800 (PST)
MIME-Version: 1.0
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com> <20251231-wcn3990-pwrctl-v1-4-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-4-1ff4d6028ad5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 12:07:19 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mey1ScNmosipLFg6mmABjeG2SO2L-pyjwTuOpOYOHZjqg@mail.gmail.com>
X-Gm-Features: AQt7F2qRiWiHXtdQFeT3NmxdPtGTuo9HGfYlrKz_4sHVMqf0-f-_Q9QRMBPkh4M
Message-ID: <CAMRc=Mey1ScNmosipLFg6mmABjeG2SO2L-pyjwTuOpOYOHZjqg@mail.gmail.com>
Subject: Re: [PATCH 04/14] wifi: ath10k: snoc: support powering on the device
 via pwrseq
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
X-CRM114-CacheID: sfid-20260102_030734_449035_2ADE5072 
X-CRM114-Status: GOOD (  19.12  )
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
> for this family of ATH10k devices in addition to using regulators.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[snip]

>
>  static void ath10k_snoc_wlan_disable(struct ath10k *ar)
> @@ -1762,7 +1779,27 @@ static int ath10k_snoc_probe(struct platform_devic=
e *pdev)
>                 goto err_release_resource;
>         }
>
> -       ar_snoc->num_vregs =3D ARRAY_SIZE(ath10k_regulators);
> +       /*
> +        * Backwards compatibility, ignore the defer error from pwrseq, i=
f it
> +        * should be used, we will get an error from regulator get.
> +        */

Can you elaborate on this? I'm not exactly following. I suppose you
mean the regulator_get() will return -EPROBE_DEFER? One of the
supplies exposed by the PMU?

Bart

> +       ar_snoc->pwrseq =3D devm_pwrseq_get(&pdev->dev, "wlan");
> +       if (IS_ERR(ar_snoc->pwrseq)) {
> +               ret =3D PTR_ERR(ar_snoc->pwrseq);
> +               ar_snoc->pwrseq =3D NULL;
> +               if (ret !=3D -EPROBE_DEFER)
> +                       goto err_free_irq;
> +
> +               ar_snoc->num_vregs =3D ARRAY_SIZE(ath10k_regulators);
> +       } else {
> +               /*
> +                * The first regulator (vdd-0.8-cx-mx) is used to power o=
n part
> +                * of the SoC rather than the PMU on WCN399x, the rest ar=
e
> +                * handled via pwrseq.
> +                */
> +               ar_snoc->num_vregs =3D 1;
> +       }
> +

