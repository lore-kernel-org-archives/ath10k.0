Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0194CC433FE
	for <ath10k@archiver.kernel.org>; Fri, 11 Nov 2022 20:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qp8fr15kJeSsqC5/7rXFPSbUL+yutEfTuvTQngDVy2s=; b=fQiHlSRvRkzY7M
	7a9vPlLYSmkv20x/im1GOMUzL5fggoDbat25g7/JALpf71uzSyUb470phLAJAFG/Ju233s3HJt9nB
	xv4832uSyFbsPuCwnXaplHZ7hAQOjZaL+nVqgxclYP46MhFZki+Om1/DFF8R1R/CLFng6z1N9tovt
	Kxld59SGmiYWKHQcYKp6G6AI88CB3DNK07cq0MevWvtUHoYLJZkp9w6okfdb68Xe/6SZMWLVyUGYi
	2llVi7z0CFSvlStkLBT0p/JZeMIrBeSUjzn4jDGaMkqndsXVkubUm7k4Hv2YBGoTtbc7P5I/COonH
	G+s8uzNJjgBOJH/R+kCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otaC3-000m7P-7z; Fri, 11 Nov 2022 20:00:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otaBz-000m2V-54
	for ath10k@lists.infradead.org; Fri, 11 Nov 2022 20:00:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ABJvAsT012293;
	Fri, 11 Nov 2022 19:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=yGZJVOEkn/5ZhGcIVIIDwWtiBepp7mgPkuoc1OTiiTI=;
 b=pWJbY73Ezp9fk9U6++vgKcB5bpO+gW/yfJsnt95YArh8y5dXIhPsoLRVqR65Vo6d8QXf
 PBrprVDk6Nvguk0YsOZt0ul4ueuumgtPLCvytlf5MoFqQshmAnU2HXrCMCTRM0C+8lpE
 GM9pcVW673CHDrBw21V+/Fo/jFeON9qusSywZ3XiDGpn8SvQ2UGX11tlQTHhQ6bLOqK5
 mjWLj8abq8Gd6y1mpqfkHPDXWG0qJQgMOPkG0jX+JEzQ2ETk8KaxftoZzFeUkCaVHgi3
 t+2jhAD/X2613Z2L/lQ2WOTP2o5xT62a8ex7AUlixRPklvQoLL0QMiWzD2ibmBV4Upd0 Mw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kstu507mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Nov 2022 19:59:44 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2ABJxhYX012161;
	Fri, 11 Nov 2022 19:59:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3kngwmaca9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Nov 2022 19:59:43 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ABJxhqq012152;
	Fri, 11 Nov 2022 19:59:43 GMT
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 2ABJxhKQ012147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Nov 2022 19:59:43 +0000
Received: from [10.110.46.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 11 Nov
 2022 11:59:42 -0800
Message-ID: <a484effb-9da3-9888-c11d-2d36ece7a342@quicinc.com>
Date: Fri, 11 Nov 2022 11:59:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH RESEND v2] wifi: ath10k: Fix return value in
 ath10k_pci_init()
To: Xiu Jianfeng <xiujianfeng@huawei.com>, <kvalo@kernel.org>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <rmani@qti.qualcomm.com>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20221110061926.18163-1-xiujianfeng@huawei.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20221110061926.18163-1-xiujianfeng@huawei.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8ZwVySvqS3447jZKp55SqcvevK2DhXPE
X-Proofpoint-ORIG-GUID: 8ZwVySvqS3447jZKp55SqcvevK2DhXPE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_10,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=667 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_115959_396604_5903E1BC 
X-CRM114-Status: GOOD (  11.82  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 11/9/2022 10:19 PM, Xiu Jianfeng wrote:
> This driver is attempting to register to support two different buses.
> if either of these is successful then ath10k_pci_init() should return 0
> so that hardware attached to the successful bus can be probed and
> supported. only if both of these are unsuccessful should ath10k_pci_init()
> return an errno.
> 
> Fixes: 0b523ced9a3c ("ath10k: add basic skeleton to support ahb")
> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
