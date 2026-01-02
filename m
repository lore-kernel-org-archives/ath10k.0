Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F01CFA3729
	for <ath10k@archiver.kernel.org>; Fri,  2 Jan 2026 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UI4UX8qD/+Ay11IN6HqXBJhwTeU0IQ4j0jQA2/n/Yys=; b=BK4O79T7r/IAMuBAMkguLH5qOZ
	yUALbykmIeaGL7On6xemPu4j+FavsjQkFVhrHuvyNApsrVW7gZLKqpc52aALoUkjwIap8hPtENw6n
	UH7RVa+VGOYfE5jaBx0r1qmUTYmeXfQc6M8qkVzJPtRQTH97TjLqBIHG91Dm5VLkjlmM28ONhw28r
	jN0ju8WK6DvXGlUbzXVUQ7jBcDK53Q9c3c2YcXditrhmlTIpJc84O1hiRnx70DMurGb1CNYX8Bj1i
	1utiXLkHAvpACopgRMHMXdcv1VxDX7WObuSm0wOCwlYP/NiDhAwYdTKKzY8ZSrbfcl8ztNF5Mzhdh
	HGGCkeAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgn3-00000008Per-03sO;
	Fri, 02 Jan 2026 15:10:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgmx-00000008Pcv-3KVc
	for ath10k@lists.infradead.org;
	Fri, 02 Jan 2026 15:10:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 602BxwsX314444
	for <ath10k@lists.infradead.org>; Fri, 2 Jan 2026 15:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UI4UX8qD/+Ay11IN6HqXBJhwTeU0IQ4j0jQA2/n/Yys=; b=QSuVqOI2SkLa2AkB
	OlWYdrD/b8IlQ+fyqPyI/ClV9ZL3yNS1TH0hEl90pqKDBJfQtnZsOAqXkfc1smT4
	4GZv/w5RxExXdlUDgSVG4AGR08MrwZzpdeZ1b37a6k/huTfwmj+Xl302zFatSEOi
	16J+LtKXwT2ikUjEroiPENkDADRH07FCQv2U9HuBkPA0ncXz6sujIWyu412PCvAR
	8efkCiTfpluUtqZLliB8HZRKujUke6nsCraVhnZ0LdUxpBycM4qFiab3mAV4fKlH
	yxcHUfKbIboJL1lCdwCU621PKve3YYRchiE0RzcwHfhLXlALBmGYRLLP6oFPmT5S
	eFrISw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bedmxraqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 02 Jan 2026 15:10:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c37b8dc4fso26120492a91.2
        for <ath10k@lists.infradead.org>; Fri, 02 Jan 2026 07:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767366602; x=1767971402; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UI4UX8qD/+Ay11IN6HqXBJhwTeU0IQ4j0jQA2/n/Yys=;
        b=S96vrW0rinJoZozZlQTAjC0vZMmo0ZPN6wqwy3jEE4PynausJuZ9RDreDAjioLLMDt
         Io7ZuzIqcKzJcBfX+U6HAV4v1j4+qYp1fTbO7d5VLY6zu+JJbtHJH01m4YiKXg+w7Tuz
         7Vtpw/j20w6A9ot3xNl7SMR4Y6MTuiBcAHM9GuHT8TItmgUdh0sjbsNkFas89V8sgVD7
         n13x2NDEEm0/Ka2zPM9fLm6bk5ll8JvVCiUHtwYg2fY1GcOsttxd8HBfcv8w6/ClAj3p
         Hz5WiK5EZY4z4T0DhsBMVTKG3Ou8A14X7t3WY7VZMXAelpCSc+/0tz91Kf28J/uscbvo
         /FLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767366602; x=1767971402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UI4UX8qD/+Ay11IN6HqXBJhwTeU0IQ4j0jQA2/n/Yys=;
        b=iBhr5fx2vRcxdeBHyup3nOmVT9Bh4cmT8qyee+2MHOFUdkxcEVuMg9W1WBu1iNiEwz
         cx9bsSU3XolhsMXHxpe1EbxDmOooyKfG5/z3iPMKJmUKBB0Svv+cBEt/CKiwV2JNvzNr
         1s1VTiVTUAX8uuGZ3zkp987EeOj+sAGP3QCBDqADxsDa7hwuB2RChpeejKxjaXEs5fJU
         XmX/KrX0ZgXaVk5pZA2UXM1JF2CbXHxQ3HdogblIqpff8psU3YveVHBKUjGBsB5s75lT
         W3AKuUUBZTNkb9MJmo2Ve3SZGLZuH/aB2yVVkgrx99tjDUfeXZC6bKa+msCxfrMYzpOo
         n34g==
