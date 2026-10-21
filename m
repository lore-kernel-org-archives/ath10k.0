Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F74D60A3819
	for <ath10k@archiver.kernel.org>; Wed, 21 Oct 2026 09:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E7LhObXt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SuMwh/LY;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P8kF0uRb;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mmqk6xaj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otIwjrkbsLNWec0npAnJUqCgDqh7U1EWf/DMekBYQGY=; b=E7LhObXtDcjVsOK7R116vc/wZO
	pFsRyp1MVaVzAZIbRKILoQTRQ8D7FU9b/soYxpfO02UqUsau8yUXk2FeKhgb38PzpndYnhr6IzzaC
	6JZodDyZijDvZ6PtT54cEo8sOiat/hufkw2h+FL9pnBfI/UZ1u5fa5V+Kf28lKIb21R8GIN5khHqP
	cYMhRtESJ9nZKb7pWUEfLOLIdZLCJBeO94vYso8nVhJwg2TnnQeAq99lbqOpFDYEhH6k01+BMJ5N1
	eerdj0gNSPlSoJg9qsZSpQx6ibOgVF3B22Owcnblwv6CcyW6KvHWE1Wfpw2elNa4kLXHB9v0cM02l
	Z+p48PWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSKk-0000000BRc1-3JR7;
	Wed, 21 Oct 2026 09:10:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSKj-0000000BRaL-1YrO
	for ath10k@bombadil.infradead.org;
	Wed, 21 Oct 2026 09:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=otIwjrkbsLNWec0npAnJUqCgDqh7U1EWf/DMekBYQGY=; b=SuMwh/LYpsfREQyD1InU9izJG+
	LLCfmRB3MUnx5ZOsQx6R0j8dk3zfpvdWwCw0su0y8rN3cop7GURzsbVAOYa736UU0TLDSaMV6xjZS
	WYqG3qz69E4E+sdBRa3UMNSfq/5KFGPzgj6buLXgI76nGutFMNAeoTi5WSdglMqdHhhqX4lCF4rXj
	cJ06u9JV1izWfxSGETA5sIwKdQGcmTeVzFLVHMrSYtDLJaAQEr82m/pGGssqLoDz5PZ8SZFh6emyE
	fLY1OVx8NGMQG+1im0hpuxeWvhqHX/XYSlpeAvriKFFBEvDQ0qsV0nW+OcJvwvnBXqgBPhh/Hkvcx
	0p4bQ8Tw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJSKf-00000005dNm-47er
	for ath10k@lists.infradead.org;
	Wed, 21 Oct 2026 09:10:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jNac3573315
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	otIwjrkbsLNWec0npAnJUqCgDqh7U1EWf/DMekBYQGY=; b=P8kF0uRbe8eGz+Xp
	Vwum07iLRg/bTDiX6w/q1gn4UhPIPHV8M66pTQ4/QAx2NE/lZ0osRZMMgh6CV+vB
	l9hngmkUQeWKt5LhuaAUZFenRTJfVjyDbKpNY67Dquoh4Kud+kX60g6YkMN+12jf
	QwIjPTR1lbZleP0HL7hjZkIChSEWGuSCLqAQXKWSkunvHl8vYW2XJVbhyZLE/PSE
	LGBJQfOjpwLVCdaw2HsgBoA6WASOlo+kPTY3V2k7kVfEPhXRidugMTdlQjf0C5pB
	gRsGMZdCxaBSoCJOC69Ecy32QsjxhfRnqPwSVTd+9k4bfteYkcgqB93i8alPNNZQ
	6cVTDQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hu5kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:10:00 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c55ba309c2so736025b6e.1
        for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 02:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573800; x=1793178600; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=otIwjrkbsLNWec0npAnJUqCgDqh7U1EWf/DMekBYQGY=;
        b=Mmqk6xajtis8bRV61frMmIkZw5SI/ZqYJWzXrfy5rjKqu6FmxpJPvIlU48xF+R5jgR
         oAHBzZyEnflnHaUq6ZM77aWdEyHoDy3HsBg7amytDkFpAEcdzwZtQTCL3im2pvR6EBJu
         AqpAVXWICLIbnggyzSTYQbgrGOnVIJx5NAbXb+ZGm4hI38WxvW+xRhjqiPWQ4kwZw8kA
         eKU0kjwWK1TXFMheRtYzqMBrZ0UfDwYHDQJvwBFzodhj8ZrG0d0k6PkYRsj+uw6lrxH0
         B7+2Pta2ddZFlRGfXXDAhfJ1Ue29TDLB1Jy+1YF6zJD5WIp0zgBmLX1vFtWEVr/9bQBU
         6IMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573800; x=1793178600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=otIwjrkbsLNWec0npAnJUqCgDqh7U1EWf/DMekBYQGY=;
        b=rwckO0u/XnulH9yRpLE2cLFhbMSE+36b2ZnOXjpyby0PLFGaPPMNhY4AI4h9HbjiZT
         G1hhP6UhlVuCeWB+Vp3aKhefr9rmXggyqmHQTPSy9qgmQBd4iHrygFAvC0Ft1gWKjI4a
         l0mIw6ZeGooZpuocZ25bg6Zw8jJ+FskcP1/b8/IQwhyNvrVOFmPfOm4//Dll50tXoDTQ
         6Q+00AL11KDGXV+eGw4aluXESXiL/c8K8d9NFVQoInIHRZr53cxy9DmlNFAd25mp1Ah/
         6pFvDE375ZqUM3HPAsZ6KQ8LeJsq3FIC4jFxkuxzwgXiC/Byz8vrAGGTOJ6F/NGSvBnm
         bKNg==
