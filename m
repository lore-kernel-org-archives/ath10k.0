Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9EEC71135
	for <ath10k@archiver.kernel.org>; Wed, 11 Jun 2025 21:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GH2j/JcGCi/wRGQ9dQsBU2fKYdtjABlsIMmBhcg0SgE=; b=dUYxo7tprzoNtKRZ+lI1fHKuCZ
	7WT5w2w4SHW2j/RRWb34mjoFriZOu3nju2zPqwlL4V9h/NBwAFyeTzKm83b1OAsK5Nv62oqEHoqVH
	habm5+DqnNKaOoOICmGG6zUZ5qYeSA9yPlLrbFDtWhCIgAXmgaHbtNseOqhSY36af1V2pWgwWh5R0
	U9i3QXWTLV5GXyGGU5BbSTU69iVxyqtqV2G67xIIttRwetHgV7GATWDKhmFROT8rd00tM5Up/93qk
	zRAVf4SsIuKA+weYfXfWf+PJOwDzmXBOTq6ugNjDYfuHv2DkZ+w10qxXvVEcRntUMSdcTc2GYLbd4
	m07ip0Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSo9-0000000BGJc-11oY;
	Wed, 11 Jun 2025 21:16:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5W-0000000AZAs-3EjX
	for ath10k@lists.infradead.org;
	Wed, 11 Jun 2025 16:14:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DDKm029240
	for <ath10k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GH2j/JcGCi/wRGQ9dQsBU2fKYdtjABlsIMmBhcg0SgE=; b=pRSNC7R6l5HnmRsq
	Scnjy8EdxHE1eJmHy9ZUbZAHkX8hC30QotCClFjZ3pNSON3KxyhSz6Oo0+F/24WE
	5r/hzrSpnTcFpocwRCW0w26zWx/n6q9ptqLi9ABqjXZ4R8i+rtzZu8uM9v13astM
	YIxexQdGRM7WMPScyf3oLUwix5uCDdN2pIhqfRtoUFk/i8yNBQuUnTUuvoGtC7rW
	H9sH8oS+0VDXP5mONn5IBw0Ng+gDpkJaX/9alty3gELd7c4145JggGTHAKMyTWXl
	BGqleD2qrXDTtFhVE8Nxi3Sva+otxjR8V2KcTQYF4tTWQUOjyfFN4DR9n6l3HkcN
	fRoN6A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6djcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-747d143117eso37444b3a.3
        for <ath10k@lists.infradead.org>; Wed, 11 Jun 2025 09:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658445; x=1750263245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GH2j/JcGCi/wRGQ9dQsBU2fKYdtjABlsIMmBhcg0SgE=;
        b=j8EoKaPPolQPVvdIGT7VuDcrH6lGRd3+6LC9cejLYscqZaFjm2uFo3OICF6UpBDChq
         eZ3qk0EhaJRJg9BxRyR4rnc/o9NhCvEbwvhQ1ZeMElLgiO2zILMfuRiwN9IAho7OBcFJ
         iyTUZU5Qqkn2e73oU6V80sdIS7QQ+8dehufCZx7nUnvJ/+yysysS4hfyvaGypCX/tECw
         dkiYhC1Oi16oW/pPvjaagKgoFd8szvqZN/IDljbKQGbaipIpdif1Fddm7WhKVILO9lnq
         G0svSMGlrF+pKefY2QDKyRW6BYAltb3nYrISGEwLuJwkU1QTPl/VZEogTM4PD1GR3Ry9
         dAwA==
X-Forwarded-Encrypted: i=1; AJvYcCUylKc9XN7pbSyt0IJy7bxxO0bQQhjRAYaxchDU+qkJ2NWbPF4dPFjwb3iYyGMgCvdLuP8baWY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5yu7doE7toDPDmluvqWqQFmxrnkkkLqIB+CRgV0BPnuEx6PHS
	yBmm5NziJnK4ypQMbGUtP5ROA49J5W8ecZAM7rkZrEeD0X6Z9R98GrOs8nWE6RXhllH+dCB79pU
	IB/ypvSzL5Bs+2BBS0MF3xnw7yk+zi9WQJdl3X8xzLKvD5G3vbsj6PnRNgWffP1sv
