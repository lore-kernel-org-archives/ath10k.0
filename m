Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93253D46634
	for <ath10k@archiver.kernel.org>; Thu, 15 Jan 2026 23:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvaa1/tuwQc8fuxNHVmVUCj7wH35/l4L0WpGJwMFaIs=; b=1IYfGsJw2K3QIwkAbqjFCq9Oi3
	MlJbKDTMT3n2Dzpkxah4h8dHSVWWinSM8L/OZSuETlI0S3ezzlL9jMcofJtUaCk1bkSfTS0ZKwQDZ
	AZr8ds2Dc0E8WOgvSCozGA8SwncYds1FZAT+JHPkzDwiuVr2oWUCGgr+Fb9epWNnng/ZGjFN91u8L
	Idv6JxPuBepXAsAtdvyjlX8zDPZ1+1SWF38wP10FygHhnOhbNZABypTsuibZvCtuOkaM5L4yUJL2I
	wB7Prajq49prKiJsEi25vizKUtRjIwsr1sszPbgOTSz5SIsef30akl/mhK4N0tBuSFDzxG5WALpKi
	n53Hz38g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWVv-0000000DJ0z-0xMk;
	Thu, 15 Jan 2026 23:12:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWVs-0000000DJ0F-1ak9
	for ath10k@lists.infradead.org;
	Thu, 15 Jan 2026 23:12:25 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMfjJK3074959
	for <ath10k@lists.infradead.org>; Thu, 15 Jan 2026 23:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cvaa1/tuwQc8fuxNHVmVUCj7wH35/l4L0WpGJwMFaIs=; b=TbrH8LjdaYzw0BDP
	zBbrhF2vk9OHDMhRmgjMH97zr937MTa1+gKzwgIdPHILykOje2irunIABizwcvtp
	5kZiV4+YfjaUrewFjX5y/SVy6IyiTIKzmZaa09i1LKptaQLVTO15Rk1K2vTP3Cd+
	YzCwAdXM6rW1gwSKEmch7TmfiA6Q3pGY4enuAJlm3gj58Y0qjSdy2OIl2x6XCnmY
	SkGSTi+72sVkBW5fvWbRVjAlWijccbPjq21BMPx5EQyvYJj7JnMW0DYdjVuzDur3
	/Em8/WEmwDq9Lj2x/GdIUOZ4PB2tZugDAdxRpaGZQhCvKzN7RPYsktkjyXul4gzs
	TFx9EQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq98jr244-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 15 Jan 2026 23:12:23 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ae29a21e7eso1623409eec.0
        for <ath10k@lists.infradead.org>; Thu, 15 Jan 2026 15:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768518742; x=1769123542; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cvaa1/tuwQc8fuxNHVmVUCj7wH35/l4L0WpGJwMFaIs=;
        b=TLoM9BRohgY+VpMN2aLzLYE1fRxhK1Ui4aB3LeHP+MeOS3GaSqvjjhnXvEvMXfmDBn
         cO937GpbhpZVD8cbngfAZJBLM/jiQtMdAWnc8pJOxVNHQmJohvu4nNv8lOrxAbbk1vLl
         JDtX1+3wVZ6gGPuARbZ5+4U0SQsBd70JyApcR8EXgK1i7c6czOSRTK3KmV+Uo870oESc
         s9qp5lA9qPZ55B+uU5FgRKw/rR7765M2+JhzCLVD1BywrUKYeC7irQDt2eK0SJNJn/aY
         ktQyWhXT6ACoD5HP0dz5nCTVX5lbbFEbEU4HxRDjEOq3ZudvJaHNDmxN+O3/LmWZSJq7
         LpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768518742; x=1769123542;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvaa1/tuwQc8fuxNHVmVUCj7wH35/l4L0WpGJwMFaIs=;
        b=wDwdC59b6iXtdEf3aOJQnwaLzwlV6nYXviSpZtJ4lG/0bvyH+sJ+s6uN+yFUL6nCJ3
         7+1y8SzZ16c7jvJyiga0E38Q6VyvnhEqpBY2lHaABQPyYUZ4liQruy/laBAoRssSPp6I
         Fy03s4wKT6jmnEdg42F6IG7C5mg+zW3g9DsTQr2QzZBILMOGfM8Vgn+fPm0OMM/vbn2j
         D1Vte56wRg9WOuIrOjrh2q8YTbbBUM17q/YrvyoJFJdsygiPH3TcVlIdg2HJf+C6yBO4
         npL8VnVBHKPIdw4VRI4e0zfWhYkvpK5ZbfO6wtt5kzjDziGU4e8o3db73KkqZslI0E9d
         Jz9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwJWvcD3dwlmqwZFn6cktEQFXw1I79x6aONMbFenOot43B8bbqcLPMeFopFawhiPUt2CnzTng=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZVKmpejAQ2sXc4CR8QlI0dVZqRHecR89PMETiGjIYX74IC3ed
	FQwuBJMJcIF4QjEHZe3GvLFgE2GXXaUM3AMxLZ5/BXWyMrbmmCTLIXPB0LNv4nlgHHOJ51hVt+o
	X0vpXAyCkQkdSBhAPuOfxoDmUIzRwOrdv/sbRSrqZHr/4eWnln+LPF4Oq7jEU82rn
