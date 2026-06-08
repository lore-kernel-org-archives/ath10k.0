Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7886CD8C92
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 13:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MhPM3ubSNccRdzcMhDmRMMZnm9xv5JTl3e9WCBzFp8=; b=SoKrHjev53cv3Q5EaRyOqNXx1u
	Aj8tdyk5/OTQ/gAg6KvWmPAzk0/kSZ+ISpvNMc82v5WqmRTWZbmrUwLZ59bk45gKjkyEI11ZKqUL6
	CW78ZhKbx1XiG06M1GWK9gcHKBq7XIyCkxj4xAsrCncN2nxpgunX2fCe7A+Kb/rqGl8/IJFc+z5xC
	koCo67j65R4ohctIC/nqshKgnE4ThZXMU42o0qA4IR+LUVoVil7q7fXjF3Xn1qjJ3LJxSfn4a3ZPu
	/wi10jKGhC2XZWnrOnr6LnN57yKRxhDRuE49EWJocmwksEsXrxWzBpkoVnOpbMF1UaJj9z4vBgFAf
	44AtlM6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZvV-00000003buH-3ynI;
	Mon, 08 Jun 2026 13:22:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZvS-00000003boE-2ShE
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 13:22:01 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9KvD3037912
	for <ath10k@lists.infradead.org>; Mon, 8 Jun 2026 13:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MhPM3ubSNccRdzcMhDmRMMZnm9xv5JTl3e9WCBzFp8=; b=dJ73VVEF8u3u6yrl
	2hxEoLrdMbk0CVx/HNqak8t1t7NRBVCu39o26Jsfap4tJLvgodFR9FGWDL65AK+g
	J+pYxKU3L1+gUlCkP1ILUYFhH1oXvkOEa4liEXqJtmUDhHaN6qvHOA+2kV5OYmw8
	Pf3JC/U+FuudCILAHRzRnBlMVSaSl79223CBSFjMVpg6OfVvgaob40LL6Wb5nUil
	Lh6LE3sC8n1adUmARFbHeJj4ZpoAo7lGCQDGwWXcvTfNSV+fVfB9aguL56GSvcHx
	TeHANNMNAUyV+b6m5xIWBOJFPcD32ExA0MgflaJD/ktjDtCS/tqdxcMQLpswAZjx
	eb3gaQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envaj8m7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 13:21:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30761ab3483so9520517eec.0
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 06:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780924917; x=1781529717; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MhPM3ubSNccRdzcMhDmRMMZnm9xv5JTl3e9WCBzFp8=;
        b=OmiA0NQQzJ+4ovyLgHBAnM6i6T896M0uCzeh5CeZPeXm4TuYpDt8LQADeA6gL2xtaB
         UPaof5f1EGzUYOizL0L5MmM55pWZIzxAzXtHwG4degCSiVgs7s4lbw/3jOumL3lWVP0v
         VTwLIeAIg3/a4DdvWqWXNpiblaJQd0BUWKe61QOx4M+3X9yFyA0jk+gyUM4WcHO2lpC0
         JD6/rxc2P69IVVqr9dezaYY+GcG/MwJpUiLqNgjYUV6kF4v7EtwrjtbBWrO2SmgMjhOD
         I6K3ZLDl+JGum0po9Yiatc0dcenzXsy6itiDyupbhQUZuXIznlUP3WQ/lXfCwemq93eR
         Nuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924917; x=1781529717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4MhPM3ubSNccRdzcMhDmRMMZnm9xv5JTl3e9WCBzFp8=;
        b=Wsb1XRYJGggQI3oxHomdLhuW1WLB1Udp5N86a5IhSKbFKr9KJW4iKy2zUzDppvVXof
         rPyUplSXMI3kkkvKKTMr0MdVvum1Vurx1cCMT94lloJt2BwitpTwch/PL4YlXCohKidL
         DKK5GU5Hyw6k5WIMAgbtsyfSA/GcbA+ypihKhzsJNWZ3vTHI/dCWenRdtD1KPA4vduWF
         mc6v0/7JasJUZcAVqYBDVxIO9liGQ0pKt7NVnutrOyGcgSePeK6I3cUtkhDQOyY5cCrL
         fS5WneF4ZC2MKVBdW8+wQ1uIgA3pV80ddz/cDK+YA312P5vt29bhSD2DX8ggc5GyOZrb
         n+MA==
X-Forwarded-Encrypted: i=1; AFNElJ/+sywGlHLgxcZqbCJ3vrLj6I3O8dPRIri9VDToolFHLrh/JyG0tTLP1NwgnHa5qxOvqwFX1ZI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Hj9rIiszLj+aEJ37WUQbaTEAcV4wrNFT4LjATC1jBvy3LWqP
	0OoN/RIUXvWM0H8XFCViPbxCFkIpXTkRjTg5zXNBiotq3GvhCWCDqVciN+rpqNA9jy2vhdvs+KI
	ZZa1CBoag9nB6jsYEmmYOS+P1VTc8YNEFOjiuDbrs9uebGS/Lmam19FdUbOzjKs2t
