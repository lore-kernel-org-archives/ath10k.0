Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90607C47DB3
	for <ath10k@archiver.kernel.org>; Thu, 18 Jan 2024 16:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3vaS6b06RF0cEsIJCiW4movKSJGZbEk5gzMjPj+5Ss=; b=FxGlUmlSNgQUjn0lwIj42wkV2C
	kusMj0W9CvQ7lDPhZvW78hYNbkTE4rRFtP5jGFBDTkQniH4GePmUBRdcU4hL/EZbvzqMG/9OEeEO6
	gMDcWbW8R3qtcRwzFfpWCzqS+E61mgYagZAtBHQPU7MH+hgKhrYbqn/zPrIZ8JH7Ol+gkBxsjFv16
	hL7XlD6QIu2vYC2lSu5B696S3nKw85sOq/sYtTLXU6xBv13c6O521E7+qtraMJ5I/z/SAc9+LM8sN
	Ox/zety4Ti6jebYxPYPc5IsfEntzgBXdh8L+yEBLdXGSeMrAGlqkin8rYOTAWJCkQpDPTkZiXzgjJ
	YolGzvZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQV0o-003Czl-1a;
	Thu, 18 Jan 2024 16:13:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQV0l-003Cy6-0i
	for ath10k@lists.infradead.org;
	Thu, 18 Jan 2024 16:13:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40I5tT6B029612;
	Thu, 18 Jan 2024 16:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=K3vaS6b06RF0cEsIJCiW4movKSJGZbEk5gzMjPj+5Ss
	=; b=SlDeFIXPD+ugQxUNwUFuHxPS7oKXY+NXNj8mDNEICtAgTGePcEkZxNSGGIx
	bXsVPD0V5fQdeOkceBQe+2BxJcymWZFrkoZjCw5SXq33zogtM8wx2jcYccTOZOl0
	thZNhLZOYo5EDdu/N6P2agzS0jJxBrnLR64EaczYZkmd1Z2OiCeOG+6NMtVnYy3K
	WEPUbROpdIV8lFCBZwmCNzEiMxWTjm/xtnBKtvBjrmzGHmJ6TgLd99+ErbQxFSMj
	B1aN7JrQ7CpxvraT0Aj5n5GUFDKpbfSKDFxH9G1yDgM3MJTNuEF9qP1ol7j0MNEp
	oaxKmWhlvxd0KaXXHxioQk/4BEQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vpx8shg6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 16:12:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40IGCtr1007126
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 16:12:55 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 18 Jan
 2024 08:12:55 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Thu, 18 Jan 2024 08:12:54 -0800
Subject: [PATCH 2/5] wifi: ath10k: correctly document enum
 wmi_tlv_tx_pause_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240118-ath10k-kerneldoc-v1-2-99c7e8d95aad@quicinc.com>
References: <20240118-ath10k-kerneldoc-v1-0-99c7e8d95aad@quicinc.com>
In-Reply-To: <20240118-ath10k-kerneldoc-v1-0-99c7e8d95aad@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5bNRrb3fY-XX-4SLPoWVn6jbR40JS2Wp
X-Proofpoint-GUID: 5bNRrb3fY-XX-4SLPoWVn6jbR40JS2Wp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_08,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=737 impostorscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401180118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_081259_258490_C507CE3D 
X-CRM114-Status: GOOD (  12.56  )
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

Currently kernel-doc reports the issue:
drivers/net/wireless/ath/ath10k/wmi-tlv.h:2363: warning: cannot understand function prototype: 'enum wmi_tlv_tx_pause_id '

Update the enum wmi_tlv_tx_pause_id documentation to fix this issue.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index 83a8f07a687f..8a2f87d0a3a3 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -3,7 +3,7 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #ifndef _WMI_TLV_H
 #define _WMI_TLV_H
@@ -2343,7 +2343,7 @@ struct wmi_tlv_adaptive_qcs {
 } __packed;
 
 /**
- * wmi_tlv_tx_pause_id - firmware tx queue pause reason types
+ * enum wmi_tlv_tx_pause_id - firmware tx queue pause reason types
  *
  * @WMI_TLV_TX_PAUSE_ID_MCC: used for by multi-channel firmware scheduler.
  *		Only vdev_map is valid.

-- 
2.42.0


