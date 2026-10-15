Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F15CC6B3A
	for <ath10k@archiver.kernel.org>; Thu, 15 Oct 2026 14:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rre9nYhysjyh/PSjFpSqFeP/GcQd3x85phPUQeiwexs=; b=xaLtqAxQLfYutCt1khC0x7AhsZ
	nnAU3dQ4Qd5I0IaUEGKd9qwoGnhT8JO8T19QYqngQcqVGrWqf9V4J46lTCEHUpTFGagn/SJdyXLiM
	5gkJ5UDwBWPgNxB/z7w2A9PAQzTViHaLa9rW96vktLpmECAy56VLjSfKgBhE7EuWINuG9wfZmFukx
	9xHzCrQIXyu30ufwycbnedsWmWEA7TS3M6TVK8A1SuxPOYOZqOxaQUrisQ560oy5qoaTE1LEUt6UA
	E38T0M8ugKy5N/Ts9rBCDa3daZdc+8UymkXXq6Tc+9vah6zTDrfQM3tqcScAb6aLXShZhMEOyZhGf
	/JkKZcxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPl-00000000MSP-3mdj;
	Thu, 15 Oct 2026 14:26:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPh-00000000MMi-1Cc2
	for ath10k@bombadil.infradead.org;
	Thu, 15 Oct 2026 14:26:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Rre9nYhysjyh/PSjFpSqFeP/GcQd3x85phPUQeiwexs=; b=BmSTWYsJlt9qmzpRbVvWlIxfKk
	EtiVs12F0rrGQZpzcqj1AVFig9dqEqkzjJf9HA7lv49Te40voiHnO7zFh2u+mw/AkxBMgw8es2bLs
	1jySs4RRziVw+Z0I2ZrAS1ne+jrAgSqVGP2pQdKNN650uY4rHPUXjsGpuJPDeOHZ8oyZcSvwCEMJb
	5kg6hUndWgYbdp8Ojl3y3ZbogkEtWa4A8YTy6hsrhKkTqFEVgUc+uWqRP3wTjodhg4USi4xXkTtIy
	amCPA3oZtMSEPz9z5vytGQPV7u66MEn0qFqxoAbDGBPk5ro6/x5zv54IRGaUDWWQGegXLWz6qoII6
	sYKPDA+w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHMPd-00000000TBP-138Q
	for ath10k@lists.infradead.org;
	Thu, 15 Oct 2026 14:26:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kF8q2999159
	for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 14:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rre9nYhysjyh/PSjFpSqFeP/GcQd3x85phPUQeiwexs=; b=XZsjJyP86E4GTGB6
	a4bPbCinpsmnCbaCdpI1h2R8SU6W/Sfbvu7l54rl4LfpvRY/w+wfr6tub8JoMKYM
	595hOFcRN0jFMk+GMScBT3neLO/EIxCKsyYVKPZCG+UjDwmQblRhBHquHl97Ha4h
	qRkmZZM95FIKDgXzLK5RLeOaIgw23GYO4em7HhOhkBb1fA0ZcFQROn8mnYvB6M7C
	DDWpbguBpGHbH9svCtj/wchrcRjviOPlWf7MfiCX28BrCY5ctz96qd0JElzNiN93
	yIEwyrdQsGNCwMrQwAeTPD45Ytl0ekMmqwUeA4e3fn9vfpwWqvsUZYWMFGLzz+zC
	Rq2gFg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm1d6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 14:26:24 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988bc0ef0easo214995241.1
        for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 07:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074383; x=1792679183; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rre9nYhysjyh/PSjFpSqFeP/GcQd3x85phPUQeiwexs=;
        b=R7pVp51g++L+YCAdj9ysDuxmy7S9TXFgI9L2S9ja0dHj8FhC9PP30EjWSSS0XtPej2
         fmZGkdLEFIpw2qNMmqKjFHiaxvJeigBSeJRa5v5u2h/FmWgwC8b1rqayvNg/9mTjcD6r
         DB8SVlbXkgiW139PntUVcx4iBh0rk5LrU5ryQsuf1C00nrcszFVGeddNxfrmY6ObTS49
         NfaLWPgRrW3NB5mIysXKzm/xOhF3hG0AC2gTFTWTwtg7Lumg+V2V7uPzK3V754eJwvff
         nTXmcVaVymgLa1YCGps5NPVlqOsOnIXOBWbudKm0kI+vRk4MKdQlk7xb2jF8b4rY444Q
         x/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074383; x=1792679183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rre9nYhysjyh/PSjFpSqFeP/GcQd3x85phPUQeiwexs=;
        b=U4zdBP5OZXskTf6VciByvJ0HueIczVlJAXnymECLnuMoYWJf+xtvElA4s2G5N6UkHD
         1gpMqhTxbWrUjBCzFKLxLRrH+1UiK6XgRy9ZfFvI+6Inv4kk3X2Jyo6ULAXxgzjskbzn
         33WZDTMbNZOkMD/bCP8y3KwYV4eAelF8OgyVnGQu1kK3uD/tUKnMKBLhZ28ISomv95jl
         rFuBTgvjgsaIYufiCeK7Puy7ZioAIJFcMqZT4aGtUmhMR1I3dRodj8mXHelrKFzME9wO
         +ExAhP0XZFpoykKTO1wsYgtTEXyGAy7DPsqfLY0hko8FxhD93gIHGdoPEl+dL3sWG2yE
         umMw==
