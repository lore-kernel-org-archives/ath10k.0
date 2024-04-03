Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C475CD1288
	for <ath10k@archiver.kernel.org>; Wed,  3 Apr 2024 13:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Yy1+Kh6mnrNkIsDDzZC6QpS6YqOrI64OZBtZfxhZvo=; b=WUNi4pwn1FzMl11DTCTCyPc24G
	F6bUNbReZhYqjC9V9niys4vGy+Yh3xAz5xWfaZ8J8PyZww/fF/8cqo5fL1NA2PfHg1W+CkGI21H+4
	rpR/aovoFpykAfAwOqb9ncHuq3YqA7BugzxZoGRM9YN1qFxWqWG7HO3tMrJhirN5Eg8yA7Yjoo4jb
	WbKjY18UoK5Z9Ebub4p1ClCeJnK+yPhso6RfbX5KP2JnL9FVwYivkVeR5jl5+PzLYX7+Efr1fZD/w
	g5UAw5rBU1duqCRUTvjPYp/ZRD7v8EupDG4YA4IVBEVd4O+vBGff/OIjjHeRFIzvQRJhDlk56s3yE
	fEG+YFiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0JD-0000000G5Px-2t6y;
	Wed, 03 Apr 2024 13:05:43 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0J8-0000000G5Os-1Ue1
	for ath10k@lists.infradead.org;
	Wed, 03 Apr 2024 13:05:41 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a4715991c32so825274666b.1
        for <ath10k@lists.infradead.org>; Wed, 03 Apr 2024 06:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1712149535; x=1712754335; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Yy1+Kh6mnrNkIsDDzZC6QpS6YqOrI64OZBtZfxhZvo=;
        b=TzAuPc4qYzAl8rh5RmIfw7XNidIJnA99lzf6hDSDWs90QDB3Sa72F1j1ax5RUtNN0S
         mHrEWtYFk8Y2h1HMjOyf0mM/137yRbrojYlRSnMQOExrE7rdGVfGegYV4cSJ3GmW9H0g
         n6Yw6VRpFnEa1Gr+HSFzdCwuIuctRItDzlUx8O0wc/xr88Lq4DgAwzb7InNC+rNoUYuU
         XrMBmhWR9en6jHGONHgmtyrk1sP2fj8DfKv9HU41BymU/G8ls7fBCXi2xWO6SY4gfbgq
         8tRzFQai7AdYmChn5Cwi8UOvPEQwGGlpwXYxmGwBvoBdKVqC9hXKe1rVXqjXpHbImrrT
         wL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712149535; x=1712754335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Yy1+Kh6mnrNkIsDDzZC6QpS6YqOrI64OZBtZfxhZvo=;
        b=XRFJjxXS/bXlRRt34Ogyk6NGH2WRvD272wk/q9err1iIZ9oRbASxmmf0yngr7w4i27
         yDh6XIz6ESijMd5KcBk3EcLphhApheeYlfWflUTUnEk+HXQ2EAEybW4xC0MSSlBOkK3s
         KPg4oDq4B5ofxKcGGB0NAiasiSM7maGcK3l/GeOFLcbgDUImohidN6/6843fa1AMSmPI
         ioLxqa/qLA2xokAaGPYGRv4wRuZmezcZXP4oRGVYgW79xSGysGzzZ+HXA1O3lFU1D30R
         L4Ck9OhCYGtmL/k7NZh8SRz8ns5CO6x9R+E7IKgfJpBbnDDXeNvqystMoOHwk7ZSWs+F
         a4CA==
X-Forwarded-Encrypted: i=1; AJvYcCV+9On0Df3GN6h6i8A/OumPprq9Yh7J6gELpcQPNZ16J8yROjxHp98NXY4kkO6PWmURGqAXZ38bn3a4vkCpB2lPlAdMKeC+pgGuyw==
X-Gm-Message-State: AOJu0YxRUKzfwnKivxnz4KO8B3y90IqthJcWomPFSTerceb/CuL1BqLZ
	SwyX3WbZq/VMVGkcceN3tHZjFW7vJRnUoYJs7fO86LnoDdeGdmAcwsMGSEe+zbk=
