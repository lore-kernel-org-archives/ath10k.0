Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36A2CCFA18
	for <ath10k@archiver.kernel.org>; Tue, 11 Nov 2025 12:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcgrCPztTJBR65GQBdHRM8vGIBP891DcZKanjQPvZlk=; b=kqnshn8kIRxiX+eG+XDD1+AHW/
	qq2ww9xqG7bdAWBY46TTMnj2b2yHu8rYy7vYakGUTd1tR93/eIBY9gfItzD4CSKndri2b2k1a5B2G
	NI+ywshKcqt+MUH8DEoBWbplb8a7D++CtwvvGUTCKM6LX2wx1I+GYYLWvMRe/GGMMj661hCWTZBaG
	IqARdsgS6J/2lJMRINnBmGZdUe2hPDnqhYGsfdwQznGdcXeRZcKka3ue7jjG2Lm3n0pLLwF6HgQKs
	ZoPprj4amBNShXdJIzImPoIECXVzkQ1RNsg+kmZsj3eEd6VjAiVx+U6iwaph8dBlnfL0GswOKpzsc
	E1fuDShQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInm4-00000007CEh-0YIk;
	Tue, 11 Nov 2025 12:47:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInm1-00000007CEC-1VQM
	for ath10k@lists.infradead.org;
	Tue, 11 Nov 2025 12:47:02 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGVPH2129943
	for <ath10k@lists.infradead.org>; Tue, 11 Nov 2025 12:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gcgrCPztTJBR65GQBdHRM8vG
	IBP891DcZKanjQPvZlk=; b=OQfOSgYRI409fge3xzAPl1zyGh1B5qggKlE8dJ9t
	7tGU0Iy6M3IpsQ7petXXseFGlD8E2Fjzu1/UXXq1xmotBXJ5PEtsxTlwh+OpV69g
	Jd2CqZlRGXOD85TNRmKFGa6jgJYlo4dTgpQzM0kN51g6l01LlZbs9nJgpmTbTEOz
	oYFhm6zy30mLObmBJyMilSLomeqaFxxlToA2AzNdqKBQSei/1kKkOr1TJHhaQZNk
	E9It9O4+VrxAYgj151rDfZvzTmVsj+kMyPO+vGzD7/jnRhEGQRwS4bIvJnM71qtB
	2AZsIUQWQt319t/kgHlprzALrj7ARmEAacxX0voP7QALMg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abvhthmvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 11 Nov 2025 12:47:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed782d4c7dso96878111cf.2
        for <ath10k@lists.infradead.org>; Tue, 11 Nov 2025 04:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762865220; x=1763470020; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gcgrCPztTJBR65GQBdHRM8vGIBP891DcZKanjQPvZlk=;
        b=TkL05ViUfgoHlGV4pHhzquhg3MEhg436+GJR6NmGQ3cRd0jZ1MuiawLshVAB2CAoJW
         E5ih0PGnDSobteTUerGWXd3HU/EtFpm2CpQvSBG7npmNN2oW1NJ8uUMMuKhKLca7Mwb+
         R7IMlsSa8xC881DnVz2GXP3YLwmcrHxMo8IcumHM9523F19NH2E5YqDFBED9TD/y2WQs
         jfz9DU/JeNuObKcXXLzrVcRIBdZxjjsOBZvF2gvYATnzQBii2O44vj2vJQdoImFEV8SS
         qYnyjMaJleMcEil28kykZi/hMFOrnMC9dRsGwE+kbY8YbKi5D46rE6LC3LH9WinYksqD
         NuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762865220; x=1763470020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcgrCPztTJBR65GQBdHRM8vGIBP891DcZKanjQPvZlk=;
        b=Tof8r0aPTU5UAwn5cV7XAKZHSVzg1v8IQBHZQguyOoQ4TxRR+yzBhxUiO20DaE13KS
         8vOQ9mTuDXaCzkFcE0vcNB3wSyLJ+Mp7vIQaMAY6DG+50oL7/KSwWH1mVWMd7MVsvCef
         TX4U9zUzbNg+Vkt1oZMqiC0wxYCicx1knOFgwy4Gurg0oYr7+NxBEUYZNvii4oYAoXUb
         a57+SvX+wqpdTd8oy0olVwy8LAQUJR/e3GKdRMRbR9P6VrmSxYnEHzk93w/ClZriToxa
         /822rXOn45XUbyEur0oRc+mdxJ4nMzWTRY913cnOJi9sjnKgp74/fXuvVz3icze1L5UL
         WZ/g==
