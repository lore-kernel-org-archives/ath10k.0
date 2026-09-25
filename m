Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724AEC98321
	for <ath10k@archiver.kernel.org>; Fri, 25 Sep 2026 12:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fD1++trc2gJkbJYyJK18gc6//mLeibLWqR2ndXWB/cs=; b=JPMQl06l3MxYkw1SjZBXKZloNA
	ipURP5UktPaYZmB5cCgXC1IrNbnUOKxYsL518ELJqr0VYvbz+e5gnzWbM3AR+sp8oOkAzEAO3uMBp
	c3GHmWKkgHXVinkpbLXVjtGMXPFRzdUfr/mfyavEZNlAjU8wiiOYevC1bQqIpIeGF+AfT8HI9mB7I
	k5RS6JV+r/BhvMKCPaEUXBm0haTFZd6d6lIzYaErTcSS2LQvDwB7Tn5ypk2kDBHNBeNN8zo9ivkd1
	dwwY1W+QoQ3wuRjxaovFVgtdUyJ8JjIdHPSM37snCSb5lI7k5sACuP2FoncqMCX0uXsRQYcO2S0/i
	glrYRQmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA513-0000000DJZ2-0Y1y;
	Fri, 25 Sep 2026 12:27:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA510-0000000DJVr-15M1
	for ath10k@lists.infradead.org;
	Fri, 25 Sep 2026 12:26:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5J701601381
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 12:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fD1++trc2gJkbJYyJK18gc6//mLeibLWqR2ndXWB/cs=; b=HkEajl5wHehpzUEA
	7M/ikHsgLakAHYeB/0PNUH+4WUSqIpPCpFFmOqvnujs9BbXMNTBDc1gpYzXMdEsf
	+IOzzPENlZK4wvx6xUvEO4elykJ2U1TdSba3snD2eC8q+WiJ9msmmXDSbRfkC6Na
	94opmcZva9nGqWURFXsR75+Bj3f8HtLINuvcgE2lXpPDX2xGXvgGGAL9p4u34m7a
	gpWnh3Yftx69CbqEdE9vQmLa0IPm8LXQ1VC9n22rtx/TEKIHYoVeu50LuznTQJvU
	XPDrt/OLwZMHpMVUwub+MgXLvkinnjKlinRcJKVw4qF1CB9HvPohYZVDxp+Wlpp5
	NVsnoA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvs9kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 12:26:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so2264994a91.0
        for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 05:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790339216; x=1790944016; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fD1++trc2gJkbJYyJK18gc6//mLeibLWqR2ndXWB/cs=;
        b=JqyTKxSWKGjj6LroPNyjOba56Ytfp9lewdv64p7W/wWTQQaTo7SSTRF3W+7fWqTsPa
         gvz5H7hpwbtSkuDK8L0RBigvQ8u8lzMGfyY5F9YtiMmCekCrYrmfNz2+Shlg0HvjEd9g
         RlUlgIZB0AykFkofS7mo9gDBwVAdnwd333ovsmlth/Cm5f+0sidteDP6i1VrBs/QUyo+
         1UrQ2djDdhGDINh7gdDhb+dPTlIdM/Wwfe14yBRD7nnmC19Hlh5F3P30j1oSU2PawaPL
         +BlF9JTyTDQx0kMk8C32b2jRb1isqcyaITs5kHyD4HyksUVCFs86//KqnVHqH+RaDG08
         2qUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339216; x=1790944016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fD1++trc2gJkbJYyJK18gc6//mLeibLWqR2ndXWB/cs=;
        b=nblq66IJh43KaOk5BMKNZzTGjwm0NlkhKlWd+zF+C8F43Z9nNrK0aWQ3tF90uV1u8/
         WNoNSRDTcrbxphNnDj1E7kvLcZ6qBjm4RrY4zeRh9Uzy9Cm9jZrFPTh+lUKD4zwCPd5I
         SbpT+EzC+mexwsdpKRMVegQJPKiYdVCuc+6v4KCVP2IdPZWhzNYoXIMu/NXBqM1KrjDb
         qWhHig6/4Urcmm3Rr4NQrI8FosLwpdo4uRoxqGZ3wpaHwdu/zOJ6E9kX17pz0wWKAiAZ
         rLMQq8pKn/fe3x2Be37cDWiusfAlZCRZCRkxcSDxAD35g2evKGOoTDjQeGGECDOvnu+2
         EYSA==
