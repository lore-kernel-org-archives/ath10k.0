Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5274FC47DD3
	for <ath10k@archiver.kernel.org>; Thu, 18 Jan 2024 16:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cwOBLhodr8CT44XbrWbGzF7SdmbNPrU3iBPGctfl20U=; b=yJbh497W3HDWJb
	m7wJkI6KgR8BiFYUDUnXkA2ZwWMhTqp9VBVwgLvJHhxxKOy7XFUSSIBaiz1OcJIYxKrXvfWa2GZsw
	hWd1JCCwGEwa8hsFDw0MydKSzkDontHYWzj5hv68Hd/JeQgrVYmm1vbNIWskRYZ+FLH4vpTVBR+as
	jv+bFqfbe9kSp7suPdN60OEh9QSAG2/HTYYyB/42yJJTcuhp5vMcDtF5YpytrmMDtP9MSGGdc8yWs
	/AF/AiQEwsQl/rAko8+XzQ2AE6DhmCJ0Fquoe++aZrSYf30x28PiLP77g41/naLzQOxLJSSCgE3ad
	RZMI8C0sbOqfF01xPRfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQV0m-003CzA-2b;
	Thu, 18 Jan 2024 16:13:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQV0k-003CxO-05
	for ath10k@lists.infradead.org;
	Thu, 18 Jan 2024 16:12:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40IC3pB8030883;
	Thu, 18 Jan 2024 16:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:to:cc; s=qcppdkim1; bh=cwOBLhodr8CT44
	XbrWbGzF7SdmbNPrU3iBPGctfl20U=; b=C8hFoY+4MqjnKrMiWjEhIGBjMN/QI3
	OIi0RlZ7gwjdVhy3/c6aPrWnWbkHcg61t8T6jK4cEk38vDfRSv/PTvWsUnyNBxC/
	PnSxvhPoF9pkvhbHJqfMaKWfYoH7nOK0q6Gb7i9uTHOfaaTMre2dEjdnUdAk3WDH
	MDqU+d4oA4pqUPWb2KZtb7uvWDUAtJIvD+fQL/fJA6epai/Ji6ZgcALlWPUnn0/C
	mUGVV98v9b7momstRQlshiot0on4gSalr90rBGbTXK9x2L7FQ3Btka6eSsdzYTxi
	kHKVg1DI5xToqTstD6KDB7w4GzP09Pysk/1Lz46NpJ4FsRomy/buaDKA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vq3ns8hyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 16:12:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40IGCtkE013165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 16:12:55 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 18 Jan
 2024 08:12:54 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH 0/5] wifi: ath10k: fix ath10k kerneldoc issues
Date: Thu, 18 Jan 2024 08:12:52 -0800
Message-ID: <20240118-ath10k-kerneldoc-v1-0-99c7e8d95aad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAROqWUC/2WNQQ6CMBBFr0JmbU2nNK248h6GBZZBJmiLLRIN4
 e5WElcu30v++wskikwJjsUCkWZOHHwG3BXg+sZfSXCbGZRUWiIa0Uw9ykEMFD3d2uCEwbY0pC/
 opIY8GyN1/NqS5zpzz2kK8b09zPi1v5j9j80opMDqYG1nlSl1dXo82bF3exfuUK/r+gERV8l+s
 gAAAA==
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 93Gyjc2qukGWbjyt2k9mvrhAkOV4tFLZ
X-Proofpoint-ORIG-GUID: 93Gyjc2qukGWbjyt2k9mvrhAkOV4tFLZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_08,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=562 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401180118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_081258_068173_0134A851 
X-CRM114-Status: UNSURE (   7.19  )
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

With this series applied there are no kernel-doc issues in ath10k
(ath11k and ath12k have already been previously fixed).

---
Jeff Johnson (5):
      wifi: ath10k: add missing wmi_10_4_feature_mask documentation
      wifi: ath10k: correctly document enum wmi_tlv_tx_pause_id
      wifi: ath10k: fix htt_q_state_conf & htt_q_state kernel-doc
      wifi: ath10k: Fix htt_data_tx_completion kernel-doc warning
      wifi: ath10k: Fix enum ath10k_fw_crash_dump_type kernel-doc

 drivers/net/wireless/ath/ath10k/coredump.h |  8 ++++++--
 drivers/net/wireless/ath/ath10k/htt.h      | 12 ++++++++----
 drivers/net/wireless/ath/ath10k/wmi-tlv.h  |  4 ++--
 drivers/net/wireless/ath/ath10k/wmi.h      |  7 +++++--
 4 files changed, 21 insertions(+), 10 deletions(-)
---
base-commit: c1938548bbeed6fcce8fa6e4de9f694994efcc42
change-id: 20240116-ath10k-kerneldoc-61d36e4b1c04


