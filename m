Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE79CAC5BB
	for <ath10k@archiver.kernel.org>; Fri, 26 Sep 2025 20:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WTgbLB1khmK8Cozej/JDveXZFSzfcGxV3gvXEC4/nLE=; b=KXsPuh5AYrx5kSyRs2xG9X/x4L
	9E415rUS2lL/9oSQjg5+hi5p/eexSy9zSSFuYNumcp+5VyIjwclU5ZksP8Ucv3XjjVpP/PA6xINgk
	0T8dW7yLaPoGu4ltwVC4RMQtssAKoat1C5Q2dfg6xdGkAj/CJCvDOUh5yH+nvnRvWD1R9BAnG/HgS
	Vr/TLd/6ChQPDP4BlqqkmqsAVKI9nypWgY3StnS+c4sDBF2vPuHb0TtEfP8JYu9yANlHbPh4NJmOw
	G2UItW8K4Su14nMhiibDsosA8AD9Y197Ag3z/5eN4f0Up5r0MUQBIqLTygJ8LYoqfZyWmvUDn8yGs
	oSBaXClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2EoZ-00000004DL4-3PRJ;
	Fri, 26 Sep 2025 20:13:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2EoX-00000004DJJ-2voY
	for ath10k@lists.infradead.org;
	Fri, 26 Sep 2025 20:13:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWvAP011604
	for <ath10k@lists.infradead.org>; Fri, 26 Sep 2025 20:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WTgbLB1khmK8Cozej/JDveXZFSzfcGxV3gv
	XEC4/nLE=; b=bN4S815iym22SfMGgnWec5RQAXxDeZxzaxw6atLxLJ8qBmfoXmy
	4V9wT8XqN7vyqsppYFObIzXFgHdLrRGFnUcBoH3qqUhT4rRxVJj+faJ3gPPNxj3a
	McBqxirob3a7gLVbBm3t5c5MboJs/yjNN+Zk9to9r1nEJlFX7vx1gtFgaTd/IW5e
	NXkQLLMmpAN/+gD6cNe9OLXziTO5guTmWsR4gjQA53JOAa0ywyOhHQE/KKt/67rj
	/lfEDdS6X9nkcqov9M+m4BIyGk16UzTKpbTlSfX8vai1sgkBuaZaQdfdYsihiCcV
	RKoRMSMIuPuVnD9qQgfzaoP7PxVQVwFiP9g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u41gd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 26 Sep 2025 20:13:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de53348322so27710521cf.0
        for <ath10k@lists.infradead.org>; Fri, 26 Sep 2025 13:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758917587; x=1759522387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTgbLB1khmK8Cozej/JDveXZFSzfcGxV3gvXEC4/nLE=;
        b=iYS+6O4G0PvE5X1ETyQa7qpGcsH0sTxqeWwF9LFD4fpJOthDLNSJCsqC4dwcSCD+Z6
         KiHRJ/QnDddD+MVQ5xJOPdiGLvsNjVDoGZuY6YQpAOLWVHVr+C4R3dMSwaPTr1QrSo9y
         xCkY41Xd1MFqzXFInwDneFS68Tx5fgsPOS+Cw9YVMeT0IQv83XFEdo2ViqJwqzt1m//Z
         Yg9JI6K5GxenoZqDLVXUMqDBTE5QsUKNgs4tjTbxbXrTi4XGytxv3wi9GIsEuZu1mepO
         CoL3RZH1yx0lg0AW7f0Xo/mxUtNSOuhUTsrqqGQgtuSo2+sSiz5kQ+iwcjVphl73og4D
         NOVw==
