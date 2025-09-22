Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F07CAC592
	for <ath10k@archiver.kernel.org>; Mon, 22 Sep 2025 06:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WuWSEjSRKMzPhB9hziIu6w87qOwsQjUbMS6R9W6SG6o=; b=Oc1Z1JUEDVueqG1gk9zno/1zTq
	VZYW79lQ2fHql1YgUoGAzAbwAYvB2q4gBesQG8QV1vR03G79O94yhdyaFKdxMsqmVL4yL2NhRS/P3
	yeHFd6jrezlWyRyyPIpPuV6sEeE/mVhUoZ595vVwTDqw5SEem6WbsTtMVdlfTFV76OMNfI5R1sfKy
	dfb3h9O7ntuzLhMBwBocwsuphgut7APx3kQgs7aH4yeC5ROuJNQ4/gfoBd0+41nAOkYoZCvrLfqoJ
	x9NBxaq/7a+lOxFAaY1vWtau/pOBo47HIaGWzL2PagnWwht1TzSJIPJIY4XKbslo8e56ura8AKFYx
	eLfTpZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0a57-00000008yv6-23yU;
	Mon, 22 Sep 2025 06:31:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0a55-00000008yuE-0SaX
	for ath10k@lists.infradead.org;
	Mon, 22 Sep 2025 06:31:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LFshsv005662
	for <ath10k@lists.infradead.org>; Mon, 22 Sep 2025 06:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WuWSEjSRKMzPhB9hziIu6w87qOwsQjUbMS6
	R9W6SG6o=; b=BBeqxi6l6zXcnOH3b/EWHAFMGRm8EAaEnEwn2n51dcPK9kxi27D
	ebO5zhNaa9hTU6y27ecg9nkKDALVTXWHx6Q98rwI71IIbQIoKYOYDojfG0f4ubNm
	LBEbQazGJdjg9HF98xOWvRZuI6MqGQ3bqCI06JacSsjfC03wycUrW/Ae+cZ4x6zU
	fo8CL7snk/gcSAfDankjjCCXxVStOQ0/DtO//wC6yqeEzduKTZ8CDLTBABA0B6A3
	vJ0CFx96TkluvzdDx1c1ey0CBHvMUwTK5ETf8SC8e7BLYXgaFQnnQOx52Py/uk1N
	tr0CCL2Wqil+aaSdXoS4rhnsPH4pdFkBRyg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98bn8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 22 Sep 2025 06:31:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32ec69d22b2so3878284a91.1
        for <ath10k@lists.infradead.org>; Sun, 21 Sep 2025 23:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758522680; x=1759127480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WuWSEjSRKMzPhB9hziIu6w87qOwsQjUbMS6R9W6SG6o=;
        b=rMn1tgPZjwMLkwHcWhZ2JZbtMjQhozgwCFcJq+7imE1648QQ0G+0sSFBw/cNgUxvBQ
         jVaLteHwcaOoOguSQYxiRFqYuld2XFmTCpOKFtvS008XkGu5idpKwnU2wCjeZ42TZ/r+
         5h8Fp0QyzdwfRlxnXRYJSe3h3qs2lXKu93bmPil5vGoIfS+r2JomYh+8tIwXFeD0Axws
         lRA+bXLhv3EM5FjYYzToshtY5yOwSzO1SAQnUpJymneNgJy7xUP5t0TYuMxlHvtL6gur
         5umlFa6itD9nuGK3iCy4JCQ7+a3inXi4U7Rq98NSvI4pxnBdkpa7G1ZjoOR6rmvQ58VN
         uxUw==
X-Gm-Message-State: AOJu0Yy6kcvTDC+aG0BZQ3WyfW9sU8v5hykLsyvNyH30OyD8GmYaZJRY
	ylOmfLADjar8ViyUqGVBbClGeaSAhlM0Pv6ERnQxOSs9NARajyehVYSVve+xW5Cle7lJ6pv5+PD
	nRMSVh0gxt/qQQcZHExKcvW5sFMIMRoTg4IC4ZXCAlvNJ7kHZZn2RhIk7JSC18VQLRXO5sTVjqH
	g=
