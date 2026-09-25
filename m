Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5465C98321
	for <ath10k@archiver.kernel.org>; Fri, 25 Sep 2026 12:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9XRsPP9WKACEPq6mNyj1Ik9HYcI9okPsPcrUsTmRV8=; b=uHiObMG/SeS8f16Y5eNR3aKicI
	vhNhmqG9xLBfP7SrVxSQKfLQJuX+fmGG/ydDI9aouOTAAHb0PdV/t3ELp6EtgsmvHRRwLWo8Efa9o
	VBso0grr2DNGCaEIcVaDNvjDuKuLL0m/eqoTNEntCRFITa6rPPqaxS8a2IYbpbF+QBDHMaOZ2vqyI
	OVGOQ6FsLPVf0D6ti2sUZaCT73kNlPIwLEHOH8e5IqsOTOvFedsUXKW5JJ9HmQJyXJgx3UaEkLaDt
	jRUniQI+EiDAtkK4OiC2Vm4JxYn+WZhAKcQU191D+VtrLA7RL7gUwvlQaWChLJDoa7wumA/sTQ3/A
	5CkMY4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA50v-0000000DJSW-1aA9;
	Fri, 25 Sep 2026 12:26:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA50s-0000000DJR8-1JtB
	for ath10k@lists.infradead.org;
	Fri, 25 Sep 2026 12:26:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5InTd600190
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 12:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s9XRsPP9WKACEPq6mNyj1Ik9HYcI9okPsPcrUsTmRV8=; b=hwIJntDx1Mswiptk
	Uds0wgBb16Brp+5nbUVCduooqwGrUCHv8puTme9x4dPOngg5hWag5AulSe9lLdfZ
	fzEuevGryY/lkM4M8MFcSzmTO+VlFZrtF9SvWw0Mb/FGl6Iwn5PJ0jg7S812BQo6
	fpVNkHbTAZ9R9+TrJMUK0QfwNBpQl2AH+Ilgm7pHkQyiPAl7ldTgEa5L8+NQCBW5
	CG6S3bXzxgdFyCWQhXdwOuOVkoj9BPPQUNyZxVM5+7xC+RIuEr+DTMMElsM9YV4g
	vftEWABqWGMjNLfSE/vYp6jSC8yEoLGgjv0kGHJaMra0e6MMQJQ98QzuloNS6Y+e
	5HB/7Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvs9jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 12:26:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1571020a91.1
        for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 05:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790339208; x=1790944008; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s9XRsPP9WKACEPq6mNyj1Ik9HYcI9okPsPcrUsTmRV8=;
        b=U4LqKPkNgBvQX6LMBpUnUCrVmYEQmqrp22pOEke2KsGwqg+RBDgMHRIgmo8gkOUFww
         +gi4tjDH7JPKb+b/7gKBd9uow/z6+UAAAaCvq1NjU51/ZR5QeF7xD5rDmMaXjjlZgsQM
         EDp2hrxHNXvHk8HP+5oOUbf8WEFxtP7CoewYf1i768/ImXI9VDhGGJvATxrg/0YjhhH8
         lF3gAbDH4KC+085KxD5eonhngd7kcK7JaAUF3NGMOqeNwCAm80OgXeDzL2hPwLprLbxc
         FrCwj/WXyOOKCgOwjkFxbynTD4xl74jCHsDMVJeuCorGaLWaZ6em9if8rsrwERWtri2V
         JuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339208; x=1790944008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9XRsPP9WKACEPq6mNyj1Ik9HYcI9okPsPcrUsTmRV8=;
        b=Rrccno1bCRE4JtbMTt8qhE9Hg/wOF7XKXkEVq1sTWXF8bJDOUOpdDz+7TKg+33Uip4
         N9ZENijWtF8IxNSxRBh1FYKun59d+ZUfn32iD5JlmJvYxSr/3I47GiLbfd8mqzlFR/Vb
         CboFlkvmF8Xe0O5Zhc8NAnrGUtx/LvNbR1ok2NgUK+gpav/wHZlmFOjYIskeCY8Wt9Zz
         utATaie9xKX+yOEPG3eSpI3dUc2F7BnMUKjuPcymSyKEKojMPIcZLc9x3RKpOlN07CyX
         7gmypigxmhlFkiuGPe2bqkspVYI+x00ZYNiAxzh8pPejIBRQblr+FpMth1qVm7FL9u1d
         8Ueg==
