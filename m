Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C44EEF06ED
	for <ath10k@archiver.kernel.org>; Mon,  9 Feb 2026 02:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtPBPWTA3XhB43g46fBcIikn2YEjSoXjfsxQdVazN0o=; b=Q5/yIgGBr3tBMxIOlr3srMVAoW
	pIsXZXwOBWEqWdb7VkDVNnVgMOBvFUU2ccJZMKcw8PCT9d90djQ+zEgfFW0pqWDY+oLISwsHarhfh
	ncCCjo+zBxdk/WVpMqc6xQgdRS7uT14ARQHALrIHhXRwmF5I/5R8JpqBF/YPZhBdanz+G/cE80gOW
	5oAOOMogeKni8eUqS96qnyx2y7KiVZ66FqfgSTl+Skyq2NrYHnb/d7jHGQx0RjKVVpVjWBd1jPi65
	97JERqbk78t27B10vRdMlOU3BOjNkM7tYf+ZGPch0He85VmGLRnEN8X5xbE4bivUDLcXAoXD8KFZY
	vu0PZbKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHGK-0000000Ej9n-2IKj;
	Mon, 09 Feb 2026 02:44:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHGH-0000000Ej98-3Lz4
	for ath10k@lists.infradead.org;
	Mon, 09 Feb 2026 02:44:31 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618KtmV71483873
	for <ath10k@lists.infradead.org>; Mon, 9 Feb 2026 02:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jtPBPWTA3XhB43g46fBcIikn2YEjSoXjfsxQdVazN0o=; b=mtJIPmOfY0ihPILH
	CcNKTCBXcjLho4W6CspKPIKiEUfP1HUtfuJUBTF0auy2Zi9DrpJfvcwHBSFMOJge
	bt30O3DjDnCfOljWWXlQklH8JPauKx0FjIbrLQDhvbLV4bksdDFyrceZZL1Y4TBW
	ES74y6EJG1+GeuPA2E7QCk6j61sc9sztXDA9Zqc+pqB42ojNpqZ6pRinljfRfpGc
	/UtfTn1iOza4SfCj5rI2zRwyAWCLVzZC5OgTCXwshpqs45Mkrlh1tnxomkV25B/u
	O59Weg25LNA3RHxSYWsNLw0cFn3L34vrPpGexQuZwQE6gxcEA66ulw8SNQmQ9P5C
	Lk9zfw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xccuc5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 09 Feb 2026 02:44:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aaf2ce5d81so6182095ad.1
        for <ath10k@lists.infradead.org>; Sun, 08 Feb 2026 18:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770605068; x=1771209868; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jtPBPWTA3XhB43g46fBcIikn2YEjSoXjfsxQdVazN0o=;
        b=GIlFjj0DIbI9KDHv9BD4+1502F8dA5URqO2KvcDfJ+mPPtCTCML3zXXkDWmuImMIMt
         yYfNA8p4DsgGJBLtBgQaxYBgrNxD/RT4jWQ3zTGe5FGqta17UmmDT4xUhftjw/kJ4z+O
         428bMJU/arswsX0WWoZe4geRWJ8scz8JgHwp0/riBcuuqZ6unxVOtJ7nbamF6IuI0Kcd
         RwukQd0mHzhrgui+gRzHIFS3y3/NBuoIGYuzFxUqfUHgXmROawarv7OAy4UPc8XL2HnA
         jRrJWEIC99D+KeVH1xBO+DBLs9nkOn5NDc/FDvqqOM51fuEF5ggeE8JU5qwpmDJA9yVw
         sIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770605068; x=1771209868;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtPBPWTA3XhB43g46fBcIikn2YEjSoXjfsxQdVazN0o=;
        b=fZX8tQAH4YjcKeshhoDTQIMO0ndj4FVwkMEMvFK8hYyNowxhYRmVLa47qyK3v7FaBn
         zeb0EohFUwtGPlDZzp7uCCeRu1sCQBo1HKc/d/+TRd8JkqnyoSROBcGZsxIsjD4nYb35
         NJ2MFKPsYL+eiimlRyXpzHJMCyNq9SzWo4PpFmgEuShBWSc72ovtYCvpmQ6f7qIRsG+L
         xtwARduky7WLUv+Z4X3o0YWAm1rmQsI61AoiUdrRAsRD7DCBZw5CuytlqaaXra28LJIB
         60sKRFAt44xPpek4+N3kLe45311+is2EXguS1TWWtru/4FmoFynQgs/erVtB6jl+oy/9
         HCQw==
X-Forwarded-Encrypted: i=1; AJvYcCWNNt7QEX8fuw2foWuDsbHM66I6eABTiPWOXzU9sS6adplepwi3yQTCU7694LQ5NiBhS/ePVt0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2wqgIGHK7yHvZh2PDbdgONXL9x18/DthU2wWeaZ3tivAG3lEU
	b7WT51w+1jSbs/R2F6FkwDxMwabZcDL2QQYqdaaACoD7ddmSvVfqTdobu6kd5EYZ0biIw7H2KMm
	dbTzOVA+MY9PH8dAk+RvgRnP9MgJly9v3Axnn5jV7av5p0zMQc8j6Ii7VeoKXIO2jeKiawZyc