X-Forwarded-Encrypted: i=1; AKwUvBzlg/gQw2R8I1Y2v7hd4Abl/j6WcCPAYMsVdXpcLPWIueoX3zun+8BN5ilwtF283j5Kve7nSTY=@lists.infradead.org
X-Gm-Message-State: AFq9FYKdGCikD1wOE+8Wz3Qnd9zVS91sQllOJofxLFzJ5Y5db/KaYDtt
	s2nMEItht9nTj8MEhFQVfYIs6rEGTuZwU4WtYIpeKQgP078a5UNJ6dE/KlqWXH9kC3fxiuoZfIp
	16nqbctGGe9bX16EEMSvOD+5dXP9nir3m967qCTiKiXqdzjf3hcy1FGUAB5+HNX1a
X-Gm-Gg: AYBFou0RfsWKAzRA6kT6KsE3oEB9RUXvltJ5MuHof+WNDyT+OLJU0sG34srW/rFstLt
	dCm17FCEl3VS+s8RMK57RP8h31bAiU1hDSfzm43NxJSfHUVgYtsOv/e/xK4PJ1igA63T4tkSssr
	dLOQuZQ/KCW8CBOEyNK/mTH0xqT28bTmE4w1Ix/U5qc4IQf0QYNbGNO3ORnkV33Eym8lUXbQ5hf
	P5K67lpp5rbNpPuJzQsQsJ8rF84dti1eemiOjLbDXDWaGux+dvM3KQh/omwp2TEx9hiewMMiVy9
	LNpqzXd8igd/LkV64y2Vu9LpBM2n9FoeSTUGX/gjxIsnzNRzpJ4niIPObGA+LLZovNw8U2pjakn
	aMwTyGtR52w1JuJUqgKkYGNYIvY65jNItWl655dUsLZT+8P8XXy11xpvPWcdsAW+i4g2t117Szm
	8TO/uSlJ6O9wksKwG9SYgzq2fDrDz53anRXn+f5JjEuLvq+sWULe0=
X-Received: by 2002:a05:6102:149d:b0:7c3:8ae6:d7ae with SMTP id ada2fe7eead31-7cb3678b940mr4845581137.1.1792074382869;
        Thu, 15 Oct 2026 07:26:22 -0700 (PDT)
