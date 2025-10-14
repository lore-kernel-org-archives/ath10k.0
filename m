Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A739CCD187
	for <ath10k@archiver.kernel.org>; Tue, 14 Oct 2025 11:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pCPBB3zUKHBvOLezlS3C15tJDFsbdM0CKexKKcrYyDY=; b=CgyjADuIQHn1IufTZswRygCmYA
	TXPzJCwZFnW+sEhlCkzb6PoKY44SxiCW1tIIfsNsog0caMEXptvLOTo8k0x9ApK8jd1JnFdCFhetT
	SU/84muW4qAyMP1ghC4cS0Y8uepZz8ThZVXkCiOHUswp/ghld9sr9ackZgLa6o6UYcWeZcCy/qSSx
	I6HkTAPMCM6aBF1HLmURitn4MrWrUpJJ7JMxjNW/DKuHxgvxjbi0Y2R/zP0kxouE6d+U1TSU7SQ2F
	uz0M/Amebbl7br4RSVPd6c128waF+cGBdbXztOSpWwB5v5/zOf0jK9WuhBUneYnow0JJtvZELuzMB
	yjK3dgWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ct2-0000000G29k-3hIS;
	Tue, 14 Oct 2025 11:08:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8csz-0000000G27g-3iHl
	for ath10k@lists.infradead.org;
	Tue, 14 Oct 2025 11:08:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Gfb008992
	for <ath10k@lists.infradead.org>; Tue, 14 Oct 2025 11:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pCPBB3zUKHBvOLezlS3C15
	tJDFsbdM0CKexKKcrYyDY=; b=hwbhMLpZAIfUtYalrW5RxVKhUUDR25K9cKaxK9
	cKClb0tqhYK4z2f+4O9ajrp/yDEwOO2cUU6xOVLXdFzFbSMJmBfvr8jog1lRhhhJ
	x+6Xux7cnOOKFcjvdpQWCQx7QEyBqHdHI3032LvWB3LYcfQel6/NOsdFY46Dzllh
	CKbJLMaGzCZnWkhZIp/70CtQxnEdDiyDdQHr+kLjS3tVQXqFJjig47yu/aoaeL7e
	na22zam/Y6w1FG+GXBEiUyTslXXO4kE/FKePuFfhFI+xpmgCyEIOmH2XUOMnOsHj
	yRr6WxEEi32P1sScvv7q0rhInQZatbvWzJjmp6ybSXaBJUqA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5g7a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 14 Oct 2025 11:08:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33428befb83so12620529a91.1
        for <ath10k@lists.infradead.org>; Tue, 14 Oct 2025 04:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760440086; x=1761044886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pCPBB3zUKHBvOLezlS3C15tJDFsbdM0CKexKKcrYyDY=;
        b=OLvkN8WjrQQeDE/k4tun9ZvahE+scaZnL2hTameXdgr105oLYO35dWl1ogUeGN8x9f
         /zpuCkCv1A7c40+Ykkp6b/OBDkThTd/mV2g66yNOyHsEiy8PtVX3uEMKVZ2aCxZ8NFPr
         6tw386zHvdo+fMr5nGXV1gjHozg/YmQo+NPr5bdooqUe4HI9YquEGsi4Cx9sn2lqF/h0
         2UsvcWrfJ8gF1Ahw9LZNv+rG9foqhAkZE5B4tnSiF3tRqWCSMd5fwxSYGRisCQEe9Sqf
         w1NdXhaq6xhPUgLxMn79lWZiCYgxVNYk9hxUYZDJzgj+nuEmP29yNob9wAO+vLUFFHFm
         Ue3Q==
X-Gm-Message-State: AOJu0YzV+rhnxBb5AOvXnElw/KeL8ucNJh/8wcBSYQ2udlJ8gRFmDJc7
	5HVs2j083GCOSYoIJBL04ltTZpsqPQj8XN+xPYzcWTrvrR6D9feXrO/Cj/swBZTw5RdXY2zIJaY
	wA0JuKEW/ah0BOl1bdoX1i4byoISixcOSqonl1TXkNTUV0lT5i76gvBaPRL7ED0w3uO61RcD+W9
	8=
