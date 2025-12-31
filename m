Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DC1EE642F
	for <ath10k@archiver.kernel.org>; Wed, 31 Dec 2025 12:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmHPQhUPWUftI1dUKYWlCg7G20zAEVRZRn28G5U5nz4=; b=vZNEOVps0J4xRlmUN+sMoxTbNR
	v6d6qQOQRO97+h2SKeC9CIuWxVAdJgPZxop9S794eRYendXEYF+17bSed6Q6AK/dj1eN3F35OtSlq
	4qiXj/blHNc8Li/2ja4vH9x7b+0yS1iAfDtfWDt6+vMgx4Q5b3NzsX2ebcPxDtcnsOq38ksA308h0
	VFFU9xh6t+vBzOTlIByk9jJhkXcd3DiNvTXqqz3Ug4WBke1U+jTBUqlun3TrTbFSh7rdVri5Yp9jT
	JWD1avE6cXODZ15kEqaLLb19Cpaxz/wgDYejnX+Hgf4gLzKYPozbFS0uWIQlGHZDoFLlPEtkMeYWB
	WOM5FcMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vav83-00000005xFd-0h9O;
	Wed, 31 Dec 2025 12:16:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vav81-00000005xFI-00yn
	for ath10k@lists.infradead.org;
	Wed, 31 Dec 2025 12:16:38 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVAOBGE2284829
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmHPQhUPWUftI1dUKYWlCg7G20zAEVRZRn28G5U5nz4=; b=RMabYfAVrgVgQTB5
	9jkiNcMhmfzvt1CSh7z1Axyb6mW+0bqqcmtggZmOWYa/utb+nWBPPsiZ7xcHC327
	XbHmlAJ/MnA2N+K2RSc1OLJbAcdzUnqnNtlhsKJmRdQZohVdBVlQLeYG7JsOQetd
	gFmqFGsn0Haa09YG2izW2il4W5EWV16fZ0OQVE05W2INkTTk8zhl5nKDVWEn2TCv
	pDOdCFr9gHNXeoY7OiC0kN/qXK4n99UXuQed2k/0MHBkag76J9zPouNUtPpjgMnH
	N/ckmQpVkhrT+Ny1VlqviW1zz93M7GiMRg9ZadfFmFxABY+Ylh1G5fuETJJg4LlX
	SvZk/w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gvcxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:16:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed83a05863so35873631cf.2
        for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 04:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767183395; x=1767788195; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FmHPQhUPWUftI1dUKYWlCg7G20zAEVRZRn28G5U5nz4=;
        b=XoYex3xXV3XQQXCxnEDY+xd7fQL+r+BaLI2MrVONYr57fpF7UN38hix0xLQW/59RUU
         W+8KOLSwBfvbL86TeAZ9gVh5/7BhIWUc7pEdhuYy+2Giqw4fTFHUxYJp+9vtL9N9qF7g
         iCF18mLqsBbyQ+GMDmUhGAmLYgV9V7W4BFVWBh6hRtqsQHlMN/9dEbLTw4+rKodsawyH
         8CpZ9I7HDmLIKAufGFRg4nz/ookZBsc5Pp7TS1rWcy4sall4CiEh0EBzRm6EH5vmzx0V
         kSZqM6OFiIM68orCjyw/8cHfa46xvsXpC3680a1JNnMlRinpYISv786zyO/SKmeydg1k
         USBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183395; x=1767788195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmHPQhUPWUftI1dUKYWlCg7G20zAEVRZRn28G5U5nz4=;
        b=mXxA4KlmwhesERlQvZ8xkFEMXctx8rg5sT5/YQ0fUBl94/DQMD7pBG1qoo/lywygJ3
         JgnGCbE8yew8nMA4Sfhw00QFobbmYeeiJNw/i+4rNF84pYaxAyk51NzG5muZCCpfzrwQ
         BlyD2G7L3or3rkx/z2iYtkdjmjlIQx2DEfZHdYmQw63GBqGWQBmRiftlN3fadVxwc/bo
         MJEEp/SOyG96LHuR/4B1nW3o0wmbNmhfqCe/WezI7af1IfafLXosaLPYORTIQwfhG/Fs
         W2qELgkyGeCzebDRTBO6EhrbrfHxCRSnVjOFxhMfoYc4R/8SpzwgKXTWLsm687PqngH1
         g4PA==
X-Forwarded-Encrypted: i=1; AJvYcCVAsnIXUun7qSTrlLHwjdAsBQTmDD9TJiAgwLRndaQNf+3zg4QI5jZOjKv9tZzqYtmj/RWluMs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzB20FDTYj6THF4uFTU7O0dtAyAQVg9lJEER1Qj75P3ulqYXbnR
	NBvn6zrADFwel3s+KbSNvRiXYjtGbuIiR/1uvVRHwWSdKHybSFUfCiDb+bA+lNz7vVG9aUqRmRC
	eg9FWfAFb6Vk0uXO5pO/Lwv6DpQzg0x1uR+eCyMXbwkKD2xY211k5C5BGVzKbTosb
