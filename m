Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2CCC54E71
	for <ath10k@archiver.kernel.org>; Tue, 19 Mar 2024 17:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhV6zUtmAfy/vNP17fIk9V9xTd/09f0QdrKRBGrKG64=; b=QIq9aCWDxkT4mPJ6nhSd1lIOPH
	TIiS4je8MkUKG4j7YXEFqlTM9DyEj4fcVarFWRpTd8A/stLP8QE2hpZAgeUmKZT5KPpK82fKPBijj
	jSY0PHvq8vKbajmj6xi0t8CvHYVdSYnQDZBRpnuMsrzUix9HTDTqBUlsg6m/wKYw950IAiBsoRHtp
	PL2zGlGJSOuB5yvbyfIf71wPFqjbuipPwx8fIcfGho53+lJANLAoahWk+4xvhIqe033llCBWoJ+eJ
	Qz/dea2vVoUIQ9QBWwkJj0Py9O77pXbodPuVvAmtbSz7LfFUOn7FcIk2UtskQ1huvd/IKeKgBFGtw
	EMVntzsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmcui-0000000DXC2-34eS;
	Tue, 19 Mar 2024 17:06:12 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmcue-0000000DX9n-1aIN
	for ath10k@lists.infradead.org;
	Tue, 19 Mar 2024 17:06:11 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2d476d7972aso85830641fa.1
        for <ath10k@lists.infradead.org>; Tue, 19 Mar 2024 10:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1710867960; x=1711472760; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vhV6zUtmAfy/vNP17fIk9V9xTd/09f0QdrKRBGrKG64=;
        b=BEiXyYOtzFIJsKDPl3u6kPwJwWaPQEOTgc/Tqw6Ax7rvqb9rrj1NZ7rAgiudC1gnoo
         dtVfrSTNp/dnDVHJ+ns8xYKmCoXTA9DOIxkUbl63aBbV75NpoWFl6czuGuU0fNLEWDOf
         uY0RfiXIF/CAIfUGuOIpy46Ip0VoswgeO1oGi1yJw9QGu1myafJpjygkXvBOgE8/b9cz
         m8ad5LhPJDM7M5n6qmOOK5Pp3/uaVxJh255YLqEPlxafE0aQG0e2irYv9y6ojeXJLZYc
         WXa4Br25vlfZAgCLE5fmDH8E87Oa6ASC+x0neXTrk93rN7KQsFgq13ta0PERhMjb4cq4
         SmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710867960; x=1711472760;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhV6zUtmAfy/vNP17fIk9V9xTd/09f0QdrKRBGrKG64=;
        b=hbpgld2iu12p7GD5D689ZdEsQf7jBIsYP5nOvKjoD1eTrFWuxQjXCTONt2Q7drwLfU
         9hdz417vFAr1EsELe9bzxSMzLQQHyYeNsmpr24PG5t2JR7fUAJrKvxBYd1gGU0eaTlNj
         5cj6zIbh+ydrPdC2/Rmgjco2cu+7ryHdy61xEi2cJ0LY+3V/CzgG/qZJoYc1c9r9fwW6
         ONpWa0kt23MiQlo0AH93jEJhXu2N4ubbfuvfOusynQPK85PSmShuwDcO5G8bTdTCAWtl
         yLZsPJ3nnEkY4f3r31WiwlqBsYy/MIvWq5FENHZmkrOpqEmDrDAQKlrDl81wfdnUU3Ba
         ZSfA==
X-Forwarded-Encrypted: i=1; AJvYcCVZFHA5NNf58VySjpa83BJubuPOwDrAtVT3RDHefqin24zrSzXgltBxeo3crhuekJ9KtS15O5G+LZD5dsb0VB1lP77s/6UeoX9O1w==
X-Gm-Message-State: AOJu0Yyo9DMNbwOJtm2a8d/gRdeaU5XvfFkkZ5tPBuQioAbomyDSgJfd
	sQmvM9azTdmwyToWA4DEAUfx2Mh75LQ7AJrbkNNyHfuq06dyh+XbuwpLHzgMYOM=
X-Google-Smtp-Source: AGHT+IHEtmX+QarKHP/fHEiIdq3PIxiOyRbGltyD0iu6IZMQAyPpmgbHVNBWPPYKrEZlewbLrYHffg==
X-Received: by 2002:a05:651c:1a23:b0:2d4:a8cf:e798 with SMTP id by35-20020a05651c1a2300b002d4a8cfe798mr2972250ljb.14.1710867959880;
        Tue, 19 Mar 2024 10:05:59 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c450600b004133365bbc6sm21924692wmo.19.2024.03.19.10.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 10:05:59 -0700 (PDT)
Message-ID: <e04b8086-ab76-4921-921a-fa01bfa4f312@freebox.fr>
Date: Tue, 19 Mar 2024 18:05:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: wireless <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 DT <devicetree@vger.kernel.org>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jami Kettunen <jamipkettunen@gmail.com>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> <87wmqoilzf.fsf@kernel.org>
 <c58e67e6-6a7f-4963-86b9-580165bf05ba@freebox.fr> <87cyse8j9m.fsf@kernel.org>
 <6d4b1381-c121-4cda-a8c9-9ccac56bd447@freebox.fr> <87plw87nsc.fsf@kernel.org>
 <0816f7bb-3c97-4b90-8e19-191552ea6e26@freebox.fr> <87h6hk7aee.fsf@kernel.org>
 <fb0ffdd9-923a-4191-8304-583243ad528b@freebox.fr>
 <CAA8EJppHa=qEkKbSVs9hMCBXfhiC9MyAQO+v+6TCWhg==4CpOQ@mail.gmail.com>
 <f26dfcc6-5fd3-486d-b0f2-80168eb213c7@freebox.fr>
 <880e016a-d4d2-4bc9-8c75-bbe4848515ad@freebox.fr>
 <a1dd2944-5d20-4fbe-84f3-b03a0cd5835d@freebox.fr>
In-Reply-To: <a1dd2944-5d20-4fbe-84f3-b03a0cd5835d@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_100609_041108_1C6C5F23 
X-CRM114-Status: UNSURE (   7.58  )
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

On 19/03/2024 15:39, Marc Gonzalez wrote:

> What a dweeb... bitten by the very bug I'm supposed to fix :(

Is there a kernel bootcmd to force the kernel to probe devices sequentially,
in order to get (roughly) deterministic kernel logs I can run diff on?
(Even if it slows down boot by a factor of 10)

Regards



