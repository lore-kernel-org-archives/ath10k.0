Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB49C5B543
	for <ath10k@archiver.kernel.org>; Tue, 10 Jun 2025 10:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rwM6K9FwSFnupKLaninX8B07kLQ2nLSTQ9j4rNbLFi0=; b=YkfwPopUe2MyrJchSsbNEluiM9
	RNWVA8RrxHQ0/vzJ3tmRJlMb69rl4/w0yg0sP6NehTDHBKqS9zDsqawhIFG9p3HY0Iatk8tUqkNyd
	Yip+vlxgq/bdqPztqOkFLvrIinWz4kJSWfI5hQpfAFiP/erIjSs8OMYS7YSJrCN9DnxRTxuPVHCOL
	MyqV7PnxHig5mckKW+wqfLKuifqiANW5SoGOGJ0A+0GIRHdEV/uxXXlZLNY5oIN4qyZPFzO9V5lEz
	zXQlv20xu0unWmiCvJ/Yxq+qF5fYfkd2RTB1vRnFjiGMPO99Ef9wQIyBUz/kXmsjMUsBImv2xiZUU
	KLQErTYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwev-00000006Y3k-3rT3;
	Tue, 10 Jun 2025 10:56:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvhC-00000006Ps5-2DJo
	for ath10k@lists.infradead.org;
	Tue, 10 Jun 2025 09:55:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8s4JI013424
	for <ath10k@lists.infradead.org>; Tue, 10 Jun 2025 09:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rwM6K9FwSFnupKLaninX8B07kLQ2nLSTQ9j
	4rNbLFi0=; b=Kaf4OpXi4t8PatruiINgPj6DTkODJDn/a+jgAOUk9FUFkWvA3OV
	Fwrv92elAb501L6E5akHmpzvLiWMMonKh4GfE4wifspbjSiSjyHc1Yry8bMNZ1ZR
	09PYRj0my89NbyzlKFtoxjIDJ+V1J0HXA3ExbHj1u+9JI6B/97Sh0ucLSthXHSQd
	V4tk9Jk7MgqTHbtMpLn6H6vbzvZEoa3CT+Z+jGhW3kodMyZS0Q5nRHanH04Xwuuj
	Vjc0t5VufTPNW3KZcTedqSDirPDhmAewg5eyiFwVFORXF95dg0Id9gSTuUYmRH/t
	MfsT/hXowMqlEETrbVNvsDfrkVpfdc9jfRA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv8w18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 10 Jun 2025 09:55:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235e1d70d67so47962775ad.0
        for <ath10k@lists.infradead.org>; Tue, 10 Jun 2025 02:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549304; x=1750154104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwM6K9FwSFnupKLaninX8B07kLQ2nLSTQ9j4rNbLFi0=;
        b=j4aovPpH5jVvojcYOlBceAGIP36vj1SIm3k/CbWtXXoC3HC3X7Hua0eGTyzeX8FBrE
         9z2bm8ewYf/hQEO1xtnHDvPS2CiDFIro5SmCzvmP+djqQYo6aiiqkEAqTMkaRMacn2vY
         Km0ZA/Y4oKyv44nv84Gt9TEOfvzFAskmZVc+lnMHFgzESbDL8PuqhEx7d72CW4yUAiJ6
         5XlXx+aCaNxZQ4F4EE5mQza+ZycFP4Omb73xD45Q8N7vSoYCj/8Xfhn8wsofEuzRtFZp
         xF7UoFQ+8So7l3JdvW/21NRxu331uZyFzwmC2b2sEdbvdczl5qdZpcnAiLL7zHG39sog
         gKfw==
X-Gm-Message-State: AOJu0Yxf9wxlV5y2d2Gcmwrlwj6mbd95JD3qw7K9DFqaTihZ5nnB2Xqr
	XCTfci0cinxDBDisCNQX7EPuC6kpFMCmTaso6FDzjjLZbBP7omBs+jtE2DCEpFisnJDDVwCXmjm
	TAH9vZO9yjduqZwSNiUV4a3zST6EcV6QSPvfPL2WGYSuytvq/ve87BDwETrHqEgIMcPEI/Jh2
X-Gm-Gg: ASbGncscjxVeb1xQpZCHKPWP3CgiW09qsrp2oenw0fQcMjorjFMUVBE9xDvWj3sphZc
	RapuRW4eXEpr0a4F96W9Cwi8We4PjsV5aOZErwoPjBAgAEu9AzK69zF8bV+NVlPTmQBe34hppkC
	bRuH3rpQqWgXpaoJDwKeSFqRbwAq2uLTleIJX64Qw3vs4X1yk7Fd9a6lZJQBXjdYYXjVFR7C2U3
	AgORTqPn7xL7/m+Vd8BGjBk43Zw82i3iKX2IwFnbls7Qe1+vLKyugQuSKVZa45QnHBcWFEr15u0
	jZy6sRCPvg+dsCnRq+UsJGAi030jXtf7pGVC+FJ52M+MZ5JLYJEdWr1OSIRAHLj9pdbhYLjVcTC
	97iXFR5+q7OqpELPbguMZn4tjZpkk9+ilJAH8