X-Gm-Gg: AY/fxX4NJjm3yOPV4dXF4dM8nF27EVLqgVtKN81r1YDmnXyUhPRgWLhkRKIl2hBFNhe
	ncKk6VCJYvMEpeg9W5a1lsFu3Fevts1oUq3lcpjl+Iy72EhrGM5smvnIKRm3gWxRvxd+kVzm+D/
	+HB37umOAxrR9V4g6ChwwwWRLDYq0O2DNORg7zxorHozwtHaye9uyVEVPk39ZMJ1jQwVULxqGfB
	KJDu2tJro2dPPDtA+17PEjayuuyrz721jFgU2SifMcxeGoEKtv38xfoK/iLhdFKcCbVPIIsB3wU
	Pp+jMU4NXyIPgjG1ssV4gjjrXziejlxkif3w89k6nlPsyzzJ8cK86YV71wHWiZHT2m+vtte2nbP
	Eed8brX41Sg2w5d7d1Rbn//w28Ib3YaNCzp1JeJeTezIPn7mJrXBqKiOj5kbrL7UdoA==
X-Received: by 2002:ac8:5a46:0:b0:4f1:d267:dd2b with SMTP id d75a77b69052e-4f4abce1a3cmr428476561cf.1.1767183395133;
        Wed, 31 Dec 2025 04:16:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4Pfwh+egtxUj/QdUbBygykdOyCe3AD9kpBY9v2ldni3kiCg/sIQlD059WEMSwkll6E6T/RQ==
X-Received: by 2002:ac8:5a46:0:b0:4f1:d267:dd2b with SMTP id d75a77b69052e-4f4abce1a3cmr428476301cf.1.1767183394596;
        Wed, 31 Dec 2025 04:16:34 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdf3sm3954791866b.12.2025.12.31.04.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:16:34 -0800 (PST)
Message-ID: <59f3db15-77f1-42eb-97e1-31129fdf363d@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:16:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] arm64: dts: qcom: sm8150-hdk: describe WiFi/BT
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
 <20251231-wcn3990-pwrctl-v1-14-1ff4d6028ad5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-14-1ff4d6028ad5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rpDDJFaza3icdCdMH25MWooQDi31DHN2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwOCBTYWx0ZWRfXz4GU9HI9TKFJ
 afQCopXNstzCgegKL+yrkMZxUxPX1hQdGm7idp0J08MK8KciLnd9qAjHD+cCCTgh4Q1bJara7cv
 TKUR9vOmM3rEUbEuwRaePZt8wSGNcbzo5MWybqjNRgyJCw0qTJNMF5R5mRv/SvscIEgoGW2pya9
 2nMiy5nFiZAVz0kArQfEPXH3ksBS/9q6fsQ14u0wADwf5mS2c2j0T1NzCAYtga+2spOGfJp0HhU
 2PGjmab9ZZLVpW98P8YutOGLN7M6yQhuALPVVVDZ3ExFPBDr+7b0HOD6zYLE80+72tQqCn3UJnK
 i0UPicR3km4XgteWU8/0lNrmqzSek58ovWjbCqM8FjdIvV1wGmtikMegzoWRcYykjUskM9xOMz2
 AqRQAo7A20NMDX+FxpnNynS2iswCAU2sfTkx/pjeRB4fK8D076nL9AvrnTwadgtbAOjuoRZGU97
 1zoGP/gGqV+mlq9G/ug==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=69551424 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=83yv27ILqWWRH8MFNrwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: rpDDJFaza3icdCdMH25MWooQDi31DHN2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_041637_055610_20918A32 
X-CRM114-Status: UNSURE (   9.59  )
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

On 12/31/25 12:36 AM, Dmitry Baryshkov wrote:
> Properly describe the PMU present as a part of the onboard WCN3998
> WiFi/BT chip. Enable Bluetooth part of the chip too.

[...]

> +	wcn3998-pmu {
> +		compatible = "qcom,wcn3998-pmu";
> +
> +		pinctrl-0 = <&sw_ctrl_default>;
> +		pinctrl-names = "default";
> +
> +		vddio-supply = <&vreg_s4a_1p8>;
> +		vddxo-supply = <&vreg_l7a_1p8>;
> +		vddrfa1p3-supply = <&vreg_l2c_1p3>;
> +		vddch0-supply = <&vreg_l11c_3p3>;
> +		vddch1-supply = <&vreg_l10c_3p3>;

Again, please double-check - I see UFS VCC is on this line too and I
would guesstimate that antenna supplies may be separate

Konrad