X-Forwarded-Encrypted: i=1; AJvYcCUoJsaH1fysH3/UgZZDOoMfK7OaszwFmFQyVibD4ZFki8L0zditQ7avSKyW5prQHMsAznET1fo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzeKo1U7fuDxdwAwCJLVOa8my7OMfiocbrP5nrzGFmIuYW9rr1k
	ItcElZYH8IvysObF/LY1UvhgjSewNaF2ipCduehHrME6vyaghSGIQ3r7DkJKR1nBJ5qmhIIndCD
	qMHmdKpDbCJajAa+aekpiDW82xv9mR2gPiZYq7x+RCAJP4f9Vfcv6kf/7Q2AOefeTX9tf0uIchQ
	4=
X-Gm-Gg: ASbGncsgheaZIiiAQX6zpZ1foJkcM3m/71bDK1fNdcC71Xbc4g8Z+g33fGuzqFr9pHc
	5nH3jUqG5zDy9uCtaXx4tAzkIz9MSVyUbXjk6zGRnUO9BNFOCNES02jWY7Uo9BxoF15nTYt9t7K
	yndOaHWioNrUzdldsTkcb0ldvQKpEGwuvaxZFrUEnRFDdQQPhofkwzfzm3rQ1uL1KoCKVliVRZb
	c6Mllf4jxW0GtmFFDMowEowx9Zx1tsGRapcLN8WMhrqrRutsvppFy80iQVICFIk2ryLeOfeTKxb
	O+8dE6PDumsBPaADTxWd/zSkukSk6cGBD46/VgdbyFyTO4iGWaX80WyvyG2FUhVmpFkChZjX11+
	n5SZaLDtjcIoeh/MpSSnsVXU2fvhw
X-Received: by 2002:a05:622a:1905:b0:4b7:a308:b5b9 with SMTP id d75a77b69052e-4da4b8084a7mr126491041cf.46.1758917586972;
        Fri, 26 Sep 2025 13:13:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ+EZB43KL31DilX03Api/4qimySwTM8zvn0Y8fEx4Cs1Hvw3rmEB4XXFODklSEoAjEvaiXQ==
X-Received: by 2002:a05:622a:1905:b0:4b7:a308:b5b9 with SMTP id d75a77b69052e-4da4b8084a7mr126490571cf.46.1758917586310;
        Fri, 26 Sep 2025 13:13:06 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:5de9:cd6:92fe:bfb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fcdd89sm428760866b.79.2025.09.26.13.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 13:13:05 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath10k: Support for FTM TLV test commands
Date: Fri, 26 Sep 2025 22:13:03 +0200
Message-Id: <20250926201303.194029-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: R9Q_XJZHthCoCZg_Lx_b2wUjhirKYQD4
X-Proofpoint-GUID: R9Q_XJZHthCoCZg_Lx_b2wUjhirKYQD4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX6aQfkcoorIiM
 B1UfU1R/fbCffYomH9k5TI0WMQQbTeiI2FWLnljCmqQy1/v0GjVyCogJlct4QZ0GNc5iVT8ghPu
 3NZinbZh3yilD3FRFptnBPk7e8XkPQTO518k2gSNDWST7YXkiKccaE09BYR/cs5/wrMQQH99UmQ
 cfTKyfep6YU632iA6QMvwf1eclShY+ZnGBSCxS8ZZNw0APXoUBnOrD/r31WrBKBQCgmo32aBMpu
 r1IK2Ll9oBzAv3MzJABGXJ8ybl8HNJo/72H2HYLQeRD3HaVIyKYNAzDr2m/6LSArVU3IMhKlRaS
 Bhs3+/Dd4Y1RauOrhGpmiUnPFlltDHo5sfGrSsFCYgowliREsE9FKTk1LxcKxQgZfFKlWiAd/qX
 gQsPR8hey3c2CYM4FkirCBhHw11jwg==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d6f3d4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=jNky2xIMEC1gJP5me7YA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_07,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_131309_867381_78A96369 
X-CRM114-Status: GOOD (  24.48  )
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

