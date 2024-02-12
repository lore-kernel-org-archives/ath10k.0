Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28906C4829E
	for <ath10k@archiver.kernel.org>; Mon, 12 Feb 2024 20:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1PUPiyBIlZSjD/hp9pIkB45FKKaRz7iaLkieyjcLns=; b=bXihY+BSbnmvW7eXNZfcwYkGkY
	/fudge0IiOABujsnEdbKOHBJhT5om1rEt58wzceZNhpywTeN6pywHLIp0K9fLwaZUL6JwI1TVyGk4
	BR8/ub432qpoMMtQ3hpPctW99ZWTn0sjnw5n0/oPuqInasBTj9ESRZJDz5/UkCQZTge8Y9X6D6vmI
	7WKtrr5eJ+YGrak+02PMEhekjBdwK88UDioFllK105WKfaOo/3duomSd5LQ5NbxfLHlFV09087mnI
	51YSY/QOQsxSSAfZUaTDNEwlmNFJNKqySlYHxnbg1pslP3W40XAqzrUoMeKTUX+a4ryoQgQO6MyeQ
	HIkL2/Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZdKu-00000006vEE-3CrV;
	Mon, 12 Feb 2024 20:55:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZdKr-00000006vBR-0jNV
	for ath10k@lists.infradead.org;
	Mon, 12 Feb 2024 20:55:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41C7uL7k002953;
	Mon, 12 Feb 2024 20:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=N1PUPiyBIlZSjD/hp9pIkB45FKKaRz7iaLkieyjcLns=; b=fB
	kNmUXjAzTlK3pFHsoSXPjUJYfKY6HLTF0l2UUnpm+W/qV/mrUIA+lJPPQgZ7SLk1
	HBoKrffYbIXYPmrAhUz5QSM93pFdgWxXhsRqXYcfVunbO+MT3JYnXNj3yHL7WxLI
	5teIM7pJY7qWf6tS2C0z1/Dr3/WZjUpJRi/1c5kSEnY8CYcBDWXATiP8Ei4NOKNZ
	L0IIFwLy/Ygx2riWNSbJADa/CwjUJ2WOsH1gcj8GDEwf98XbkLRubHKxWsQsyPdT
	tphRVlt0ofsn1c6Dw8ks8pEjDzPHEFfi8sPWKT+5YNOlE9SakTpATHWuDCKIGJ/2
	KTD4idOao8N2a+HaqLUw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w62q2vcyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 20:55:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41CKtNVS015036
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 20:55:23 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 12 Feb
 2024 12:55:22 -0800
Message-ID: <7768c61f-3f5d-4a2c-9b33-b585b3cf8dcc@quicinc.com>
Date: Mon, 12 Feb 2024 12:55:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] wifi: ath10k: fix board file loading for wcn3990
 devices
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalle Valo
	<kvalo@kernel.org>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, Yongqin Liu <yongqin.liu@linaro.org>
References: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: W9_w4qNM404UuunX2UT29pd0mqoEorCG
X-Proofpoint-GUID: W9_w4qNM404UuunX2UT29pd0mqoEorCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_16,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=966 clxscore=1011
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402120162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_125529_443567_7EC54AFE 
X-CRM114-Status: GOOD (  11.74  )
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

On 1/29/2024 10:47 PM, Dmitry Baryshkov wrote:
> The ath10k driver fails to properly handle fallback from board-2.bin to
> board.bin for WCN3990 cards. This happens because the
> ath10k_hw_params_list doesn't include .fw.board* parameters for the
> WCN3990 platform.
> 
> Add board data configuration for WCN3990. While we are at it, merge
> common pieces of BDF support: drop .board and .eboard names from struct
> ath10k_hw_params_fw and use the common name instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (3):
>       wifi: ath10k: populate board data for WCN3990
>       wifi: ath10k: drop chip-specific board data file name
>       wifi: ath10k: drop fw.eboard file name
> 
>  drivers/net/wireless/ath/ath10k/core.c      | 32 ++++-------------------------
>  drivers/net/wireless/ath/ath10k/hw.h        | 14 ++-----------
>  drivers/net/wireless/ath/ath10k/pci.c       | 10 ++++-----
>  drivers/net/wireless/ath/ath10k/targaddrs.h |  3 +++
>  4 files changed, 14 insertions(+), 45 deletions(-)
> ---
> base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
> change-id: 20240129-wcn3990-board-fw-a2d97507a712
> 
> Best regards,

This series looks OK to me, but would like Kalle to review as well

