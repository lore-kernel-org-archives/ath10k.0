Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7379FED9FD
	for <ath10k@archiver.kernel.org>; Tue, 17 Mar 2026 18:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rmu91ZOlkBlRgG8B13OKfLVMrQD3YYnQngV2MlJEfFw=; b=BMkOKzY6E9y/98Onq/PVdx/i4E
	D/JrbjmaVf5grGiUj/VEh4+mSYDAxakuPDLHVGcYItq8pct1ryVLu84tSrq9xFgk2YaHr85XUZGOb
	KyjFHtjuzkr5tqaVcdWUaf5Tm9Apt+SH7C4XTFVClw7axMM7A8fP8z/j+VXihVMe0JFkOjs4aAn9b
	3FQrrFSf14wWbA+Vgb+OMmH9I9MKSa/yWsqHDxaNUrovKtHHBQHmRAaV/dzX9R6V33j4lwziYOw+B
	lYZMJt0r7cPmAx6xDGFNmyGXkNelcbc2OfS1UIw3aM8jfHDm4G1PFMxYy9zp1W33w9Oi7Kh9tLfdc
	L8Pr7Xfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Yqh-000000071XF-2NRO;
	Tue, 17 Mar 2026 18:08:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Yqg-000000071WB-01Br
	for ath10k@lists.infradead.org;
	Tue, 17 Mar 2026 18:08:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HG9s9K2006344
	for <ath10k@lists.infradead.org>; Tue, 17 Mar 2026 18:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Rmu91ZOlkBlRgG8B13OKfLVMrQD3YYnQngV
	2MlJEfFw=; b=Mk49nYIk7ZnuEPJasHlRpYRKKc5eT9b2s3qF6ljsghjDlGxV5xT
	2fa+JkJHqngW2LNCCK6KzVy6FBEfHT+pLwsaplapo341KJhnOQovYfQ/XzF9g56G
	VP8Neil4Dm7Bj3jEtlBCqlBR/zA0gq3hUU7yhKRbliDpQiafC+rPwiW6T4zoLtVU
	S+zjjkPMatvswqavF/AxSsezD52hjIZ9vVn41ehHKZZ/cTtFpBSdhiCfw3l06S7b
	FksnC5Eom7HnjUDfplwTZ24qInn5/GJZblDPATvl8/yGoGX5kkbaF3cJhoXi03Bh
	+INIhFqhUeKKYw3XyCLXMcJKEHYhAVAdBog==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya83rf80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 17 Mar 2026 18:08:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7fec8d44so590760085a.2
        for <ath10k@lists.infradead.org>; Tue, 17 Mar 2026 11:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773770936; x=1774375736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rmu91ZOlkBlRgG8B13OKfLVMrQD3YYnQngV2MlJEfFw=;
        b=O7HXnRv3HD06hcc2q1hICm5dTCIwjtqmSQ/tpCHdB+y0aihVFTpWtNPvtlLx2K8inv
         IC1tb1oMwUknlzni5oGdajwQO88JS4f5wQNtvUN//UUoNGbp0jtJfYESzUN3W5v7s/23
         A6AJKiW3G2wxypRXFuRca7xkkcHEBzMaEMhOx82QSnjaYKVwtTNjefvSydY82h3huyg5
         /GNOh1bH/dvwDMF4cge8KPft+VqBgXrDj3w05KteRztE7dQzdTEOt8jucbR6OJGPeKLP
         cyaYpMbx0xaFHrtKAcKPO39DFKFj2s9fbIyS8Z0XxWsOBbj3I3hpH2JJEIbWlUe6wSeG
         cuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770936; x=1774375736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rmu91ZOlkBlRgG8B13OKfLVMrQD3YYnQngV2MlJEfFw=;
        b=pTsvHhMvP7pgnO1BmGYF1On5IlE9cgw4Vn3VMxO/8/216fWZXDZ5K93Mhg81CumQDY
         MIYFnopxrgdsoCvx/Lb7n2HrK6TXPQc6R3g57JjiRzPAMmy3E2BHfEgr8rxGdw2jff8c
         C6SU+/yJg4jMdkwlKLGWI9eASbJmJoodgM1sH0rV1JZBIG6BFEvRIjaiXAJWWd1PmONs
         t1c+HpqX6HIcKe8enyMVXKJ3Sjcb3FP+UXlHQ4AGHHMD4BCMYLuKlbmxeiV8F5KqpF4G
         A4TIbKDXrS3tg6GCMJZ6vSkf/KWrJsn7vxRU/20jdPwWUL+jVtXsuh/yoaQ0Kbdr/mLv
         IAEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsAfHT7zVOzMxwGDQSLRpSQynLAQbJ/oMY4bvA81GTtabcQvt4k1PQAwXRlX02kj3y67CkAho=@lists.infradead.org
