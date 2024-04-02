Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C14CD1284
	for <ath10k@archiver.kernel.org>; Tue,  2 Apr 2024 19:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Da5e3no1vFHzxLLTd7RoCIPu3XSpzvc3CS46CEGoz3A=; b=JH4Ydk4Jd0Ox8su5/qRYapFqub
	kUQ8linTgDPzJNJbrXX0Iq0fAXRmJAXk53rR8QA9Fa/PRDwiBBTf3wWSxLYL3EVyZ19Ac1me3OHuA
	isUZzukxjSEL13bzxgHmRZNSW6qsx3MGexz71nMK/KB3UL1bRegJPTmRnxuyRaEMKEeUy0fIPm2Iu
	MbLaE2k4ChdWBa72kW6mCv/q8tc4K8e1WfqrPXhSQrWbkZE8nfBDEexQLJTgc1Byuq71OR7oQ/pP4
	n58MxNhWeazskEXDmwOekrf0Gc1+jp9ehx1ea+quY5OQWJV17i9Sf1ehckpQ7VXeOnfYZPp7d5Tfz
	CZAJCWrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrji4-0000000CUU5-0Sqr;
	Tue, 02 Apr 2024 19:22:16 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrji1-0000000CUT7-1j7F
	for ath10k@lists.infradead.org;
	Tue, 02 Apr 2024 19:22:14 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-dcc71031680so5113294276.2
        for <ath10k@lists.infradead.org>; Tue, 02 Apr 2024 12:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712085730; x=1712690530; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Da5e3no1vFHzxLLTd7RoCIPu3XSpzvc3CS46CEGoz3A=;
        b=tajMn0dcRV1VJWBoTX9l0f4LCO4iz53FF7ninZVlmZgVGa50cKWIuVTF2ybV/GooTi
         Ol69UX67dSwyJtzrUatkG3xu+qeoVdWWgCUh4xUzJPlnhTPgjpESzwtlNG+lp7azppPZ
         fG6Fc3/lEDI+v5ULGmfDmALi1E6UDUA6xVgIXBnJ5TBjx9ZgS6bXtJ3VlEx86+fxUoX3
         6Ts1FcOKan9Bck0VtlWIvfKbpQ8QWWsV1agJ1Y1piXMjFJNORpcjXBADbbRX0s/zz2ou
         LZhloqqUHE6TWkzv115ym5Pt3iS60UnSa2DAoym12/84VipKNg61y6nFf959iN76ln2l
         qHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712085730; x=1712690530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Da5e3no1vFHzxLLTd7RoCIPu3XSpzvc3CS46CEGoz3A=;
        b=jENW0uG8+YominXFVUI4X/MdH2t645Ie/hwXV08+YU53qvzUFytdkZ/+dKNGYfVdKD
         8nfoWUGkwjp8ujd3oaLXSvcC79V8whf4J08dvjOVB6Uc6FIKZerZp79KspgCcC5bxMyQ
         lsFkJT0Vtt27kazx/RlTb/lWnfWx0tY1kNggcFXVw+ONzAcLkAVSOXaFQvmNVSpmSAMo
         2N8dDd5V3GysrKPDBKghhLMfgrsrz6doPey6XLsNYeIqoedHQF2wfHNhU+jqY2ikVSeG
         S//mx5ohxV8SeOh6a/Cl7yDpTQqvPFsyhDM6pqhE+m0giHT0+0xo4cOnZO2vmnu5fApA
         5M8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3M4RkUsxoLXx8u804XYO+CioMeUWJPTN6tov+mTAYitOo/pusEH8ZDIkjsxUzKR9gw5fGLBlVSPHCksKt5NxOCiwkEDX2RFDXjg==
X-Gm-Message-State: AOJu0YxODHQ3UBY+edBZFA+m4fVBiq9+8Wpr8Y0eRhKkq0kwXwlINN8F
	LrwZC4q3v9JocfrMmMH4YuMu5f3fkW+4VZCMrPQiGcxKZFUkoQD+qYsFQVh0mLs50igJYX1MUms
	VZmOK4R+d8/NJbejU2muQ3Wn/vUZtY/rkvb4TEA==
X-Google-Smtp-Source: AGHT+IETpb/msZOjlDLCi3odXTnuMId4zqwOakzl+yNSURunQT2Cet2X6wMJNMEfQKszq4oZvWNg6VfgMvBffwUGHoU=
X-Received: by 2002:a25:a028:0:b0:dbf:ec4:311f with SMTP id
 x37-20020a25a028000000b00dbf0ec4311fmr11410085ybh.58.1712085729697; Tue, 02
 Apr 2024 12:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr> <252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
 <502322f1-4f66-4922-bc4e-46bacac23410@linaro.org> <0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
 <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com> <8ef4f56c-83a3-4b26-877e-f1c7a0307e98@postmarketos.org>
In-Reply-To: <8ef4f56c-83a3-4b26-877e-f1c7a0307e98@postmarketos.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Apr 2024 22:21:58 +0300
Message-ID: <CAA8EJpqarGD-8PpUOdOXzNXW2+HnEUF-1k7VC=TLTPJc3qqsGw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set qcom,no-msa-ready-indicator
 for wifi
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Kalle Valo <kvalo@kernel.org>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k <ath10k@lists.infradead.org>, 
	wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>, 
	MSM <linux-arm-msm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>, 
	Bjorn Andersson <andersson@kernel.org>, Jami Kettunen <jamipkettunen@gmail.com>, 
	Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_122213_484094_66405CF7 
X-CRM114-Status: GOOD (  19.11  )
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

On Tue, 2 Apr 2024 at 21:25, Alexey Minnekhanov
<alexeymin@postmarketos.org> wrote:
>
>
>
> On 02.04.2024 18:55, Dmitry Baryshkov wrote:
> > I'd say, we should take a step back and actually verify how this was
> > handled in the vendor kernel.
>
>
> AFAIK there is no such thing in vendor kernel driver for this, as
> this startup procedure is likely handled entirely in userspace in
> cnss_daemon.
>
> By the way this workaround is needed also for Wi-Fi in sdm630/660,
> so no not only msm8998 suffers from this.

Interesting. I have an sdm660 platform. I think I should be able to
check these workarounds then.

>
>  > This sounds more like a firmware feature, not a hardware feature
>
>  > having this property in DT does not look right
>
> I agree with these 2 points above. This can be handled more nicely
> as firmware feature encoded in firmware-5.bin using ath10k-fwencoder
> and not involve any new DT compatibles or properties.

I think Marc has already tried this. The firmware-N.bin, so-called
"boot firmware" (because for normal devices it also contains the
actual firmware), is loaded much later. See
https://lore.kernel.org/ath10k/243a97b7-c298-4307-9f06-8b3a7c3e24fd@freebox.fr/

Probably we have an option of loading the firmware earlier, so that at
this stage we already know the quirks set in the firmware-5.bin. But
note, I haven't checked if at this point the driver has all the
information to select correct firmware blob.

-- 
With best wishes
Dmitry