X-Received: by 2002:a05:6102:149d:b0:7c3:8ae6:d7ae with SMTP id ada2fe7eead31-7cb3678b940mr4845555137.1.1792074382082;
        Thu, 15 Oct 2026 07:26:22 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd6428b3sm69083145e9.1.2026.10.15.07.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:26:21 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:26:02 +0200
Subject: [PATCH v11 3/7] block: implement NVMEM provider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-block-as-nvmem-v11-3-f890ac74f87d@oss.qualcomm.com>
References: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
In-Reply-To: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: rRO1NyO43G_HD6xLv-1OM8SDOAxdohpf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX/+Y0SEO5LRZa
 eRv1OIAhxnN2YO6OUzpnuvgc5RQIm0rMqTnuDO91b04dLuFs6A1MkAJUwSt5GZpLhrQPTeL5fPj
 eSGgcSTFd/ZpUtVNK6m3uMOc8ViZPQTINok5DnP1vfXHjVaQ1Vea3SSWf61f9MpmObLFxcVZB/a
 pn7gLucwRZdc/rd1za/HHsdOgSB+NUtIrr91GU/3mpz6Whaw5itemxpXHppy97wlOiYIhXT4qpX
 DumJJaQx1K6KOgu9crvC0EbCwZ7Y+DyAsHmWUGbN3GkxFtNSViW2eq/owjpoQsjgZbwzFbjvMV0
 tL0sYKBHQdujg/RxjahLh3OgN3D2EJqxMDcziQDo0EZrGoAZKZOhUeSXC2k361JEBf7i0IAiIev
 I6CFQZk+3mbooPF8mECUT14lbgWCy8MeLTMpQGmIk6Nze43k3NVFSPiLOUTdqEXncC5lKdsr7Ph
 R6hvYiPMk4hyo8CiGEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXyjzXunOhoCdB
 ChT14P18y2Xex5iaw5Sp3hjsf0YRMwl3vzmhoVHgDjcAfgryy+4uhHjjho6YBCx5JgYqa2FGFOY
 Z+YUJcHi2kQ6YIw6PXQ1X7zjB1wTBeM=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0e290 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VT4XjZGOAAAA:8 a=71DuYGxFrHUPmPLwgxgA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-ORIG-GUID: rRO1NyO43G_HD6xLv-1OM8SDOAxdohpf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_152629_737112_7A831085 
X-CRM114-Status: GOOD (  34.24  )
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

On embedded devices using an eMMC it is common that one or more partitions
on the eMMC are used to store MAC addresses and Wi-Fi calibration EEPROM
data. Allow referencing the partition in device tree for the kernel and
Wi-Fi drivers accessing it via the NVMEM layer.

NVMEM is registered for a block device whose OF node describes an NVMEM
layout, either via an "nvmem-layout" child or by being a "fixed-layout"
node itself (e.g. an eMMC boot partition associated through its mmc-card
node).

The NVMEM device is a read-only side channel onto a block device.
Each read opens the block device with BLK_OPEN_EXCL to keep other
exclusive openers away for the duration of the access.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 block/Kconfig             |  11 +++++
 block/Makefile            |   1 +
 block/blk-nvmem.c         | 112 ++++++++++++++++++++++++++++++++++++++++++++++
 block/blk.h               |   8 ++++
 block/genhd.c             |   4 ++
 block/partitions/core.c   |   5 +++
 include/linux/blk_types.h |   4 ++
 7 files changed, 145 insertions(+)

diff --git a/block/Kconfig b/block/Kconfig
index 70e4a66d941ff66ecb0ec34f4f7eff7fd1e4be40..4899ad572c71ffdbb62460d57623216254893ddc 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -209,6 +209,17 @@ config BLK_INLINE_ENCRYPTION_FALLBACK
 	  by falling back to the kernel crypto API when inline
 	  encryption hardware is not present.
 
