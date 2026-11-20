Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EB860A382F
	for <ath10k@archiver.kernel.org>; Fri, 20 Nov 2026 08:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JZninNs7;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=abit4y5V;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kXYWmcmX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C5YwICipISVd2g4uhLIfNBL06erlc5jEPBJSt3vz90o=; b=JZninNs79Y6pyz
	FwNHhc8JUYB8WrlKaYQUwwxyRq4oie89KkiXVWS+ISWLjL3joAB2fFQbvdLKRUc7eKDXJSGM0L7ax
	fDy/9COX7d+ub83SylgJZ4MWB95EP5EK2MfnsILLLgdO+nJ4LLX3MYKqub/8/Bl05sfp1G+EDooXU
	1y0RYTVZDNRQzU9YZUiXZLaok8A4xoboQtcBPhUBNQqdhqCINcClZKZOmiO902xkvcz8qlabLwU0r
	85IRGwyOwCLhk6tUX4vf4LD03LFQ6nN1Y0hNfB/jyt5DeW6D1myar9AqGyLLofLkVCpSDsP1HnuTk
	KpHhrngfLESz1CjiZbZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKD4-0000000EMdH-3HJG;
	Fri, 20 Nov 2026 08:43:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKCy-0000000EMXu-0Lv4
	for ath10k@lists.infradead.org;
	Fri, 20 Nov 2026 08:43:02 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f2Jt606057
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C5YwICipISVd2g4uhLIfNBL06erlc5jEPBJSt3vz90o=; b=abit4y5V+T/Jq5g4
	bYmNSeylkyJMMN+uwIdCqFRf6bySXOoO+UU6CYz5m3W998OQYAhsoMWxBkmFr3Fz
	Q7kn8kRbngUJjAxHLV5NJ3QqUi8MLdXiuHyiCCQaTGSzoX7VoP29KCWWDrzEpqSu
	wVdFPQ0EmRM+va9rT9bCivog+vTXlehWfknEPrmcbJ6Bl68HLUHgiR6eYsWd61aK
	R9TqpbAE5WONEqgfhD6liFhB/aWWyn8Djg3RnMjXjNvKD8Di3eOK05aBIwuTLn9t
	muxPOe3KFbCNBfkctiKnR8NdEPTs/9l27kyyENGwgd+DEIs9uxsBlO/GUtxRjlZM
	ugLSzw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrn50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:42:59 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso671778eec.0
        for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 00:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164179; x=1795768979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5YwICipISVd2g4uhLIfNBL06erlc5jEPBJSt3vz90o=;
        b=kXYWmcmXCmNg8neQ3zumuZhgfIDT3/Rg2rmwkM7/yyByTbbBpEbaIne1KMDTIdeV1R
         PptJ1zmA9yF3WUCZUxG64ANTgfv59JXYqpbJfa6XFASBLOXy2l7UeqvSwulYfSHeMb+K
         1KJqGOcgKF7Po9itHtniUz9baiHi7pnANEomsKR0MrJE4oIY2vE34M5YCfG7ZR8O0OU9
         AaYRAW+XHKUf/es7ntM6QMaVPzJj3oHjAw3mepzVmao29YTTRBzAJ+VY37A/hncd5zy1
         amxvk8MMA4pcOAlcgemPH4DFtQruWFmGMfsSj5f6aNjAccyRXVA3senau5UYLmMFQPb+
         HIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164179; x=1795768979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5YwICipISVd2g4uhLIfNBL06erlc5jEPBJSt3vz90o=;
        b=s9V1HWZTi0b0K3U8Kw7S6wThn8XQW7BCAPvYQ1vnOX3SdTb3MWh7OCp5mRMa5WiE90
         Ne+6DhAUc3BR1Lk82KlklBm5TmT5GizEI0mqn+vdSg7NWv+re4MYoMn/IemIbLX6v1WD
         RHV9LdLuTdTUk9lfNqxj8Z6RqUZcxOCrf+4FQ6QY77jTF3a+cMckzDZDxapg1wWmYeHd
         D3mSDwCu2r+inRSRNhbk1RvHxQQJyls8VQsHrW++CfATUDDWBkA8dijw+zRSJWbmfq0/
         Zmc7SizhTjp95z80cKvEK2SoXQckW0KTy8QKFs8o2RSoTtJjTqXpyFSj5UY5kVLIXv2u
         cZWw==
