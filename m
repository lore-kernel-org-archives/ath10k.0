Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B08CD128D
	for <ath10k@archiver.kernel.org>; Tue,  2 Apr 2024 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnjXyGQnv+K7OySU/fVGoqC00agQXBDSVS0ISIH8C20=; b=yIpXVaovfT4OI2a7V3Ue3VY7ky
	GSgpxAoUSv3EWgy+iPNUD4qfk65ogQNIlu5qRNSBhJqeFCRmVaNVLpXdOlgxlMpI+W04jQ90usBxc
	rMIKRkedqyTYhHG5hMkuYI5+auuoZzgOJt8DJXFjybqv9iCtt1T9C+zvnYf6jrNfLQn4wINh4NUn2
	OD28xMUKdyBfq6qu48wmZU0vISKmCdAf/848KHZTKJrfMtJHrBFIcwobXgboAsg65N0RuNKwgci/V
	N9yHiGc3WmUjvajsJxqgkEJc62rK89NjaeTFJXflh+01SJWOFSeEG4Vc9M5vwE2vbuNyKhw4z8bUc
	fHtAql9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrfDk-0000000Bbbm-0sfY;
	Tue, 02 Apr 2024 14:34:40 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrfDf-0000000BbVp-1QPg
	for ath10k@lists.infradead.org;
	Tue, 02 Apr 2024 14:34:37 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-515d55ab035so2141627e87.2
        for <ath10k@lists.infradead.org>; Tue, 02 Apr 2024 07:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712068472; x=1712673272; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AnjXyGQnv+K7OySU/fVGoqC00agQXBDSVS0ISIH8C20=;
        b=YQC9KwYmQA6q4xtaAbOo4TFahAERHR5SYS15mHBAMVPwwUaKLnjo1qzft4o3HaMuC3
         UPgxWTuF89mO71RLULvpaeztYkW0tUwk41eYy2ancTQqf9ICc1FbJGkFQLi7bIipghKL
         DiyZ3Bh/FI6v3WntbptLjYybWrl+CCloEOaheyW2JRI1DkTrnsRSaj2PF0dzirhyRH1B
         NyHh0SXBx+cH1GCQTV0nZo93fFap2OliOQdnL01skigxlg+1YCqHZdvk0akv56SXHqW4
         Zn1u7z4oNtgmYBAODupW8PORc18SnyWARdHCCTxYzpfnfPlrYwIJLIIOzXQF3q3XG2u8
         kv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712068472; x=1712673272;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnjXyGQnv+K7OySU/fVGoqC00agQXBDSVS0ISIH8C20=;
        b=g6GVqHcoSQyjI3sXYzRLjfYS6wAoyszqpSLcf5hECON1OVmrohzhnq3Dd68cgpx+Fr
         tMQI+UmCy2alYB2cyJFP+lsGHXESGx43OgUTbtTRbVJuimID3AMDvp+upA8S9RYSpC3M
         7k+BsjaNx9764VGVF/tlR9hAqEuP5aDxseb4ZgKpf3oGtnYq2o5QkEKWfTSjQyUj5DJ8
         RS4BCTY/1G92yElv/Gs2JecTekBMMuN/4cXcdUvKH3kX15GaaM0+EVMIgSUL7Jit6ne3
         qwgGy8gY1c3Ru+MgT8rT9/x5pL/83N/oSlMJkZU3PMLOw9IGtNndH4dRwVvlVaka34VR
         VSvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxQaR0KFjUdKt+ocTgm0IbnZPSkicbo81eSm7ojPuIorB9QC/8E/wAbOLSUD9VpFSZit5w2tPYjVCo35gxIwKpXffXL6/FiDnlhg==
X-Gm-Message-State: AOJu0YxQGm7yQnM9b2Jx9tEniB7EqdVOSlfqWs0fxGw23+EYAdsUnCSA
	v1lplh7YvvtjLh1j1rE9yUXynrCBo5HqSzptZBUVNa8WLKnJsUIUVURxLaotqf7xJmuhkNjCTN9
	E
