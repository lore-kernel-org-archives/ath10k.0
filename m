Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D41CD8CA7
	for <ath10k@archiver.kernel.org>; Tue,  9 Jun 2026 07:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMh93vm3egRnMVo/u4zkORrzzjLIq42iI82oCTBPTEI=; b=nAtuoC8Ilnm5qZiZ/aL2uxAHPn
	DvEbu3yTQ+3j2R6MchekYHF/HKA+DqqV0v79h6PZqSQavsnSjfgTJO8azHHufgAdgRWrNbfhnmXOT
	nvWbOAHw0kUoOOcYgu7DuQS6vewm7FE1G7DraQz72RxH/9KHft3LOyDtaYxxnSRo436lC6jTwl8Ju
	AsdZyGMcZ+h7VmbyhEYtSQndhs/5SKSAzYLijmmDCVsZ1hRtmTKvSv0/7g8m0FNVAKTfx/USCJll1
	ywBb0hKM1WpXfy5bvUQRVCookprT3O4Ig+U6/XevLtRfd2TbAm9wtprbwibLpzecui8aT7XdJJlhw
	D+vqFlaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrH6-00000004zn4-2p0Z;
	Tue, 09 Jun 2026 07:53:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrH3-00000004zke-2oto
	for ath10k@lists.infradead.org;
	Tue, 09 Jun 2026 07:53:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rOdD1517659
	for <ath10k@lists.infradead.org>; Tue, 9 Jun 2026 07:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMh93vm3egRnMVo/u4zkORrzzjLIq42iI82oCTBPTEI=; b=nhlzDDIK49NjGM7u
	e2PSjBmJIGKIWvCfTnk67JWHJ9Y6TFJlMPNk0Y3byb1iVn2pvmbKDTq6FDQt83Y6
	wayhxnRgDSjAk7i/B+dCm5NtWo2jnu//kftijgs/cWhzgn1dks6D9+LEEnze5aHg
	9ei5fqC81hF6Uu/n9diNdARwOVyQA1l58NN0Iz5RHSBof1PEEA7EHzo7xoPjU+uo
	XQcugnRwIkMu6UG9Qsh4xlQtS5djE13aIivUnlPeV0NkkIiG0kA71k6Upk31EmsN
	yAqQIzZ1fyDJnBEaIrWmNd7TnKaL0HVCt7uBFLjUinhXrDi25J+oeP/E85YA7vkO
	2xmQjg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr81er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 07:53:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517615db531so143877521cf.1
        for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 00:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991604; x=1781596404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bMh93vm3egRnMVo/u4zkORrzzjLIq42iI82oCTBPTEI=;
        b=OYeQKPfi/hVur2eaX9ktJONDVbnKCN8wKlTlmVeFyJYA9JNmYMOMS4dRcXZY8Fip1K
         X0p250uk/V7L/f1cEYCuze68ZCX8cHmli+tTL4hkEWj9984QPato8wOxn2gjAEP3NyH3
         d+3M5wpVZ+PHCn0ROP5AHkPErOgUYbrIo82GVkmiHW8+fbuAKIHf0EdUNpBRAR9Gystk
         Yc6sFc+0fWp8/lnwA2DkCQkQt/1VzJ7Swmwi6usGeJlO2WYoACpxfUChyhVOa+Lncr2Z
         hIkHCShZgAbkRlEWGfVdOGTZUWtgILblKv37f5wHOclV3IcWHWFtuhnTlTcgG6RcOp+d
         uc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991604; x=1781596404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bMh93vm3egRnMVo/u4zkORrzzjLIq42iI82oCTBPTEI=;
        b=WZj5Asvwlt9j9P/kqNu0WoA7xi7V/EnU5a2Pud+9rhexJZatTZwwz+YhV4szDY/rcU
         NVfm7CN9QIn4YSr9g7MQcsayaiE8AhR5TXAsBE4slnLlp8nFyfQzieAqNUZPEypPzUi3
         JFrNxLJsSp+JNIQFlU4wLkTVlB4L2/RTRcig5rP3GPQMFokfnphNB8B5xVSMLzYPm79b
         Ph+ix169yaQ/0slqChw/a5QMkPI/pi+C1oenvC4VFBz95CuqgNUKwvx5FUNIi0cMh00t
         S9MhAqUNZgnEhoAsjy32ySvI0ZpVOofOOIEBNvE7YP304WsN6ROHykCZYIVXUI+GVPXH
         9aTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+D3yvgFNwl1q4i/ANf4piJXPmIJc1KTc4MrOSg/hSVfTtfKb+mB+1Wdx6VXW9gszcEAu8os34=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi1rnaeR8fI9QSod7zLS7iEt6WmZk1rjcnVVL1HK5jGWafZD/q
	b9dFqppTtq+qrlSKGe6IOb+XsJdlPpv6aIRdV1ileFWIgg4o8ONl2ExSuLOJzPYpsKKXervFGdE
	lGN5upjSu9ZsyvJy0pLuMiObpNyzegIy4QEXRj7vAXjceR9IATOtQNZxM7drJtoLY