X-Forwarded-Encrypted: i=1; AL+hErGTPp2XgZ3rKOw6aQo/WAFAWy5VKUy8OWhaF3apDeEPNUOWSmYmjAM4bJL7JxwyOPxN8wZcT4I=@lists.infradead.org
X-Gm-Message-State: APuU4Z+46JwmVG0LOynej6ahvfDPp+2jwa4EiwSIDraTbebtoRxEaEQX
	JB2k5/pMpgHkCTxp0ITeG/PTry3Wcc4wL8ZOJ+VSBBLatyf2Sn/qSahSWhDZSGEiXm1Nrwf4N3B
	FPoK5xtzqbdJwGanea0xiY3rhcLrMpIM5UdezELlPHQhWf2T3XjDqwcOH0o7JAavI
X-Gm-Gg: AZFdTZey6zTjcBBNWNK1KRZ/9t0GZWvD2fsLn/tV61o0Zna9Z/vlt4ZdmLPWDt5Tpcn
	CZg2vkVWkYnQyZLcodTGT1nmBTmWaRvnDnzIDtVhD7tq5IIwK5BSjoNsdPpAL8QE6Pe4/YOvDOZ
	+I87fqOq3WqpBwXdSoht0Pkb0r0cKnUXn8nisFyG9x05xDep5dT+BfNKWtoFntHzdc/7DWF0ZqT
	81lFwxvhcyNzcOqUMUoTGPc767FDmpHFk1fqUUXSj2XZpvo9I2yybUg+svQKR9ZvchDbEQ1N1PQ
	YUMIjDnpMCDshGeRrusIQbhLoYjlGLiq7C1/Dt/M1Gsl9cEVWuGrYGENYZgoDzCFG9RxUCvG1pT
	9lYnYor6lOBRYKQ1zfd/jFXcTELdkMo4+mz1zR54U4Jdk1S6ZYDq8ya3fVmeLk8pjr6aRcqaOs3
	J6V7dZ3u9kz1rcdGqxwD2/40U=
X-Received: by 2002:a05:7300:ae10:b0:381:e45d:be08 with SMTP id 5a478bee46e88-3856fd5b980mr2097168eec.21.1795164178905;
        Fri, 20 Nov 2026 00:42:58 -0800 (PST)
X-Received: by 2002:a05:7300:ae10:b0:381:e45d:be08 with SMTP id 5a478bee46e88-3856fd5b980mr2097141eec.21.1795164178380;
        Fri, 20 Nov 2026 00:42:58 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:57 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:31 -0800
Subject: [PATCH ath-next v4 06/10] wifi: ath10k: remove now-unused
 driver_recovery completion
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-recovery-v4-v4-6-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=3570;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=CD7fmFScyWmCmXliqMDV2hy5lqRMI4cysjAMW/TR5lU=;
 b=2B1npwMUS7zePVx4vFq0hPjvBXKac1jjnWW6gNTOLTepG/z9MQzkq+HRAPmqrang33r30q8dm
 67tz52dnXHDD/RpQ6H4SK+hYMZRgR4klXE2JGCtcldWOvWzDAo2yS69
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfXyl58Uz04s69+
 +SBfMjT8n7T8/5UMceLRw9w92KNbydohub/4UaLQvtNQW3mFbpwIb8/Sdibg/k8fOrJO8lfgSsY
 diWNB4pwtZfbGWiXhmHsC92iEV4hwwnezXPU4EYtR4RLimPAXeS8+0xzco2iXQjykCMFvG6mTAe
 6OcSNNKjgb0mobFVV3TsqTNiX6ExUiAue7eJrGvW/JSBDNiVTudMbPiGnMeEtSD9kb4M3Uj5lze
 1rGDc5Uo8W6wgoJDXL1jR9oopXF1y6bivekEnu2jpi4qO7jtY7wEnRV9CP/2kKtndOkfnAk9DuE
 W17kND27ai/UYLgASllE2EsNNcUmre1wPLJ+cDRmlgRK52CJa1JeVg1tPWhuFxbBq+/Sfwsxlj8
 Zz4yPoA9HyTmW5j2zt6c0Eku7boB6eOxzIeh71nSqf8F1bnY0Qbh/OMaPngVGbmKBlr4q+EsXi/
 a13jbxSvznwLczheeKA==
