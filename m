Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5FFC43458
	for <ath10k@archiver.kernel.org>; Wed,  1 Jul 2026 16:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ruF9ANzInv8cVmA5nRWoHkeo1OOBUskTgPEB+I0ZmEc=; b=YQqvuODXiNkgY02MvkJJELruN9
	7pTFXh82OHBHwiEOI7j9vu3/TBAtEH2PV/du5+MMqvOj9pin9B8+r3mGBReHcup7MuhmvH87z5WD2
	RXnF8fsVai4sHKzLYlfxURgzmAIFRfonCQmdsbsC3TLiFsgZubIGRUUFEe2hd0kx7w58XdSe+7HYA
	SZD8GlRs+DrdvBIwwwP5TWugMEQq1WoYOErNHjOu8P+AA6ubg3Hi7bOZEfGdZ5ZpMfxtXURtbh4ae
	q7e+/hfloGE2DCm9a6TC/SmU+QG0ETqSTfEx9hqSlwKEN157QpTv8Sh6zq92DtVWBHT91CY1Na+PF
	9JRelKHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexMq-00000002SgI-1YG0;
	Wed, 01 Jul 2026 16:00:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexMm-00000002SdY-26DU
	for ath10k@lists.infradead.org;
	Wed, 01 Jul 2026 16:00:51 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoQot1513691
	for <ath10k@lists.infradead.org>; Wed, 1 Jul 2026 16:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ruF9ANzInv8cVmA5nRWoHkeo1OOBUskTgPEB+I0ZmEc=; b=omlpQsSr1sOyXZ+r
	KQ0kNoc7sLp5coqaxzsAE06W/YYe1Dyja3tUHpMfFosx25/rgMdpfKrckoSSSV7E
	hZyvCCkKGn+cPoRC+Vs6Xd6CqQ7+QnO7JirFDkCPxbtFnkNJ/gnW9lSbDdpzeCGc
	rs9TX1O6gL3ZAtzPoN8LgFPUMEHdQOwZnwwbCaxW3aDrhEWP3nPTmSw/seMiB+dR
	aS2d7YfFiNpL8z9jf3wlW2L3yDYvkm8PYyZuvz/c07XhWyMYnY4I446LtR008FwM
	TUN+Kpmhc2V0QyHwKOOdWaBmRNStyQQi3ZPwi0k1yo6HIEAcrhcon67WSC61+JSn
	Ed1blg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwcxqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 16:00:47 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73a8aba30a4so732434137.0
        for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782921647; x=1783526447; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruF9ANzInv8cVmA5nRWoHkeo1OOBUskTgPEB+I0ZmEc=;
        b=a9nMxfDJYUdnz4SBwnMNfDD+Imi9QhzSO2+vYiJw6XKXETNZISMiUuImdphh3I46H4
         okXVrJ/LGqYaHn3tiFS6dVZm9A+T+nDaVEkZbrHuVyfnsohbvPn3CQ6WWsvsfogc3vEX
         xZcM1xtx2XOsd0FOF3R3trEpLTZ81xeT/rdF3hXd6+lBns9G+MzbxRe/8UFmym7E7+1X
         RRDDxxD/kl2/qbDuGd5gdPXDRNR1YSqwak+4vvnm+/vCSe8mdnKNnHvmADdh3J8CZ0C9
         JQag+K1Y2MRGH8ZYVE28RZ+quPZ1CrCszvkKRzE6Xakk6Ds/Cz7ky26N0PCkdnLxEFv5
         GSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921647; x=1783526447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ruF9ANzInv8cVmA5nRWoHkeo1OOBUskTgPEB+I0ZmEc=;
        b=lz6EJono/JCj2IsEWZHbKiMed6eekPpW++BWEQGPD3CYVDj2MlKCObaCnv6Z6ge9hQ
         W4ABby+7bxaX4F47QEAXHC5t15mAfJ0WK6xsoT/J6jbiUr5IorDGqgiv2u8KmXBDIF+i
         4S+uOSX92bKt5HuaLnJOcLlfduG6fc5vhKftbmOdwoUpOIoWQyKvMsoBu6W3Hb7h35fo
         QQLrdaSTQiZQF5Q6s0lTkFk1zFd1Eai1qqiPH2hRN+pAI0nRn4ilaLzPuAE+wz9QBov+
         zJyF+t/xeEaA1EY6DneHn01pfuHbw9yodxjxuziWb5IZUAnLR1v61Y/FQzVdEspHZhMY
         vkUw==
