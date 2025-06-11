Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0B9C71136
	for <ath10k@archiver.kernel.org>; Wed, 11 Jun 2025 21:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vC+xxtvYYgCeXhh6pwXkgGaTGJbI1B8K+txHJMCvu4E=; b=bztCttLAaHAXmIN3ZEvYpvpLUz
	qbDXvI5DdG3bE89h9/WVrk25VTmW6JHcyBdI8xwnQIbMGYIA9AEGlTLF3Gt9GJqqt0vGQj1MgEEBd
	ai1SeUOKnE5oav6K1fUWCq3PpaSeZujmAsCY+d01iQTo42Qk9l61oKDxejzKUbCIkCUf30xhbNNXH
	ytUUKSiVAilksEnCRY+PGOBVzY0QyTWom06CxzjjkX0GvIubB3PztewqphPiFiO8KC2l51jyprsbU
	U86QMKmuJPrFzZQot6P6ubRPVTx2F5IqxyPtlRcPdSpSnppt0KVZtIaDpDfnv3H9JNxARKv/64YYk
	uNIQ2bXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSo7-0000000BGIm-245z;
	Wed, 11 Jun 2025 21:16:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5V-0000000AZ9U-1nOo
	for ath10k@lists.infradead.org;
	Wed, 11 Jun 2025 16:14:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DGnj029304
	for <ath10k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vC+xxtvYYgCeXhh6pwXkgGaTGJbI1B8K+txHJMCvu4E=; b=MNWD3ah3YQDWEqvJ
	g/y1aZc0m4DzG1wwg+tA1HD1kZvPtHSnX/4EkVKTjGcEYKWsaR4km4jab9ADHva6
	R4O9M6YroUyY1gDcs+DGw8Yd2td2kxA4xORKUJ4WKN3w7KnjGUo9hvSevVi5NVzK
	mcWIDbPGElQw6bDSp6u2U+75/2gugHw+rIVnBPCrJec/u1eOB9V6TzF4TjvBPXc0
	RjF2Bw2u8Lkx6VwXimsvmrEzzKJfcwZat/UKzLEOcf+Id4QZzOt6lNxFcrYnE8DD
	spfarTr+Sw7fPdoOHLkIhOsYtIZ/A+/BL7Txcy74OuO5YyS5nCEBiqeZ+0VoJB5k
	XEj4uQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6djcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:05 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7370e73f690so41727b3a.3
        for <ath10k@lists.infradead.org>; Wed, 11 Jun 2025 09:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658444; x=1750263244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vC+xxtvYYgCeXhh6pwXkgGaTGJbI1B8K+txHJMCvu4E=;
        b=sRc+UCONlob9reVSLmt55UCJ4xj8jdgSvZX8dwy+a/X9LGDXw8yIFMLm/yff7W8EMS
         cEypq3butcahpkn2zMlthV3YayonED3FdvEWySqchsCf3jjsFATlJWpTwH2IhHQsrLDS
         71SPpIW8sZMbvWafB5hnerlC+ZL3GxyjYYmlq9Z9DEdWoXbhBsls2CzAELT7ecBtI8Kn
         DHkWK12gWWpk9I8TYrnqqGMVX47tCkNPkJQPon0zpgftwRIy/Z0s+GAyG057x4R1hSxc
         9ZtUhrljSb6/+3/jiLC50wkYHjSUfy6KPBRpkhyMAnLq284ToAW2aeSYiXKfAn+PV6jP
         zlRw==
X-Forwarded-Encrypted: i=1; AJvYcCV7TUcg2UrhSISokx4vr+gGnqvReqqgCYTq4v9BjX/TPAKIGX9JhN9Dtz3xfQndqi1gRXzmZz0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqNw/Jsp8hNcRh4wvj1H65l6ab5ryO4VTG1YSqx2subL39wMq3
	lCzmud1yo9/IvIE8Dt+lc9LJvGH10vwy6xUrkjHILCiL09//5+paWKYPLGFxa5sLH/iHIJitPf4
	OTKUYckxUED4U/eCM7ans0OT5De4AiD6vcAAxEWcCBLmMdRqH2kllfb7Kb5TgJEGjt4sdAd96
