Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285CAE7316F
	for <ath10k@archiver.kernel.org>; Mon,  2 Feb 2026 19:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osE3p5qcZUFQIHYkxdj7q/bBYZv+MlAOAHGqRpRSEjU=; b=UZ3XYq0AlV7UbeiSBY7iZ1+QSE
	E6pAGSVo69lp+d/BuLa2F+t/CoNpjO8bqmtFTKLVVUCS7Prq98IkLCboMIBfhnn/7SrbyhrlRVdI5
	u6FjTd9xDxG7IAh6f2uzJeiJioGGWCp7X//DlaRkK69PmmEHmEVgVQpr8km7lpNhBfDwXUKli1D9Q
	Q4GE+5HA2b/buJ1d49Wp09MHreN8Z6Lt4dUSlw3O0k/DxY5tW/7WKu9Mgvlu/6IBSdR3PEzFSqWVQ
	6TWvOoKdMx7wnyQaJkibF+qTOjJfCsXmkjOe1D8CH1VCBSsmTepI1z5TA6hesadd6nMRabDzkIrj8
	jJoID21A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzXw-00000005Vyf-01sz;
	Mon, 02 Feb 2026 19:25:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzXt-00000005Vxq-0QUD
	for ath10k@lists.infradead.org;
	Mon, 02 Feb 2026 19:25:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612FkxBK3386926
	for <ath10k@lists.infradead.org>; Mon, 2 Feb 2026 19:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	osE3p5qcZUFQIHYkxdj7q/bBYZv+MlAOAHGqRpRSEjU=; b=DaH7GTifW35s2uQK
	T+OYowQpI6iyiU01LVhvYbY10sIcaVBOT/HhU90YEWAfGES6isSJNeXTCKE26BCA
	+27cHTDGvCZQo6iQBPEDYOB5u66A/hmWw4UpUXra2ksD70CQ4d0EbgUGVPnUGiyZ
	8U7xAjrTm++ntxzILxYCaymhwI149n1gRtiX7h0Wp50XKkyvQFjdjQjcFpq7QOl7
	cxZeR14r9o36p+kuy5BR5duzEH8oolWizk4TxNQ5FKcNl016qubjdDDmEgW53SAg
	jiS/FRMQ8ZPtXCm226IwkPRKdwY7XXaampvNoH3duSmLbTbLTUeKQ2FKi3GWmxp/
	oMlcIw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2xvbrqjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 02 Feb 2026 19:25:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b708fa4093so12698804eec.0
        for <ath10k@lists.infradead.org>; Mon, 02 Feb 2026 11:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770060311; x=1770665111; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=osE3p5qcZUFQIHYkxdj7q/bBYZv+MlAOAHGqRpRSEjU=;
        b=Al+XjVwSwiHNsohr+oerz4gTlls1JFdrb9u2P0MWKqiJgBcx7soxC8pqKd3hKfpknZ
         cESlkJV0N0pMt4dSJoZ/pctHlhenHAGlkOatkVXO8MmTcq2To3gxHzbbaX4/1lgUNxN8
         CqcTyXzIa/gJoUi6TlMEc4A36gnOYYbXzjOHdrJKlcYO8A0/+Ef5c7fkRJERC7MqCGRX
         Atu62AOAhDcMKi3aS/4QvvtZ1PW6yB5vlI3eMbcIsVeO/PCYrKOrYyPCOjW3zBRBGvih
         lSy9X2M+7lNGTErepak0Y3K4Rr2UtuUTU0tJD4CSMylJt89QEepzE+AvW7P9YGrmOmru
         NyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770060311; x=1770665111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=osE3p5qcZUFQIHYkxdj7q/bBYZv+MlAOAHGqRpRSEjU=;
        b=KLJ2zHuhT5Xwm7WhS31FJ59O+n3mufuElAIVoJ8PCiuUE0E+3whK56n58I+WERvWHe
         kvf6SWl0l0tPZcfD52MVb1AO9im5IMG0DmHq7FwhYgzr50whv5XBnLoY32Ed8hmAZoAZ
         /vdWJ6tRGKrCgxNqf6NFYFDvU9bcAb0/Q7uBsjHM5ddk3BRjjKiN/QYWDeWyevFsHufb
         dfBFGl/9U+UQ8uJIi0S0TVD42qztsJfJeZBLBBxU8qsWWo1QBkbs9dsFZQNKofNTMojr
         PeGv9RLQlHETGGC57nS1HZgDBQGSwdSg9xmFhQWHD2USrQ25rn92lLVFTZQVE6920voS
         vQVA==
X-Forwarded-Encrypted: i=1; AJvYcCUMHXlBo/lqbZWoqpeHIlsVL9EDqYOYH+9QYV94O6C7bSlT/Mfq/uyEJA5/UDzzxEmUsL9sedk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuWgt4+hk5APf+4t67AT3zwLTPtSjBlrfodjXqcnSFQoeZHR3K
	YWwUcy+hEYIYDyAxZdbQsMCCBUv0/HacDos5YSADGHTWBoE0sw7wCZqtq+qziwWrrRLM3kd/waR
	gOg5CSQja9pSE+22alpJiuTTRGUWxK2rg3mdrw8saF8oDbUWB6vwinDh3GGGQkAJsiITDPCal