X-Forwarded-Encrypted: i=1; AHgh+RrUsjL9Y5eJ3xH4C7AZGrh9fw3mGk2rthH02IDxz8/BecpZZdnlEs81UEqLeJ8nYqonQBNuaWk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy2PvP4XhyExTZQPcJ+UuPqgVZ5EYC1Ma5/aEykLJ/5O48OBwW
	bkHrW5k7EWWNaftXK8XSUBeiajV60eGvUUH2UrMrJuqpZGGWdMCd0EPFwgUkJnLXEIg8iVG5mh0
	Ly348eRBiG9TnFj35qShuYjUxIx6YPtF/SvIqG1IpBcwFNSSbA00wSkpVoLr+MOIU
X-Gm-Gg: AfdE7clLhKbSl7NHIHvlQB2UcorAQhRJ4uK+IghTEznb1nZkJ9nqtKNghbzhRaYMN++
	KKchXxFGXCqql25bhs8ErG4X+bghjJ23z3c6jdyeAGi3/hM+uoTdFGAu/JMo5YsnQh5shmW4tRD
	k2KKCrdiexMOmY7/l+SAJlB2DPW/DdxGPKmyjeb0aN+SdJ4rXfzaktL78feChB9b4pOO3hCVpaA
	kod/tK+76nVwkOF06VoQoHmyvzzD9emCcpWh0EfgWuCDQTrXMIsgzb+eZU/TTCVmZmTemmanwYG
	lEVdXpN4txSYeNVQUqJtwidQo8SZ9uQVeVedzv7cyIGzvPyVNIu5F9jlw51UmnXHf65/Ta0B1v1
	iO4dhDjUrZd1IPGAL9lTKoHTebE6zE2nmUzLKgtf0L4xaFJXW2QQR7DA1Z+TRB7G1D/t9NpZe3a
	VIC6pao7OIBnfSJvfumHRJm5Hv4JX+95kFXtdW4mCNyUT/xJqQACPQOJM3GUfjbAw=
X-Received: by 2002:a05:6102:1804:b0:735:d53f:259e with SMTP id ada2fe7eead31-73bd2842dd8mr1872853137.5.1782921646455;
        Wed, 01 Jul 2026 09:00:46 -0700 (PDT)
X-Received: by 2002:a05:6102:1804:b0:735:d53f:259e with SMTP id ada2fe7eead31-73bd2842dd8mr1872784137.5.1782921645053;
        Wed, 01 Jul 2026 09:00:45 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d19e03sm296613066b.4.2026.07.01.09.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:00:44 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:00:29 +0200
