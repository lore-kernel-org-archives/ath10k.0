Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA37D2ECEF
	for <ath10k@archiver.kernel.org>; Tue, 20 Jan 2026 02:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWVrONhNkRKop7EJAMtYhflVVIJSJFtOH6r8DMGCIB4=; b=T/o/YiRo2w9ASx4PscL1WWqnWp
	pCF+BwZ/0pFGcEH2kvuYZDjtjM20+txYHueTnaZgA0FvDyBHrJ1rG8YA26dQu7ZZzK/NNeWuBRRtS
	TJFH+ZYBMdb/ZMVPnW/WmUODC5AiU8r9Pnh2gk6LqNqAzWAhA9dCzSYpVEBVgC0rBi6wLpV9sY0qy
	MwDeQv/35H/UNl+tRgSdbCGiUJetsttuNfhyfQj6ishdoDOY9lxyWsfk47471qLjyVR1122rqaxwa
	C3qhG3lpCnGA/kRlI4B1q7lvtKN+A/mk9ib6FAGV40UixxIdzkt4xE772fiPJvYEzvLHKx5FgvT9d
	LVLiNg5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi16v-000000034pc-04K3;
	Tue, 20 Jan 2026 02:04:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi16k-000000034pE-2ZKz
	for ath10k@lists.infradead.org;
	Tue, 20 Jan 2026 02:04:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JH7LDU228017
	for <ath10k@lists.infradead.org>; Tue, 20 Jan 2026 02:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YWVrONhNkRKop7EJAMtYhflVVIJSJFtOH6r8DMGCIB4=; b=EgdVRAhvaXXsObwC
	HkpGeOhIO+uPo+YpzfMtgsNmG+MdGHc7KOHSR0WDWAgD9rfOqgKTYhawjeBuslt1
	ENBPAnqd4FcVaDPvbTQId00EnO+gldJh2cN3TNJ8SlmX0fiu2hjh975BbsgRb+zo
	dBJGfe1McGG5vzLZTBXJbmeI+2OTVeFpVxndTKG6aDuHi9LemFfMSYewE29ig0Zl
	FYkLfacjxsozilZ63iXVlcbdvYz0eZ4jYZaW6EcH4rQmZHJYPU1wQTjwl54BP3Ye
	G/fwc9QPt1qGD1/ONDuQF55V6GWPdwl8QMBLLDl/JKvwzlTy+V8PpwWiV7JIRU30
	y46HLg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfrann0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 20 Jan 2026 02:04:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81f5381d17dso4035153b3a.1
        for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 18:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768874676; x=1769479476; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YWVrONhNkRKop7EJAMtYhflVVIJSJFtOH6r8DMGCIB4=;
        b=K1EjHzgxTe1GtbX0m4ffLXCOFQ4lsUWI1nYhSh66hVdk7Sw6dTkc4nImjqGmCBl4IM
         Xw+S0wE/tyl612v1xwe9sxXIr0CGDxqkzxYV2Wr8jaxIU/5Uz9Re3s4QhwQUuxk4AhIY
         6qEfHOp74tiT/ggeTHz0rFb3v6rrP7nwcdZPQrYgs7VFXjL/T+JLctTsw39ptjCmc4iL
         ExkVqZWJkmdFbEjaCOu5Q74d6qNwmSSKomC7vtDw81ZtC14aeRF33ROJjrSnSz8yl39s
         u54mgBYtTaqGODBf6lSONFvelnDvkB6YnaLdqMh7Er7jGQLoXSdOxFb8ayvs+Q5s636a
         vz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768874676; x=1769479476;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YWVrONhNkRKop7EJAMtYhflVVIJSJFtOH6r8DMGCIB4=;
        b=FPKqeTIrIlM/LJMyMxGx9UKinIoA+AbEb9ovKHL3PUV29SJM2kH1NNNNgft7IdCqjF
         Yhn6108kjoKBPyWDAH96RHfNIwVO8VPYuEWhsgEN2Rjelwd3fN4M6hkV+J7Kw6TgXC5Z
         qxSAcJdUBPHTS6jc7CQK5t4ezJiKDu+Jxn3RshWqFgzfcDmAPkCdzgEtslYcuM1UUkeH
         sf7+eiXargpCuaijC6ZlHk8K3lB4tiIe92L2qdGis6Juv6wCfVQmcqpHiRjcGe1xH/c5
         Y9ryl0/sJMJawxoHp4IWaxcmE64n7TfNNkXTUXnEGpNb2cgJ+FZZoNeKar+3DPg4vrEd
         LW2g==
X-Forwarded-Encrypted: i=1; AJvYcCU/6r+5c6iTu7tgIfT0dkxvEh813rla3p8Gb+kqXv4LgCYWCNgi588pUnktHv75ZlmnV5mUOCU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxluSS7rmzMMJ21GgOqnr08ojg6pypWJRX7kXPRhlHqxzVlwk8s
	Ucjpa9aEZeQpyhrR3D9sfJCPE/IFI/zR+4V18QPL/Yl3YpF5dkcODNIwk3s7uESVp2PtDzMdcWu
	V1y9CEFTxqZn81VlE8xiVPEFtEZ8hvGn4CaJC+kF3v1tBDPuGNaRMv9cB453Ikjgr