X-Gm-Message-State: AOJu0YzGsNrTi0x/wYdeocQg+DBTHcX/JSyAbc0YKhnlGaNosR0tjfo5
	a4owf/aiijYEcI47DjN3R77hX1N3pvZCVheBFIGzo5aAR6hQrGLXPAMTRiPUOMQHLRaKQXC4eqZ
	3xXpDSQXFubZqA35Z7DfL6+QGt6sPhMU6eOBpZIRmDVDVeQUU7VxzHLHxPAvKpfK1
X-Gm-Gg: ATEYQzyxuP0CrlEMoXjl+qHaL9JXc86sbSVqFqElndUZ15g4cpumEGxLxFk9w2N1Sfx
	lSloVAicnCTA5lLIkuJMlUidnG6hnaaocuJrHXaLqHVsMKHDnaMgJZzMfUQ0HnV9w88mI2MDE07
	bXX0GA06WfdBf5+NA+OKJnQBm7jtQjR6Fb1Ez1lqVTmCWARGfNARcII6SN3A8MlfovO2uylcgT/
	pFYXhOnkbz1glX7qacFbG58BqersOaeBb7G3psZOxHNI52orAE6iCtlKI/ufsTBVI9httkWw3y3
	aNt7ZfywyLMKPBtTPQxR4M/+muVbniAfq5lhO+dP6PDXrpiV3cjZzNo6PRhrEhbC1pIdmQ7mMim
	MkgpHknT8W58jMbPkWOyQlL8kO7DXU92Sbjy2fKHVmDTRzBCm8A==
X-Received: by 2002:a05:620a:1706:b0:8cb:3288:6777 with SMTP id af79cd13be357-8cfad1e452cmr74868485a.28.1773770936013;
        Tue, 17 Mar 2026 11:08:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1706:b0:8cb:3288:6777 with SMTP id af79cd13be357-8cfad1e452cmr74864285a.28.1773770935576;
        Tue, 17 Mar 2026 11:08:55 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:67fb:53f6:20ba:ff45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4614c4dsm1501765e9.16.2026.03.17.11.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:08:54 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org (open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER),
        ath10k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER),
        linux-kernel@vger.kernel.org (open list),
        ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER)
Subject: [PATCH] wifi: ath: Fix the license marking
Date: Tue, 17 Mar 2026 19:08:32 +0100
Message-ID: <20260317180833.3061582-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tJTu54PFo86NUtSjwszBrYFJRR4H6Uyy
X-Proofpoint-GUID: tJTu54PFo86NUtSjwszBrYFJRR4H6Uyy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1OSBTYWx0ZWRfX5hr9voj1TQ+3
 hWN0eek3nf5KoSNqsn8OFN2UrGR9NDDE0bzPAzAyQyPeBiKNDwHV1o6ibhANTGTfavTSd9HEXS4
 HgvsKEwzWYaRoG/kr6wcPPcl51DpB3RV6DZi8h2Ixyx4Sg7sp23QxCkL9/vV9p8bzzWyUKyRnL9
 mRJ6gsf1T3fTJfGgjGmmeJCojy3qoi/pq/CjO8Ka9ie3JiY4ViMPF2v0cym2/yEW0erljib5Vdb
 eegn21GR0DW0BKoYKCVBK/gyxv0Y0Hf1KRSJwDOAwMkyWxLNvICleEbEULJqu1I5qk6f8HdWQYT
 F6H9Ffyhvk8ZFxCYslwqIYSKkQ58gcO78Vo6HOAMYkaclckXBfZm+iYp5wVEhC23N46bPXo4Vy7
 562fqDF6/uZUzAJnuOFpkt4zuRsyZuiOoYEUSa5uDo/8wVWpKdhh8rbpKRoHU9rpi3KkRnUVoWS
 YVmui1SrDnKvyNs6Jkg==
X-Authority-Analysis: v=2.4 cv=Y8n1cxeN c=1 sm=1 tr=0 ts=69b998b9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=GxoTDrp_cBUVqGJeqSQA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_110858_058386_2CBB2C76 
X-CRM114-Status: GOOD (  12.58  )
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

The Copyright for Qualcomm changed its format and replaces the old
Qualcomm Innovative Center by Qualcomm Technology Inc.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 2 +-
 drivers/net/wireless/ath/ath11k/qmi.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 4fdd0af415d5..acad75d49d98 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: ISC
 /*
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/completion.h>
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 1397756d6251..410a7ee076a0 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-- 
2.43.0


