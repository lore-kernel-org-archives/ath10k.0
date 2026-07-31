Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC32C55167
	for <ath10k@archiver.kernel.org>; Fri, 31 Jul 2026 05:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+6uiNxiXp+6XrR6HlL4LxM9vmUmpkD7QjjW6V1Zz68=; b=XDLhUptrY0r7OMMw+Zd0Bncvnc
	BJ70NxlxPeN6p/bm+NE//e1LkbiAfmMQ1kBMVESZAmB29lKF+6VeKb/vXX6ZpNTJkdfN3pmfTYgMM
	uOqsACFkmpjZ0UbDpIJDimxRw5yaVQYYtdTPzN5OEwaQyBAVLuCyvuwmuAFse4hJUOS5JXy8zfgX0
	ac0ihXmXp/79vtPbYvX1ibCPFYjamFrS2AMYYwUOmpj1775FZJ+zfAG27frroMDPFrwCc+pT2cw4C
	HNcqKqHr5lQ3S5JY3xSVC2kQMmuHLtYRTuZjNmRsFmVNltyu9+hPW6wZ3OT2ITZIvHY91ji00vwCE
	UzkrtqwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgCH-0000000Bqpc-2mdZ;
	Fri, 31 Jul 2026 05:54:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgCE-0000000Bqoi-3771
	for ath10k@lists.infradead.org;
	Fri, 31 Jul 2026 05:54:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5FBhL028646
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 05:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c+6uiNxiXp+6XrR6HlL4LxM9vmUmpkD7QjjW6V1Zz68=; b=dZvbAmSBOFtsqPl2
	qD0cAleWoxnxzFFmGfugIJJDISQY5EZlcL4NWkCHmizQuw46GS0znQMyZF8f3ouy
	jqCPrlkRMir75FWrZzN8xri/JB8ta7F60n4w68mQtdwNYntoOoPox+vHborS6ZbO
	ALiRsjBSPOwivc6aT/qw2Hsff391A+cK5FDfje2oN+0hcnukhaeTI93XWaoc+8gX
	XJ9n510RoO/9SLBH1dGg2Q5bcfO1UvzbMGGO63vLEg+q6XDO5Hn6UEOkYXRl5onc
	ym0czP4wQgeSKtFITgG5totFhHwcvbBzyufpfe9aaAHmUB5qehEAh7b39nQq/7ts
	W3tvQg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frnd5846a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 05:54:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccd1958e8fso8189745ad.2
        for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 22:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785477253; x=1786082053; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c+6uiNxiXp+6XrR6HlL4LxM9vmUmpkD7QjjW6V1Zz68=;
        b=WD8cy7y+31P60olsXPRST3T82WHToRjmn0tO5F+jN8fp7eSdo4lPGGA1aT/TI3JwV0
         v45lq5qlutIK+/p9GHBM8vbwcEZARBhBkG9MBinQ0EbgLdBFAL9yEbwamPjKuQwbwXDv
         mb4E5qOlLhdY/GFqI89LLWWXok9ZSJPrbiNJ+KOsG+sO5zDzAKu0prdYGj8sK1DlbSzt
         Vx+Yztn2Bh1oubzYp30TKQcALuoJtRfpDT+69hDFnlaizn4J6mEIj5wuPfdPpzwJa8Zr
         eIOTm4++cwwWOxjw+bpeK9vh7v0WnuKM3FD/NCVE62ImXH7HNUOKOuhLQdPRi3Fy1BnK
         2wPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785477253; x=1786082053;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+6uiNxiXp+6XrR6HlL4LxM9vmUmpkD7QjjW6V1Zz68=;
        b=Qz0K6LGlCi1P74Fqr2rompsGw59cZLuS+X/vJAt5B/qSJcvSbSVCie4SC0E6Tx7PMg
         X8oM70AtBG11clpCAEQrNFeomimcajCaETb6OQQSeGqjgpBjZSLcxilxnew6SaHcR/Ze
         IJyO5RyzyJOWj8/T8e0wE7nH8REbC/IKcJB2wtomnTv30tFYZZvASLJAGWRQJQo/Vfgo
         rcWhaCPR/AmEC5wyEHFHnHdQH97LefOKUvaTLKJzOPr6MP7ltC/q9LI6skYkA2K6fSYe
         3kgL9Y5NeTOyKRVme9J90RcssSLwzqp8EALPozkwpZ1r+WbnkG55A2tl4bzMqa+4RXy5
         ebrA==
X-Forwarded-Encrypted: i=1; AHgh+Rqiin96vZpzDiqZ0e1oEpK3HLn4UCCnYkTvwbwEBcUwTWuGSxkGugZlITPwZYTRy7Q8FWzYj40=@lists.infradead.org
X-Gm-Message-State: AOJu0YzoQEFRANdNA/3Yho0YK2rrK+Io1OmJM5gkQ3aE3usrYRHyJ+d8
	R+djD/09Vh5Yrl88dRX+YG0B6ILcL8e514v6hzqlReY/h++2m21y4GBjQtBrd9BJ91R5Rc8wxNu
	eHMCQxj4MIwSPEVSXW8Ab1+nakb+LlNwuT08pQmoBs+VqutmfloI3iPGS/4pN5HeZ
