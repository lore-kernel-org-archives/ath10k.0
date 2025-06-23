Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A86C7115B
	for <ath10k@archiver.kernel.org>; Mon, 23 Jun 2025 05:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7l0WaXKSK8b4eq+N2P1B1qUpB3QaJt1KGeeB9Kc3sMA=; b=k1exfX0c13CyGs5PQz6hEUw01d
	TMfKn0u7uORMFmOPRba3RTPBMCzhivHhdccYnHU1jWx0OrN07j/zd1pt2UmpFmTMoZZA7lCvcdbCD
	nEznzmY0Fd0r1iOgqpRVXOJi9gk8fqFom7hYK73IszU5A/evqI+ltPJaKd6y2nt1mTMnQ6ghf2Yqr
	TIfk48Y/TDVcOUpqZhw+n642IJYeqJup7/nDjtG1N6DJ2LtOn4PqzR1nmyWT8goDtuhctC2T/pAwo
	KIFWVJ0uKOZ9XvPEIX3aHDRPNTbVnhVXqRZc1jX42bhDhnOmiHv+QS5YUcIyQJqhNpQupcprMU+8C
	UmszeQ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZcg-00000001bpD-0jmo;
	Mon, 23 Jun 2025 05:21:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZcd-00000001bnh-3fVK
	for ath10k@lists.infradead.org;
	Mon, 23 Jun 2025 05:21:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MLipVZ032017
	for <ath10k@lists.infradead.org>; Mon, 23 Jun 2025 05:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7l0WaXKSK8b4eq+N2P1B1qUpB3QaJt1KGeeB9Kc3sMA=; b=k7r51ujpJXOuQlZ6
	COM0hvm2AuUmIXlK0QHRh1ZLaLNfpi1TQJb6m8Te4hiiotx5iDE0KgURTooRIDxr
	4uC2AkRRUT4gUana6dqki1XFAuLL1yRE2OnM+4+0GoACJpyjv+f9rw0yy57QrIOb
	JfGlalVp5hwb5t3oBk0zOKjjc/k0+ihYXw5swYhaqDj3qQPzQtgOCwxNExi2nzEa
	VQIuvgjW6FjROHXL3y9dGILPKMsRNklbpG+yHKQHgkuX6QQ+6OWqMJ5/hfyF+uQ+
	QaEiAX95hN3gUgmZ/mcGsEvJUkmfA1v/+T3qFOrU7leHUfAHm5XQlp1qaSMyiFFd
	dpDTVQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4gph4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 23 Jun 2025 05:21:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31366819969so3486472a91.0
        for <ath10k@lists.infradead.org>; Sun, 22 Jun 2025 22:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750656094; x=1751260894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7l0WaXKSK8b4eq+N2P1B1qUpB3QaJt1KGeeB9Kc3sMA=;
        b=AAs/AhMaFSKX6gzqwPwuuZ6TGEoMdm1jAHrmlDBF0iwGatTYE7V+wL/KJ435dFIReT
         gciiyc3DL1bg1vJ9qmtpWKhHjKOdER545eN3KrsRNL5fcLKh9Zg5LbCr6ZKORlvpKAq5
         HoGvlGGS7XVVWPaXckYdcR2WADniLS017BpGNyC54CN4daJuIis/emL9iwhlp+T8LgfI
         xqN9/hvXKyNGaISuCYBBfzs8xO42emdzB4wvr0vUeCdPhD+SvgKIuSqyos4M2H1k+RUN
         TZJcRwP4dWha1QcS0G6pcsn0YeSCN49ire7uzsLfwOplUhWJURBJA4Sq1/816THS5wxn
         WZwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlPH9FVprcIGuMk6cOCumWEtgH7pQ274t5bOK2yPyjXKKxTX1VgnlxEDy3ysEdPJOQmXMFrjQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2UuU+aDfR8ZviGh4BQZC2Va4NwsDfz+vreS1SQKjAM6Gejfe8
	WorkG9ajsBsCQ2S43GfZg1xq+pgSAJr8qYV1fhYu7WasmFRIgr/g3NdmITOVPxfumbRzcty9TrP
	qUAI5wrzpuTyOuguBiMAxysjzhYAXBn0gecBdEpDYus9evPQcz4P4KzdeavfStw6N
