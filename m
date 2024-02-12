Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D003C4829B
	for <ath10k@archiver.kernel.org>; Mon, 12 Feb 2024 11:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6igGhHE0Wmh8X+D47XGNFybq2+vq3ZSP8U8DuXuJZOc=; b=pNxsLxS+8x3zC/TsAmrAH5S2Tv
	BnU02SGYq4gPhAYj6fSF3ZSbsjcNC29ZY0iJkc96LCvMmC4DYR6TgaMOChaAKqMSCd0/VWjCDKPH4
	+VtD1i26ENTzQti/Ob3b8zzmIFsUypDy8P2rgJTsImWEM1ZWPiagX+UDVhL2QYNkesuy9qXb/vgxN
	VtaGBjwwWi9QHFbxAh4CVNS7yvOYL9GwGi+QKRmJP9LUqMQltBfDbJZSoF5YOhkLzhsU14woGNfhJ
	eyfD/tLQVMgAtQX89VOa6uVIGluCHOv17aEqGd9LtYw2paDMpLEWVHQPnllc1+TXvRbPpcNYRaXaB
	fEkFyjWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZUly-000000057zp-0kwr;
	Mon, 12 Feb 2024 11:46:54 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZUlv-000000057yP-03VM
	for ath10k@lists.infradead.org;
	Mon, 12 Feb 2024 11:46:52 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a38392b9917so386858566b.1
        for <ath10k@lists.infradead.org>; Mon, 12 Feb 2024 03:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707738403; x=1708343203; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6igGhHE0Wmh8X+D47XGNFybq2+vq3ZSP8U8DuXuJZOc=;
        b=hxXvnqBblTVW9LBsxoWrF/0N2j+uX0+pHumL+kwzR38+5yAtDLX9uUjKHhtRpdX6e8
         Tof7KQ1oWIEo3xs3WlANUXEqM6iAy0Wqz+FyzhkC/z5+iq/5c32OTmoTL+rPIpuSoWP2
         Fpn3/qYOJSrWKe2cT9BGe3jg09N55GSObMeuSb6+sKlu3bBNszLKO975Yc79rKL1VMib
         JAouLIqUtZj57p77m7DcQ1Rs4LxE+x6DMkaLo7CEggqdUrlODuhwE+UEZRyh9cr/WRYk
         nh3RfWYbGeo7T7e3DsPKyYt3ugrgDbTZ6zapYhiOb5CpZQHbcW31O57rddhBu2ZwglDW
         nXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707738403; x=1708343203;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6igGhHE0Wmh8X+D47XGNFybq2+vq3ZSP8U8DuXuJZOc=;
        b=nkdnwaohijyz0mM7rf9Br6EZQkkH8JFXbynO/sNIf2OnO0jfhHpmP5KyAz94gXW4iP
         iTK+8hmITlBa0h/VECE7YptlatrXkdF/IE4IR5kowjVZAAtMlYbalTL7qxoAn6ahifO0
         SEChGnnLjvQPTK9B6XuJMkkAyliAV3RVSKBr3wkiiekDJLO4BiklyKSjucOzDd3opJJT
         XcyULTvnaF5GS2qajlD3tumnKmqmPuFlBlY9oIEFZQrd3H5/ckUd/v8KNvVjt33PW0nU
         UftIwuUPy5QS5pwaAbcZn7UuqDu0cQo1w14Dn1q1NKSaG35fLSnh51Y3aV3KtEnUa9nd
         4/hA==
X-Gm-Message-State: AOJu0YwIV3yAuY0xn6+hsBxoc80HrjV7tKD5xiHlIxMchf6Q3UPpxr2x
	cai9LSHnFHo0o3RbnaA8VmWJC8vjJSsVJVnRApCROaw8uoP5XkDyu6nsiSLt1N0=
X-Google-Smtp-Source: AGHT+IHGzo4sHaLedr+44j8i0CpRIflOiERJvsFJv4QUFXqbEUpmTMuFNNAQAEL0ft1qo1x2nqwMSg==
X-Received: by 2002:a17:906:a40b:b0:a3c:31d0:592b with SMTP id l11-20020a170906a40b00b00a3c31d0592bmr4115764ejz.11.1707738403323;
        Mon, 12 Feb 2024 03:46:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1ckIQODXy+qKYxw91D/0Nx4qkO/v4gxJqN9uP1xnHXUoSiusk11lug9xaJyWdt/mqkOPekkvZPBErqzVwRCEJsQjD9+v/HfMqbVrPsCrC/CYN42P9n0KmGWPIdTlJJgSyQxruf7wlq7wj7lEIunhIxHFnW+na1rEmQZc8+iuoAAWByK2G0JDQ2qgbIr42Bp2fzfZaOTAQZYKJMpA/mLZ+yyOAmah5Rix0vzgPhurFy8XIDvV7sHcu0LjmtZcKzOY3oGROSu2m0nn7IvXpnZro1MDfPihpF0088Ov1IvJbnqH+SDpJyAEwO/oPeYp6JRHLPtFLrXDtw/CW2dt4OBv0pnwxJ9fgavqXYmTk2qVEwg0yO6VVlYMcjEUFH1Jykd920n7vIOebWrqfpRAMU+CLW5XX1j7zNC12CMUvUOlyXkNAQD212GVvyZCLkp8NGPENopOgMsvXubTVR18prMUOjts8Fz51kVEQdw4msB7Pcd8gY6kIeX3TSW5gLy+S
Received: from [192.168.192.135] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id f17-20020a1709067f9100b00a3c89e226f7sm123069ejr.181.2024.02.12.03.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 03:46:42 -0800 (PST)
Message-ID: <2341b472-4a3b-49a2-af5a-9cc94fe977aa@linaro.org>
Date: Mon, 12 Feb 2024 12:46:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] arm64: dts: qcom: qrb2210-rb1: add firmware-name
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
 <20240130-wcn3990-firmware-path-v1-3-826b93202964@linaro.org>
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
In-Reply-To: <20240130-wcn3990-firmware-path-v1-3-826b93202964@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_034651_094060_22030ACB 
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

