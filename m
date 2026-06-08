Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8FACD8C9D
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 10:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4obobFwXe+ZvslbSpMidwSTHXcyAz/tF/irAKCEVyw=; b=PPquT6wR8J9yMcRbBY3QAvxgMj
	ykld0RuVd7Tj8brVjhTFKCX7igcKPo/mqEtZ96iu7q2QdZDS5PSs6CIWghscPZYHMrOWJOCMk6l1Y
	wkaEwClVmCSZdQkvjkJ1W4cyg/mD6TAHxTieyyw9wkiQVrmEaumhQA44dU11TrWZ8bB9yvRkRSueF
	LcH1jnYL5v7nAxUa+M+oBiMTZ9jrNQCvmFzeCF7yu9hYq8U+liW6EBzkb5sy8ScOGaSLyK5O2yY1G
	7c5aKRM5mE8obMr7oAtEz4FAA7349vfydOMemB0R49+b59XUseP+Bd1lQLydf3oBph3WuEBqYvmVN
	nkgfTIeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXZI-00000003MgO-2dQJ;
	Mon, 08 Jun 2026 10:50:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXZF-00000003Mde-1wDe
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 10:50:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658A309G2882044
	for <ath10k@lists.infradead.org>; Mon, 8 Jun 2026 10:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4obobFwXe+ZvslbSpMidwSTHXcyAz/tF/irAKCEVyw=; b=DFLRMLKk18svRImJ
	YbSNuKXpVeYhnoQC/xZGYgAPsHSmE6c+2TGOH/D9cm3sGjzI7bIjGjwMIA0uczm4
	r3DjudcrqPz1SAZiWrdJKO9TvrS871936NGmgRgHWUf/edZpVhTFFruO43YvOIxn
	iHsH78WC12Ds21Vr3Gi+nDQUSjMnP7pUkKTnG3dIVn8kD22gXg2iw4SMGnePOZkd
	IPbkY/mmtwHrKA6K2+g4Ki1Ir9qoVzjGq/kYMTo+XICJg24Zf7g9KnlBXztS8l2j
	ektdzhS5+ElwWotwa+40j3uEoRJH0k6qrCot85rjOQXdApE5N3umoScBEWmN27Gm
	md2A+g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun406hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 10:50:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51775f7b2afso96428111cf.1
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 03:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780915852; x=1781520652; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4obobFwXe+ZvslbSpMidwSTHXcyAz/tF/irAKCEVyw=;
        b=e1M3b6yDVUwrFVVjH1eRwM9KQFy8W6VXwVZM70AsKOi117aFt6qF8cxSRvX0g+PgP+
         3nk2j0ITvapdzQx+FkBvyOEf2TaqkEMBEMhaHyiJvhiQcyKtGSpwrPyo43MoEfAoppzJ
         LFnTqDLWmJi4EZweTLi88JB1rLST0rEMhs3cyWOPwQwIjEwsArimbF4jQsc3dbTe6fe3
         QiDEqwFlItsn0oDyCBiDvphYz85L2zP/IWMae5zgjxNdwoAy9DK1p+F79koDpjsEmNjK
         X9Afn8+7uP22iRidSgFe4mf+J7azJ77zxWbiKVBYkzsTaVtdbD2qPG+xj+GwPwXUzm0q
         8wew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915852; x=1781520652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N4obobFwXe+ZvslbSpMidwSTHXcyAz/tF/irAKCEVyw=;
        b=LdeopItqK1LmtAKuCo6AowT9Slm2tggJ3Qv4R6EY0wzK2L0vk1zXXpdFQlNuoR6Y/t
         JK27Rh2OgRCKyi9tTZD7p/NQZ8glyL70AFntaZT0hdhlcUVydTR7wkn3GMk9o6IdYUDQ
         k6ml0iw0rKzDSzM05p1w41peArPa8bJRzAg/juwa9eF8+Pnf7y7WBy1fHZbGwN3M4nh2
         9GjVZfR76/jzCEMS7+EskWKF6e7PgRqu2i68Gbe7DEPzFSRN0tlr5Cuvg4Yz+B7BqQ98
         LawnxTYtFOyH2+2SosgrkcbNAIrFuevFj8SMT3uFRYgjYC/G9LQbo37Dd+q6NbAMoFBp
         r58w==
