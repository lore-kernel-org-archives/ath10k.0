Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD9A606DE46
	for <ath10k@archiver.kernel.org>; Thu, 12 Nov 2026 11:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lvDX/3JZ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yfe2y8F4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GllZQyVR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uTE3xEgwRPhVRHjOg6hOFWbbifgwhiynhlIrm1FKuxY=; b=lvDX/3JZBsJ4wn
	I2f5EXjAZ7L82Q8bl4Xwl9+8GViI1sz424Ob9N7JEIm63RpQJxU8q/mbmLxoG9c+uQlAX87q2LiGQ
	E1yc1QbQp7k0f7b0mqpXlxOD4B1sgtJnHeI+iiofDZIz/p6bj1ZdE5gILNBK5byyD2fk116UXVzUj
	ABWtdT9rzJ8tVi0ERBuDQpybI2KGrM4Ik0PaIRmNtrQ+WqweGz/x3dS+u4f7dQ5QHk1Sg2sK27XSt
	u3QoH4SfBz1NT+mzmu4x5ZtOgPLIw3cKuo3wFHSspQFHJMUBIG2A/gRoo919O7x7WHnjcqNh/I3oa
	KMhFIMxe2tJcgXU1HDeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSxD-00000009hCI-31zl;
	Thu, 12 Nov 2026 11:26:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSwt-00000009h0I-3HN7
	for ath10k@lists.infradead.org;
	Thu, 12 Nov 2026 11:26:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC8vWAx4149282
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uTE3xEgwRPhVRHjOg6hOFWbbifgwhiynhlIrm1FKuxY=; b=Yfe2y8F4yKwft9Xs
	t4scDgF36LcFvRH/UrkBfPUdkWhG/f9gnFw9ZK1brtprJrQ+Wx12ma5eWDwiOmUs
	zAv5m3d9XkZAajL4ijudtxarLxKgXMSyoF0/3ZQpHyXULumc34GxF+s2kCaetQIW
	RBUvg4WS9djtFjEX2E9ypWaLVyDlrcr45tu8TVXzPO1RQeLLpGJ6dFUl5K7pj08G
	sZsr35EO6gAKHbkTCccRQ088/jigco8tm4TNgYQShRt0pLzAOUnw9N+x9+P2sVkD
	nsDcPR3Y6kg75m0RGf0X/G4aw1YKLF61j9uqtGZ94t6O/t2kGPEGZoWgXHEy8Xhc
	KsbUEg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc6361g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37158b53d06so473004eec.1
        for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 03:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482794; x=1795087594; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTE3xEgwRPhVRHjOg6hOFWbbifgwhiynhlIrm1FKuxY=;
        b=GllZQyVRWDRACzUSkt3EVROUVbR1NuEtKtAzB3hF8CnOikTjIYAyCrp69JNocNsxYO
         1xXUV6NP/Jyb1xzMj+C03OvuRp5kvKTw1ORzdGCr3izfVRtB1kqxgnG39k2Q9hKc9/J6
         ntTX7K15fksSH5aBQKIlBYuxJueZCxvFGAEyaNyNn1v6U0tMoPQj38oUskSiXAJAOUdE
         FRyp+etwA/P4yIn99Kq/JpHoV3596lkGJxVcfErbqRkj5RvBrjSUZPviwxhX9HI6++/a
         LfgJ+Ks2SHX6Pce0rNHUr63Uw4ZW1WrFLL8aDgwqCTWuDXaCrR8HkLHQ5YeDaoonNIu1
         eFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482794; x=1795087594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTE3xEgwRPhVRHjOg6hOFWbbifgwhiynhlIrm1FKuxY=;
        b=SiFKN88YcNuU5mBzOW2I3L4kE5iNxtIYQTQO8H2BsOuGnqDdt28pgAaUEEgT1/882w
         UlbVozX7Utn8P5X+ckySdLeCiCD//Z0FaD3CIqUBC/jZQE8fe/bFEf8CRv0m4uPs7I+M
         NoYqqZM97mgH3aX8YN9ViawFQdxMdB3Cf4Knq/mdM5o3CXuEkX7FG+Ke2zknhFuJxpXZ
         6KQX8ggfKf7cQgXUOWvVVe39FcZ45ZGX0vl/qgvq+qBG6RHDOxPrEOd8sBFQ/iDJh4n1
         QSdhQCYnvGyzaHTzLHMgFpzwMS2ijhfZmRJMIu5CFrpJMTpCWenPA8TOU1Dm0zd1GzHp
         XgGQ==
