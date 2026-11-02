Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41953609D83F
	for <ath10k@archiver.kernel.org>; Mon,  2 Nov 2026 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KWxkZR7H;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MJ1Ttwjl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f0+RaxvJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TFECovovrz1IBCzplEHcZQgm6wJQZNlKH/xJkkihk50=; b=KWxkZR7HBIgggC
	LJxQE4HxwPV3YqT+eKmf959G2Ww6FVQilvrDShiz+g8u7Dlmnf/rl+GDphl2V+UGjHwUlUzweluTl
	+MmAdT418kHQ6o2fXb/qSp6qgYrxo6NqQcy/TciCP8UQwuWufQy+rvjuRo4oHaKPCGhIDAoMvz86x
	3JaYf/rVFcT5jLI5RaNRxdT1UkPIcrlf+4uMavVErbll9BsRA6Zdq5iRDjRbFqd5u2VU5mEXGX14D
	IkWMKZ5kUVnge2mgjrZThB96mrCHA8cDwwizaZSjKqcWGwaLvunsdlcnld/8h94+9m3QlVvs5ei6T
	9+/Wy2Q9np5mAn53BP5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNusi-0000000HI05-3A4B;
	Mon, 02 Nov 2026 16:27:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuse-0000000HHxN-3BnD
	for ath10k@lists.infradead.org;
	Mon, 02 Nov 2026 16:27:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpJbF4061990
	for <ath10k@lists.infradead.org>; Mon, 2 Nov 2026 16:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TFECovovrz1IBCzplEHcZQgm6wJQZNlKH/xJkkihk50=; b=MJ1TtwjltUBTCZIZ
	vkdCnWqJp4W0PBWwPG54tU6pylbjungc3QPNB9ChDjaJ945T3KvatiCbw5AGKe1s
	/1Nxv+PX/ad543VkSES+HpDJFkUjnqq/RNchx5Ul5P8F/5mIfVZAWF0OPgem3lR9
	eJ62wngM8FimSI2tuaUw/ySPSn9i5+frdXRBTWvubnJmWvysjHzA0+bJrSwm+4e1
	BOoWkowk7CWJt8sKDi+1uuu7Ft2r/CCkd7lTqT5BqGlsdu6RPVsufcmJdJZlUKL+
	Nj4GFKHecmuZAeVQlQbzDnVmAihO83FDjQf+XD96aS1gsy26ngY6YpAYyRdDrAqh
	TCZLEg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmetbhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 02 Nov 2026 16:27:31 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98a829c43f3so609309241.1
        for <ath10k@lists.infradead.org>; Mon, 02 Nov 2026 08:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793636851; x=1794241651; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFECovovrz1IBCzplEHcZQgm6wJQZNlKH/xJkkihk50=;
        b=f0+RaxvJ6ltPhPyZUZ+ZJseeH7okyUztAgWJ+QWgMmGLTvJmzBv+8e9kORr0kGhOFN
         tUrUOjCrF35xDPofmPZ9Fxs6u5b/udWqSYuSgCcrsPsiV1BqGuTMAc2tBa+Rl5st2OMU
         VrEMJmF/i8lqup/lpazknEMj2veDgbNASs1CwjgoDf1eBsHs+VetMLI9/GcykB8BCFo+
         KjZTF7YcCIDRFw4QNMuaK/hu5vLmu+aq48kqHRcjBzrqDuP5+YrP+PnVe+UJHjpPZygv
         Z6XJP2r2nQqk8Tm5vEsYIla5CU/YXeRXqiUdgxEyTjrWjKcu++birdUMhwI8Z0TrWLHX
         GIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636851; x=1794241651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFECovovrz1IBCzplEHcZQgm6wJQZNlKH/xJkkihk50=;
        b=AXGHnGtnRE+9CIdJ3xPddtYWKWwOSJlYV8ZapcDbCdxvhdEIA/uIa6C/VF47G+CCtm
         uIoIvVdHwnQJ8E/KhAvY+4yNS7QFD3VDkUgL4CA/14JqYYJNmhyRkNne/OiSwUWG8ma7
         iEsJkFrpGJ1YYe3f8levqsfP34/lHawU9cfx7c3BmChyBP43ANBwTSy1gYoe+PNHAeGQ
         sTM7Cn5Nu6RHu1Uzjbi003luKAHcuAJ1v01RMe/QgNm5a9Hv3A+keGApXpT0ujd/mAaJ
         9RMABm8SeBvl6ZaZWZGHCqTw60D1tVTBJ5CjV2hCyGiKiKXIwOaeAla40Uq2fcEqJtZn
         n/1g==
