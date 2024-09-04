Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F87CD4857
	for <ath10k@archiver.kernel.org>; Wed,  4 Sep 2024 17:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlIDdBlBgXOQYRPGtE85G4T5HBRp3VWCBEmjWVE8JgU=; b=3KO+WumHB8BNkszZBSz3nxToaG
	EgG/gqPn/NUt6ftV6y9NAOEBSTWJCtxvSqJoIntFxulFJEeeYa9fxO9SSGPKYkPV143kkowNaw7aO
	miwmwfAlANenxd66AVfCoLHbhVV4oehzIcuvfw97kg3OPGZzMJ70bvXyD9WgyV9H19zZLwA8/4snf
	QKiP1pHW+uGA/4gnQxo5pK57+a9iyNc49QD6Ox0y2zeLF/Gzu0sYQjkze/nwEQpgSK+oJB0Cx8V1a
	nm+PRjWlS01I6s1RRgWjgaVQt/oAVkS0GnIVcY+nT1nXLDVcgaxk+1yAWolWobSSHF12rT8P8MjRH
	cLCaosdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sltkz-00000005S3A-2rnF;
	Wed, 04 Sep 2024 17:25:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sltkx-00000005S2o-0k1F
	for ath10k@lists.infradead.org;
	Wed, 04 Sep 2024 17:25:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484D8b68019870;
	Wed, 4 Sep 2024 17:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IlIDdBlBgXOQYRPGtE85G4T5HBRp3VWCBEmjWVE8JgU=; b=kJ9wxUHYr3iYUddA
	YVtAbdbDQiM4ganAHg1peoxWyQM4DUBlw1jVeuMNflbPFsoZzXfsy3TUPb75ILQs
	Sty5G8UyOrBh2NOZ9//h3g0UhooprHPh9+tz90S/tHsDNsVknK2LVlO0zqZHtzI0
	iXJ8xIp62no7YNuCDyDb6ELXf0+ABbaTYpZUoGF5B7cevAN6noMNYWfiofPaXPjB
	+iXjy+xU069YVnQTfcrAvuVSx+dO1fnp2ix6tz7HUrsJMWh7kdJgBpMy+2vO9h0w
	nQrsX+ByBfHUB+AEaHPTj4KeAc+Qxgv6LZB+8dpCayD8wjC8K13EXxz0jnD/PT4J
	UW2wpg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41egmrt1g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 17:25:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484HPJXv005296
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 17:25:19 GMT
Received: from [10.111.180.250] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 10:25:19 -0700
Message-ID: <d5394d40-6a5f-495b-81b5-d974ad0de0e6@quicinc.com>
Date: Wed, 4 Sep 2024 10:25:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: fix the stack frame size warning in
 ath10k_remain_on_channel
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, <kvalo@kernel.org>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240830015349.1083226-1-quic_miaoqing@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240830015349.1083226-1-quic_miaoqing@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wK_v_gdJJeL5154T4SzmqXAF--_0WtLJ
X-Proofpoint-GUID: wK_v_gdJJeL5154T4SzmqXAF--_0WtLJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_15,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=732 spamscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_102523_240831_1E5EEE0D 
X-CRM114-Status: UNSURE (   6.61  )
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

On 8/29/2024 6:53 PM, Miaoqing Pan wrote:
> Fix the following W=1 kernel build warning:
> 
> drivers/net/wireless/ath/ath10k/mac.c: In function ‘ath10k_remain_on_channel’:
> drivers/net/wireless/ath/ath10k/mac.c:7980:1: warning: the frame size of 1064 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> 
> Compile tested only.
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


