Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2878CCD199
	for <ath10k@archiver.kernel.org>; Mon, 20 Oct 2025 15:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vsRopZDLOQEj9hwm5Ujn2UKLBTKI7o+Co5CptSwUNMI=; b=on2Jsn4BRuBSQPDL+DIjuRNB9B
	4NvAYh6RfJz3fnuHaimqYTxtNR0BA+i1QAcdpib7s3O9a2X8KnItxtNv1CF1s/fFuTYk5cmGsPgyN
	3BrI0KDokAxvziC2LjPiMebmZC4//p656FR1MGx7v+zuBJp/7RYu7jKgLlHKyKjfRuCPzAz82HWic
	lbVQZNbc1nZDKDLKY6jw2Fq3QSuD8AKjktAn1X04DjxgGskKim9h60gn2YgRS/6gh430S3HMHQGsY
	Ko6edDHVFTZhRgZf6WwOcZwFzDKy3PNS33uUPFdPq3W5idAA1pcuVuiNiTz0psneYVcb4s1AlM8uE
	XjRqDiLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArxZ-0000000EACy-1VvB;
	Mon, 20 Oct 2025 15:38:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArxW-0000000EAB8-3JVf
	for ath10k@lists.infradead.org;
	Mon, 20 Oct 2025 15:38:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBODKr003776
	for <ath10k@lists.infradead.org>; Mon, 20 Oct 2025 15:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vsRopZDLOQEj9hwm5Ujn2UKLBTKI7o+Co5C
	ptSwUNMI=; b=oexcu7FqxEK1+Y1OHCofSCrzHm/moBmWVjGOr4Fj9czjwTOLHSO
	D8m7uFgfr2Bz6Kjok6B5G4jXbKtrHSFuU0uDnpmNVwMCZAIrSXnRT+bxnZcHRhDU
	VKvIjOgVTc4kVWq4D0DogeKJ2KkA9TnGuLfusha3RAzPTTyxl+1WA9Iyi75olVod
	J4P6nSocT02K1wA8jHP/f3SL+maDI+QjJ5/J/wnx5cM+e/dtXj2nKbDa7Bbf/Mjo
	LW/KvhoamGWfB/m9jdLXuw3YovaHFKdaDZOU7EfxF/jpUDuP4Sxp8OCdBvqCPkQQ
	eOT10uzBx+jFuvHlN8yWQM/vRq0dt0maBYQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfd71c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 20 Oct 2025 15:38:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-890f1090e44so957179885a.3
        for <ath10k@lists.infradead.org>; Mon, 20 Oct 2025 08:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760974684; x=1761579484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsRopZDLOQEj9hwm5Ujn2UKLBTKI7o+Co5CptSwUNMI=;
        b=O2Np6HE7DnM+T1ufA2ij1xpUcWKLUHpKTcp5bXYrwXtgOZr7OIRLuWDOkoGo8bwXtp
         nEm/AMwY9txG4aGd1N9a2ccsK1yzY7PHB0XtDGZJULpCYr0NlAqeclRS9B+nsXTKbHY9
         YluJ4GJPoUBKyfV+EjIZnF7+5Z2uhqCdqw+z/3KGfoYCqa29l36+tlp1ERJVMSwTqeM6
         40ERe/NPNjYhhEgKJ6Y8Mv2XMlb5LLmL9ZN9UW+AqSqk+nJuhQmiFaWMpRbBO5ugvZ7o
         ivGAcv0mzZkSFlPFgoMG/wRMw0OpGjywLlGgX5MbGgxC45+fd5qR3bwsAcD7eyLmiQ3Q
         uiOw==
X-Gm-Message-State: AOJu0Yy89shdAPfAq0p/b4gJtqfUwBwP9WcimRgYBmPq43V8SDzWE744
	IUolE4qjvjJY6rgwFppqgJUpAHbKWOnFp3zT5n4s615jtrGpRX56YLyWamLxfVGxARJV+TDGfqx
	4LIrd+hgfHhINk2TOkIBjb12PRS1QaDx1haTmvBjJiOXqNHxpXlTRo0dADm1Aq4s+3J98CmLO6D
	o=
X-Gm-Gg: ASbGncumW92ptrbVudvflmHCB896vFbGLh6hK+6Zuoihv9fc5B5eRHj23lt79FmpP00
	tsbya7cYL+TR4I+NnPD0YkQ6q3PPwK3TErfB1M8pCA3snIxvn+PXFbzJfzAdlO9zZuFW87Y1aAU
	V9FcV/piHDwZWeo5S9kI6L9LLRTe9bt8yZsU3ATJhRGUeLd0UNqiVVyfEd3jNOUUCPUhPUBDSdr
	0oEXTY7RpMLzzCJiOHwziZUaurxOGj3t64kFvGPurREfiSr2Xg0lsBVYM/LqWgzzvn+FF5zvY+W
	E63jlOinYkLDtzeUZL1bOmnczPC03mXLRhTzceamcuY/5VIzykjrcQUdFPrHAzuPORQw9qhLU0k
	irlzF5SE7bAHu/OHW0eGZp3MSnxnyUdmE5e8/W1oDDCK45U0HG+KKVkk0VKJjfW10
