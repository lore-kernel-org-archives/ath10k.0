Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B4CC369A2
	for <ath10k@archiver.kernel.org>; Tue,  8 Apr 2025 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NF2u+J3xRv/jYqarjPk3YREaPbF9uPD/ZqubOMJkE28=; b=mxlKK0OHUuXaO8cvWVdr47cXSs
	eJUlulpt+ZA7nMqQKRPz5QaCdEExUdxhPPSH+epgMRb/JVLBzZ4pEaCXeoS4H8j6w8vy1PGSegtPI
	uZH0q+XwkIGK/brvHvXIwZYvKj+juBCwnCuS4fA3B5f2kRlzlzyFJcCgJwgWOZEcBR3tUJhMNzZza
	14XImP3PhG/LtIZxhh6DA2OttTw7RQpKGSitqdSt8QPrHAPr/iioTJJUwzt+CsiHzSGlBO6gjIFFG
	R4YknMDBGvZnAEwhYXdF9u0tC5oAAsZZEDMC12Y7abOHi24ooE0x9wxYbVu9IsSXqhfEcsSdc07In
	DaShy6MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Bnh-00000004oGH-0cin;
	Tue, 08 Apr 2025 16:27:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2Ana-00000004ZgT-0gNu
	for ath10k@lists.infradead.org;
	Tue, 08 Apr 2025 15:23:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BN1YP029492
	for <ath10k@lists.infradead.org>; Tue, 8 Apr 2025 15:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NF2u+J3xRv/jYqarjPk3YREaPbF9uPD/ZqubOMJkE28=; b=GV9cJy5/gv6dXktH
	iTr4SZT3ZHPLPkuMcdGhP8TuBaGTFXPtOFpuO4Mhc8X7iIgaxHilf+ABS7c8Zuo4
	+vbZVjbk2UcHQ5QXNdfdRdB3AdIcCUWCZs4N2EBb+7aZn3A3OBGbG646ey8CC9yd
	lwUKwHJG49gWfRufKqA0iigzViGeh8AeoFuicgW27VDebTZQfMmQMS7pMF47f471
	zttAXcpSt8Y0MWYpreM7KYGS7r0CMPEOi4W4PA5yeu5lz97fwwsbtg0ac46DyOUj
	ZOErYeuyoXIrpb/Oo6iMH9LFdBPR0578l1h7xf+H0AyuOx1gnTxigdLdeyjzQ293
	P6IRfg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrg81h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 08 Apr 2025 15:23:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22650077995so83360925ad.3
        for <ath10k@lists.infradead.org>; Tue, 08 Apr 2025 08:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744125815; x=1744730615;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NF2u+J3xRv/jYqarjPk3YREaPbF9uPD/ZqubOMJkE28=;
        b=dyeTYe9zrtE9QfAX/vQea1tvcJdWeIsiMZIYqBXW+lochKqz7wU4nd3rv8erQ39XcS
         WQf/H1UA3F33soPgH3XFWcfT7oIw7Vdn2KPKTVJqcimQ4XqeFUBA3Tr4RMQAlvtk40+F
         B4vQnVD6rvrZF7os+K0bCER+KB4IPQAwd+Yr8JSlFECkaCpi6wYbH92eeAcFcMV3+9UP
         xW8QAkumdBQDA64Ef/MGF+8kYnN2VzDtsN1Ti/qQpkBhy2VLXjOCYO2KUW8rC+7CjLLG
         au4c2IoOfuMUpYY1+UcZRmMGJ5GbMun6QGahPwgPNXu68NNNKT9qm+Kf+0UvEJ/7HGsM
         qCkg==
X-Forwarded-Encrypted: i=1; AJvYcCU2OyTMkNs350UEmufLVgNnb8idIbBanW60yfGfOOjHyxxpiAaNlblFfLTTm9Vp4k7f9SVQ+p8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx14EThAIJLxigFdE/WiCIih/RwPofubODo/Sgv5fg/AQxVkYIB
	CDRyP8eSHbZ4gKaHm4pZK6pBGY9SLZ48J7JZLSXw1cLUWjMJ6JBET2AHUa18pID77v5mnZpcTII
	BFvnffaEffLVnro46pixe/lE7F1/U3iRUU4lfebPMabPuqJ2gWK8K1Na8waMD
