Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE9160A3830
	for <ath10k@archiver.kernel.org>; Thu, 12 Nov 2026 11:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pLCDQejD;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UqZwVdro;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UUT6VMtR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9Vhj1ufJteMxS+0DSsfOoaW55CKmz9agnW/ULo4cVWc=; b=pLCDQejDpmS4wO
	BLJ6jw+iniXbcJ30PHpk7j95Whkj1gzoofeJxXIp8VgF4dbpv/or0m7f2+eFIOEKmYJufmSL2lbxV
	6KvdL+G8z/gSgPzUMfRhFYmXLpL9C7bN7FDZjzloCkQhNRY9mVT0qDhNQw9lSIC7s2PSvhgtSPtoD
	fco/xr6NtpsH4+065wxmhYS0RUkpja6pOlC9Joyb51t6/Q9HNh4Fwq43qbw3tird4TY94gB9oJZQW
	yp9p5YZwvoyIHwM+IEXLdLRd8921j+k0jyxN4DWhrgYY0uAQD6z7lT3pWYk6EAojsaZi88v2Q+9gI
	FC6fr7B8EdQ54p6OTBCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSww-00000009h2T-1tmv;
	Thu, 12 Nov 2026 11:26:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSwr-00000009gxL-3VFZ
	for ath10k@lists.infradead.org;
	Thu, 12 Nov 2026 11:26:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC90vn12514210
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Vhj1ufJteMxS+0DSsfOoaW55CKmz9agnW/ULo4cVWc=; b=UqZwVdrooj6X2Q1i
	BVZ05Pz4iIrBLqWJ5ZJrH5ebp1K2ELDeRD0jWDcC4jq8KkP2H5bbFDAmfHvZLI3z
	udDyqLHBY8Rbn8FHq4Sok7a7lvwiAw12BNVSBLpjfEWCtKwB/c8qZvQuMepFjGHK
	OH7Ot5m93lq38QWzAqnruVaMkBQ8JRIm0t92KEvS9fFmUso3mFFscydU1CjzR4SH
	T4tvapHY9MkX4iqUAQe4XjFSjOsO7sS4hpmgFQpCSh9M16O5sZPbbbo5LiGtOCou
	tC433x+hVMuJrMlu2/3KAnEe4wm/ExPeBzi+yW7KszpZj/6F8fkBurxoC51X6QuO
	rOxXeA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1uavu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:31 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a2b6fab7a6so754674c88.1
        for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 03:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482791; x=1795087591; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Vhj1ufJteMxS+0DSsfOoaW55CKmz9agnW/ULo4cVWc=;
        b=UUT6VMtROeMTa46fEiTrHuN+8bZh4gqkDMsrlk8Ce7OM9ewHzmi6AKR17kWVLhxCiG
         TPV/OOHIfHAvAMkrET6C65bCREtKcihfhskpH2XgSZ28V4M0XuD5vQyBpDKJisKvXXXh
         53xVJdhXmGBa4JGOT1xJCHS9yHrIcrUvJIC6T1JaO+4TjNCrGy0tsOB7NBj/54fzjiDZ
         FwvLj1MrYDe1zub2HNLsN+WcYURgROyxSriVEfPLfSMj6g4loK/ljKnDQ92K55fZqL2l
         4v24prwmDMlaiMf9IArD1MYCNvLJxJYO+WabQDRq3i34RqQ7Rsx83OU98ecL63MXTvgo
         pGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482791; x=1795087591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Vhj1ufJteMxS+0DSsfOoaW55CKmz9agnW/ULo4cVWc=;
        b=jsv2vPeJYxcbjC8eDvH+gkjabhHZYSRQKnjW2MrvSNtMxohu4yjzWgvx0/i7ee+2AT
         ovkFpfrzRri5s5OoxkTKv/s3RRjKYVkdNE9HP2Lm15yZNPbpUOFYItlK4cMLZKc0pFfp
         chKF+ZtvkfLGFZlnMDeW8g7PFqZrwUJnSpbFjsiZy0dQH1OitiiWxDbqyD4aA1EtGX43
         gUb9gf5l3jVnDYKF3KzZKTqEKCjU3BB0sr7bqGFcQ9f6GC6sSVn71xY3YwRvapV8u4Nq
         /LUYxdFI9QdDOTDz21gzwsUJM3QKdjfv1ANsAVzQXeRfBG2cDnKgaM/6s+dGTnm1iCf6
         NV6Q==
