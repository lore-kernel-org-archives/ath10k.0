Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0DD606D811
	for <ath10k@archiver.kernel.org>; Thu,  5 Nov 2026 15:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XEb4q7NW;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SU6Cafza;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qia+1SCZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SJo7jnqF1M1rwKNOXnxitcspRC/aTbZyuZtyigERipk=; b=XEb4q7NWLqF2r1
	bQbI7qJJQCC768jfV6h5hFWpkUh9Iy93JBgDooFxWDJk40tP7EXIyj98/BSzY7IAYTxlld4UaJPy9
	6vZ99pxWtQdVqCJAR7XxynailyWUOfoumWFrTXYMQ6tSAAuzx65p8U8kMMyclzkK+bSgNEa9D/zpd
	zd+zdcrtUtfwRSLi+o/0VqVFKm4hdUnbJoB5bCHyqlXmiXY6JYM/QYm+uGTwRNP3DiKMrzcYCQSeh
	mRPf/vY7yWppB4tzXeK7YdcH0rneb8F4Gl7BVYqsg+kjjukSav/7O6tHuGMGbt0CY7mOP92+NNwxI
	9B1o1XdFmg6SPnSO5QOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzl0-00000009SW2-3HVu;
	Thu, 05 Nov 2026 15:52:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzkq-00000009SSk-0Ae8
	for ath10k@lists.infradead.org;
	Thu, 05 Nov 2026 15:51:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQGMM2004544
	for <ath10k@lists.infradead.org>; Thu, 5 Nov 2026 15:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SJo7jnqF1M1rwKNOXnxitcspRC/aTbZyuZtyigERipk=; b=SU6CafzaJUVRtnA5
	pFTLGbVhd67aGS4mk+XjjE9pYfdBXf1FB2jB7PKf1AIcSsOHxaHMUvDphUe9B3De
	X2fyp+awX++0LQCf+B5judTxia9K5H7Ey5u13q/NcjOAG5NPfQGukQ1p7FdvxX3L
	nGUto40dL8y6CzF+xYTrSa7SUv0q5SKNNNHvrA5u/3IkjwTmNm6cU89t5q3jVrWa
	EmafBGunumXmce+1Go5Ep7WTesWeZrsjO3Ue3sJ4Y9PhjIK/p1YTqLcm54ghbIFC
	TltEI3/XRIXZVRFdFlRed3uUkb91RHlpwBn2erYlYpT3/UnIuVfrX2wHa1pE+D4T
	Bomcdg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd1f86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 05 Nov 2026 15:51:55 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-82274137201so2510946a34.0
        for <ath10k@lists.infradead.org>; Thu, 05 Nov 2026 07:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793893915; x=1794498715; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SJo7jnqF1M1rwKNOXnxitcspRC/aTbZyuZtyigERipk=;
        b=Qia+1SCZHdwupGo0bcyksnBQXP5FtkmvO4rXqqKgYW5PbCXBGrjdy7Umky5EV/UnAg
         lHcpWhle5lGNEVeVqy3JtN/elALlfANB52lxRZEIa1L1SR9x+GUiIpwsVFRBpGN6egRu
         P/s59/80xvCmwUoIAKm4qJ3Xc8z/XK6gXarldbgIpGwLsynX7ONRYcjzT7gtDN+no/C6
         AuyTIBwkFNuUuP9dACzePafEgMcu6KLNRBqkzWcGl2LWzYHRqts2kx++y6YyHTZZAMpd
         UmoT7c7bcFIyw39jKdkefshyzM8J6zLXNEWXR3B2/tXpARy/bc6vO4L4GKsJfzNodWif
         bNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893915; x=1794498715;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJo7jnqF1M1rwKNOXnxitcspRC/aTbZyuZtyigERipk=;
        b=KUP/64qC2CvvZIGr+WHgEA7cn3UdyXmUYTZstZrxq14PJmlPTGs8jki9raUQLcyc8O
         QUuQIHvO/O8mMnnpGmKXE3GQx4C5gPUVCv8QAyiYX4hf2rGmufmkc124IsfKC5jbWd+L
         qyqBFRp+OukUXJdKT1t6vrDXBn9Dp4q6i6p84iE0QrTxlo9Mxt+gJGapAunaRKVBxXv1
         pySB4uDUpOn1rXmH4seFLxC54ZaDoZJNADCEa0alcm7pnboWqzz0LKve4U+04gqKC2D8
         0YmrczUG3PIpY0DTvjQK9QswqRKGwuLpDQvnVeXj1e4ojEP5FQbS74+n4ptJet2qu1Sz
         fTtg==
X-Gm-Message-State: APuU4Z8uc7k48oz80iBCGVZAg9fDOQEoOlU4UxCr00xHFB2MoisYZQiT
	3Mu7RcAzNuXm2TlraRDlQxDZzXvCYLI42mTtRK+G/YPkX71Tx9dI6fpDbVBXdvLNv2DOyw16NgA
	yzbiKuVGocVMHEqD6cNrpre2nIKdSOsPQk2GI9ab6fCpcMZ6u/qn0/rn1RDkzv2Gi