X-Received: by 2002:a17:902:ec92:b0:235:f298:cbb3 with SMTP id d9443c01a7336-23601d05c8bmr192831405ad.18.1749549303534;
        Tue, 10 Jun 2025 02:55:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENJTPj0+87IAYLb+lQKvUeL/bTfrMDZHWh6+Kba3duXAIV/pJxFEnE7OEu9edJ/PV8brjM1Q==
X-Received: by 2002:a17:902:ec92:b0:235:f298:cbb3 with SMTP id d9443c01a7336-23601d05c8bmr192831125ad.18.1749549303042;
        Tue, 10 Jun 2025 02:55:03 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603410974sm67303355ad.201.2025.06.10.02.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:55:02 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath10k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath10k: shutdown driver when hardware is unreliable
Date: Tue, 10 Jun 2025 17:54:55 +0800
Message-ID: <20250610095455.1443-1-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5isP9H8x331R7iC-ktlXtzOZCipot1mV
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684800f8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_pHpjG28dqLtJ1xko5AA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 5isP9H8x331R7iC-ktlXtzOZCipot1mV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3NiBTYWx0ZWRfX58kKnBvVXLw9
 erh0Jug21O+hAy9Bgpu8wB2R2CejIy7DQA8gIoLjJDZXErevkMutDjR6wbhIyXfBonxuG/98PG/
 8qrqy8SAH9vZmlUIa9WVuR8Tx/Ep1rfy/qTYxVJ+kPZzg/Q191JkIL8/BVwmJvSOaQ7KgI8s6PM
 xLo6qpolf4jD9kHML3x/LZNxKGw6vGU+VCRQ8rClEay7Y4V/JUBuw7XN9oNxKYD2sMkEg+Q/dqT
 divMrFhZmIpnrEpsli7zOv3oIqd2nA1KFP9iEqfXB3//vsGTTxlyuOeXEsyqce7OeSDtFSEvb+a
 TsonhPeUbWkJx7C8YzRfSp6lbmQe/1yDb9plK6KddIC1Avt1sDIvoK/Zi+d9i4ttafYw0YBDmnU
 WQexpToyDWhTvNyx+mjGjcboiVLTd4lluDFOxj3KY1n2k56gg4xSXdUXvHJqHPpwv//Vluw1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_025506_587159_7AC05710 
X-CRM114-Status: GOOD (  22.35  )
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

In rare cases, ath10k may lose connection with the PCIe bus due to
some unknown reasons, which could further lead to system crashes during
resuming due to watchdog timeout:

ath10k_pci 0000:01:00.0: wmi command 20486 timeout, restarting hardware
ath10k_pci 0000:01:00.0: already restarting
ath10k_pci 0000:01:00.0: failed to stop WMI vdev 0: -11
ath10k_pci 0000:01:00.0: failed to stop vdev 0: -11
ieee80211 phy0: PM: **** DPM device timeout ****
Call Trace:
 panic+0x125/0x315
 dpm_watchdog_set+0x54/0x54
 dpm_watchdog_handler+0x57/0x57
 call_timer_fn+0x31/0x13c

At this point, all WMI commands will timeout and attempt to restart
device. So set a threshold for consecutive restart failures. If the
threshold is exceeded, consider the hardware is unreliable and all
ath10k operations should be skipped to avoid system crash.

fail_cont_count and pending_recovery are atomic variables, and
do not involve complex conditional logic. Therefore, even if recovery
check and reconfig complete are executed concurrently, the recovery
mechanism will not be broken.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 50 +++++++++++++++++++++++---
 drivers/net/wireless/ath/ath10k/core.h | 11 ++++--
 drivers/net/wireless/ath/ath10k/mac.c  |  7 +++-
 drivers/net/wireless/ath/ath10k/wmi.c  |  6 ++++
 4 files changed, 65 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index fe3a8f4a1cc1..f925a3cf9ebd 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/module.h>
@@ -2491,12 +2492,51 @@ static int ath10k_init_hw_params(struct ath10k *ar)
 	return 0;
 }
 
