Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A392CD8CA8
	for <ath10k@archiver.kernel.org>; Fri, 12 Jun 2026 13:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WA3j5D2UTvJeMm0sKJI/fgSeryn3GsGPtg1BAGqRz9o=; b=N9+MMCthixfvjFTrPuUyohjaHM
	uMD8CxvY0O1zMO+u7jN8BM4X3tBgXn8q7IRV+kMbGUpTyu+KQtFIK+EGUT+YW9bcKy06qScXQQWZ5
	AFVmL0ZSum32NUt0n7O09udVk4HmwUcc7+K03Ghsu/ktFaBe0GNJNzHZyfB4pArpb7oQk8zTs9Dl4
	AY8IEW/pUJKlhghRTAr0zE4n6GfxB8P9FMMNVwDMXjVGd/jLbHN/sZ/qUWa24UFU0PTUO/fUYIzBq
	s8wFFChTdpmIH70MkEO/WbZRb0NW38GN1WRy55nWudNEJFlO93UQrNPc4/Ytr2qAgtdKJPgbUpD3p
	2HWEq79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1p0-0000000Awwx-3izf;
	Fri, 12 Jun 2026 13:21:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1oy-0000000Awtn-0B5k
	for ath10k@lists.infradead.org;
	Fri, 12 Jun 2026 13:21:17 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj0cS3617539
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WA3j5D2UTvJeMm0sKJI/fgSeryn3GsGPtg1BAGqRz9o=; b=UXPv4vG6UW7DSy/F
	p+Csfp/Xgj/fdj7Pl6lFTvxuCHZpG0BaDgnTcFWCTGWnsaF+q2JOb7HBj2s4kEQN
	oH32LJ99f+p2UOBZiLVPMnK6iDIvSd61kP0rpPye1sddlUGszwiKi5nGtjCJ2ocZ
	TR+nXNy5DBjEurEck0cr/aWBwyurge0jXsiVSa0JtOQWb9yS2xeve8q1Knt5HNyb
	gdyyNFtMzW5z0jZjnOGq6k1kAOUcAhnkOuXe1MYVq9uBItznisQMzVyRr6rAVr97
	HiQdyX0/PDdKK5KNmserwSqyFnpAZ+xpJ3L2k7Iu/s07I0JLuHq+ETwZecESy+ys
	KHAbTA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30gawya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:14 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6ed99d4dbso1211254a34.0
        for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 06:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270474; x=1781875274; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WA3j5D2UTvJeMm0sKJI/fgSeryn3GsGPtg1BAGqRz9o=;
        b=S4wPy8J8jNAIvDxAD6IepIq2o5lchYMvqp3IDjEswtEw10QlmoslCJ05gV44vrlEPG
         n/dP+CmjaMz93hq+QAzwfO25kKmMu8I7T9erAFWyoJws5H9zTmW005L+l8GeoodAaFz0
         eRc3ali0i2KIbeszfjeBWdPYneOyl69eD4y2cU8tyrxdWRuxTaXlgd7Yi5a5Aj5PLISq
         NbXS41ODxvaYAXd9gbu5Wk+NrnOvQ+hj1vXUmv7+ZKRJkiJpbx9EP16Z7utPOFivptW/
         I+8ZZf1n5qf2MzShpW4opAnGcyULD5zCkOff9M6lxu1Si64Kki19SNPYO3NzgrWTUxHR
         XnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270474; x=1781875274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WA3j5D2UTvJeMm0sKJI/fgSeryn3GsGPtg1BAGqRz9o=;
        b=hHndd6ZZsd8lbG1ZOENUZ02NYDN4dRgtKdDHTtCM1hQxzHFzrOiwhB9qP169cDE+kh
         j/hR9dc8niW9LzdOEHAPFT0wJp4hJ6QfjuTqOE5wA38/76viNuvAsi037GL688Jcaqc9
         zVkH/bb9oKqrZP2diQjWLpaFgbEMWQ3ZtzjDbN8MLdMlXaTqGiKi+YgHmdsR1Gf2hD9Q
         aiTNRVeYmEtrQcJwG09d1JYkhjL78HPmqgyJz6gSPxkVKzXnJyL7vsU0fMtilnz2Bq7F
         IsisNpTSiab0fBMqh7tlUqMFuehS+QphWp4blc2Gy6ZJjwJMYi1AeS7lDau6hZtd405X
         AQjw==
X-Forwarded-Encrypted: i=1; AFNElJ8bVj9MVqOMFzrE5SlKJhBlStkfrDcdqWtaua1VjO6rzHgm5RxbsDQTw/LLMEzqbJwIQg5zsms=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/4ARhjsXaKUCfo7pkcXL/cN/KaAvb9dNBoNK3uETzXxJ4h29Q
	sd90/91CuoT6INtXQ6GVPU0mAShUBNg1nLMQdWgGtgp7elyOoXNrWESZLF3bTyV7rAcagn7B+q8
	WhZQT345lVmtJyeffzYJoVEZHE+CLNHQNtBrdCyjIYfvtnNpD6IwKrQoBVmgReMEY
