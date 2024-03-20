Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71ABC54E58
	for <ath10k@archiver.kernel.org>; Wed, 20 Mar 2024 15:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1YOUigZ032H/1z4ozAs2t77AHgioIzVm+TtWp1zuOo=; b=D/pZ0JUT0Qm9PmdjvadLb8Qxg3
	EsP+CNSJhM1EhrfDobh5Ps05oQ6cNz52mAe/hMdr6NvaTGLvf+W3daGuAm43bZXvlFkpeno+ZLPB9
	0OA/Q4BdjzDXZkdaSaxDFx6N3yTF/BBitV59/JCo3sPMZLNkwjlW1SKpRFrIzFolsZuGi6l1Wrr1m
	K+CPLtI8ESIVOIn+XiPrs3NGKuYjISkGEPn/cHzCnGwP5ZjaRwr93IcCFcppUKcApbRsUdKsX7RjI
	fKqkxwwIf15fB8j6kO9+2xx6E5UO6NeLd8dwqYiHtMgQKFysjQCTtZw1Hww/LWS+21cpRpTkGQ48a
	EsFN69FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmxct-000000001Hh-2GdF;
	Wed, 20 Mar 2024 15:13:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmxcf-0000000019K-24Bi
	for ath10k@lists.infradead.org;
	Wed, 20 Mar 2024 15:13:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42KEk4k5003864;
	Wed, 20 Mar 2024 15:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=D1YOUigZ032H/1z4ozAs2t77AHgioIzVm+TtWp1zuOo=; b=Kt
	8qapt7ufd0OQx13srzzsbnT9KvPuHggjZiFmhQWTtpzZ7fuYLIb4wkGrmqX6RGDG
	Rc1duXWK14KJjXhdOX62pJBvfoEA9E/TgHfCkKcSHudS5m3/aTtMiFo60X01uBuv
	thB47g7Ct+V6vzwji5jyArPCnt9asMr+hhNvI+WewvdeQmp2j05vAwbuCjLgOoNw
	jQeYJf6GtV3Kl/LUkhMsle+uZ52t82m9xTk4vV62uUVDOFu54XR6/dz1oC/X4C+H
	bozfSe/O2mmTCdURveUvk5LMMHoXYmNVn7vHslc3ah4rA33EGkZW88oVYoXJiGUd
	bUgCcZxUWKP6qtYKCGkg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x01br85fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 15:12:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42KFCl7l027483
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 15:12:47 GMT
Received: from [10.110.120.226] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 20 Mar
 2024 08:12:47 -0700
Message-ID: <9fcdb857-da62-4832-ae11-043fe993e4ad@quicinc.com>
Date: Wed, 20 Mar 2024 08:12:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath10k: allocate dummy net_device dynamically
Content-Language: en-US
To: Breno Leitao <leitao@debian.org>, Kalle Valo <kvalo@kernel.org>,
        Jeff
 Johnson <jjohnson@kernel.org>
CC: <kuba@kernel.org>, <keescook@chromium.org>,
        "open list:NETWORKING DRIVERS
 (WIRELESS)" <linux-wireless@vger.kernel.org>,
        "open list:QUALCOMM ATHEROS
 ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20240319104754.2535294-1-leitao@debian.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240319104754.2535294-1-leitao@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: q7s0hFZrLjK3gu1dnGtitAhln06Gey-B
X-Proofpoint-ORIG-GUID: q7s0hFZrLjK3gu1dnGtitAhln06Gey-B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_10,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=943 lowpriorityscore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403200121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_081258_086552_B0C06104 
X-CRM114-Status: UNSURE (   9.29  )
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

On 3/19/2024 3:47 AM, Breno Leitao wrote:
> Embedding net_device into structures prohibits the usage of flexible
> arrays in the net_device structure. For more details, see the discussion
> at [1].
> 
> Un-embed the net_device from struct ath10k by converting it
> into a pointer. Then use the leverage alloc_netdev() to allocate the
> net_device object at ath10k_core_create(). The free of the device occurs
> at ath10k_core_destroy().
> 
> [1] https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

NAK this based upon the ath11k patch results.

As suggested there we should just use kmalloc/kfree to match the existing logic.

/jeff

