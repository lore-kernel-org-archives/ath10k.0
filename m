Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA96AC43458
	for <ath10k@archiver.kernel.org>; Mon, 29 Jun 2026 08:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OcTiSzV5CVcWs86Y9J99L1MrJ0Tbe0CLQ7Splzu1vMM=; b=k4V8T43d02qFGTl+7EYekb34Gt
	m7J1GkFf8CFjkyuy81jiEd92uMWqrZRE6Cip4jD7ckUYScs6UsXvaX8nz+tRHjQnGUCQtQt5r7znF
	Wr5JW6sHsY23uiNccOoh+CtF67QBhWjSRpZZkmtXaTP2hQCmJA4A1TlQUlDxfy4rg20aU1QrEPfMb
	pPxqRlZ1XOCqjIExfdvnwZiMIQ4g0tkFu8E+UnSaJDzoYi1xuCg6r5Zyaq4VcqSH2VQi7ShAOYQlJ
	ViLaFvEy3H27V/Q1H74cYbJNS7PUb0piqQF031OObR9wXCVd8uW2A9WJ5CZh+CaSgKq6Nag5ax8H8
	FEg4ZmDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7mJ-0000000E3O7-3Ncg;
	Mon, 29 Jun 2026 08:55:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7mG-0000000E3Lc-2bf5
	for ath10k@lists.infradead.org;
	Mon, 29 Jun 2026 08:55:42 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rAvd2134431
	for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 08:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OcTiSzV5CVcWs86Y9J99L1MrJ0Tbe0CLQ7Splzu1vMM=; b=pX86Czb9chwHGe5O
	KgsPZCxyZpBLOMDEILVpySAvlhInQ9T42c3DflRUase3EEy36NkTD6BXkcmL1BIZ
	jhGbCJBKonjAXwJz3oFL3roWfPPrfYWQCfMaQLyxkUGjlqW3ko3gqrxFhGVgDf0/
	FYIPFQCt7gMlXkDRuXYl3Y1SQW3me5kIBwdg/vEQx6g0LjTT342X2ylNAp5Y6xLS
	jp1Ku1wDOMpdrv+IxNFc3ch6FH07G5vyDDnJ5yn0XLdEUeSjUdtEw2WPMrP+x1eq
	JH0TI34ri/FXptbXl+cq78Fd1qypCpMQ+mKXrN64betuxuRXlQCbBX6PVAjX7FQz
	bxMERw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a5mpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 08:55:40 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-966a617821aso1484852241.3
        for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 01:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723339; x=1783328139; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OcTiSzV5CVcWs86Y9J99L1MrJ0Tbe0CLQ7Splzu1vMM=;
        b=eo1e1UcfuHORrqfcrYQEccolvAzCV7588HPwiqh+Ey0TgYKayAJXkvA1spFSw6DJsv
         egr/ugLAnF4V1HRnuTyCSC0JbuJObzsCxdIup6YkBb2XIx6Bi3Q6PhoM/Vsh1A1a1qTs
         w4NM4p974eq+fG0u8o6iawpYXgKIkB+1+S1w93WVPzokYUBc/AE1tc9cL6hqJ4FlkP3+
         /Nx8HASl67GO1rXm6+3hIrXlSmEQATH1khb7qvCpLcMdZkF7VABxgnNav2fovxMWzfbY
         e/Ce5lIu0GzastxVUw63YSEn0atiOObh4Y3W9SxWikkqQCzBCcgAyM5Q4zvOSxwtbR3D
         5Cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723339; x=1783328139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OcTiSzV5CVcWs86Y9J99L1MrJ0Tbe0CLQ7Splzu1vMM=;
        b=HNnZn8evC2j6UpUY8GDTy3OZmZXyOhhac5ygJZr4v98drtuCoZQHQaQCneCMw5thwV
         HoCJBECpxKvge80Hgep7u2Ycpakh8Xuk7LXGURXbHGy/uYdr0+p9UMcAhGpgfE0CZRJ7
         0Dh1VR5NKd9JpPzmXP7b1o6AmKdmpvFw+6ZH+EuXB5nv/uPH6gu+z0Y+e/9S5twRmjIo
         22ARvbRO88+CXTOqUkSJ1QcHVenGZteVM/C6GE9uETASrLORg9FCECVCK4wCt7fTpECv
         oGhSaegYA3tp0NqlrpJdi3W6qSZEUdpwv98e0OPSRvKFX/C3gYihjO4udsKOOkfLRnFu
         wj+g==
X-Forwarded-Encrypted: i=1; AHgh+RoTfB4H2Usy0LPufhqNXFWf/tRqqVy0k1E9sgvn0i1Z49FY7kpljkkehzA0iqOIyjgaJljfTQM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+kYBC1Vbq4UlYigy3olQTKnsDK2HEMUAhMsGVtHCZLEyWg+zO
	Nwx9o1ZFZuye2HKS45nANl1jxkqZ3VANi2pyqZwNDiaBrPGQL0P9/E9SlIJ+0I+26ww8AkxhKgz
	J0UnmC+0UzZ/scHBF4qLIYTwcjtX4bcBaYISG1HAFOzFA0qUYbmHUjKgChdNHMfFi
