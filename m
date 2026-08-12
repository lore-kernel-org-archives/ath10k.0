Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AC2C5B572
	for <ath10k@archiver.kernel.org>; Wed, 12 Aug 2026 18:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTpDCdHVX8oh2DPLWNozYILlYQ0f211QbctU4RV5Ejg=; b=owtk93gp9jOfZa8s6hpif9/Wzl
	ODBfB4PBXKR9pIdH26HVLMKr8y8M03Zky2x9x87i1TMyhqsCgYmCywDnQNW0jDNMrILiXioh7pntL
	n0yT6Y+DRq/NbACYphyHb4R3+IOuZOujESRcZJxoj7zAJ0unn6soiXUCJZJBPJ8QtWYC8bb2GvXZL
	LGw4VbhfdvofeEq12WKFiWAhxM7tl9Fux/0x/sIhjja2jcy2iPzbLfe1eHvtN1m7VxXGuDSTUcSCM
	gbhyqD8ZQ7cvDh1ayeb5ZCyv4UwVQKe91ArznF7UAnLqYBeIeO0rExLIHPijS2kPXSUxunA7MXcdb
	CzD2xbug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDaj-0000000GmoF-2jFi;
	Wed, 12 Aug 2026 18:22:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDag-0000000GmmQ-3IMz
	for ath10k@lists.infradead.org;
	Wed, 12 Aug 2026 18:22:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CI8s1s382650
	for <ath10k@lists.infradead.org>; Wed, 12 Aug 2026 18:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BTpDCdHVX8oh2DPLWNozYILl
	YQ0f211QbctU4RV5Ejg=; b=RNoO8uTxebvsNptxCwD3Ns0BjS7IEodYyNlciKAf
	PBFv3TMp4F6Edo9s49akYyP79KoGii8ogmQfP7SCbv5EBgZzM8RUSphkFbYJgiNA
	zrlbATQcMLuEd520TIyKqJQ1iG/kYyXg+e4MyCMOdNT2NdjmgdAB6PUV7+QVLN3C
	v80I+4BHI//muwfwug0CdLzLrHq8LjQf3sTIEJfgA41HMbV13ADjOP1tuLB/r9gg
	fNlpFZ1eAHpcqK8/ibaeEkybHhKbKmtIR6aF7wRxjlLZA2dSzBBClsS0K5qVg3MK
	sYl2E9rxZLA8wRNYPX/XDmkk9g/itU5cjsBYJcNf5ztdKw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0jgrkb6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 12 Aug 2026 18:22:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52cd0374265so24386341cf.1
        for <ath10k@lists.infradead.org>; Wed, 12 Aug 2026 11:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786558933; x=1787163733; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BTpDCdHVX8oh2DPLWNozYILlYQ0f211QbctU4RV5Ejg=;
        b=jsBe25/QmUT4malV1Z+7gqyr32JLLnAbr19ZlwVbV395itv6ByHoFqj3VpXE7GUe0x
         ANiKdGoSrByBy+xmAs1xur9T0rXBdgsAEiuJ81XESe9lTRAA4iZ5xUoEbVCjjuLOdA08
         gSeQ05s273K9sTzzCp9vV/S/xEWFPIGpnApfOyhhm04/XHmNVcHJKic0gDixCXyhaJPn
         eQL+bo9IP0WqjHLncUcDxSZlA/H1YN+mmQKC0Q2C/owIaiR5u4QCQNF6RomICL+cYiKa
         BRRxwj3seaeVc1FkMgJE3m05QH5jFy8QKvJ4ch3tCahiy9sfQIgbHcnbMa7mz3i8846z
         tJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786558933; x=1787163733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTpDCdHVX8oh2DPLWNozYILlYQ0f211QbctU4RV5Ejg=;
        b=CQFN7A8+Gik0i9oTtJAJWTo1ALfioLnhkM7byHaVOowuP6MVxDNpGYU+ke41Ng5Jlc
         U9wKqJs+AStmj4Q88sbDGU7/jU8IlXLvLpMZ3UNZtpEji7HCyJPRqXSjpOJCyrekVcNm
         lH4qevQEQSJEz5mZKWnn/+CUL4Eme7XGIN+uNU9cHSQD05kVVRRELmQGTFihATl4rqse
         GxiML8QVWRCh6PZSq1bxbkBh+E6a6pxVKbkjHjaY5eZwRfEhP7z5uu6GG5UUHn7kvIhc
         mmA1RtqtqYTqbvtoJxhGHHF5FyGrYqWEfdTQ4IQn2dZ/RMGM4N7sMHGA6xhdcfUnE6j/
         rwsA==