X-Gm-Gg: ASbGncuJ7eCmrgsBXnf+3KxUHpanSWk6jH2hPt8IkgNZNYdxFGNdHqiKeXTNQ0JWBYS
	l+AGYEiGe5iR1zAUSnMZiRy7Ct//7uEzWp8JZzxHo849Km/G7WFEQdZYU55aLwUXzhV+HMvVZaL
	SBBZx7FvGlZ2IHLLH2kwJQKRFyKAPRRxcludjr3q33Ndw017lwjwkb2D3jcGt0IIbaqn+oV+jfQ
	pNNUcil1BDT0IvApMeR7kUEha7Cly1yuumMaglHKc4x61YGA7Kp2ftBq9w3VW1zhWrj4yRhp2xq
	7iEF/RyFf9zb+QHatrTtpLme86LPYM4mk+5ylvHvv5SHLx2obnAgwHgij66tS+/VxUTv/DI3lRj
	pkNvtnRjIMF8agIc1vJr8koFJAgR3ug6PaCfmYYvjgjyOhLOSb8X4zg==
X-Received: by 2002:a17:90b:498e:b0:32e:2059:ee5a with SMTP id 98e67ed59e1d1-33097fce1b2mr13555941a91.8.1758522679727;
        Sun, 21 Sep 2025 23:31:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPg4Vo2ZWkfT8rcOT5PW8V46H0hIv8TDVTcIxU0I4cjOzErGj0xDFQ04Ve3mdNt4SkOHRCGQ==
X-Received: by 2002:a17:90b:498e:b0:32e:2059:ee5a with SMTP id 98e67ed59e1d1-33097fce1b2mr13555915a91.8.1758522679128;
        Sun, 21 Sep 2025 23:31:19 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b5516b997b3sm8344643a12.0.2025.09.21.23.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 23:31:18 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath10k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath10k: move recovery check logic into a new work
Date: Mon, 22 Sep 2025 14:31:12 +0800
Message-ID: <20250922063112.1324-1-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NfzftsmjYDvNFccAZoPpVuNkTv8GVZoL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX+HG9kGkQxgfP
 zFERQfDE3bg3UYJ76Hx+g47gtgofQ8IYsph3NUFDWNAPYyPDWtECyY1Hj8vlnbp4E6mTwfk0rOk
 P5UVOEyMrNeYK6bbcWYLtVZjw4SZQIyaqg612g9IbXWDfMyEhHcdhoK5FaulizFsXO2WfQKc3Xb
 PgFxDWqzkjCw6B4NLMdgGTiLnGxA6Ao65XD8pEAD7YAV9UYOichTDxDnWgg0HBwaFIrHHSLzZxr
 c8KEhmrR8x2Gd6NaesK4SVK/VHRD4EIplVmCSMwHmSFx+/kdvHBzId38ZYa73gMUgpdtZAlrBgs
 mhw08k7RHqCXd6bRQ20JRfUSstINa/T5jPLLP0lNTcnucqjn3meVdssMtFdrqtkYNm2ZRzVytW5
 z8ET7Pb8
X-Proofpoint-ORIG-GUID: NfzftsmjYDvNFccAZoPpVuNkTv8GVZoL
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d0ed39 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Z503FGabStPfIb0gwUgA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_233123_269686_6EF37DDF 
X-CRM114-Status: GOOD (  17.31  )
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
Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 19 ++++++++-----------
 drivers/net/wireless/ath/ath10k/core.h |  2 +-
 drivers/net/wireless/ath/ath10k/mac.c  |  2 +-
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6f78f1752cd6..991fe8d92297 100644
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
+	queue_work(ar->workqueue, &ar->recovery_check_work);
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
-- 
2.34.1