X-Forwarded-Encrypted: i=1; AJvYcCUo7p+l4kNbZeYsr7gsysbGEzBCsv+znOCl+D/ysfpnlB8JoJOSH/gpjMuJoV5OxjkQ+IurZSg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/zjo/zaSLCpJcd95t67V20gSkwvEFkDg3XnlZcGBDatn7a1Ek
	z9NSi8cOjvMd12fACZDVHqws12WPYjJ3EwU6ezrBZV8n/x/4jHfkMmZ1F63mz8dSGPYNpvg43Fu
	r353TItDa2uyTTYbmaGC5OS3+Uej5Y2URcCKMiW7pSvIZCKZYRYCCf0l0uPO8c++MX8a04AOxyu
	4gEIIctz3HaNDq+j4+0OJFXpGCAyNyaRiHdgdDjqs=
X-Gm-Gg: AY/fxX6cXK2RzYy9WgxBKwHJQ3o3RlNwSvtsdTBLFkEq5wIDdx1SiZwukTCxVg6KadG
	yc0RwznpTNbiiQ3SAGg8+6t5S74REIRK5cHqP6txXYJaPcrfBnp2g8JQ47pFnbfdkTDvpX7eK7B
	mEqJkmhi5fULfwSHdEFLfYiNC8rfadhY1alXpbQ97G3pGnvWW/DwKNLMTyLsv+HmhlKC+jDxy/D
	ugi8gIQ
X-Received: by 2002:a05:6a20:2446:b0:361:3bda:43aa with SMTP id adf61e73a8af0-376a81dc0d7mr38447952637.1.1767366601574;
        Fri, 02 Jan 2026 07:10:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXBHsj5HPlkrOf/QA7SEvXnhYeXLKX9eNIQ/Tk1248XeSURHeZEJfSWWPyXrvZvYck5Snp5pKIaVAPYzKALcI=
X-Received: by 2002:a05:6a20:2446:b0:361:3bda:43aa with SMTP id
 adf61e73a8af0-376a81dc0d7mr38447931637.1.1767366601013; Fri, 02 Jan 2026
 07:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-4-1ff4d6028ad5@oss.qualcomm.com> <CAMRc=Mey1ScNmosipLFg6mmABjeG2SO2L-pyjwTuOpOYOHZjqg@mail.gmail.com>