X-Forwarded-Encrypted: i=1; AHgh+RoI8CDIi5h53nkyN0Cl1/67fsjwfsPylYInY7QZOWp79FBwOYOGNqVrojhTryKl8eeaOqok1qg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwasyxC0NO39osVJlf61rZB0pPQdw3nJNNk/+6aedjIveAjedRI
	kcCbHqUhRH9pMxy4Zo7j010oDwIk5UcLipkwbh9JQO82QqPfJfjSnyKDIHaSsM+TVUSPaowq77K
	9tnATq5X+AQZQAoc/5jg5leYZoqfzUq6X4WZJPWzZ7NJ3/n1CuftGU0vWwB92SAYk
X-Gm-Gg: AR+sD11giH1DwYHYzMJ7LuRaavnMTtPpm+LGHggyJ8wYTsm+Xg9+eBIaHbOjY2Rf9bJ
	qFLc7RGI0pC7pfauF4RsPbbLekalhhTtq2hTLZeGqzmfzRMgRSV/M3kdIy+AI/Bv0EzvSWWWNoL
	omPqOyMxFX1wDfjUD+tAvor6UYgmnuisr2veXS7Dbhu/ToCbBNVc6ZTfB7Pwg1ZcF9JWVVjwPzB
	/8G33y/hjjOlLXAvUXdJ4V1/A5UOno8gVNtqjIo62/wydQwnj69Odv15BHfY6spg63oEJ7GHZoh
	gw1D2t9L6HGALeHc2EjLnUIO045VI/sMVnNpFLU3KSQa4v69yIgXER/MIOwm9aA+npUiIHpZ8kV
	2984oHXHYn3cHPdFBrzT7OC2ejpuJQT7Xy2jwsFQNFJXBDn4WLb8RSOnmU8dzW1ipx7rr5n07dT
	+j2l+Gu+kE3jrM
X-Received: by 2002:a05:622a:4c15:b0:516:e249:e30f with SMTP id d75a77b69052e-52d73df0ab2mr835451cf.42.1786558931508;
        Wed, 12 Aug 2026 11:22:11 -0700 (PDT)
X-Received: by 2002:a05:622a:4c15:b0:516:e249:e30f with SMTP id d75a77b69052e-52d73df0ab2mr833301cf.42.1786558929327;
        Wed, 12 Aug 2026 11:22:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44d0477desm659199e87.74.2026.08.12.11.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 11:22:07 -0700 (PDT)
Date: Wed, 12 Aug 2026 21:22:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260812
Message-ID: <rrkoosnnkdkzgbqzfmpk3uwndoxuvfvanx2kjy7j4rp5ch4rop@wujgojy3qxxo>
References: <7736f627-e80d-48f5-a11c-97bf81597d6c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7736f627-e80d-48f5-a11c-97bf81597d6c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE0NyBTYWx0ZWRfXw4WQuO8wR7NZ
 Fs7Wzf5P8Yl6EjzHySuXlZ9g9BE45cRhXQijlk+m9es2LgfkM0bTaloV+qWnOq9WH3R6izrvn3d
 BLTpgwwc5KcIXhSZ/0Z4EwK+ESDE70ztrfrPqMaFUhxvdRCZ+3WhsNiXqbKGtqwayJNF390Fn0a
 wfWXg/gmq8MjZeWbnJnQnvbi37UgRtIBTgBax2uAcsQGKsXAQpPT8IzTA8lAPT+HFIuxbHWbnau
 Jty4c7WdtLgMpJstF8+vsWxNlSl9X5rz5O4MoBo2ZM1NYaLpYGAbBlxZZldUZD/Z7a5U8R2GW0n
 nX2pRlF0PsUiRz7b04SbDfEG5JCvnW6J8zU16nPChIWFpRJroN+8SsmGdSAGN1mkVwjBSU4mkJT
 AQF0JHH/8j0wVQsCki0T6wntVPMr8TWl3Xr+FW0JodbwqHdo35sFaI2mOV31mIjqeZuZIKYa2vB
 yVg+k2QMJ4zyeD4vaNg==
X-Proofpoint-ORIG-GUID: refCNvKP9rLhs3f7M-yNlVNM0nd5_6a2
X-Authority-Analysis: v=2.4 cv=TNJ1jVla c=1 sm=1 tr=0 ts=6a7cb9d5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=p0WdMEafAAAA:8
 a=W2b0fEEQJ4TDHmAVsWEA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: refCNvKP9rLhs3f7M-yNlVNM0nd5_6a2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE0NyBTYWx0ZWRfX7geNvEWkEDCV
 jyYneOwFAS+O92iYr72UWsQ0oFEUPXPNGHEI5p8d3LPTBdqa8Q13rR+evDEXym5OIDRGkk2VODE
 zA1rlzq/F60kVbPrvrCGw7/AyKywwGU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_112214_958031_5DB3D118 
X-CRM114-Status: GOOD (  13.14  )
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

On Wed, Aug 12, 2026 at 10:44:05AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath10k or ath11k.
> 
> For ath12k, update the QCC2072 hw1.0 firmware to WLAN.COL.1.0.c2-00228.
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1177


-- 
With best wishes
Dmitry