X-Forwarded-Encrypted: i=1; AKwUvBwfVBIKmcGyFLNdqIM5fFOQdWA2jKuF35+tz9fBYmGMC3rkMg/22A89jIcrEMx6Rx68rWYUueA=@lists.infradead.org
X-Gm-Message-State: AFq9FYKGtsuqi9hqXG4vw2SSAhmmJneLFFw2PC4Iw+bGspMRtqzWb0Zp
	7VOmndig38slV+gmeFHwmM5RKXYCqw26OCV4k6dUzlpTeXXZmNW0Klvoz2tB4wWII/M4V8CYcMb
	RoAeSu5b4nwz/eYmvGBA4WyKUAabA+fcM5Wqx65NasxORjZFp82cmOFE1sSEdD/tk
X-Gm-Gg: AYBFou1wvBl4fg8aicob+Ysbe24j/RcvYSOFGEL7B3sEvFbCtwmI9WtNLMzSCbW6yo6
	/VimBZmR5KXArvBvnKLbD1B9mmmSAQ/g9ktiPIYyY1JnyLx/NS/pLhB3Uf2VLNrMj3Yp2Iji0AD
	HPsauiDH+omN4akWoul9rm+wJiowkYNuzcOH6WNcGZcZu4BlAH+c24zMJyG+48VG/IZbDTo70gR
	9GuRzHuCIdk7ZP4AQN0TSfSDo1wugPc0rkL7iDsVzivvlFbT65g1rvNrEglBucdN2HG3A2b4d70
	40idn3KMMQXBUefrIdkxEfzgV5I8RGyErJIwVhNeKGs61HXzzxqX5JZ92PsbcSmPSwmsGy/ykx1
	84oFPrTW5+UYRC0+2iz6X30VlSnjbw+1hDOPCP4uXt9+wk3gawA==
X-Received: by 2002:a05:6808:c3c8:b0:4a1:296:adec with SMTP id 5614622812f47-553559a2129mr911711b6e.15.1792573799754;
        Wed, 21 Oct 2026 02:09:59 -0700 (PDT)
X-Received: by 2002:a05:6808:c3c8:b0:4a1:296:adec with SMTP id 5614622812f47-553559a2129mr911699b6e.15.1792573799289;
        Wed, 21 Oct 2026 02:09:59 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552a182d59bsm1554595b6e.0.2026.10.21.02.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:09:58 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 02:09:32 -0700