X-Forwarded-Encrypted: i=1; AFNElJ+q6nO4LHSKbqLj6OQGcfqPE5+jsNCiuZv8u4XO/WDn911kEuQxsh0lzldUeSyWMnPrVcfHZp0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxkcpLvavh133EZWxKGQfpMDMVmpeSbMKOKEob2gD5Tlx1+iF9/
	Cm1QEJZSEmR/ntjc6JF0GX2w2V0rGKQ7MqWfdsZe2AGrFsBGW4bFQwrAjFvU3aB/SUeFGZXKzVr
	tR0et5o++2DfH/+BVFvMoauPk7NS4GN+VaAWZYeVgO1DKOF/9ubudO+GPgWD8v1vp
X-Gm-Gg: Acq92OFE7qJYvBFmhZpR5DNRH2FAgSnflVPLNTPXKToTRK2H/dWsK8uuww7BEBuehSx
	eUlcfgsroWQk6c/xmj+JL48GRhWXnzPw4bKkvo8AovXSIa69v11TvJ25gXvZKsn1mof4EWL6dIc
	Rq15464s9J8ayhT62jMDZ6wa756800AEk9sCfJgmKr0yTN5kjGYIDq23ADzKtPPZVdm1aTvHc3P
	bQ7iPT95uUNR7r8Xh8YvGYPQ9lJX9QJgXu6IBd15/KvMCPcJURlRO5SWxJ485tabkAUUpz8fcWx
	mO3Y+Y9cIQDaht2CFMVwRQVHzDb3SBVPX/kgav4FxggMAnVsDsB7lOGpnDaipCReHvJzh5XFmw+
	l5Dch4w1a+xMrl3G4knmSdVOD/Y1HDjoQXdNO+uXPP0rZs7X1rYXqm0sOqkumWUJlZDtnqgpcl/
	b9ATkhmbUT2f8wg2geIuwUR4H5IZKBDQQdeCdbcgG2g9nk1GWYAkPgvb0rSbw3ucZ/0w56b67OR
	IcaXVozZ5pa
X-Received: by 2002:a05:622a:284:b0:517:88cf:5cb with SMTP id d75a77b69052e-517986737ddmr140531571cf.7.1780915851849;
        Mon, 08 Jun 2026 03:50:51 -0700 (PDT)
X-Received: by 2002:a05:622a:284:b0:517:88cf:5cb with SMTP id d75a77b69052e-517986737ddmr140531451cf.7.1780915851344;
        Mon, 08 Jun 2026 03:50:51 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051e9aa33sm850399866b.24.2026.06.08.03.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:50:50 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 12:50:41 +0200
Subject: [PATCH v3 4/7] block: implement NVMEM provider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-block-as-nvmem-v3-4-82681f50aa35@oss.qualcomm.com>
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
In-Reply-To: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwMSBTYWx0ZWRfXyTABNnN1wOJr
 May5gDCcaiNIJGkpfjU063lSahcoepp3pe74K8+N9eFabRczLAFfJn61XrLlnP6KTym1LiccTFk
 QMHQOxN3dq+VqL+4DhyRyzXO8BL1pX+IVX5etdn49pOkBSSlxRiL6EE3yrUz75o8QKVE4N18oXv
 x+zeI1ppwqfhmnP3SlFMMwEMFR9ijIGoDR1w2lmYBXMulCYcPFWvtsxdPASICdN5Ka4xhG4uLp/
 xEvRcLJJm7YOTAMKVBVDJNHYOrVOh7csmxb9i7/5XD+EAFqNPO8K2a7jcwKWSaGU2JgtwwREqNX
 f353007buT+8Y93sAUYgpc2iIrFx+wXPFzKVWXWObd7ChaizLUopXkxM1j1OKb9z17iA/KRnMu4
 nP1vOh0amCuMrKYfmK1UHyZnGo7Mgg6QBx746qRanY3igvzriTPnP1grDMazyS/qcffitg/suzC
 qELgNw6Be2xONvMPrdA==
