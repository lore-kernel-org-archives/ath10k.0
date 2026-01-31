Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C53D79742
	for <ath10k@archiver.kernel.org>; Sat, 31 Jan 2026 06:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfLFnX/pj06+42VOeKs579fAr4gQfJugqfCbVka7R48=; b=sd+mt24rTjN63il3tl8Sb2ILIg
	a6hMSY0Jje9IXv9njHtNAjx7eczHA1gjwblB8aULNbIIrS98AwqT41SZqRRiTnUyKJa5DjhTGzlPm
	xihy+3qvBBmV4XaF8MlCw5TEYhqq3Crw7i1fTwoZ2oz9tDre4dK3g5Bpamff1+OR9WL5L8bQYVV3c
	EFhq184LtzED2gja0FN8aCfaE48AhNekYDtMll7T6UKXu5CuMJRvZ8rNLoPc5VEHpqTn+9QtmZrOQ
	Rn8fFJvE0MSd6Bs+oslh9BzpOQZNFMjho1tV1GOkJGLU1MXZtJTy8O5LRNgCu1fHiXcuwd8sfCCzA
	dAKzLtxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm4eO-00000002Mrr-30mX;
	Sat, 31 Jan 2026 06:40:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm4eK-00000002MqZ-36kp
	for ath10k@lists.infradead.org;
	Sat, 31 Jan 2026 06:40:06 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4bvJm1061873
	for <ath10k@lists.infradead.org>; Sat, 31 Jan 2026 06:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zfLFnX/pj06+42VOeKs579fA
	r4gQfJugqfCbVka7R48=; b=gqe1TvuTQykpAnbs5syhyV19Zb0JB4DvSwyMCrZ1
	rXFdenj1qvete+UFM6GVhAF+ZGfa3lT0a2MxDs/bgjDM+FNN88BVqwFf3CsWVHmB
	Y57Rmn8/QONQhuLFez1LyzSnZYKngkJPMRQxgigpHjWJCnsdNqPoL5yhGSur58eB
	9d1bKnId1uQfRwR2iZbBOZ+T1gR3/EGdBBUsPs9hC/BQKWmL3rb0AaqDeDIKT/zj
	8Jq80h2yHDSudSYnPzQ/bXTZmvfGRk8+gjLj8XPpoj6+ckV2kX2H0lCRCCVQFExh
	P8YhLPBZTVrQXwKjfMq3GTiiZvHV7bChU/87fDDnRvuA9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avng851-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sat, 31 Jan 2026 06:40:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ab7f67fso1196767585a.3
        for <ath10k@lists.infradead.org>; Fri, 30 Jan 2026 22:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769841602; x=1770446402; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zfLFnX/pj06+42VOeKs579fAr4gQfJugqfCbVka7R48=;
        b=AsuhfqT5aTOrkyK6gkFiEW2tOeKYLVZSUC4JPeevLXElTpVindghYtXLAzemZAhpZx
         3kLULCmokgLrJoJwt3aw6ijj0G1i4uUnHWRdEnLHvFO1OGc1Hnsn2zm3PKzgt2bTw1dZ
         U4/8UNCFFtsowVjXB3CLr8rVIwP9B0pWx2cuUePtuXin/OnocGOFmVGW7QEu6SeJECT9
         c/HU+iEaNVceVs592y21fVo8pt6TBPWt+RApnAqow90ilN2VcSVFtuFBgXlxGDlt9UtG
         xeqtI3GVK4lJjJ3zVvbI+ErOidrb4O1WzEMRg9A9o9CJHwtyjSP/6Gi8pvKRsmfSsOmk
         HpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769841602; x=1770446402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfLFnX/pj06+42VOeKs579fAr4gQfJugqfCbVka7R48=;
        b=JgBO3f3cGx5f5O/Cq3lfNEouubyC3y3/UEl7+8Btzs4O0AipXVrRCCEoHNvl1W9+po
         /pibSbyQBt9McoaNy8dgHP6tVMfyx259p6GmDUeRMz1UmPN9a8TnWV5SkWxHJDRqi+Q/
         hvsTKS0CVtFDDARfHVjOUyPkEqOw1EbmynmMTDlGPA2nBwB84VwaNuhyq9oF9LFV7ZjK
         k3T2ozAjLq7a25AcoTI1iVIsp7WgEXVX5Cndp2NdrY9Orz9IcsiDdEiPyZRScIvL7QOS
         P79iBjHH3o5gH17u71TC4uVJrPi/KcSCJngW/Tr27ugG0Cyk6uN1Si+HU5Q+3HmjrQgW
         fJtg==