X-Forwarded-Encrypted: i=1; AJvYcCVEQMnpjb3Een9NRtbfHFUSCqFQZmEJlwpGObwbZyKfBqgEZPNFd7JeYhg76/vfSbda8fcmLaY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/V9INvBNi25W5Ba5/+qWGBVcGGfNPLA+lB7nt3X2Bkya2Cv1u
	skYbgzrh1GG/doAVs0LFRuhl4qFulw5TGYTTqpGyH1iQz1kFzDYDc93ixi0RbVHU5q2LKDWAp4m
	XIWRTqiI961sOM+jo3Prta6iM/cVGp2ma3YOrlVQjfmz1qZR38RByHhhjMgF4+FDy
X-Gm-Gg: ASbGncvPcHf1DQ5MxvaBYN2956fJU252lcWqgNCUVWnOfKszqY77Rtq25FYQC6HycId
	8WsxnVtig2wtTvB3auqvkASWYulkMuNVjIwMyUD1nNJ2oWe9fgX2zx97N6Pr+43DBOCxeKNmHjG
	bYaCPTelVGzexEHd5JGyf/IZXb7PsPSVLpBjqrySohutu8DeeOxkq50VFE418u/xgBPaVGotGLb
	qVKK2VeIqgivsa9QTdHJe7zrm/ZjAHSqq3AaPBvzPtnpdHF06JwNovaTkkYfCvH58oQTZG7/sdR
	TcI5dZ03cK18gU6XZxXbBFVB8bgYVtY8GTUVJC8T1M96SeT236llN5MCny/XQrj6pBmLqHGp1XN
	9YLuOzmNu91jPo+79wBge30hsFSS7nD22lLeJtI43o1e1VqKULTHciPYlJ1zu3CYT+p+7pHTSCk
	YwT7mG/x/gmIRo
X-Received: by 2002:a05:622a:14cf:b0:4ed:5f45:448a with SMTP id d75a77b69052e-4eda4e8ca02mr155999621cf.6.1762865219502;
        Tue, 11 Nov 2025 04:46:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhAlncYp5HpdTxD1HrQnjF1b0//yHkzKS+jDNKrjtjAklFMPHNI+T7aD4cdfUGmuDLd6rdcg==
X-Received: by 2002:a05:622a:14cf:b0:4ed:5f45:448a with SMTP id d75a77b69052e-4eda4e8ca02mr155999401cf.6.1762865219022;
        Tue, 11 Nov 2025 04:46:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a39eb32sm5013667e87.82.2025.11.11.04.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 04:46:58 -0800 (PST)
Date: Tue, 11 Nov 2025 14:46:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Joel Selvaraj <foss@joelselvaraj.com>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: xiaomi-beryllium: Add
 firmware-name qualifier to WiFi node
Message-ID: <wxvtfyfdso3ngqvnhvryeo2w6udoolfp46smv2r3qny2cl7n4o@iawxfnj7qtrw>
References: <20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz>
 <20251111-xiaomi-beryllium-firmware-v1-2-836b9c51ad86@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-xiaomi-beryllium-firmware-v1-2-836b9c51ad86@ixit.cz>
X-Proofpoint-GUID: CqgxJ9dvfaJmNnMxfZW7RZNLvsVm4YWH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEwMiBTYWx0ZWRfX8sZUhih3UePG
 QIETNTZ0s3BX7NtKHkRrY6GrWDQxb85iYc4s1WKm0zaCX/HWyy57/cJkvyqjBaGsl1dNuV3VwGW
 efLVyUF60BvQaNtEv7MYZNRZsVhwla0xeglAUxdppD0Q8aMnpsKOehydWi3WXCYbYdO3+/RUf6N
 jQFxe3GKf1P+Qf/jobpEJKl1SaC75hrNxPOia+af09Y7889A1EJqcgW3CrQVkHSkAWtl+hve8W+
 8qkEQujO/bf4bbOHjmqtmcp4kOYdH0X1yaGT3f+gfmGHpI8pYq0cYGM63EVrrbkhmsC1r4dnjNF
 SV4soAGreNSLK0mu7QzLRSJCvifV3O2jUIk13yd6HAZRib6mgWQYecFbx2CQxsi9zrePFwiwsXT
 w22weiZffte8u1GQp9Zv7CEFq1lLrg==
X-Proofpoint-ORIG-GUID: CqgxJ9dvfaJmNnMxfZW7RZNLvsVm4YWH
X-Authority-Analysis: v=2.4 cv=d4b4CBjE c=1 sm=1 tr=0 ts=69133044 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qG9Bp93c0gXLeqlDJoQA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_044701_411910_916C7CCB 
X-CRM114-Status: GOOD (  17.58  )
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

On Tue, Nov 11, 2025 at 01:34:23PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add firmware-name property to the WiFi device tree node to specify
> board-specific lookup directory.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 785006a15e979..9b0b0446f4ad3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -631,6 +631,8 @@ &wcd9340 {
>  &wifi {
>  	status = "okay";
>  
> +	firmware-name "sdm845/Xiaomi/beryllium";

This wasn't build-tested

> +
>  	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
>  	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
>  	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