X-Forwarded-Encrypted: i=1; AL+hErGqwBBzP46+hOQINmmRUeK9FR3U8eygYrr2LrFdlqhGZhHcKh2Dg6tQCczozbh0EKhkFgfOubM=@lists.infradead.org
X-Gm-Message-State: APuU4Z/5XRYGqsmNKFhl5l1+iBz8QjDJGtKn0XwUcJ+Agt6ukHlmEUBC
	fwDQUXts7h7Jr3Y2Km6omCxRsZ7fgzPuopaS8jSAsN0f6p12g7Fem4Lme6dwV0Q59lKtXSOo5yk
	9/g6Yjxbidl/ER9DpVx+GBOMoYqL5R5bgBZHyig2WOtoMT3Alb8onTCxYmkOI89ojGpK/a3JtR9
	qRAA==
X-Gm-Gg: AYBFou0dUtiMISftT4h7E+KfJ1N+j4r8dDs/JJjauVDc8ewgqWcifvIRO5omgvNcdjG
	4fn+JqUr4zxtBk9ftUBEf8ThECnWKcdBdLl3PYbbnEdIGy0GDRRxRQg+Pu7YD7SGAIncfRappAq
	gxYUR1N56zOk5TxZ05+9Ci8ek1GP+/woHtll+WMCe2F24l7ndc0o5WsrRfT+VSczYC38RvHfbsT
	eGYjVtQPpqOOodFxuoNJvedBtSrrLAVfFuO1MITkwlaS49MdDGN3WOswz6KMZqs2aCQXDXwsIPy
	oxeMuFeFBuR09mkAlLLdeyUj3v9AwWmFoJlC+iGtQtpQGQ9r+VZBwIHHj13Z1pELQoUIAx8jLc9
	PnJtOupBZlBX8UMaPyQX9lRqHu2PgMLdV+Ifnd6rhpIrLAFUezYnFHfInl1tV+NA/POQEQlGYqU
	x4tm9ktku26ESbgsNdz/VvfvPq
X-Received: by 2002:a05:7022:b0c5:b0:181:6b8:31f1 with SMTP id a92af1059eb24-1b4f5f3475fmr1940017c88.10.1794482790998;
        Thu, 12 Nov 2026 03:26:30 -0800 (PST)
X-Received: by 2002:a05:7022:b0c5:b0:181:6b8:31f1 with SMTP id a92af1059eb24-1b4f5f3475fmr1939999c88.10.1794482790444;
        Thu, 12 Nov 2026 03:26:30 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:29 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:00 -0800
Subject: [PATCH ath-next v3 01/10] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-10k-sdio-crash-v3-1-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=7443;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=w2wk9V4B0eogz6mgrte3TtOYqQINK7kGscMMBVt4Cxc=;
 b=NW+5Kybt9yjIlAStB0osczX21IR06KyxKTMnmjLnzr57iZqjCMW0p7owsRdSqav6TYPwGShUr
 ZPFMzZ3akGUDs/bapNG5IE1vOaFoSJoN/vPkWIywNCxQ6NouNsJg2Zp
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af5a267 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=iXikLL7u__TimuDzH34A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: i7AhuH658b8djKOKjc_gh2Glp_lvRJPf
X-Proofpoint-ORIG-GUID: i7AhuH658b8djKOKjc_gh2Glp_lvRJPf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXzUyEgM4/tCA+
 xLLpcFI0GZWd1JFr02jRIBzVWjOd+VrBak+q8Pz4WMXvFuQXddQfIVZ9U/mbaFTJQ3UGyzL2V/2
 MCi/KK1pPSgJZu8IgAhOCpcBeSHon6TIlncGuF/ETpkC8D3A+X84M2cBTxLmiFM7yBATWS5SoLW
 TP5F2aETkssRNOt/SwwRtqGJTTvV5i9YSWg24taINqaXh7j9NJFuKC6Vq+gV+KnARlEYZaSEjRi
 kilIeOsbhS9XlMPHPjxhbFfp8sFR1Fu4Xg93jbpk8HrRohZg1dRiV4dkdeAsuv0HdgMX+RQ/Iuo
 neS3AhIgysfEmpzvk6Jz0OLsMKkqIYyyISEigfWRDsV/TNZORSxq4KMR/375JADarvLOwOUENtB
 5wkr6RW99CrgCuAYuESnj6aOqrZ4t92bMJlrw9n32Xi0CMJ8NqB4HUeeFC2Z69FiFKipDrBdv95
 yWC3S2pahX1Sfp/l0zQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX+abFyoh8Phdf
 3IXb+wL1p/utB6hTwGiqnWCVjO/aKimwMqX8dCsCAq4/bXCNP+rVdynP4bgf4qCsqYQfvtWJwYy
 oa7wfunOKQ9kz91hFyuBmM8Gz/kMdLI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_032633_927328_E95579E0 
