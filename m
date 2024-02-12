Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC091C48297
	for <ath10k@archiver.kernel.org>; Mon, 12 Feb 2024 11:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6igGhHE0Wmh8X+D47XGNFybq2+vq3ZSP8U8DuXuJZOc=; b=Ih4zpHGxPqCqxYh6JuxrtFv8Jg
	AfT/a1zXOlmS+B1R2YZVRbJuLULGFUBsMQcOcvR9ug0E5AMrt0L7eT8/JZgUyAlW/q1vGmXvNKnld
	Hj/oCzANyezZdAaC6agIuTj7Ro75tD0hFABkTnAzzVNOH5W8oBiAKJuZ7nGCIviO5XuuFdRMMH20n
	hDgJyd4tcn3EC85QOJHbdpmdi/E1uXPimFgoE5LcBtjv9YHmU/v9fqlUYBp/Oo3UDum6R/zvRI2nK
	5AA27tLNuK2dJxuYwHgPm5U6PZQNq9BMzRM5PtBnWAFMhaF197qOwrcHZ1IIQdE8a3VhiW9MTSAjd
	wYmbR30w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZUlx-000000057zh-2JPt;
	Mon, 12 Feb 2024 11:46:53 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZUlv-000000057ya-154N
	for ath10k@lists.infradead.org;
	Mon, 12 Feb 2024 11:46:52 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a3c2efff32aso178070366b.0
        for <ath10k@lists.infradead.org>; Mon, 12 Feb 2024 03:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707738408; x=1708343208; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6igGhHE0Wmh8X+D47XGNFybq2+vq3ZSP8U8DuXuJZOc=;
        b=wZ8pCX/BjPW566YMgeTPybDs5vMo8TeKkWIHsBhHDx9a7a5/LdnOH6P/OvZmjeSBxh
         JZWRTsKCWKc2aUsS8nJrczXVcImQjW2UmxoG9Vc7jmK9Lz7x4vjngMsiP0tSGiBWGJDt
         QYpqNuUWz75XdtXhxWUwMYOPt+tE465oi9oFSXrS8porhgldIB2keS/9PXuw4zZA3S/4
         1byQ+2YLFrnjatSGwxRq1o2m5M7kb0ilgc8QW1cvFyueZH2agPWIho2D/5hFAY/kYk0h
         e+opvomr5YpcU4iUZEuKdRxdplOX+qJK78iMo1FfhDKhr0hTdtLb7SOrXdwKQMixvKNS
         WDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707738408; x=1708343208;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6igGhHE0Wmh8X+D47XGNFybq2+vq3ZSP8U8DuXuJZOc=;
        b=MAqKzXMVip2zgooKXKTp6ZFOhhXj7GSgNABOhVfEgu3/EYSUYD6LMgvrH68LxzX+cj
         FYFoYT4gpDys/pzS9E6mcUpD9XPOktwGLmGEdhc0Z3RofyKIHpgmqQ20S6GZOWkHslsl
         kDazpsVcQu5jEysF1kAqnBmh5XBhee9wqcwQjWYlNLeQ5OQZEVm4fXnNzpDbXCPf8Llf
         P3sT6s+NzZXb+v9A7uz20FFrcyAc6FHFEK1Ep7ROmF6RLONydwwVN0Ef4jXmGkd0gYVc
         QzkAgWzdEO/o8Nb3gQFDB9PdpmaGBJ4yKapUPU0vOAbcMqjd7Gzo/QGiJkxVMDkFxY2W
         si7A==
X-Gm-Message-State: AOJu0Yw/luVwi5G0W/6+Qd80pTxFg7EX08ZAKmd7k51cmAOTPE8KjFsA
	DLbwo0Xj79qC6jPfO2KAULwa+G/w49l+awNMlocCaSx4Gs07HX+MbU04vPUeNe4=
X-Google-Smtp-Source: AGHT+IHtMO/k7BQoK4cFgFlk4EAZ+OtEN24JAjUYza+tSEgNVW+iUAxv4YEHSUvFdsrBYJxx0+EjlA==
X-Received: by 2002:a17:906:46c3:b0:a37:2bb1:7517 with SMTP id k3-20020a17090646c300b00a372bb17517mr4477352ejs.45.1707738408616;
        Mon, 12 Feb 2024 03:46:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmdlD4KAro5iEc1Dr31HuIN4wk6LEz6e3kSziAz1hQ9NyQk1cdScqmB8JnycEV/4aRK2lP0ug8ho26cKPWBmAbgNK4TCs32ts4W+u7m3j+b0V1DJzCYhuv2XM96rBMFUy5fAo+Fj1Wnesw3KvBx0FXphgcajzpJBux4hJ0A38Pih44RzZWPZ/vPH+AGqIYQPSZ4/DV0ucix0Z8+SFYLbvfGbJbwo4kinntjvjW9m8sUnSKHT1lts7Li2WLXMLzpR6YNq3vtjTJrVNAlaqWcXHqIEqLgGmFYMp/FHOuo8SyL9uQY7Xo2O2wDfW8tz9cip5fiD19wmGWWQtV2CqmXwdwcpChYAydTZuSjz9j7xKgkl3OpodD/RCH3l74Ml8NoDQbVyDkZdXaNzssexbdh3+91cGzgm6Njw+eEEmY9xZGy1ILDPJ34WUd7QInVpo2D92LHfqYUo5kq1k2D/cDyoVLl7dp2ZSHOVGlBD/DVGDGxvJSk1+zEaGkqTW3sIpC
Received: from [192.168.192.135] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id f17-20020a1709067f9100b00a3c89e226f7sm123069ejr.181.2024.02.12.03.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 03:46:48 -0800 (PST)
Message-ID: <bfce2357-129d-4eab-ba7e-99f96f79ade1@linaro.org>
Date: Mon, 12 Feb 2024 12:46:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/4] arm64: dts: qcom: qrb4210-rb1: add firmware-name
 qualifier to WiFi node
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org>
 <20240130-wcn3990-firmware-path-v1-4-826b93202964@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240130-wcn3990-firmware-path-v1-4-826b93202964@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_034651_307611_AB9938DC 
X-CRM114-Status: UNSURE (   5.59  )
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

On 30.01.2024 17:38, Dmitry Baryshkov wrote:
> Add firmware-name property to the WiFi device tree node to specify
> board-specific lookup directory.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