X-Proofpoint-GUID: pkYSgK2O4TXcZ9jYvcnPFevD2SqdCC1K
X-Proofpoint-ORIG-GUID: pkYSgK2O4TXcZ9jYvcnPFevD2SqdCC1K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX+4GPlvkbzB8q
 3VZOL8AFTyffp7/i79Nijw+DvyUAK7cC7F/or9oWv6aS1w54l24VjZH1zdG/CVsPi8ch1bmThS4
 g9ybQ1gJXZQlOSk9r0tTcOeol2BdYdY=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b000813 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=M1ZKI_MSFVluud-aX2IA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_004300_157346_DE8FC3B9 
X-CRM114-Status: GOOD (  13.74  )
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

The recovery monitor no longer waits on driver_recovery, leaving the
SNOC remove path as its only remaining user.

SNOC removal only needs to ensure that restart_work and
recovery_check_work have stopped before their resources are freed.
cancel_work_sync() and cancel_delayed_work_sync() already provide
that synchronization.

Use the work cancellation helpers in the SNOC remove path, then
remove the unused driver_recovery completion and its initialization
and completion calls.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 3 ---
 drivers/net/wireless/ath/ath10k/core.h | 1 -
 drivers/net/wireless/ath/ath10k/mac.c  | 1 -
 drivers/net/wireless/ath/ath10k/snoc.c | 8 ++++----
 4 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 676f9657b032..ec19c4ca360f 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2646,8 +2646,6 @@ static void ath10k_core_restart(struct work_struct *work)
 	struct ath10k *ar = container_of(work, struct ath10k, restart_work);
 	int ret;
 
-	reinit_completion(&ar->driver_recovery);
-
 	set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
 
 	/* Place a barrier to make sure the compiler doesn't reorder
@@ -3752,7 +3750,6 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 	init_completion(&ar->scan.completed);
 	init_completion(&ar->scan.on_channel);
 	init_completion(&ar->target_suspend);
-	init_completion(&ar->driver_recovery);
 	init_completion(&ar->wow.wakeup_completed);
 
 	init_completion(&ar->install_key_done);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 75ff555173b2..9175d0080ab5 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1065,7 +1065,6 @@ struct ath10k {
 	} hif;
 
 	struct completion target_suspend;
-	struct completion driver_recovery;
 
 	const struct ath10k_hw_regs *regs;
 	const struct ath10k_hw_ce_regs *hw_ce_regs;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 695df1821e5c..a213d8c2a8e8 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8186,7 +8186,6 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
 		cancel_delayed_work_sync(&ar->recovery_check_work);
 
 		/* Clear recovery state. */
-		complete(&ar->driver_recovery);
 		atomic_set(&ar->pending_recovery, 0);
 
 		if (ar->hw_params.hw_restart_disconnect) {
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 8f171ab6f4de..1ec58ec1029b 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1916,10 +1916,10 @@ static void ath10k_snoc_remove(struct platform_device *pdev)
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc remove\n");
 
-	reinit_completion(&ar->driver_recovery);
-
-	if (test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags))
-		wait_for_completion_timeout(&ar->driver_recovery, 3 * HZ);
+	if (test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags)) {
+		cancel_work_sync(&ar->restart_work);
+		cancel_delayed_work_sync(&ar->recovery_check_work);
+	}
 
 	ath10k_snoc_free_resources(ar);
 }

-- 
2.34.1


