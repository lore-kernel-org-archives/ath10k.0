Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479E7EE642F
	for <ath10k@archiver.kernel.org>; Wed, 31 Dec 2025 12:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xwd9J0/7DDL1t+C6kRTwUe2pr4UfwNnjK2TEMmjygUs=; b=Vqosp+tahVFbgytPk8q1A98f6D
	/UlnOxSC5HPmEJYmuvmYve5VQceDMbJEeq5OiNmjJ/UCPvQFmD9HyqHODlRGG4ifqfGzGXChL0WgL
	gP3O8jP9XQO9VtxGfmsGZZGBi6RTN7jGv9WDHsRHmZthsqbig6MBiJ/URBJSpzG88k6zztfxyPIKy
	pxR/riLwcs4Qm14E0spu6rhAGT6CJawPJ3tMhG7hdbLNktcyhuuvj82Ime89lCDlPhUh+OYEUdo8v
	bz16QN1FaL2c5aoB07JqFRmThbXkucdUg/AHEw/UOrCqVj7m/ER4I0NXTYsxkwsbkSOLtQYQ4eA+y
	eGmDhZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vauzG-00000005wTN-1c6h;
	Wed, 31 Dec 2025 12:07:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vauzE-00000005wSD-1WkP
	for ath10k@lists.infradead.org;
	Wed, 31 Dec 2025 12:07:33 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV5wAYS901151
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xwd9J0/7DDL1t+C6kRTwUe2pr4UfwNnjK2TEMmjygUs=; b=dETWGwMe+maDJg6A
	KDCiCIlf8zfgCwNkm9P7ZPfLfB8pjwsjQZCu5L8egpOH9A7Ibj4MC6n+AlTz8coH
	NmxWKy8OCzm0S255KkAUgQVB4BYolcMKmPzDKCZf1qXyU3V6izUp8N4R1BEgnJp1
	5rlyyVJJBycsVzhiae1bMuDl70A4bcQP7/2F/vwTnHfB7cI6Dy7Pixv8mHXOJNrW
	nlfCfcIRMoDSrYYrpEWWvKEXRLFrK660ApFarqXIXIDbzTpfatbXur/sheoWT+jf
	wr+n/9uaKBVHUSsfLiS9OxHHZbwKYjeqkTYiBoYeVMtNY0/7Zzho8vZAQesQsD9U
	1Dq69g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky3d7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:07:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1e17aa706so62127891cf.2
        for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 04:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767182851; x=1767787651; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xwd9J0/7DDL1t+C6kRTwUe2pr4UfwNnjK2TEMmjygUs=;
        b=RSL4z1RobpVkzL2tBHfXGFtb+CaCgqb+RHFYZpfKdQ7pZCIZ1MZyOhCvpalY0YkzYA
         l9Ip9PghRT3EvI6ur1rkbFQp6JGM7PU9kdfHK4vemuq8KMI82bWiM1F/H+fBSFgDpNLe
         fCUpMpjDJaacZZdxtpuHd9/b8bMWkB5Da91ir/bXF5NF+AjNjoTAA0A8Eemq/GtLXF06
         NOoaI7rqO/7PtmArhzMZ41REUfBfyeMtJ1sUaE8tpFM++SsnmmwYnyE1znujxVJT7cD3
         E6Xwhs+fjxYy6BUdFmL0b/HDDrv65BHowJ0MEle94c4pk3gTxV47s+EYkhjiHM5MjVRu
         UfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767182851; x=1767787651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xwd9J0/7DDL1t+C6kRTwUe2pr4UfwNnjK2TEMmjygUs=;
        b=aJbsnjBvI7RUl0SIyUABxVFQceGx49n1kiCJ5RE3+vzwVgcQIaby3r3npT7T9akafu
         HUHDvPrBfTumCDA5xouqkNJX7Ebe/wd2CelsR1OImb462EcCHfdcrWzVJob7HC5kX9Ae
         uUuSQTmjTEEH0rRKifWOReIVgBY2rDwK6WywJlxrzTHKf5IGyBLfYO3lnKInPdr/We7Q
         JIb6nh/69OdAUCsR+0goEp6zaREFacScWV+K++1AA/ufJmHyoDf2NBkWhZslGrMWGmNq
         YgZCk8F+KNpVLtP944AJPdoXjb1M3LvEq67SFgP7LkU4q4Eks5dW6kLNHXpSQIEh8JQu
         50vw==
