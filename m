Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034A4E7314C
	for <ath10k@archiver.kernel.org>; Mon,  2 Feb 2026 09:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eN8FZFV3v73ds3IElQVUqYG0lD7MUuBen0ntV/aMJC4=; b=b4uROppcOBS7O1gKF4E1SrQLYI
	N1h63BilLZYMKPl6RwcIN58tnykPhRfii7mtuKx5wsDTgsYpAuetB4fTx+VOru36UYGP+1w76ddOI
	Yb3VwV14AvWMYmegnUpChbaQcBYPD7vaTsHntkitoAbo/UC/hTK8mABWGh2pYynkSzv2KMlVSS/1V
	MKjZCdZIQYqZBnoylZVqitNPRq5q/3gOzlt5kZblhacow11R6dUBd5+PTQyOSxPYElI++Zw7rwWU2
	BU3UyQJ6m7F+VB5q/0NMeUmKEoR6Qg6gKeTWAs0ueokvbKAbVlyNzO6+TUB1OPo4Tnddiag6dED2V
	/PMPqH9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpy0-00000004gmR-1Y01;
	Mon, 02 Feb 2026 09:11:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpxx-00000004glT-3Q8W
	for ath10k@lists.infradead.org;
	Mon, 02 Feb 2026 09:11:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6128698J1865799
	for <ath10k@lists.infradead.org>; Mon, 2 Feb 2026 09:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eN8FZFV3v73ds3IElQVUqYG0
	lD7MUuBen0ntV/aMJC4=; b=ZywOnEcTXNX8O6U/gFHyjGPAHh21W1ZYtNX5cCOl
	y1oEsmRmdpW3NVh8VWprqk+5YEuKZL4pRJlke49qeaIGFuWpOewn03uhKLAqLTRO
	bThBjLOysL+WNYO6W0y58AbgBi+gOZT8+O1naZsDgrncCCYATnD5b27Vfc2fuo0l
	hCnlQc9aU9Kr4sACuoiBmZmy2LpLF2L0RCb+XsgJun1nKHnbz/O83eI6j9m7Tk7S
	gkJWT8+aRjDNcO2kcMYKjqHGFzDWFPN7gGv9zBQo8Ax9aYUqa8C0dn/amlWore8m
	l684gd7dMNEW2aXDlY+Rj+1S1oL3KeaRqfmWvYFN7Sja0w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avnmsvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 02 Feb 2026 09:11:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a2ef071dso1067738585a.0
        for <ath10k@lists.infradead.org>; Mon, 02 Feb 2026 01:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770023488; x=1770628288; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eN8FZFV3v73ds3IElQVUqYG0lD7MUuBen0ntV/aMJC4=;
        b=Y1NqbrhDbPTnzl7o1/qO34jg0Av2eDdESVKoaOZ8bACa1EmgdjhIWE0XMxJ/DSIeuM
         2m14MywTIjFPKsgZUNe5LH72dsKcgSG6XrDsOuNapGqrykgrkZmabjQsXJSqmHzlahmU
         QKYpZtPvpBqH7MFnDD1elzC+kNHG8kZSkJoxkPILypfS1n3nmvuC5skY0iU1iDxxU5xW
         ezSI0tuhGLGHWaz1cqeME6G/z+5vQQsxihHmMydO66Jp0fg9FVTBlioAZNKy3HzFO0Dy
         0uupP8I0DsVbYDSnHSc6L8tg+byZQTBqsfdGMRv6jaeAqBFzKnUY8Ff86fO951ym0HeG
         XhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770023488; x=1770628288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eN8FZFV3v73ds3IElQVUqYG0lD7MUuBen0ntV/aMJC4=;
        b=wrvoFghY818v+3VsCmcmVJQ/rHNWRUdh9sRxQG9QImgSJyId00KLPMoswN9RNm1RqX
         lNnaXBW/uwaP9553xzS6gk2JlPNWe/55f6zr70JlvnzhMGVt2LOQLkBbwXqJEtyvSJ8R
         VEr43vTRZN/oLh77wXnMnDJ4LY8Xb+N5gCBCeXHLcQxougUz7ctleOAVdzW1hDoXNcHZ
         vqmt+S1PA4np+Op1pn6WjOPo2MsBrEfN6U1xuhro7lcq0g4IHiLA23GxoQ4NAuFZu3V3
         kdI6gCLRkhJJ/DIlVg1wu5jpxDL7aYwCwHJC3v4SRMdwZQ3N9jU8+WvA4cpqOfpH/zIb
         yx0w==
X-Forwarded-Encrypted: i=1; AJvYcCVTMwdcvTDgClZJnkIS+htrKGm03LeAYIiX+MgOd9C2ehhU2UT2FjzN0p8YYfSJgUa1jDEypvQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj6AOe/wgfvzokToBdNTVF8c6VgT9YUfOTVZrDY3lvRTkbN56a
	NOxWeFpQ5XuZZLdqIolKShMl4lES8IqgAVA3XtgIV93L0qJSZ96aDr2zqePuYCHBYRYzq6ZJPkh
	mOoQzLU881qSJRwPI1UYDRcqHOBjm8gBp4U2o7iBWeJ4YLGUW01Cdzs9Pdfpzb/LO