X-Gm-Gg: ASbGncsjLfBhL3SvOk1s95EardqblwU3oFCWGXyM9wRNnkmSVsBT1qqUo7um4p5AQGe
	ZW4sTHN3Yb1zQ4KuANAOWFCBmTifwrjtNj36i/CQhDUV3x/hqJuGfgL+Z7ZJqFbn3YmzA1dxzG6
	pPEFF+fwXEO6lk0ZgHmR09+KQwPrYXS3ij/8rBkS6/QNapA88/vnIFhWIaNr5X9yuKS+ITG6PnU
	qLMsqZnwOkmbZ4EjPKF8HnrHWljHMDBtECgjOMvcHKhUwntxMBGwwQKdtmuXCOpPWH9Sxy4Wjmt
	7AcHI0Tn3tY73ir48ZsPHxWz9Z0+nKnoH585SUb/gBUA8sMQEL15SbJg8TrqA3JCE2BaqJY=
X-Received: by 2002:a17:903:3ba7:b0:215:9642:4d7a with SMTP id d9443c01a7336-22a95428babmr189625005ad.0.1744125814575;
        Tue, 08 Apr 2025 08:23:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrdN25OA1XG8KyNqW7/XlHJMumnbDPU5Qnl4hGT38grG496JV/Pr0d9saQWHGnZ0hfOM5Gfg==
X-Received: by 2002:a17:903:3ba7:b0:215:9642:4d7a with SMTP id d9443c01a7336-22a95428babmr189624405ad.0.1744125813874;
        Tue, 08 Apr 2025 08:23:33 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ad8f8sm101872065ad.42.2025.04.08.08.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 08:23:33 -0700 (PDT)
Message-ID: <ee51a503-6580-4f46-aa38-77f1b9ba6535@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 08:23:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the ath-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Ath10k List <ath10k@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250408105146.459dfcf5@canb.auug.org.au>
 <Z_R2lEVjqn2Y3_sP@gallifrey> <20250408113747.3a10275a@canb.auug.org.au>
 <26cafcbb-6a94-40ab-aabf-3c9943cfb925@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <26cafcbb-6a94-40ab-aabf-3c9943cfb925@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1zCBGx_9wS2NZslodZ9mrpv4fFjuyAS1
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f53f78 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=3WJfbomfAAAA:8 a=rOUgymgbAAAA:8 a=HC-cJF9i_tize61FGOsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=1cNuO-ABBywtgFSQhe9S:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: 1zCBGx_9wS2NZslodZ9mrpv4fFjuyAS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=994 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_082338_466551_97DCDB0F 
X-CRM114-Status: GOOD (  15.99  )
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

On 4/8/2025 8:09 AM, Jeff Johnson wrote:
> On 4/7/2025 6:37 PM, Stephen Rothwell wrote:
>> Hi Dave,
>>
>> On Tue, 8 Apr 2025 01:06:28 +0000 "Dr. David Alan Gilbert" <linux@treblig.org> wrote:
>>>
>>> * Stephen Rothwell (sfr@canb.auug.org.au) wrote:
>>>>
>>>> After merging the ath-next tree, today's linux-next build (x86_64
>>>> allmodconfig) failed like this:
>>>>
>>>> drivers/net/wireless/ath/ath12k/ahb.c: In function 'ath12k_ahb_stop':
>>>> drivers/net/wireless/ath/ath12k/ahb.c:337:9: error: implicit declaration of function 'del_timer_sync'; did you mean 'dev_mc_sync'? [-Wimplicit-function-declaration]
>>>>   337 |         del_timer_sync(&ab->rx_replenish_retry);
>>>>       |         ^~~~~~~~~~~~~~
>>>>       |         dev_mc_sync
>>>>
>>>> Caused by commit
>>>>
>>>>   6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
>>>>
>>>> I have used the ath-next tree from next-20250407 for today.  
>>>
>>> I guess a clash with the recent:
>>> Fixes: 8fa7292fee5c ("treewide: Switch/rename to timer_delete[_sync]()")
>>
>> I will try that out tomorrow.
> 
> Yes, looks like you'll need to carry a patch:
> s/del_timer_sync/timer_delete_sync/
> 
> Until that renaming patch makes it down to my tree and we rename.

NM. Since the timer_delete_sync() API is already in my tree I can make a
one-off patch for this.

/jeff

