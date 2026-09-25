Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76034C9830E
	for <ath10k@archiver.kernel.org>; Fri, 25 Sep 2026 12:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARXBIQ4IcLEk8R6N619MGU53xX+R5Ms3rIhcUp0hkYE=; b=4sFFm2ayrqzhpe6pKqrGMix3ww
	u40TQAszWA8calxQHeEDs76WjDyH6rWj0JvpKGmyfEE9xqPNztd18rjQ1nc1/VXPsUl0jFpa38mWM
	ZNjqonLRyA5CqVsJsZLCvmbVU73lFgDNPwhTKR8ncHYleqQCj1er7KheDOYB8b9BjZUEYugaeUzRJ
	6WBwgCZh04P88looLWb1MYi01a4HhWgOv6kqw2Ern9tQSo3uv1vYQRbeR2tNuU8EnCNMnAwZ2auCT
	LSs3NZnuw9B4aiBSWsdGSu78i3yfExigt1tUzKEbDCcQ9jitT4xQ/pX3Es/WVGLG4Nj+RlvBZ6vi4
	50KfB87A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA50v-0000000DJSe-2h6F;
	Fri, 25 Sep 2026 12:26:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA50t-0000000DJRU-1x4f
	for ath10k@lists.infradead.org;
	Fri, 25 Sep 2026 12:26:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Z6sc1056551
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 12:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ARXBIQ4IcLEk8R6N619MGU53xX+R5Ms3rIhcUp0hkYE=; b=fAPzS/FI5yCoPXcA
	AAfvb19Cv7XD6v0ZlYNyGvmyOEsncT0FOfq061nuHxdbzUNkuRCsTOg25BMvqbDB
	4nfwScYLQguFWijLT5P8q6OT8owCSYn8X+q3fK5FQSWdTuG+ctRym0G6T9Dxqdjn
	LJ3dvS+JtSbheR/09v1GUGmcZnkHvR/9/U5a0Md10o8wnSOu2VkFl6U2xE9CRSBc
	xwCduZSLD/5A2RFGXIaq6II1g2y448mrkV84QbNeButAavth33v59Akj0hln7iPG
	kOyy+nwRzipc/CKGqdSxqfRJKwwylxxQppQW4J2Yrl6uCWx2LaunQjM5vflZKKsa
	lVjf0A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce7ac0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 12:26:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deda201bcso1385101a91.2
        for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 05:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790339210; x=1790944010; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARXBIQ4IcLEk8R6N619MGU53xX+R5Ms3rIhcUp0hkYE=;
        b=CNvt4+Oy485UyrzSj7XrNKLFVn9VE8bMN66JkhyeB7a1YPcupBf7J+dM5pDl8HVuKA
         YlnFrGlJTOaEyE2K7RS6SjtgWB2kZ0jYbp6QS9A+j+8DmjIxNjSxO+3Pd0pMV8yVG/2O
         L3kUMKXzuPlQrKfdmApcWMS200fopwQxYHWpcaBpX7z41BECAYKG8Da/w8JaI2BoeSVE
         zdjNGoYUfqD3wzquB47KPHQkL5r3WBtJlIisH93cQx0nUs2jAFFwPCVT+d24SANIwy6W
         oc/YCxVcSm9SKqkKRxsADMB8vsjcNnrAZe0vKnkvaneAHF1gNJCuzvhLp2K7zeymGA/i
         tlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339210; x=1790944010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ARXBIQ4IcLEk8R6N619MGU53xX+R5Ms3rIhcUp0hkYE=;
        b=XrbJQEssk44g9kL4r5jSZgP+baUgD3hC+T1NCf07+e4StkOQ8fmKA2yJhe/wQsW9hM
         7iy3gF5N1TP3Yj5Ccp6VaKsIHfb28CaMSAdvFlHQFZP2/+4op/n5sqI57OcZ1Yzevovy
         qiAHAwdYo1GOIqO11/kNak7nVqhPqbt7c6rAb3hGFHZ9buDxjMwbV66gLsT52JQEFk2R
         BXbb7xRle8scxdhzajP2L+lrjMz7B82Qobtit9gz2lufuwcwu3aMSdr3TnM57kn4FbzK
         njm9bIlP4rtdEcwvTZ7Ebnl6re5UsMbyc8pRjl3VYfa54rCmDemG8GoXz4Kk/RSFiGpy
         LgsA==
