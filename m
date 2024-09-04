Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33016CD4853
	for <ath10k@archiver.kernel.org>; Wed,  4 Sep 2024 17:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Bj2HbcZXap5syD9Q36/e0lxxNvZ5e1PnmHqzPrYGwI=; b=y8JFfRED6Gha8ygNqGuSVvPbo3
	3Ps0hcJ2kbXoJ1IUsp8tNXUiZ6HuV4D4sBivAE9HX944XSpRpRuq5cfraxByA4gMU78ajRLAwPs5G
	4TMr0SEz71HgBTaXnll9pWVJLM1QFGHSX0FXjJnCWMArYJyeWTKivOlL/ghmExci3Gum+uAjFLnYo
	hnQVGPU1U+QbbaJxdBuL03CSAC0l724sHEyodbBurZCEfVNC2keDxu4a90JSbCJcsLXaEyYlNtVQI
	Unp2jfVTz08yOMUPlfZVnu/u5DhDS3EPDAR42iy2Bpiiq2DwIf3vbTkyuxo1YraEagwbtkowNlqo+
	PE7sYM2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sltlK-00000005S96-3Kr6;
	Wed, 04 Sep 2024 17:25:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sltlI-00000005S8G-0ouw
	for ath10k@lists.infradead.org;
	Wed, 04 Sep 2024 17:25:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484GrcNG009456;
	Wed, 4 Sep 2024 17:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Bj2HbcZXap5syD9Q36/e0lxxNvZ5e1PnmHqzPrYGwI=; b=ZPSkJ05fHozzavvv
	TxcEsTJBSSEZXP+WxxRT5LatpZb/VU3tJq1bmdoUxLUYNe4OIggqqDPRwh0K1J//
	IULFDEH2pcPO0B2n2nAketqCRIobUGSP91c1bosmt6W9XSa03DlGmO0U3MTuYua9
	Qfg+PnKgSGRoMNwmkxCv50xchvA5h8uEQHqDSkhaoN1tOTB76ytNashV+/p2QAMB
	UXeXdcKnLul6qWaC9L1VFYxcQBBHsBH78b7YEBSswW3c+nFH/V7rjD6OAVWglzk0
	s58ES6K5qtHKjWoRqTdmwCoWVFF/qhlQnPvaB2mnW+KWREMxSFjfKRywnXlegMqG
	qcM9LA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41e0bhmtkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 17:25:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484HPeZW024045
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 17:25:40 GMT
Received: from [10.111.180.250] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 10:25:39 -0700
Message-ID: <6a0571bc-2c7c-4c5c-bc69-c5d9b648c3f8@quicinc.com>
Date: Wed, 4 Sep 2024 10:25:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: fix the stack frame size warning in
 ath10k_hw_scan
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, <kvalo@kernel.org>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240830015649.1083758-1-quic_miaoqing@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240830015649.1083758-1-quic_miaoqing@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bUSoHtXbvdz-T-gaBUGYT77PTKk2Voca
X-Proofpoint-GUID: bUSoHtXbvdz-T-gaBUGYT77PTKk2Voca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_15,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=660
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_102544_385121_16A1DCA9 
X-CRM114-Status: UNSURE (   6.41  )
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

On 8/29/2024 6:56 PM, Miaoqing Pan wrote:
> Fix the following W=1 kernel build warning:
> 
> drivers/net/wireless/ath/ath10k/mac.c: In function ‘ath10k_hw_scan’:
> drivers/net/wireless/ath/ath10k/mac.c:6468:1: warning: the frame size of 1064 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> 
> Compile tested only.
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


