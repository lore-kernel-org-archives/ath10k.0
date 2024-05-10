Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D04C25B10
	for <ath10k@archiver.kernel.org>; Fri, 10 May 2024 14:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ug0KQ5oaG2qwKoniCU5R5E+xTRuNofmc/DcAotezNQ=; b=FmcZbZQlECwGqC/8/wLDgr8kst
	dX5vn+JVRpG0fxIpxX+okPvRUMCdqrSuqzW//40QCFFxfle+J4kPB3YAsycf31Cj3Mws93KPh1yWs
	j41sKOYBUzYEuMJNj/ge6p8f6pPDxojyZkIn6NYT15xHY6aA4/GuxVsuPtH4qenCl7fmFbBWEOPJL
	+lh77ZdMyOvsUraTYFTr0iHgC61Qc1nGKP0kkOksYGnmhdlU0lMPHv+QiHUiMU8kd9CEIkG8gwSLA
	NfVjBRJTN++BlXSQ1pdgc1t0aA1dbBQ8wAzWsqr4fAM9UBFNXpHNHKFIL+eXx5Gtg8QW2U3aOkB9T
	HAIEiu6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Re0-00000005ccs-0Azo;
	Fri, 10 May 2024 14:54:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Rdt-00000005cbO-3YV7
	for ath10k@lists.infradead.org;
	Fri, 10 May 2024 14:54:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44ADBST1019386;
	Fri, 10 May 2024 14:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=3ug0KQ5oaG2qwKoniCU5R5E+xTRuNofmc/DcAotezNQ=; b=Xf
	q057j7MdmmGyrv/9L9F9UdHeRtQKFgVWNKxEBao/eurTy/ww7vMei8NPrwboMkoS
	slTbkntwIcOcNO5niOS5Z/H61YUbtGx27oczCtWDfkPXdPusIU8Dh8y6tdx1EHj3
	uLz7ILD9il3JM0Lne9QL+klznLt2GbSqT2y7kxGx1Dm+PLPET/nzmzuvtlJC8CjO
	ubJjRRR7DswpI5xQFYD662eLgE0g62YrHMuMa1FJK7RisxDfbMkSWxbNmbJlHX5a
	ncrx26mHZ5h3khEoJYaZ+Pzm7N0/wHdYTOrde06KQC9AOfPfiZ9dhcQ84SKwaMwb
	PGOJTy+NNZ95XxKWIZWw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w1hs4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 14:54:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44AEsOAQ005361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 14:54:24 GMT
Received: from [10.110.100.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 May
 2024 07:54:23 -0700
Message-ID: <a56bd4f9-d76b-4924-a901-554d71ea17bd@quicinc.com>
Date: Fri, 10 May 2024 07:54:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14] ath10k: add LED and GPIO controlling support for
 various chipsets
Content-Language: en-US
To: Christian Marangi <ansuelsmth@gmail.com>
CC: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo
 Abeni <pabeni@redhat.com>, <linux-kernel@vger.kernel.org>,
        <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <netdev@vger.kernel.org>,
        Sebastian Gottschall <s.gottschall@dd-wrt.com>,
        Steve deRosier <derosier@cal-sierra.com>,
        Stefan Lippers-Hollmann
	<s.l-h@gmx.de>
References: <20230611080505.17393-1-ansuelsmth@gmail.com>
 <878rcjbaqs.fsf@kernel.org> <648cdebb.5d0a0220.be7f8.a096@mx.google.com>
 <648ded2a.df0a0220.b78de.4603@mx.google.com>
 <CA+_ehUzzVq_sVTgVCM+r=oLp=GNn-6nJRBG=bndJjrRDhCodaw@mail.gmail.com>
 <87v83nlhb3.fsf@kernel.org>
 <7585e7c3-8be6-45a6-96b3-ecb4b98b12d8@quicinc.com>
 <cce2700c-e54f-4a50-b3f0-0b8a82b961a4@quicinc.com>
 <663e2bd9.5d0a0220.d970d.cbf8@mx.google.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <663e2bd9.5d0a0220.d970d.cbf8@mx.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qVnK9dRRwg18lc-CZ3pWZOj82YORCYY7
X-Proofpoint-GUID: qVnK9dRRwg18lc-CZ3pWZOj82YORCYY7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_10,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 mlxlogscore=827 mlxscore=0 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405100107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_075438_667023_7C92FE39 
X-CRM114-Status: GOOD (  20.98  )
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

On 5/10/2024 7:14 AM, Christian Marangi wrote:
> On Thu, May 09, 2024 at 09:48:08AM -0700, Jeff Johnson wrote:
>> On 5/9/2024 9:37 AM, Jeff Johnson wrote:
>>> On 5/8/2024 9:50 PM, Kalle Valo wrote:
>>>> Sorry for the delay but finally I looked at this again. I decided to
>>>> just remove the fixme and otherwise it looks good for me. Please check
>>>> my changes:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=688130a66ed49f20ca0ce02c3987f6a474f7c93a
>>>>
>>>
>>> I have a question about the copyrights in the two new files:
>>> + * Copyright (c) 2018-2023, The Linux Foundation. All rights reserved.
>>>
>>> My understanding is that Qualcomm's affiliation with Linux Foundation via Code
>>> Aurora ended in December 2021, and hence any contributions in 2022-2023 should
>>> be the copyright of Qualcomm Innovation Center, Inc.
>>>
>>>
>>
>> ok it seems like Kalle's v13 had:
>>  + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
>>
>> and Ansuel's v14 has:
>>  + * Copyright (c) 2018-2023, The Linux Foundation. All rights reserved.
>>
>> So Ansuel, is your work on behalf of The Linux Foundation?
>>
> 
> When I resubmitted this at times, I just updated the copyright to the
> current year so I guess it was wrong doing that?
> 
> As you can see from the copyright header this patch went all around and
> I think at the end (around 2018) the Linux copyright was added as it was
> submitted upstream. (can't remember if maintainers were asking that)
> 
> So me watching the old year and resubmitting it, just updated the date.
> 
> Soo I think we should revert to 2018?
> 

Yes, in this case changing the Linux Foundation copyright back to 2018 is correct.

/jeff

