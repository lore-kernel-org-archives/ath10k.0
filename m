Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC58C47DB3
	for <ath10k@archiver.kernel.org>; Thu, 18 Jan 2024 16:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzUk4+HXKrHL5KZwlScT2HafLHWcYPazTpGyCwMmxe8=; b=4YIJWFxe7PG3TqRwWr2p7B5ovF
	z5b4cy8/EMkMPMxadkLxjZSilOw3vliWox8suX0GHv1VAU44+vpHTAeW4LtIXISKhHcmKJ635EaJT
	wOkcfT04SmLiM7H9UABZ5NGqVKP6vETxMffmZDvTOqwq6Z0E8ZBo17V1pFPUoQXDxsztLfSgjnr3W
	kEd2oxvfFV+VnX9ZgHePnmTqUS/FElCZKuTWS2bAk//jN5K4dkp3W1nQ6YTYPsfu8tMB2HHX+eQgC
	imzwjm3C4+U9XApILm2IMZ7saVdx0q3+CoxnJtkd5HJ/ztoaz8oUUh683/dlWBdMgf0qFyNlwJlrE
	3bIJqm8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQV0n-003CzO-1B;
	Thu, 18 Jan 2024 16:13:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQV0k-003Cxc-1C
	for ath10k@lists.infradead.org;
	Thu, 18 Jan 2024 16:12:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40IFt73j005152;
	Thu, 18 Jan 2024 16:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=RzUk4+HXKrHL5KZwlScT2HafLHWcYPazTpGyCwMmxe8
	=; b=Msi9eP5w2IVo+RtDoYZueuxZ8cFgafntdQMxZapBSzHyKKmtUQCDcWFQUmC
	8a8ZoA1aGwVHtw5u1+7Ea7z5WLhhvFflA9FnPPqGFkXkpowaG/hQjCCneVvun4QI
	Sh+cEokZmaJFiB8JjhqSlDvx50/qru1YDHuukKBJ9a8UCV+tBWqYeFO1+ABCJZNU
	Mx3xvmxJrM2ydOMDsdqgX2pPQYsM/tYB0FRSjcLqhPwKZb73N26zFiDy4JGRru0N
	FSsGVzsjf1UeZJlzhnWP8S9j+JeplEQAzbQ4a/aoYR5Qrrv3LJIRdwt2SQj4AsTv
	g5tVc5BOa1zCAGs3lN4e7+ak4QA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vq5qrg8qv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 16:12:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40IGCtin026673
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 16:12:55 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 18 Jan
 2024 08:12:55 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Thu, 18 Jan 2024 08:12:53 -0800
Subject: [PATCH 1/5] wifi: ath10k: add missing wmi_10_4_feature_mask
 documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240118-ath10k-kerneldoc-v1-1-99c7e8d95aad@quicinc.com>
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
X-Proofpoint-GUID: UmK_HaZsNYcE7DMirE1UMAT4u9DyUtJh
X-Proofpoint-ORIG-GUID: UmK_HaZsNYcE7DMirE1UMAT4u9DyUtJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_08,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 phishscore=0 mlxlogscore=610 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401180118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_081258_414089_A1747E33 
X-CRM114-Status: GOOD (  11.21  )
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

Currently kernel-doc reports the following issues:
drivers/net/wireless/ath/ath10k/wmi.h:3033: warning: Enum value 'WMI_10_4_EXT_PEER_TID_CONFIGS_SUPPORT' not described in enum 'wmi_10_4_feature_mask'
drivers/net/wireless/ath/ath10k/wmi.h:3033: warning: Enum value 'WMI_10_4_REPORT_AIRTIME' not described in enum 'wmi_10_4_feature_mask'

Update the kernel-doc for enum wmi_10_4_feature_mask to add the
missing documentation.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index b64b6e214bae..2379501225a4 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -3,7 +3,7 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _WMI_H_
@@ -3008,8 +3008,11 @@ enum wmi_coex_version {
  * @WMI_10_4_TDLS_UAPSD_SLEEP_STA: TDLS sleep sta support enable/disable
  * @WMI_10_4_TDLS_CONN_TRACKER_IN_HOST_MODE: TDLS connection tracker in host
  *	enable/disable
- * @WMI_10_4_TDLS_EXPLICIT_MODE_ONLY:Explicit TDLS mode enable/disable
+ * @WMI_10_4_TDLS_EXPLICIT_MODE_ONLY: Explicit TDLS mode enable/disable
  * @WMI_10_4_TX_DATA_ACK_RSSI: Enable DATA ACK RSSI if firmware is capable
+ * @WMI_10_4_EXT_PEER_TID_CONFIGS_SUPPORT:  Firmware supports Extended Peer
+ *	TID configuration for QoS related settings
+ * @WMI_10_4_REPORT_AIRTIME: Firmware supports transmit airtime reporting
  */
 enum wmi_10_4_feature_mask {
 	WMI_10_4_LTEU_SUPPORT			= BIT(0),

-- 
2.42.0