X-Gm-Gg: ASbGncu78Ze+9V4AdDuzKYmWsfUqKU/BZlMdD6OZNkp1oXIpxbcZHJBJOcmthi6gZR2
	dvIKGHLQbXJYICZkQ2pvCLdu7xtCPJA3EzQseiwiCiv3hJLXRm4CSnzXolhR5PDW5+cGSs8v1WY
	+e3CESqMgSo/L3HKoTAT0BxpVdsQSzFhBkS7DwyGEpTif6r6fb53tXHRnG+lw0Vcgg5yvZ4iTKJ
	naReaU81wyreUpK3oQsZIvZkvWkRhUEmrzAc8LwHqCmyZ2SntE0Fa9A07//3yPoIWRkRsNk2ngT
	zIJTYnprYJmQLApp79017vQBaVw3J49aT+s1ywNTTikwTIrZjxYFa4H/ou2833ehXPBkild96aT
	9iYeWIEtFOWoOMs3XVUjMGXIa7JqBMYndSdeSXxnzyKNx4CyXuMPoyA==
X-Received: by 2002:a17:90b:3911:b0:338:2ef8:14af with SMTP id 98e67ed59e1d1-33b513bee03mr31723219a91.37.1760440086025;
        Tue, 14 Oct 2025 04:08:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYtmlTHZpQQoCSgvxpCwh3BvRw4Elghgfd3Fb3g1hxO1jtjHKkWm25fCgtMhPZaxffu8Ix6w==
X-Received: by 2002:a17:90b:3911:b0:338:2ef8:14af with SMTP id 98e67ed59e1d1-33b513bee03mr31723189a91.37.1760440085476;
        Tue, 14 Oct 2025 04:08:05 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b67c6040d23sm5425013a12.38.2025.10.14.04.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:08:05 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath10k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next v3] wifi: ath10k: move recovery check logic into a new work
Date: Tue, 14 Oct 2025 19:07:57 +0800
Message-ID: <20251014110757.155-1-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sNfoKGIVZ1ThZgEpH2jHSN50kP7e8dnm
X-Proofpoint-ORIG-GUID: sNfoKGIVZ1ThZgEpH2jHSN50kP7e8dnm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfXyUcEaLgQas5u
 3S/92AUPYD/D2c3RSntHHCD9pilILR6jsZcM7GAM3KPbW5JgwKcDpjOypap7RCA5Ob2deMe+2TR
 IlzGYdwku6J3okMECEoUuErZ7zT72YeSaxvxso5/mEFY7qy8pHKEgdopKWYn4YWZRmBe8GYoTfX
 Ni1wekKdC1JJVUHnYHmqy9V2F5dGQdrPPqMd825X+bDr2/n0fwc69QlfhoJUzxtkmgt2Flsux85
 2GVOOGOY9nsJYMDJBHe35P+iIRDxkrclFQ95e22ZSrAfG4ne7iIgZRa6W3I1z0nq+J0pwGmS7ON
 8K0ZbsYMPxkyuIPydcTh7/rOpO7HuTh1iMJ+CrbSOpVk2/03otx4lWAhLvjvvcSzUcGWA+pgyi7
 Fi0Nw60ffxa02ARMwiK//qQznPIitg==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ee2f17 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JPUmt8VSvV4ADWAhxtYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_040810_047209_D37B862F 
X-CRM114-Status: GOOD (  20.32  )
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

Additionally, Linux’s ordered workqueue processes one task at a time.
If a previous recovery is still queued or executing, new triggers are
ignored. This prevents accurate tracking of consecutive failures and
delays transition to the WEDGED state.

To address this, move the recovery check logic into a different
workqueue.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---

v3: explain why use different workqueue for recovery_check_work.
v2:
1. use workqueue_aux instead of workqueue for recovery check work.
2. add Test tag.

---
 drivers/net/wireless/ath/ath10k/core.c | 20 +++++++++-----------
 drivers/net/wireless/ath/ath10k/core.h |  2 +-
 drivers/net/wireless/ath/ath10k/mac.c  |  2 +-
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6f78f1752cd6..9ae3595fb698 100644
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
@@ -2518,27 +2518,24 @@ static bool ath10k_core_needs_recovery(struct ath10k *ar)
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
+	/* Use workqueue_aux to avoid blocking recovery tracking */
+	queue_work(ar->workqueue_aux, &ar->recovery_check_work);
 }
 EXPORT_SYMBOL(ath10k_core_start_recovery);
 
@@ -3734,6 +3731,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 
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


