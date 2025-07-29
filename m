Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADCFC83F26
	for <ath10k@archiver.kernel.org>; Tue, 29 Jul 2025 09:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUSEBgFnH1uyXh0d37hUVymh9ZhcDtPmDMq872O51+A=; b=c3iBRwb3tXrUOHgz0b5U0Msa6c
	wcTolQ8kZPFNnenNRlS9NEb+V/rOarEse4BF4YpMHi8eshUEvuiSdec5JWYl2n5sjBxuaaAmj9g2R
	nttpm81h7LGEcWe7O6djDw8OD7zn0z/ofEmiyprgmbJ3k15TX6NJWjkiZrR1nOO/JsvY4KgnYdcF3
	581C9rr+qnO1MRH5JcPBtfvebSeMSi4U3sTaGAzI1RbCE5okdKMpurjSWMN4cZ/hic6mim8813TfP
	D6kqjDeSOlgKaOdKS0nH15ocnOXd0ITHv6q1NaDlEgikm4ybsdsLBABSaTsUChjE9Ys0hqteSkERX
	M9H45gpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugh35-0000000GS8L-0QnD;
	Tue, 29 Jul 2025 09:55:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggpa-0000000GQMe-1a4y
	for ath10k@lists.infradead.org;
	Tue, 29 Jul 2025 09:41:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8n5HI026636
	for <ath10k@lists.infradead.org>; Tue, 29 Jul 2025 09:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUSEBgFnH1uyXh0d37hUVymh9ZhcDtPmDMq872O51+A=; b=FchZL1qn518bQuyu
	Negqn+77fM64ev9KYGdzJ1gZvyjH/ILjKtSyLsFU5HVXRbEtbQyKVyBK3/LxBSjR
	tXaHqA4e+Z/wMYi6o6eg4XMZ0ZefqSDqsOcn2LaNYFcU3etbH1mIpFTW2KXuV6ou
	4itYV0zWGFFdVA+yL6NY5Legrg1n7nHOQkt79kVr5U5SO/ehATpzYx2Tq+YVhwaI
	v41TO8nB3Ldvw4ek85NmztPD3ay7AKZIRxsXscTQ3TFRJPQVuf135dHtWDKwN+p/
	YqSQOoWZq3qmqyBxfgkhfst4gOMas3Dw3/rpwAvQ+U4xBvC37D5Sx6bg/zWstt3B
	72l95Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcr7sj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 29 Jul 2025 09:41:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2369dd58602so57084555ad.1
        for <ath10k@lists.infradead.org>; Tue, 29 Jul 2025 02:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753782068; x=1754386868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AUSEBgFnH1uyXh0d37hUVymh9ZhcDtPmDMq872O51+A=;
        b=trAq1YRpykl5YTveyGVNBJXq2eBppgR73Q+trhEupboaPxdaGtgBNVS6LubIFoDd0e
         O9MiOd81fwlwjnbPrTV7NIChbx68fwqufMH0AyzLLgw9djAtEiT0vuvtIl9UlmQacuoU
         hNQTpWX5J2y542gexllVx+nvMhbVXEJqlQVbBNMJTpM15uAutIBzKUv57Xr86q3jjXcY
         FHvQW81vSaMylFseingBPXWl63uYbWiGFBO2TuoZVvbcnvzN+DsIYgjZUw17QoM3rEDO
         BVccBnfgzPbv9tl/wynz0F1DgHuMf/T0a7JMeKD9HOtot6CBPFbPblosm1DgZWtIHDi2
         BoQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfwQLEeqxDVbzlfBZZnwey6eKeYckpxgfIwu+bY5MmJIBJcSIjHd1E0t6lVVsKfADJNXmc+Jw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3DQazkTAX0PshZtnXpWeSkv8IQu4gCCF1g9bxDgxFbGmTx/KX
	wvCRanoIq7OjR5iJvcmXPPziis4SxkufI4jqh/XYIQE41IcpXsaszUHrwG/ctRNs+auq4v0ZXcY
	0OjhfplSBvV/wsz5qO5Puzm9KdtTr7bWuVsKpE96CLuDfPM7B9bEsdsIPMjEAtYxPXY1BEzyR
X-Gm-Gg: ASbGncswA/5M86uZ4jfERj8nxM/OdZ+2tSZGPWyMMfSjsEhbRThi/4zYQYfPw8Xg12T
	L1xz5X3usCjr3wxkG25jQ+/WxaCES+IsgiIuiN8Okd3Vmn2JI+hlQwshSdlIzZaREGxwgutmWvT
	x5w1NhNaztDrpjaaNwyJ+P20bSZrmXsF8lAb1IrwpHpf7IBTCKMOC4S/4FdaoOUukQa8r5c4c1d
	270nCQnVl4e2e34tdOiwg4teVSuYWaFtr6EgJcUuhlklXCg4LXKT77wWeHaYOSEwciaP4muhO9Y
	fiel49zCmsm/1CzH7ggewC2LwVxX+GbL3GCxCNEHMLauFnzf1NZ9oLSwUMuHQsX9mNR6msvOnjE
	4pIdU6s8Yqi9p9sA64/C83mLETukz6Lk=