X-Forwarded-Encrypted: i=1; AJvYcCVSOLhlMIPqK8dpohwuzE02fGIDB94lg0Tf7S5jXqzv7ku5Wf2957YP4AKN5Nujnd1mHy4ip20=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyjDG6cCPdYV42i/ngeJWtNrO1YkO0Ii5aPbkvZfBmEiT8CtM8
	QwQb/v8fvumBZSAElyuUEvEPJenYSemoC4wD98zDjdF9p/dU2aXhSPv7+dMlERmTlhJiXkF6BHW
	6WbWP/S6hHV0ycpqvVYqA0P4N45n2AqCPeshKfp51+gWwkAd+vXRFSEYejWGTbIl3
X-Gm-Gg: AZuq6aK6wg7uF7qtoA9mp9+n7j95K0TOOkyGLQbo/vsXzjdkOWn6ZxpWLbM5LEZAfYO
	4oNJ+B5WifGfNI5PuB0dHCIRhy5gcLNp2tSIisk2yB7URAcMs7H05NqGixXCs/TB5HqdLIbKN/o
	m8z1EmWDF3BeYL4NK2opC7bjjs2EmQlAocx/ZFiKqSMwKPOhH+0RqC1R6FYkodsihURctAltiTB
	9zSTXz4WPAoi1UUJTskd7PZIo1dGAiD9A7XXuz31jRlzVS1Ocy6aObYBX11gh2xQE2VD2J/k4cA
	Xcx/23Hd9J1SwQ8wCz9LlgkWhyzHymkZcWse2/6wXiK8NFajUBFgZiHp/1Nwj2EkvaLZ67iBHjF
	B+wtGgl9U5MAw3yGvUcz/XzdT2NTKtnuepeLUWYin7gR7KohW4W+xSZxUMlMZFkroN4CeBCx0jD
	XwrrOnPXc/urVvwEJvuRypihA=
X-Received: by 2002:a05:620a:f10:b0:8c7:10cc:758e with SMTP id af79cd13be357-8c9eb2d3ca0mr723604085a.45.1769841601676;
        Fri, 30 Jan 2026 22:40:01 -0800 (PST)
X-Received: by 2002:a05:620a:f10:b0:8c7:10cc:758e with SMTP id af79cd13be357-8c9eb2d3ca0mr723602685a.45.1769841601226;
        Fri, 30 Jan 2026 22:40:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c621basm18212161fa.13.2026.01.30.22.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 22:40:00 -0800 (PST)
Date: Sat, 31 Jan 2026 08:39:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260130
Message-ID: <34lnv35rbicqk6duyqhhidunulcipttsj6ryvzw6embgablnpl@gh3wtsknmcma>
References: <ecf412bd-7bd3-42ed-bea4-d7aa837ddcae@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecf412bd-7bd3-42ed-bea4-d7aa837ddcae@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: PdyFCLflBYRBfvwe7Jqkill3eXFUEIv8
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=697da3c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gcp-Y-p2_AVPb3T4FLMA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: PdyFCLflBYRBfvwe7Jqkill3eXFUEIv8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA1MyBTYWx0ZWRfX6OwBOKrU5b8H
 hEdeHKpeJ8siRcgUVg58sXfEyhfaFA/Vo51FweT4ALyyQrEgdaEXPHHPW/HImSUDDE32nesESx8
 FDIvf0Ll83gjIGgLYdJm+LIYfULPQH6r1eWf8jkjLDZNGMCFof1yR7zy+hFUF0DI/HfPpUlXiyP
 D06+nPLnrHgBC24yJndj14eR3KrcJ1d3veO04HcVT4vnJVuLtpWEZ6dU1sX1cX/uWX532ilZvum
 EaqbZYzYvl+OiCTHficgx1yEv7s+ess0y9izkB1WFDTRv1yrUDhEZ1bd6Hew8m/qVeYaHbB4D4+
 8Xyi46sfttPOJUSDNMU6XtTrjNmnSCajPihkJxoV98jKplJyq/By1VF2XaBEjA4aemQUO+gow68
 0DxzXJwseDLWDT/kVycboJH8xOC6DiwTH70J9qPX3r3lagnrQNpb2td3vvjG+xx5qJ8rOgtTkHo
 HlDFciYtLGP4Qo0clgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_224004_916560_04B31DA7 
X-CRM114-Status: GOOD (  13.87  )
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

On Fri, Jan 30, 2026 at 12:29:48PM -0800, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> For ath12k:
> 
> Update firmware for QCN9274/hw2.0.
> 
> Update board file for WCN7850/hw2.0 to support:
> bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8001,qmi-chip-id=2,qmi-board-id=255
> bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8004,qmi-chip-id=2,qmi-board-id=255

These two were not a part of the previous upload, but... They again have
board-id of 255 (unprogrammed). Why is there no calibration variant?

> 
> 
> Please let me know if there are any problems.

-- 
With best wishes
Dmitry