X-Proofpoint-ORIG-GUID: _IDCvjuLrc_ve3twdk8J-BKi0jGxHSSJ
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a269e8d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VT4XjZGOAAAA:8
 a=EUspDBNiAAAA:8 a=71DuYGxFrHUPmPLwgxgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-GUID: _IDCvjuLrc_ve3twdk8J-BKi0jGxHSSJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_035053_542137_CE623B0F 
X-CRM114-Status: GOOD (  28.87  )
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

To safely defer the freeing of the provider private data until all
consumers have released their cells, a nvmem_dev() accessor is added to
the NVMEM core to expose the struct device embedded in struct nvmem_device.
This allows registering a devm action on the nvmem device itself, ensuring
the private data outlives any active cell references.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 block/Kconfig                  |   9 +++
 block/Makefile                 |   1 +
 block/blk-nvmem.c              | 171 +++++++++++++++++++++++++++++++++++++++++
 drivers/nvmem/core.c           |  13 ++++
 include/linux/nvmem-consumer.h |   6 ++
 5 files changed, 200 insertions(+)

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
index 0000000000000000000000000000000000000000..99c7728fb7bccdc2216780a73a89a9210f925049
--- /dev/null
+++ b/block/blk-nvmem.c
@@ -0,0 +1,171 @@
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
+#include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of.h>
+#include <linux/pagemap.h>
+#include <linux/property.h>
+
+#include "blk.h"
+
+
+/* List of all NVMEM devices */
+static LIST_HEAD(nvmem_devices);
+static DEFINE_MUTEX(devices_mutex);
+
+struct blk_nvmem {
+	struct nvmem_device	*nvmem;
+	dev_t			devt;
+	struct list_head	list;
+};
+
+static int blk_nvmem_reg_read(void *priv, unsigned int from,
+			      void *val, size_t bytes)
+{
+	blk_mode_t mode = BLK_OPEN_READ | BLK_OPEN_RESTRICT_WRITES;
+	struct blk_nvmem *bnv = priv;
+	size_t bytes_left = bytes;
+	struct file *bdev_file;
+	loff_t pos = from;
+	int ret = 0;
+
+	bdev_file = bdev_file_open_by_dev(bnv->devt, mode, priv, NULL);
+	if (!bdev_file)
+		return -ENODEV;
+
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
+			goto err_release_bdev;
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
+err_release_bdev:
+	fput(bdev_file);
+
+	return ret;
+}
+
+static int blk_nvmem_register(struct device *dev)
+{
+	struct device_node *child, *np = dev_of_node(dev);
+	struct block_device *bdev = dev_to_bdev(dev);
+	struct nvmem_config config = {};
+	struct blk_nvmem *bnv;
+
+	/* skip devices which do not have a device tree node */
+	if (!np)
+		return 0;
+
+	/* skip devices without an nvmem layout defined */
+	child = of_get_child_by_name(np, "nvmem-layout");
+	if (!child)
+		return 0;
+	of_node_put(child);
+
+	/*
+	 * skip block device too large to be represented as NVMEM devices,
+	 * the NVMEM reg_read callback uses an unsigned int offset
+	 */
+	if (bdev_nr_bytes(bdev) > UINT_MAX)
+		return -EFBIG;
+
+	bnv = kzalloc_obj(*bnv);
+	if (!bnv)
+		return -ENOMEM;
+
+	config.id = NVMEM_DEVID_NONE;
+	config.dev = &bdev->bd_device;
+	config.name = dev_name(&bdev->bd_device);
+	config.owner = THIS_MODULE;
+	config.priv = bnv;
+	config.reg_read = blk_nvmem_reg_read;
+	config.size = bdev_nr_bytes(bdev);
+	config.word_size = 1;
+	config.stride = 1;
+	config.read_only = true;
+	config.root_only = true;
+	config.ignore_wp = true;
+	config.of_node = to_of_node(dev->fwnode);
+
+	bnv->devt = bdev->bd_device.devt;
+	bnv->nvmem = nvmem_register(&config);
+	if (IS_ERR(bnv->nvmem)) {
+		dev_err_probe(&bdev->bd_device, PTR_ERR(bnv->nvmem),
+			      "Failed to register NVMEM device\n");
+		kfree(bnv);
+		return PTR_ERR(bnv->nvmem);
+	}
+
+	scoped_guard(mutex, &devices_mutex)
+		list_add_tail(&bnv->list, &nvmem_devices);
+
+	return 0;
+}
+
+static void blk_nvmem_unregister(struct device *dev)
+{
+	struct blk_nvmem *bnv_c, *bnv_t, *bnv = NULL;
+
+	scoped_guard(mutex, &devices_mutex) {
+		list_for_each_entry_safe(bnv_c, bnv_t, &nvmem_devices, list) {
+			if (bnv_c->devt == dev_to_bdev(dev)->bd_device.devt) {
+				bnv = bnv_c;
+				list_del(&bnv->list);
+				break;
+			}
+		}
+
+		if (!bnv)
+			return;
+	}
+
+	nvmem_unregister(bnv->nvmem);
+	kfree(bnv);
+}
+
+static struct class_interface blk_nvmem_bus_interface __refdata = {
+	.class = &block_class,
+	.add_dev = &blk_nvmem_register,
+	.remove_dev = &blk_nvmem_unregister,
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
diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 311cb2e5a5c02d2c6979d7c9bbb7f94abdfbdad1..ee3481229c20b3063c86d0dd66aabbf6b5e29169 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -2154,6 +2154,19 @@ const char *nvmem_dev_name(struct nvmem_device *nvmem)
 }
 EXPORT_SYMBOL_GPL(nvmem_dev_name);
 
