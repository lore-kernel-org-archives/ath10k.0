Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2685AEE642E
	for <ath10k@archiver.kernel.org>; Wed, 31 Dec 2025 12:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zllIvUd7nwiRGgPkDw+woicrVI32te+1le0taRMAsb8=; b=gNgyfOwgKZNAFeZgeyx3jgQtp2
	uigYSE8ADW52/HC/uL/5BnoaccJ0IZ1qPwve4MHom6F2kwW+CKYZtcz+WuROQ7n3Oy1X3EWQh7vP8
	J/obqE34cQAJhWYTrns9kKYGcP4bC7pxFB+AUuk4MwQZMwOuV3illlUQRuoW2ZJ3ZXYn7DcB7F+oT
	hTnpw4FzetFv2KwyFWvf1ibCo6d+xZpddJfk4GUnfhDHkxPdLtkMcG4BfyFS69ihvJBdC2Awpda/X
	W35ykSIC4dc3vPJxvNa0iWSLWwii8+2EbagcphVrf98TKywkyB0IArFrwUxbLHCfWynrLy4qWTG1o
	6DD68dkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavC4-00000005xlN-0vGS;
	Wed, 31 Dec 2025 12:20:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavC1-00000005xkw-10UI
	for ath10k@lists.infradead.org;
	Wed, 31 Dec 2025 12:20:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUNkeAN3138113
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zllIvUd7nwiRGgPkDw+woicrVI32te+1le0taRMAsb8=; b=P1+lzf8ReZpj3byR
	hyecp0nAeX6fcWHGEXiK1bpbcfhdPjFhZStXSR4KGbAdbWUODhI/0jaG+ZKIIxK/
	9+c08q4AfIMdwTg6tGJlDuFgZsE2ujnVSQUJGJURAAKwTIOOqASq51eN2aAOrK5W
	xfgBrL+JmzhySsPyzFNKvpQJA1xubTL77TKekny0CwPlYJW8Dt09uW5DZGnejmPR
	tpqXB5VnPjZXHqlM8P9tTqe05TtSaAJpy4adj1ytUGjQc3knloZChTxwhnAlzjzk
	Iko0kEPxEW5NH52gSgbOM54c22sg5czZtO2l/t8aF4oAz1M76ML9dtenRsZhaBR5
	qUpqOA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky3e1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:20:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8893be16bf2so16757446d6.0
        for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 04:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767183644; x=1767788444; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zllIvUd7nwiRGgPkDw+woicrVI32te+1le0taRMAsb8=;
        b=aDWGXUWmLFEm9mt+F9woFM1aXhKkkeHOWh4rdmwkutQrkunYNqg3YQPG8CyvxOd0OI
         mwSpdFDE/OeFMXaIg+3dKs7QD5gOZnT4mrLGl/jXjoLSGP1a13p0RDyzs28TetYgWxfU
         +wpqoHSsLYE8gJET8jBWZd4NXT0xcmJx9P1hX0pDMq6aR7NMfQgX6r5uCU/py0bTbcCn
         2A2WLoStoUjQSJcpJWTuWMmsgXGZtDsiQJZa6apzJXKiOW9W4qdrW7kC+uC5Kn44gTOc
         C8/EdEt+F83zBIXCtX1v+JzwPm9aO6vdF5nCRvLR88YFVW9KPL45+TJXnyQCbhVYlxB7
         qUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183644; x=1767788444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zllIvUd7nwiRGgPkDw+woicrVI32te+1le0taRMAsb8=;
        b=S4UCvudpzQ5lVzThONzVppmrABNhtNZ7WeRwgRCMRm4AIEwV8Gz0zeKd3n6fIWGQOD
         wmGRMClrdm5+IbZ+lWnuM/r/KTN2kaOjyJm1fhkCv7rvuJ3ThEzasb/LfO8TD8paLGEx
         Amh6lnM4b2IveuLK8kSVIgaEwJ89YB7N4mLeAFy8qtfvEToB+fNxMdv7hJxpKnoDokIy
         wynSQ5oFWDtpeuwGqnvHvpIaDwwJTbBj/xHnVRvVlufzaGgj4IigOu4QylI3wjNCgmxt
         dz1+RtjmDSbLb8Fu8fHB7Kx/2oy5vxhhOx6Y3dfv7tCWwL1nQw8yv/quHULga4hrh4I0
         N3PQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9c8ZvIndamwyvkcTR4SAUZabCMwhhgarEaYMNTW3ZuP5/c1XfDgHu2Gy61UE3YEHGHKwHbeA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvsHZzVRswl1CpJRj+d+v8GxAlPiEWJcvzLP15m7zwnV6ma/tV
	af0bEtlHOXopnuZpeGlz8YifgOCOCcFid2xqMKB3+vE0wwfqCKqxSySUD78imvPuxv/n8iUdFQM
	MTuoQNt7FukOZcsKZKrBxaTjJj8uvix7efNq2JaxTzFlkpL8OAvMfa5Yg6Qv52yaF