X-Gm-Message-State: AFuF++kExOiC872V+Bvmgt+XiiLxjc7zxb7ATYQAuMTBSB1BEJdvq0mU
	taIENO/hGBBFxwg0TgtGGeV0W8L8F9J1NSrbLNsnLM0PzVTSkalivTb/wDT5ZGsULLrW4tnNp79
	lc2tovy5KRfQ6cYZMdBWxg30f6LeVlsTGl8ou6ubAmEAqW/rU6Hkoe84QZvNrjwNw
X-Gm-Gg: AYBFou0RbiYaE/3CuE50RCqg7TzVSp5CzaJ5UYZ50hgYTy4RLbNBMrD/TX8MgBX6u5x
	apjF1h3j50L34GyJNl04lU+0Y8rFaCrDDTkRS6mS3uTxKk0Wv7/BJz926crM2otph41yGLckoYS
	qlkn7ZdJPJ0GlJJ5IOpVRH6YdfEPHO2mNQM03SOUld2YhmuzuCadtQSjkPKa2Zgy4zWdn9e/sdz
	eKjwU9Z6VZM6Ay9OzcGXeH/KbI5QVgoCOHPhdd/+WbbyjAcOPF0t0aCvEP/Jss+mPmDIWUTc+m9
	7FXbu//fUi7qOSCqcopby4sdMSqM+8nT0+yqZm86TD61hOyAnbS6G1G+LDlIDnOIDOsAZjTmnxD
	8//Um5l7JNDggDi16S603CXG0egxFBw2Rchm/JaDahJ5vlj0x9bE=
X-Received: by 2002:a17:90b:5748:b0:39d:f6a6:60d8 with SMTP id 98e67ed59e1d1-3a098ae1f1bmr4816712a91.3.1790339209986;
        Fri, 25 Sep 2026 05:26:49 -0700 (PDT)
X-Received: by 2002:a17:90b:5748:b0:39d:f6a6:60d8 with SMTP id 98e67ed59e1d1-3a098ae1f1bmr4816689a91.3.1790339209054;
        Fri, 25 Sep 2026 05:26:49 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b998dbf2sm4401671a91.12.2026.09.25.05.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:26:47 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 05:26:32 -0700
Subject: [PATCH ath-next 2/8] wifi: ath10k: wake blocked waiters when
 entering WEDGED state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-10k-sdio-crash-v1-2-14baf913df94@oss.qualcomm.com>
References: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
In-Reply-To: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
To: ath10k@lists.infradead.org
Cc: Kang Yang <kang.yang@oss.qualcomm.com>, linux-wireless@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790339204; l=4028;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=RzW/p1ndCnG4xw5cbLHXdb9gMlByeF2ujNXNuZyRqmo=;
 b=SWqpyGTw/9+NTpuoG0PIV5tk3Ow4hCGYqAP5Mnq+OG+DpdFN90Q3+K0chTqDkaH3YbzVenn9a
 OL+8EAMYvMRBjTnwUs+mFS8C1tXsxjZYIdbkSoFvGsWS2J7ynqvV6zW
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-GUID: izgLeXDhB3PkYgyvWdkZFSUOijw_WEWD
X-Proofpoint-ORIG-GUID: izgLeXDhB3PkYgyvWdkZFSUOijw_WEWD
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab6688b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6QK6Bl5UZFK8huMW9Y4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfXyUAuGtuba/1S
 DLw2GPG32gMeWR4Q36iLXqpwKtpkds5l6l7a2dJPKAtPLgYS0hLYMZ2SlLJWg6amXDQAKDvB5Sk
 ELf+v1aYsViuT7kYoA5bkrMmb3W0dXW/+/W/s+Hi553Gzcwsu2KwF0swxKt/IsbJ7mHiEwdgpO/
 GjLQ1tRByzdMe31QlVQ9sp5DEkIX5jV3bRSY0gRRT6eXKqIfHicdWMA+kQwfNESZ7DVAE5s2WfA
 oXt02zrr4xK/NCHeDQOKSXSWfH4b8RSkAwlXyAELwcE7HFYys7bIDCBGS42kOzZV2OtZ3o4yMWF
 NVy2lAFlAEcuv1pSWg5QmREJRklkJLlIZPFU3oHb79cocxz8GdN3ARtJ8AKrcDjh4A7tmZf9F2D
 wXlo7fWBFpGUYuFetkc6/0sVCLqN8aEWVti9sdhEozAwdrx8ThlZjXXaNDUr3hpvEZATOZsOy3G
 rqHI+JUPTlM+agFJfkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX6H/zFhL2UiCm
 5BYxY91TbNKOu5hROjRbQ+ky7G0+PdzziN/wyK1Pms4ebycGTbvsUxhd6ZUSUXc/J0JnbvVA0Q/
 C9lDje1Jv8MZLo9Xl9xXa/+w0TLqAlA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_052651_514409_99E1D8F1 
