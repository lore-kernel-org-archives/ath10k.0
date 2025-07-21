Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F6EC83F1A
	for <ath10k@archiver.kernel.org>; Mon, 21 Jul 2025 21:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r63NxAvu5OQlg+2S4aOi2Tv2QOJTatjH1p+X5yIH4Xk=; b=mGKzkEG/wNLawIqt1Lq6Z77NFK
	fobx+FZuJgzDgvVEemczyl90OGfI+Pq8SxWrNBFfBp+/6aFSBi8P76y2h3rIfCvxaunlm7OHNKBXS
	e91h3HVT94w3c5k4heUctomAPsn/jSFsxGLUD4GqXjhhkNV2TTPn3rFxd8PaxNAi2wzF4E6Tvsdk4
	YkJTO/hQMOC1G3qOvF9KDrDRl8RdLr3lKKpM3v6+3ID2KZAgGnXjVEwfIu1e4WJRHj+hAOxyG7M+q
	NBLIpWmvmnxBR0DGDMIJ52/SjPRBci1x62VjkGcKJhtj0jZUGq1RdAhbDIDferSgV+klX9gRpkg84
	191aafzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udyBz-00000000kC1-1vj8;
	Mon, 21 Jul 2025 21:37:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udyBw-00000000k9t-2UUD
	for ath10k@lists.infradead.org;
	Mon, 21 Jul 2025 21:37:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LIgfN8009366
	for <ath10k@lists.infradead.org>; Mon, 21 Jul 2025 21:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r63NxAvu5OQlg+2S4aOi2Tv2QOJTatjH1p+X5yIH4Xk=; b=CkpBAkugkBWBtaMd
	JbN4yui3KjUwp9bZc+j08xEy11zB6Py4ClmKHcg6Vgk6UjIVJUGOgE5oFOmPHLBh
	KzYEmPzFSWXo56X2TfCchlM0lXvx615tbjCF4GYthe8+amK8IhUsI8Uv1+cP8VvX
	Z4PN0ocaIp4QAgwYKdxQZow3Mb8L3XMyRxot7dPzHOBQsDWbnenc+UNo1Ujjf3XC
	a4kJjSqXdDnyds65grAIalfVQhVeld/Th6LVQT85ZE14mmyL9Nt0RZAeHBEK0ctV
	c1QlgZofQ5HxsQohNPr8D/WzQ0HDqmvgZz2eQ02og8G9PDXLewcqmMie1DKPnNLF
	Y42Zaw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045vwjxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 21 Jul 2025 21:36:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3928ad6176so4114124a12.3
        for <ath10k@lists.infradead.org>; Mon, 21 Jul 2025 14:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753133819; x=1753738619;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r63NxAvu5OQlg+2S4aOi2Tv2QOJTatjH1p+X5yIH4Xk=;
        b=rV1OrmLMjewQxeOBe/66CqSMRH4QmW8f2HqZZ7Ls6PogLhc44ey5btNQECq2pRu2xa
         8SimozjESU9V2ioHnHyBhS32ZloCrK+FwkmX0Tlbnwk0dQGFPJRC2Hc7S9He1slvv0kw
         AgAG4LvQKEW0CzlAdLyg2C3K6rjqsIwi4JpNfHBri5zxu62od5UyALEjdQz9H4bPOWrz
         +hr+yA0IpgFI5tutqNcUTS0FWd8Y/CDe5/NMsGOjwpEz1N+8IGqKcklunYcVPM3WSDz0
         SK4tRAdjEh24kIp0r3KtPpLGIDL7iwxZaKhWOd6fp+xDun2r7FuQF+Zf+s/98n7fmzUp
         MYDg==
X-Forwarded-Encrypted: i=1; AJvYcCX9KwdUUHMCL83VNsHE7QTRXFAMln20VjWKjycTotxHxCxgWZUCy7qep4qIYWvnh+V8YnW1GKs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUIdWpAsF0h8WWmx6x3/coYuqAmnZ4OY1VOfSN2/I788P3k77A
	3T8brXILoTIlX4axNP0R5j8fBsT5nQbXydVEVEhr4wFgVNKA1MQ3ylWHUKTuQOKiJAZtXrr9rku
	vfJUiIffeQoRP6H+yo5xtn69tY0u7IiYdSNHDTwpObrIdb7G/HezX4MTRCUVFRby/