X-Forwarded-Encrypted: i=1; AL+hErGUsfPZC6RAyfF3XzlMdeI0a+cun8HkfxlBiH3OSEcdlJYtOHkZjbVZ+m/OqIRs80+75+jOzfw=@lists.infradead.org
X-Gm-Message-State: APuU4Z+bjoTAshrUgDKwiP5t4SR+AOhXYm4y0rE2pxb5Lfps1NYfFHbj
	PCXLu6DJZn46/3/CDd8z9RcR+bVjMztzBymHv5ps0VpFa05A/gi1r+Jphfq+WBj11i2Z+QYFz+S
	fAwhzewYW1PjDdsOm7DhcJmnu8650AQURFc1i2zVIESZR+Ee0UhgBPYVL1stcnx7E
X-Gm-Gg: AYBFou3qtKce/Lbpop1CuHtQ5tr0ysjgfD8SpaS5yBLPnwVKC1ac9yOkhR2v6DtMcsK
	MZob9Sg+d/dqvDNOJD5AzS1N0GV3EMlNIQxODiO3BQp+uESdY0uadlsxn5TPlH1UcHP4anXADew
	Aqm/W/k0di2kKCAxb+cDrVl20iIIYrxZxybL9RQF93FjuvbKl6uImkAt6HQ1JgASe8gF22uyf1X
	+yszZtjeSR+dOHV6lOmwPjHzYH5BykiVx+KMynmpyCNF+0Djn7FxxJW43UE9mwi4rzTLfheh385
	sT0AD1H/l05c8kctgzpqKUCD6LkGsN2bL02H8Ve5yCUwZ4zXKYhZLb6yQ08bN5bP8xxaW3mVWH2
	YOVb742u5z3n8eo/ajdrB3jiyM9YYUmiOAI4XauSxgRiIYMsoBFwzJVqPFeUei4Er5pYHPH2BcU
	cnGH+8AxTBlkfwCLAflHseIhMd
X-Received: by 2002:a05:701b:451b:10b0:1b2:67f9:43cb with SMTP id a92af1059eb24-1b4f5f5c6f8mr1793652c88.17.1794482793550;
        Thu, 12 Nov 2026 03:26:33 -0800 (PST)
X-Received: by 2002:a05:701b:451b:10b0:1b2:67f9:43cb with SMTP id a92af1059eb24-1b4f5f5c6f8mr1793635c88.17.1794482792952;
        Thu, 12 Nov 2026 03:26:32 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:32 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:03 -0800
Subject: [PATCH ath-next v3 04/10] wifi: ath10k: bound recovery time before
 entering WEDGED
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-10k-sdio-crash-v3-4-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=4671;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=5MbJGy3RKq7arlk2SmcDcqcx7B4AcQTA9zf0fasV+sg=;
 b=g3D0EhqXJG9fjy0mDDD7e2heYqdHCE/8OejmeSLLW+NKPouJwdn6r8ekvYro/KoAkaiHfHCWc
 OoAjHn0L+c3AcECTf1EueeyHpKnZn0k8tQkuZ9gsliwlcgchH8oXRLM
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-ORIG-GUID: hot6_GZ--uI6XreDewgCOG77DAPhJBU2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX2quKCdYYA1SR
 LZdzj9QYwQlagyP7KsRCdwR9hh/q8mO7H1q5eegws9HODcqsZO0WU2ZTums3CsFTbztPpaWKDKL
 e8zDnHTG3ZfxRYfvRLxS8smcIHIFzCVDEz0z43D487QAeuCs8gf7vt6X33dj/reuXN+NvNRF6aU
 mKAB6RES83o/vt7fuA56hk+ZS0ezh4NRgGTdMkDt84a57YUIoM0uCC0knxysH+gkKajlFKytqXr
 uCrc7LABK35wkFF8cRJJGmQ8lmCN1PvVTW4QKsbTuNT2kMkUstBKs2CuJD9br+IlIgrR3eHUbHy
 xlEPqAmwKnP/kpYKw4y/fn5UHk4Oe494DaJQtYid1le4Smk5QTZgY37uxP4VKLW97rhH2wz4Upn
 drPLNJzuT1IxVl6NBCxF6K1+Eeeuts0HTOoBCiWVnVp86i7Paqkru8gIoXx6aoDiBz4zwwtteov
 V7RltoEwNp8mMFjsZ/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXxQC/esxCMTAK
 9E1VeYkCSeXFiD83HWBqHVzm2wfhcXhps5r5OzxAhM8KkI8wJkNT+Rn2tmcXSU9lbKQoX3kNHhA
 iN9F5HFS1gJ1iSgvt7SZQpupvhcS4YE=