X-CRM114-Status: GOOD (  14.74  )
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

Commit c256a94d1b1b ("wifi: ath10k: shutdown driver when
hardware is unreliable") added a fail-count based transition
to ATH10K_STATE_WEDGED after repeated recovery failures.

When recovery starts, ath10k_core_restart() sets
ATH10K_FLAG_CRASH_FLUSH and wakes waiters already blocked at
the time the failure is detected. However, additional waits
may be created later while the recovery attempt is still in
progress.

If recovery ultimately fails and the device transitions to
ATH10K_STATE_WEDGED, those later waiters continue sleeping
until their individual timeouts expire even though no further
progress is possible.

On suspend/resume, these extra wait timeouts consume watchdog
budget. Crash logs show cases where one or two such timeouts
are enough to cause the suspend watchdog to fire before the
driver finishes shutting down.

Apply the same CRASH_FLUSH, queue-stop and waiter wakeup
handling when entering ATH10K_STATE_WEDGED so blocked callers
fail immediately once the driver gives up.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1

Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 43 +++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index ad087e64db9f..be516dc32c1d 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2491,6 +2491,32 @@ static int ath10k_init_hw_params(struct ath10k *ar)
 	return 0;
 }
 
+static void ath10k_core_wake_all_waiters(struct ath10k *ar)
+{
+	complete(&ar->scan.started);
+	complete(&ar->scan.completed);
+	complete(&ar->scan.on_channel);
+	complete(&ar->offchan_tx_completed);
+	complete(&ar->install_key_done);
+	complete(&ar->vdev_setup_done);
+	complete(&ar->vdev_delete_done);
+	complete(&ar->thermal.wmi_sync);
+	complete(&ar->bss_survey_done);
+	wake_up(&ar->htt.empty_tx_wq);
+	wake_up(&ar->wmi.tx_credits_wq);
+	wake_up(&ar->peer_mapping_wq);
+}
+
+static void ath10k_core_enter_wedged(struct ath10k *ar)
+{
+	ar->state = ATH10K_STATE_WEDGED;
+
+	set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
+
+	ieee80211_stop_queues(ar->hw);
+	ath10k_core_wake_all_waiters(ar);
+}
+
 static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
 	struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
@@ -2516,7 +2542,7 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 	if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
 		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
 			   fail_count);
-		ar->state = ATH10K_STATE_WEDGED;
+		ath10k_core_enter_wedged(ar);
 	}
 }
 
@@ -2591,18 +2617,7 @@ static void ath10k_core_restart(struct work_struct *work)
 
 	ieee80211_stop_queues(ar->hw);
 	ath10k_drain_tx(ar);
-	complete(&ar->scan.started);
-	complete(&ar->scan.completed);
-	complete(&ar->scan.on_channel);
-	complete(&ar->offchan_tx_completed);
-	complete(&ar->install_key_done);
-	complete(&ar->vdev_setup_done);
-	complete(&ar->vdev_delete_done);
-	complete(&ar->thermal.wmi_sync);
-	complete(&ar->bss_survey_done);
-	wake_up(&ar->htt.empty_tx_wq);
-	wake_up(&ar->wmi.tx_credits_wq);
-	wake_up(&ar->peer_mapping_wq);
+	ath10k_core_wake_all_waiters(ar);
 
 	/* TODO: We can have one instance of cancelling coverage_class_work by
 	 * moving it to ath10k_halt(), so that both stop() and restart() would
@@ -2630,7 +2645,7 @@ static void ath10k_core_restart(struct work_struct *work)
 		/* hw restart might be requested from multiple places */
 		break;
 	case ATH10K_STATE_RESTARTED:
-		ar->state = ATH10K_STATE_WEDGED;
+		ath10k_core_enter_wedged(ar);
 		fallthrough;
 	case ATH10K_STATE_WEDGED:
 		ath10k_warn(ar, "device is wedged, will not restart\n");

-- 
2.34.1