X-Google-Smtp-Source: AGHT+IHvCjxIoDEM81ThMFGXmAee2lKZJYRPwGZglynP/ylH/CdDRIdN1evuMgXWrVvChyW1q2UCWw==
X-Received: by 2002:a17:906:d28e:b0:a4e:648c:1138 with SMTP id ay14-20020a170906d28e00b00a4e648c1138mr6161495ejb.67.1712149535307;
        Wed, 03 Apr 2024 06:05:35 -0700 (PDT)
Received: from ?IPV6:2a02:8428:2a4:1a01:79e6:9288:5142:9623? ([2a02:8428:2a4:1a01:79e6:9288:5142:9623])
        by smtp.gmail.com with ESMTPSA id xh12-20020a170906da8c00b00a4e579ce949sm4817000ejb.51.2024.04.03.06.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 06:05:35 -0700 (PDT)
Message-ID: <91031ed0-104a-4752-8b1e-0dbe15ebf201@freebox.fr>
Date: Wed, 3 Apr 2024 15:05:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>,
 wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr>
 <252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
 <502322f1-4f66-4922-bc4e-46bacac23410@linaro.org>
 <0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
 <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_060538_824914_166AB664 
X-CRM114-Status: GOOD (  12.82  )
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

On 02/04/2024 17:55, Dmitry Baryshkov wrote:

> On Tue, 2 Apr 2024 at 18:31, Marc Gonzalez wrote:
>
>> So, if I understand correctly, I take this to mean that I should:
>>
>> 1) DELETE the qcom,no-msa-ready-indicator boolean property,
>> 2) ADD a "qcom,msm8998-wifi" (name OK?) compatible,
> 
> I'd say, this is not correct. There is no "msm8998-wifi".

Can you explain what you mean by:
'There is no "msm8998-wifi".' ?

Do you mean that: this compatible string does not exist?
(I am proposing that it be created.)

Or do you mean that: "msm8998-wifi" is a bad name?


I meant to mimic these strings for various sub-blocks:

arch/arm64/boot/dts/qcom/msm8998.dtsi:          compatible = "qcom,msm8998-rpm-proc", "qcom,rpm-proc";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                                  compatible = "qcom,msm8998-rpmpd";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-qfprom", "qcom,qfprom";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-tsens", "qcom,tsens-v2";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-tsens", "qcom,tsens-v2";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-qmp-pcie-phy";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-qmp-ufs-phy";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-tcsr", "syscon";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-tcsr", "syscon";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-pinctrl";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-mss-pil";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2",
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-gpucc";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-slpi-pas";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-dwc3", "qcom,dwc3";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-qmp-usb3-phy";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-qusb2-phy";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-sdhci", "qcom,sdhci-msm-v4";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-mdss";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                          compatible = "qcom,msm8998-dpu";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                          compatible = "qcom,msm8998-dsi-ctrl", "qcom,mdss-dsi-ctrl";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                          compatible = "qcom,msm8998-dsi-ctrl", "qcom,mdss-dsi-ctrl";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-venus";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-adsp-pas";
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-apcs-hmss-global",


And these strings in ath11k:

Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml:      - qcom,ipq8074-wifi
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml:      - qcom,ipq6018-wifi
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml:      - qcom,wcn6750-wifi
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml:      - qcom,ipq5018-wifi


> I'd say, we should take a step back and actually verify how this was
> handled in the vendor kernel.

In our commercial product, we use the ath10k driver in the vendor kernel (v4.4 r38-rel).

It looks like Jeff has already performed the code analysis
wrt vendor vs mainline (including user-space tools).

Regards