X-CRM114-Status: GOOD (  22.17  )
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

Recovery monitoring runs on workqueue_aux, which is also
used by SDIO RX dispatch and WMI SERVICE_READY handling.

A single firmware crash may generate multiple recovery
triggers. Recovery detection currently handles each one by
waiting for recovery completion on workqueue_aux. On SDIO,
this blocks the same workqueue needed to deliver recovery
traffic, preventing recovery from completing.

As a result, otherwise recoverable firmware crashes fail
with:
  ctl_resp never came in (-110)

Treat duplicate triggers as part of the same recovery attempt. Use an
atomic compare-and-exchange on pending_recovery so only the first
trigger starts restart_work.

Convert the recovery monitor to self-rearming delayed work. While
recovery remains pending, the monitor periodically checks its state
without blocking workqueue_aux. Cancel the monitor when recovery
succeeds or the device is stopped.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: f35a07a4842a ("wifi: ath10k: move recovery check logic into a new work")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 71 +++++++++++++++++++---------------
 drivers/net/wireless/ath/ath10k/core.h |  2 +-
 drivers/net/wireless/ath/ath10k/mac.c  | 13 ++++++-
 3 files changed, 53 insertions(+), 33 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 7c2939cbde5f..82bb0bb72dc7 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2493,48 +2493,54 @@ static int ath10k_init_hw_params(struct ath10k *ar)
 
 static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
-	struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
-	long time_left;
+	struct ath10k *ar = container_of(work, struct ath10k,
+					 recovery_check_work.work);
+	int fail_count;
 
-	/* Sometimes the recovery will fail and then the next all recovery fail,
-	 * so avoid infinite recovery.
-	 */
-	if (atomic_read(&ar->fail_cont_count) >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
-		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
-			   atomic_read(&ar->fail_cont_count));
-		ar->state = ATH10K_STATE_WEDGED;
+	if (ar->state == ATH10K_STATE_WEDGED)
 		return;
-	}
-
-	ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar->recovery_count);
 
-	if (atomic_read(&ar->pending_recovery)) {
-		/* Sometimes it happened another recovery work before the previous one
-		 * completed, then the second recovery work will destroy the previous
-		 * one, thus below is to avoid that.
-		 */
-		time_left = wait_for_completion_timeout(&ar->driver_recovery,
-							ATH10K_RECOVERY_TIMEOUT_HZ);
-		if (time_left) {
-			ath10k_warn(ar, "previous recovery succeeded, skip this!\n");
-			return;
-		}
+	/*
+	 * Pure monitor: only ath10k_core_start_recovery() starts a fresh
+	 * cycle. Bail if there is nothing in flight.
+	 */
+	if (!atomic_read(&ar->pending_recovery))
+		return;
 
-		/* Record the continuous recovery fail count when recovery failed. */
-		atomic_inc(&ar->fail_cont_count);
+	/* Record the continuous recovery fail count when recovery is late. */
+	fail_count = atomic_inc_return(&ar->fail_cont_count);
 
-		/* Avoid having multiple recoveries at the same time. */
+	if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
+		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
+			   fail_count);
+		ar->state = ATH10K_STATE_WEDGED;
 		return;
 	}
 
