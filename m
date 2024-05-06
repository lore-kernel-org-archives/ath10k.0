Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C712CC10F16
	for <ath10k@archiver.kernel.org>; Mon,  6 May 2024 10:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaZ3b+wA8MZ5j8DpPLxbQdJidq7dsWbxXymGm0E7eaE=; b=1R9SngWy+JnwYQJw9O8V0MUeIW
	wvlIDt5yrP0uWlXf2eFenHJbLuODR866p2Z6MKkFla73EBQyVqJj7/jF6RLhHs32wJPEttU4QhE/r
	eBZOnxJSQlICl9rsBk+z5FRIGati7noUvU/8umoeJLjrFBj1uN2DnkFCyIDR4C4eIB3Vfm4mhBfGa
	nt1ZyJdNeCMDT3geb1vf80zdyMSe9jUAOyUv6CZ4Z0rFNU0VxIByUoAYmBgxbR6bVWEydRKlJr9OZ
	YLK6CGe/VpAPSUw5gwdq6tp+o3qBoPVHkn0/jOjq86wHMg4LUerXvb4CbceLLWDs8tq8b2eJf14D5
	4MEEUtbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3vkx-00000006zAr-2sUU;
	Mon, 06 May 2024 10:39:39 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3vku-00000006z9W-0Ko8
	for ath10k@lists.infradead.org;
	Mon, 06 May 2024 10:39:37 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a599c55055dso404041466b.0
        for <ath10k@lists.infradead.org>; Mon, 06 May 2024 03:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714991971; x=1715596771; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kaZ3b+wA8MZ5j8DpPLxbQdJidq7dsWbxXymGm0E7eaE=;
        b=3VPrzH6Z6dYIdLI0AbaXY/68mM4g6/DVJaHfDtpy2yqIsjYcGQ0uwe8Tcw/ZpTNlZK
         G6JAVlNUbglJh3o8O0ucfNzj5vlnby7yAeRA+GVBQkDt52s75M9HqgTtVOF64nDUDeqz
         +WeTaWK1wcyKYFxtoYw+RSHOdTYYSvOaOkkNdSL8Sf4mLsdQR0qYz+eQBxqpfX3eOrUh
         chDXltv5//hwqgd+v6M5wmGheOVF9G3JhhgbZguY1pl5FUMQsKpNAhn1iNvXBPfCYylj
         j4RW3NimN+T6QzH3CRLd4y5k2dhoa4TFo3A5uJt6QQu2i+lWnc4cVuD0qjFUOW85oefU
         ucGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714991971; x=1715596771;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kaZ3b+wA8MZ5j8DpPLxbQdJidq7dsWbxXymGm0E7eaE=;
        b=PCy5vJaPhyQfLLN+dkk3Wq4duvHaezSVCXGTI0UvEi1d5dMzX3kvQYeKJU0P/eU6nb
         OtS91qwAPzblRL1IM7ZMxOVOoFYaqWLXMd4ihIfJt1OJIKR2h4bXqX0JSiTyyQzRVCAn
         7K34T4ugfzmgNF24ZChD2MxdOQif4zWbeL9rFJJACcGAC/iHU7T5OQh5a8J/5GOnNvYO
         Kmg+QVgeCLU1nW1Nv1WkTTJASWEKOx7lPHjXT1HXfcGu00548cNEdCJHv/STKeqEVPWb
         H1OgffQSfMP08puISksC+y9XGJxw6/y4TlTqDXcAWJ8JAFF2JEqCF+PZrO5GjX69RaVR
         LoVw==
X-Forwarded-Encrypted: i=1; AJvYcCXGE66Ud2BnE8IRl7HlYA/udqqutnW3q5E/ptpWKoPQVSjtuzNFuGOTrO7JIVDKe760jkeWnD1HOkniQSSgs2u0wav2tiM2BQJ5lg==
X-Gm-Message-State: AOJu0YyorRyS3q9Cc+M6zdNtM442nAmgAi9rCzckncW8MUIDRCWNr1Eq
	DMs2nezSv3McoCrjPtJcomgdrH1IuHQs32ON50Oh9vh/eMiWc244mW4FebkRTMc=
X-Google-Smtp-Source: AGHT+IGx9LmYxtU/pPmXwTNmUrrwCTPVyDDzwM65RRchtvkrvBiT8EBHMSY9rEMAgxT0sUZSnIarQA==
X-Received: by 2002:a17:907:94c1:b0:a59:cdc9:6fe1 with SMTP id dn1-20020a17090794c100b00a59cdc96fe1mr1817914ejc.19.1714991970848;
        Mon, 06 May 2024 03:39:30 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ao17-20020a170907359100b00a59c3024258sm1809387ejc.84.2024.05.06.03.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 03:39:30 -0700 (PDT)
Message-ID: <02592b09-8ab5-42ab-bd6b-6db79722d708@freebox.fr>
Date: Mon, 6 May 2024 12:39:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Bjorn Andersson <andersson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k <ath10k@lists.infradead.org>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
 <0914f96e-fcfd-4088-924a-fc1991bce75f@freebox.fr>
Content-Language: en-US
In-Reply-To: <0914f96e-fcfd-4088-924a-fc1991bce75f@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_033936_160378_58F6C41A 
X-CRM114-Status: GOOD (  18.85  )
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

On 29/04/2024 16:07, Marc Gonzalez wrote:

> The ath10k driver waits for an "MSA_READY" indicator
> to complete initialization. If the indicator is not
> received, then the device remains unusable.
> 
> cf. ath10k_qmi_driver_event_work()
> 
> Several msm8998-based devices are affected by this issue.
> Oddly, it seems safe to NOT wait for the indicator, and
> proceed immediately when QMI_EVENT_SERVER_ARRIVE.
> 
> Jeff Johnson wrote:
> 
>   The feedback I received was "it might be ok to change all ath10k qmi
>   to skip waiting for msa_ready", and it was pointed out that ath11k
>   (and ath12k) do not wait for it.
> 
>   However with so many deployed devices, "might be ok" isn't a strong
>   argument for changing the default behavior.
> 
> cf. also
> https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_835_(MSM8998)#WLAN
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 67b8374ddf02f..4e6245095adfc 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -3234,6 +3234,7 @@ wifi: wifi@18800000 {
>  			iommus = <&anoc2_smmu 0x1900>,
>  				 <&anoc2_smmu 0x1901>;
>  			qcom,snoc-host-cap-8bit-quirk;
> +			qcom,no-msa-ready-indicator;
>  		};
>  	};
>  };


Bjorn,

This patch is supposed to go through your tree, right?

Regards


