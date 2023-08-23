Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3DEEE49A3
	for <ath10k@archiver.kernel.org>; Wed, 23 Aug 2023 14:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOWP2xgjAgydv8zM948duG9m8pLGS2OiEzLIHHwhJ34=; b=A+9v+lWYszjZmD
	4chlfyJsyFReFxsoRiBqGRETK2YDTauEfauNKWbeqhaHiPY0NeLDyBNfDQMXdJnwtZ2t5Uvn5ELUP
	3yjxlhLYXiE1eMHeuMx5ju3jQc51JVJB2Vrw53ROU/Y8ul2TjXsGcnJIvVojzkjO0rk7mukqy3eDg
	Lg4R6AGa8Hd+RY6H5NuTXrn9PTesSWxsrLnwUhlpehqkBIJvuWa6jBapCijT25DWrbmCbScFm/TB/
	cImh8KPDTYdi3PNvgvEH5iQvEoKpvA+uh643UDfJK3Wwk0zq0TjKu4hrU9UTmkLYqjLmVexFf6INc
	ChL4xkI93n72QDbnSWTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpEb-000t1q-1j;
	Wed, 23 Aug 2023 14:53:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpEY-000t0L-0n
	for ath10k@lists.infradead.org;
	Wed, 23 Aug 2023 14:53:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37NEU9tw029046;
	Wed, 23 Aug 2023 14:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=h/E8x5sBASp2FmrUQGLxCw/KpSIC6IIIdz3EuQY/sFs=;
 b=CRzyhmkI3yIWKoCvxWmKWxUv61wGIbUYy2e/G8YSq8zKKbVHglfeQNuXARulHLczjLIn
 5aGngeVAL4ujwNskcVZ0haKBG8IBkYPYav816xK2PA3eWNkiMzpUAUkddA9tRE/8pHmY
 0iBgWWCBLKeiCxWdDFqQxEWRKvRtsCQu1hRSzc9nx/NrJbihqtuIM6zw2kGT08KXFQCQ
 pi5lf8tB40v7rsIPvjktArCDqUTqhIri4OVMGWxqpvi/4jRyQKGPTOzEuZWTtVDN2V9s
 CdB712y+6xyqxWEXSzQW3V27yXOX7kGrK+FuUBuU9L/d3PLAk0DTKlP9fxMfZMlvwi5H fg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sn2cm272c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 14:53:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37NErC4Y008295
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 14:53:12 GMT
Received: from [10.48.244.52] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 23 Aug
 2023 07:53:12 -0700
Message-ID: <997f4b09-7087-4788-aa2a-ef835ce6ebb3@quicinc.com>
Date: Wed, 23 Aug 2023 07:53:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] wifi: ath10k: cleanup CE initialization
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>,
        <lvc-project@linuxtesting.org>, <ath10k@lists.infradead.org>
References: <20230823095008.50515-1-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230823095008.50515-1-dmantipov@yandex.ru>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RH6QwBnxHt4Q-U2cDnzyzmeB4IWbAlAr
X-Proofpoint-GUID: RH6QwBnxHt4Q-U2cDnzyzmeB4IWbAlAr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-23_09,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=737 adultscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308230135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_075322_438691_4250E44F 
X-CRM114-Status: GOOD (  12.26  )
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

On 8/23/2023 2:50 AM, Dmitry Antipov wrote:
> Commit 25d0dbcbd5c7 ("ath10k: split ce initialization and allocation")
> changes 'ath10k_ce_init_src_ring()' and 'ath10k_ce_init_dest_ring()'
> so these functions can't return -ENOMEM but always returns 0. This way
> both of the above may be converted to 'void' and related code may be
> simplified as well.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

IMO you are doing too many changes in a single patch which makes it 
difficult to quickly review. Please keep it simple. Suggest you change a 
single function signature per patch. Any related code simplification 
should be in a separate patch.

/jeff

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
