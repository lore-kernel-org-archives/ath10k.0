Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDD1CD8C9F
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 11:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfS3gOfl7UBIyYndiCaeSVmlIF6ZDOAgaactyCrKDOw=; b=nZu41kGLYBsoWKS9wWw9rEWvqV
	LAgb707ubwZiMfJf6o6aLPaB2CjCo7Hpv6weGXH1N0t/HeF7nVzxAm4KD6KPF498ONAFnBMgt+0GT
	TD7Xi7BGS8Y6bh/7ZjKTTijfY5VJVS32M85kzuRHm56PT4YVnuuWkEv1Q1FS48dOZaPswGqTBFd27
	kC08+hELQDhAYt5RVgvO2RZQOOGJlvjr1bcZ6Vf5DHcVKU/yP7FYmm0SQEAv9B3h6ovRg3VabJunn
	1Bq4h3hIm5gM8PSXSFlmdfrdg3o/t/3Fgl/vNxPAa3uRfTy+o5ha/HkuFm757pw2tq1qzuO/z1ahE
	jplhSb1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYAi-00000003Qp0-3eNN;
	Mon, 08 Jun 2026 11:29:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYAf-00000003Qoa-2W8a
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 11:29:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BClfU3381773
	for <ath10k@lists.infradead.org>; Mon, 8 Jun 2026 11:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kfS3gOfl7UBIyYndiCaeSVmlIF6ZDOAgaactyCrKDOw=; b=iRwVfBpmn9UWi8Gn
	iMoh/T8wBP2us0Rs8mluNRVdeQKRZ11cqeP0rF/hm+cyM1jtljsbqKKzUEc0vM9H
	ijnpWH2vG/fVsIJM+U4Guz2meoXIsgmh2HT+U+EOdEqfrRvyl4Pnr8fW7IVl22vD
	NVGlqnfuFuNgPEQH2vpmczSCZmylyZJ2/mdlHDEXZtbIDSZKhxNn76PWWG4IvR21
	uEynevaOERdAM7stoKdbQdKNJdclTBHnbN9axSkfvr2YxBCP7VtM7VvxLtGAVOra
	GAi49/J5mJBvzrlsK1fkd7fvYzuFIXKi9uU/p32AeC+OP+ZyszftvVV2ybJ+Hvug
	TyO2Cw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf7q5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 11:29:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157263095fso106642685a.0
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 04:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780918172; x=1781522972; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kfS3gOfl7UBIyYndiCaeSVmlIF6ZDOAgaactyCrKDOw=;
        b=gMWMEkWwZ5rculvGr2FTO68IpSCNTXdFODIX4Q7BHdBlTS3iVgcv/WoWlKRWPrjC24
         wH83AsNJM+FuayQ4s1Nob1uSgbaGucK68APH9Mp9ZzZNR6YPm4Ir8e/UQ8lyOity0LiQ
         kJ35eRpnvWzt2+NvQKwUPuI+xQxevy8m20k6xoJjbZHhZizkvhK4NPrRw4g2Q7pAiT7x
         HF+sizVrh+uhrBSkf453y7MLsGpUVymg9nNv5U3e2oPdYoxjSZIS59vt8GYKje3i7GEI
         C0YKmUuwQE8NdMnlLRwA3WOGYZZyffR11pJCE8+KsuLzyUcXxSghTo5Evr2as2tBAXYF
         vbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780918172; x=1781522972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfS3gOfl7UBIyYndiCaeSVmlIF6ZDOAgaactyCrKDOw=;
        b=WvdJL8DqF/EPzwpO4tSGG1I8ik6M4CxtpHE6TsDhdnvCHo6KW3Ix+NsuQdNvOJwGN0
         4+ifgj91BWhlbL8yp5map4T0VlJYs8kjwNZiAP3OMHPsiKu670PON/c5qjcoeSmG/9kp
         /3xYRbXn71y7iJlvYTIFqMeCL+oFXEa35Enyg9K4inSogCMFDuhIornk0fc/YgZPT+BV
         US1jNITm8WxtyBNTpfMIUfa4hffGJK25i6/2fWezqbz5d/TvxGOJgtGK7lzQMg6wpV5I
         5vAnb73yImaTWDleKhbu9PdjvaTF9VoXFtbHua16779Tb+G4vw5yMYW3LEViZTk+ufer
         Fchw==