+static bool ath10k_core_needs_recovery(struct ath10k *ar)
+{
+	long time_left;
+
+	/* Sometimes the recovery will fail and then the next all recovery fail,
+	 * so avoid infinite recovery.
+	 */
+	if (atomic_read(&ar->fail_cont_count) >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
+		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
+			   atomic_read(&ar->fail_cont_count));
+		ar->state = ATH10K_STATE_WEDGED;
+		return false;
+	}
+
+	ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",
+		   ++ar->recovery_count);
+
+	if (atomic_read(&ar->pending_recovery)) {
+		/* Sometimes it happened another recovery work before the previous one
+		 * completed, then the second recovery work will destroy the previous
+		 * one, thus below is to avoid that.
+		 */
+		time_left = wait_for_completion_timeout(&ar->driver_recovery,
+							ATH10K_RECOVERY_TIMEOUT_HZ);
+		if (time_left) {
+			ath10k_warn(ar, "previous recovery succeeded, skip this!\n");
+			return false;
+		}
+
+		/* Record the continuous recovery fail count when recovery failed. */
+		atomic_inc(&ar->fail_cont_count);
+
+		/* Avoid having multiple recoveries at the same time. */
+		return false;
+	}
+
+	atomic_inc(&ar->pending_recovery);
+
+	return true;
+}
+
 void ath10k_core_start_recovery(struct ath10k *ar)
 {
-	if (test_and_set_bit(ATH10K_FLAG_RESTARTING, &ar->dev_flags)) {
-		ath10k_warn(ar, "already restarting\n");
+	if (!ath10k_core_needs_recovery(ar))
 		return;
-	}
 
 	queue_work(ar->workqueue, &ar->restart_work);
 }
@@ -2532,6 +2572,8 @@ static void ath10k_core_restart(struct work_struct *work)
 	struct ath10k *ar = container_of(work, struct ath10k, restart_work);
 	int ret;
 
+	reinit_completion(&ar->driver_recovery);
+
 	set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
 
 	/* Place a barrier to make sure the compiler doesn't reorder
@@ -2596,8 +2638,6 @@ static void ath10k_core_restart(struct work_struct *work)
 	if (ret)
 		ath10k_warn(ar, "failed to send firmware crash dump via devcoredump: %d",
 			    ret);
-
-	complete(&ar->driver_recovery);
 }
 
 static void ath10k_core_set_coverage_class_work(struct work_struct *work)
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 446dca74f06a..06ac95707531 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -4,6 +4,7 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _CORE_H_
@@ -87,6 +88,8 @@
 				  IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER)
 #define ATH10K_ITER_RESUME_FLAGS (IEEE80211_IFACE_ITER_RESUME_ALL |\
 				  IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER)
+#define ATH10K_RECOVERY_TIMEOUT_HZ			(5 * HZ)
+#define ATH10K_RECOVERY_MAX_FAIL_COUNT			4
 
 struct ath10k;
 
@@ -865,9 +868,6 @@ enum ath10k_dev_flags {
 	/* Per Station statistics service */
 	ATH10K_FLAG_PEER_STATS,
 
-	/* Indicates that ath10k device is during recovery process and not complete */
-	ATH10K_FLAG_RESTARTING,
-
 	/* protected by conf_mutex */
 	ATH10K_FLAG_NAPI_ENABLED,
 };
@@ -1211,6 +1211,11 @@ struct ath10k {
 	struct work_struct bundle_tx_work;
 	struct work_struct tx_complete_work;
 
+	atomic_t pending_recovery;
+	u8 recovery_count;
+	/* continuous recovery fail count */
+	atomic_t fail_cont_count;
+
 	/* cycle count is reported twice for each visited channel during scan.
 	 * access protected by data_lock
 	 */
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 07fe05384cdf..9e6f294cd5b6 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8156,7 +8156,12 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
 		ath10k_info(ar, "device successfully recovered\n");
 		ar->state = ATH10K_STATE_ON;
 		ieee80211_wake_queues(ar->hw);
-		clear_bit(ATH10K_FLAG_RESTARTING, &ar->dev_flags);
+
+		/* Clear recovery state. */
+		complete(&ar->driver_recovery);
+		atomic_set(&ar->fail_cont_count, 0);
+		atomic_set(&ar->pending_recovery, 0);
+
 		if (ar->hw_params.hw_restart_disconnect) {
 			list_for_each_entry(arvif, &ar->arvifs, list) {
 				if (arvif->is_up && arvif->vdev_type == WMI_VDEV_TYPE_STA)
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index df6a24f8f8d5..cb8ae751eb31 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/skbuff.h>
@@ -1941,6 +1942,11 @@ int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id)
 	}
 
 	wait_event_timeout(ar->wmi.tx_credits_wq, ({
+		if (ar->state == ATH10K_STATE_WEDGED) {
+			ret = -ESHUTDOWN;
+			ath10k_dbg(ar, ATH10K_DBG_WMI,
+				   "drop wmi command %d, hardware is wedged\n", cmd_id);
+		}
 		/* try to send pending beacons first. they take priority */
 		ath10k_wmi_tx_beacons_nowait(ar);
 

base-commit: 2b404d0c06adaeeebd355bd727ef600706b28197
-- 
2.34.1