X-Gm-Gg: ASbGncufguP6N/P78r7ZYf9tEZfZeYGB6y2NCsVzlF2Cp9Zkyls8x/SE7zFCRVZvfM1
	ab4X+mDePcHgDiPQaltvfhGa6KACEBv7w1dWoiSA6schzDBFjujAvqa4kAbej1FFy2ohCtLqd4D
	Q31HbmpO9uLcKSDg9NeQimX1HOwdYMUkK7H1yCJweETXSm0rv/5Cb7moUH2XgYvABBRJ019g1hw
	mon36w1Xr5qahlLCNjogrsE5URV/WZr4iSmxXjWX8HhZL0d6uYVcaHSDIJPrZmyWQpp3nmir5DY
	lM0y02i02DJTL56gFjtxjr5aBk3X41h4JKKVy8PsfxS+SGvW3DbWrP1zFEggUO/z/DYu8sZ2JYG
	B
X-Received: by 2002:a05:6a20:914c:b0:239:f85:b885 with SMTP id adf61e73a8af0-2390f85bf1bmr24817655637.17.1753133818958;
        Mon, 21 Jul 2025 14:36:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXX5Z6w7xxmYlkuSGuDhtVuyY901rFA/aeyB2IgnGsJVaNpVrBJt7tGe9mzLX4Y3pJUc2T8A==
X-Received: by 2002:a05:6a20:914c:b0:239:f85:b885 with SMTP id adf61e73a8af0-2390f85bf1bmr24817630637.17.1753133818557;
        Mon, 21 Jul 2025 14:36:58 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc68046sm6201934b3a.151.2025.07.21.14.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 14:36:58 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250720-ath10k-zero-brace-v1-1-c1ee818d6238@oss.qualcomm.com>
References: <20250720-ath10k-zero-brace-v1-1-c1ee818d6238@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: Prefer {} to {0} in
 initializers
Message-Id: <175313381786.971667.1205072057690654219.b4-ty@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 14:36:57 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687eb2fb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=AJeZmiUk7byJ5J677osA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 46MeU_4wOnM4imh-dNHpWSyf_lX0WI_7
X-Proofpoint-ORIG-GUID: 46MeU_4wOnM4imh-dNHpWSyf_lX0WI_7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE5MiBTYWx0ZWRfX07n9Jbpe1ahF
 LhuvhHYLiPA1jXisK/k1PbFNRa0Jr/GltCX29lcCV8MC7o+yiRqy+kaHcTFi8GpNeCSUgy1yY7M
 0c1qHoza1q1L+wT+1c4DLUJIZpaOv45crlPyROy12nNL1scQ08HBc5QbbjuWvdyqsyPn977M36F
 sMpr9gjfkIoNBIvtTq4JbOd5/Cwwo+lyowmOD9G2xl2sdKOevlsIjZlqXdGOAftWR3WR7p3vh0D
 JIg8ZfGsRmeHbjdKaG7Kr8ll6XbY1sX2X2TytGeVLTTyh9nPH/5MNI+pXFNmIqn6R3fW6HWpg0S
 rAskEPRi/E7pJhi9/PoSqWPByThHOq/kyocq+QZnsVLPwoj3rGqifIG/XYeo2ThqnWvbr4V1PPc
 jrgUuRm4pyiUYUqTpI8eLiVaeAORwQcfvU96wkXx1Gcu7W6J6u1ntSGvaxqs7vLdHB3jv2bH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=683 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_143700_668133_AA432C32 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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


On Sun, 20 Jul 2025 07:46:15 -0700, Jeff Johnson wrote:
> Prefer {} to {0} in initializers since {} works even when the first
> member is not a scalar.
> 
> Generated using:
> sed -i 's/{[[:space:]]*0[[:space:]]*}/{}/g' drivers/net/wireless/ath/ath10k/*
> 
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: Prefer {} to {0} in initializers
      commit: f0b72d15265e877a02427e0062a72ade70ee6f86

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