+/**
+ * nvmem_dev() - Get the struct device of a given nvmem device.
+ *
+ * @nvmem: nvmem device.
+ *
+ * Return: pointer to the struct device of the nvmem device.
+ */
+struct device *nvmem_dev(struct nvmem_device *nvmem)
+{
+	return &nvmem->dev;
+}
+EXPORT_SYMBOL_GPL(nvmem_dev);
+
 /**
  * nvmem_dev_size() - Get the size of a given nvmem device.
  *
diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
index 34c0e58dfa26636d2804fcc7e0bc4a875ee73dae..ce387c89dc8e4bc1241f3b6f36be8c6c95e282ed 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -82,6 +82,7 @@ int nvmem_device_cell_write(struct nvmem_device *nvmem,
 
 const char *nvmem_dev_name(struct nvmem_device *nvmem);
 size_t nvmem_dev_size(struct nvmem_device *nvmem);
+struct device *nvmem_dev(struct nvmem_device *nvmem);
 
 void nvmem_add_cell_lookups(struct nvmem_cell_lookup *entries,
 			    size_t nentries);
@@ -220,6 +221,11 @@ static inline const char *nvmem_dev_name(struct nvmem_device *nvmem)
 	return NULL;
 }
 
+static inline struct device *nvmem_dev(struct nvmem_device *nvmem)
+{
+	return NULL;
+}
+
 static inline void
 nvmem_add_cell_lookups(struct nvmem_cell_lookup *entries, size_t nentries) {}
 static inline void

-- 
2.34.1