X-Gm-Message-State: AFuF++ngcssdRdDMRJI9I8vp5yHMHFj/2pMqQLnKt6z+z0coZgdrvtuR
	GT+duFMF6r/Yx8mFMmXwxEHWFC4seUrLeuY3ZB6mCjtV1xV9Jxm3oOMZJThEV8NaJUWhoTL9kwA
	Gbbni+55psxV3epdFroueZ+y/Wu2yWXkS0RdLPzGI5MTfs9PJYgxT77S5zh/cdJMj8NyEwzBw9d
	VYWg==
X-Gm-Gg: AYBFou2yYRz4BxZe7gKtjcPP7grFiALOdvMoRK7SwIO6HaPI2/zlfnDB8cmoQTMUPH2
	RVc66tKbBdzEMzjkcaKAuOKYhYjrH4/BVBSfk8tSnlpgkU21ZyWMXDOIAWrSoYn/83a/OXo4QFc
	Eg7xzYueAzq3z1HsM5+hcynPst6FzDhmzZBXFB7aSsoOle5hOjycO1L+GW1rHfDopSYVPB6nUn2
	6H3B0nh8E3oW11boZhTKoU406iDcfMU2rRiZ4+o0YMVm+lGRuCehJn0z6Xwu/5IivXGDOG2sRiX
	p5HiuHmbGHJ3hLBp4Z2T1yn+7O8Jvz6WQ+9YGuQC0nGIxXCBViBtM6uX96fSnzGbC8xF57xqCXv
	xdwJ4bz+OdQ5ewaFij5OTAY8yDokBBV2LlnmkctS4G1Tw8/MzFSo=
X-Received: by 2002:a17:90b:2b50:b0:3a0:903b:f25a with SMTP id 98e67ed59e1d1-3a098acac80mr3949849a91.22.1790339207895;
        Fri, 25 Sep 2026 05:26:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2b50:b0:3a0:903b:f25a with SMTP id 98e67ed59e1d1-3a098acac80mr3949838a91.22.1790339207251;
        Fri, 25 Sep 2026 05:26:47 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b998dbf2sm4401671a91.12.2026.09.25.05.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:26:45 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 05:26:31 -0700
Subject: [PATCH ath-next 1/8] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-10k-sdio-crash-v1-1-14baf913df94@oss.qualcomm.com>
References: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
In-Reply-To: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
To: ath10k@lists.infradead.org
Cc: Kang Yang <kang.yang@oss.qualcomm.com>, linux-wireless@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790339204; l=5344;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=LVgFASRo7F5a3oNBm2BMula0qqWi2OyQWiQDa7dBAKo=;
 b=Zz1nrSVTtjpkrc2ByhmKdsD4QpJqjpC+MRL7xUKO6VMTcXwtLWLidTE9QPNxwu2FRH7989ua5
 2/Dqe+9brDqAGkxQ/JMYti3Qz+EM62Vfmm8gz853ZFTHn2MbRdat+hA
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-GUID: nI7wWhRWvXj3pp-CcMAWpHRPxjLJNvDK
X-Proofpoint-ORIG-GUID: nI7wWhRWvXj3pp-CcMAWpHRPxjLJNvDK
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab66889 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FvdSVOc6Z0cOWoVicyIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfXwKy8h7hCNLPm
 VllUSztpWbo/akAqYXO0n8wDy7QiYk0gJ8C5dgiOgWno6XWHmydhuc6VNS38ADGJ85lZF3M1Anx
 +WXSINanXqUAHfY16h9+xcPBb1XHTcc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX7SiIet1/oNPa
 v1dzOBXSFryA4F1St22TZ8g1ndx+gvSxafRA4gfz/rV6aBxz9KvesrL/8LBvkXwIzvRK8+p0hHJ
 MRt+5Fw+d23rnybHisvokxbzWtPtsHf9mP2mpntx4hSDoycQlwhtnVrTAtHKZHkj+canUcpAsTx
 GrVNbbDUEXIAAYGWMbGCsEKF+fpSnJFeV7Iv8WlpDNLm/4eK3qi5QRKPit8vXoF0LCL0VWLgZiq
 L0QZSG66qnMT1rKFuwWmnym8G93kqfbb2VRKzW1nB6/KrcvsJziIyjzGuW+67M+JpJ8MyUmZssQ
 4lBHstQ//y7CgG5iB2jzWCa6mxWh1WFSiQAWSWsTmgsMiHr1eFmpMLPB3zC6go1iuyYDViFAap4
 Diw4n/XzcBS4Wc2fcOVSen2cMO8YGZdrazqw1sN+x6YhfNKgZIbg1xoCLLlnQ+ZWO6xX/YxyngW
 XS+gBIspA1PdVzoOhrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_052650_515959_8F061D35 