X-Received: by 2002:a17:902:fc4e:b0:234:c8ec:51b5 with SMTP id d9443c01a7336-23fb31dace2mr188011145ad.53.1753782067778;
        Tue, 29 Jul 2025 02:41:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+MDgOxmTsh6oulqquxjkG3/EJNT8XQSWUvnXjykQx8nCReUtx9N0GY4i24ruhy68XPXeQRA==
X-Received: by 2002:a17:902:fc4e:b0:234:c8ec:51b5 with SMTP id d9443c01a7336-23fb31dace2mr188010845ad.53.1753782067364;
        Tue, 29 Jul 2025 02:41:07 -0700 (PDT)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fc5aac459sm69720945ad.105.2025.07.29.02.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 02:41:06 -0700 (PDT)
Message-ID: <1b05e823-0698-4938-9ada-260214fc856b@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 17:41:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: athk10: Poll service ready completion by default to avoid warning
 `failed to receive service ready completion, polling..`?
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
        Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org,
        James Prestwood <prestwoj@gmail.com>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <97a15967-5518-4731-a8ff-d43ff7f437b0@molgen.mpg.de>
 <3cbe13e1-a820-4804-a28c-a57e2ee7a020@oss.qualcomm.com>
 <8716a67c-6e33-4a35-8d96-33f81c07c8e0@molgen.mpg.de>
 <1e797dea-d2e1-4947-8ef3-d2ac5ea0c156@oss.qualcomm.com>
 <4e5a3a4d-9b6b-443b-b3c2-eac1b44e96e0@molgen.mpg.de>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <4e5a3a4d-9b6b-443b-b3c2-eac1b44e96e0@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA3NSBTYWx0ZWRfX8+M9+Pku9rxf
 4Ms/n9fJpl5+H9dt+q+rbAZcWEw54GVL085ySsKVE2vNYn15jhOLJjx23ixT8fMg84pQz2/xKMb
 Sz86EPa4y8nxOnOt1xccdM0HuZrqzSToPlWey1kwuY3AV06HWVwx+XjEF6lm4fpZrKOjplfNfCD
 uFOeCG1AsA91GMlr3zn5kV2W7mROcu9NXSgx5Bi0y5+caiiUgTOoSDFvaTr6iibJ+QkfqRsHaO/
 59sIWzXObH6fqKejClI/IHMvs/B+GT8CSIVTxOrwSrJCRlL8aLy1vX8LiqJrNiu3U58coJ7Pqf4
 B5XJf6YOaDlV4nBn8UR9xpPAJS7617MgaZ9gbQXk8NMMPPhnHVfmB648kHPMcQhTSFUtWQzlUGL
 JSoPsohWs+d6MXsH3iYOCCniTXK7OXleF9ES5ciE0Sh+wOQrO6am97/D1p8EKWx+FKVgVz5w
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=68889735 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=1H9zx1mbTHHVdCZ-GkAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: X8frX8IgjCE7aT-sq_XcDw02qm2Zk2jG
X-Proofpoint-ORIG-GUID: X8frX8IgjCE7aT-sq_XcDw02qm2Zk2jG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_024110_536324_945A4551 
X-CRM114-Status: GOOD (  16.75  )
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



On 7/28/2025 3:39 PM, Paul Menzel wrote:
>>>>> Additionally I have two questions regarding the code:
>>>>>
>>>>> 1.  Is `WMI_SERVICE_READY_TIMEOUT_HZ` the right value to pass to
>>>>> `wait_for_completion_timeout(struct completion *done, unsigned long timeout)`?
>>>>>
>>>>> The macro is defined as:
>>>>>
>>>>>       drivers/net/wireless/ath/ath10k/wmi.h:#define WMI_SERVICE_READY_TIMEOUT_HZ (5 *
>>>>> HZ)
>>>>>
>>>>> `timeout` is supposed to be in jiffies, and `CONFIG_HZ_250=y` on my system. I wonder how
>>>>> that amounts to five seconds on my system.
>>>>
>>>> HZ is defined as jiffies per second, so 5 * HZ equals 5 seconds.
> 
> Sorry, I missed to comment here in my previous reply. HZ can be defined differently – like

Sorry for misleading - I was trying to say the HZ has a direct relationship with jiffies,
it equals jiffies-per-second in its value.

> 1000 HZ –, so the timeout would very, and then not match the actual timeout required by
> the hardware? `Documentation/scheduler/completion.rst` contains:

Not quite sure about what the 'timeout' actually mean here
- If you are referring it as the argument passed to wait_for_completion_timeout(): yes, of
course if could vary based on HZ value.
- But if you are talking about the actual max time wait_for_completion_timeout() will
block: the answer is NO.

> 
>> Timeouts are preferably calculated with msecs_to_jiffies() or usecs_to_jiffies(),
>> to make the code largely HZ-invariant. 

I am not quite understanding the 'HZ-invariant' here:
- Does it mean the actual max time blocked will vary if timeout argument is defined based
on HZ?
- Or it is saying the value of timeout argument itself could vary? But note the result of
msecs_to_jiffies() even varies on HZ as well.