X-Proofpoint-GUID: hot6_GZ--uI6XreDewgCOG77DAPhJBU2
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5a26a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8Byw8hCbu9Kz8BjWs2cA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_032636_122147_DCAAC8BB 
X-CRM114-Status: GOOD (  19.25  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit c256a94d1b1b ("wifi: ath10k: shutdown driver when
hardware is unreliable") added fail_cont_count tracking and
declared the device wedged after recovery remained pending for
a fixed number of timeout checks.

The monitor currently relies only on the number of checks and
does not consider how long the recovery attempt has actually
been running. Blocking waits in the recovery path may delay its
completion, so waiting for four timeout checks can consume most
of the suspend watchdog budget before the device enters
ATH10K_STATE_WEDGED.

This leaves insufficient time for blocked callers to exit and
for the driver to complete the WEDGED transition and shut down.

Record when each recovery attempt starts and add a 15-second
deadline based on the elapsed recovery time. Declare the device
wedged when either the deadline expires or fail_cont_count
reaches ATH10K_RECOVERY_MAX_FAIL_COUNT.

Also reduce ATH10K_RECOVERY_MAX_FAIL_COUNT from four to two so
a recovery that remains pending reaches the WEDGED state sooner
when the monitor runs normally.

This prevents a failed recovery from consuming the suspend
watchdog budget before the driver can shut down cleanly.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 10 +++++++---
 drivers/net/wireless/ath/ath10k/core.h | 10 +++++++++-
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index d86c4ead06e6..f6b6b81a4896 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -15,6 +15,7 @@
 #include <linux/ctype.h>
 #include <linux/pm_qos.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/jiffies.h>
 #include <asm/byteorder.h>
 
 #include "core.h"
@@ -2526,6 +2527,7 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
 	struct ath10k *ar = container_of(work, struct ath10k,
 					 recovery_check_work.work);
+	unsigned long recovery_start = READ_ONCE(ar->recovery_start_jiffies);
 	int fail_count;
 
 	if (ar->state == ATH10K_STATE_WEDGED)
@@ -2541,9 +2543,10 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 	/* Record the continuous recovery fail count when recovery is late. */
 	fail_count = atomic_inc_return(&ar->fail_cont_count);
 
-	if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
-		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
-			   fail_count);
+	if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT ||
+	    time_after(jiffies, recovery_start + ATH10K_RECOVERY_DEADLINE_HZ)) {
+		ath10k_err(ar, "recovery timeout %ums, fail count %d, shutting down driver!",
+			   jiffies_to_msecs(jiffies - recovery_start), fail_count);
 		ath10k_core_enter_wedged(ar);
 		return;
 	}
@@ -2569,6 +2572,7 @@ void ath10k_core_start_recovery(struct ath10k *ar)
 		   ++ar->recovery_count);
 	/* Start a fresh failure budget; the last cycle may not have completed. */
 	atomic_set(&ar->fail_cont_count, 0);
+	WRITE_ONCE(ar->recovery_start_jiffies, jiffies);
 	queue_work(ar->workqueue, &ar->restart_work);
 	queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
 			   ATH10K_RECOVERY_TIMEOUT_HZ);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index e8fcbef38ca6..a1ded2cba103 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -88,7 +88,13 @@
 #define ATH10K_ITER_RESUME_FLAGS (IEEE80211_IFACE_ITER_RESUME_ALL |\
 				  IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER)
 #define ATH10K_RECOVERY_TIMEOUT_HZ			(5 * HZ)
-#define ATH10K_RECOVERY_MAX_FAIL_COUNT			4
+#define ATH10K_RECOVERY_MAX_FAIL_COUNT			2
+/*
+ * Some platforms configure suspend watchdogs as low as 25s; cap the
+ * total recovery time well under that so the WEDGED transition and
+ * any teardown that follows still have room to run before it fires.
+ */
+#define ATH10K_RECOVERY_DEADLINE_HZ			(15 * HZ)
 
 struct ath10k;
 
@@ -1215,6 +1221,8 @@ struct ath10k {
 	unsigned int recovery_count;
 	/* continuous recovery fail count */
 	atomic_t fail_cont_count;
+	/* jiffies when the current recovery attempt started */
+	unsigned long recovery_start_jiffies;
 
 	/* cycle count is reported twice for each visited channel during scan.
 	 * access protected by data_lock

-- 
2.34.1