X-Received: by 2002:a05:622a:1450:b0:4e8:ad2a:b0cf with SMTP id d75a77b69052e-4e8ad2adeb5mr98592401cf.9.1760974683238;
        Mon, 20 Oct 2025 08:38:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM/IlIzVCJ37v1h6Dkzerk5daN+4+YRVlqWBHA0va61aAIx3aCKhdpUNqJYVsDbGYxBUmIgg==
X-Received: by 2002:a05:622a:1450:b0:4e8:ad2a:b0cf with SMTP id d75a77b69052e-4e8ad2adeb5mr98592061cf.9.1760974682638;
        Mon, 20 Oct 2025 08:38:02 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:549:f31b:11b1:14c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a9a9sm16391257f8f.29.2025.10.20.08.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 08:38:02 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2] wifi: ath10k: Support for FTM TLV test commands
Date: Mon, 20 Oct 2025 17:37:59 +0200
Message-Id: <20251020153759.407516-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: z5GQmVyR14ApbVd8WhtUlb2GVWw5cYwh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX4XMM8iy18zhK
 +FvzPgWvDQEr59+gzQ09VUsL13b8TIuN47zEtjeg8j1i3PsbywTtX++iGrnmCpa9Jx1wMmllpTx
 qoIHmcoiyoLw0K0TIujmIrjVRAE7SAQ2XiTVFuDAs9fONWjTzz0j1EQCSUqvFbokjkcG5zkXzPj
 gSqMSDYniEmAbNjps0M+H6HLjvWjlecjK+TnMuGyOn88M7a7fdsP0NjBz+CS8se5NJBo8euNhx+
 wWe1Ci+vsT1ryf0CDtxlWpwMD+8ZTY1wOaoEf0J6HFkp0QL86h3aWwLAoKsDWbMIN2SnKUwEMtY
 4dBtUoNVHR18ZrfBzgJl+4cnafmG+gnVDiR6d98YqFj9mirTIlcQUZf7XbvDZExUa2mPEIKw8vI
 vL9IlxUCoABZix2vJslnwGAeIlfG6Q==
X-Proofpoint-GUID: z5GQmVyR14ApbVd8WhtUlb2GVWw5cYwh
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f6575d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jNky2xIMEC1gJP5me7YA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_083806_827952_C8DABD2F 
X-CRM114-Status: GOOD (  24.71  )
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
 v2: Fix endianness issues reported by kernel test robot

 drivers/net/wireless/ath/ath10k/core.h       |   5 +-
 drivers/net/wireless/ath/ath10k/testmode.c   | 252 ++++++++++++++++---
 drivers/net/wireless/ath/ath10k/testmode_i.h |  15 ++
 drivers/net/wireless/ath/ath10k/wmi.h        |  19 +-
 4 files changed, 259 insertions(+), 32 deletions(-)

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
index 3fcefc55b74f..2b042c12265a 100644
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
@@ -86,10 +69,122 @@ bool ath10k_tm_event_wmi(struct ath10k *ar, u32 cmd_id, struct sk_buff *skb)
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
+	current_seq = FIELD_GET(ATH10K_FTM_SEGHDR_CURRENT_SEQ,
+				__le32_to_cpu(ftm->seg_hdr.segmentinfo));
+	total_segments = FIELD_GET(ATH10K_FTM_SEGHDR_TOTAL_SEGMENTS,
+				   __le32_to_cpu(ftm->seg_hdr.segmentinfo));
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
@@ -281,12 +376,18 @@ static int ath10k_tm_cmd_utf_start(struct ath10k *ar, struct nlattr *tb[])
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
@@ -302,6 +403,10 @@ static int ath10k_tm_cmd_utf_start(struct ath10k *ar, struct nlattr *tb[])
 
 	return 0;
 
+err_release_eventdata:
+	kfree(ar->testmode.eventdata);
+	ar->testmode.eventdata = NULL;
+
 err_power_down:
 	ath10k_hif_power_down(ar);
 
@@ -341,6 +446,9 @@ static void __ath10k_tm_cmd_utf_stop(struct ath10k *ar)
 	release_firmware(ar->testmode.utf_mode_fw.fw_file.firmware);
 	ar->testmode.utf_mode_fw.fw_file.firmware = NULL;
 
+	kfree(ar->testmode.eventdata);
+	ar->testmode.eventdata = NULL;
+
 	ar->state = ATH10K_STATE_OFF;
 }
 
@@ -424,6 +532,85 @@ static int ath10k_tm_cmd_wmi(struct ath10k *ar, struct nlattr *tb[])
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
+		ftm_cmd->tlv_header = __cpu_to_le32(hdr_info);
+		ftm_cmd->seg_hdr.len = __cpu_to_le32(total_bytes);
+		ftm_cmd->seg_hdr.msgref = __cpu_to_le32(ar->testmode.ftm_msgref);
+		seginfo = FIELD_PREP(ATH10K_FTM_SEGHDR_TOTAL_SEGMENTS, num_segments) |
+			  FIELD_PREP(ATH10K_FTM_SEGHDR_CURRENT_SEQ, segnumber);
+		ftm_cmd->seg_hdr.segmentinfo = __cpu_to_le32(seginfo);
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
@@ -439,9 +626,14 @@ int ath10k_tm_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
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


