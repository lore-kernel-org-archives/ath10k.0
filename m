Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C0FFA3753
	for <ath10k@archiver.kernel.org>; Fri,  2 Jan 2026 17:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02T03gwQsXDbR8r46xBwM2XCiuMHAXywzyaPwdv+WWM=; b=oCTocYMedvrRGzbk0j7YpbVwPN
	ZqtXelI9zURivH0enEBwVPMNpda8gkEfFmxbogQJ/ooVNlZK6Ea8wuxtrfD1/+vTz1RnynM/AvkMI
	5NBCH2ndkVN6wZYj+8LyGgxCjZyS18adQsIfcWkmn8jcxzLWeb+/cQpGJEYtliNE7SBCgPZR4Ohyq
	o3vXHXNJy5nvjLZPQLwdmt4wrTKTRRedv1jTyFoVAFaQjOQAOtF8Bxynlucf55wgwKs41fKTTmWA9
	EPZNsYMII+3dVnQtplf6seO2xiQGOG1GU2MSjObjf9LKLLMiu/csaUtrqSK2PbZQZavUHVXQea1Pi
	m1us82Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbicH-00000008XuX-12Mw;
	Fri, 02 Jan 2026 17:07:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbicD-00000008Xtv-42RC
	for ath10k@lists.infradead.org;
	Fri, 02 Jan 2026 17:07:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21D184438A
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 17:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B46C2BCB1
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 17:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767373625;
	bh=iarWZx1KlsRgp9E3GRi6XuMvkRnvVPn8FvNMJ9e/S4s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aBNpKR2rMRsc1AH3kIXOVt4tUKSFp5nE7Y0b9eIV8GwBTRNwaC991eQzTVYUR9dvO
	 5UIHOs2EXd8EDjj3CR5F3eylIrfA/XHUEFaa8T8XM2Y1Qy0pl/1zDoyBXlSsVLadr9
	 lP3gc0j17QUa4SeiGbuylJFnXeiu2WAX3EWf/CQQ2oC7j5QnAaBEsqjwEGS33WmYwM
	 aYUE67bdGdEqA1JqIqogyZj4iXM/TYQitzNuFT64MfSZCkgGLoG6nsWfzqck/c1oKP
	 alqP8vIryOZtlZgNJwUYGbx3i1ILSonwb2u1YBmp7J57R0kIxWR0Qf+t6vLURr+VIC
	 c5vMN/var4pOg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59583505988so166408e87.1
        for <ath10k@lists.infradead.org>; Fri, 02 Jan 2026 09:07:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnkuL5ymWna3+k1N/o9gQuLQMFZXzllA2Ian7vHU/tYx66/P+xML2W2EFzKLpwJKV8l3pWBy4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLowheVR8RFJ8//IkTKGnRCtdiqABsMgoONr0JTFWfsefpIiLU
	OUyVfW7xwVX43qqlTp9AUEleImRB824qbxc5zzvAZ7SxYmOhvGzLzlOy9nL/uJGvYP0AmlisDTk
	jGxpkbO37BoYTRplkQpugpLrEvHiQxKvoKH72B01zRw==
X-Google-Smtp-Source: AGHT+IFvH0jCrfHsGU86qSQyaKtWG6m7X68xvVItz+xwat1KYNlZLswI9WXmMoLpE+qcpLYknysIBNbQN/+lMNMdWwI=
X-Received: by 2002:a05:6512:3412:b0:59a:1443:2f72 with SMTP id
 2adb3069b0e04-59b5657e5a4mr103415e87.4.1767373623264; Fri, 02 Jan 2026
 09:07:03 -0800 (PST)
MIME-Version: 1.0
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-4-1ff4d6028ad5@oss.qualcomm.com>
 <CAMRc=Mey1ScNmosipLFg6mmABjeG2SO2L-pyjwTuOpOYOHZjqg@mail.gmail.com> <CAO9ioeU2JjzDwkGQzxc963kakNyZCtaSRAmLu=1kOAMGQeuZRQ@mail.gmail.com>
