Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4559EE642E
	for <ath10k@archiver.kernel.org>; Wed, 31 Dec 2025 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ew+Mk6K5YGioVRYwAsfxjNNsouazMty9EXE0iT6bafo=; b=5GQ+4XYFK7Bq+ZgeVBov3OdDoK
	zWQcT79/5XYMEES2PQ/MJ8n6iypR2pVezAIrA02iYI/Ih2hLFc0C3U8JuIZJFinUArlZ7rwqv90oN
	8LEE6l9t937xC5d3FI0ha5UxSjVwk45zLXaXDoSSPA8T3/qKa5l7QYTbYHr/7qQixjlH9s/4yzt+B
	pGxbzshqkGYf0Fq3/gfAatkbP0p5WVWYx8/fS2GDDSGbnglmMdgBPNrN1g9AT1omnAEC0XqbCc20r
	DNY54UAh0C0HeuuQJFt3zvoqvC0C8Ld37h9/Ki8J+hsNWTWYr7INr9FQ/zvNKfjeG0vLW2R75PlFe
	wnVlqTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vav9H-00000005xOX-3SEr;
	Wed, 31 Dec 2025 12:17:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vav9F-00000005xOD-3W6X
	for ath10k@lists.infradead.org;
	Wed, 31 Dec 2025 12:17:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUNE4jj1604863
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ew+Mk6K5YGioVRYwAsfxjNNsouazMty9EXE0iT6bafo=; b=YStJLcQ/1gj1QPk6
	WGuc2zuuj9YusxG62FdQwA7h0YomzJC5GzziFKj+hKRHqULsP+Cw5zcTarpWCnFz
	uRnUn/5lykugUEgRu5XmtjAksJR3U2c+z53bM5DR7d1zWAjx2PLSJp+ERoSKFk9C
	mNFvcxyXdmKNaKuxlpl0ui4VrF8IxGvRGxIu01R1Y4/UXmnL2UTGncDDRAkcNpQU
	cRqjlMk9n/qmplXKUrRptyC9CM80vtB92iB7N/CVmey1F1Lg3nhvr9bsdeOaRgQI
	2PY+g1zVKxP2t/2nVpb05a5Wa0Z3x7VWztkqmz4ZCaAKgcV0FHdSiyFGL/pH3lAy
	mZVfSQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0skm9mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:17:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee07f794fcso42586321cf.2
        for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 04:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767183472; x=1767788272; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ew+Mk6K5YGioVRYwAsfxjNNsouazMty9EXE0iT6bafo=;
        b=gZkoTOGHeqEYpyHGflQwtlLyYG4H5Ba6jaZ9WUHUkyygpuxheTSRqI8Qf1aAKaJomM
         TWnOZEPq11vWo6MjQJfpMfvdkmL/m6Nn0y1wUbLqMr8vlKLa6PJAUeq7mtbx4aMG5mPn
         q6bsXfrzrc3fztdzc+TIXT7UkwlM/BQ7OmTtkSQ6zGVsEFjRKFkp385oLR7O3HASr2kj
         ua8v1Z0LB+j1dYsiD4LUOqq9Di5FEudkHRuSomTfo38QTwHCNJAqwniSKPqzXhJmEWTr
         hHQaPYbmebmloK4rNVvx4k6SosrFqjDGh/zNr0VxvLPcYwg2vWwk4gF+5uUp6oh8bWdu
         2BGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183472; x=1767788272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ew+Mk6K5YGioVRYwAsfxjNNsouazMty9EXE0iT6bafo=;
        b=qVrG8pbmoIIoTlBSnwIbxCjh+u3qeqAmQCdzFCW6OrqndVUh/mQsUWMi967df8/7vT
         Or57PmpLzsbHzZ257zKjNoRfdYBoPZ8xYU8uwGMRc1dlgB2mtOLOiWiBU47sQCVyko6N
         AKxnRnSpI8+F4Cp3JhLDP1dyHNVhC8fQfObnSaH8zyxEmc1fW5LaQOJdSwGUaydfXSB3
         ljqRrOkpAE7VS9pRCD7gSJ/Sj+5y1LmNcOGJfUtd9pZRmG1EfzjX0SMfHo2fEDxiwioq
         8xtL3HdYESP/Nnp43b+5+t4mlVKTO5xzUWoBMIGEF7TX4JjOgZts/Dt6Cwn8Hfvsd+07
         9ALg==
