Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D79CC4345F
	for <ath10k@archiver.kernel.org>; Mon, 29 Apr 2024 23:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fd2LTJN7mExidgR4wG0glRVq7EWgwgs0gJNGj4m+AT4=; b=K6QIkKEgcC7pBBzwxyn/5WtbYW
	6dLvdxOJAz/D7MiCu2Y3Ltt0rtKyP/MT7qvrMMav7r2yM9BrUjEE8pyIJnujutfcXgjpdzZ37npwQ
	ek3kCTVPrni+hbcv70F2yGk6ov5RoGz/JJs+eebZcJBZ0ii112CTDLoT3OgOmOeXtx3RAAoZvKRXt
	XE8gpRN1+2WqHjH6eXO+EZF2brOM4tZxjvYn90zaUZdjzTCtTEn1ER3omfxGEiLEOiWWFcNjHa3+r
	k5wU9V3SjJ04/3GZM0QLWE1d9gFLZ4W/Pf9fZ9nO7HVoAd+ky73+yz6pmMedSIEMraHU1/YCkolRT
	dQmPPKZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1aMb-00000004Sgi-3Hcw;
	Mon, 29 Apr 2024 23:24:49 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1aMY-00000004Sfe-1wGG
	for ath10k@lists.infradead.org;
	Mon, 29 Apr 2024 23:24:48 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-41b79450f78so27345975e9.2
        for <ath10k@lists.infradead.org>; Mon, 29 Apr 2024 16:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714433082; x=1715037882; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fd2LTJN7mExidgR4wG0glRVq7EWgwgs0gJNGj4m+AT4=;
        b=G1RbgcuyD2xRooqThAcL20JlbmlciMH3BCzsXjgXeuVv7dRgQ7wNnnc1C7dMGGooA6
         BYMaZnXi6cznNbGor6hHNvAi/Qlr2PzASpdypeAxt3Q6imGosSoRXonDttgpB6TjcdMI
         u1Qz21BlDCWWz1Gi872S9LJ9PNjGmol3pkg3Y0PyXzMUBtOckLI8ACsoJDoizLK+5Jap
         CBJgDmk6qtDdA696qR8xpzrXHGbkXzU5fzbEl+QW7Ms6xHPZENLsNpqpmlcTR6meVS7D
         OGM5UcAoIGJbxidfbdJuklNaHFQrAqXcOFFPkzE+nv26sRtywI+0usxkcVO5Z4jthmb/
         BEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714433082; x=1715037882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fd2LTJN7mExidgR4wG0glRVq7EWgwgs0gJNGj4m+AT4=;
        b=LsjoQjPbD1+ootRhnY/Fo9V3zsOm6XjjjsNSuqZ6wCYfJLnWg7tgv2O2TzpVAAoCAt
         4DwcwtsbkZ6n14EktIBPq2mWtvg2/oUhv9IpuCGVU0T13DCMrz6qvcTJcxON1d9Lj5O2
         te2rly2UM55F056HC8qU3rdrKpdziyAdvdTol/luFWiaDmYVTpV1EgU3/sEWg8NeKk1a
         ylS0s90RRDruajEsdLfAFTR548raRFo8QE1tVgbvd8pzxv9LUBhWGjDfgmlzLMaCbFC2
         vjfEL/tPeYvk+ZERd4yor9VTmwbGl86C6U/Qzf5WB0fulIxCSDeZ62wffWUZoDImRsld
         T5XQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5J94r6+BEZjAb/U+GiwGQMACIWj40XDkw/L3BZxxzIYDaadw1gF47qQLa5YGUQWeEsIcFEVZ2TlPo04UrfdDhPlo+He+EL7k0Rg==
X-Gm-Message-State: AOJu0YxgQxjIDf4EeGIxnEM4VWlNjcuHWQLdQlsnnQ2KiFUgS+yv1rSl
	MPC8gBm9BBR9jNqDndQHLQAMqebaBuyk4U7YcxeRFhvVLktwTQj9Oy9bEdpl10U=
X-Google-Smtp-Source: AGHT+IHE7q9J0s4PVV5qxrR1nnvsJd1w+fjAvErLazpWYnvpEwqc/iF7E4hKZWuHUnbgRl27LnK9TQ==
X-Received: by 2002:adf:f5c7:0:b0:34a:d1d4:cb3c with SMTP id k7-20020adff5c7000000b0034ad1d4cb3cmr9833037wrp.39.1714433082505;
        Mon, 29 Apr 2024 16:24:42 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id y18-20020adff152000000b0034d7a555047sm315284wro.96.2024.04.29.16.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 16:24:42 -0700 (PDT)
Message-ID: <463bcd2f-c741-4120-b7ae-2bb55d5211e3@linaro.org>
Date: Tue, 30 Apr 2024 00:24:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Work around missing MSA_READY indicator for
 msm8998 devices
To: Marc Gonzalez <mgonzalez@freebox.fr>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k <ath10k@lists.infradead.org>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_162446_552537_FC533FFF 
X-CRM114-Status: GOOD (  12.53  )
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

On 29/04/2024 15:01, Marc Gonzalez wrote:
> Work around missing MSA_READY indicator in ath10k driver
> (apply work-around for all msm8998 devices)
> 
> CHANGELOG v3
> - Add a paragraph in binding commit to explain why we use
>    a DT property instead of a firmware feature bit.
> - Warn if the "no_msa_ready_indicator" property is true,
>    but we actually receive the indicator.
> 
> Marc Gonzalez (3):
>    dt-bindings: net: wireless: ath10k: add qcom,no-msa-ready-indicator prop
>    wifi: ath10k: do not always wait for MSA_READY indicator
>    arm64: dts: qcom: msm8998: set qcom,no-msa-ready-indicator for wifi
> 
>   Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml |  5 +++++
>   arch/arm64/boot/dts/qcom/msm8998.dtsi                           |  1 +
>   drivers/net/wireless/ath/ath10k/qmi.c                           | 11 +++++++++++
>   drivers/net/wireless/ath/ath10k/qmi.h                           |  1 +
>   4 files changed, 18 insertions(+)
> 

I wonder if you could infer the workaround based on firmware version, 
instead of kernel passed flag ?

---
bod

