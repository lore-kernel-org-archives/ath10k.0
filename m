Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EF9C10F1A
	for <ath10k@archiver.kernel.org>; Thu,  9 May 2024 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KucazwigOhRELkLRJ2ZpAYiuznyNg1d47XpT9D55Xk8=; b=xZbj5439z5OPQrQ85QYFRdA8pZ
	kvFN7yDEEwzmToHlwdhiFgEZQTdp2R/DJ5AWYkLVmlQn0mL26FxVce8mXGnenlLJPSfT0DDfftGvg
	SjWypa3iP0SsSK2THcZjPm+UpmP1IbRUpb60kMrFwflE2M5aYh93ev+ovbQETch3WL/NJ9hX+bjq5
	DYibDwJT+djtV3twaxg8EfiPgx+t8cKyITZkEYLxsvtPuU94CwCNPc/o+jd2ipTgQfPdIcAfcmQVf
	tlxVrqeetjEzhA5/RDduCP2G5VPyuqMqZStsKXuU7fiekQbMpFiH6J5O+Q+Tz5TIQEcQiDr+zZqpf
	+diulUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56wU-000000027js-0Z9f;
	Thu, 09 May 2024 16:48:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56wQ-000000027hc-1LRm
	for ath10k@lists.infradead.org;
	Thu, 09 May 2024 16:48:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 449E4Pbf013876;
	Thu, 9 May 2024 16:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=KucazwigOhRELkLRJ2ZpAYiuznyNg1d47XpT9D55Xk8=; b=dw
	cwM9n0t/5aPZMdoNkb+4TmDYFPB4irqJd82WF3iZ9hR/9uPVaWwxABAN7hi/HCly
	KpcJKzk5Bc8tJpoJQ8zosqQG4+vTRxGLiBk3XYTUet6/31Dx3cIms1P2BP3CDxK1
	rKlfJvo1k0jg705h9eIn2dTD+mBmif8v3sC1zbnwO6ma5qcYiGXQsi7GzgPYxT1r
	nxgZjvfD9apOmY6tB7SewJJW4V63PpSwCIZmkzm0DSQX4FX3tJ1u3hGT5jgk0bFX
	7dAfxMOfSb4uZ2ITXTfdyEaDILUUdca/nqaPyHkLODh16PY+mezB9wcW3ZuHrdVH
	xF8hfuLS4grmVxIId5kA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y09frb5dj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 16:48:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 449Gm9ej032744
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 16:48:09 GMT
Received: from [10.110.102.9] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 09:48:09 -0700
Message-ID: <cce2700c-e54f-4a50-b3f0-0b8a82b961a4@quicinc.com>
Date: Thu, 9 May 2024 09:48:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14] ath10k: add LED and GPIO controlling support for
 various chipsets
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>
CC: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, <linux-kernel@vger.kernel.org>,
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
In-Reply-To: <7585e7c3-8be6-45a6-96b3-ecb4b98b12d8@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KwxcFyIjNFarDSGjaqhZq-3C4SM7LnTF
X-Proofpoint-GUID: KwxcFyIjNFarDSGjaqhZq-3C4SM7LnTF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_08,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=783 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405090114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_094822_537601_6519B4D9 
X-CRM114-Status: GOOD (  14.70  )
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

On 5/9/2024 9:37 AM, Jeff Johnson wrote:
> On 5/8/2024 9:50 PM, Kalle Valo wrote:
>> Sorry for the delay but finally I looked at this again. I decided to
>> just remove the fixme and otherwise it looks good for me. Please check
>> my changes:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=688130a66ed49f20ca0ce02c3987f6a474f7c93a
>>
> 
> I have a question about the copyrights in the two new files:
> + * Copyright (c) 2018-2023, The Linux Foundation. All rights reserved.
> 
> My understanding is that Qualcomm's affiliation with Linux Foundation via Code
> Aurora ended in December 2021, and hence any contributions in 2022-2023 should
> be the copyright of Qualcomm Innovation Center, Inc.
> 
> 

ok it seems like Kalle's v13 had:
 + * Copyright (c) 2018, The Linux Foundation. All rights reserved.

and Ansuel's v14 has:
 + * Copyright (c) 2018-2023, The Linux Foundation. All rights reserved.

So Ansuel, is your work on behalf of The Linux Foundation?