X-Gm-Gg: ASbGnctSg9aQDTABcq+momPqViUh2Ryh5G6WCTwzSdHNM+ssCG2EimHYo1/rKx1siZT
	mio+DkEnYeXl3TA1v1nPMO+eLTJgTmiZhbJ2gsKzYU1g3VnKSOzddGjv90XuhcEprs2vWJTDTH9
	vMraVnjBoAW8c5t7hHeyI9MspHrqsOnU6L//SEDaCurTx6HoXjexe7axTqaHWHavv/7TCMueWX7
	MPrxz67k9Syn5fDzdnU2HXkMF6CuTSC9sgVfC4+rF82pjM97r/AhCny+QcUEGadAwXTuCvTRces
	3SNKdq8/Cs4D//5AkPjzzxLEHqyacnbfNkYCO0tkaRIyIrQP7GLs9xrsP1o=
X-Received: by 2002:a05:6a21:7002:b0:21c:faa4:9abb with SMTP id adf61e73a8af0-21f86725e41mr5990064637.20.1749658443798;
        Wed, 11 Jun 2025 09:14:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1AbsaLs+Qh4Et0Dv8tLq0lT4GI8TdVK+xPhvb4cHdeQO2njFhkxJ5Zk1PmTPCVdukje/UZw==
X-Received: by 2002:a05:6a21:7002:b0:21c:faa4:9abb with SMTP id adf61e73a8af0-21f86725e41mr5990014637.20.1749658443185;
        Wed, 11 Jun 2025 09:14:03 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482cdf1c41sm9443708b3a.149.2025.06.11.09.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:14:02 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 09:13:56 -0700
Subject: [PATCH ath-next 3/5] wifi: ath10k: Add missing include of export.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-ath-unused-export-v1-3-c36819df7e7b@oss.qualcomm.com>
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzNiBTYWx0ZWRfX7VHVp3AAQQE3
 dunYg9oASMPAROwED8uzCg+F602PVtSWu0nga7U/Z4AiAgLA++iGnS+6PdRtpT9Ws+Tb7lf/EuE
 V8wvff+Ip3dcYqQW47uuvaefNUUDMeUfTm1ND33jmce98BRihXhOnxofDnjWU9PxRTD7AfZdRWD
 3ehJTjkDoXHbMNqLW/NN5B686wtK42HnkXKNqL65RL/ZdVjngUU6521DdgRV/rq1FJhHqGLAEWC
 SRxeygR6A+x/EVQR7fGqFGMm6jwSwFyNsEVAba8qMPy3mj/Yhgm8r+BgVS55750rm2DnRUiQhUR
 bWJrSz7eb2249UyDU8R9jb77YKk2e/ntZj4Euh6cEMYrHaUixABT9TOK9xD/2ZpAEY1MLB33FnB
 rX7S0q+bWAtCkiG3m/dbY5WjoiqEBoClf/dejKNc4oe9M9filL8LJk1N4z4yD9lEJG3n8pyw
X-Proofpoint-GUID: FHqLsl-lZxG83H5bjqUy4KZwARhawnTg
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=6849ab4d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=E42zS0385_rVDwRnvgkA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: FHqLsl-lZxG83H5bjqUy4KZwARhawnTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_091405_492187_A4AB4BE1 
X-CRM114-Status: GOOD (  14.09  )
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

Commit a934a57a42f6 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") introduced a new check that is producing
the following warnings:

drivers/net/wireless/ath/ath10k/bmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/ce.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/coredump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/htc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/htt_rx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/htt_tx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/mac.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Add the missing #include to satisfy the check.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/bmi.c      | 2 ++
 drivers/net/wireless/ath/ath10k/ce.c       | 2 ++
 drivers/net/wireless/ath/ath10k/core.c     | 2 ++
 drivers/net/wireless/ath/ath10k/coredump.c | 2 ++
 drivers/net/wireless/ath/ath10k/debug.c    | 2 ++
 drivers/net/wireless/ath/ath10k/htc.c      | 3 +++
 drivers/net/wireless/ath/ath10k/htt_rx.c   | 3 +++
 drivers/net/wireless/ath/ath10k/htt_tx.c   | 2 ++
 drivers/net/wireless/ath/ath10k/mac.c      | 1 +
 drivers/net/wireless/ath/ath10k/trace.c    | 2 ++
 10 files changed, 21 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/bmi.c b/drivers/net/wireless/ath/ath10k/bmi.c
index 48efdc71d54dc699e1d43d01507a7a30c9c495b4..52118867ecde5c71b36361e3393d7579116d8be9 100644
--- a/drivers/net/wireless/ath/ath10k/bmi.c
+++ b/drivers/net/wireless/ath/ath10k/bmi.c
@@ -3,8 +3,10 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2014,2016-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include "bmi.h"
 #include "hif.h"
 #include "debug.h"
diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index a89a7491a76c8b25c38a56cea4196bfbbae277d5..7bbda46cfd93c362b0d8c53dc5e8ad7e8621cacd 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -4,8 +4,10 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include "hif.h"
 #include "ce.h"
 #include "debug.h"
diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index fe3a8f4a1cc1b774ce27112ef7dfe6adb0b4dc2f..760d0a9ab9c2ce54717860e1c810d2b063f75e47 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -4,8 +4,10 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/firmware.h>
 #include <linux/of.h>
diff --git a/drivers/net/wireless/ath/ath10k/coredump.c b/drivers/net/wireless/ath/ath10k/coredump.c
index bb3a276b7ed584f4d4e7418b2e4cf7d913114869..50d0c4213ecfdce975638c66bcdebe35b6ce9d3f 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.c
+++ b/drivers/net/wireless/ath/ath10k/coredump.c
@@ -3,11 +3,13 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "coredump.h"
 
 #include <linux/devcoredump.h>
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/utsname.h>
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index a0c1afeda4ddf3649ceea8adbca23d771d17dc93..6410d3961e76ca2b4191052277c2072638db4b8d 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -4,10 +4,12 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/module.h>
 #include <linux/debugfs.h>
+#include <linux/export.h>
 #include <linux/vmalloc.h>
 #include <linux/crc32.h>
 #include <linux/firmware.h>
diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 2da08dfebd3e7b56b149a09b5372aa0bfb8538d1..ce9b248c12dc6c0c90a9a7e081e428d439465ede 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -3,8 +3,11 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
+
 #include "core.h"
 #include "hif.h"
 #include "debug.h"
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index fb0d5d4cae3a1c1bcb82c3bf83d57d79c3661f07..f12243d6bee171eeccf4a57e8001cbddfd26733c 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -4,8 +4,11 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
+
 #include "core.h"
 #include "htc.h"
 #include "htt.h"
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 9725feecefd6fb0f073761fbacf26d6bdbaeff15..c1ddd761af3e9ff987fcfd3a55b8747e48783b9e 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -3,8 +3,10 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include <linux/etherdevice.h>
 #include "htt.h"
 #include "mac.h"
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 07fe05384cdfb13924a956f7d672042b782e166f..730a6eadf093378d93844a444841fd5826f720bf 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -9,6 +9,7 @@
 
 #include "mac.h"
 
+#include <linux/export.h>
 #include <net/cfg80211.h>
 #include <net/mac80211.h>
 #include <linux/etherdevice.h>
diff --git a/drivers/net/wireless/ath/ath10k/trace.c b/drivers/net/wireless/ath/ath10k/trace.c
index c7d4c97e6079f006383b864b1bdb2fc0ee1569c5..421ec47c59bdf9967ad18e2de0182a488b9c5a03 100644
--- a/drivers/net/wireless/ath/ath10k/trace.c
+++ b/drivers/net/wireless/ath/ath10k/trace.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: ISC
 /*
  * Copyright (c) 2012 Qualcomm Atheros, Inc.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 
 #define CREATE_TRACE_POINTS

-- 
2.42.0


