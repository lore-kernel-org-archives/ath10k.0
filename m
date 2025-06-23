Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80145C7115C
	for <ath10k@archiver.kernel.org>; Mon, 23 Jun 2025 02:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fv+ixPSJtejQRVxtJoz+UfYuX/HmFheUie4HGlhLBDg=; b=suziNOIGhnGpEM7oYH/Y2aoSjD
	uZJl6FL2+Zt0FxzXiDR5SZ0Aazyrk1hdlor93Z2lx50Avl0ZuPyZJQuG3tk5Vb3s+bB0AN/lU/8B1
	MUEtNWK3gnUAnQJcUglL7EKbtS4+E2w9FFetD3Nj0OywkAnF56B7Ke4YDlpn0yqOIQjqm/QilTSzp
	3YGzqjWAYV010Vyn1QrCqw+rb4qdXNO0Qm/btGRyw8BiZr+dWhHD/FnO2CBLeJ+HHfzIqAb3k6FmY
	vEtlmNUNPLxeO7ppAte/INGCpsh8KagakljJPEnayce9EqqzoXP7/GaUbfgMXiVy9th/wdz9lt+Ms
	ZUT44/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTWuP-00000001RI1-2rsc;
	Mon, 23 Jun 2025 02:27:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTWuN-00000001RHF-2ler
	for ath10k@lists.infradead.org;
	Mon, 23 Jun 2025 02:27:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MNF4Ct027634
	for <ath10k@lists.infradead.org>; Mon, 23 Jun 2025 02:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fv+ixPSJtejQRVxtJoz+UfYuX/HmFheUie4
	HGlhLBDg=; b=Kg7SeKqeewMhvDNU7A5q5fAWiBEpUgRBJNELcPfhjrtCFWWxy2d
	Y98T5oU7MowJhAKtgmGNjm+WeQevDJSN3GSdXU7lwIsIcPofeyFnFmVSQAEFA0qL
	BmseGorrcKqUFkyQTzwh1B0kKSwoSh0dt414OngL9xT/hOucgMmYd+uJRMdPpcIL
	T/4Rg9j5885ruWl5XNqU5rduuNFetUbWuKkqBng1cMK6uK5BRFpDcc1F8ZzK46C5
	hZmABr/hfG6wECMQhokFF/bfICZrm24gCSIm3rbdlhOdz9Y1wvD7IA9u0DW3ZKzZ
	vVYUpf+OPltaASeucAA3/SOgTmZbzUFhfow==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eccdh5nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 23 Jun 2025 02:27:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235e1d66fa6so40689395ad.0
        for <ath10k@lists.infradead.org>; Sun, 22 Jun 2025 19:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750645660; x=1751250460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fv+ixPSJtejQRVxtJoz+UfYuX/HmFheUie4HGlhLBDg=;
        b=nuMrSYC6Fkx6zzxvO876muOBOmjE7T5mxurNPHPegELDAhnte9eJng1prHasI2xdFB
         CKG+4RN9bspSKNjgYxt4hxNkwUNiG9yDwfE1ZNVFjiuAyV1VFGBJVmGVJAh+YsEtwuZi
         p4dTRanp1pxZIzkQ9TUXkVbrkIY7h24S73INvWFJJQYOCDLLiIBhWFxWMcQhOTQkJIF3
         eV1rjri7ujW7V/YSU4aIXxBVxAQuNVLJcxufCjKC/6mTNDi4CFVIlhvQdNKIu8wnVRgy
         D7Q9lgAfbRl5uFMnKGkRN7cgTm4dhrhW0uJKFKhNqG5T3T6yd3HzgZFlt6yFLPFog/kI
         /pOQ==
X-Gm-Message-State: AOJu0Ywd68dfZuFY1fZ5gct3QTz3UmI8OE2fwvv7QrE9uid0g1ySkZPE
	dHW1p81gIAEZWUdnrdDdpIobaKFUC14Ip2MP26XKqmwacIzJSSHvU/+Dbo/ClXurwrlG4yX7e3m
	kPN7SjLQ7zyZ8d0Ch0xRtWJaZlHC3lw0XJJATCWmI/l+pTXvD9H1rJRmjLpk+nGqdy2QszUlv