X-Gm-Gg: Acq92OHpw+5y6IG/pFzni9eiQ/9/U8QEPxuM0p1xDff+tv1V1go0r1+PI578znK8LRJ
	+GYldh0bWICNia8+e5cIcsHKk1HqKeQU1JW841Kzk8oHdJRTf+KhVJz1u4F7SUB2DtpDyxFo1lM
	Z8SK/lWz1bN+KhNVqWYOgDSIb78fUqtOWVQ3YFPm91Vyp9rvFeP49Jgb/ms4YfbYEAAtGzKGquX
	vwAaQ/MTXJfcAO49zEx6QfDgwdNXiDPiBdIPcTEWglihCcG0lvw88/bK6M2m5ntCxB9CtHC8GTV
	RdQ0O1ceH8+rRrsXQnyMIMfeUaP0BcU31u2R7pDKBMwEeto0+/W8Z2PnZazKVMn2rpOHCCooZTF
	7ZaYBdvvwtnjKrc1EWFAtYL3id0TvtrMBXt4cC3ZVVevyqHcDqPRCUjNnSMaQhkAegN29MHaF9M
	4r847c86IYtnda0ZKZfq+QofObNhicMg+7JeU8PX6fn4rJcarcD/eH1vbN1kViefvHutfcooFlc
	qwFIneJt+j3
X-Received: by 2002:a05:622a:2b49:b0:517:8c0b:66cc with SMTP id d75a77b69052e-51795be3940mr295717941cf.25.1780991604156;
        Tue, 09 Jun 2026 00:53:24 -0700 (PDT)
X-Received: by 2002:a05:622a:2b49:b0:517:8c0b:66cc with SMTP id d75a77b69052e-51795be3940mr295717581cf.25.1780991603748;
        Tue, 09 Jun 2026 00:53:23 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm8121631a12.0.2026.06.09.00.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:53:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 09:52:29 +0200
Subject: [PATCH v4 4/8] block: implement NVMEM provider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-block-as-nvmem-v4-4-45712e6b22c6@oss.qualcomm.com>
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
In-Reply-To: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
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
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: oMLT3ThmCkHgTloVUdxrJdW54KYEfNNR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NCBTYWx0ZWRfX3ot1kvKkkDMY
 cYLdikQjTygHkh1Pp/YY3woFsK47eL7r73x/WWdYBf/b2nMxAT7W5urIc7cGw0RXZWkGYJhDJND
 NTK5jrEyE2g0NQP1lZa3XP3LIQJxXMsljG92kanMBdLTlPVh9brPwRbm5RMH5JUdhfwKdJWecqc
 pcbSPHfuNAbX5X2pJGms9kKbXlNDVUsStg0yCdhNKS/eAYSB6mbnXhEO6H29Voq3NNXSKWUKHbW
 69f1XID21N83aXspNSIoMyEpT6WCHlGaOJIaO0DjRgRbBNFHZ+ZoIMEpgPAhbQbOu1XmbMxOV5l
 cghM5KwXx7fxLw6ivS+jpOL3fIdydD+T5GQ6yjiRNDmlj8+t1leOpIUx/IMOBF4FGLKWeaNGkCb
 4jw2DEOeY5TeMj6zwK2gihVNIi0rZcmn+LSHIJDjCE/jQ1E3jLz1TzZu6iAwuqvEE3gCo/OvbaA
 8GNRT4Ozqx0rf1RqZxw==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a27c675 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VT4XjZGOAAAA:8
 a=EUspDBNiAAAA:8 a=0xOXAJtWE3glxeOP_3AA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-ORIG-GUID: oMLT3ThmCkHgTloVUdxrJdW54KYEfNNR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_005326_234386_B8808AC9 
X-CRM114-Status: GOOD (  23.84  )
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

From: Daniel Golle <daniel@makrotopia.org>

On embedded devices using an eMMC it is common that one or more partitions
on the eMMC are used to store MAC addresses and Wi-Fi calibration EEPROM
data. Allow referencing the partition in device tree for the kernel and
Wi-Fi drivers accessing it via the NVMEM layer.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 block/Kconfig     |   9 +++++
 block/Makefile    |   1 +
 block/blk-nvmem.c | 114 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 124 insertions(+)

diff --git a/block/Kconfig b/block/Kconfig
index 15027963472d7b40e27b9097a5993c457b5b3054..0b33747e16dc33473683706f75c92bdf8b648f7c 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -209,6 +209,15 @@ config BLK_INLINE_ENCRYPTION_FALLBACK
 	  by falling back to the kernel crypto API when inline
 	  encryption hardware is not present.
 