X-Forwarded-Encrypted: i=1; AJvYcCWU3XXeYYF1TwLqVGb82Ishb1IRvFjyLXGr2FrjTbh/Dv7YkYH3DjYtq+URKP9JvMlDRNajXU8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwgsMrlNfgl/2v+9PwhvEDk3o98gnve1iXTP2HkjmXjzLj7ijMQ
	E3oWjnVRVsXG+nC1W1AVnOBvd8ERoZuVdvjfRoQWQDgCgHNqwoYMsmorqvxceouHxpLaZRgHaMN
	hwDaVbHMcwCDbLG3IApa0SwZW7tIoNOnZcEH+GEoxcUYWBCkcCeyq8gHW5MgSexcl
X-Gm-Gg: AY/fxX6NaYav1qgbe4BrTRm7Ymjm9lWV3lPewx+p3hL5sxkZgv2h10olQ5MW8y0IUOL
	c4yDzyKndq4wzdp5xU0OphFVPnczqbBkFRmP95OcOEmw3bBVbidtdgmSRg72upFwl3rZwU4Yg+I
	KdTHSMK+5YlcGfSMPzJSpJ5EIdNVVtcfiXRtagLqHVx5cFkax3tGCbTS2PjB/6Q66ub5tUZU710
	6dwTrAJ1YdAqoSOXpuTklkEKXj+CQNGoXXnlw2h7AUmh262Ie5lrMVXZiUAGMXoebFiSryGlTQM
	jvKRQAV1PmfTUQS6F8gzP6wJ6PgMpC0+kIBgUGQUqEDojXG7jq77UNl6+Tt2U71sRU3LocDXyH2
	tnIvlKRLl1/EHRyayunPLWnPIlrkYicbJXtpRCr50PjbY0RLln9+3aP3AYUXv3ZHmlw==
X-Received: by 2002:ac8:5fcf:0:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4f4abde8fb1mr390251341cf.9.1767183472197;
        Wed, 31 Dec 2025 04:17:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH957KOviLl3ff9m92xdS8YGRjjD8sUTjMZEhIjpCXfBub9SZDcdgZ+jloiUSvjwXkZhRj+kA==
X-Received: by 2002:ac8:5fcf:0:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4f4abde8fb1mr390251091cf.9.1767183471721;
        Wed, 31 Dec 2025 04:17:51 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f4ef1fsm4017817466b.64.2025.12.31.04.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:17:51 -0800 (PST)
Message-ID: <604f92a7-580c-4bef-9d13-707f6b1c7105@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:17:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] arm64: dts: qcom: qrb2210-rb1: describe WiFi/BT
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
 <20251231-wcn3990-pwrctl-v1-10-1ff4d6028ad5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-10-1ff4d6028ad5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwOCBTYWx0ZWRfX+9IhykSyYdQK
 JTKlH05VzUC9NfKLR3Qd10u4BNrZWGfQ8a+/Jwk1IeBo3bY/qg51Nq68J6pTevXeMShv6bYxMCl
 rIA4RSlf8dLdRe7AYj0GMvB2YYx9yU3Cs6pSHeh46WAIzvQs9p9KgIfMXW0fLbBk08IKLMYf4ov
 NHHqWJ6e7QPND5n8XA2zFxSNJE5nXABvRLgNW5Ylg62aeALVQKwUM6zvZPy7lVeRcBSCsa3yHv/
 imk8E9uE3NvBMAN8QYqPUmC6dMDxhVcZup6Q8m5biJhmVIbGy849FwWOIuQGp1tQ/onNhrX2pD8
 bUh2gWTh1bmn/Fdr2Jggu8l3/uPGZCdkX61T4GYukDKgy9TqJlRiyMVT+DxBt0lyOWMUqxh1e2m
 a7/75aPMswf0OyBaYbwCbPfBTK09m6BluXzw4ocqxqypcSXO7F5edWhv+8pwtRiWK1GTbI3OHGB
 /V3I92j1h9Hqs/d3rzA==
X-Proofpoint-ORIG-GUID: MsTE3KujysFZflYl5fJ69T31Ir47faao
X-Proofpoint-GUID: MsTE3KujysFZflYl5fJ69T31Ir47faao
X-Authority-Analysis: v=2.4 cv=FJ0WBuos c=1 sm=1 tr=0 ts=69551470 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YN4nVyxdPvXl5XCbABQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_041754_000012_84A00369 
X-CRM114-Status: UNSURE (   9.13  )
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
> The onboard WiFi / BT device, WCN3950, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

