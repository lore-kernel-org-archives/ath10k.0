Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE16DC54E65
	for <ath10k@archiver.kernel.org>; Thu, 22 May 2025 15:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdS4YPTeQcLMqGWS3uWoTExyrGM6JzmerMv3Q+6wR2A=; b=10RzNNuPtFF8ftn9aBHaQxXp9H
	F3YGORpztmkBkZ7n96tRY/7GfEKpwP0r6EC7EQHaCLfPRBTo5EKH0lsMTL98x8dWJ5UM1HixSZFMN
	Jl/CUZoqYx9BAMbVYY3oD+G18QlomMmXJhoMPc/kWxZrNaxbS8Cml+mwek1Qhbwz1JR+mO0A/MLZL
	Rz1W3AfMLMwvB/jH99C1yzJJt2qhy1sn0RVAERIkeDc4/Tq5Rhl8js0R4hwUFRr5ThOCn4D6VwyTz
	cgy23qQv65ntQgPBSXkF4LlJ/iyGC7o8ncd9AX5SxtASRBhhY8WqthsyVeA7yVoVtWLl+LZ6tddFr
	0zF7ogAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8Dq-00000001VA5-27tB;
	Thu, 22 May 2025 15:52:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7vB-00000001RyW-0lkq
	for ath10k@lists.infradead.org;
	Thu, 22 May 2025 15:33:27 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7O2NU000727
	for <ath10k@lists.infradead.org>; Thu, 22 May 2025 15:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MdS4YPTeQcLMqGWS3uWoTExyrGM6JzmerMv3Q+6wR2A=; b=c/xeNK0ThBeELsAG
	6YDWTAWa5ZnhTXQfX/rwM8997h8/jDaVzanjoVzUd4ioO7M/mVhQo20Eaj9NnIX4
	fDAXCGd4BtfGxeWKG4Y4oV0SS8hGAyD4v2dUNTQ6cHz5CT5viwV662+4Mvx+1tbd
	EJLiGmAKcSOy3ZJQU1UWilnLtA7QWo1kdsVrRnNdQl9LcFPscZ39KvREKb5fuXAA
	wgTtgNEB+3W/VgBeJob1mxWtL3EvYNwTtCEQpxZIblYI3uKHslcDQFZur06XkZ5z
	/txn+RJMPEflJ3g2ro6HIHZLAnoWKi44xMn9PrJRi+05yCm1uLP2FuBbTi7AJq4q
	CyYucw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tn6fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 22 May 2025 15:33:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22aa75e6653so60340875ad.0
        for <ath10k@lists.infradead.org>; Thu, 22 May 2025 08:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747928002; x=1748532802;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MdS4YPTeQcLMqGWS3uWoTExyrGM6JzmerMv3Q+6wR2A=;
        b=XfAPE7bp+IEuGGFcR0TFvH4FIjd9TwcUQoNaIBgYXhKrZykqKryf/sJOpA6ReabccN
         8BhGx4Oo/Zm57IBYPKjmaZ6gKNZDjbUAvvvLJJ50aAryZRYetdiqAR6u+Sid7d4yDf1+
         EIl3BJAM25s+iafbC64XfgqpZ/yOcSHAoOm+sIM6hV3Gg3vMjlmI41LgnIfv5jXBqFTs
         0A8v1SQvLbxfU3SbIoK7nq41fGgy5lhUL3tGNyd1ly0y7ZbQtGFWCKbNx9KmjAhBIdSs
         v05aObj90G5+yLPWnlETxSKCDMr/M5p5kMF2XKFAQwCer9Y6K+Trr1Xtgaj276KdLx+c
         Mdiw==
X-Forwarded-Encrypted: i=1; AJvYcCUsDjupICHEcqbYAxFwdbS1nDnsVoJczBI/75TTO7DAZqh1EmtX67GZniM6eCGTKfWkZGZaGTc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7Cv0GkzNF3JBnZwLLPlIjSHEFLctw8m4Tuz5d3RhDS+e4KVdy
	GUBDwowf0TLmlRGeAeIfq8IqwcDdcBDm8n4+Lqrfe1WiJoGEGYTNP9mV1yfZBUO9LoBhvn8g4LP
	j9pneYo0FvOn1tlzO1wbgoPGHbv/+Vs+367++yJnrFq2kRP8Nf8bnMkaJaoDhVJ+A
X-Gm-Gg: ASbGncv8eDn4cGWaVgbM7leYj/b7wEoLGkqPOZx/yM8khiiZ63whQhucsnCDN79+htt
	+iatRxTH+C7M8+C3hyylWoadnaQ44k0np/jTMAKZ16YL+c8dv91AHrbJFUGBn9c7JIBP5wRrM5W
	B32lBQ1MDpUTrVDyPGXs5GCWKCwIhD9wbHS5zPLvjoi4tVvcKEAP8bGNIFBVsfsRGHW0LCBMB6c
	BAfflo/q6BBQ/0ktshixG9Eh7KBDt2p1uyhlNOFtYL+0Qo8ROkVsDrvGOxkNX6BCp5Zl2oOdMe2
	aZ8RO3bM1ohQs6DY6226fN42dlnHwWWJfHXUPiVDALS/GiStRxDbJQ6GVgs+NPDXlaKMkE626DE
	2Rjus
