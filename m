Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A114CCD185
	for <ath10k@archiver.kernel.org>; Mon, 13 Oct 2025 05:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+JLPYm/QovvV6JtQrMtLB8zdsqJIh02RswfF6pbMMqM=; b=2AacoDQzpQn6w0SxT+J4uvdcUG
	2bxiIMh91RLeuu4i5UbNe4WJp5KoQAXN0/FWLxKYd2gRAd0m2ZKNz8MrC5quWxD5wbI956Gfc5S0x
	6L0rklfnLXmp27ipLd8A0LxIGpf2ccRthQN1ZiWxdrE8B6VVOUm66FO0u88AJr0lNftt6PsmjMC5/
	fju4+78ZZnlvKN2tx6/N4/UkmDBmzcR7pKD8UfnKi1ATZ6tCpyavyriBtKupDsEtiw6JOCpXrTQPP
	2PwpabPeSaFTTswFuch9tuHoSPjLFtEi1JlnSPvkVTCYphwfpXlcobpx2JOFTHbxS0Lq339To5byN
	1pCzxQbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BBK-0000000CGbS-42Se;
	Mon, 13 Oct 2025 05:33:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BBG-0000000CGa6-1R1T
	for ath10k@lists.infradead.org;
	Mon, 13 Oct 2025 05:33:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nCPP028844
	for <ath10k@lists.infradead.org>; Mon, 13 Oct 2025 05:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+JLPYm/QovvV6JtQrMtLB8zdsqJIh02Rswf
	F6pbMMqM=; b=UR/sLGXwn/fES+VmgbxnEDgsJqjeRbe+j0IH22OTXM8HxGfPQFi
	LaUeurrKa/H4dFOcSf6DUpxq+2zrEe/ewHavudP5JPczqSk3SVVfRwEbRiLG+ABL
	Gd4m+DiB2OMgaMWKO+UMMKagrtWs7rypO12Mf3zmOlhlV5wv36IQc7vE5IHbYLz2
	ZljG+p9HVFW2Qxu0/OFNtaWbL462R3IBYgQEKbBfLna34E4+DHm6pMnt2evMMLtt
	Dk4bkI8c/5mTIxoFZYMedSDiZypfnxK6m54D+iSLvjIf8PkjZ3yBWFQZozjKTRQj
	vBqOJrZAbXMG8WwK7h2+jMq7rMKuKOhduig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0kb50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 13 Oct 2025 05:33:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28d1747f23bso79829175ad.3
        for <ath10k@lists.infradead.org>; Sun, 12 Oct 2025 22:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760333588; x=1760938388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JLPYm/QovvV6JtQrMtLB8zdsqJIh02RswfF6pbMMqM=;
        b=eugHk649kiMuvJ81RzSWc8/zs3ccVnwsudiBs+/lUbSnjboKhcRvMpZcQnPnzbv3j0
         y2Gb3Cqqlx08b39ESU5VVrC96UN6tb62KY7CpOKspyEicZcwmxQOM7qJY3T86btddQg1
         ddCxFDl1E3jXdVAh7FmjXtMSXrSVBbPIA30ST96pJkpNJV9XTC1VaKAa26PSeOrk2WmK
         0JPK8r9ZzHuMRk4TAFtdplFGdvQwGf7VWOXvAQ4t+e+6NXAX32JBVPp1Yp0hKKWxm2F9
         iySmcZETdVsUWxLulu714nF5fmXjHpJyIq20wk1F48RXPv7VAWaN4snE/oFAAChTxYaR
         LYnQ==
X-Gm-Message-State: AOJu0YybtSrahgJiqO//5PtmFv9iNcTp3cHdbmJh9J605eaJbA9exE9F
	YHUEth6vDzOe+eTyjjWBrBTF228zVl+FEXGX8WlfiKehQWIzxM/mzGoFNzZ4XGJPhwMozchrdyJ
	Gw0YX4sOy67CSeLgiCvaTw21W2Cfis1eHi3naMFyCjMx6ZQTp6Xj/dHQgVFwpUiKngYtzUram
X-Gm-Gg: ASbGncum2MBneNGKjM2rCsw6MQbjeOO/jNUvy2yiGEL5FnuH1j7UIeowdTIYbaX2vSz
	2U4GjA6OK6F7hIEXF63aQQ3F4SjfBe/rWgD9DEGoDsDpCOiSrMhMNdpZEj6mqvwS6O93yPi/EGX
	0OaqmI0c/7T54LG8VhJri55qNcjLSG9B7UFqQDJ7Jr7ierb47FAx338ukvJdf886i+TCtdMEZRE
	1wpGiL6zqRg2cY0+etB2ie44ZSS47JRt1aPA3RbkvwBeAC5X7JxmHGsOT7OZtWZT7tCt3XKKrED
	fXzwB/L998o7rgKKniPWBCMbxd1mrB3z3i4aMyCaNMwy5iACwwscVKeykivCOSM0mqKo3cpp5HO
	eXWkc9of5LryuYLYFH8G6dSXY/rlHgBKLnR2YTKvfrxNkmG9kadlEVQ==
X-Received: by 2002:a17:902:f70b:b0:250:1c22:e78 with SMTP id d9443c01a7336-29027356cdbmr259446425ad.1.1760333587576;
        Sun, 12 Oct 2025 22:33:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEz87qSBroiGBY08Eni3jaBdAgzegz482Dg8A2YXyZTc6yOu87rKcVotECndeKNHO0y9VveQ==
