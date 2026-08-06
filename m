Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8070FC56207
	for <ath10k@archiver.kernel.org>; Thu,  6 Aug 2026 14:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLAbMrw6kMVW1KpbCEzwXaQHTu3vG+Xv+taIs0sFboE=; b=Llh5LY0Iht309098zwK4qU0haI
	1DLMt/zcVbfX8AVtSIb2Inp+VuhJ3hL39814u06+RHbQd3Iv+CayR34lP5/Wz9177V8E6lexaawMd
	ijYfQJphU/+d8+hGYRZUHTRCIfcKGBpsFyg69yfRSv6LXR6+7ksJ0KNBwn3s+j2iOj1IvpSh8LwKX
	DaSI+gAfjX0RGZjwa1g8bPdJ9Ic1ceGCGWR0eqYc9RrxGU03ny1Fq1RugNY84f6aj3ByADGW3dIKh
	MG+UsU81PJbSnsxVahKtOm4KzFvqIi9QthRkVmgFrnShjIRPa9CbhDWRi1Bi5NY5HUAjybrtF1eX1
	OlnIdu+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFZ-00000005zkK-1AGQ;
	Thu, 06 Aug 2026 14:39:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFV-00000005zeO-30uM
	for ath10k@lists.infradead.org;
	Thu, 06 Aug 2026 14:39:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ndTD1308839
	for <ath10k@lists.infradead.org>; Thu, 6 Aug 2026 14:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tLAbMrw6kMVW1KpbCEzwXaQHTu3vG+Xv+taIs0sFboE=; b=Umdw0+wXDi/tThuW
	hp38e8A8JadQ4rM/lXI8TBE5H9Qz1QR7UzvGGkZCqBQ2zUgqhfnWUVDD5WAJsKKE
	R/XhAYL5WSB885KUs+UeTFEyHlF+I0cmfY/23fWoiY+AbGo4WWBmgwtNaO/BYwW5
	a3F8EvBz7P7xQxTRM1EAE3o7LjkPUKuhpYSaGchOp6PMCVLHFVKgXhS0s3v7zDjA
	yopcd/y7sL8nzPj59wEbTvp1mutd7Itp1xIUbYkc6GB2C2WUcpuw4DiCXYitgQYB
	ujuHuSYvPIfStAEqtz/aumqKyP4AufbKbWc+TSJuL+WMOQfG1UCVbCAkT4I4JIw2
	551lBg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp729vft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 14:39:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-904ee4473a8so20351186d6.2
        for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 07:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786027143; x=1786631943; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tLAbMrw6kMVW1KpbCEzwXaQHTu3vG+Xv+taIs0sFboE=;
        b=keHo8VmojZlliqZRqPpdXHqHM8QOgvlVL48BecrFTDGHOFPcCHwhAGyw+P1yfpL4nv
         dxv47C33bFlkqPMhSS9yt6TBbHNeNmGnMcxZ2Nv3mGH/pkZGshaNQJvLsE2uDtfusEMz
         W+dhYMzpXU7yIZ/Ef+gDlRsf2Mwq4GJaO/40Ifcyb8zmZXOmglyVIDu37J9m78+kfYLy
         gmE1rD7j+p9YmKWitwlOBNXdRbdQ+w59+UbHfrOZbapi4a+6+l+Ai12s2SLdRi6O9ppH
         ORVZSSxKFH4dic0dxzwfGWd6Xh4phk9WvGevt9mn21SRpFrNEN2X36+grdz4ESdYXxyG
         BpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027143; x=1786631943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLAbMrw6kMVW1KpbCEzwXaQHTu3vG+Xv+taIs0sFboE=;
        b=l1I8co1kSVM8//GITouozg6bquEAT3umMLotd+IMNLYYKWfHObVXVb0Julkg76GhIi
         7a4DXMyrKWJhYaeQ4JLioW+3ILiqGs35/IwTQoa42a8YgMGujh1kh3juO8mC0OHA7l0r
         Eav/xDZWqCwLVTIQhvTK6rxSchFE2bWBrZ4iG2L0XFMPWWuwfu93h5PwDKQ3561lAjBz
         jgm+tibUzWSSC1zX9tOS95P+WK+4XKSQ6QllCSXTxDY8s9dKtiVohOGwpvbrJR8yErz4
         omMeN2e4V5hI84tyvvhiF/Gy/tj5eCQWYzDRgkfD5VTQFrsHDmsLTWGYKZ7BrCemtX3p
         C8NQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+mncb0Q/uM0UjtCzT98MimEgMmz6Dvl7z3IIJnAWhuzEz596otAK3CC1AgxAWdAvHOOHgjv4=@lists.infradead.org
X-Gm-Message-State: AOJu0YznldMgJraXFhtVfIOuuJhWRQyy/pQnqOWwHnKcelPt0WdTEku4
	ThErgADD2KPJgkXjMrKr2kJ5Acshfeijnl8LFKltkc1cCmWhcWVeKHpVG0IdO20ullMbNX35n0m
	8iqCkzi9o1lNw8xSeoHDrLfk0eaQnZmesrNkM1C/CdZnIMAVAWSDBU+cw8/pxXvv1