X-Gm-Gg: ASbGncvu6qrpFE5JNpCbCP2gqFHyMoaHW8ubmEGmo/YBBLuRq/uTnrjMgHXlmLNCsQb
	o7OD5nf5UfrefL0yg1JGs/wK8NpoWpt9893WWzYoYOpkr2lY9+OdNL8AFgcwHsr1OkhyVnRtK/P
	91NSvbT10+ij4w6igyqNmGKkJ+xTjOi1Z5NjrI2iiFYkRZ61Macicp4UpnCHb0HfijU2ePr1P76
	9dcpcFZ9NM7rNsEPeH11qClVnUmWbhQF4f0VrqTLiCwAyJ2dsnoTUv5B9Qx4hyY46cg8V5+4uKy
	iIInPa/TIPAsoHw/0355CICMfFRdLUjBB6GyGlpld0dCNUS9x7GXnWWbHk++IMZ0DFlFlR2iMUM
	V+P7nBf1xJodUCd4oFm/yNAOngE97qna7gl4b
X-Received: by 2002:a17:902:fa4e:b0:234:a033:b711 with SMTP id d9443c01a7336-237dc1d4cafmr113151515ad.50.1750645660362;
        Sun, 22 Jun 2025 19:27:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO3xLwcDfFF+8FdVv1bm8qSft+zUbFnRdWwk8fQS8JrzjoriuMczR2Bh5iYmWDptTaDD+zFQ==
X-Received: by 2002:a17:902:fa4e:b0:234:a033:b711 with SMTP id d9443c01a7336-237dc1d4cafmr113151305ad.50.1750645659810;
        Sun, 22 Jun 2025 19:27:39 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83936bdsm70645755ad.21.2025.06.22.19.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 19:27:39 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath10k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next v2] wifi: ath10k: shutdown driver when hardware is unreliable
Date: Mon, 23 Jun 2025 10:27:31 +0800
Message-ID: <20250623022731.509-1-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LOVmQIW9 c=1 sm=1 tr=0 ts=6858bb9d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_pHpjG28dqLtJ1xko5AA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: LPd52zSCbpNIh27T-iTrtCyhtLGoPM28
X-Proofpoint-ORIG-GUID: LPd52zSCbpNIh27T-iTrtCyhtLGoPM28
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAxMyBTYWx0ZWRfX1wJpKnNv3zlw
 mTIgGXJ1zlvcdZf1tWgUAUNH4Z3psoWQce0saJ4gV7zEqDjESdZsN+GHyMKC9GWA2LBRYMUdT/n
 Vr9Uy3wom4XWwRNOkN3y6wfg614bHeQkT2vR0j0tPqTRXCpa6IrWp4RNmvw8wLBp7BZWMMgAHlf
 7w49klbhKOQhjyaGNQgQyHSWiACu4kNiVBodPipICnkG7lwhaNP7vgqGAvnTnGEgB4tmIiay9ty
 HSguYa9lJg+PpDpoBxI2t5IsBmoVpz0W8xLBCHQPYNdypUdW1i+DoR53iCwt+ZHf2AkK6+7PiBq
 YI7hPMpZVWmT1WbVAXc5ruWoBY37OyxYlkd/1a9UB1qK0jCM0b0OSneENsBMDxjoIsZ0cGEmE7t
 WoZIpcVOgCPJol/nuF+QXLhxtjmx+bAl3KGn8pc0XAJckFXmj2IjK18MlfHZXRRuc1CiMxTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_192743_837644_F36628E8 
X-CRM114-Status: GOOD (  22.74  )
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

v2:
1. change u8 to u32 for recovery_count.
2. don't add a new line for debug log.

---
 drivers/net/wireless/ath/ath10k/core.c | 49 +++++++++++++++++++++++---
 drivers/net/wireless/ath/ath10k/core.h | 11 ++++--
 drivers/net/wireless/ath/ath10k/mac.c  |  7 +++-
 drivers/net/wireless/ath/ath10k/wmi.c  |  6 ++++
 4 files changed, 64 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index fe3a8f4a1cc1..7686cf4292e0 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/module.h>
@@ -2491,12 +2492,50 @@ static int ath10k_init_hw_params(struct ath10k *ar)
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
+	ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar->recovery_count);
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
@@ -2532,6 +2571,8 @@ static void ath10k_core_restart(struct work_struct *work)
 	struct ath10k *ar = container_of(work, struct ath10k, restart_work);
 	int ret;
 
+	reinit_completion(&ar->driver_recovery);
+
 	set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
 
 	/* Place a barrier to make sure the compiler doesn't reorder
@@ -2596,8 +2637,6 @@ static void ath10k_core_restart(struct work_struct *work)
 	if (ret)
 		ath10k_warn(ar, "failed to send firmware crash dump via devcoredump: %d",
 			    ret);
-
-	complete(&ar->driver_recovery);
 }
 
 static void ath10k_core_set_coverage_class_work(struct work_struct *work)
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 446dca74f06a..85e16c945b5c 100644
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
+	unsigned int recovery_count;
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
 
-- 
2.34.1