In-Reply-To: <CAO9ioeU2JjzDwkGQzxc963kakNyZCtaSRAmLu=1kOAMGQeuZRQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 18:06:51 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdCxXg6Hbn_qPVsux2aAfN8cqpG946rS2Sb9J_Cjy0ZQg@mail.gmail.com>
X-Gm-Features: AQt7F2qM1LfACBr1uzyMAUsYIaKhzaqm_3nrsJwq14yD6V3d3exkT5MSIFxHS6o
Message-ID: <CAMRc=MdCxXg6Hbn_qPVsux2aAfN8cqpG946rS2Sb9J_Cjy0ZQg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260102_090706_344372_4D0CC97B 
X-CRM114-Status: GOOD (  35.33  )
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

On Fri, Jan 2, 2026 at 4:10=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, 2 Jan 2026 at 13:07, Bartosz Golaszewski <brgl@kernel.org> wrote:
> >
> > On Wed, Dec 31, 2025 at 12:36=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spread=
ing
> > > voltages over internal rails. Implement support for using powersequen=
cer
> > > for this family of ATH10k devices in addition to using regulators.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> >
> > [snip]
> >
> > >
> > >  static void ath10k_snoc_wlan_disable(struct ath10k *ar)
> > > @@ -1762,7 +1779,27 @@ static int ath10k_snoc_probe(struct platform_d=
evice *pdev)
> > >                 goto err_release_resource;
> > >         }
> > >
> > > -       ar_snoc->num_vregs =3D ARRAY_SIZE(ath10k_regulators);
> > > +       /*
> > > +        * Backwards compatibility, ignore the defer error from pwrse=
q, if it
> > > +        * should be used, we will get an error from regulator get.
> > > +        */
> >
> > Can you elaborate on this? I'm not exactly following. I suppose you
> > mean the regulator_get() will return -EPROBE_DEFER? One of the
> > supplies exposed by the PMU?
>
> Yes. devm_pwrseq_get() can return -EPROBE_DEFER in two cases:
> - it is not supposed to be used
> - it is supposed to be used, but the driver hasn't probed yet.
>

Yes but normally driver core would still create a devlink between the
device binding to the PMU node and the consumer of its regulators -
this device - so we can expect that it will always be the first one,
no? Unless we need this driver to be firmware-agnostic.

> There is no simple way to distinguish between these two cases, but:
> - if it is not supposed to be used, then regulator_bulk_get() will
> return all regulators as expected, continuing the probe
> - if it is supposed to be used, but wasn't probed yet, we will get
> -EPROBE_DEFER from regulator_bulk_get() too.
>
> I can write that in a comment, if you think that it makes the code more o=
bvious.
>

Yes, please make it more descriptive. Ideally I'd like to improve the
API to avoid such confusion in the future.

Bartosz

> >
> > Bart
> >
> > > +       ar_snoc->pwrseq =3D devm_pwrseq_get(&pdev->dev, "wlan");
> > > +       if (IS_ERR(ar_snoc->pwrseq)) {
> > > +               ret =3D PTR_ERR(ar_snoc->pwrseq);
> > > +               ar_snoc->pwrseq =3D NULL;
> > > +               if (ret !=3D -EPROBE_DEFER)
> > > +                       goto err_free_irq;
> > > +
> > > +               ar_snoc->num_vregs =3D ARRAY_SIZE(ath10k_regulators);
> > > +       } else {
> > > +               /*
> > > +                * The first regulator (vdd-0.8-cx-mx) is used to pow=
er on part
> > > +                * of the SoC rather than the PMU on WCN399x, the res=
t are
> > > +                * handled via pwrseq.
> > > +                */
> > > +               ar_snoc->num_vregs =3D 1;
> > > +       }
> > > +
>
>
>
> --
> With best wishes
> Dmitry