Existing tools like myftm use 'legacy' test command API. Similarly
to ath11k and ath12k, we want to support raw TLV payload submitted
from the test tool. This requires segmenting the TLV payload and
encapsulating it within a WMI command. The opposite operation needs
to be done upon corresponding event receiving.

Tested-on: WCN3990 hw1.0 WLAN.HL.3.3.7.c2-00931-QCAHLSWMTPLZ-1

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.h       |   5 +-
 drivers/net/wireless/ath/ath10k/testmode.c   | 251 ++++++++++++++++---
 drivers/net/wireless/ath/ath10k/testmode_i.h |  15 ++
 drivers/net/wireless/ath/ath10k/wmi.h        |  19 +-
 4 files changed, 258 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 8c72ed386edb..3b4dde292a7a 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -3,7 +3,6 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
@@ -1259,9 +1258,13 @@ struct ath10k {
 	struct {
 		/* protected by conf_mutex */
 		struct ath10k_fw_components utf_mode_fw;
+		u8 ftm_msgref;
 
 		/* protected by data_lock */
 		bool utf_monitor;
+		u32 data_pos;
+		u32 expected_seq;
+		u8 *eventdata;
 	} testmode;
 
 	struct {
diff --git a/drivers/net/wireless/ath/ath10k/testmode.c b/drivers/net/wireless/ath/ath10k/testmode.c
index 3fcefc55b74f..48db9045756b 100644
--- a/drivers/net/wireless/ath/ath10k/testmode.c
+++ b/drivers/net/wireless/ath/ath10k/testmode.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: ISC
 /*
  * Copyright (c) 2014-2017 Qualcomm Atheros, Inc.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "testmode.h"
@@ -10,12 +11,17 @@
 
 #include "debug.h"
 #include "wmi.h"
+#include "wmi-tlv.h"
 #include "hif.h"
 #include "hw.h"
 #include "core.h"
 
 #include "testmode_i.h"
 
+#define ATH10K_FTM_SEG_NONE			((u32)-1)
+#define ATH10K_FTM_SEGHDR_CURRENT_SEQ		GENMASK(3, 0)
+#define ATH10K_FTM_SEGHDR_TOTAL_SEGMENTS	GENMASK(7, 4)
+
 static const struct nla_policy ath10k_tm_policy[ATH10K_TM_ATTR_MAX + 1] = {
 	[ATH10K_TM_ATTR_CMD]		= { .type = NLA_U32 },
 	[ATH10K_TM_ATTR_DATA]		= { .type = NLA_BINARY,
@@ -25,41 +31,18 @@ static const struct nla_policy ath10k_tm_policy[ATH10K_TM_ATTR_MAX + 1] = {
 	[ATH10K_TM_ATTR_VERSION_MINOR]	= { .type = NLA_U32 },
 };
 
-/* Returns true if callee consumes the skb and the skb should be discarded.
- * Returns false if skb is not used. Does not sleep.
- */
-bool ath10k_tm_event_wmi(struct ath10k *ar, u32 cmd_id, struct sk_buff *skb)
+static void ath10k_tm_event_unsegmented(struct ath10k *ar, u32 cmd_id, struct sk_buff *skb)
 {
 	struct sk_buff *nl_skb;
-	bool consumed;
 	int ret;
 
-	ath10k_dbg(ar, ATH10K_DBG_TESTMODE,
-		   "testmode event wmi cmd_id %d skb %p skb->len %d\n",
-		   cmd_id, skb, skb->len);
-
-	ath10k_dbg_dump(ar, ATH10K_DBG_TESTMODE, NULL, "", skb->data, skb->len);
-
-	spin_lock_bh(&ar->data_lock);
-
-	if (!ar->testmode.utf_monitor) {
-		consumed = false;
-		goto out;
-	}
-
-	/* Only testmode.c should be handling events from utf firmware,
-	 * otherwise all sort of problems will arise as mac80211 operations
-	 * are not initialised.
-	 */
-	consumed = true;
-
 	nl_skb = cfg80211_testmode_alloc_event_skb(ar->hw->wiphy,
 						   2 * sizeof(u32) + skb->len,
 						   GFP_ATOMIC);
 	if (!nl_skb) {
 		ath10k_warn(ar,
 			    "failed to allocate skb for testmode wmi event\n");
-		goto out;
+		return;
 	}
 
 	ret = nla_put_u32(nl_skb, ATH10K_TM_ATTR_CMD, ATH10K_TM_CMD_WMI);
@@ -68,7 +51,7 @@ bool ath10k_tm_event_wmi(struct ath10k *ar, u32 cmd_id, struct sk_buff *skb)
 			    "failed to put testmode wmi event cmd attribute: %d\n",
 			    ret);
 		kfree_skb(nl_skb);
-		goto out;
+		return;
 	}
 
 	ret = nla_put_u32(nl_skb, ATH10K_TM_ATTR_WMI_CMDID, cmd_id);
@@ -77,7 +60,7 @@ bool ath10k_tm_event_wmi(struct ath10k *ar, u32 cmd_id, struct sk_buff *skb)
 			    "failed to put testmode wmi event cmd_id: %d\n",
 			    ret);
 		kfree_skb(nl_skb);
