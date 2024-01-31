Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7442C47DDF
	for <ath10k@archiver.kernel.org>; Wed, 31 Jan 2024 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSyq8T0dgaUi5zrT7v/7kxWNYaOkrtZjbuuR7I5khSc=; b=wOuT/YW2mQiDaN8yvgFUl9xAqN
	9Hg+65CCO0s9a7PFh5o7KF4Ijzs7RlDCqn5GJ/KjOVH18o+1i6bjtJrlwKInzQIGCzENrKXz0kPHF
	IaghoPBgh3GKxhypcKlEBdEj0dN3gU1BAixFZXWz17gciFiBeWzuKif9R5zu7h7zZU2nIRRRwjBxu
	zNFizEMeAK5O+zGRsWUZieEoAdqjDisa0NwLfm49xEEmy8tbp9My7MH6njldI1GHL+W7T17Vi0geT
	MAf0msYS48EOgLo/e+5KCoF3JrnP9+vpmsc3YCCyqryVkAozAcvDKiQUR7M6GMjPGlWeP1Q4TrKg1
	WTaFsSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV6wR-00000002TJF-1LHq;
	Wed, 31 Jan 2024 09:31:35 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV5wx-000000026h4-3Jju
	for ath10k@lists.infradead.org;
	Wed, 31 Jan 2024 08:28:05 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-55f1102b300so3350203a12.2
        for <ath10k@lists.infradead.org>; Wed, 31 Jan 2024 00:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706689673; x=1707294473; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jSyq8T0dgaUi5zrT7v/7kxWNYaOkrtZjbuuR7I5khSc=;
        b=X/JjbhOoWm7aTNMjuFdYW2x+EfxsgCzZk2Z/n5uSHeSA1KeEarqBbOKGwLD9YijVFY
         9HfFnBFp8k51JSib6HgJos5OSwEBBlNHrPE6rTHIGxFMFV2b3lapf7a+CC1Ci4YPGBGp
         iOfdqScy3LDShn9TCeCTVIwRVroahxALkW3VcqeknOlDw7p+g3i29c0gDpCY7L7eKL0m
         eL+M3JCSZQTCoeNBbwiOPqw/1MmLXHpNuxyOE0y6IWxKmWf5eBIXlKBWvLXcigF8NIun
         /6mtP7kZWhiXfkzLUSMzD1VLejxcnmVQv0WPl7yhEmH92k6gKhPf9sKXdP9ND0hkNz7Z
         0Fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706689673; x=1707294473;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jSyq8T0dgaUi5zrT7v/7kxWNYaOkrtZjbuuR7I5khSc=;
        b=VtPiZrwikNEsg/U38z39zYHdpOxj4e+DbEjJM8f/W0D833seUIMTJhheQb0ObmOV1y
         UK5uOz48StFDAS7tk5PxGezeFoBhm0GpSnnFq9kjRTeOPw4wc42qUl86Fj0sgB0eIW3C
         qG2sK1WWcuwwMWyigkggYGW4wKYhUuzBiZjOKKaAZTZP/7uhZQGI+eK9wHI6lwXACAfP
         dTJbSfbNGYNh5GmQgaEkyL8paNfJ8V5DYenCD8DPE0Gai8sfWS2Y3kiz3RwwH6bpUBgu
         qrJb36Vpca9adOCd/d6FkSVXhrhNjEEPj6upIiTDlmxNpc+4PoKAfhz08430XbpUbJ/H
         LbIA==
X-Gm-Message-State: AOJu0YxCs5r8M1hCfMK2WLwG9Hq9fMLfwkYYFHG/U1p+jF6tjBdnvFGu
	poKhmzn9VpNa2xqSFN8W1ekUiHGWHbbilVFJttaVn+MSlhFAQwkRoCEOIBDHBzY=
X-Google-Smtp-Source: AGHT+IELjYRIc3zYE0j0jPirvie0a03AwJKzNe6ScjTg0S9BDZYPz9H0ESnHsbPbuzr/vd+kofGQbg==
X-Received: by 2002:aa7:c2cc:0:b0:55f:314:6890 with SMTP id m12-20020aa7c2cc000000b0055f03146890mr580405edp.22.1706689673084;
        Wed, 31 Jan 2024 00:27:53 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWts5SGByEezZ9xzA8RTu72RZOePLNR39WdTnddJ5XM+N/q+2c5XWBt8goBlk/BLIbgaRudJSYf8AfMLwzgPvaQQ2jI0kyioxLoIp1zqe0HK2zVHEt/4kh+0Mjo1fawrAmwItsvhvf0NB8YS3s4cZU7i6DUqiiRY+FBOFZiN5Qg/Uss7GcpUOFC2qLpRQh3uZQpOcfufsGmSfIWeZJKJ82VeYzX2udbXp+ZegcTGuDE8yFKRzvoRirMm1fnqmp2D3wiKsJ5QH/mFVlN0TZK8pQN8dnaqWIzIoJPxqD9hGGav0wAqnnTtdk3Vui/F1I7oVIxf5HJ06I6hDPFBOMSoS4/ZQW62KZvfIY6UGxKTnCR3Woer5MOE+Qmu1434FI5MqV9Np4agZM2Q64SbuVCn1/my6fsFfnCT1WP06+xvMgv9ApfZFtXbVnKT+EXRooH5tp7IbBWKbWX2tVnyk1CT7BQRPfSin1v2PN0CqO101HSjNot8Gbx0x4tlBaxOAgwHl/XWpOm3TLsa2/ZsA/Li1WeFeHWGZhjBks=
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id x6-20020a056402414600b0055d36e6f1a7sm5442819eda.82.2024.01.31.00.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 00:27:52 -0800 (PST)
Message-ID: <f5d3cf5b-9e3b-4904-8edd-fa1e18652990@linaro.org>
Date: Wed, 31 Jan 2024 09:27:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/4] dt-bindings: net: wireless: ath10k: describe
 firmware-name property
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org>
 <20240130-wcn3990-firmware-path-v1-1-826b93202964@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240130-wcn3990-firmware-path-v1-1-826b93202964@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_002803_882582_657AFB4A 
X-CRM114-Status: UNSURE (   9.06  )
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

On 30/01/2024 17:38, Dmitry Baryshkov wrote:
> For WCN3990 platforms we need to look for the platform / board specific
> firmware-N.mbn file which corresponds to the wlanmdsp.mbn loaded to the
> modem DSP via the TQFTPserv. Add firmware-name property describing this
> classifier.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