X-CRM114-Status: GOOD (  22.25  )
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

Treat duplicate recovery triggers as part of a single
recovery attempt by gating recovery startup in
ath10k_core_start_recovery() with an atomic_cmpxchg() on
pending_recovery, and by making the monitor path check the
elapsed time since the attempt started instead of blocking
on a completion.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1

Fixes: f35a07a4842a ("wifi: ath10k: move recovery check logic into a new work")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 70 ++++++++++++++++++++--------------
 drivers/net/wireless/ath/ath10k/core.h |  2 +
 2 files changed, 43 insertions(+), 29 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 7c2939cbde5f..ad087e64db9f 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2494,46 +2494,58 @@ static int ath10k_init_hw_params(struct ath10k *ar)
 static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
 	struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
-	long time_left;
+	unsigned long recovery_start = READ_ONCE(ar->recovery_start_jiffies);
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
 
-	ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar->recovery_count);
+	/*
+	 * Pure monitor: only ath10k_core_start_recovery() starts a fresh
+	 * cycle. Bail if there is nothing in flight.
+	 */
+	if (!atomic_read(&ar->pending_recovery))
+		return;
 
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
+	if (!time_after(jiffies, recovery_start + ATH10K_RECOVERY_TIMEOUT_HZ))
+		return;
 
-		/* Record the continuous recovery fail count when recovery failed. */
-		atomic_inc(&ar->fail_cont_count);
+	/* Record the continuous recovery fail count when recovery is late. */
+	fail_count = atomic_inc_return(&ar->fail_cont_count);
 
-		/* Avoid having multiple recoveries at the same time. */
-		return;
+	if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
+		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
+			   fail_count);
+		ar->state = ATH10K_STATE_WEDGED;
 	}
-
-	atomic_inc(&ar->pending_recovery);
-	queue_work(ar->workqueue, &ar->restart_work);
 }
 
 void ath10k_core_start_recovery(struct ath10k *ar)
 {
-	/* Use workqueue_aux to avoid blocking recovery tracking */
+	if (ar->state == ATH10K_STATE_WEDGED)
+		return;
+
+	/*
+	 * SDIO raises several triggers within microseconds of one crash;
+	 * only the first winner starts a fresh cycle and stamps the
+	 * deadline. Losers do nothing while the owner runs recovery.
+	 */
+	if (atomic_cmpxchg(&ar->pending_recovery, 0, 1) != 0)
+		return;
+	ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",
+		   ++ar->recovery_count);
+	/*
+	 * Reset fail_cont_count on a fresh cycle so a stale monitor
+	 * from a just-succeeded cycle -- one that inc'd between
+	 * reading pending_recovery == 1 and ath10k_reconfig_complete()
+	 * clearing it -- does not bleed into the new cycle's
+	 * failure budget.
+	 */
+	atomic_set(&ar->fail_cont_count, 0);
+	WRITE_ONCE(ar->recovery_start_jiffies, jiffies);
+	queue_work(ar->workqueue, &ar->restart_work);
+
+	/* Start monitoring after publishing the recovery timestamp. */
 	queue_work(ar->workqueue_aux, &ar->recovery_check_work);
 }
 EXPORT_SYMBOL(ath10k_core_start_recovery);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index dfee432615eb..c739fbadc8bb 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1215,6 +1215,8 @@ struct ath10k {
 	unsigned int recovery_count;
 	/* continuous recovery fail count */
 	atomic_t fail_cont_count;
+	/* jiffies when the current recovery attempt started */
+	unsigned long recovery_start_jiffies;
 
 	/* cycle count is reported twice for each visited channel during scan.
 	 * access protected by data_lock

-- 
2.34.1


