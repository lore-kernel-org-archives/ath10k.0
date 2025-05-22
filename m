Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D93C54E90
	for <ath10k@archiver.kernel.org>; Thu, 22 May 2025 12:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uyNt/sGsuh4XmreLRg9Ey2fKbNrRvAZ0N+H8+xGYyLM=; b=XAn7rGbuT/rlMZ7D2G7oW46+N6
	53IOxVJAV7FAu1OR+TpG8+VpOFllfwLIzPeg8tTi2zoNxIm9YE6ffBjLhtChgTtv3YrXQK++7A555
	TOTOC746PVW+nE5fxcJRzHKnuyKxhlbofMA6BjY1mM7rXNisk300e8EN5+wMOydnq2jXIoLomJRSw
	wH4bcl5k/EUb+ZLhAtv699MrUTlh4lUD1GVfILKV/sGNClpVaI8GGAZZ1drQALn9WFA0MUYwZQQIj
	7CJpqzmvgfXaJY9ijocZ+YUEgb0hh5xwIogY7V9rSD3nPJXMGreHiNIQnKxnkeE3LfY/KcGaMVoKT
	I9IKzQEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI4kN-00000000xcH-47Jy;
	Thu, 22 May 2025 12:10:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI4kL-00000000xaE-0hvq
	for ath10k@lists.infradead.org;
	Thu, 22 May 2025 12:10:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7ra5U016660
	for <ath10k@lists.infradead.org>; Thu, 22 May 2025 12:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uyNt/sGsuh4XmreLRg9Ey2fKbNrRvAZ0N+H
	8+xGYyLM=; b=XsXq3n1crRGCcoXxLKR69OsEkQqaPb7J9rItUxkG7jW48iq5fOF
	UMG3HjOzSFiBkNhkcior+hfhAUmQ4xpjV3dg7UQUxFguFjiP7+x2637soAqR28vS
	Z6PLwgD6nohn/0siJIz5lHPlvo0Wv1r9ipsKuPY16kasLEJqfKe/bmKyKSfBWSsq
	Ywjekhpy6YvG5Jq4FnoGRso3NnWuDWkG0syNhgW1yjnAU09XrK5Uoq5+4ZwPydXS
	jhkjGXhX9puE7EhAkZnoDAntAmZhYV2t4yLr22Z23UqF/CxjCfKL0v8LcWXEdQW1
	UnH6Wcj89dqaKWLYBCK7vZGPp/eKB8DJoaA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9x856-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 22 May 2025 12:09:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4769a1db721so185045751cf.3
        for <ath10k@lists.infradead.org>; Thu, 22 May 2025 05:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747915798; x=1748520598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyNt/sGsuh4XmreLRg9Ey2fKbNrRvAZ0N+H8+xGYyLM=;
        b=LkM63HTuUNxV3qZwpMMd2SyAiRTNEDb48Ep6mpBQdqx15cr5BGteysDPK4g1/E51RC
         e7vB2V2NyrTREUEfqrFahNW+LK8/qLlVnBZEC0tXgAVFq7A03JKB+Wb9IU/Amu3WCCOV
         53+Bpvmzv0Ri3ueW62O5eSE74cvenBx6BT2QShi1c5BAuWp//41FMbYXjsTTfQ0impHU
         QR2sLzX2fgH5i3wmnZMijR6v9JodWQn4QZFZ4p2pe67QS0teRMeCRC0DoTHyjmkhAUgQ
         Lrq2pkB+LW6E/cq3QRvH9PNNUo3N9K70YSL7VQylj41a3odnoMDnqAgJwlC5e3gMwydG
         Javg==
X-Forwarded-Encrypted: i=1; AJvYcCVticQ34uWJ9gxCvoggE763S8zm6ShgNRD841g70N38sqVoySU5cXkhVpHXhaud/JSOLrweLWQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf1CXiWl0DlFpelCc6XqmN8NzzJPLyk+5IQZY+h5r1moQeAMwd
	/0YGBWTJVtD8xOjX5KxOF60+jD6wuLpG+Ahb0MoI9SXA3I6mk19ZGapqr0DLWFO2Md/ZfYeMio8
	JFxoGH0ZZiH6g0c2jxnW978Pj8d6PjXpBTv56xCzqNhSTgRRBeIDXFeQ8CuL1OPO9
X-Gm-Gg: ASbGnctTj0gvnsFo5vx6MV9F5AQJgECNh3+BCDPYZYA5QYzU0+Sv64OX2Lgx+o66Fyl
	6x5hyS+F4uQvDczExIog0Nh6mBLP1sagQJ9kR+Lb+VJFpqpOJwH6lT3/q7/7Ra0ySFP2ml5kuPv
	FsQnHU90iAAM4lycyHb6/xDkMxz4N44TRavwTFiCsRHpm5oJepsRb/QeaUWnwnO/LhbTICrEimZ
	cndFYQlGu+VI5lMetGQnUREAVXYu9LAqCyTL/et5jlBteMKuf6bS7AI6r5sdGV8jlBXQmlXyJWo
	yczOgNdJzl8UpNwcdTS09YrpGQHfxtjnJ61gtc4/vK3xEos=
