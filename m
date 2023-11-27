Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6341C46CA3
	for <ath10k@archiver.kernel.org>; Mon, 27 Nov 2023 16:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JlN8087//OYrmvRhmDLFPuasAa3EGk6qrIDprQKGNcA=; b=gcDmI1TusV2iqf
	lTDSUVZ/opLgCGchD8FDLec1IGsHRFd5M13qMLlrymiurIgIMZAfrqfIBm8fsZDZMTEeIBGr1MqIc
	wGLkGlRo5a44R/CW+tbQ9y7IVBB5sE35wn/AjwXr5rEQRKmSaaRy7Z0hYFv1kWx2lL1tRpoxqLk6/
	jzuxD/rEkIFe0b2kQgPp6H65Bf8ydYXWYerBW6qVmzdRzW6V3oNMySrkRRfTyJfd6ZgM1sXxzaffE
	INXNLSeEjvg/Wwp9ygR2bmC2CdBIjp0EN7ZOGV0xcKAZ4r9RbRyfMK2iYcIvFMTXC5uZNbA8MvkZ+
	XZr9EcesoNP0TQ4Hs0Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eGF-002vpM-0u;
	Mon, 27 Nov 2023 16:15:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eG8-002vlX-0l;
	Mon, 27 Nov 2023 16:14:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ARDa8Rn005852;
	Mon, 27 Nov 2023 16:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=T3XEND6w4JkP60lhWCUyf8Uhq9TXsLi5jVwo2OybIKc=;
 b=fukzOlVhZrlORubg2qYfMD5RBohjxOFfrkJYU/NlwBv81L9uPHGam5LhAdonebLYx4tb
 kQWNJ1YuPENc3X1LHhBXHmwnDXOECFW93SG9lOQoqq24glEk2G0aWwbf6EnOBuMn89uD
 3vpfsufWrFD0LLD1MZqOjZzwOX8ZAN5cJ2Lx71G3FZd0z4du2HS0TalTxqRjdfDT7t9M
 CyWFJ7u83IivY7kLUEl320a90BguHnsuVni0LiXTd8pItlYYOXi0vxm30416ctjozq3U
 07OQlNd5289aeqxKQJCf9D4xd/c7gMQzHYtdi/+JUN4wd2Wf/OKlWonHInef7hxieuq+ vA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3umt630t0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 16:14:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ARGEn4o004643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 16:14:49 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 27 Nov
 2023 08:14:49 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 27 Nov 2023 08:14:49 -0800
Subject: [PATCH 3/4] wifi: ath11k: remove ath11k_htc_record::pauload[]
MIME-Version: 1.0
Message-ID: <20231127-flexarray-htc_record-v1-3-6be1f36126fd@quicinc.com>
References: <20231127-flexarray-htc_record-v1-0-6be1f36126fd@quicinc.com>
In-Reply-To: <20231127-flexarray-htc_record-v1-0-6be1f36126fd@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook
	<keescook@chromium.org>, <ath10k@lists.infradead.org>,
        <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gHQhksnZLF0AJqfG7yTvitEx_uuBYbg7
X-Proofpoint-ORIG-GUID: gHQhksnZLF0AJqfG7yTvitEx_uuBYbg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_14,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=405 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311270111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_081456_456336_471DE71D 
X-CRM114-Status: GOOD (  13.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

The misspelled pauload member of struct ath11k_htc_record is unused,
so remove it.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/htc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/htc.h b/drivers/net/wireless/ath/ath11k/htc.h
index d31e501c807c..84971cc9251c 100644
--- a/drivers/net/wireless/ath/ath11k/htc.h
+++ b/drivers/net/wireless/ath/ath11k/htc.h
@@ -152,7 +152,6 @@ struct ath11k_htc_record {
 	struct ath11k_htc_record_hdr hdr;
 	union {
 		struct ath11k_htc_credit_report credit_report[0];
-		u8 pauload[0];
 	};
 } __packed __aligned(4);
 

-- 
2.42.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