In-Reply-To: <CAMRc=Mey1ScNmosipLFg6mmABjeG2SO2L-pyjwTuOpOYOHZjqg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 17:09:52 +0200
X-Gm-Features: AQt7F2omVQ1MDvfoA-OCuHjJiLqz1Jf2o41fOPl5iwM5NSCJMu-v_c4lPrNQJlw
Message-ID: <CAO9ioeU2JjzDwkGQzxc963kakNyZCtaSRAmLu=1kOAMGQeuZRQ@mail.gmail.com>
Subject: Re: [PATCH 04/14] wifi: ath10k: snoc: support powering on the device
 via pwrseq
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GupPO01C c=1 sm=1 tr=0 ts=6957dfca cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6Bc-fsn6kEsOX9bBnJcA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEzNSBTYWx0ZWRfXyFh7Q7UYD3S5
 nsGZ7zcrMcuJWyb7lhKtfh8+zA8m6QpeusakhTb4kOTel61g4YVxWDC+UfpR4qor/Q69/xWJTl2
 pAu9++uUOdmZck8fKrEXwjZpz80oEnqZoEx/lmPgnXGHL122iGQscJZpjsNCsbXknIc4wjCxO0v
 pBs45A4hy8uvc6GlOkZkfi820NKd4YajROODWwdAHMq2ICEDkdupFIRPyRNySvLXKiwdrMV2zd3
 AD8CaTMkP+XQBZY+tPinRikRaNsAQFND3d+nKTnJvt5qlIWHUwOARAPFSwRbO8aaOVVnnsCY3f8
 aieH2yFCLOzsoAbShDJKAIutJyxp6UWYi+L9Um0iGM6RWRMbg8bAGLSnm5idYcQVaCcwvqd6fXL
 7fqY1FvtuowAGVIeOaM5LhrSNHxROFZDMkcXjPWcjXagoFkOiXv5bvcwo2iVnQpr+7CGE7XSftd
 J9kgc3Hm4RxBOkgGLYQ==
X-Proofpoint-GUID: jCA45JpdyECclimC3XxNbNri1tnx2Q7g
X-Proofpoint-ORIG-GUID: jCA45JpdyECclimC3XxNbNri1tnx2Q7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_071003_848968_23A1D712 
X-CRM114-Status: GOOD (  28.07  )
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

On Fri, 2 Jan 2026 at 13:07, Bartosz Golaszewski <brgl@kernel.org> wrote:
>
> On Wed, Dec 31, 2025 at 12:36=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreadin=
g
> > voltages over internal rails. Implement support for using powersequence=
r
> > for this family of ATH10k devices in addition to using regulators.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
>
> [snip]
>
> >
> >  static void ath10k_snoc_wlan_disable(struct ath10k *ar)
> > @@ -1762,7 +1779,27 @@ static int ath10k_snoc_probe(struct platform_dev=
ice *pdev)
> >                 goto err_release_resource;
> >         }
> >
> > -       ar_snoc->num_vregs =3D ARRAY_SIZE(ath10k_regulators);
> > +       /*
> > +        * Backwards compatibility, ignore the defer error from pwrseq,=
 if it
> > +        * should be used, we will get an error from regulator get.
> > +        */
>
> Can you elaborate on this? I'm not exactly following. I suppose you
> mean the regulator_get() will return -EPROBE_DEFER? One of the
> supplies exposed by the PMU?

Yes. devm_pwrseq_get() can return -EPROBE_DEFER in two cases:
- it is not supposed to be used
- it is supposed to be used, but the driver hasn't probed yet.

There is no simple way to distinguish between these two cases, but:
- if it is not supposed to be used, then regulator_bulk_get() will
return all regulators as expected, continuing the probe
- if it is supposed to be used, but wasn't probed yet, we will get
-EPROBE_DEFER from regulator_bulk_get() too.

I can write that in a comment, if you think that it makes the code more obv=
ious.

>
> Bart
>
> > +       ar_snoc->pwrseq =3D devm_pwrseq_get(&pdev->dev, "wlan");
> > +       if (IS_ERR(ar_snoc->pwrseq)) {
> > +               ret =3D PTR_ERR(ar_snoc->pwrseq);
> > +               ar_snoc->pwrseq =3D NULL;
> > +               if (ret !=3D -EPROBE_DEFER)
> > +                       goto err_free_irq;
> > +
> > +               ar_snoc->num_vregs =3D ARRAY_SIZE(ath10k_regulators);
> > +       } else {
> > +               /*
> > +                * The first regulator (vdd-0.8-cx-mx) is used to power=
 on part
> > +                * of the SoC rather than the PMU on WCN399x, the rest =
are
> > +                * handled via pwrseq.
> > +                */
> > +               ar_snoc->num_vregs =3D 1;
> > +       }
> > +



--=20
With best wishes
Dmitry