X-Gm-Gg: AR+sD12BSTz4GvP58IUHehecRFLyZAF1nRIk4Nl7Mw+5EtOcAn+U60HwCZAgnf1Vsbi
	EATHLnufx0qgq9x9mQI/gRJ3RqjaJ1lbyorcSU+nZqyOrchC+80ifyWrw4famznOnEIs5Op0K5t
	cXWOrdRZ7MsEUwxb5PXE3rMoIVmYYbXPKxYiDPpa9flfhYAm/dxBjBodGWh5zDy/qv1tsyS8SS9
	HyDu1SpgbmVfv2SvLMGZ/+OfW1Bl9pELNhb0ssGIaIFnltuEPS7gMPGCRSDxK8SxM/SrhMPeDzm
	33cwTxGQ24LwZ/9pq2m/smuFESsPFvEcVurcF9LgLNq3TY6KM0fOPcjc5TSdmW9cIOELMcENhgP
	mf01Y5VOW42YHlq0mAL7Fa0Skjdl7Nb1cdkJWACMP
X-Received: by 2002:a17:90b:4c0e:b0:385:d033:d9f1 with SMTP id 98e67ed59e1d1-38fb1451e8cmr760196a91.28.1785477253553;
        Thu, 30 Jul 2026 22:54:13 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0e:b0:385:d033:d9f1 with SMTP id 98e67ed59e1d1-38fb1451e8cmr760183a91.28.1785477253154;
        Thu, 30 Jul 2026 22:54:13 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e666sm2466110eec.4.2026.07.30.22.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 22:54:12 -0700 (PDT)
Message-ID: <217852fe-5e01-4d10-8767-c44844db714b@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:24:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath10k: snoc: use memcpy_fromio() for MSA
 ramdump
To: Linghui Wu <linghui.wu@oss.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org
References: <20260727072629.2297208-1-linghui.wu@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727072629.2297208-1-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mq2wuDuR73GXozmUnf5Obyi3omV8HOSO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfX92aEVOGS6a1H
 EuQPYNMk0NapsnAlLBAUjmEuaUtiWr5YjLU7Y9EG/hhKF2AVvQkjTWlOcXOBV5PzbuTbwnpK1XP
 MmZpWB+QtfCAJF1a/Ff84SV5y0xcNYpbi9P2nAvO5NjCEYUCWqQ8nSK3fqAZEK9HKGOftZu9NsG
 soZNbgfJWOsris99XRZtdiGXnkHWq2w3xTO+HChqE4p9OvgB2c8Yme7yj2W4suTHMMHHunB8kue
 L5bPwd9Scq9pWZv1r+PJPM8RT8WyBGMmNgluzCWIsPgWNVKQpuNYTP4HltkWBeVTJrcxgJJXp4A
 BcoCE89D4Wix1PxhGt7ywGIMRBE5W4yV9v28lGPh70dFTSb1ttVrGzmHGt74kH8GXdK7EHnXmA4
 vuv5rD7t0RwN25lBctBjHFUy/x7ukklNBGJjXYCkvmKPngpeyeTB70So9IJU12e+/GjCHJ3qkmt
 vON6BTO/n8EAVBqJ5mg==
X-Proofpoint-GUID: mq2wuDuR73GXozmUnf5Obyi3omV8HOSO
X-Authority-Analysis: v=2.4 cv=MLBQXsZl c=1 sm=1 tr=0 ts=6a6c3886 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=EMxFUL3Ltl7gSd1fbyIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfXz7zCtoFGJ0FW
 0IXD5+lCDMMU9ZdRfrExvBoX1EMZCkBZmCq64ZdxjN88p8SwoAXSuNqM6bRX8aYVsqMXsFDwHWL
 k74TeVESGJiqYLIQf9ayzo/fyf48ywQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_225415_439595_E241295F 
X-CRM114-Status: GOOD (  15.38  )
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

On 7/27/2026 12:56 PM, Linghui Wu wrote:
> On WCN3990/SNOC the MSA region is mapped with devm_memremap(MEMREMAP_WT).
> On arm64 such a mapping is not Normal-cacheable, so unaligned accesses to
> it are not permitted. ath10k_msa_dump_memory() copies the region with a
> plain memcpy(), whose optimized __pi_memcpy_generic implementation issues
> wide/unaligned loads. This triggers an alignment fault (FSC=0x21) Oops in
> ath10k_snoc_fw_crashed_dump() while collecting the devcoredump:
> 
>    Unable to handle kernel paging request ... FSC=0x21: alignment fault
>    pc : __pi_memcpy_generic
>    lr : ath10k_snoc_fw_crashed_dump [ath10k_snoc]
> 
> The Oops both leaves the firmware RAM dump buffer zeroed (no dump is
> captured) and crashes the kernel, which in turn breaks modem SSR
> recovery.
> 
> Use memcpy_fromio(), which only performs accesses that are valid for such
> a device-memory mapping. The generic memcpy_fromio() implementation aligns
> the source before issuing word-sized reads and stores the destination with
> put_unaligned(), so it is also safe for the coherent DMA allocation used on
> the non-reserved-memory path. ath11k and ath12k use the same pattern
> when copying target memory into crash dumps, so call it unconditionally
> here too.
> The MEMREMAP_WT pointer is a plain void *, so an explicit __iomem cast is
> needed; use __force to keep sparse happy.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.3.7.c5-00107-QCAHLSWMTPL-1
> 
> Fixes: 3f14b73c3843 ("ath10k: Enable MSA region dump support for WCN3990")
> Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

