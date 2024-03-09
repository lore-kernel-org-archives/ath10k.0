Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F55C54798
	for <ath10k@archiver.kernel.org>; Sat,  9 Mar 2024 15:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsRsreksVUwY3JxwOHcn4AH1bjEDIW9wxkCIfNiLooU=; b=Eq+j8yIHtNdX6eb9PfrD13Sh60
	jHtcnZywRJ3HVatDkNmU5IQtNlPaPRGkrRWu1shmOvQ/Eec0emIK8+kcQlpJOu2oMa6aTfC+FGTFJ
	YdalYCiKsQHLVdk68AZqB3+pQ67Uj3gzh1/8GM1RemNkqBThwM2pnvGoAknOaqGM8lyUOxHOuPfvy
	8ahMlhxoYTYFiwnFpPEylonGl4k5SsuKUFoDbSPfW7jAz54w+73Zx3WfSeV19vKJZKJhc8qIayn0c
	ZqE2T5JHmPJfyNuCReVcK8jvrTeE/9xLryS/M3nyHCZfxTtrjr4qmcElyMbV8+Hu/dUFSd2yIuM6K
	1nRzBAfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riyIv-0000000Datf-0Tgi;
	Sat, 09 Mar 2024 15:08:05 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riyIr-0000000Dasy-1gc5
	for ath10k@lists.infradead.org;
	Sat, 09 Mar 2024 15:08:03 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-dc742543119so1804741276.0
        for <ath10k@lists.infradead.org>; Sat, 09 Mar 2024 07:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709996878; x=1710601678; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bsRsreksVUwY3JxwOHcn4AH1bjEDIW9wxkCIfNiLooU=;
        b=WNK13UJiR+aJj0kcBVwrIk2b/thXWZWc0Bf0SXwkOKJa7/80Y/Ku1R9Gi3djw8A+LT
         EAd8P9D4Gsz09bJXG/apL5Pylmv45gjo43oDDHAaS6rTxNpcQ7efTg3lWOztkfXDotu1
         XeEgeDJRLzjVCze+maWwgzptt97bHxmYqCcz7QQ1Z+llz2Xa6LGKotxY5bCBbwPch9fi
         iEXQ+wBBkr1R4in7k6PKi0RPnW8oR3+Nwaqmc2h7qtSAe/WPalaBnOheZj6ALkS8qwyV
         EvkweQs0Lbbfu6CFdV+UlPKVJBuNdPcqajNw00h2RTzWpy1asFUFfuknaSalXZsXLH1V
         1E/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709996878; x=1710601678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsRsreksVUwY3JxwOHcn4AH1bjEDIW9wxkCIfNiLooU=;
        b=hI9Mgw1U9qLpPj/6Ea0gJNS/7c5ltBIV3au9lTULdFN7VqLW9Zbzr3KXAlCeIOrIKK
         Rywt5meuKhv7i2qAMHZJPczcbMFuuOm+ObC/WAULsCCbAnxyahAyPoeD35S2bZIMAIta
         TS45+dV4Zs02bV4ZpT4l+IjY2lnilB+Gvy4Q5ccLirDI1daygJIl9o8NHyLD/aQdUfrt
         fh8fhCijrVGFueevONLVM0i0GumcoYdFk97wlTmveMLIwR2FE68r1bFCqUto4a6+b9yM
         +TIk4SVRJ6EUHk4DHS4O9iY/xPfH5Rz8GXGEAi1GJVigroExYPdQguoJTtZleM79glOG
         Ofdw==
X-Forwarded-Encrypted: i=1; AJvYcCWcepTXdUzaOk1x0pWk84Wcow1fMSxgKDDharNQ5V0spf9ARKtFkxOfeRa/7cNehZGRB82nZkPXd2j18a4n//5oE3FRNdpLj+B5vQ==
X-Gm-Message-State: AOJu0Yy7VeDDwPXA8xT2bUxQ0HdyxGULcukPeNVcb7R0vMNzJtXN+cRx
	zeb5kRfafCOtAIUueKWDg6XNMD5OrKkjgwEJp4YLzloVqwi5v9QRRq9F+F6zlX6y+p9w1Qz2Lis
	ZeRdCWxsnLFWac8UxmjKxphqIHkljIxIztzQi+Q==
X-Google-Smtp-Source: AGHT+IF0IfT5MeJdtuGLAxcGUPTzOLwhQqEBQY+xRVBBT6xtNAXgDJlcofP3guSftIG+E5LI1hh+Y6ALeP+yMak/1A0=
X-Received: by 2002:a25:6c09:0:b0:dd0:453b:485e with SMTP id
 h9-20020a256c09000000b00dd0453b485emr859326ybc.58.1709996877891; Sat, 09 Mar
 2024 07:07:57 -0800 (PST)
MIME-Version: 1.0
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
 <87plw7hgt4.fsf@kernel.org> <CAA8EJpr6fRfY5pNz6cXVTaNashqffy5_qLv9c35nkgjaDuSgyQ@mail.gmail.com>
 <87cys7hard.fsf@kernel.org> <CAA8EJpowyEEbXQ4YK-GQ63wZSkJDy04qJsC2uuYCXt+aJ1HSOQ@mail.gmail.com>
 <87v85wg39y.fsf@kernel.org>
In-Reply-To: <87v85wg39y.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Mar 2024 17:07:46 +0200
Message-ID: <CAA8EJpq_XLUEMC67ck2tZRjqS0PazCkQWWMGmwydeWxTETHwcg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/4] wifi: ath10k: support board-specific firmware overrides
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240309_070801_492557_B2E627F5 
X-CRM114-Status: GOOD (  20.83  )
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

On Fri, 8 Mar 2024 at 17:19, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> >> To be on the safe side using 'qcom-rb1' makes sense but on the other
> >> hand that means we need to update linux-firmware (basically add a new
> >> symlink) everytime a new product is added. But are there going to be
> >> that many new ath10k based products?
> >>
> >> Using 'qcm2290' is easier because for a new product then there only
> >> needs to be a change in DTS and no need to change anything
> >> linux-firmware. But here the risk is that if there's actually two
> >> different ath10k firmware branches for 'qcm2290'. If that ever happens
> >> (I hope not) I guess we could solve that by adding new 'qcm2290-foo'
> >> directory?
> >>
> >> But I don't really know, thoughts?
> >
> > After some thought, I'd suggest to follow approach taken by the rest
> > of qcom firmware:
>
> Can you provide pointers to those cases?

https://gitlab.com/kernel-firmware/linux-firmware/-/tree/main/qcom/sc8280xp/LENOVO/21BX

>
> > put a default (accepted by non-secured hardware) firmware to SoC dir
> > and then put a vendor-specific firmware into subdir. If any of such
> > vendors appear, we might even implement structural fallback: first
> > look into sdm845/Google/blueline, then in sdm845/Google, sdm845/ and
> > finally just under hw1.0.
>
> Honestly that looks quite compilicated compared to having just one
> sub-directory. How will ath10k find the directory names (or I vendor and
> model names) like 'Google' or 'blueline' in this example?

I was thinking about the firmware-name = "sdm845/Google/blueline". But
this can be really simpler, firmware-name = "blueline" or
"sdm845/blueline" with no need for fallbacks.

My point is that the firmware-name provides the possibility to handle
that in different ways.

-- 
With best wishes
Dmitry