X-Gm-Gg: AY/fxX55cLmht47sVvIA8jAnwFoRdJ40tn+hh/QcexuPmgBa6Hz0MeoSYRDm9IaxJUT
	ocS0kyiHDJXZo8b5MsN4jFaGTjQ9jE9euVxHn+5pkd+/bEPahj5BKwltZ51XCL2mRirQnwI0Kn/
	grJY+aBoQKQoav3FrlO7/ArERsT/aRigbBsPZHu9UhHBLstoYsYU+FZdW6J3lGYrYf7/xclNXod
	aYzXK8HJ+abLt/cNybIp3xvcVWMN7nDowlClH0kOzqvFQfisghhqQLumM576aAFUh6bwnVNTCBY
	qNNSASFF9QROaY7XQbJAMso1MPVxPYOnXszk5aNRj6z8PSu3PV1gXu77zKFwZcM/lz0OYpqGmsc
	f95hSh0uiqrEhaP7xN37Ds6VTMXRMJ22i7WtOCzcTLCM0o4tnt0RsOk2lZcpo16C3Nn24uiSGWS
	Ab
X-Received: by 2002:a05:7022:6708:b0:11b:9386:a38f with SMTP id a92af1059eb24-1233d10f432mr4751898c88.22.1768518742037;
        Thu, 15 Jan 2026 15:12:22 -0800 (PST)
X-Received: by 2002:a05:7022:6708:b0:11b:9386:a38f with SMTP id a92af1059eb24-1233d10f432mr4751870c88.22.1768518741492;
        Thu, 15 Jan 2026 15:12:21 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b351e38bsm691860eec.14.2026.01.15.15.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 15:12:21 -0800 (PST)
Message-ID: <6db7a42e-7f12-499b-b36e-687ec93b2e62@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 15:12:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/14] wifi: ath10k: snoc: support powering on the
 device via pwrseq
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
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
 <20260106-wcn3990-pwrctl-v2-4-0386204328be@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260106-wcn3990-pwrctl-v2-4-0386204328be@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=asW/yCZV c=1 sm=1 tr=0 ts=69697457 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=eymIdBAbIQs2YkQ4F90A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: LchMzLyfTm-zrziWQO_8Ot_uh9vsE6nc
X-Proofpoint-GUID: LchMzLyfTm-zrziWQO_8Ot_uh9vsE6nc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE4MyBTYWx0ZWRfX8X7v1nDIn75T
 hWsO2esZlIP/k3F2uqGWSAH/R7CJe8jYLDfzz+DuxSn6rd7+pwUWtI4+ZiG40a4sCkvuOvgi9Vm
 PxXFamkKptq2a/VzLp0FdAMoo2FTfC/C2AIzE4/grLBUpO8cM9sXzdZlpdPNfoeQtbjikJ9LxJa
 psE6Z0/I4uL6Dv6bni5rbap8lqMxNL3lDTPDZLRJ9AeaGvl4Z3rF3LvEaw0I8hwmhou0IDOYHVH
 IVhz7/nHUNxE9T1s+0Ry5jPtk/xz2C389ZsX/4rrwryGSGmAFg2bI4RxV3oLdUKGCMsdNSO98va
 oBQvZ9BxqIq+0HCO7YxsmTNV+wz4lgi2BvNuXXRrDuN3r66WaHs66y2nB/tGybjqpuBL9bz+MC9
 xvW5pReNcp2fKR7IoOtRtTmMcdvUUn39C4JSY0Zc91OCnIgU+qb8H25n9pnCSdTjWIeGFMYbxZ0
 N95gHclXT33weG3ob0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_151224_634615_EFBAF478 
X-CRM114-Status: GOOD (  15.58  )
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

On 1/5/2026 5:01 PM, Dmitry Baryshkov wrote:
> @@ -1023,9 +1024,15 @@ static int ath10k_hw_power_on(struct ath10k *ar)
>  
>  	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power on\n");
>  
> +	if (ar_snoc->pwrseq) {
> +		ret = pwrseq_power_on(ar_snoc->pwrseq);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = regulator_bulk_enable(ar_snoc->num_vregs, ar_snoc->vregs);
>  	if (ret)
> -		return ret;
> +		goto pwrseq_off;
>  
>  	ret = clk_bulk_prepare_enable(ar_snoc->num_clks, ar_snoc->clks);
>  	if (ret)
> @@ -1035,18 +1042,28 @@ static int ath10k_hw_power_on(struct ath10k *ar)
>  
>  vreg_off:
>  	regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
> +pwrseq_off:
> +	pwrseq_power_off(ar_snoc->pwrseq);

in this function you conditionally call pwrseq_power_on()
but on error you unconditionally call pwrseq_power_off()

in the below function you conditionally call pwrseq_power_off()

so there is inconsistency.

note that both pwrseq_power_on() and pwrseq_power_off() handle a NULL
pwrseq_desc so is there any reason to not just call both both functions
unconditionally everywhere?

> +
>  	return ret;
>  }
>  
>  static int ath10k_hw_power_off(struct ath10k *ar)
>  {
>  	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
> +	int ret_seq = 0;
> +	int ret_vreg;
>  
>  	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power off\n");
>  
>  	clk_bulk_disable_unprepare(ar_snoc->num_clks, ar_snoc->clks);
>  
> -	return regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
> +	ret_vreg = regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
> +
> +	if (ar_snoc->pwrseq)
> +		ret_seq = pwrseq_power_off(ar_snoc->pwrseq);
> +
> +	return ret_vreg ? : ret_seq;
>  }
>  
>  static void ath10k_snoc_wlan_disable(struct ath10k *ar)