X-Gm-Gg: AfdE7clpU5WzpEbR8Qcjln51m9d0Ol5suTt4qYmFNhImBZGzD7CDX8mU1a8/WAmQM1I
	IaKjipNmZzxXziWmH24ehvodGi+LsVhLFzmw9BI8Lxx1OFlbX/UNVNMPar59IXuM/gpeDRRdn5I
	a//xUv/mAzy9VTEoZfyi3TWon9XcTrnbBoMGZC2P4059uQ6DZAI0rz/49cFrriRI1f9V3jnGI9g
	tvpniQp99LjoiK77XkbVq3uUjKCJtoqjsgbZ88pffVK3I7KmQyiRytGVhaG8FblzXTtQsxGIYOt
	C31zYcPjZ3xMuhj1ghCrWVKcRiEyLB3Mal9y+fpyUf+j/kr4rjaRvGXKIddFimDlHoAJ6UCqNce
	3WGwarkpWIXbt30rW6RfnXBcmNW0K+/JXhL8iocHIW6W0TGgCZRbXFhoZNXUGdnbNvTJk7ygtTS
	rU+2dwwZU2FOuLFIbq6STPt4z5deCqDMGUTad0fMODU5rKMncAfe1HExMnawMPFXyggl01mkeEx
	zMCi8w5QgIAEdjVFZ8B
X-Received: by 2002:a05:6122:4683:b0:5a0:5805:c8ba with SMTP id 71dfb90a1353d-5bd69d85542mr6116236e0c.11.1782723338946;
        Mon, 29 Jun 2026 01:55:38 -0700 (PDT)
X-Received: by 2002:a05:6122:4683:b0:5a0:5805:c8ba with SMTP id 71dfb90a1353d-5bd69d85542mr6116214e0c.11.1782723338384;
        Mon, 29 Jun 2026 01:55:38 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bc8016sm6558981a12.25.2026.06.29.01.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:55:37 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:55:24 +0200
Subject: [PATCH v6 5/9] block: implement NVMEM provider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-block-as-nvmem-v6-5-f02513dcd46d@oss.qualcomm.com>
References: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
In-Reply-To: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfXwTK5W+IyOEUK
 7PHFOlKhURv/ABgIfViMGfO13PvRf260VIdYkyovMFYb/wJmi1+ThhFm29k+aNGHsqwapyWiAE2
 TV77bvSjlemh2huJK+Mt7FhbiCKy6fgUvXtv3lk7d496UibuYOO4TC0j2QE13Q+SGkG1ogWBAEw
 rPXssJGjEuby68xcWtKgqLFSYDXrwA0wcrcUrAem5VZI3IKceLTxvmzLEAAyzWN22Dtxp4iOGbT
 trJsSLE4TBBfUC/H4y038WWsWFeNwVgeb9DHg7TR/viQf/oFNx2eFCXkystO0I9jfvdlOLJdFgN
 FXycA672GfjE6nkn302IfBM/Jr8CbA8WzQ/A3SK5MrQKeZ8POUUJHTnp3SrPQwLHDUY1fRny6U+
 m45CVNCcDktvfiurxu8RRn4sJhRpVcFGT75Z6igebgATLOZXM+sIbzoSiPPU/zIgGRu4rmagTUf
 OjQk6hTZIU1TZLciLXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX9axilcLCw8C2
 S3ALeyhOTmCkVrcErRg8Yts1zQdQU6kfyP1H9F4FjjGGE7JKSsyfXf8tqqVt2iVDiqZEUjYZJAW
 +ge53ZV6HSFQzi9vbIFoCj7rFV/JhQc=
X-Proofpoint-GUID: n93ZgLL2Fpa5g_4sbHh8v5mt_nhnZ9nR
X-Proofpoint-ORIG-GUID: n93ZgLL2Fpa5g_4sbHh8v5mt_nhnZ9nR
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a42330c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=QS6QONgytJYYblx7mpIA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_015540_676401_B25C19D2 
X-CRM114-Status: GOOD (  28.68  )
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

For now, NVMEM is only registered for the whole disk block device, as the
OF node is currently only associated to it.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 block/Kconfig             |   9 ++++
 block/Makefile            |   1 +
 block/blk-nvmem.c         | 111 ++++++++++++++++++++++++++++++++++++++++++++++
 block/blk.h               |   8 ++++
 block/genhd.c             |   4 ++
 include/linux/blk_types.h |   3 ++
 include/linux/blkdev.h    |   1 +
 7 files changed, 137 insertions(+)

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
index 0000000000000000000000000000000000000000..4b35a74255059320ef0cbd3c0003f1510bae5733
--- /dev/null
+++ b/block/blk-nvmem.c
@@ -0,0 +1,111 @@
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
+	if (!child)
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
+	if (IS_ERR(bdev->bd_nvmem)) {
+		int ret = PTR_ERR(bdev->bd_nvmem);
+
+		bdev->bd_nvmem = NULL;
+		dev_err_probe(dev, ret, "Failed to register NVMEM device\n");
+		return ret;
+	}
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
index 8808ee76e73c09e0ceaac41ba59e86fb0c4efc64..ace6f59b860d0813665b2f62a1c03a1f4be94059 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -73,6 +73,9 @@ struct block_device {
 	int			bd_writers;
 #ifdef CONFIG_SECURITY
 	void			*bd_security;
+#endif
+#ifdef CONFIG_BLK_NVMEM
+	struct nvmem_device	*bd_nvmem;
 #endif
 	/*
 	 * keep this out-of-line as it's both big and not needed in the fast
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 890128cdea1ce66863c5baa36f3b336ec4550807..f15d2b5bf9e4fd2368b8a70416a978e22c0d4333 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -30,6 +30,7 @@
 
 struct module;
 struct request_queue;
+struct nvmem_device;
 struct elevator_queue;
 struct blk_trace;
 struct request;

-- 
2.34.1