X-Gm-Message-State: AFuF++k4kApmdB1ff8kxh3IVjKS1uNvQMFIdpqmx5tGvpauMMwx10GEe
	yvTQeDyn96W99wFPstSN+YDhQ2+z5JRoYR8uu65oRYIy+KV1HyxYvC5dp8/4pmCyqEDd/bYebBa
	9M7DmtANpD1+IXl0ApZNUloty+S2YmxomT/NH029PLDq8uiekox8oyUr81OXNrNa7
X-Gm-Gg: AYBFou094vEBXbCEtedaWYrTiyb1N+0ThiHxjiuJ1uf6ohVB//iDlUlaYDlPYuhZq9V
	dvsSZ4uIP8Y5sdlDbWPUCRvMwVcSIMJAH1aLHrPR3qURfKlSIrJ8nl/irx5P6btSA4kyRUY5Lt2
	3aT9dFwDNC5REIkGIiJge5aR25VoNdEg9dObWNDBPLcz7VKTHcdSHmqGr+8zsLWpNW331+pFz5W
	7UxyIC72pGbpSfDorVfh6/EQQz645hDE5O6pWrPt3r74IGSkARKyhRbVm2V9p26PQmtFg57O+gb
	GDZe3Vdga6QYjXADzVwvg5iLF1spo3TI4UcyAZo+PVoT5lRxhYH+UfGzfva7ppFMm6CvX/C1rLJ
	bjXlVhB9NpYhiDuDJrI2ZSXdnzSyHScGxPDGzIRYzcowAi2hU66Y=
X-Received: by 2002:a17:90b:440d:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-3a09860fe05mr4912193a91.0.1790339216185;
        Fri, 25 Sep 2026 05:26:56 -0700 (PDT)
X-Received: by 2002:a17:90b:440d:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-3a09860fe05mr4912175a91.0.1790339215564;
        Fri, 25 Sep 2026 05:26:55 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b998dbf2sm4401671a91.12.2026.09.25.05.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:26:52 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 05:26:35 -0700
Subject: [PATCH ath-next 5/8] wifi: ath10k: check the recovery deadline on
 its own timeline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-10k-sdio-crash-v1-5-14baf913df94@oss.qualcomm.com>
References: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
In-Reply-To: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
To: ath10k@lists.infradead.org
Cc: Kang Yang <kang.yang@oss.qualcomm.com>, linux-wireless@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790339204; l=5322;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=D1Wz1LJ/c+IKbSDH2qFigvS32qzF7ER1Q6u7mMpaClc=;
 b=qhH+cYo74F0ePP7ip6X/NzoZTP2k0vRseen5fwyq4ZdGTGnb2QwseiXKdt/8GGAurau2jwuL+
 1i+kvwmL5LECmXVtPWjib1Jt9hKnwKasYLyE3YovheMuXkBP2Mu7BvR
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-GUID: zzq8WI03cEHNh3khuCWNcciLqTkU24VZ
X-Proofpoint-ORIG-GUID: zzq8WI03cEHNh3khuCWNcciLqTkU24VZ
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab66891 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4f1K30pynMUHuLpjyDEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX9aaaMPgB40i4
 izP5M0hwsFlRdMDW7gAuEDXtqdEc5wk1x4QH36P/vPykfuvxP6gjvfGsq366I5wOPJl310KnuZ7
 GOwjG2QAdgjxE3o3Mr/nvgGv0jAx9Ig=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX0auGNNHNjXvb
 t8ttOFqqNLUWrrGmDBrJ5t5NJAxLl+6QMaW/fV86Z4wypg66QJKS2MCXAYaeoLdXakxH+h3wYQj
 6qy/uvXXcjfbFeJot/vEXI7mN7oRwjpsaY42r5fx992kEwAhkErs3F5vq1x4vSbMTilG3IJ7C8N
 Rv5fdWocOshqqNGhGuiYflmHsmNGxUoijRvBMc1eXXoPWfZJzZ5NUsC3FSiUVpvTT6+aOA85zrS
 tIF4+WSbqvlIJjrKMK/y0WaRewC2d+f2TP+E/1tUSWB5Dtd7CzwNSKnza+3n6TQxQSFJSGCgwkY
 jWT9oUCQyEXkQxwJegEpPA/4a2/RvoO2BC7f0wkHZN3cPVRgp1Flt38KQA1BLzRJN84wfuYJ27Z
 LrpF92iQabqMkSW96iCMhhyEU7jjvGyyKEyjPwrxSa6ETQSWEP4zfscoyliuOu7jTJtzl733LfM
 ldqaQ30U29NenIQ+vBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_052658_425965_2E573C7D 
X-CRM114-Status: GOOD (  16.62  )
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

Recovery timeout enforcement currently advances only when
new recovery triggers arrive.

