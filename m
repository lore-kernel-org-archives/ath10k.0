Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B1DCD1288
	for <ath10k@archiver.kernel.org>; Wed,  3 Apr 2024 14:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwnBjxEZZcPm2O8OkmbkyXZ2vtpbjoy3qG8K3meKtNY=; b=QBhe1VJV55lVactkub2c2s72M6
	aOY8TEgHf48oLSnryeqHwfPCgkhHWLgfmkAu/GifduJucTPfpI7BU5lz3t5wBZej59LPesoul4dU8
	7wBLBrmfhbN3trTrO4/K5ZPSj/uXXeE18rwPGc3BIoqimnjIYaZxSshsnkz0rRBLyUkztltlmGSPQ
	H/2GIZ/pW/7S6W+4CNlV6yJkOKHwAH8bS0ifH0f7Jugn0XWJaQ7ZyGEtjSgxRvX725ti0Lk6PK3f6
	ipGOygC77Wmsw7mz3UYFGOYGLRxvCLBNL3woNkuITnOQjGJY61R12WNMCogcbtDY8W8g8HDt7tGZF
	JQOS5RYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1M7-0000000GO3h-0dSJ;
	Wed, 03 Apr 2024 14:12:47 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1M4-0000000GO2y-3QGE
	for ath10k@lists.infradead.org;
	Wed, 03 Apr 2024 14:12:46 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-dcbf82cdf05so5440117276.2
        for <ath10k@lists.infradead.org>; Wed, 03 Apr 2024 07:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712153562; x=1712758362; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fwnBjxEZZcPm2O8OkmbkyXZ2vtpbjoy3qG8K3meKtNY=;
        b=DcR3tNa01Uum3yuaZmMIF31G5MxHld9JAX7go3Fg0VP0GIAWXVZadQO+2E91X3uQ19
         8B4gdFk9sDprlc6DcBO2jGe+59QWg1E8hR3okU84z1eWsa/3mvgpPmMkTWMGLN1388l+
         IxW44eYeCJ3jRJA45lnzrVBSwfQec3JE9ZAzrt0B4TYAZWJ6GTFPdXtSupeAlDwxAvBx
         zSIibOhXsRRsxj0CIxYOMChS4UTEDIhhE/DqgxQ5Fx58QINyVs8weLGk8AQSLsPw++PF
         Y0ZPac1nxZtHybCPouRBIWzwD+IclZB2qoGYeDQfjJ39xTfr9EGuCbGbfYP/KRkbPC26
         y+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712153562; x=1712758362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwnBjxEZZcPm2O8OkmbkyXZ2vtpbjoy3qG8K3meKtNY=;
        b=iKlwjwZWO/vhXhcYpT8HgtR9xZcrTQlO/fqJVlMffmyepdUVEInn0zlrOUEr24yybu
         5+7tofd7gu9u8x7/N0X45KJGcnw5/Qx2j7PX9cEzQk8g2YQu+oSoNoJF/g04e/fRhJAK
         SI1xsmesnfUmVWhXR/xkjEmSKcg+anMZF+QDD38uWHKc6+FOAClnsKW/PI3Kc8r9YuFs
         05KtNCiYbWLpXfYbSgu9KsEx7Mk39ATijgZfY1Wz0M95V1YzDd+TTdkr0nBgD0Bb/Bze
         NBYfCEe8Tk9rZc7JNozUdEBsc+jewFJ8M8AeU6Ix31AXQ/E5KsuCQGH+lfWf8Mg+mKHU
         do0A==
X-Forwarded-Encrypted: i=1; AJvYcCVfJUa09PRSpYdrzfii3p54tyhYTQ7PXcMJF27V1dUGFDBNEguVkInIKOD8iI2vOpZCs0Wj7AImSQSJeO46Xh6/LjUPNk0m6bzO+w==
X-Gm-Message-State: AOJu0YzN0Kse2XMyqnaepFXnL9N0REOQDvL9K9Ko2lz1b3jiLdCG/qYM
	5DViMymLaaU87zhpaUFCCulqUXAj8EqRlCkCinF+hMSYpzz6SbIo8x9MtNS4grKul0mJiq6rkUn
	9Lwr7livvp6+jyLIOJtg84KX4CEh6zZ1aj3As8g==
X-Google-Smtp-Source: AGHT+IFdlFDZF9JLA4BV3VvkLV2yX2UyfubxSqjpKX9avJfAKmAztGCS242oKGU4jwHzDnC9jCvS8z+XSH1kr3q9Uek=
X-Received: by 2002:a05:6902:82:b0:dcc:140a:a71f with SMTP id
 h2-20020a056902008200b00dcc140aa71fmr13245031ybs.60.1712153561979; Wed, 03
 Apr 2024 07:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr> <252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
 <502322f1-4f66-4922-bc4e-46bacac23410@linaro.org> <0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
 <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com> <91031ed0-104a-4752-8b1e-0dbe15ebf201@freebox.fr>
In-Reply-To: <91031ed0-104a-4752-8b1e-0dbe15ebf201@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 17:12:29 +0300
Message-ID: <CAA8EJpooJLbV+nVWedru=r6fascd8ZxKumiMm_iyzzJwyQ-tig@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set qcom,no-msa-ready-indicator
 for wifi
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
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
X-CRM114-CacheID: sfid-20240403_071244_960293_E01ECAD4 
X-CRM114-Status: GOOD (  20.41  )
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

On Wed, 3 Apr 2024 at 16:05, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> On 02/04/2024 17:55, Dmitry Baryshkov wrote:
>
> > On Tue, 2 Apr 2024 at 18:31, Marc Gonzalez wrote:
> >
> >> So, if I understand correctly, I take this to mean that I should:
> >>
> >> 1) DELETE the qcom,no-msa-ready-indicator boolean property,
> >> 2) ADD a "qcom,msm8998-wifi" (name OK?) compatible,
> >
> > I'd say, this is not correct. There is no "msm8998-wifi".
>
> Can you explain what you mean by:
> 'There is no "msm8998-wifi".' ?
>
> Do you mean that: this compatible string does not exist?
> (I am proposing that it be created.)
>
> Or do you mean that: "msm8998-wifi" is a bad name?

I mean, it is qcom,wcn3990-wifi, because the chip is wcn3990.

> And these strings in ath11k:
>
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml:      - qcom,ipq8074-wifi
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml:      - qcom,ipq6018-wifi
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml:      - qcom,wcn6750-wifi
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml:      - qcom,ipq5018-wifi

I must admit, I don't know the IPQ product naming (it well might be
that it is both the name of the SoC and the WiFI SoC).

>
> > I'd say, we should take a step back and actually verify how this was
> > handled in the vendor kernel.
>
> In our commercial product, we use the ath10k driver in the vendor kernel (v4.4 r38-rel).

I see.

> It looks like Jeff has already performed the code analysis
> wrt vendor vs mainline (including user-space tools).

From his message it looks like we are expected to get MSA READY even on msm8998.

-- 
With best wishes
Dmitry