-	atomic_inc(&ar->pending_recovery);
-	queue_work(ar->workqueue, &ar->restart_work);
+	/* Recovery still in flight; check again later. */
+	queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
+			   ATH10K_RECOVERY_TIMEOUT_HZ);
 }
 
 void ath10k_core_start_recovery(struct ath10k *ar)
 {
-	/* Use workqueue_aux to avoid blocking recovery tracking */
-	queue_work(ar->workqueue_aux, &ar->recovery_check_work);
+	if (ar->state == ATH10K_STATE_WEDGED)
+		return;
+
+	/*
+	 * SDIO raises several triggers within microseconds of one crash;
+	 * only the first winner starts a fresh cycle. Losers do nothing
+	 * while the owner runs recovery.
+	 */
+	if (atomic_cmpxchg(&ar->pending_recovery, 0, 1) != 0)
+		return;
+	ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",
+		   ++ar->recovery_count);
+	/* Start a fresh failure budget; the last cycle may not have completed. */
+	atomic_set(&ar->fail_cont_count, 0);
+	queue_work(ar->workqueue, &ar->restart_work);
+	queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
+			   ATH10K_RECOVERY_TIMEOUT_HZ);
 }
 EXPORT_SYMBOL(ath10k_core_start_recovery);
 
@@ -3727,7 +3733,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 
 	INIT_WORK(&ar->register_work, ath10k_core_register_work);
 	INIT_WORK(&ar->restart_work, ath10k_core_restart);
-	INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
+	INIT_DELAYED_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
 	INIT_WORK(&ar->set_coverage_class_work,
 		  ath10k_core_set_coverage_class_work);
 
@@ -3764,6 +3770,9 @@ EXPORT_SYMBOL(ath10k_core_create);
 
 void ath10k_core_destroy(struct ath10k *ar)
 {
+	cancel_work_sync(&ar->restart_work);
+	cancel_delayed_work_sync(&ar->recovery_check_work);
+
 	destroy_workqueue(ar->workqueue);
 
 	destroy_workqueue(ar->workqueue_aux);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index dfee432615eb..e8fcbef38ca6 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1207,7 +1207,7 @@ struct ath10k {
 
 	struct work_struct register_work;
 	struct work_struct restart_work;
-	struct work_struct recovery_check_work;
+	struct delayed_work recovery_check_work;
 	struct work_struct bundle_tx_work;
 	struct work_struct tx_complete_work;
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8e604697d6c2..3c45e5483b60 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5427,7 +5427,15 @@ static void ath10k_stop(struct ieee80211_hw *hw, bool suspend)
 	cancel_work_sync(&ar->set_coverage_class_work);
 	cancel_delayed_work_sync(&ar->scan.timeout);
 	cancel_work_sync(&ar->restart_work);
-	cancel_work_sync(&ar->recovery_check_work);
+	cancel_delayed_work_sync(&ar->recovery_check_work);
+
+	/* ath10k_stop() can race with an in-flight recovery. Clear the
+	 * recovery state after the works are cancelled so a later
+	 * ath10k_start() can start a fresh cycle instead of being blocked
+	 * by a stale pending_recovery that nothing will clear.
+	 */
+	atomic_set(&ar->fail_cont_count, 0);
+	atomic_set(&ar->pending_recovery, 0);
 }
 
 static int ath10k_config_ps(struct ath10k *ar)
@@ -8170,6 +8178,9 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
 		ar->state = ATH10K_STATE_ON;
 		ieee80211_wake_queues(ar->hw);
 
+		/* Cancel the monitor first so it cannot bump the count after reset. */
+		cancel_delayed_work_sync(&ar->recovery_check_work);
+
 		/* Clear recovery state. */
 		complete(&ar->driver_recovery);
 		atomic_set(&ar->fail_cont_count, 0);

-- 
2.34.1