In practice, the interval between triggers is not bounded.
Additional timeout handling, workqueue congestion, or other
recovery-related activities may delay subsequent triggers,
causing the effective recovery timeout to extend well beyond
the intended ATH10K_RECOVERY_DEADLINE_HZ limit.

If recovery becomes stuck and no further trigger is generated,
deadline enforcement may stop progressing entirely.

Convert recovery_check_work() into self-rearming delayed_work
so timeout monitoring follows its own timeline while recovery
is in progress, independent of future recovery triggers.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 20 ++++++++++++++------
 drivers/net/wireless/ath/ath10k/core.h |  2 +-
 drivers/net/wireless/ath/ath10k/mac.c  |  5 ++++-
 3 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 29ca34a643ed..93dc7332c759 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2522,7 +2522,8 @@ static void ath10k_core_enter_wedged(struct ath10k *ar)
 
 static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
-	struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
+	struct ath10k *ar = container_of(work, struct ath10k,
+					 recovery_check_work.work);
 	unsigned long recovery_start = READ_ONCE(ar->recovery_start_jiffies);
 	int fail_count;
 
@@ -2536,8 +2537,11 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 	if (!atomic_read(&ar->pending_recovery))
 		return;
 
-	if (!time_after(jiffies, recovery_start + ATH10K_RECOVERY_TIMEOUT_HZ))
+	if (!time_after(jiffies, recovery_start + ATH10K_RECOVERY_TIMEOUT_HZ)) {
+		queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
+				   ATH10K_RECOVERY_TIMEOUT_HZ);
 		return;
+	}
 
 	/* Record the continuous recovery fail count when recovery is late. */
 	fail_count = atomic_inc_return(&ar->fail_cont_count);
@@ -2547,7 +2551,12 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 		ath10k_err(ar, "recovery timeout %ums, fail count %d, shutting down driver!",
 			   jiffies_to_msecs(jiffies - recovery_start), fail_count);
 		ath10k_core_enter_wedged(ar);
+		return;
 	}
+
+	/* Keep checking on our own even if no further trigger arrives. */
+	queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
+			   ATH10K_RECOVERY_TIMEOUT_HZ);
 }
 
 void ath10k_core_start_recovery(struct ath10k *ar)
@@ -2574,9 +2583,8 @@ void ath10k_core_start_recovery(struct ath10k *ar)
 	atomic_set(&ar->fail_cont_count, 0);
 	WRITE_ONCE(ar->recovery_start_jiffies, jiffies);
 	queue_work(ar->workqueue, &ar->restart_work);
-
-	/* Start monitoring after publishing the recovery timestamp. */
-	queue_work(ar->workqueue_aux, &ar->recovery_check_work);
+	queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
+			   ATH10K_RECOVERY_TIMEOUT_HZ);
 }
 EXPORT_SYMBOL(ath10k_core_start_recovery);
 
@@ -3758,7 +3766,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 
 	INIT_WORK(&ar->register_work, ath10k_core_register_work);
 	INIT_WORK(&ar->restart_work, ath10k_core_restart);
-	INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
+	INIT_DELAYED_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
 	INIT_WORK(&ar->set_coverage_class_work,
 		  ath10k_core_set_coverage_class_work);
 
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 0319da3ec022..a1ded2cba103 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1213,7 +1213,7 @@ struct ath10k {
 
 	struct work_struct register_work;
 	struct work_struct restart_work;
-	struct work_struct recovery_check_work;
+	struct delayed_work recovery_check_work;
 	struct work_struct bundle_tx_work;
 	struct work_struct tx_complete_work;
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8e604697d6c2..d10126351fce 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5427,7 +5427,7 @@ static void ath10k_stop(struct ieee80211_hw *hw, bool suspend)
 	cancel_work_sync(&ar->set_coverage_class_work);
 	cancel_delayed_work_sync(&ar->scan.timeout);
 	cancel_work_sync(&ar->restart_work);
-	cancel_work_sync(&ar->recovery_check_work);
+	cancel_delayed_work_sync(&ar->recovery_check_work);
 }
 
 static int ath10k_config_ps(struct ath10k *ar)
@@ -8175,6 +8175,9 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
 		atomic_set(&ar->fail_cont_count, 0);
 		atomic_set(&ar->pending_recovery, 0);
 
+		/* Stop the self-rearming monitor after recovery succeeds. */
+		cancel_delayed_work(&ar->recovery_check_work);
+
 		if (ar->hw_params.hw_restart_disconnect) {
 			list_for_each_entry(arvif, &ar->arvifs, list) {
 				if (arvif->is_up && arvif->vdev_type == WMI_VDEV_TYPE_STA)

-- 
2.34.1