X-Forwarded-Encrypted: i=1; AJvYcCUomUMyR5Mkpn9X0fO8eDCdQBma03FA28Mj4R60rEQS4k3M7i+Tne9mo95xaLHXSMTg48/GP6A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXCX/BkpNExuZdonjpML+TE59bWCTi6bZ9Od+iSYuKTeGMdciF
	MLRUwb6udETJ8qiJIyzKazm/Wd9T9S+y06tbj2pyAfsg50BaX8fedSIJ9L4vHHCrdNfTVLjqVMc
	5Sl2jwD18McZ/ZawWg2Biq2Bb/fPpc18fABprqRCga2A8OQEsiFSWEEmzLTrOu6Pn
X-Gm-Gg: AY/fxX4i8rWggWOTQ4BxBxZpBX6+0q+fQp/HVmY6AqkHDUGcJ34aPg44uIuJOa57fyk
	IWH1fHLHVXk4zd8Jz6M2AyusF8XWhMdRFPMTGG/nOxw6ffmt8LwBhObg6MGYrWGhhIZuPM0HXZ5
	snPyK5gQLQ2CBjav8g2qBhatM4WyAxA/f/uAD+DkizkhmfLsnOKQqD5CRVGz31I+eqnF01K6GWJ
	f/WINw7d4mHGxtEJ+9qsw6WtWYK4Gl2AcPvT0QELLbyreHND8ngFnFkAVSQ9NWxPBVKqimdy0Ze
	rME01HsiJKLg24ADfE5oQPmuRYrA+gTDyZxNur/DOthBJjWA/odGzBv66K2q1OwMfRiCaHHMO3s
	/oImT9eaCQev3hxcrZii1tvPx5E56AWGMRQYll7UyklSC6R6VB5nyPY2XHhPt7QC/0A==
X-Received: by 2002:a05:622a:189c:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4f4abccb8aamr395358731cf.1.1767182850789;
        Wed, 31 Dec 2025 04:07:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEECDEGzAJoOCl0rfUP6GBsO3KwpS8blNulJ+u+SXkREin+4W+m764nMSG1CDEYpWIXFGzjzQ==
X-Received: by 2002:a05:622a:189c:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4f4abccb8aamr395358211cf.1.1767182850209;
        Wed, 31 Dec 2025 04:07:30 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f51a74sm4055637366b.63.2025.12.31.04.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:07:29 -0800 (PST)
Message-ID: <17211f57-0c25-4108-bdc9-50d0f96d3185@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] arm64: dts: qcom: qrb4210-rb2: Fix UART3 wakeup IRQ
 storm
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
 <20251231-wcn3990-pwrctl-v1-6-1ff4d6028ad5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-6-1ff4d6028ad5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwNiBTYWx0ZWRfX/9MTJi1OCdl0
 QJywAM5tWtGmP9UiGTI378dr5sPcqnaxEfImRtfY3WAVmbB5KmovmJF44QjnhgzGIt5TsompcUG
 VM9W4+YkrG9fbix3ARfci2sYzo4RtQvtLwzqzCTXWiacYTIAHgX0cNuBICZU1NBoiPKsV3ux7P+
 XydwzeCU6++xwh0fJ2nCOEsizxgu5jJ0uufWDzOrcZBw5jvQMNCvt3PmCQQqQQVKzDBTyLzvvhd
 /TNquFrWEVtvGdjNuykHM5udepFllK2kUA28GEPm0qGXb2PC5h5VY0vNy110YVAFacox0H50yiZ
 mA4aVvhqWYROrP8bgGj6AnKbz22JMdNjeTPhxmU+X7R7i+lvI1XI+/fb7pXOLvvR9f2Z9//VVG5
 wL1LqfXJe9ggsbB9xIxS5VH+mozVBTaYLn9SSlfOmxikJ2TuYLYmFSlVfrcwFXSVbLokFuMmFPb
 1kcJ8EV25cpah1X6kYA==
X-Proofpoint-ORIG-GUID: 6DVAJ9cafvrJjOZbX-KYF5-vKOg0WiE9
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=69551203 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_BXXzmC4fWfZa3wPJs8A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 6DVAJ9cafvrJjOZbX-KYF5-vKOg0WiE9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_040732_414743_03746E98 
X-CRM114-Status: GOOD (  10.19  )
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

On 12/31/25 12:35 AM, Dmitry Baryshkov wrote:
> Follow commit 9c92d36b0b1e ("arm64: dts: qcom: qrb2210-rb1: Fix UART3
> wakeup IRQ storm") and apply the similar fix to the RB2 platform.
> 
> Having RX / TX pins as pull up and wakup interrupt as high-level
> triggered generates an interrupt storm when trying to suspend the
> device. Avoid the storm by using the falling edge trigger (as all other
> platforms do).
> 
> Fixes: cab60b166575 ("arm64: dts: qcom: qrb4210-rb2: Enable bluetooth")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

