Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7060BC48297
	for <ath10k@archiver.kernel.org>; Mon, 12 Feb 2024 11:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHBVPTLCCK1K07+ATMZqLBCAfy1jkjgoH7L1BwVKMB4=; b=jD+KOc+E+iJTbB/TU7xSF4beJX
	eVhpEluJSBJKJUnWOkxdepbuqQciWih8FiPfcE36G1P/2pzLU3TBBo4CZJm2fnqi/jMFYu3OqFgGc
	9KHE9qoq5IkHikIEjIxECD0mA4mMFU3UpmHHTX/BitUfWgCq2SmB3cw/jalj4JXn8+rkkhOU/EE+A
	/LB2eVqqN0My389VChSjioWubGX98O3Qcts/ympomroB6vK/Glq10OO4VoG5YlQe4X4zpNxPpKoT8
	/OzX31E70GtsVLKRsRmwto2G7oXxh6E2HrRNyxJrOOnJU9ehs5sEWJKKgVZfkZZCZMFw4JlfGpgU3
	9X8aKkiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZUF4-0000000534I-1rKp;
	Mon, 12 Feb 2024 11:12:54 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZUF2-0000000533q-1GxI
	for ath10k@lists.infradead.org;
	Mon, 12 Feb 2024 11:12:53 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2d09bdddfc9so39025131fa.2
        for <ath10k@lists.infradead.org>; Mon, 12 Feb 2024 03:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707736370; x=1708341170; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lHBVPTLCCK1K07+ATMZqLBCAfy1jkjgoH7L1BwVKMB4=;
        b=D2FRVrEW0hSJYViqIKT0bSHhV5hyVzGufx3u9FvPkfx8ZH0EuJiJ04hsQTiDHr8krD
         ZItm+p6c99cTjAnj0V5+v0oTRpNJWU6+wqF1T83LB7B+o8gdiW4DhrGpuWLv1H1qg1JE
         6mRPDmlyYEXJhp2IIDUJ2i5A6CDqI4ZtTjfn+mkL/KSMnCDaWBwyi+LxS8fVVqZAqrqd
         zqMKSfoh9OCXbPOcQRMXiyUMKdP9EjdviOXGL7ms7y0+wxGUeKKUK9Fdz07+Mq6QWZWK
         qmiXDapUnRphFN7II/64IJhZeABJTGrfme/g7k2L22w/1QxYlONhiWJptChiBToIdFWH
         1iXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707736370; x=1708341170;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lHBVPTLCCK1K07+ATMZqLBCAfy1jkjgoH7L1BwVKMB4=;
        b=ANE/zUBQML0+3gv0rpX7DEfkR9hWtpGKlfZTfYjToGkkcLLutufnUKTjRKJJPNAaxP
         9pasFHb7NQnRTf4nFAQO62gCa/dsr4oQJCMshkHPx8FP2b1J49RPK6oB5J1ubAoPfpzo
         nMMQmYMxyvuLlFaICnF97NWutp3pm//UDO4AMnCYwtIgmoQL0XyGn+PgwpPW43Dp0Ut4
         QJTONL9GqGLzdznZvfTI/wQUjIhN93WqC0ZRGF0w2VyL8yRz8e8Ae+NTn0rvQ+ksZpaR
         RszGTWKmvqhzPtjP5T+kmSBLCqePojtMjEvhopn5/cDFFj+b80+C4lVjoInYDieblOPB
         pf9A==
X-Gm-Message-State: AOJu0Yzl5bNXz8r3F2xvEIijN/HjK+I7B5UnAQxcRWyuAVOnJAqD4Ioq
	Fr8QasmiSSwzzL+J0n6xg1obT9ebBP4Mu7EFmHA6RLjN6Lr4MAA1vzrddgFh2MQ=
X-Google-Smtp-Source: AGHT+IEa4vK0/xkbABkqYgx6sLNT5sOa2wgD+dsbTeY5TgLxQcqEaEq90er8k3ZLOVrmr08VnFablA==
X-Received: by 2002:a2e:9659:0:b0:2d0:b336:e0f1 with SMTP id z25-20020a2e9659000000b002d0b336e0f1mr4052361ljh.14.1707736370294;
        Mon, 12 Feb 2024 03:12:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDK3TNDg+4YUkz3ICxegjKKt8gvtMHZKqOC9wcNHxu2Boe8zFK/MZ+eq+BxsNdK0sRGOkG+uFCpaJUCOMNJ5i1fkF05cTUSEY7TuwX8eicCHhWEq63Ah4/fmdDaoG8teSSpRKu6LIp70MdAiq3VFbU19o04uvgz2twSFTkO4mdAquB88ItWcQcdZkCaFXP86mxUs18/pqF8+FaGgVDzuvE++XLDrG5E3e58JmA52HZY6I2sDR4bMywgsdOt4A+4886RDImfAl/2m8M7dsH59i7+qlawfcNqhWx4uiE9aiFpYqAHip5huRGMZzlqtwfmpHyEJHRY7pecAyPItkI2xcEUfBI8VfYyr+fOxOltghQMkHMg7zjd6vwzqUzATd3OS4ryjGxhZXZcAcJGdkpBbRWd0yQjCzdN2fb6D6RWSa0SKxRgF/sKJxEXl9ykgVHXjnDS5Wd3yTseo2AyNylvGMDRFQxrhJXvyQ4j65xbQf1floFdLQjOYHMe6HpduJX
Received: from [192.168.192.135] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id a23-20020a05640233d700b0055ff708dee3sm2618622edc.11.2024.02.12.03.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 03:12:49 -0800 (PST)
Message-ID: <03d5d556-9477-4f2e-a737-c2f6a96d97a4@linaro.org>
Date: Mon, 12 Feb 2024 12:12:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/4] wifi: ath10k: support board-specific firmware
 overrides
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
 <20240130-wcn3990-firmware-path-v1-2-826b93202964@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240130-wcn3990-firmware-path-v1-2-826b93202964@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_031252_387396_97AA87B0 
X-CRM114-Status: GOOD (  14.64  )
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
> Different Qualcomm platforms using WCN3990 WiFI chip use SoC-specific
> firmware versions with different features. For example firmware for
> SDM845 doesn't use single-chan-info-per-channel feature, while firmware
> for QRB2210 / QRB4210 requires that feature. Allow board DT files to
> override the subdir of the fw dir used to lookup the firmware-N.bin file
> decribing corresponding WiFi firmware.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 11 ++++++++++-
>  drivers/net/wireless/ath/ath10k/core.h |  2 ++
>  drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
>  3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 0032f8aa892f..ef7ce8b3f8fb 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -942,11 +942,20 @@ static const struct firmware *ath10k_fetch_fw_file(struct ath10k *ar,
>  	if (dir == NULL)
>  		dir = ".";
>  
> +	if (ar->board_name) {
> +		snprintf(filename, sizeof(filename), "%s/%s/%s",
> +			 dir, ar->board_name, file);
> +		ret = firmware_request_nowarn(&fw, filename, ar->dev);
> +		ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot fw request '%s': %d\n",
> +			   filename, ret);

Perhaps it'd be useful to move to a more noisy loglevel

Konrad