X-Gm-Gg: ASbGncsXaIvBNh57mDbwaVBe+ZfvBfNO1eJUUyplXH2uS6B0K+Ga+Bn3mrlNqMShUfx
	oUHdwKJfhEGzFBllUq983FFMrbAuKV4RDI7iAGySb6JxvmZgWPf5exc5yruauJZJg9piR/KWuGZ
	FfT8/hDjjDRyGzF+mYphRy3svEhE3Gx8JznEOj2pVgZbF11+/pga9qiDxy6AFAuypewEm+ClpLg
	TTF1oMMFxNZc2WGBJ8qy2fh6eqx5HAP4Yt8jfN3wn59ACLE3iZCTlL+zKxx28+cuNFw6sjod+3R
	pNuNV41nO1ud6lR6Zxs0w2Lle3Af5mfYuoPEOg6hPN/EzVs5RPNxt3/E8GQ=
X-Received: by 2002:a05:6a21:3943:b0:215:dfd0:fd21 with SMTP id adf61e73a8af0-21f8672f2a9mr6863602637.34.1749658445464;
        Wed, 11 Jun 2025 09:14:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhF50A00ZTd8vFQ+6dCgRXF844Xy0RmBjMaSc4ILELsZo+JvEhAIFYPQ0WDZr7mZZy0t8u+A==
X-Received: by 2002:a05:6a21:3943:b0:215:dfd0:fd21 with SMTP id adf61e73a8af0-21f8672f2a9mr6863542637.34.1749658444992;
        Wed, 11 Jun 2025 09:14:04 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482cdf1c41sm9443708b3a.149.2025.06.11.09.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:14:04 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 09:13:58 -0700
Subject: [PATCH ath-next 5/5] wifi: ath12k: Add missing include of export.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-ath-unused-export-v1-5-c36819df7e7b@oss.qualcomm.com>
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzNiBTYWx0ZWRfX9VGJD30rNc1b
 ZDQK8PoKLX+LuNeK+B+dScKWdulNFuHkOjXUlDBSQyzbPVR0jhdJdgZJX/koHX4Jt0//J8t8nK/
 jekwDzPcVntdHg9X5i7GfgVngB2HRCvH8TpNQwW1zyFu5X408jXEN849FkNcGmCG6D9GynVSO+p
 Occ7T4QLj/xQwcOA2hzYty/XhBU2nRw/HsAYblqON7ciUMnprnRb5oa+iAzyQpFuhAa95V8wr5K
 nUTqPTEirURGolw9p9rELHpEkD+ohcrmB9uSCW3txanB23Vxorm91nTI7gJUeFGXLyRzPBmsFnF
 Qc52WJOeSWfs5xkb4cMcbedN6PSAwjidk9Vb/hyXGoL0QTczBEAkP49dKhoGCC+0quQ6ihCzPs5
 03meaXUrHe6POp0OKdHIRLFGbW7N+IA2+0f/NgIhfrpF8t/SjaH4FfHgIjfOwnVju0Q1hdMO
X-Proofpoint-GUID: nbBMMbpY8pZj1hlgZCqqC7qUV610OHAQ
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=6849ab4e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=xduYLtDgZ1illbjtIHAA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: nbBMMbpY8pZj1hlgZCqqC7qUV610OHAQ
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
X-CRM114-CacheID: sfid-20250611_091406_850561_4726E0A7 
X-CRM114-Status: GOOD (  12.89  )
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
the following warning:

drivers/net/wireless/ath/ath12k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Add the missing #include to satisfy the check.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index ebc0560d40e3419130e4caf01c9b91bd9affb3bd..ee0ac2e4e74b4b7a700b68a2077aa5b9938362c0 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -2,8 +2,10 @@
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/remoteproc.h>

-- 
2.42.0