X-Gm-Gg: AY/fxX4prZvggLb1/uNoU+jBhPWtSI67tH6KEPWfmjolqHmPxJ9mr8nThIARADpjfVq
	isiDNewnsI/MzAwxX06oIpdj4CpsRDj0nrnis9z5EoRXeTUehBZSHTOgfeCBtKwzLq+RD6CeegY
	IfuOIJeSXmJJ7xaWEBkLD5kdHLMZ5oAsK+5dkAlKb5BIzCbWjFtqQRtkVVqcEb5rNmHgeBCxxZw
	jrlclCrJUcBk1uvIwTC6AR+PM8qypJe+AAzKNHx1LIoAIcF+eOyNjWtdUm/867ICWyp5+TJZ4X4
	O7WmAwtllNvr5IGbbhBxCGMcoWttlJFXPOvngduYU17KyMm3/XoEFwF+v2r21jfozTEUEhYucGp
	GCbFYiHUi8r4vD4jgcf7a655D+M3vp7MDR3PuBuYLDoHGGZtV7gyIuBGbc13R4Bsiye+OjMkWse
	vNNl+OYJ0=
X-Received: by 2002:a05:6a00:130f:b0:81e:fb11:96c3 with SMTP id d2e1a72fcca58-81fa184d473mr10532138b3a.52.1768874676475;
        Mon, 19 Jan 2026 18:04:36 -0800 (PST)
X-Received: by 2002:a05:6a00:130f:b0:81e:fb11:96c3 with SMTP id d2e1a72fcca58-81fa184d473mr10532119b3a.52.1768874675994;
        Mon, 19 Jan 2026 18:04:35 -0800 (PST)
Received: from [10.133.33.150] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa1277971sm10156009b3a.41.2026.01.19.18.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 18:04:35 -0800 (PST)
Message-ID: <11c4a76f-c484-4cc7-ace5-a44f69ff351b@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 10:04:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New warning `ath10k_pci 0000:3a:00.0: not found station for peer
 stats`
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <57671b89-ec9f-4e6c-992c-45eb8e75929c@molgen.mpg.de>
 <6655c609-2b5b-448c-8cda-cb4a97da64e1@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6655c609-2b5b-448c-8cda-cb4a97da64e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qrDuObJLnduZ5GfW-yYW8mMVyTUYfC0c
X-Proofpoint-GUID: qrDuObJLnduZ5GfW-yYW8mMVyTUYfC0c
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696ee2b5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=N1rzNnEruoIo7urGDNAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDAxNSBTYWx0ZWRfX+UIVS/U9KzUY
 ++ayTr7Lg/E6IEtDZwsEVul6IyhuA3pFJjo1wRWKna/Wm6T+1PvIDXi7IY11yQKjdIfnPPrNlnX
 T6CbsObJkHqXKdyWoM4wH8tx2hUbkLOqBIvA0PdsUlff+cdCB0WaHCeC0SH1LMJmRf+KaekgtIx
 aU/t37KZXtR3QfN/vckwDc3/nJexMDYro1krHA6f1UPdNqf5bhdp3vi4XrVmAtEMUrFSkCQY4U3
 2ASvpzz2vP+sM6/stNdNoSl49K5V8JsbtuBxIOpPvCNWV26QPX/25Crl1VoFhMGrMtKpFQ60+Rh
 B1tEBQQyRlatHCEx4FfeVaqZZFXE9gvLtQbO4LHSda5Ohx7e8dJXOwcPDfgZHEDWyJSPBbXo4hE
 mTuIE9UAmO4I84uuBLBU/JOSFRMPLbrfyXjKBxAyshSt/Ert/rZ0y4AzHTY9Q8C8kwcdog/bOEp
 ZMjmRkimU6gbgJD73xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_180438_780559_8F7319A6 
X-CRM114-Status: GOOD (  11.63  )
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



On 1/20/2026 10:01 AM, Baochen Qiang wrote:
> 
> 
> On 1/20/2026 12:41 AM, Paul Menzel wrote:
>> Dear Linux folks,
>>
>>
>> Since January 10th, I have started seeing the warning below in my Linux logs, that reach
>> back to September 24th, 2025:
>>
>>     [   37.108902] ath10k_pci 0000:3a:00.0: not found station for peer stats
>>     [   37.108906] ath10k_pci 0000:3a:00.0: failed to parse stats info tlv: -22
>>
>> It started appearing with 6.19.0-rc4-00282-gb6151c4e60e5, the version running before is
>> 6.19.0-rc4-00003-g3609fa95fb0f, but I do not see anything related in the commit list:
>>
>>     git log --oneline 3609fa95fb0f...b6151c4e60e5
>>
>> The warning log from `drivers/net/wireless/ath/ath10k/wmi-tlv.c` has also been there since
>> 2021.
>>
>> Do you have an idea? Please find the output of `dmesg` attached.
> 
> please try
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a203dbeeca15a9b924f0d51f510921f4bae96801

wait, seems I mixed it with another issue. Please ignore my comment, it is not expected to
fix the issue here.

> 
>>
>>
>> Kind regards,
>>
>> Paul
> 