X-Gm-Gg: AY/fxX501snIBw1qX1SUiRGJLWChEvio76zHPO1dkrBq1d+WXEvfozAIoDyX8EIytDc
	Om6bCuq32MF1FE2kfDb8uyBfj/eoEHnMv4l9nQzmeX4dpkB2i2hdDCDRVxLgJ/ytw7OoaR9ABuJ
	FKYe/50drhjcKAhxBMISs/o7JEqXHrL3c2xkAK1kQ6bNsvrVC1aZ0n8xXyhqsMhppgPoDIkA6cQ
	Mt7zNoW6EIB0t3aBYp1NB4rJhTixlHX7u4TUAyfGI0QeWmyRPfhoxINvGflrneFMPtoq0LzYT8A
	gJqsh00d89uTlkiJJAoMn6PPYLIJQ288sjWHtsXu7JI8rT/V1uamRbWGbc5BKjD+ewto7eevQWK
	EC1U9ApMh4Pq3RFS0yfVED9dC5Gc4fCSiARCCuDykAiJwDmqmJoqnI+cxYbesjjFEBg==
X-Received: by 2002:a05:6214:528b:b0:88a:522e:f1aa with SMTP id 6a1803df08f44-88d876fef2cmr429758636d6.4.1767183643757;
        Wed, 31 Dec 2025 04:20:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNxYZD2jUzi4kfyb+ZH7BBn1xDuW5BG9mO7Ob5u6zKgvjm1mqF447/ECV5NVNX2+vlurqoxg==
X-Received: by 2002:a05:6214:528b:b0:88a:522e:f1aa with SMTP id 6a1803df08f44-88d876fef2cmr429758246d6.4.1767183643248;
        Wed, 31 Dec 2025 04:20:43 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5ea6sm10827713e87.5.2025.12.31.04.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:20:42 -0800 (PST)
Message-ID: <4fa4a6f3-cc38-452a-a724-d2dc19219516@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:20:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] arm64: dts: qcom: sdm845-db845c: describe WiFi/BT
 properly
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-13-1ff4d6028ad5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-13-1ff4d6028ad5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwOCBTYWx0ZWRfX1Eik1dMXYAk/
 Id63xwDogeHNK3tQeA+wauMifuOeEpa/7qINEId4tSTiIB/RQGQf/tr0JsLcVc11jMZzP0GueMM
 0iopy6vfoDjtE7xlTiVPXy6tpEj1ecGzJ2DH5v/RLRHSphrBaDjRS6hxm7qBECcCBOK3Et0wl74
 GimCBlpHgyVk0raDKGQW+juBwOFzjBOZM8ambtfxh1pjwSq5n+lYaiE1mSOzY6AWDRclSFrMNnC
 6PrfGlzPbjCbKdDZdfkKlr0/T27wXRUyDWOM8XGkPCuGr1nL6Rcqzpur//F3eNxtdbYVxd+UBBT
 k1aY4Rkvl4ljrwuzqBxwdkW5wfDkqpkkSjn39Du8JJlLRUejJbjNXJB56t8QJ7glSdK6/rOFfn3
 G3DXbBsu5mBF/BTtJ2vJ2EVakxLBWgY3clcfqAJwbOCUYCGl0Qvwt9318RXd2l0qahuOSsAc9kK
 9K+s2YvDWJ2peGHu8xA==
X-Proofpoint-ORIG-GUID: f5Ucv_230n5NZj0QkB4rLvMzN9bJvjgm
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=6955151c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YN4nVyxdPvXl5XCbABQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: f5Ucv_230n5NZj0QkB4rLvMzN9bJvjgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_042045_288349_D1C58156 
X-CRM114-Status: GOOD (  11.42  )
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

On 12/31/25 12:36 AM, Dmitry Baryshkov wrote:
> The onboard WiFi / BT device, WCN3990, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +	sw_ctrl_default: sw-ctrl-default-state {
> +		pins = "gpio3";
> +		function = "normal";
> +
> +		input-enable;
> +		bias-pull-down;
> +	};

likewike to the previous patch

+ please confirm ch1 supply

Konrad