-		goto out;
+		return;
 	}
 
 	ret = nla_put(nl_skb, ATH10K_TM_ATTR_DATA, skb->len, skb->data);
@@ -86,10 +69,121 @@ bool ath10k_tm_event_wmi(struct ath10k *ar, u32 cmd_id, struct sk_buff *skb)
 			    "failed to copy skb to testmode wmi event: %d\n",
 			    ret);
 		kfree_skb(nl_skb);
-		goto out;
+		return;
+	}
+
+	cfg80211_testmode_event(nl_skb, GFP_ATOMIC);
+}
+
+static void ath10k_tm_event_segmented(struct ath10k *ar, u32 cmd_id, struct sk_buff *skb)
+{
+	struct wmi_ftm_cmd *ftm = (struct wmi_ftm_cmd *)skb->data;
+	u8 total_segments, current_seq;
+	struct sk_buff *nl_skb;
+	u8 const *buf_pos;
+	u16 datalen;
+	u32 data_pos;
+	int ret;
+
+	if (skb->len < sizeof(*ftm)) {
+		ath10k_warn(ar, "Invalid ftm event length: %d\n", skb->len);
+		return;
+	}
+
+	current_seq = FIELD_GET(ATH10K_FTM_SEGHDR_CURRENT_SEQ, ftm->seg_hdr.segmentinfo);
+	total_segments = FIELD_GET(ATH10K_FTM_SEGHDR_TOTAL_SEGMENTS,
+				   ftm->seg_hdr.segmentinfo);
+	datalen = skb->len - sizeof(*ftm);
+	buf_pos = ftm->data;
+
+	if (current_seq == 0) {
+		ar->testmode.expected_seq = 0;
+		ar->testmode.data_pos = 0;
+	}
+
+	data_pos = ar->testmode.data_pos;
+
+	if ((data_pos + datalen) > ATH_FTM_EVENT_MAX_BUF_LENGTH) {
+		ath10k_warn(ar, "Invalid ftm event length at %u: %u\n",
+			    data_pos, datalen);
+		ret = -EINVAL;
+		return;
+	}
+
+	memcpy(&ar->testmode.eventdata[data_pos], buf_pos, datalen);
+	data_pos += datalen;
+
+	if (++ar->testmode.expected_seq != total_segments) {
+		ar->testmode.data_pos = data_pos;
+		ath10k_dbg(ar, ATH10K_DBG_TESTMODE, "partial data received %u/%u\n",
+			   current_seq + 1, total_segments);
+		return;
+	}
+
+	ath10k_dbg(ar, ATH10K_DBG_TESTMODE, "total data length %u\n", data_pos);
+
+	nl_skb = cfg80211_testmode_alloc_event_skb(ar->hw->wiphy,
+						   2 * sizeof(u32) + data_pos,
+						   GFP_ATOMIC);
+	if (!nl_skb) {
+		ath10k_warn(ar, "failed to allocate skb for testmode wmi event\n");
+		return;
+	}
+
+	ret = nla_put_u32(nl_skb, ATH10K_TM_ATTR_CMD, ATH10K_TM_CMD_TLV);
+	if (ret) {
+		ath10k_warn(ar, "failed to put testmode wmi event attribute: %d\n", ret);
+		kfree_skb(nl_skb);
+		return;
+	}
+
+	ret = nla_put_u32(nl_skb, ATH10K_TM_ATTR_WMI_CMDID, cmd_id);
+	if (ret) {
+		ath10k_warn(ar, "failed to put testmode wmi event cmd_id: %d\n", ret);
+		kfree_skb(nl_skb);
+		return;
+	}
+
+	ret = nla_put(nl_skb, ATH10K_TM_ATTR_DATA, data_pos, &ar->testmode.eventdata[0]);
+	if (ret) {
+		ath10k_warn(ar, "failed to copy skb to testmode wmi event: %d\n", ret);
+		kfree_skb(nl_skb);
+		return;
 	}
 
 	cfg80211_testmode_event(nl_skb, GFP_ATOMIC);
+}
+
+/* Returns true if callee consumes the skb and the skb should be discarded.
+ * Returns false if skb is not used. Does not sleep.
+ */
+bool ath10k_tm_event_wmi(struct ath10k *ar, u32 cmd_id, struct sk_buff *skb)
+{
+	bool consumed;
+
+	ath10k_dbg(ar, ATH10K_DBG_TESTMODE,
+		   "testmode event wmi cmd_id %d skb %p skb->len %d\n",
+		   cmd_id, skb, skb->len);
+
+	ath10k_dbg_dump(ar, ATH10K_DBG_TESTMODE, NULL, "", skb->data, skb->len);
+
+	spin_lock_bh(&ar->data_lock);
+
+	if (!ar->testmode.utf_monitor) {
+		consumed = false;
+		goto out;
+	}
+
+	/* Only testmode.c should be handling events from utf firmware,
+	 * otherwise all sort of problems will arise as mac80211 operations
+	 * are not initialised.
+	 */
+	consumed = true;
+
+	if (ar->testmode.expected_seq != ATH10K_FTM_SEG_NONE)
+		ath10k_tm_event_segmented(ar, cmd_id, skb);
+	else
+		ath10k_tm_event_unsegmented(ar, cmd_id, skb);
 
 out:
 	spin_unlock_bh(&ar->data_lock);
@@ -281,12 +375,18 @@ static int ath10k_tm_cmd_utf_start(struct ath10k *ar, struct nlattr *tb[])
 		goto err_release_utf_mode_fw;
 	}
 