+config BLK_NVMEM
+	bool "Block device NVMEM provider"
+	depends on OF
+	depends on NVMEM
+	help
+	  Allow block devices (or partitions) to act as NVMEM providers,
+	  typically used with eMMC to store MAC addresses or Wi-Fi
+	  calibration data on embedded devices.
+
 source "block/partitions/Kconfig"
 
 config BLK_PM
diff --git a/block/Makefile b/block/Makefile
index 7dce2e44276c4274c11a0a61121c83d9c43d6e0c..d7ac389e71902bc091a8800ea266190a43b3e63d 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -36,3 +36,4 @@ obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= blk-crypto.o blk-crypto-profile.o \
 					   blk-crypto-sysfs.o
 obj-$(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK)	+= blk-crypto-fallback.o
 obj-$(CONFIG_BLOCK_HOLDER_DEPRECATED)	+= holder.o
+obj-$(CONFIG_BLK_NVMEM)                += blk-nvmem.o
diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
new file mode 100644
index 0000000000000000000000000000000000000000..a6e62fa98675ee9bcb9c7035a611b5a573ab9091
--- /dev/null
+++ b/block/blk-nvmem.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * block device NVMEM provider
+ *
+ * Copyright (c) 2024 Daniel Golle <daniel@makrotopia.org>
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Useful on devices using a partition on an eMMC for MAC addresses or
+ * Wi-Fi calibration EEPROM data.
+ */
+
+#include <linux/file.h>
+#include <linux/nvmem-provider.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of.h>
+#include <linux/pagemap.h>
+#include <linux/property.h>
+
+#include "blk.h"
+
+static int blk_nvmem_reg_read(void *priv, unsigned int from,
+			      void *val, size_t bytes)
+{
+	blk_mode_t mode = BLK_OPEN_READ | BLK_OPEN_RESTRICT_WRITES;
+	dev_t devt = (dev_t)(uintptr_t)priv;
+	size_t bytes_left = bytes;
+	loff_t pos = from;
+	int ret = 0;
+
+	struct file *bdev_file __free(fput) = bdev_file_open_by_dev(devt, mode, priv, NULL);
+	if (IS_ERR(bdev_file))
+		return PTR_ERR(bdev_file);
+
+	while (bytes_left) {
+		pgoff_t f_index = pos >> PAGE_SHIFT;
+		struct folio *folio;
+		size_t folio_off;
+		size_t to_read;
+
+		folio = read_mapping_folio(bdev_file->f_mapping, f_index, NULL);
+		if (IS_ERR(folio)) {
+			ret = PTR_ERR(folio);
+			break;
+		}
+
+		folio_off = offset_in_folio(folio, pos);
+		to_read = min(bytes_left, folio_size(folio) - folio_off);
+		memcpy_from_folio(val, folio, folio_off, to_read);
+		pos += to_read;
+		bytes_left -= to_read;
+		val += to_read;
+		folio_put(folio);
+	}
+
+	return ret;
+}
+
+static int blk_nvmem_register(struct device *dev)
+{
+	struct block_device *bdev = dev_to_bdev(dev);
+	struct nvmem_config config = {};
+
+	/* skip devices which do not have a device tree node */
+	if (!dev_of_node(dev))
+		return 0;
+
+	/* skip devices without an nvmem layout defined */
+	struct device_node *child __free(device_node) =
+		of_get_child_by_name(dev_of_node(dev), "nvmem-layout");
+	if (!child)
+		return 0;
+
+	/*
+	 * skip block device too large to be represented as NVMEM devices,
+	 * the NVMEM reg_read callback uses an unsigned int offset
+	 */
+	if (bdev_nr_bytes(bdev) > UINT_MAX) {
+		dev_warn(dev, "block device too large to be an NVMEM provider\n");
+		return -ENODEV;
+	}
+
+	config.id = NVMEM_DEVID_NONE;
+	config.dev = dev;
+	config.name = dev_name(dev);
+	config.owner = THIS_MODULE;
+	config.priv = (void *)(uintptr_t)dev->devt;
+	config.reg_read = blk_nvmem_reg_read;
+	config.size = bdev_nr_bytes(bdev);
+	config.word_size = 1;
+	config.stride = 1;
+	config.read_only = true;
+	config.root_only = true;
+	config.ignore_wp = true;
+	config.of_node = to_of_node(dev->fwnode);
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &config));
+}
+
+static struct class_interface blk_nvmem_bus_interface __refdata = {
+	.class = &block_class,
+	.add_dev = &blk_nvmem_register,
+};
+
+static int __init blk_nvmem_init(void)
+{
+	int ret;
+
+	ret = class_interface_register(&blk_nvmem_bus_interface);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+device_initcall(blk_nvmem_init);

-- 
2.34.1