X-Received: by 2002:a17:902:f70b:b0:250:1c22:e78 with SMTP id d9443c01a7336-29027356cdbmr259446285ad.1.1760333587072;
        Sun, 12 Oct 2025 22:33:07 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de6c88sm122515365ad.17.2025.10.12.22.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:33:06 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath10k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next v2] wifi: ath10k: move recovery check logic into a new work
Date: Mon, 13 Oct 2025 13:32:59 +0800
Message-ID: <20251013053259.546-1-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX5/WCWC0gE2F5
 bv85/guaryNOOoScnoBMrRT3bWQqtsHDdNE4XoH6nl0C99NHl0fXe/QVWw2ur2eqn5SRCrmoIum
 AOvvr39BOe7R6dzDElVON6O2lSUD468gh62h5DcMLmbfsevuslauZrWrk82TaRt6NJ7OvYLXpQN
 t+mXEpgoUGwKdBDbYQ2VQURR4KjVVzS4CrPnz3YgH4DjE8Kp5kkxjruGdFFb+LsnvSp0jo5p58H
 kI/qyCnnvsiWiKlN0fwUufIz/EEXpVEwkNaM42ZkAxeEMdDYw7Ew0YDNF7jezgK7TP4i0ZFVE3B
 JCQqdOcUBjoUCYFTnR8wYRGjPsPSpHC2vrWim/uPkeZOSihiBNEM5SyJuixbyQNLwrpc3qz/LhM
 8G2sgS3+mxQEO/c+o4yc8lfFtu7Djw==
X-Proofpoint-GUID: ftnN5LLEK5U614fHm6E57lvximqFk_eo
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ec8f14 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=JPUmt8VSvV4ADWAhxtYA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ftnN5LLEK5U614fHm6E57lvximqFk_eo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_223310_383713_5EBBAA1B 
X-CRM114-Status: GOOD (  17.61  )
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

Currently, ath10k has a recovery check logic. It will wait for the
last recovery to finish by wait_for_completion_timeout();

But in SDIO scenarios, the recovery function may be invoked from
interrupt context, where long blocking waits are undesirable and can
lead to system instability.

To address this, move the recovery check logic into a workqueue.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---

v2:
1. use workqueue_aux instead of workqueue for recovery check work.
2. add Test tag.

---
 drivers/net/wireless/ath/ath10k/core.c | 19 ++++++++-----------
 drivers/net/wireless/ath/ath10k/core.h |  2 +-
 drivers/net/wireless/ath/ath10k/mac.c  |  2 +-
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6f78f1752cd6..8396268baf92 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
@@ -2493,8 +2492,9 @@ static int ath10k_init_hw_params(struct ath10k *ar)
 	return 0;
 }
 
-static bool ath10k_core_needs_recovery(struct ath10k *ar)
+static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
+	struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
 	long time_left;
 
 	/* Sometimes the recovery will fail and then the next all recovery fail,
@@ -2504,7 +2504,7 @@ static bool ath10k_core_needs_recovery(struct ath10k *ar)
 		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
 			   atomic_read(&ar->fail_cont_count));
 		ar->state = ATH10K_STATE_WEDGED;
-		return false;
+		return;
 	}
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar->recovery_count);
@@ -2518,27 +2518,23 @@ static bool ath10k_core_needs_recovery(struct ath10k *ar)
 							ATH10K_RECOVERY_TIMEOUT_HZ);
 		if (time_left) {
 			ath10k_warn(ar, "previous recovery succeeded, skip this!\n");
-			return false;
+			return;
 		}
 
 		/* Record the continuous recovery fail count when recovery failed. */
 		atomic_inc(&ar->fail_cont_count);
 
 		/* Avoid having multiple recoveries at the same time. */
-		return false;
+		return;
 	}
 
 	atomic_inc(&ar->pending_recovery);
-
-	return true;
+	queue_work(ar->workqueue, &ar->restart_work);
 }
 
 void ath10k_core_start_recovery(struct ath10k *ar)
 {
-	if (!ath10k_core_needs_recovery(ar))
-		return;
-
-	queue_work(ar->workqueue, &ar->restart_work);
+	queue_work(ar->workqueue_aux, &ar->recovery_check_work);
 }
 EXPORT_SYMBOL(ath10k_core_start_recovery);
 
@@ -3734,6 +3730,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 
 	INIT_WORK(&ar->register_work, ath10k_core_register_work);
 	INIT_WORK(&ar->restart_work, ath10k_core_restart);
+	INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
 	INIT_WORK(&ar->set_coverage_class_work,
 		  ath10k_core_set_coverage_class_work);
 
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 8c72ed386edb..859176fcb5a2 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -3,7 +3,6 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
@@ -1208,6 +1207,7 @@ struct ath10k {
 
 	struct work_struct register_work;
 	struct work_struct restart_work;
+	struct work_struct recovery_check_work;
 	struct work_struct bundle_tx_work;
 	struct work_struct tx_complete_work;
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 154ac7a70982..da6f7957a0ae 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
@@ -5428,6 +5427,7 @@ static void ath10k_stop(struct ieee80211_hw *hw, bool suspend)
 	cancel_work_sync(&ar->set_coverage_class_work);
 	cancel_delayed_work_sync(&ar->scan.timeout);
 	cancel_work_sync(&ar->restart_work);
+	cancel_work_sync(&ar->recovery_check_work);
 }
 
 static int ath10k_config_ps(struct ath10k *ar)

base-commit: 38cf754c15eeb0d80fbf52c933da10edb33d7906
-- 
2.34.1