X-Gm-Gg: Acq92OF76iqHrYgvLYtA+cOrYwZqO0bmy3ZwvrsSvBCej9XR6XQ2xWeUJFEXwQI7YLK
	vmz6c97RkAXwrQve6LWshPOQcFwpixtzc0jx13s0Nnt99jI5g/eWZB+O13CfNof1eug4SyIT023
	cpzi3g7rmLZg1cZGKXLKBxu1vLrM0aGewppKZrKBRoEphQFwQ1JOlZ+p1752ZjUDzGgLw0OaPZk
	Fd78HMqklkkh2zNQY/2YyWll1sJqwgO08lFj5C+Ds3ka24olzKVKHSQkyh3GQLoRaBPOdFrLzFq
	e7vTgRYCnBhwbGxtxZeIzFlXqElWLmjlDQ2clTpsB89WdGsHjNZzMUHGtTlXYlSFok0KP/nVvds
	dAe6d38z8k0bsGpQg+sLnV4dqgJHb64B5KsrHR1sXh55mi5khG9xSSr4iv4ni9BQWYqvJEpEghZ
	YpMXZLXGlnoVs=
X-Received: by 2002:a05:7301:100a:b0:2c5:b972:b436 with SMTP id 5a478bee46e88-3077b5eab1emr7150000eec.23.1780924917240;
        Mon, 08 Jun 2026 06:21:57 -0700 (PDT)
X-Received: by 2002:a05:7301:100a:b0:2c5:b972:b436 with SMTP id 5a478bee46e88-3077b5eab1emr7149967eec.23.1780924916510;
        Mon, 08 Jun 2026 06:21:56 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcbe995sm21607280eec.13.2026.06.08.06.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:21:55 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 06:21:34 -0700
Subject: [PATCH ath-next v2 3/4] wifi: ath10k: Update Qualcomm copyrights
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-ath12k-copyright-v2-3-37504d70b03c@oss.qualcomm.com>
References: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
In-Reply-To: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ln_21iAgpuu5ygWjDu7dtBf1m3Bux0Ue
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a26c1f6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=eysLYOW-m-FfG_z2xPkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: ln_21iAgpuu5ygWjDu7dtBf1m3Bux0Ue
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNiBTYWx0ZWRfX5Vz0cmgCxKri
 J/sX+DAzOQnBL2s3NAmz5bwKLlExYmHF64+xUdvRjy3PDmYptt2TVZw6NH8yqRJyFJgWXwrEwiF
 gZg6NF6qhe2hk7eW3OM8n2gQOE4G87TSz65PETaa04WGmzotdn86peuybcj1+uMXBhGJ/a+sNfV
 JCn3+OX/Z9amYHonHZ02y+IlbNLdACZAtnwpMthLqZm3Vf9a+fiBLNlLmDltHemm/J7bMODRFqn
 0EmtSEBJOoMyCJfG2hllUToEEiFgZ/KoozwvlcXtNbZxJg63N07vyaQYzgP/X/SrItn3gyD/qkb
 ELzFU6oyZdf0pOZsman/bMiht0E8REegMzu5S6Fbe3iMpOZnEtHBJ6Cw2yn2hi6I8n9bogD5Vzo
 kM/9bQHhOJT7w5+UjhfzzdjZQUeljxGZbqn5miur80MOufh5alJ/FDSebWQy4tlTB47BRYbj9qm
 eIC8JuauFYd4pHLZg4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_062158_644470_B6BE5E41 
X-CRM114-Status: GOOD (  12.15  )
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

Update Qualcomm copyrights per current legal guidance.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/bmi.c          | 1 -
 drivers/net/wireless/ath/ath10k/ce.c           | 1 -
 drivers/net/wireless/ath/ath10k/coredump.c     | 1 -
 drivers/net/wireless/ath/ath10k/coredump.h     | 2 +-
 drivers/net/wireless/ath/ath10k/debug.c        | 1 -
 drivers/net/wireless/ath/ath10k/debugfs_sta.c  | 1 -
 drivers/net/wireless/ath/ath10k/htc.c          | 1 -
 drivers/net/wireless/ath/ath10k/htt.c          | 2 +-
 drivers/net/wireless/ath/ath10k/htt.h          | 2 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c       | 1 -
 drivers/net/wireless/ath/ath10k/htt_tx.c       | 1 -
 drivers/net/wireless/ath/ath10k/hw.c           | 2 +-
 drivers/net/wireless/ath/ath10k/hw.h           | 2 +-
 drivers/net/wireless/ath/ath10k/pci.c          | 1 -
 drivers/net/wireless/ath/ath10k/pci.h          | 2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c | 2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h | 2 +-
 drivers/net/wireless/ath/ath10k/rx_desc.h      | 2 +-
 drivers/net/wireless/ath/ath10k/sdio.c         | 2 +-
 drivers/net/wireless/ath/ath10k/thermal.c      | 2 +-
 drivers/net/wireless/ath/ath10k/usb.h          | 2 +-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h      | 2 +-
 drivers/net/wireless/ath/ath10k/wow.c          | 2 +-
 23 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/bmi.c b/drivers/net/wireless/ath/ath10k/bmi.c