Subject: [PATCH v7 5/9] block: implement NVMEM provider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-block-as-nvmem-v7-5-3fe8205ef0a8@oss.qualcomm.com>
References: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
In-Reply-To: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: UsYrp7KQ6hILStX7v1KYDEbG9bQ6V4J-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX6Hl4qTtX2plh
 PgBI2Ceo6PiV0EBaIxJQ7nnzV7AhDFBa/sjJdKqaJuSakDPk81q5Iot2p8a9gg1TBZK0ZWEiX5k
 ehG8EOSQUUk+RR6mYTl2EwKQaKXWoys=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a4539af cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VT4XjZGOAAAA:8
 a=EUspDBNiAAAA:8 a=QS6QONgytJYYblx7mpIA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-GUID: UsYrp7KQ6hILStX7v1KYDEbG9bQ6V4J-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX4sm8MPkw9xCq
 TCrBC8eaBWs8ByZy6D8TsJ2comryH5Q6rzi4FeQEnFgS8dQ9kctLbl+tbdbvM60kmT1fty1lUBk
 zlwF8YUj+snVwarkWzsToq7MMBW1zV8bRGXKr8dl8t709kFs51SxpIOrh37cyCB0uYFXIs2ls1v
 jgVSuYEXgNNONoBfVBl2IpcT1IL6WX5RS+CWMXPKhmc05Sa3zlHvvWqj7HVA6R66SUpNhnsWgj6
 HedUIBCbbpzWNam36E8x6wUrJJoCqr0XKcgJZfAupOtbs9pN0CgwEkyALI3sHVw27TKHlyUI1vG
 t3bJJEZgb1nC9sqZMNMkWNxvarxvZ+rAo90vfL6e5AmLYaMJHIfJXvL/gsOc4qLqjGGMRO9h/LW
 A8ZGugALjRK1EFstoGX8fMljTz17CjveJVQi5qFheMwpHXl+9AeFpzzY6js8HTQFxKmU/3paIRD
 CR9+Jb4ixDW1FrzjGvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_090049_583733_B3349CB6 
X-CRM114-Status: GOOD (  28.49  )
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

NVMEM is registered for a block device whose OF node describes an NVMEM
layout, either via an "nvmem-layout" child or by being a "fixed-layout"
node itself (e.g. an eMMC boot partition associated through its mmc-card
node).

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 block/Kconfig             |   9 ++++
 block/Makefile            |   1 +
 block/blk-nvmem.c         | 109 ++++++++++++++++++++++++++++++++++++++++++++++
 block/blk.h               |   8 ++++
 block/genhd.c             |   4 ++
 include/linux/blk_types.h |   4 ++
 6 files changed, 135 insertions(+)

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
index 0000000000000000000000000000000000000000..49e9b5d4410d5e935c4ad9674c6909453fe027ff
--- /dev/null
+++ b/block/blk-nvmem.c
@@ -0,0 +1,109 @@
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
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/file.h>
+#include <linux/nvmem-provider.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of.h>
+#include <linux/pagemap.h>
+#include <linux/property.h>
+
+#include "blk.h"
+
+static int blk_nvmem_reg_read(void *priv, unsigned int from, void *val, size_t bytes)
+{
+	dev_t devt = (dev_t)(uintptr_t)priv;
+	size_t bytes_left = bytes;
+	loff_t pos = from;
+	int ret = 0;
+
+	struct file *bdev_file __free(fput) =
+		bdev_file_open_by_dev(devt, BLK_OPEN_READ, NULL, NULL);
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
+int blk_nvmem_add(struct block_device *bdev)
+{
+	struct device *dev = &bdev->bd_device;
+	struct nvmem_config config = {};
+
+	/* skip devices which do not have a device tree node */
+	if (!dev_of_node(dev))
+		return 0;
+
+	/* skip devices without an nvmem layout defined */
+	struct device_node *child __free(device_node) =
+		of_get_child_by_name(dev_of_node(dev), "nvmem-layout");
+	if (!child && !of_device_is_compatible(dev_of_node(dev), "fixed-layout"))
+		return 0;
+
+	/*
+	 * skip block device too large to be represented as NVMEM devices,
+	 * nvmem_config.size is a signed int
+	 */
+	if (bdev_nr_bytes(bdev) > INT_MAX) {
+		dev_warn(dev, "block device too large to be an NVMEM provider\n");
+		return 0;
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
+	bdev->bd_nvmem = nvmem_register(&config);
+	if (IS_ERR(bdev->bd_nvmem))
+		return dev_err_probe(dev, PTR_ERR(bdev->bd_nvmem),
+				     "Failed to register NVMEM device\n");
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
index ec4674cdf2ead4fd259ff5fc42401f591e684ee9..ed0c10168ba7be10855509637f824a9cea2b9ccb 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -757,4 +757,12 @@ static inline void blk_debugfs_unlock(struct request_queue *q,
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
index 7d6854fd28e95ae9134309679a7c6a937f5b7db8..1b2382de6fb30c1e5f60f45c04dc03ed3bf5d5f2 100644
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