X-Forwarded-Encrypted: i=1; AKwUvByiSGlDWkc56iO0itKRBN4449p7t+vHrGn7p/JToTqilToKE2h+uG652G07VcmegDi8bd57eU0=@lists.infradead.org
X-Gm-Message-State: APuU4Z/nOXYpIWYDHzwuXpVeOBxCt73fbgbWZRHPrJfdqe7Xd+EQmk70
	+iEuZMt3YH22kMp2ah4aSgmh680zG+QtYF/QIejF5YS2UC/OE7wPl7IEQP+iFySSu6LkVAljM2h
	PHCL43zAtMtEqTCD8VL84s00dtpuxSco5Arc8d609JfbHh+XTOnGUmz7eEgSY6YHx
X-Gm-Gg: AYBFou1lVlprOSjYmZ1LigYSIoUdW1yoKBT+nMX18iM2d/fbB8xOHxnV32ul+jTGvVn
	ztUTybLjJ0DKyAXX9oQ/HmE0GuLqVVcKVm+nmce9n6KUuSqrQ6kz86BfgNLWg+ti0+e7uZ8Htv8
	viQxNdG+8m1Q0vrv2kS4d6J1QwkQ+UE0c+DKz74TLqR/3t+lxbqW3ns2owQdePRFOGgRX99rKiU
	f2X6/wyTHpoBDKqTG3+Emgx6c9Fn3ZwVWkwz0bLd7gmOFWys0DjF03tNFt68Y5LgjRW4H1X3JSx
	xqaQBb1USDEgcD179gEf0jbpe1VJppjKmBN87ZP4dXBitp/8sOQmKe94m+TlHmnJgXlcSm23KSl
	1Q+wq/NfnQ3Yv/ebdrSL4Q1BWZ4uLzgkxlFsbLZnxxWmp3FIQOydtEexDVMwdEfeuUaI6g6McSF
	SJgo68h3ZdHG6IWa3ya4XNUF/pvPJ2qGCqgx5wznFqILy19hQP6xIQ2DqybXFvHhP31DpYo/IjS
	IpwC8cs2+BzCU478aGXLtC+9+8+
X-Received: by 2002:a05:6102:689a:b0:7c3:7286:b7ea with SMTP id ada2fe7eead31-7d072c18c5fmr4049280137.17.1793636851101;
        Mon, 02 Nov 2026 08:27:31 -0800 (PST)
X-Received: by 2002:a05:6102:689a:b0:7c3:7286:b7ea with SMTP id ada2fe7eead31-7d072c18c5fmr4049269137.17.1793636850566;
        Mon, 02 Nov 2026 08:27:30 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm20490695f8f.45.2026.11.02.08.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:27:29 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:27:21 +0100
Subject: [PATCH v12 2/2] block: implement NVMEM provider
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-block-as-nvmem-v12-2-f4a2a681087d@oss.qualcomm.com>
References: <20261102-block-as-nvmem-v12-0-f4a2a681087d@oss.qualcomm.com>
In-Reply-To: <20261102-block-as-nvmem-v12-0-f4a2a681087d@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae8b9f3 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VT4XjZGOAAAA:8 a=71DuYGxFrHUPmPLwgxgA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NSBTYWx0ZWRfX1HTpxRhSK7XP
 13fGwgZbaFf+uCdefMoeHrc8OsEwP9PwntiqMW7USQ0CwIB5/QS7FlljZOecAsSst4FORZkdZeJ
 d8njRXAW3WyQQSQrZJhbmbMO3/aGLUd3l14/cde4mQyqPrfxyLtlMYjY7hCb6Evs0qCfxkI6/pO
 w30KUDe1GrUgviiX3CeGjrGWrP8j/XQIvii0TjMFOuxHi4X31jT66L/0iRpgDFD7EsMsS9sGw4C
 Wg8nJyvgzbRCIIx9tCpo0HFqHs4opEYEi+rl9qhWy6UFm0s3hq3AomtAoUazaglutSxsPQbbWlA
 kwuJQ1YzS6kpXtkLCnkDleWCSg4AhXXHjBanGFJ9ohXggQrAJqnUsk6P1hRBXJd7RSt0xETVcS5
 wnRzC9itGghKdk8Ijgn1zFo3HI492rTNKniEEyXqUqaJszKJV9egJvV1iQKScPn2+AdVYbE/5Gt
 gHfeSsi8x7O+Cv/nIjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NSBTYWx0ZWRfX5LEhCQs/0AO8
 0N5kWenXBWRXBWGSMIeJliFegVpD7XIBjx0S8VQzSUr65rAJx2tdaeW634oXTXAa8ga/MkEET3t
 uuEoFHP921Vcr4YRNHw0LpcRJuWSJxM=
X-Proofpoint-ORIG-GUID: gv8vjgHkAR0dcn9xy-YX0MAuIQV_MYtJ
X-Proofpoint-GUID: gv8vjgHkAR0dcn9xy-YX0MAuIQV_MYtJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_082732_941048_0859A8A9 
X-CRM114-Status: GOOD (  33.54  )
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
index ed21724726223f777f40be15f82fdeb9da89beb0..4d9e3952b1561a467417482cd516cdc97358d093 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -837,4 +837,12 @@ static inline void blk_debugfs_unlock(struct request_queue *q,
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