X-Received: by 2002:a17:903:2303:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-231d4524c4bmr360572935ad.23.1747928001979;
        Thu, 22 May 2025 08:33:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkNByRwc0A0/HzOKP5rJ7ZbRS9XUCdJ1a7kCjVVDtfqq+Z01Gf1iVCby5DmblLg9YPnnWZfA==
X-Received: by 2002:a17:903:2303:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-231d4524c4bmr360572485ad.23.1747928001504;
        Thu, 22 May 2025 08:33:21 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2982c04d12sm4399479a12.21.2025.05.22.08.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 08:33:21 -0700 (PDT)
Message-ID: <22c8e651-8feb-43a7-9a9c-b028e4eb2358@oss.qualcomm.com>
Date: Thu, 22 May 2025 08:33:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: Fix unbalanced IRQ enabling
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, jjohnson@kernel.org
Cc: kvalo@kernel.org, quic_svishnoi@quicinc.com, quic_pillair@quicinc.com,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20250522120954.605722-1-loic.poulain@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250522120954.605722-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682f43c3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=iGDt7Nnd7u1T594T9AEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: drA5Z5zNLhblOgbY61snhjy5aTCcYGKq
X-Proofpoint-GUID: drA5Z5zNLhblOgbY61snhjy5aTCcYGKq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1NyBTYWx0ZWRfX9wpcJPb1Ws/e
 NToRcfXRnqiHoPj5g+47wYfMRy8ceHcXl6eCQQ4i1Z/frX2Azeny1O6F/7a03EfjmHHoaxVo1nP
 1OTNpmVE4XTOxs9jke6lOYC9YRgqWg9iO++2B8pKIQDkeQX4xmFDxU6+ejl2zslAmFehebGcEXr
 jrwvpoiJzZ+s1PZ1H/Mu39ScPbsdmt0+PyC364b76Me+7pqT9qgRlJpfsfwdBgTpvdok4WOeSww
 rczm0g5RGAMQv/A8K1K93oGeDR0btqtt9s43DEZgoDvZK73saFcAQ6N+RILo92iPaKxUF2pByzf
 vAJF46XmOgcrAoaorzr0cN+GbZo36KmeB8etmQBI0r+h5SobmkPf7GOXOXPNzId1/EWmStLj24P
 4y690FG+yRJtqSf4SL5QanzBkhMcdBKSQXE74V9aT3POXegdeqKhRiq1/nZEt+y9+rVM2SU1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=634 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_083325_396734_21EBB859 
X-CRM114-Status: GOOD (  21.41  )
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

On 5/22/2025 5:09 AM, Loic Poulain wrote:
> When the firmware goes down, both RECOVERY and CRASH_FLUSH flags are set,
> triggering a full recovery sequence once the firmware is back up. This
> includes stopping and restarting the SNOC interface.
> 
> However, this sequence leads to an Unbalanced IRQ warning:
> 
> ------------[ cut here ]------------
> Unbalanced enable for IRQ 112
> WARNING: CPU: 2 PID: 120 at kernel/irq/manage.c:792 __enable_irq+0x4c/0x7c
> CPU: 2 UID: 0 PID: 120 Comm: kworker/2:4 Not tainted [...] #234 PREEMPT
> Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
> Workqueue: events_freezable ieee80211_restart_work
> pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : __enable_irq+0x4c/0x7c
> lr : __enable_irq+0x4c/0x7c
> sp : ffff800081b3bab0
> [...]
> Call trace:
>  __enable_irq+0x4c/0x7c (P)
>  enable_irq+0x48/0x9c
>  ath10k_snoc_hif_start+0x6c/0x13c
>  ath10k_core_start+0x360/0x1344
>  ath10k_start+0x100/0x8fc
>  drv_start+0x34/0x58
>  ieee80211_reconfig+0xf4/0xfc0
>  ieee80211_restart_work+0x110/0x17c
>  process_one_work+0x150/0x294
>  worker_thread+0x2dc/0x3dc
>  kthread+0x130/0x204
>  ret_from_fork+0x10/0x20
> ---

this causes git to chop the description at this point, which also chops the
tags, so remove it.

> 
> This can be reproduced by restarting rmtfs or triggering remoteproc restart
> via sysfs.
> 
> The root cause is that IRQs are not disabled during SNOC stop in recovery
> scenarios, but are unconditionally re-enabled during SNOC start, leading to
> an imbalance.
> 
> Fix this by skipping IRQ re-enablement in `ath10k_snoc_hif_start()` if a
> firmware recovery is in progress, restoring IRQ state symmetry.
> 
> Fixes: 0e622f67e041 ("ath10k: add support for WCN3990 firmware crash recovery")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c | 3 ++-

My Qualcomm copyright checker flags:
* drivers/net/wireless/ath/ath10k/snoc.c no QuIC copyright

>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index 866bad2db334..e15e1ab30458 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -937,7 +937,8 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
>  
>  	dev_set_threaded(ar->napi_dev, true);
>  	ath10k_core_napi_enable(ar);
> -	ath10k_snoc_irq_enable(ar);
> +	if (!test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags))
> +		ath10k_snoc_irq_enable(ar);
>  	ath10k_snoc_rx_post(ar);
>  
>  	clear_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags);