X-Gm-Gg: ASbGncsNAPaP1MDl5+3l1US8r0EkZsObsvW1E0Woj0lqTFKhJSmJLr5rJLaw30PIy3U
	92AMRmhIqA18sMxzZyZdmirEUKDR2A/JaeS8C8/ktoMOMjiqyOSafwleMxpvVyvO5GxgcrG2W+A
	e85gc6vRgMiE5mpPuggoFS5epQEtHaeycucG0IzA78jdaUGj4By86V11WB7Hj3rE/NnDEiGhPf6
	rSWld/E1QvpTDbldB+9hOODAtqPbFxdenNpO93O3rq8lhpmvD90pVZ2CoDVMqoMdw1u37txVbHf
	pInK+hzKSMAW6zQC8bsw7YqTh59bWW7cx92KPxYqTcgZwfAiGl5uzwHES96dZ8ag
X-Received: by 2002:a17:90b:268a:b0:312:e90b:419e with SMTP id 98e67ed59e1d1-3159d646d0fmr19146365a91.12.1750656094575;
        Sun, 22 Jun 2025 22:21:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4lgU7KFjffMXbhjmtkB6X4i4vuMqMFcgqOcVorProC4mPzsKamEdzkFloaoYhhYFKhVV7Hg==
X-Received: by 2002:a17:90b:268a:b0:312:e90b:419e with SMTP id 98e67ed59e1d1-3159d646d0fmr19146339a91.12.1750656094214;
        Sun, 22 Jun 2025 22:21:34 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a2f35e9sm9629365a91.24.2025.06.22.22.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 22:21:33 -0700 (PDT)
Message-ID: <f30000bb-cec7-bd07-3328-1f11578cd1c3@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 10:51:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 4/5] wifi: ath11k: Add missing include of
 export.h
Content-Language: en-US
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vu?=
 =?UTF-8?Q?sen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
 <20250611-ath-unused-export-v1-4-c36819df7e7b@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-4-c36819df7e7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=6858e45f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=U89tM0JWt6iRefauG40A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: sJ8xIYJActAv0EyNSG0anTMgJgV1BQ_-
X-Proofpoint-ORIG-GUID: sJ8xIYJActAv0EyNSG0anTMgJgV1BQ_-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAyOSBTYWx0ZWRfX458YuZXygdHb
 K3eQESIzhNAnu5L2sVNjYday/YMO4/LOY9R4E5F3tr4nJBbe+NgnTo+tLw9t53yGXmQsUtdh5gj
 RAY1rDWKYbwi+hfmfJQJi4vb/S0iuIc6Y5K9e9am73/I88HAg22EX5lKRdD7sSAploG2lBDekTI
 2l49/lGz2z1xnNWgRjWwoVmM6+ZA1JVtwe7SjVBxjfPKm2asbaDCzWUfYjXcfl4wvHKCnuCe121
 jYqsgoIUb2kGsspoQ7RdaFze/by3dI0vK3e1oFb3ed4OpgQeS3D+xyWwOH4UfMTmWjVD0OBjVgG
 MCTDf3W5OMjFD9oe7+FQAlmwPXM0o4M2IWfUNaT8fc11Yqs2a6CESgo3Q4ycPPh/XWbq6iqR8UJ
 +Wk6OW/3XRH1Ttt2vXFw2WSMKUCwAUUKL3LU3T0Fh2PqJVnyEjoLD32KtcyWT4o1Jrdrvwio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1011 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_222135_918697_63E9DF91 
X-CRM114-Status: UNSURE (   8.54  )
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



On 6/11/2025 9:43 PM, Jeff Johnson wrote:
> Commit a934a57a42f6 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") introduced a new check that is producing
> the following warnings:
> 
> drivers/net/wireless/ath/ath11k/ce.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/coredump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/debugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/dp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/fw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/hal.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/pcic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/qmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> 
> Add the missing #include to satisfy the check.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