+	ar->testmode.eventdata = kzalloc(ATH_FTM_EVENT_MAX_BUF_LENGTH, GFP_KERNEL);
+	if (!ar->testmode.eventdata) {
+		ret = -ENOMEM;
+		goto err_power_down;
+	}
+
 	ret = ath10k_core_start(ar, ATH10K_FIRMWARE_MODE_UTF,
 				&ar->testmode.utf_mode_fw);
 	if (ret) {
 		ath10k_err(ar, "failed to start core (testmode): %d\n", ret);
 		ar->state = ATH10K_STATE_OFF;
-		goto err_power_down;
+		goto err_release_eventdata;
 	}
 
 	ar->state = ATH10K_STATE_UTF;
@@ -302,6 +402,10 @@ static int ath10k_tm_cmd_utf_start(struct ath10k *ar, struct nlattr *tb[])
 
 	return 0;
 
+err_release_eventdata:
+	kfree(ar->testmode.eventdata);
+	ar->testmode.eventdata = NULL;
+
 err_power_down:
 	ath10k_hif_power_down(ar);
 
@@ -341,6 +445,9 @@ static void __ath10k_tm_cmd_utf_stop(struct ath10k *ar)
 	release_firmware(ar->testmode.utf_mode_fw.fw_file.firmware);
 	ar->testmode.utf_mode_fw.fw_file.firmware = NULL;
 