X-Gm-Gg: AZuq6aJfy1NnlbVQUVaIfZEcVSYYEGRZk5W5CQuaiAJcy1vOpUbyEkEM54klYhaB1CF
	mnizUR/8RhcLR3PJWRp8+JBwBXW+m8rLmh4BQINtTan25p3UxTYkKs+FWYgwlQYIVEj5Ganwg2m
	BxUnmGCYX4BYkHiG1UCDy59LX3c4ByQsq6QhwbtrN9ftr9Hffs+kTZyEVN0x5ElwIHRuJSnFefz
	DG8854On1HKx8o+27KleX06vF9sR4BhhZltlB+73z8rlOuzUJxRHtuvtIwSEtFXLAuGTVbzY2bO
	OsbRXbW2c3wfOoRzNDwg3Vadi3OrfZA69qGR7FMfKRweo8UH6ct4WRRWy5A3QP31rLif2FJYuDo
	fOrIgCKc/7Nw8kaoC5EIeiPPx7xSv7lhDnX6j75d5J2Wvu0f/GKqHI8k4Z7rTH8/Lsdn2RDvLWh
	CmOWPomItrkyUsfq26YQhBm74=
X-Received: by 2002:a05:620a:2197:b0:8c9:f996:8203 with SMTP id af79cd13be357-8c9f9968266mr808623585a.13.1770023487638;
        Mon, 02 Feb 2026 01:11:27 -0800 (PST)
X-Received: by 2002:a05:620a:2197:b0:8c9:f996:8203 with SMTP id af79cd13be357-8c9f9968266mr808622585a.13.1770023487206;
        Mon, 02 Feb 2026 01:11:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07481c22sm3401897e87.10.2026.02.02.01.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 01:11:26 -0800 (PST)
Date: Mon, 2 Feb 2026 11:11:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260130
Message-ID: <cwzz5ndtvkr3dqn5xr4erfdhi2pb7xjijcu3c23pdpfgnmlyvd@nuvbtkakxile>
References: <ecf412bd-7bd3-42ed-bea4-d7aa837ddcae@oss.qualcomm.com>
 <34lnv35rbicqk6duyqhhidunulcipttsj6ryvzw6embgablnpl@gh3wtsknmcma>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34lnv35rbicqk6duyqhhidunulcipttsj6ryvzw6embgablnpl@gh3wtsknmcma>
X-Proofpoint-ORIG-GUID: h3PZGJNB6C0546xYyosOjmjjMpa4JAUF
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=69806a40 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=2b7Me9ADDCpIAGoeTPcA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: h3PZGJNB6C0546xYyosOjmjjMpa4JAUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA3OSBTYWx0ZWRfX4TQdYrI486hr
 NpySJ95PEPQTG4BSN73OS+d/+r2Y0L+hNG3XGfffYziYIft3puOU/vWG2v/NLxrKzQzD65hTiNL
 iQ8vyERHHG346P0cGxxHdPki82T8/wm+Do08uua42c+dzPN9LmyTaHCsmcyBW9c+mDTg9saS/79
 mnbiAGbFr56J0nmmqniZH24eIaGKAr1+bErZuLKEmgY8GQbRtT72QNZFnlSxWH1m5/nhoHk5jfw
 xsnS02bosc459Qudg6VV66rQQPCd1i8bBKmSSV6URY0fVmP2sMf/yojOQWFUegw+72Ag74HcD6k
 93v7FEZ6++pD/vGZyNru7c0oUjeBkOZXjYfZU8GPwo5qvoI2rrxBZ7VOucaTifQ/b71V7/DX/Yr
 kWf+vGoASzvGg+OjvEVRfSRdXfwH5G4PDYHTIvVmyoDQiy+tn09Nrdhrf4UBbWzNklFGFPFOJPM
 zEDdIPFn9aI2DiDNCNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_011129_964039_D2D8E9E8 
X-CRM114-Status: GOOD (  18.28  )
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

On Sat, Jan 31, 2026 at 08:39:57AM +0200, Dmitry Baryshkov wrote:
> On Fri, Jan 30, 2026 at 12:29:48PM -0800, Jeff Johnson wrote:
> > Hi,
> > Here's a new pull request for ath10k, ath11k and ath12k.
> > 
> > For ath12k:
> > 
> > Update firmware for QCN9274/hw2.0.
> > 
> > Update board file for WCN7850/hw2.0 to support:
> > bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8001,qmi-chip-id=2,qmi-board-id=255
> > bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8004,qmi-chip-id=2,qmi-board-id=255
> 
> These two were not a part of the previous upload, but... They again have
> board-id of 255 (unprogrammed). Why is there no calibration variant?

Our engineers clarified that for the PCIe cards with the programmed
subsystem-vendor and device we don't need calibration variant even if
board-id is 255.

Merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/899

> 
> > 
> > 
> > Please let me know if there are any problems.
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry

