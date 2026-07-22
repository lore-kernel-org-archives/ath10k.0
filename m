Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC7AC44536
	for <ath10k@archiver.kernel.org>; Wed, 22 Jul 2026 13:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAMC1tEWuW8aUIkhFhHZeU0Otkfs+pd7Gd9KHfl9tMc=; b=BmZphmFCu7i2kWa2rpUCr6SJRJ
	mfv3VOFMHvdXayXv/j90VcBK1KQ7H7YgBcXZ+LmJof0M59uD881rhJRZJdv3aKPKX7v0hqcXIBBPb
	1apVUx5TLHpTYBR40mTNz/527tqFz9/IBTkjszWeRJ2p5dNU/O10bnazGYiacQbLO9eoUvjp+mDBd
	UT1shezvOIkv0L7xD9sB/mDONl3klSrOJHh3mx7CKDKgXlfPCB2h0KdU/AcAWpfKNy/PDUvlzKqYm
	W7yi0eqRLBWm958k2kJYUtmMoKrH4mT9VJbajSp0vq0tstkMepU5RHa//MvJjfIhmnyN/0HcZaiJu
	ZhBINa6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmX6A-0000000Bv7B-3l9C;
	Wed, 22 Jul 2026 13:34:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmX68-0000000Bv6P-1pA1
	for ath10k@lists.infradead.org;
	Wed, 22 Jul 2026 13:34:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWOkP1155208
	for <ath10k@lists.infradead.org>; Wed, 22 Jul 2026 13:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAMC1tEWuW8aUIkhFhHZeU0Otkfs+pd7Gd9KHfl9tMc=; b=egJp5n+Z2iJ/qrQa
	ePIE5rzfZcfL/K4Pw/4v9nh5DhfLs40/CtFfi/HTea9ecA4rRyiho7ltyeXMsrB/
	rhKjJGjxCVhuTwOEZHNIBWcRILG8OcNDsN/pNWwmtfoY2WAx6x3kkma4aCrXXyY+
	Uqr2z0lzOgHW8XFfPw3GEtxzepKKdI8eIt5v2ddyhYdK7YLgZXuYLn//Hu50XGkF
	ZPPa8TRGErrNejPNhIwdAS2CUYrS2Pl57bXbglZWIX5sBCRTMERfjroJ9nPd6R4b
	fbHS8ByNgh8bsOLuSVbEuKr6/q+9k7u7zPnWgZ0e/3NihBS4OqiZPaGx3vAM+9c2
	v8m8Yw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt1n7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 22 Jul 2026 13:34:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-907c59bd73bso3216546d6.3
        for <ath10k@lists.infradead.org>; Wed, 22 Jul 2026 06:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727295; x=1785332095; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bAMC1tEWuW8aUIkhFhHZeU0Otkfs+pd7Gd9KHfl9tMc=;
        b=CrZxNbALvNjZjWKxTKgEWWqOIWFv7toXQIN47lB53JrdfknEYLVjuNQmWQL74D7FrF
         NmcAWRdIZTW+0EnpUCTQq3UZdjrO1I3FAfwjGxLNUXDtNp6vJV+2NlO2exHJYgei9pBI
         xTwriof2sxcWusQsR1O+NcqreAKg0NnjC8w2YrtyaHawwNF3LSfz6w81caul+XWdfoaZ
         40kN6rsCq5aGSPAptrXf3mdZ8dz3t31DK5uB9PeOx7Id7g7KJPsTfYGkzG7SPxzB40Ao
         cnzWGLZgUMA59mLrqJISj2BxNhiapkW49XryUjh3TP5oapO64ZZVeLegV5jWdHX44EYL
         4fGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727295; x=1785332095;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAMC1tEWuW8aUIkhFhHZeU0Otkfs+pd7Gd9KHfl9tMc=;
        b=SDs786VMLRo1o2jtMilUuQ9fGQ4thqZF91g1pzGHSbcRh+0UBUvLnpfB+0cg4XYONi
         r8NCUaM9QvtzcOtR3nELelUJ3DgihQOmdg7ILUxP1bjQVRTPnWj7Zreo1mvz8yaDRN2i
         0ZvuRRzwGzkWyYk7zGJCwqKRAbJBoHyi/tAqlZ5rCsHDs+eXrqGbs9ym2lRUdnITJ4im
         MbyW1ppQUk6Fv6k4m96I5PGft6tXR1IawH+mUb6PH6HZRRYFS3jGkRI15NXMsw551y4G
         22nGM0/CqLsEQWcfaA41S+np+fJo1VLgmKqgLdf7vV0McFC/0IKhcOOxuFaipyUVfKCy
         Fa/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrpBPItCKCK+jPtaMNXu5x7ttkfIlCoraNjgSZFNqOz6Sb0hqvGOHdVt4ZDbWdRoK1aNmsq4is=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOg5TgOlWZ8L8KYBSm3JnRgMF7hQm6+eGXh35vsh4ItfrzL566
	g1Mrt4yZMVTi5pnUBzHHyEmNF4HBpSrMyl+j9Kdc/IHPcxLhG015DPMM6lMt7V9aZVmD0ul3wTc
	SVd74eSSoBmk5tXc8IPc6nqeru9FqdIu/kEV8ZFG1qJqKbT/TD0bT4V/8VQ9W2JbKLG3/Xajc
X-Gm-Gg: AR+sD10IGhscrd6Z9ZcmaXgmgtctdNoJDLpiKrpV6lcKkRXGObJOOUnrDiDKtuQ/sTq
	EQsTZCQlZaRObVR5VlBgzjD3dzmyTHVaGzzibU2q2gqmkuK6diiI+JWq9jCSBcgOBBNa+/TILBv
	v1h+N4AWfV3mAq3LF+Nv5PCAU9I8EQPv0wzHA4ejqhHXXT8oWyo1wGoAvJzNaGErG+LRXTxJC9C
	HfWR/42Gxp5iNYsZPtpdlCuu2qaP2mfAt2dwAHnzs3XJcOTSWGue59KF4L+dLDofnHWxsvnu/2j
	rLm1cR49xa2cCWaiC+8RkFXv9EJdk0U58mW81fs0oX5nMtMcGMAV/NPYP4RcTfWXbHEwRzhOjyE
	O0e69J9OiXbbdrzlOFzliIYmDKWm/drLX5riv1w2VAMFMtwjPlITJa1/8Rzi3
X-Received: by 2002:a0c:e084:0:10b0:8f1:ae38:1beb with SMTP id 6a1803df08f44-907783a0557mr191584916d6.32.1784727294624;
        Wed, 22 Jul 2026 06:34:54 -0700 (PDT)
X-Received: by 2002:a0c:e084:0:10b0:8f1:ae38:1beb with SMTP id 6a1803df08f44-907783a0557mr191584546d6.32.1784727294127;
        Wed, 22 Jul 2026 06:34:54 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa0b7absm21266636d6.37.2026.07.22.06.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 06:34:53 -0700 (PDT)
Message-ID: <95e9a73a-c076-4bdc-9f1b-ba8a811f4711@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 06:34:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: validate WMI header before reading it
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260722042029.36066-1-pengpeng@iscas.ac.cn>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260722042029.36066-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Uqv0cIw5wCr5JDyqV9f_LgBoSc-SJ7r7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfXz07IqRknMgnu
 V2AxgXlPh527a4XU3RpGUbXI8MexBxM/YONNkPneUTHpuiCFNRkmSBdlV1RZoLHSbhzOkYb2eIZ
 1Q0YXjx2gQInlTs3GYhs508MDjSGIRc4fCEab9igRDAUck7ESSDAtDd2753q5iDPlawWrlY+1xk
 wdUrT0n+ZO5NLVUKNueFwhCIw1R8HEFl/PPeX1LkPLHROj5swBNtqMmcl7NJX5ZZjbIExuOK6sP
 Uy8iKqizm1frEztFOchW4/XEBCMpIjTz9ayfLX6BDftMjIlT2sCoR5iA1iX8LWZ6A+NnNvYs2ai
 nhplflUrBi0sw7Y32IEc/ouMyCCiRS+6JcA2b6JhjaiEb0NLV+ZXzXIo16VmV57LqHkNlsdxV8o
 rLOGnWjHjN6LTsTzaGNAhjO/K6xHvvSDGBpbYQ0zYXQ0KVfRaBSA6uXGi+7lleo88I2I2fNI9aB
 WrWyRLsE8sNRiII4ujA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfXwEL1S4SVH7PB
 EfDatYR4VE7yWmC1KeAIwF+c544l+nYOjyf0yWEd+6M5v5Y0z2fTEWF5RdqOm/2Y/aI2qYP+dSu
 ZTFbgRVZZ9enE4+let0yUnZ61YCfiKQ=
X-Proofpoint-GUID: Uqv0cIw5wCr5JDyqV9f_LgBoSc-SJ7r7
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a60c700 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=PdpW-wIJrJljDUDkzOgA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_063456_484330_E5048B83 
X-CRM114-Status: GOOD (  13.09  )
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

On 7/21/2026 9:20 PM, Pengpeng Hou wrote:

> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index e57588c19c80..5b64b5f9bff7 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -5873,16 +5873,28 @@ static inline void ath10k_wmi_queue_set_coverage_class_work(struct ath10k *ar)
>  	}
>  }
>  
> +bool ath10k_wmi_pull_cmd_hdr(struct sk_buff *skb, u32 *cmd_id)
> +{
> +	const struct wmi_cmd_hdr *cmd_hdr;
> +
> +	if (!pskb_may_pull(skb, sizeof(*cmd_hdr)))
> +		return false;
> +
> +	cmd_hdr = (const void *)skb->data;
> +	*cmd_id = __le32_to_cpu(cmd_hdr->cmd_id);
> +	skb_pull(skb, sizeof(*cmd_hdr));

consider following the pattern from my ath12k patch instead:
https://patch.msgid.link/20260716-ath12k_wmi_op_rx-overread-v1-1-327a4b1c2372@oss.qualcomm.com

use skb_pull_data() instead of pskb_may_pull() + skb_pull()
consider masking out the id here instead of in each of the callers
(if all of the caller have the same masking)

> +
> +	return true;
> +}