Subject: [PATCH ath-next v2 4/8] wifi: ath10k: bound recovery time before
 entering WEDGED
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-10k-sdio-crash-v2-4-5df80bf16e86@oss.qualcomm.com>
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573790; l=3465;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=aI36eG+GzocWwLCMMibADJ+IZVoI80YgIbYKQuwNIN0=;
 b=em+kyqEp5au2slgZnedoA3xlXSO8GkOskCvL9Lli1nGEjuxN+zIJxElYFOrIPD82FmdTCZfZx
 rdWnBKyR/ZXCa8FAmAFivsU46GJ2VXT+f2Ljg2O1SQCVWgUMe4S2JTC
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad88168 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VCOL0f_idG3aiQAZe1wA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfXyYmQzd84PxcQ
 Mc9oD1PPk4fFPo82SC8sB5YxtR/hMcCskawfKsVK/gIXoqGOmp5PmmGgVq0v2XoDj2Ihiz6ZNp5
 GrqYM5OS9qaUJ4R0HvWSUDMkWMorkMU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX8gYmIzWQC8xr
 ZkKktg9KqoEe13FlB98SbkXWyM3XPYKwv5MS67XkbD417E+lASF+JSLuCIdg2VTl6F3NoEadJXS
 QsL7xlZLqrNxitwn/PSn+RJdcgS8EzDzaZJ+CewnM3IczRbpcwewT+BqYLN5hE+f+n+a3QGQQrW
 Gpbx3gTulQdoHSCTxRrLku9GvDpqSn8/f0Uq5tfRIWJGcUPDvaISkWV1ftRyaRnVdkG8AEA3Mif
 m7+fSBILJO7zlTcbfvFHP94ybpxiAu4TqdyYIoZNUZ4F5Caas50C7Mb97Mbv56RdJgvU1bykUXC
 uEBI583CGMBasn+cRWYJh57vSWp7+21SIxRR+EGt5FbVb4/XQd4ojwVmZkBQLTr9Mjf+TFyR1qe
 0lUQ0eBuAAZUY46Vdr9EjjJl8wGtZ36k+MdLWo+Goo5/LAOWU57Mk6U8IgUkj9e4VbSxvatzZvv
 hq+lUf3R6k37cThA+LQ==
X-Proofpoint-GUID: UmwHPIVye_4cst34yIEt7EiwSgiNlaQ1
X-Proofpoint-ORIG-GUID: UmwHPIVye_4cst34yIEt7EiwSgiNlaQ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_101002_520347_BB734D00 
X-CRM114-Status: GOOD (  17.50  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit c256a94d1b1b ("wifi: ath10k: shutdown driver when
hardware is unreliable") added fail_cont_count tracking and
declared the device wedged after a fixed number of recovery
failures.

This relies solely on the number of observed failures and
does not place any bound on the total time spent in recovery.
As a result, the time required to reach ATH10K_STATE_WEDGED
depends on how recovery failures are observed rather than on
a fixed recovery budget.

In practice, recovery-related delays can stretch the interval
between failures and allow recovery attempts to continue far
longer than intended before the driver finally gives up.

Add ATH10K_RECOVERY_DEADLINE_HZ (15 seconds) as an independent upper
bound for each recovery attempt and declare the device wedged once either
the deadline expires or fail_cont_count reaches
ATH10K_RECOVERY_MAX_FAIL_COUNT.

Also reduce ATH10K_RECOVERY_MAX_FAIL_COUNT from 4 to 2 so
repeated failures reach the WEDGED state sooner.

This keeps recovery time bounded and helps avoid suspend
watchdog timeouts on platforms with tighter watchdog limits.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 +++++---
 drivers/net/wireless/ath/ath10k/core.h | 8 +++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 677e582b87e4..25e9a8f0ec8a 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -15,6 +15,7 @@
 #include <linux/ctype.h>
 #include <linux/pm_qos.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/jiffies.h>
 #include <asm/byteorder.h>
 
 #include "core.h"
@@ -2544,9 +2545,10 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
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
 	}
 }
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index c739fbadc8bb..0319da3ec022 100644
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
 

-- 
2.34.1