X-Gm-Gg: AZuq6aI2LlkR56qycxQfmf4/we3yfotkq3Lez864n3ziH+RLuwf3HhfABcbUV+VgEmi
	j4SXR7y66yMeSpYek8uAjZLhpx61EU0JZdCHb7UvDDWQlRhbRLOh/++sF52mC40LQD7f02Bnomp
	CsouW7ewJ9uNfBQiJI3YLwkA2g/xrcqAgFZMpLZ5tOplPs6rOrabJlHt1gKE9Njw/BU7vtN0dx4
	7CxQiRgix2+1i9y7HUN75gtMM2sNRRLEK3egrE+zFqLPovE0KxtdGcd+ihPGnvxNn8taJ3ajBqA
	xvuYzkeaGE7PyJ6blEjoOMdzdC6yK+XDH42scKKYEIwpakxtDvzlIhpp92IzyQdOh4VqUAcajc6
	OK0pFkUEyJWMvG57P3Q/PV8kD3ada8nRJrRr0QOGdG2XrBC2sX5ezvGQ+lxwfovEfwdbFdKSJCC
	uuFQ==
X-Received: by 2002:a05:7300:220f:b0:2b6:aeb8:3d8c with SMTP id 5a478bee46e88-2b7c891b410mr5775735eec.32.1770060310649;
        Mon, 02 Feb 2026 11:25:10 -0800 (PST)
X-Received: by 2002:a05:7300:220f:b0:2b6:aeb8:3d8c with SMTP id 5a478bee46e88-2b7c891b410mr5775726eec.32.1770060310091;
        Mon, 02 Feb 2026 11:25:10 -0800 (PST)
Received: from [192.168.1.40] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abedcasm20593274eec.21.2026.02.02.11.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 11:25:09 -0800 (PST)
Message-ID: <880a9a9f-bfc1-4d7c-a138-f6738805669d@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:25:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k-firmware: WCN3990 hw1.0: Qualcomm SM8150-HDK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        ath10k@lists.infradead.org
References: <aXofqTlEn36BDzRG@umbar.lan>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <aXofqTlEn36BDzRG@umbar.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EFuVUXEpSEdVQOa7E5Gfm3asU4Q0VT-S
X-Proofpoint-ORIG-GUID: EFuVUXEpSEdVQOa7E5Gfm3asU4Q0VT-S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE1MiBTYWx0ZWRfX4ez3nOgYQaBC
 pbO3ATz1sQEpSBzSmZjLWCNnQ43Yg3aNiVWLTjoTB0/jHH/DR504Tzlz6gu5TZZFaqFqdc0GYD3
 xuT338NcRRKfKFMjCjo3SBBbUmxDAg5691OmjQadolWQoOCjfos9eYKjS23isTntyVZJ+Hf5GZj
 Q6DIeL8YomwDSZWehTU5m5G5DhaH7JmpJ5zALUiODh8O84EqGwOkRjc5wgZ+K+PC9DS/bJyBaTa
 qojDtcL3lMSOxaaMt3LMwzul/M4+idmDyHs2r66gaiu1yy4rNdPsyBxjSdoHbUEqJoQ4io1QgmF
 p/rF21g5i/IfROG0rOSb8SRKK1VlsNuc2a1vRj6kUdhrpSo61NgGp/AJbA6GSK0wm7YeiXHT5bs
 Ibyvw4fF14J6whU3JmUplnTkxyMwo8MLHkFWyz/n3JlZUKztYzOPpUlDhRNK6i8f+nUrTZ3C8YN
 jmGyvjTnjNthdMnTxzA==
X-Authority-Analysis: v=2.4 cv=AurjHe9P c=1 sm=1 tr=0 ts=6980fa18 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=47Xw9H-uwEPim6ehI4kA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_112513_261843_DBBEB901 
X-CRM114-Status: GOOD (  13.81  )
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

On 1/28/2026 6:39 AM, Dmitry Baryshkov wrote:
> Hello,
> 
> This is the board file to be used with the Qualcomm / Lantronix SM8150
> Hardware Development Kit. The DT with the specified calibration variant
> is supported upstream.
> 
> * description for what hardware this is
> 
>  - development kit for Qualcomm SM8150 platforms.
> 
> * origin of the board file
> 
>  - extracted from the firmware partition on the device
> 
> * ids to be used with the board file
> 
>   - WCN3990 hw 1.0
> 
>     + bus=snoc,qmi-board-id=55,qmi-chip-id=30224,variant=Qualcomm_sm8150hdk
>       md5sum 15afaa2f565c9b063012f7faba9ba745
>       sha256sum f040cecefd723a4bd28015bb74e85723c971fdff36a773e9e83936dbab2ec61a
> 

Thanks, added to WCN3990/hw1.0/board-2.bin:

New:
bus=snoc,qmi-board-id=55,qmi-chip-id=30224,variant=Qualcomm_sm8150hdk

Changed:

Deleted:

1 board image(s) added, 0 changed, 0 deleted, 35 in total

https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware/-/commit/e1d4991c717ecb252aeabd5f1a3c97551a1906f2