+	kfree(ar->testmode.eventdata);
+	ar->testmode.eventdata = NULL;
+
 	ar->state = ATH10K_STATE_OFF;
 }
 
@@ -424,6 +531,85 @@ static int ath10k_tm_cmd_wmi(struct ath10k *ar, struct nlattr *tb[])
 	return ret;
 }
 
+static int ath10k_tm_cmd_tlv(struct ath10k *ar, struct nlattr *tb[])
+{
+	u16 total_bytes, num_segments;
+	u32 cmd_id, buf_len;
+	u8 segnumber = 0;
+	u8 *bufpos;
+	void *buf;
+	int ret;
+
+	mutex_lock(&ar->conf_mutex);
+
+	if (ar->state != ATH10K_STATE_UTF) {
+		ret = -ENETDOWN;
+		goto out;
+	}
+
+	buf = nla_data(tb[ATH10K_TM_ATTR_DATA]);
+	buf_len = nla_len(tb[ATH10K_TM_ATTR_DATA]);
+	cmd_id = WMI_PDEV_UTF_CMDID;
+
+	ath10k_dbg(ar, ATH10K_DBG_TESTMODE,
+		   "cmd wmi ftm cmd_id %d buffer length %d\n",
+		   cmd_id, buf_len);
+	ath10k_dbg_dump(ar, ATH10K_DBG_TESTMODE, NULL, "", buf, buf_len);
+
+	bufpos = buf;
+	total_bytes = buf_len;
+	num_segments = total_bytes / MAX_WMI_UTF_LEN;
+	ar->testmode.expected_seq = 0;
+
+	if (buf_len - (num_segments * MAX_WMI_UTF_LEN))
+		num_segments++;
+
+	while (buf_len) {
+		u16 chunk_len = min_t(u16, buf_len, MAX_WMI_UTF_LEN);
+		struct wmi_ftm_cmd *ftm_cmd;
+		struct sk_buff *skb;
+		u32 hdr_info;
+		u8 seginfo;
+
+		skb = ath10k_wmi_alloc_skb(ar, (chunk_len +
+					   sizeof(struct wmi_ftm_cmd)));
+		if (!skb) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		ftm_cmd = (struct wmi_ftm_cmd *)skb->data;
+		hdr_info = FIELD_PREP(WMI_TLV_TAG, WMI_TLV_TAG_ARRAY_BYTE) |
+			   FIELD_PREP(WMI_TLV_LEN, (chunk_len +
+				      sizeof(struct wmi_ftm_seg_hdr)));
+		ftm_cmd->tlv_header = hdr_info;
+		ftm_cmd->seg_hdr.len = total_bytes;
+		ftm_cmd->seg_hdr.msgref = ar->testmode.ftm_msgref;
+		seginfo = FIELD_PREP(ATH10K_FTM_SEGHDR_TOTAL_SEGMENTS, num_segments) |
+			  FIELD_PREP(ATH10K_FTM_SEGHDR_CURRENT_SEQ, segnumber);
+		ftm_cmd->seg_hdr.segmentinfo = seginfo;
+		segnumber++;
+
+		memcpy(&ftm_cmd->data, bufpos, chunk_len);
+
+		ret = ath10k_wmi_cmd_send(ar, skb, cmd_id);
+		if (ret) {
+			ath10k_warn(ar, "failed to send wmi ftm command: %d\n", ret);
+			goto out;
+		}
+
+		buf_len -= chunk_len;
+		bufpos += chunk_len;
+	}
+
+	ar->testmode.ftm_msgref++;
+	ret = 0;
+
+out:
+	mutex_unlock(&ar->conf_mutex);
+	return ret;
+}
+
 int ath10k_tm_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		  void *data, int len)
 {
@@ -439,9 +625,14 @@ int ath10k_tm_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	if (!tb[ATH10K_TM_ATTR_CMD])
 		return -EINVAL;
 
+	ar->testmode.expected_seq = ATH10K_FTM_SEG_NONE;
+
 	switch (nla_get_u32(tb[ATH10K_TM_ATTR_CMD])) {
 	case ATH10K_TM_CMD_GET_VERSION:
-		return ath10k_tm_cmd_get_version(ar, tb);
+		if (!tb[ATH10K_TM_ATTR_DATA])
+			return ath10k_tm_cmd_get_version(ar, tb);
+		else /* ATH10K_TM_CMD_TLV */
+			return ath10k_tm_cmd_tlv(ar, tb);
 	case ATH10K_TM_CMD_UTF_START:
 		return ath10k_tm_cmd_utf_start(ar, tb);
 	case ATH10K_TM_CMD_UTF_STOP:
diff --git a/drivers/net/wireless/ath/ath10k/testmode_i.h b/drivers/net/wireless/ath/ath10k/testmode_i.h
index ee1cb27c1d60..1603f5276682 100644
--- a/drivers/net/wireless/ath/ath10k/testmode_i.h
+++ b/drivers/net/wireless/ath/ath10k/testmode_i.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: ISC */
 /*
  * Copyright (c) 2014,2017 Qualcomm Atheros, Inc.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 /* "API" level of the ath10k testmode interface. Bump it after every
@@ -14,6 +15,7 @@
 #define ATH10K_TESTMODE_VERSION_MINOR 0
 
 #define ATH10K_TM_DATA_MAX_LEN		5000
+#define ATH_FTM_EVENT_MAX_BUF_LENGTH	2048
 
 enum ath10k_tm_attr {
 	__ATH10K_TM_ATTR_INVALID	= 0,
@@ -57,4 +59,17 @@ enum ath10k_tm_cmd {
 	 * ATH10K_TM_ATTR_DATA.
 	 */
 	ATH10K_TM_CMD_WMI = 3,
+
+	/* The command used to transmit a test command to the firmware
+	 * and the event to receive test events from the firmware. The data
+	 * received only contain the TLV payload, need to add the tlv header
+	 * and send the cmd to firmware with command id WMI_PDEV_UTF_CMDID.
+	 * The data payload size could be large and the driver needs to
+	 * send segmented data to firmware.
+	 *
+	 * This legacy testmode command shares the same value as the get-version
+	 * command. To distinguish between them, we check whether the data attribute
+	 * is present.
+	 */
+	ATH10K_TM_CMD_TLV = ATH10K_TM_CMD_GET_VERSION,
 };
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 0faefc0a9a40..7f50a1de6b97 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -3,7 +3,7 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _WMI_H_
@@ -7418,6 +7418,23 @@ struct wmi_pdev_bb_timing_cfg_cmd {
 	__le32 bb_xpa_timing;
 } __packed;
 
+struct wmi_ftm_seg_hdr {
+	__le32 len;
+	__le32 msgref;
+	__le32 segmentinfo;
+	__le32 pdev_id;
+} __packed;
+
+struct wmi_ftm_cmd {
+	__le32 tlv_header;
+	struct wmi_ftm_seg_hdr seg_hdr;
+	u8 data[];
+} __packed;
+
+#define WMI_TLV_LEN      GENMASK(15, 0)
+#define WMI_TLV_TAG	 GENMASK(31, 16)
+#define MAX_WMI_UTF_LEN  252
+
 struct ath10k;
 struct ath10k_vif;
 struct ath10k_fw_stats_pdev;
-- 
2.34.1