X-Gm-Gg: AYBFou3vftXhhZDGPLdPKCx2i0zh3EvXS8ECXDZD4edmG3FcVhXg4p4QI32OGErpeDp
	flqo3SacPGiAV0dmmRSdvASl78bVSoclScIiKJRTW6uOlBGWk6pwXsNZBFWOxVmqYgI8wg1QRTi
	VesAkRX5+c+qMsbVkrlh4oBsUTe3LaAeMT3vQWwrOJdLzIdcw1Brbsyp3JoGLWkpLekflAL3ScQ
	N/rnNOO6dsc7DGfyx7Qh6tPzsxnKdN1yHwyTvPY0cr1fL9lWdjJ3Kxvl9z5Kkul6pspXVFK97G3
	hoowgAqHFq2yHlkXehIQanM3K7Mv/rwiJIE6MrVg2jt9gODWa16vFx1Yr1wF6OcTw8mSXLFs+Z5
	cfxxr1OkLNNA6aXS+7CaXMtWwQriDMr7CFlR9T+XjD72h3Qlx9XVGBHGwoStQDNniIm9+Np59Hy
	WlMpOASYSTIq2+xGc2HBnFccP++WHx6Q==
X-Received: by 2002:a05:6830:640e:b0:819:1804:d208 with SMTP id 46e09a7af769-85d3650b7d4mr16481907a34.13.1793893914699;
        Thu, 05 Nov 2026 07:51:54 -0800 (PST)
X-Received: by 2002:a05:6830:640e:b0:819:1804:d208 with SMTP id 46e09a7af769-85d3650b7d4mr16481875a34.13.1793893914117;
        Thu, 05 Nov 2026 07:51:54 -0800 (PST)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3d7617asm4814965a34.4.2026.11.05.07.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:51:53 -0800 (PST)
Message-ID: <18053a92-36a3-4d02-bb73-25e9aacf976f@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 07:51:52 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20261102
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <8e38f8dc-88f9-4974-8f98-687795fb360a@oss.qualcomm.com>
 <61e49149-5096-4440-b261-ffe2d250f6f4@oss.qualcomm.com>
 <6792cdaa627ba4755fd0836a74474977496f9670.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6792cdaa627ba4755fd0836a74474977496f9670.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX+N0j0vs0MHBk
 Svy9ZaWO6RwnvI5NUhkDymDbYQRTjqfPSf7YhW6tZQCUPJbKfK/jYcjzpOE5uODhj3WZddcSEOz
 tS/CQNKtTckvXXBLGw/2W4KtX0phJhU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX/0zWd70NBr4a
 LgfctjDdrXsLA2kEjwk9AWVBXoC/vk/y+Be6QkZAM8O8HUDaqBLvTpEyJcofjcxCu5V4xf9s0aJ
 7GN6BrvfeLXPaOZUEbva8GsqsXvwvp8CUr1rN2kY36kcZDMdVFv6Cj6Mx1hH7NmTb7YiRjObB1k
 a8JJUQU8iDJ8c01vXn3otxvjCNyn8rwZxSlHTBUaAVktLKirfNsxwm+OHZXbjhaEH4VQpu5hdL0
 +PuCVob+pa/8UMx2wSHH4phteu+JX54qfeMdn/fJJhRGHjmNBI1Gu9l0Lp68Vl587vvMy//Mizd
 vghmKD4tHdiZclC6BYt05FmngkO6n97xb1qJyuylkS0YWkzAVqXio/y2fZymHmxqnoRlPzhmczh
 ZemyoJdZj9dMRCI6sli57CzSGzIzlx8jnzXCj4moMq/WWuUAxqr/uGEtF+iwCTebLzomllF9Etk
 YYdU2s5Oz5sepCnDmpw==
X-Proofpoint-ORIG-GUID: 0fgrBjh0C5OXvtRUjQiks_CeVxiTW0ZX
X-Proofpoint-GUID: 0fgrBjh0C5OXvtRUjQiks_CeVxiTW0ZX
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aeca61b cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=5KJ2qN9qyuHGAc2nJd8A:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_075157_437002_39F9036D 
X-CRM114-Status: GOOD (  11.54  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/2026 11:29 PM, Johannes Berg wrote:
> Hi Jeff,
> 
> On Wed, 2026-11-04 at 17:11 -0800, Jeff Johnson wrote:
>>
>> I missed the window for your wireless-2026-11-02 release.
> 
> Very narrowly too ...
> 
>> Since you have now
>> fast-forwarded I hope you can pick this up so that I can also fast-forward. I
>> have a series that depends upon a revert that went straight into Linus' tree.
> 
> I did, but I was also going to wait until net lands in Linus's tree,
> which should be soon (today/tomorrow) and fast forward again, so we're
> really aligned. Hope that's OK.
That's perfect, thanks!