index 52118867ecde..e4c84be44ba6 100644
--- a/drivers/net/wireless/ath/ath10k/bmi.c
+++ b/drivers/net/wireless/ath/ath10k/bmi.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2014,2016-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index a9cbe955e084..5a796e704ae9 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/coredump.c b/drivers/net/wireless/ath/ath10k/coredump.c
index 50d0c4213ecf..7fdc06fff79f 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.c
+++ b/drivers/net/wireless/ath/ath10k/coredump.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/coredump.h b/drivers/net/wireless/ath/ath10k/coredump.h
index 8d274e0f374b..95ee70d23370 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.h
+++ b/drivers/net/wireless/ath/ath10k/coredump.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: ISC */
 /*
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _COREDUMP_H_
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index b7520220465a..fb61e53ff4c3 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
index b9fb192e0b48..7f7be7c69232 100644
--- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2014-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index ce9b248c12dc..821a12090ba9 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/htt.c b/drivers/net/wireless/ath/ath10k/htt.c
index dbaf262cd7c1..1c2e137b6002 100644
--- a/drivers/net/wireless/ath/ath10k/htt.c
+++ b/drivers/net/wireless/ath/ath10k/htt.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/slab.h>
diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 603f6de62b0a..25c6b2e2f81c 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -3,7 +3,7 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021, 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _HTT_H_
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 25ab945fecef..faac359aa9ac 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 29e99fbf36fd..e46f579d745d 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index 59b6cebfdd8f..6f5019bf0b7d 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: ISC
 /*
  * Copyright (c) 2014-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/types.h>
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index da71dce9babf..cd468b24bd33 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -3,7 +3,7 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _HW_H_
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 97b49bf4ad80..335bc7c488e4 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index 4c3f536f2ea1..d114778edb41 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _PCI_H_
diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
index 0e85c75d2278..279aeb2a7dbc 100644
--- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
+++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: ISC
 /*
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/soc/qcom/qmi.h>
diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
index 88d58f78989d..8d4b929e8437 100644
--- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
+++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: ISC */
 /*
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef WCN3990_QMI_SVC_V01_H
diff --git a/drivers/net/wireless/ath/ath10k/rx_desc.h b/drivers/net/wireless/ath/ath10k/rx_desc.h
index 564293df1e9a..e6d92a29d2a0 100644
--- a/drivers/net/wireless/ath/ath10k/rx_desc.h
+++ b/drivers/net/wireless/ath/ath10k/rx_desc.h
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _RX_DESC_H_
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 43a6b1ba8fb8..65e941b52751 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -3,7 +3,7 @@
  * Copyright (c) 2004-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2012,2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2016-2017 Erik Stromdahl <erik.stromdahl@gmail.com>
- * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/module.h>
diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 8b15ec07b107..9bb486f8e920 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: ISC
 /*
  * Copyright (c) 2014-2015 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/device.h>
diff --git a/drivers/net/wireless/ath/ath10k/usb.h b/drivers/net/wireless/ath/ath10k/usb.h
index 7e4cfbb673c9..517afbd73764 100644
--- a/drivers/net/wireless/ath/ath10k/usb.h
+++ b/drivers/net/wireless/ath/ath10k/usb.h
@@ -3,7 +3,7 @@
  * Copyright (c) 2004-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2012 Qualcomm Atheros, Inc.
  * Copyright (c) 2016-2017 Erik Stromdahl <erik.stromdahl@gmail.com>
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _USB_H_
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index 8a2f87d0a3a3..ea18ed8939db 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -3,7 +3,7 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #ifndef _WMI_TLV_H
 #define _WMI_TLV_H
diff --git a/drivers/net/wireless/ath/ath10k/wow.c b/drivers/net/wireless/ath/ath10k/wow.c
index 78653f257925..92af8bc63362 100644
--- a/drivers/net/wireless/ath/ath10k/wow.c
+++ b/drivers/net/wireless/ath/ath10k/wow.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2015-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "mac.h"

-- 
2.43.0