X-Forwarded-Encrypted: i=1; AFNElJ+WMMtDjTsJ85zvv2nX969w/rcrHof/cSaA+skNHcmKW8jL6S0Swc8j3dGPtCX9utO656K/Ebs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyY38abHg78vHftJVMBHqfR+Sgo6nh8ttFsP8rOW9DttlXCa6Vj
	vNR8Dq4/S7b9F8HwavQFzE4VSIvNkDYqXNWKhdX8y0YRB3JSsi377IAuXwl6sSQiZekdbxCUyzD
	2ZhoBDBG1tro3phlY/XtaQI6u5iQixnzBS/ke4gxK6T2GQyfhjGPlqNiq1IZMUmF1yZxYZnRE
X-Gm-Gg: Acq92OHxFRGNWxeRiYpY4xtq+35br6iqP7UAZdpE/43VK9BQ27z+HqA59hVTo1flp3K
	OxX+GTxVxopFRJFzR4LEBpZdKL5up01vt+/5AYSZLPI9EaqGTZP6SHKNCxUhJq+LtLiAtAF72Vf
	spe3HmkX/g65o1172LPH5QbtU8wPAXKOuHR+RO7SmV06VrOLx+4liUYvNjBsaBs7sjxjc7Oq9v4
	Bq2To8cNrO/seTpuGnC7+q6aajJZPTmvvfULP4Ssk6wls7/cMktiVXkh1hsmNJbe0lzHWvf/UtP
	RXuZ7lYajWqQRVcLMLdDGLz/JBr0eDJhnWaizkA0g/0t4VZN+y5waUPZRySlHsxLcLBGlMQ50CH
	zVlwE0QHKChtPFFYVUnNvn9vSp2iOoZQpJxNsG//7OdhDm5QSTQ+MMVG5
X-Received: by 2002:a05:620a:2692:b0:914:c589:7945 with SMTP id af79cd13be357-915a9c76410mr1405355385a.2.1780918171968;
        Mon, 08 Jun 2026 04:29:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2692:b0:914:c589:7945 with SMTP id af79cd13be357-915a9c76410mr1405352585a.2.1780918171578;
        Mon, 08 Jun 2026 04:29:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055309368sm844667266b.49.2026.06.08.04.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 04:29:29 -0700 (PDT)
Message-ID: <f528672e-ab4f-4844-bc7c-1f8f1c4dbd3d@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 13:29:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
 <20260608-block-as-nvmem-v3-7-82681f50aa35@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608-block-as-nvmem-v3-7-82681f50aa35@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a26a79c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=m9cM9ScjmTDVYK95jDAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 7JT5GM8it7bgFHfJiERMPFO1LBpGF806
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwOCBTYWx0ZWRfXzOV3/FX601R2
 6/N83fm4gg6znEQJqpAELLPOEx+kMfSlzbR3/D3OLMb/YoyGUgRdUe9plLKLtyFfoqRe1M/CiLW
 9HkSYZsFvhZa6axA4k+KTwYCDRxivNQZ2C1oLbXnW/S0V73AsWMxed7CtUOAgD8lKPcCz1r3rHJ
 gZeysXHOcSPG7vwUgTImlbFaHIBvmS9IdwOAF9XHmbQSIky50hVht8cIDUGBEYlOBDzc4+pmjN9
 VnP19ejHTDdWmeYXHwRdPcclRIB1uUg2Eh6FUST9EUdMhElBWWGWvYIVVn6liCb5Tz2E5i/Pn99
 W8aXBvbt+oZuKAvmX6ppt2PWrlWpd7bt2ywjVHz4zEBFuzP+a70+fPxgahYiRSJ83wRUT2z4ly5
 QlU1uqEMci9G5r8U+33iE1iLoVCVLIpXuDsLwT1e0Z3rND6mFJKfmkqzg6IjU2I1lNEa2mPReOZ
 rWScKt3XUdBF/SrVH+g==
X-Proofpoint-GUID: 7JT5GM8it7bgFHfJiERMPFO1LBpGF806
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_042935_077723_76797B3D 
X-CRM114-Status: GOOD (  10.32  )
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

On 6/8/26 12:50 PM, Loic Poulain wrote:
> When the controller BD address is invalid (zero or default),
> set the NVMEM quirks to allow retrieving the address from a
> 'local-bd-address' NVMEM cell. The BD address is often stored
> alongside the WiFi MAC address in big-endian format, so also
> set the big-endian quirk.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 39 ++++++++++++++++++++++
>  drivers/bluetooth/btqca.c                          |  5 ++-

Squash mistake?

Konrad