X-Google-Smtp-Source: AGHT+IEQwhaDaoosfMXwVTd0G/AOuzHoD3XJGpFspxhm9sfxwNNq4NXUggwgf+JLDvt1f6x1/jHEOQ==
X-Received: by 2002:a05:6512:2c9b:b0:515:d498:2362 with SMTP id dw27-20020a0565122c9b00b00515d4982362mr8626706lfb.6.1712068471960;
        Tue, 02 Apr 2024 07:34:31 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id q2-20020a170906b28200b00a4655976025sm6557952ejz.82.2024.04.02.07.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 07:34:31 -0700 (PDT)
Message-ID: <502322f1-4f66-4922-bc4e-46bacac23410@linaro.org>
Date: Tue, 2 Apr 2024 16:34:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k <ath10k@lists.infradead.org>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr>
 <252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzShLb25yYWQgRHli
 Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+wsGOBBMBCAA4FiEEU24if9oCL2zdAAQV
 R4cBcg5dfFgFAmQ5bqwCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQR4cBcg5dfFjO
 BQ//YQV6fkbqQCceYebGg6TiisWCy8LG77zV7DB0VMIWJv7Km7Sz0QQrHQVzhEr3trNenZrf
 yy+o2tQOF2biICzbLM8oyQPY8B///KJTWI2khoB8IJSJq3kNG68NjPg2vkP6CMltC/X3ohAo
 xL2UgwN5vj74QnlNneOjc0vGbtA7zURNhTz5P/YuTudCqcAbxJkbqZM4WymjQhe0XgwHLkiH
 5LHSZ31MRKp/+4Kqs4DTXMctc7vFhtUdmatAExDKw8oEz5NbskKbW+qHjW1XUcUIrxRr667V
 GWH6MkVceT9ZBrtLoSzMLYaQXvi3sSAup0qiJiBYszc/VOu3RbIpNLRcXN3KYuxdQAptacTE
 mA+5+4Y4DfC3rUSun+hWLDeac9z9jjHm5rE998OqZnOU9aztbd6zQG5VL6EKgsVXAZD4D3RP
 x1NaAjdA3MD06eyvbOWiA5NSzIcC8UIQvgx09xm7dThCuQYJR4Yxjd+9JPJHI6apzNZpDGvQ
 BBZzvwxV6L1CojUEpnilmMG1ZOTstktWpNzw3G2Gis0XihDUef0MWVsQYJAl0wfiv/0By+XK
 mm2zRR+l/dnzxnlbgJ5pO0imC2w0TVxLkAp0eo0LHw619finad2u6UPQAkZ4oj++iIGrJkt5
 Lkn2XgB+IW8ESflz6nDY3b5KQRF8Z6XLP0+IEdLOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_073435_503369_20A1586C 
X-CRM114-Status: GOOD (  13.45  )
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

On 30.03.2024 7:25 PM, Krzysztof Kozlowski wrote:
> On 28/03/2024 18:39, Marc Gonzalez wrote:
>> The ath10k driver waits for an "MSA_READY" indicator
>> to complete initialization. If the indicator is not
>> received, then the device remains unusable.
>>
>> cf. ath10k_qmi_driver_event_work()
>>
>> Several msm8998-based devices are affected by this issue.
>> Oddly, it seems safe to NOT wait for the indicator, and
>> proceed immediately when QMI_EVENT_SERVER_ARRIVE.
>>
>> Jeff Johnson wrote:
>>
>>   The feedback I received was "it might be ok to change all ath10k qmi
>>   to skip waiting for msa_ready", and it was pointed out that ath11k
>>   (and ath12k) do not wait for it.
>>
>>   However with so many deployed devices, "might be ok" isn't a strong
>>   argument for changing the default behavior.
>>
> 
> I think you got pretty clear comments:
> 
> "This sounds more like a firmware feature, not a hardware feature."
> 
> "This is why having this property in DT does not look right
> place for this."

Translating from dt maintainer speak to English, a functionally-equivalent
resolution of adding an of_machine_is_compatible("qcom,msm8998") is more
in line with the guidelines of not sprinkling firmware specifics in DTs

Konrad

