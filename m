Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210B9C25B10
	for <ath10k@archiver.kernel.org>; Mon, 13 May 2024 08:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcuSPS5JIn6rbUtQZQnUWcPyEdFOS0C3v0LidEoMeqU=; b=frYr0tyap4uL5vfBTu8v+dYd7Z
	gNXmyEoA8Z3y/Davj8egNm1flJbANgwPSaoho5l8VE9t8Yhh0tPAYwj3QwHKTbOqNW/+sn+PBLlIM
	BALmNq0hUoDyTalnyvytS4w/6uOqdayx1ZfWwysOKQHg46t5pfY+KSvoQ+JjMUx9prR3Cw+96EG4g
	7IjSN7G6RF46/M0tq6qMoN39qPhYHZNBhRYEf1hQAiUHxIeAoKNdA20uv+M6UZHuLM0l6UCPrsfn4
	ppTaySO8Vr9Jje2EY1LMQ3it+7M6eppUqoqVkfIg+EMAIUP1vtonQaf/pFrk4/k+r1mMGLXCKF2jl
	138S8f5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6RKz-0000000CHAd-3Uv0;
	Mon, 13 May 2024 08:47:13 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6RKw-0000000CH9e-0pU8
	for ath10k@lists.infradead.org;
	Mon, 13 May 2024 08:47:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-420180b5838so2757585e9.2
        for <ath10k@lists.infradead.org>; Mon, 13 May 2024 01:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715590028; x=1716194828; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bcuSPS5JIn6rbUtQZQnUWcPyEdFOS0C3v0LidEoMeqU=;
        b=t3YHadUagG9KhUibW+9TPFdEEwxByS4QwCGo8M2yIzdmTIyaeG3YAzOM/+6eMFBd7x
         LFIMb6m3J2QW9+yxI6K4DpsFYumxUx5CP1Fs07m2P+3JxkCkq0Qc49yZiHG3nFogjKaS
         5ekLbAO2dsy32DPdl6/uv19ulCcpJrPWwijXBYKxzGakoxBWaSPXKPJwJsMW5EWtNbI2
         VjQatuRxskyF4ZbKcnzA8p10W+/40kTBZslvQfX+vI8+5GFpfGOBEktq8ykkJZjziuOT
         Bns2nJlszHP+O6VauoEnYK6jXETVhogRZz4ygyJsIPy0MuhdQR02Z7q1WrOKyTUCtQ16
         fWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715590028; x=1716194828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bcuSPS5JIn6rbUtQZQnUWcPyEdFOS0C3v0LidEoMeqU=;
        b=rjCOSxo8y9sEgr78Q6iea6K4yDLNlI9fkH+MP5zFwbfBu5cMl50t3EESual+FC+NsW
         kLdBKu1RsbCBzHMd7vK3AARaXelZ3nOxRXUMgvlF0qMWDbuGHmhCx+gN4sFFtztwmLuG
         uO449PaNI8KfpKSyzu1eThOnWSw58qOgUaNGBRwSa3zYjY4WXiVKwEcjBSHWUx9zkPI3
         5aYlIBxItBUVAXyrJ3i1SD4CZI6mOCwajN0iHfHqlNlA5H28cs07dLgON8hPB4bs2KKN
         IHvN2Wl1uIGX/Z7/X6i4k7HbCii+zmjAEuSnWtyIAHJL1kKHcxhrjZQyn/2+WH5dokOR
         8pdg==
X-Forwarded-Encrypted: i=1; AJvYcCWCVuYTwzdkVsie/knwVnbK4WOognSlvlKBJcFaKueX2bBi08W7x4bG4rER9uGzYH35GpQ0QXi5h+AleJ4ZF4a7mrXxGSSRVatr5Q==
X-Gm-Message-State: AOJu0YzTbk4muQ6nv1TziaC0hNwLlfPeGk+pNbKr1IswVFbQCFcbyw+R
	A5E20hLl/rSHWVg0JHO7rB+WUwRkH5SRPB/0XXjjr07MlOHRBgP+Mt6x5g6nmz7xACqXyB5PfAV
	M
X-Google-Smtp-Source: AGHT+IGoxUAK37WJch6WRVq2ZvJDJfB6x6dqXNnk8tHgr5jpbGnCW0QRGrUfoYzmHSmaKrgDIicWlw==
X-Received: by 2002:a05:600c:42c2:b0:41f:e4ad:9ae4 with SMTP id 5b1f17b1804b1-41feaa4391fmr99777695e9.23.1715590027893;
        Mon, 13 May 2024 01:47:07 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccfe1527sm147482565e9.44.2024.05.13.01.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 01:47:07 -0700 (PDT)
Message-ID: <3d004edd-f83a-40e5-ad7b-ee97dc198714@freebox.fr>
Date: Mon, 13 May 2024 10:47:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
To: Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>,
 wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
 <54ac2295-36b4-49fc-9583-a10db8d9d5d6@freebox.fr>
 <ZjBV+th9DmnNLhnN@hu-bjorande-lv.qualcomm.com> <8734r3qysm.fsf@kernel.org>
 <b6a1eadf-477d-48a8-bf39-ac3c3191e929@freebox.fr> <874jb9mu5t.fsf@kernel.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <874jb9mu5t.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_014710_383171_E90D4141 
X-CRM114-Status: UNSURE (   6.79  )
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

On 07/05/2024 19:03, Kalle Valo wrote:

> Thanks. Please check that my modifications in the pending branch are
> correct:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=3aec20a8e797b28d32e75291cc070d5913bf6dab
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=df5b4bec31b0736a453d507762c5b3d098d5c733
> 
> I can freely edit commits in the pending branch, it's just a temporary
> branch for testing.

Looks good to me.

Bjorn, can you take patch 3 in your fix branch for msm?

Regards


