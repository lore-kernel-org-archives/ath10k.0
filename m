Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BAA606B341
	for <ath10k@archiver.kernel.org>; Thu, 12 Nov 2026 11:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZmicelHk;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KQS0jTXL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BBqwqQRL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X7gmftng8XyC6y3KS/A/XtQM72Yig5hdROs/Yc4m/MI=; b=ZmicelHkbeLVMd
	o8QEp8jwS1jA1Dpm6XEoXbB0ELtR/SdHTKjyaAos+E11D3XsHiggD/KN37nlOeNn/PzCksWiCtLLs
	wcckPF5tUfOZfK8pof60m50D9ZtWotwAVqGVPQ4qvpaEuCwcc9Fd7J7bUOdKP+0mUUrYZGuVZPWXS
	vTTEkDqGBJGXxg4Hlzv3aPAeVfifjEW7sLkQb05WgrNr0dUp5jWwB5ACeLMSlWr9zHaVP47U/z0vV
	oDySHq0cP/8swAPzN2VeeikAGNgK9YK+SD5P0NtX96chs0ztIAUUXW4COgll4E0i/Whpr/k8kIOuj
	qblLnzaodz1bTx8n8Adw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSxO-00000009hIo-0X0d;
	Thu, 12 Nov 2026 11:27:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSwv-00000009h1Z-0vZe
	for ath10k@lists.infradead.org;
	Thu, 12 Nov 2026 11:26:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC8wPnF4149502
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X7gmftng8XyC6y3KS/A/XtQM72Yig5hdROs/Yc4m/MI=; b=KQS0jTXL9Q8UpSEF
	eFXu+ZdFKEImDCucQHkeBKEu5RZ+egnKyKyqkp+g48qLQU4cLqBIUuSb3+zGuhCs
	tzu+WPjsuRoYMGLdpSJbvRCPIg2dg6CeCUXxPWt2K/LI6cSGSxvAjZEwH67e7Uvh
	xNq6mxqRD8ykLj2cmPgLVSchTO34HpMvRtresAeng/KEsG1t0Jf1LyVni7Yr8jjK
	pxEi8CChQDE1DQMnmr9yKr5KsOanJaTSqjKsdQsnqCfWz+RCUEVHPOiy/JXUmcAk
	rsyoQaKyBYRrr2plb/KYs0nKZrk9dmUXmMgsiW5hOEsnu7BNxbOvmD90dsnUhIor
	KkrwMw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc6361j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so6142354eec.0
        for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 03:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482795; x=1795087595; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7gmftng8XyC6y3KS/A/XtQM72Yig5hdROs/Yc4m/MI=;
        b=BBqwqQRL/VtHM1Z5lQN6vU7E/mZYLooGfmR9GR4+Aib6C7Jt+e00l0aWSNDxWy08wx
         uocEAqGmWgv6owLEtXPGfHoobEEjiNF5noLRM/vqVA3EZ4HflJ7MwtD8YLO/4RapeVnq
         sY/LswR/S2qq1JLN3mZrc1wjhU7z6te3OshQasCdcM+m0/AgZiUs+hXGoaYoHcDP0vKw
         gjDEOgvOlN1GUZaiYTUEEomHJdlkrEbZMGojxBar8KmUKliLIZkZ8zzgy0u0Y0I5vC1b
         luPsmR7WPAX0sowmOITo6VQSfjTa1xKwbgydOTKmkyUn5nzux416VIIRqqg4hnXJB8QO
         pQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482795; x=1795087595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7gmftng8XyC6y3KS/A/XtQM72Yig5hdROs/Yc4m/MI=;
        b=jvOooMh3erYsM1sOTJ4zgGYP12nJtvjJvvv0EY3U0uqhF6JUS0FLiQDBa/QcbkGi+O
         jo4t5Ff/ti4ej71SWr8bVTlGpQuG+/foK3d8SEZOmP2s8eoUDCHMkYMGZfyzlEQ4nSFM
         yTVK17LJDMXZyRa9hyoX5zPg+0Fd8/TOvYRVWRMP+qf7N8QP/7Eym4Pu68Nz/OU6Ie2D
         1MWBGqPU+8IC6JPYg9DUTyOLf/iaLv9ohdzBFMXZzRM2E2vVhZ6272IPeu/Ej7Vkx5qp
         ui3qvCscgFMUS+Ni07tQlqnlgi40LbZIRKvzUSiq1ggTysnXPcwMPXufLJleJ8hBxGRd
         T5Xg==
X-Forwarded-Encrypted: i=1; AL+hErFuyPCGqj+VLnhZelAzjFeU3mjZV5YAh0PSh4ZqQFqROc0iMYIdjqHBTs/i9jWa8m4hzY2fE3A=@lists.infradead.org
X-Gm-Message-State: APuU4Z+9HB7/Tm4znom+1P/CQ2mLG37xwNNsrVXuRP/gDQf8bWIisl/V
	7NOqkfh56ndvybyamPgX7SA54M2pjqhi9sBHhXDO5XsC9deZQLNPkJ9otZy8461+BQM7Oesmbh7
	8WRIG4aElDn8OXxIsPI49CPs+bdelaDGXCuQb8l2OfAfe0mfXyDk+ig7YlqipMAwl