X-Gm-Gg: AZuq6aIfjzFQt245VTkz/tapy33Thp9q+39kErZV7MtqL90jvHrp0zQ0naYptOFT/17
	fpjmNDgucIJpP+J8QwpUNnGjDDhSEjlLXA9muRVFclCYPuDXSLo+gfF20s6NGtRwbtyDEC+3ZKJ
	PkXo6u2HDNzaUAepXWF+XSogclasJibtNQPQ4PqoWhaQPHCEhseoL8C4OHPWb7GCFfL3Dgc/E7X
	dsTNLwaeJymgfMM1iZWiCgZHwPVkZyRMkJB53CTA/orC3jwpoFxn0jCDuVip6Jf2ubdopkLaX5L
	aFxO32u4vsT4ISf7ICRvzdOkZ84tfJYGsVsmj4YSlOB3ddEVmP4u8Uqd/whoUlULfoJANbN20K6
	+Qa0keyKM2mKDBpHZQgfRE4DBfDFva3SXEl7SwYc=
X-Received: by 2002:a17:903:40d2:b0:2a3:e6fa:4a06 with SMTP id d9443c01a7336-2a9516f5730mr112529475ad.39.1770605067902;
        Sun, 08 Feb 2026 18:44:27 -0800 (PST)
X-Received: by 2002:a17:903:40d2:b0:2a3:e6fa:4a06 with SMTP id d9443c01a7336-2a9516f5730mr112529245ad.39.1770605067387;
        Sun, 08 Feb 2026 18:44:27 -0800 (PST)
Received: from [10.231.195.112] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9522287d1sm84336715ad.91.2026.02.08.18.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 18:44:27 -0800 (PST)
Message-ID: <5c152304-853d-4142-8553-55cd8907f271@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 10:44:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New warning `ath10k_pci 0000:3a:00.0: not found station for peer
 stats`
To: Paul Menzel <pmenzel@molgen.mpg.de>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <57671b89-ec9f-4e6c-992c-45eb8e75929c@molgen.mpg.de>
 <6a83fd12-edd8-4559-b7ba-75b074fa889f@molgen.mpg.de>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6a83fd12-edd8-4559-b7ba-75b074fa889f@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAyMSBTYWx0ZWRfX267hHYG34v7N
 qScd+vta2IKrf2MMUHcypYaj8rLS/wWa3OzInLX4QK89DWwCUfDiuaRI5VBhgA75M9nH7f1uRZT
 6vDqE0Wd4R8PdlTAMkYQWcolT2H40kXMsaucbUDVYd5meVa4muDlASJAsTTGKKoCvRSlNs5FBYx
 yFHhZG06GWX/X2Xlu4/I2UbHqC1fCb1fIwR4pDwMdThPAGWApexaAoaezrnp0+9dCYb9eB9jgGe
 TnxsyNFPDESKVIjgAvVC8u/28LQyQjc94k5VJHPk8mCTB1hb7MILLGSfaXqqPP4jG2XprzcTlhM
 5mgfszP/x7/ngYSgy42bGOqj8StuLf/C3F4t0MQgwiSSVS8a6EwUYkT6EZ374UCnNkhLJz1RdJF
 J/inzRwANeOINl/NXQ3PhAR/IKXEBNAglN1HKvF0lSY9MUjqPJzEkPd7cx3OqDIo5/X/HldEMg4
 RMF9jseD8D1vj+DUrSQ==
X-Proofpoint-GUID: hhA2nKgt3SiW8LazPqCihsFBIJtItSNz
X-Authority-Analysis: v=2.4 cv=ft/RpV4f c=1 sm=1 tr=0 ts=69894a0d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=N1rzNnEruoIo7urGDNAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: hhA2nKgt3SiW8LazPqCihsFBIJtItSNz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_184429_874430_6471FE24 
X-CRM114-Status: GOOD (  12.11  )
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



On 2/7/2026 1:55 PM, Paul Menzel wrote:
> [Cc: +Baochen]
> 
> Dear Linux folks,
> 
> 
> Am 19.01.26 um 17:41 schrieb Paul Menzel:
> 
>> Since January 10th, I have started seeing the warning below in my Linux logs, that reach
>> back to September 24th, 2025:
>>
>>      [   37.108902] ath10k_pci 0000:3a:00.0: not found station for peer stats
>>      [   37.108906] ath10k_pci 0000:3a:00.0: failed to parse stats info tlv: -22
>>
>> It started appearing with 6.19.0-rc4-00282-gb6151c4e60e5, the version running before is
>> 6.19.0-rc4-00003-g3609fa95fb0f, but I do not see anything related in the commit list:
>>
>>      git log --oneline 3609fa95fb0f...b6151c4e60e5
>>
>> The warning log from `drivers/net/wireless/ath/ath10k/wmi-tlv.c` has also been there
>> since 2021.
>>
>> Do you have an idea? Please find the output of `dmesg` attached.
> 
> Looking through the commit list from above again, commit a203dbeeca15 (wifi: mac80211:
> collect station statistics earlier when disconnect) probably introduced the new behavior.
> 

is this error seen when disconnecting from AP? did you try with that commit reverted?

> 
> Kind regards,
> 
> Paul


