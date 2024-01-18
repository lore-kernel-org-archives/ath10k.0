Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D3CC47DAF
	for <ath10k@archiver.kernel.org>; Thu, 18 Jan 2024 16:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xu6LTZd46of4ubV1T8bkdLfUORCXmE/Vrh+3G16Hzgg=; b=Wh+YlPY1ijurLrOEM/BwYCqlzy
	jDQUWI6fpiuV7gzgDz7kz3qszM+Pp+DpvLZ5cnCk28GfMtqD0g/hjxQ5Dbiv9PNsoUy3X76on1aiW
	WeOtmC98+PkZyoI+Dqwsa2Igk0wfauW/LkRNiHJ2NNShQTHzn/87mw1wCyLV5Khbqt/ET0uIt4YHk
	UGREIBi5zGJ6SWa5NYWnKFJSc6ty5WnNMV/8R4kSxpEUxr+HpAXmjEQFDilcCiv4y+rMEz/7ODcxM
	fIiOIieEIPzPNXZ6cKWhTRXlF4ytZVMlYs7hhhLd8dPCM5OWfylxy/CVZX5VseHMfOHmZoAg1VUBs
	FOieoG/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQV0p-003D05-2r;
	Thu, 18 Jan 2024 16:13:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQV0m-003Cyl-19
	for ath10k@lists.infradead.org;
	Thu, 18 Jan 2024 16:13:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40IFtoLh003667;
	Thu, 18 Jan 2024 16:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=xu6LTZd46of4ubV1T8bkdLfUORCXmE/Vrh+3G16Hzgg
	=; b=E7t0IQ4KKRqP66W1QzCTrCfwySqO2uRoRHfyYx1R7c10FkgKCA/6RcBaYWg
	7dNocXha1JYlhxg8kUWUC0DbZ/c3d1DgdOuXQndh9PwbrSoMHx6QZQ35qwvKxSlj
	0KOj330oiLtGbkT4RlGjlE6QXTDk6HdQ3801Y/HbcZPlXB6FOpbuNzOtljcDspSB
	Ir+NJG1dmtP15mkeILniSpbZKnWL+UWD/ZObXM9MnruNmuazQdFw/ZkSVRW4LzuX
	KJI+FXqvQpYigq/taxLSqIuFbIdOWrfCf3WW17LmnpxczaezSHQxj2hjswvRC4ji
	F2YXsGrjs6tfMcV8FFj13SP/8xw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vq00116p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 16:12:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40IGCuR1007130
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 16:12:56 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 18 Jan
 2024 08:12:56 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Thu, 18 Jan 2024 08:12:57 -0800
Subject: [PATCH 5/5] wifi: ath10k: Fix enum ath10k_fw_crash_dump_type
 kernel-doc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240118-ath10k-kerneldoc-v1-5-99c7e8d95aad@quicinc.com>
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
X-Proofpoint-GUID: jYp6qPk_ZYAK8Non6zY-kJVaTpyo4p0X
X-Proofpoint-ORIG-GUID: jYp6qPk_ZYAK8Non6zY-kJVaTpyo4p0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_08,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 mlxscore=0 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 bulkscore=0 mlxlogscore=894 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401180118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_081300_406015_F41B869A 
X-CRM114-Status: GOOD (  10.66  )
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

The kernel-doc script currently reports:
drivers/net/wireless/ath/ath10k/coredump.h:27: warning: Enum value 'ATH10K_FW_CRASH_DUMP_REGISTERS' not described in enum 'ath10k_fw_crash_dump_type'
drivers/net/wireless/ath/ath10k/coredump.h:27: warning: Enum value 'ATH10K_FW_CRASH_DUMP_CE_DATA' not described in enum 'ath10k_fw_crash_dump_type'
drivers/net/wireless/ath/ath10k/coredump.h:27: warning: Enum value 'ATH10K_FW_CRASH_DUMP_RAM_DATA' not described in enum 'ath10k_fw_crash_dump_type'
drivers/net/wireless/ath/ath10k/coredump.h:27: warning: Enum value 'ATH10K_FW_CRASH_DUMP_MAX' not described in enum 'ath10k_fw_crash_dump_type'
drivers/net/wireless/ath/ath10k/coredump.h:27: warning: Excess enum value 'ATH10K_FW_CRASH_DUMP_REGDUMP' description in 'ath10k_fw_crash_dump_type'

Fix these issues with the enum ath10k_fw_crash_dump_type kernel-doc.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/coredump.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/coredump.h b/drivers/net/wireless/ath/ath10k/coredump.h
index e5ef0352e319..8d274e0f374b 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.h
+++ b/drivers/net/wireless/ath/ath10k/coredump.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: ISC */
 /*
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _COREDUMP_H_
@@ -13,7 +13,11 @@
 
 /**
  * enum ath10k_fw_crash_dump_type - types of data in the dump file
- * @ATH10K_FW_CRASH_DUMP_REGDUMP: Register crash dump in binary format
+ * @ATH10K_FW_CRASH_DUMP_REGISTERS: Register crash dump in binary format
+ * @ATH10K_FW_CRASH_DUMP_CE_DATA: Copy Engine crash dump data
+ * @ATH10K_FW_CRASH_DUMP_RAM_DATA: RAM crash dump data, contains multiple
+ *				   struct ath10k_dump_ram_data_hdr
+ * @ATH10K_FW_CRASH_DUMP_MAX: Maximum enumeration
  */
 enum ath10k_fw_crash_dump_type {
 	ATH10K_FW_CRASH_DUMP_REGISTERS = 0,

-- 
2.42.0