X-Gm-Gg: AR+sD11j0oPtnuLATGfBr/WH010KKgOLVWhD2gVU18yPAnQk63qeA9PidKjNAs5y2Xv
	ri4FckAoW9ZQFOCK4x3eIcLryNRDnrOKuHWVHaR7EOYCKKw3g4UMq0mWsWCNiNN9IZzOBq6bI1K
	d2QpTnqiOakoW3qfn9qH+8F9bdbWBdjfgOXLDHSrt+Qqo8xDJZt9ziiU9hovmdwBX8OjH/Bbkz/
	abVNUgc75KC+jHoBpCcTUxrb8GLjZRcae5XeBv2/tewN8dk9n9s4efGLUvSwuDbcRXd6eW8hzv3
	s7Quh4B3d8iZAOF/KBmeACNzbsqRPmJxsdiYR3kYY0SLG8xCf6FE1WWYLqg+CQJBX3ZiC7Ro0iI
	fSRV6GhHFUEym/Wn4ZymYsuERUF2Tr4GKu2UdHmHqb0nj/8MeQ9DzGNGm71qt8sWuLfjf5YXw9L
	JHYWtbnF4G4hr0CU1r0Dm5zLS28S3fWMv3UJTpqq+HnN7CYSGcBA==
X-Received: by 2002:a05:622a:4c14:b0:51c:2633:9ddd with SMTP id d75a77b69052e-52ce61eabd5mr171870731cf.41.1786027142944;
        Thu, 06 Aug 2026 07:39:02 -0700 (PDT)
X-Received: by 2002:a05:622a:4c14:b0:51c:2633:9ddd with SMTP id d75a77b69052e-52ce61eabd5mr171869411cf.41.1786027142285;
        Thu, 06 Aug 2026 07:39:02 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([90.85.108.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036276e58sm270552166b.28.2026.08.06.07.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:39:01 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:38:39 +0200
Subject: [PATCH v10 06/10] block: implement NVMEM provider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-block-as-nvmem-v10-6-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
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
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: xE5soDCZi0Q9wGjotvbFV-M5E6nmfMXG
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a749c8c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=JDRa4Jy4r6/BpSpxP2cCow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VT4XjZGOAAAA:8 a=71DuYGxFrHUPmPLwgxgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX5gULRdcniStY
 Qd1PMNpZ8YLkxSDrNLQnYzskOCDNtasqCP4+6z+hU6DXWgjC/3xtmQ+zfovU8zmnRWInxzFPs1S
 5I0j4c5zOruJSI3duFEOC58M4YSUCqVScfvaiuuvjfGxY+jxOnJ5vyYkb46y53HZ98SX11EZUBT
 9aVANQrQMlcNB9ZDL0WLJmJ7cDshAPadsAjn6jAvtgxmB+sQKbUgXnhXFmIlNugkY9v9EKBxsRw
 OhbljhPib+vVUdIy0s/K/pXSDx9ZrfsRSR5t9SBd5aCRymmc2FI956qC9k+F/DfbyVaQAemZyN4
 JP9ICtq9dt1geaE6axwQ1tsydzx+l1RqTH7FiZmnAS6cqgTHySDqx/zreM1jTfyo9BcrFtPmOeY
 AuSqc0CDQTDh/pXhpuPAlpCYoRlKcP6up4MzlEFG1D1Zv6G4BrkfJ8mgRLCDTqcUzvdz1UxKa77
 qjq9+o6qiT6qVMb/80g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX2HC3i3iqtBQ4
 OR5xzL38HRB5nP7ATrzPVXTR+SZj4hgwi0+jHGSFWJn3kK8yzkVCMTwsh6LA2SZPcBBMBOt44Qu
 8y67mI+339aCRCgtCe44GCGelE3ysB8=
X-Proofpoint-GUID: xE5soDCZi0Q9wGjotvbFV-M5E6nmfMXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_073909_896368_B3D0C6DF 
X-CRM114-Status: GOOD (  32.78  )
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
index 25af8ac5ef0f77c09b4d747827b275c32e9f2972..dad8f0d7a218edbafa9b6a03aed673657f3e8cbb 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -810,4 +810,12 @@ static inline void blk_debugfs_unlock(struct request_queue *q,
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
index f84b6a355b574af88c870938a8c69aeb9f8f44ad..0c9c5e5ea7baffa326a2d45b075688cf3a0edf5a 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -421,6 +421,8 @@ static void add_disk_final(struct gendisk *disk)
 		 */
 		dev_set_uevent_suppress(ddev, 0);
 		disk_uevent(disk, KOBJ_ADD);
+
+		blk_nvmem_add(disk->part0);
 	}
 
 	blk_apply_bdi_limits(disk->bdi, &disk->queue->limits);
@@ -704,6 +706,8 @@ static void __del_gendisk(struct gendisk *disk)
 
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
index 8808ee76e73c09e0ceaac41ba59e86fb0c4efc64..6ed173c649025b95cce9253b27f68f2c7dbab8eb 100644
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


