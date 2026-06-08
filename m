Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA0CCD8C92
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 13:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MhPM3ubSNccRdzcMhDmRMMZnm9xv5JTl3e9WCBzFp8=; b=mWP6/5Ha8XxtmTsE2PJ5kaGY3V
	JKGQBymKcI9j03myyNLSJ93Dpn3Di/qC6t44sTjZ86H+sCZeiP2zRVVm30qMrYsHE3hku32o75MtZ
	bV8Ym878UQmbkc7LyURnUcNIvbDKQ0A1QkOYl4DiIxGT2ICYn6+ApzTug0UZgVr7lHKBif1ml/gWh
	ZOYSUWUv2IKH1ozylME0djm2crJ1E6L/uwOtGSDAwTrU5QsvMCRb6YP1zxYQW8Mgl19vSZ33/1qBI
	qBxKzCuetNQXhpav+S2v7Wqwd2RomQurFzrkfe8YMFdk9W5EFIgTIcHsCgYIyRV4r9LFTvLBFYbAI
	H4bbLC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZgM-00000003Zc1-2kzh;
	Mon, 08 Jun 2026 13:06:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZgJ-00000003ZXJ-1E6Z
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 13:06:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9j0v2919921
	for <ath10k@lists.infradead.org>; Mon, 8 Jun 2026 13:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MhPM3ubSNccRdzcMhDmRMMZnm9xv5JTl3e9WCBzFp8=; b=C5EoX5RUXXJK7u6m
	RRyvcZsl6REfWKwaP9rD1ripgKNHPTpLRNORBrWJuhKlrT2DrFdYvoZrn//g6SvY
	YeAewgMrWVDXbaa6EXNfSl/zZo7ZCWZQNUuRg2muFFKayJEO0Of5w0EzUbmGQYPQ
	xKRh2/KPRhF6eR2k77i72/YhFhZP3r3ybx0vIVWDcTDdtIZYwT8kGmsWqtUOs9sU
	8T4j+e/KTTOio03E1FPzK2g58NVvoF/DUABfLOfom0uNkL0UNisitJrYkhbKcvdu
	ij3QgcgOoWx23/AF6feBtTTYRcvt8gGjSaHWedtSbShaeo8f1M/pi6OcucmsCP3F
	i6m0uA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgyq99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 13:06:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304dd917645so4098078eec.1
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 06:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780923978; x=1781528778; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MhPM3ubSNccRdzcMhDmRMMZnm9xv5JTl3e9WCBzFp8=;
        b=ax+bld/YEqob18qwsd/2Didt2d4+OXwTW1SgabIEkg9TQNyAUrgmFpwDQiP9Aqj0uA
         /krQd8mKpzC//2I7SU225eMNtvuvJdreXaINPb9suCScmnTyK95NiGJjFO7vnpO4no3K
         YwgAnDx4IF3WdZ2HGuGnixdxSXCuhQeJl4tDws5s+uMzM5VgLVvQsVHtTimZH4a1Po92
         pTtCqPBDcThP8OaXj7v/Ie0lPAckujIqa/P+TAWQElBwBf3izY0an8NY/IVgzjKROC3r
         RQaJCehPLWFosLxHU0WnyWHABGlRYXjLgTvrkHqSwJ3pm7PSxKGc0YqNheJ4Y4ah/yN8
         n44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780923978; x=1781528778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4MhPM3ubSNccRdzcMhDmRMMZnm9xv5JTl3e9WCBzFp8=;
        b=OYTwTbeYf+5K8PLPwFR6J0k7doaNxnkjjntJZZHgzaUFf8eNngJ+FmWzFcGTx0kK5l
         l7qR5mUmxgOmuPwmf6tiZNeApxg0yI9E9S7UE9Exg79O5yA34BpoJSxUvxZZauLZbUlT
         MMOP2dmYj0uj/wVdwH1VD27w7NZ+IcLKazlnPNwb4Y1qB8dDU7/QU0HRLoe8c1SnePL6
         iQKWj3xbSL7VlUJSFCevgYXjlmsKtXWpQHWEBOV7FSr/NyA5TZzg+RxXwEr7kGBYrkYB
         PwcRO5kBdgys9/hjtiG+5S7ezWmoz+EeR2mq86qTjvOKBziAJBZmiu1hH4c93T05VpFc
         L6uw==