X-Gm-Gg: AYBFou2soRrvbUBx6d3TVFHOVEBltJV2m+9al1ZgwdQyd0TbqX1soWpHRxv0EUCDH0t
	zNC9Si/kpBrpTuiLq+JuMK+U6HOSEFJVshZfyvnRnqToDKxP62JF1jCI56o0m6ZwnTfTAR88cI1
	DQD+sIpLWSpTutOFizYsxFpMRAyK3R+b/6rf8EkehlZ2T3OL8ZWeqM3dmHSoKYLNCOVzEnTbBYZ
	NLrSbIUzXfEqGo+pU9wr9zOchFBrM9pTsmfuKlFUw1DXmbSv3pjt23Rtu4dkT2iRNaXzVBvxMms
	viBkI3DPYUAiT+VjeX2InNaGcw9ueTQpz5av3vVsnIAotRSI22z+IKDt4QLtkwXXvFPIKW5922B
	EqsCHCG50UQDSaY8GnmymgPd0ZWKCeh7E2hfJ4S8HQKcZ04F2T6Tn3AP49C+gW5hvtpZoP9/zSN
	M2kRpeFZplylTpP+RAZk55Ddpg
X-Received: by 2002:a05:7301:46a8:b0:370:121a:b2f with SMTP id 5a478bee46e88-376854b990emr5265323eec.11.1794482795251;
        Thu, 12 Nov 2026 03:26:35 -0800 (PST)
X-Received: by 2002:a05:7301:46a8:b0:370:121a:b2f with SMTP id 5a478bee46e88-376854b990emr5265302eec.11.1794482794723;
        Thu, 12 Nov 2026 03:26:34 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:34 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:05 -0800
Subject: [PATCH ath-next v3 06/10] wifi: ath10k: remove now-unused
 driver_recovery completion
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-10k-sdio-crash-v3-6-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=3564;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=ILgt+FP56A73W3Zz3d3BGWuyYpSBYBnlRPrxfH+vH2U=;
 b=9NoNh2LHNQ5MSBo9KKKhlhG0+SPDNr5mQC7LhsAPd8fReXvDDGYhFLqeJXT/RozrplA0ICbmN
 ENdnFjZkFkuC/o2WQfX9eXjNx53k2BxAqFihVLxF+hK0ra8pxZosqY+
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-ORIG-GUID: 6F1rn3NRCg0Ov_Wk9Ga2iSBt7urpMWGE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX8gJdwxdzjgPA
 NKEKLwKCGY+mavB2Iz85FXdK717zzyI0f4IpihT+DeMcTZJPZont5oFDIHAeah9mHNXdwUIJ/g7
 8yhcKa9WA4g86B3hPNSekwBaFKiCWDhzz74JTLuK5j7kD2d8DYjVtYpFIgMz1TbuurbUoYXNQrk
 k5Q/Q86Ebrj4slTL3+e2SAwDQrgTkRGISt9PbH6cUXp2Rv7Gz4QloUcVI6w1Leqvj2dV5W31EbR
 XEjkuz/rzGBjTjS6l4Fg/EpUL/t1ghFTjcqjBUQw1mAujEjGBfxiA5SNEoPOy7KRNcx3qL9A84T
 egmDmzjV8D1wXdi554h/wf3ojSTtnTNfQOZvcVv/6reR8JaaBEUsWlQRJ5E3RmOr884+4QItvnI
 YEZbK4OW7bhXH+YphlUXHf7nGUzpRW0nV3MkdZKDuqpqxXuPm6ymsSvZUggckw81mhNi7q+9LdH
 vVTPKZQWODyw/S2boTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX5itXhNnE2enJ
 +kH3euIqG5Wu4Dw3vgduufsk0+Ht+3jXbjCTs40XdhTqpEufLM+FbUick6uHbS5j+xlbfMp1Z5z
 odA0D93h1jeQ2+i2YNa6v1JZlGzZDiw=
X-Proofpoint-GUID: 6F1rn3NRCg0Ov_Wk9Ga2iSBt7urpMWGE
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5a26c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=M1ZKI_MSFVluud-aX2IA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
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
X-CRM114-CacheID: sfid-20261112_032638_561369_79325614 
X-CRM114-Status: GOOD (  13.99  )
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
index 4eb91efdba41..3be069724ddd 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2617,8 +2617,6 @@ static void ath10k_core_restart(struct work_struct *work)
 	struct ath10k *ar = container_of(work, struct ath10k, restart_work);
 	int ret;
 
-	reinit_completion(&ar->driver_recovery);
-
 	set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
 
 	/* Place a barrier to make sure the compiler doesn't reorder
@@ -3716,7 +3714,6 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 	init_completion(&ar->scan.completed);
 	init_completion(&ar->scan.on_channel);
 	init_completion(&ar->target_suspend);
-	init_completion(&ar->driver_recovery);
 	init_completion(&ar->wow.wakeup_completed);
 
 	init_completion(&ar->install_key_done);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index a1ded2cba103..7c961308d7b9 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1067,7 +1067,6 @@ struct ath10k {
 	} hif;
 
 	struct completion target_suspend;
-	struct completion driver_recovery;
 
 	const struct ath10k_hw_regs *regs;
 	const struct ath10k_hw_ce_regs *hw_ce_regs;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 6179a029914d..50eedc078c12 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8185,7 +8185,6 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
 		cancel_delayed_work_sync(&ar->recovery_check_work);
 
 		/* Clear recovery state. */
-		complete(&ar->driver_recovery);
 		atomic_set(&ar->fail_cont_count, 0);
 		atomic_set(&ar->pending_recovery, 0);
 
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