+config BLK_NVMEM
+	bool "Block device NVMEM provider"
+	depends on OF
+	depends on NVMEM
+	help
+	  Allow block devices (or partitions) to act as NVMEM providers,
+	  exposing factory-provisioned data such as MAC addresses or Wi-Fi
+	  calibration blobs to the drivers that consume them. This is
+	  typically used on embedded devices where such data is stored in a
+	  dedicated area of an eMMC, instead of a separate EEPROM or OTP.
+
 source "block/partitions/Kconfig"
 
 config BLK_PM
diff --git a/block/Makefile b/block/Makefile
index e7bd320e3d6971a8abf584f5de42776bb54e8216..8200297fbcbab304beb4239d0c33da07011c3ed9 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -39,3 +39,4 @@ obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= blk-crypto.o blk-crypto-profile.o \
 					   blk-crypto-sysfs.o
 obj-$(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK)	+= blk-crypto-fallback.o
 obj-$(CONFIG_BLOCK_HOLDER_DEPRECATED)	+= holder.o
+obj-$(CONFIG_BLK_NVMEM)                += blk-nvmem.o
diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
new file mode 100644
index 0000000000000000000000000000000000000000..69b69184e16303444c9cb2dc816d5679daeb13c4
--- /dev/null
+++ b/block/blk-nvmem.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * block device NVMEM provider
+ *
+ * Copyright (c) 2024 Daniel Golle <daniel@makrotopia.org>
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Useful on devices using a whole disk or a partition (e.g. an eMMC boot
+ * partition) to store MAC addresses, Bluetooth addresses or Wi-Fi
+ * calibration EEPROM data.
+ *
+ * The NVMEM device is a side channel onto a block device that stays fully
+ * usable. This is somewhat mitigated by opening the device exclusively.
+ */
+
+#include <linux/device.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/nvmem-provider.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of.h>
+#include <linux/property.h>
+
+#include "blk.h"
+
+static int blk_nvmem_reg_read(void *priv, unsigned int from,
+			      void *val, size_t bytes)
+{
+	struct block_device *bdev = priv;
+	struct file *bdev_file;
+	loff_t pos = from;
+	ssize_t ret;
+
+	/* open and prevent other exclusive openers */
+	bdev_file = bdev_file_open_by_dev(bdev->bd_dev,
+					  BLK_OPEN_READ | BLK_OPEN_EXCL,
+					  blk_nvmem_reg_read, NULL);
+	if (IS_ERR(bdev_file))
+		return PTR_ERR(bdev_file);
+
+	if (file_bdev(bdev_file) != bdev) {
+		fput(bdev_file);
+		return -ENODEV;
+	}
+
+	ret = kernel_read(bdev_file, val, bytes, &pos);
+	fput(bdev_file);
+
+	if (ret < 0)
+		return ret;
+	if (ret != bytes)
+		return -EIO;
+	return 0;
+}
+
+int blk_nvmem_add(struct block_device *bdev)
+{
+	struct device *dev = &bdev->bd_device;
+	struct device_node *np = dev_of_node(dev);
+	struct nvmem_config config = {
+		.id		= NVMEM_DEVID_NONE,
+		.owner		= THIS_MODULE,
+		.word_size	= 1,
+		.stride		= 1,
+		.read_only	= true,
+		.root_only	= true,
+		.ignore_wp	= true,
+	};
+	struct nvmem_device *nvmem;
+	struct device_node *child;
+
+	/* skip devices which do not have a device tree node */
+	if (!np)
+		return 0;
+
+	/*
+	 * The layout is described either by an "nvmem-layout" child node or
+	 * by the device node itself being a "fixed-layout" container.
+	 */
+	child = of_get_child_by_name(np, "nvmem-layout");
+	if (child)
+		of_node_put(child);
+	else if (!of_device_is_compatible(np, "fixed-layout"))
+		return 0;
+
+	if (bdev_nr_bytes(bdev) > INT_MAX) {
+		dev_warn(dev, "block device too large to be an NVMEM\n");
+		return 0;
+	}
+
+	config.dev = dev;
+	config.name = dev_name(dev);
+	config.priv = bdev;
+	config.reg_read = blk_nvmem_reg_read;
+	config.size = bdev_nr_bytes(bdev);
+	config.of_node = np;
+
+	nvmem = nvmem_register(&config);
+	if (IS_ERR(nvmem))
+		return dev_err_probe(dev, PTR_ERR(nvmem),
+				     "Failed to register NVMEM device\n");
+
+	bdev->bd_nvmem = nvmem;
+
+	return 0;
+}
+
+void blk_nvmem_del(struct block_device *bdev)
+{
+	nvmem_unregister(bdev->bd_nvmem);
+	bdev->bd_nvmem = NULL;
+}
diff --git a/block/blk.h b/block/blk.h
index 2cc03aa54c5327d0c596d67f5846740850550260..c5eed8f2777bea92281f5fef5287cb15b33e5dbe 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -823,4 +823,12 @@ static inline void blk_debugfs_unlock(struct request_queue *q,
 	memalloc_noio_restore(memflags);
 }
 