X-Forwarded-Encrypted: i=1; AFNElJ/sQ8Ho7/WK5nDgJqLZrfwzfbCK1A8ekV4YBrUTExeCB0c5OfG8GxAoJqSBJIffyn5Z0cTNL8g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtcyFet9ZZn/TXLmcpBGzy1KHndTDvPVRdbsKgtFOx04IJ3xaQ
	VqdS0rZ8XMQxWvVdVhVX8m6WYIOfF7M1kx/yFi8xU4EDJsIQ2Dw8pteaTK3pUouF1bWGBuRN2zp
	zg9922JF77OeVlm9Wn9E78oriWC4YO8ZJTYNmQgWG4UdOPJ+7tRxpMpUQobr3gBsj
X-Gm-Gg: Acq92OEYDWFUj2ymm5gDtZkZk49RX3yJj7nExNYA8OWXXZO5PV7VurMF3fdXrTqOlLH
	W+n6tDZxxyi0fvEe4XOkOtuu3TsLcg0T7uaqt+88+63RgXq94XLCMc8fo4nH84+tdygI4/Ccjo5
	EIkxi6M9ae1Vk3wuzPyQuVs10PXfiqiJymT+3wrFGHrGbK8H8t1oqtfPRmD2+dwGEcg8LH1uu4I
	swFcEfkNbyjFBFYp0thlATnuqyUtaGd6eByryg7DQOjfygv3vct6axVoV0fX7ol1S7EqIHZkUiH
	phJ5S9r2oILupY/J48jcV9C2I3IWpqnU6nRDt6okAGGUoCK0DwFMl5YbZUlbCpIwQe1MowryOmv
	R2QayyBmkNdYcnHPco3C8IiiKPmjbJctQjWx3/pKtN+bVb62FvVootHDUs3LK6I5F8V5guQ9kWe
	bes4186MgbeSk=
X-Received: by 2002:a05:7300:8190:b0:2ef:8b72:1b9 with SMTP id 5a478bee46e88-3077abcee73mr8816024eec.0.1780923977646;
        Mon, 08 Jun 2026 06:06:17 -0700 (PDT)
X-Received: by 2002:a05:7300:8190:b0:2ef:8b72:1b9 with SMTP id 5a478bee46e88-3077abcee73mr8815986eec.0.1780923976847;
        Mon, 08 Jun 2026 06:06:16 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dba9d43sm15666701eec.10.2026.06.08.06.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:06:14 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 06:06:08 -0700
Subject: [PATCH ath-next 3/3] wifi: ath10k: Update Qualcomm copyrights
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-ath12k-copyright-v1-3-e1a71f92d447@oss.qualcomm.com>
References: <20260608-ath12k-copyright-v1-0-e1a71f92d447@oss.qualcomm.com>
In-Reply-To: <20260608-ath12k-copyright-v1-0-e1a71f92d447@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a26be4a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=eysLYOW-m-FfG_z2xPkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Yl6bpW6rObdQiIcvIT7TQdiZ6Jim079H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNCBTYWx0ZWRfX8x2UZaFRpluH
 zLmpalgwEuGTwVG7OqPJ9JyOVssBoLAlntioeC24yp9hqmS4b26yjZRjD635T1WdDCrbXo+eeT5
 fpofwSO0a0iKXyAoT/3Zfei7FR58uFvw2GksRMetxbbGDLo06LnanaXVvoJMwQntdH5RdyGZTFf
 veQMFzqokGZwcqZRFKamY45n0Fdmz0vUYlNPIopH4XbSIJ1WJpMElqv8djaQcUnG6r7IFCHpX7d
 F54i+po4WnAK8oTK1E4ElXWYOEyAvI1r+7zLvt4Alrlg16c4FjamKYgG7i/1h/JN0hhmHvbuap/
 R8s296Qs3PF2AcR3ESVI8eLNbF9g2WiealOTDgtL+U5ftu5aI/pymNIQIBPW7md2ZAN5qgnKKDi
 Fvy47tcr7r270ZKNT7F60SY5OiKP2KalBlHvdm+EKMEkxS5oGkxwWD8J5EL3QpR2hIgxqH1Y1ET
 0Vq1/5WcGdfCQclGDHg==
X-Proofpoint-ORIG-GUID: Yl6bpW6rObdQiIcvIT7TQdiZ6Jim079H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_060619_357722_94238A1D 
X-CRM114-Status: GOOD (  12.63  )
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