X-Gm-Gg: Acq92OEhQNjIsbmC7heSib0HT8jVlD7R0GqdDdOvUGpZPJAwJgqPPbxaJw0d12HMsRH
	gMts0epqyRl0CURnMOR/0mdYG9sAmcICTg3xD44QSS0hOUmzYaVuTlgykNtfvuz5bI0EytAN68W
	QrEfhe9zHS1TDB2bT3JmkqwVHWRVzsqT7D8Io6H3XhMaQKDyaBPYKeoR1Z7ggisRzaO3mRBgtye
	u58pwzZzH+JR8YkDI5ISGz3JSbgY8KRip25b64JlblCBF050sSeqDBMNPSlEYfvtAXtmuxHgfQX
	yW66NkNCUHFYatZPw2DsiXStTalGniAY8cxA0escoMTpmv7WQHP/ND8MWkoeAaLh9iL2aLQ2lBS
	bYx0zqS49TTgW0mXVjfGhnerDVjo3t+0NPfMvclxenNxX0u/RaNCCVDlj9xMSjhU2pDbOZlpLow
	8GZlKBIZdtKi6V8MzqmT0w5HHEXBKTXmGVrk/rpcxM3WDMco8lOtue/SrqlFDabAYi07Pwg+HC
X-Received: by 2002:a05:6820:2108:b0:69e:98c0:a9a with SMTP id 006d021491bc7-69edc62d4fbmr1893546eaf.12.1781270474204;
        Fri, 12 Jun 2026 06:21:14 -0700 (PDT)
X-Received: by 2002:a05:6820:2108:b0:69e:98c0:a9a with SMTP id 006d021491bc7-69edc62d4fbmr1893500eaf.12.1781270473640;
        Fri, 12 Jun 2026 06:21:13 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:3510:32cf:db6:13c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm59986866b.1.2026.06.12.06.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:12 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 15:20:57 +0200
Subject: [PATCH v5 5/9] block: implement NVMEM provider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-block-as-nvmem-v5-5-95e0b30fff90@oss.qualcomm.com>
References: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
In-Reply-To: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX9AVOwuTsicKw
 gheRVf4kuUzrCJJlOIWTax/EQJLytgS1eCp8NYv3CDnVzGT4qF8s9RHLnEG/UDkbLjRKXEUYnvi
 CKYx3rStIObMiTqMDDRl+1owAT9QOBE=
X-Proofpoint-GUID: YrkGWQw2y4tMcm7tsUuACzHSk8mbZ6Od
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX9BZaaYS5Lk2Y
 C/ATVwYsUIhwsOFm5k0Pphj0lcbDsFqH0MvNopIMHACgA1cPgFFRln4s6VFJh0Um93vBlk9vDGd
 3jSqPhDbKytQnfzUR4AJD0xpB8Ms9hidpVmp6TGYk36Vol3uK27v4oHjoNPFwpe7t3HwhZWkFs5
 Pel0oFGixkX8BWNQnzHQw+o6lOTltojJJ/WwZjjuJqIk9ocfpfFJlOafqbrZ3H2tsEpY1UgP/u4
 02fOlHU3R5fq7jHzy1P0R9afSsi/dicYuIytB+eFLmjLNa2xbxqJyZSyZPvWqx+c9FSlo7rc2tE
 AOz4515diDZyN+fFMMVa+0pZyC0oUGi+k11d42rDt2lu1yc4SnTgJf4giD1gFPLjpbIF+qkky2N
 8d82I1xAP03lg8J8XRODwNAFLAysiEBv8mqEVCm4y2wiEq/z8TDn0Ae6LZ5o01SJCVMZbyEQh3I
 kGUL/tFDpWYG4XmDWug==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2c07cb cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VT4XjZGOAAAA:8
 a=EUspDBNiAAAA:8 a=QS6QONgytJYYblx7mpIA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-ORIG-GUID: YrkGWQw2y4tMcm7tsUuACzHSk8mbZ6Od
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062116_221537_74530088 
X-CRM114-Status: GOOD (  27.56  )
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
 block/blk-nvmem.c         | 109 ++++++++++++++++++++++++++++++++++++++++++++++
 block/blk.h               |   8 ++++
 block/genhd.c             |   4 ++
 include/linux/blk_types.h |   3 ++
 include/linux/blkdev.h    |   1 +
 7 files changed, 135 insertions(+)

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
index 0000000000000000000000000000000000000000..c005f059d9fe56242ebaef9905673dff902b5686
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
+void blk_nvmem_add(struct block_device *bdev)
+{
+	struct device *dev = &bdev->bd_device;
+	struct nvmem_config config = {};
+
+	/* skip devices which do not have a device tree node */
+	if (!dev_of_node(dev))
+		return;
+
+	/* skip devices without an nvmem layout defined */
+	struct device_node *child __free(device_node) =
+		of_get_child_by_name(dev_of_node(dev), "nvmem-layout");
+	if (!child)
+		return;
+
+	/*
+	 * skip block device too large to be represented as NVMEM devices,
+	 * the NVMEM reg_read callback uses an unsigned int offset
+	 */
+	if (bdev_nr_bytes(bdev) > UINT_MAX) {
+		dev_warn(dev, "block device too large to be an NVMEM provider\n");
+		return;
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
+		dev_err_probe(dev, PTR_ERR(bdev->bd_nvmem),
+			      "Failed to register NVMEM device\n");
+		bdev->bd_nvmem = NULL;
+	}
+}
+
+void blk_nvmem_del(struct block_device *bdev)
+{
+	if (bdev->bd_nvmem)
+		nvmem_unregister(bdev->bd_nvmem);
+
+	bdev->bd_nvmem = NULL;
+}
diff --git a/block/blk.h b/block/blk.h
index ec4674cdf2ead4fd259ff5fc42401f591e684ee9..cd3c7ca723391c40be56f1dd4810e641b7c8a2b3 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -757,4 +757,12 @@ static inline void blk_debugfs_unlock(struct request_queue *q,
 	memalloc_noio_restore(memflags);
 }
 
+#ifdef CONFIG_BLK_NVMEM
+void blk_nvmem_add(struct block_device *bdev);
+void blk_nvmem_del(struct block_device *bdev);
+#else
+static inline void blk_nvmem_add(struct block_device *bdev) {}
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