+#ifdef CONFIG_BLK_NVMEM
+int blk_nvmem_add(struct block_device *bdev);
+void blk_nvmem_del(struct block_device *bdev);
+#else
+static inline int blk_nvmem_add(struct block_device *bdev) { return 0; }
+static inline void blk_nvmem_del(struct block_device *bdev) {}
+#endif
+
 #endif /* BLK_INTERNAL_H */
diff --git a/block/genhd.c b/block/genhd.c
index 10ca8b4d6eea7ed3910271ca3af74479e2081d6d..6c45b8eb8dfad14fa2fbfa98177154f24af49a07 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -417,6 +417,8 @@ static void add_disk_final(struct gendisk *disk)
 		 */
 		dev_set_uevent_suppress(ddev, 0);
 		disk_uevent(disk, KOBJ_ADD);
+
+		blk_nvmem_add(disk->part0);
 	}
 
 	blk_apply_bdi_limits(disk->bdi, &disk->queue->limits);
@@ -708,6 +710,8 @@ static void __del_gendisk(struct gendisk *disk)
 
 	disk_del_events(disk);
 
+	blk_nvmem_del(disk->part0);
+
 	/*
 	 * Prevent new openers by unlinked the bdev inode.
 	 */
diff --git a/block/partitions/core.c b/block/partitions/core.c
index eee954df1ac6ef7dd4f02ad5c9d49aed778bf015..c83227710584a6feb25c8abae3b319cfae9cce5b 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -289,6 +289,8 @@ void drop_partition(struct block_device *part)
 	xa_erase(&part->bd_disk->part_tbl, bdev_partno(part));
 	kobject_put(part->bd_holder_dir);
 
+	blk_nvmem_del(part);
+
 	device_del(&part->bd_device);
 	put_device(&part->bd_device);
 }
@@ -406,6 +408,9 @@ static struct block_device *add_partition(struct gendisk *disk, int partno,
 	/* suppress uevent if the disk suppresses it */
 	if (!dev_get_uevent_suppress(ddev))
 		kobject_uevent(&pdev->kobj, KOBJ_ADD);
+
+	blk_nvmem_add(bdev);
+
 	return bdev;
 
 out_del:
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 0cc09b975d8ffbd45ca3dc47533a71f8e8164de6..8026bd763a0710b60b9553a49783efbaf81aeb9f 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -15,6 +15,7 @@
 struct bio_set;
 struct bio;
 struct bio_integrity_payload;
+struct nvmem_device;
 struct page;
 struct io_context;
 struct cgroup_subsys_state;
@@ -73,6 +74,9 @@ struct block_device {
 	int			bd_writers;
 #ifdef CONFIG_SECURITY
 	void			*bd_security;
+#endif
+#ifdef CONFIG_BLK_NVMEM
+	struct nvmem_device	*bd_nvmem;
 #endif
 	/*
 	 * keep this out-of-line as it's both big and not needed in the fast

-- 
2.34.1


