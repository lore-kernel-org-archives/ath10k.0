Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA35ACD98FE
	for <ath10k@archiver.kernel.org>; Thu,  5 Sep 2024 18:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5Os+bA9Fs3wqrNOsTKewI6oSD5lRDuJsFQaEBESRMg=; b=TI5vcv3/+xt9Ed0nG/RF6y7Ncw
	83SFuOwOPOiIwSCVHlOuEbzpmgWeetvrcTr/6a5Y3DBlKDLbjg0MhtEbDnY/KD4oOhGaeuT7viWmE
	D6WFqC2cRNAbAoIyR1XPb73Qmd8uIW+ot0mt8/90Rv0j2FmqjwYVD6mb2fBQbC0uxTK/zG6vxZ7bk
	2ywbjAdFKI8/zaox2eqlR2hXcYhVjALFNME52qpGmPXC38VIjP9fbaqkLC5Xlze35wWiuKxvl+XK4
	gWoV2vpNyVUqDZGMW9PlUKECyGSbPPaWOZTd6eBvnveYUEW27g9vBobMnUiy+OcZDxhksVzZtzlAc
	qR+KioiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHQp-00000009TcZ-1Fdc;
	Thu, 05 Sep 2024 18:42:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHQl-00000009Tan-1Ug9
	for ath10k@lists.infradead.org;
	Thu, 05 Sep 2024 18:42:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IQ5er021772;
	Thu, 5 Sep 2024 18:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L5Os+bA9Fs3wqrNOsTKewI6oSD5lRDuJsFQaEBESRMg=; b=VkZq59voxT/u5DTp
	yNFh8d0uH2U+OA2jMNIBhtfJ5usotm3SBbPb0GQmKvOlfzDzj2nAfPLtlEsIjoyr
	6XMvr1Wl0l03Rh8+4fG0RkDkjYysE6lkFQF9apnjdaCd4rGCy7Hg5a7TwyEYHDf8
	6h/ub8EZJprX2+ADaVJ84Y7LSvDcuBSiW4tacYuqE+DUdGIWvwUAOSpCwx1DTJiF
	L1a5mZgjyjrQv7W8OU3bZgesYhHK+QmuxNsFuag9ZxJuDGbOr5Obzw3XQqlE4JBx
	PLg53HVUnwxJaGREvFVzr0hPs0ELgFM5Wh360CsqftmE+GVegu/ljHHiHV1vUb9H
	YKv+ng==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu00yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 18:42:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485Ig2c6016042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 18:42:02 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 11:42:01 -0700
Message-ID: <63944476-d63c-457c-ba5e-391a94706945@quicinc.com>
Date: Thu, 5 Sep 2024 11:42:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath10k: add USB device ID for Atheros QCA9377-7
To: Tomas Paukrt <tomaspaukrt@email.cz>, <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <5Jj.Zbdh.4ausKfY}jbL.1csLRX@seznam.cz>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <5Jj.Zbdh.4ausKfY}jbL.1csLRX@seznam.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OCEzxS097ApRBQ65BHawv29v1XWPCpP6
X-Proofpoint-ORIG-GUID: OCEzxS097ApRBQ65BHawv29v1XWPCpP6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_13,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=496 adultscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409050139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_114207_446496_2C5009E6 
X-CRM114-Status: UNSURE (   7.00  )
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

On 9/4/2024 11:59 PM, Tomas Paukrt wrote:
> Add USB device ID for modules based of Atheros QCA9377-7 chipset like
> 8devices BLUE bean or SparkLAN WUBQ-159ACN.
> 
> Tested-on: QCA9377 hw1.1 USB 0.0.0.111
> 
> Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