X-Received: by 2002:a05:622a:4d99:b0:474:e75e:fccc with SMTP id d75a77b69052e-494b09365fcmr402457771cf.35.1747915797960;
        Thu, 22 May 2025 05:09:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAn3tchLVOZhxfq6SRKcs3/R+CiOHJ02G89e2dun7MvAPb41vaKHUcUKztCzIq8nhPcsDS5A==
X-Received: by 2002:a05:622a:4d99:b0:474:e75e:fccc with SMTP id d75a77b69052e-494b09365fcmr402457301cf.35.1747915797488;
        Thu, 22 May 2025 05:09:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:e5bc:5c94:e4b3:3c4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a36a83b63bsm17102665f8f.97.2025.05.22.05.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:09:56 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: kvalo@kernel.org, quic_svishnoi@quicinc.com, quic_pillair@quicinc.com,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] wifi: ath10k: Fix unbalanced IRQ enabling
Date: Thu, 22 May 2025 14:09:54 +0200
Message-Id: <20250522120954.605722-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682f1416 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=OyT9LloaJ-PC7jRUisgA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: reymRZVCmbIrtfaKHDSlK1S5i4iKbWS7
X-Proofpoint-GUID: reymRZVCmbIrtfaKHDSlK1S5i4iKbWS7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyMyBTYWx0ZWRfX8+Vqjg4f9ZlQ
 99TwV32SoZx8EUeqFdl2BhUIvn0r77dxoV02xkR9IFI/RxI165WQPdp+QNhJoRYnlFdfEDBg/NB
 ACT2k7tm/X0lh3mNA8M+PnEfe5LGfytjEMi8Lw415dT2OodKI3kIX3ZRRJmDumUqMzSUJEEKK2x
 xNU3Fv5Yy/MfSh8LrJz7SImN2Sx/4O0Wtr7V3djKVRXUHf4lmGev5fftt0te4uwFcz1bjXUXRvR
 fQnR51zVeDFLzIxJAYln+zY3HCDnJJGW6H5MWCUfj6UZyRTNTkLbLzrEVHzij46bYGNUdeopeGY
 g2yhiLtE/TnnJPyI6DPyCDGiKowXcvjQ/MZDCafO71QrX8vwyXaGBTs1WOqWXyoXBgLClfzQ8En
 KY/ffQsLfemQFPLar9PriACBXM3w7fG4W60xqQW2W6T2d9jHTIShIvqvqvCZ6L1HpTSIvYer
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=578 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_051001_325784_FDB0FF58 
X-CRM114-Status: GOOD (  13.41  )
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

When the firmware goes down, both RECOVERY and CRASH_FLUSH flags are set,
triggering a full recovery sequence once the firmware is back up. This
includes stopping and restarting the SNOC interface.

However, this sequence leads to an Unbalanced IRQ warning:

------------[ cut here ]------------
Unbalanced enable for IRQ 112
WARNING: CPU: 2 PID: 120 at kernel/irq/manage.c:792 __enable_irq+0x4c/0x7c
CPU: 2 UID: 0 PID: 120 Comm: kworker/2:4 Not tainted [...] #234 PREEMPT
Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
Workqueue: events_freezable ieee80211_restart_work
pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __enable_irq+0x4c/0x7c
lr : __enable_irq+0x4c/0x7c
sp : ffff800081b3bab0
[...]
Call trace:
 __enable_irq+0x4c/0x7c (P)
 enable_irq+0x48/0x9c
 ath10k_snoc_hif_start+0x6c/0x13c
 ath10k_core_start+0x360/0x1344
 ath10k_start+0x100/0x8fc
 drv_start+0x34/0x58
 ieee80211_reconfig+0xf4/0xfc0
 ieee80211_restart_work+0x110/0x17c
 process_one_work+0x150/0x294
 worker_thread+0x2dc/0x3dc
 kthread+0x130/0x204
 ret_from_fork+0x10/0x20
---

This can be reproduced by restarting rmtfs or triggering remoteproc restart
via sysfs.

The root cause is that IRQs are not disabled during SNOC stop in recovery
scenarios, but are unconditionally re-enabled during SNOC start, leading to
an imbalance.

Fix this by skipping IRQ re-enablement in `ath10k_snoc_hif_start()` if a
firmware recovery is in progress, restoring IRQ state symmetry.

Fixes: 0e622f67e041 ("ath10k: add support for WCN3990 firmware crash recovery")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 866bad2db334..e15e1ab30458 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -937,7 +937,8 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
 
 	dev_set_threaded(ar->napi_dev, true);
 	ath10k_core_napi_enable(ar);
-	ath10k_snoc_irq_enable(ar);
+	if (!test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags))
+		ath10k_snoc_irq_enable(ar);
 	ath10k_snoc_rx_post(ar);
 
 	clear_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags);
-- 
2.34.1


