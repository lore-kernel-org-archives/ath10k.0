Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB283FF885A
	for <ath10k@archiver.kernel.org>; Tue, 28 Apr 2026 14:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wfgrsp3+OXcemYYLvo9SkPw2QHC3Nuf+HBxk2NFolPw=; b=w7yNacA/99OBww0r5KYcV759QJ
	T4Frh7aAlzvWDwKFYZUYXtVNhD0Fs9pXdsYjJzNydrLy/CP3/+Hn6FJWzHr7B98uGCpOxhceR/c3r
	ubqreCBmHg48wjTO470qmcuJ7kKh7LeJNzPlqtTQdaZxx/EPtpZV7aopwpW9YAK7KFAWZNWjIGrZP
	kl5iJauUu70LZ87MfXpbJ40FUKLnHh/bClBbbu3teH2o1DNP1/fjB91f9IRVNJXVlyrWYchD6DT4B
	+p3dCS8uc2cE1k4yJTidkw0DFzRQRUemsy5IUYqu8hQQhKDxgEVVIqGoyiOrsM8uLqgPD/Fw1OwhW
	7UFouwpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLP-00000001dgt-2tZD;
	Tue, 28 Apr 2026 14:23:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLN-00000001dfB-2zm0
	for ath10k@lists.infradead.org;
	Tue, 28 Apr 2026 14:23:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SACSS32929026
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wfgrsp3+OXcemYYLvo9SkPw2QHC3Nuf+HBxk2NFolPw=; b=b1SqOvwxePq20lsa
	leNNsisiDEHCvr4Yyygj/28n9cMo3mjjjiOsw0r/GuEHg2L2RDbdhrI1a92eKHJ6
	4+r2Fw/O47qGZy33jZ7WwA/3VF8gto6MSn3uyP6ScvCZ2FlhfuJnccjToE8EyLaT
	M8q+KP9+kjv80xsdnMVQC4d3X1Wuq8BkDY5r04Z7ruIAgCuLGlgbK73cWq/h5ak9
	nEg/ezjKhI3XbUZ1zzcD9t//Ejsqb/0LAkCtv8mBe43lNY2McRws/gSWIzcoyEJl
	X87uFQV2bBH8gdevOHCKddTRDLBk6WcJSQ63vny4PJhCrCKmfs5efc0B7HXASypL
	wkQjBQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttxh8wrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:20 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56d849e9277so20834033e0c.1
        for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 07:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386198; x=1777990998; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wfgrsp3+OXcemYYLvo9SkPw2QHC3Nuf+HBxk2NFolPw=;
        b=FTtbxRIh/w5FPw9zT43aLw7vQ5tX6jgImor8y/2LRt06V5hzrdoGE3ZL04BdMSYLjl
         CY73k1zxHOwaF7BryqG8nX2qhIh8A05fwrlQR7o2/PdgDj/RY8vBQlCrAXVL5sQYEM3S
         tq0FFXeWLy/ur0XLN3sg0V8Ddmlm+gdVQNbvJV1kH/ecZg851N/by8Re9DMQy3bUNsiQ
         khSHKEMDZI+5Nu6uCRdYCohf5XhSNwRFxiHW+yhFJI7fdjyeC6wtuy4gabQ7XAN5pjnw
         fAos14uTRJN/rHsQQOOUzP1IxyxniWY1P0UzwpVDgQX4F3CmFRUPRMW8ycBakUPYP1Ml
         zu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386198; x=1777990998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wfgrsp3+OXcemYYLvo9SkPw2QHC3Nuf+HBxk2NFolPw=;
        b=sbtgKLs2HV7y8prjterr3gNgGY+7dkVzUyNJd/Hxh6TZpLpV8yufz7/Uyiq68GVfXv
         7Rjc+mx2Jh0lIR0Z0JYM4dvK7cOMCGlOdMyTwrdvU3tkT/tyG5NUrQylG2WHjAENZMti
         NiYAAFUTOdTeo78TgBCsORZhjb+pA9MFiyMmI5DCHVv46P1g4a97IoUtIevMRVr7WaOQ
         xlB/LL8KWaTviqhUx9oTqmcascB7n2ju/jC4TO4a9SYDmrDPjqzc3MhYTUGhtAvz4FEQ
         TJnTiSx0RplS1UKLrJzWUyF6X6N7xn5OJD4Gv2dglnQtWxRq+UhxTKrbFmCsXm324o4P
         BfQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/snSwkdVA8bPWKQ7DdeN7X7XKFhpi7JG1mU7uPosbUWVaXoenaQAPEK9UdRc935nmYv5Xmcos=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWx91xYR1v9b2MTR/8a/oMfeWGKTJJduFb8NL0lrxybmJNoPNe
	p7YsuAXDRlezebwvlDNVc10vHZk89Iu+m3pKq3vztH4y1X3yFOFkEOg1D+RY/GdlmO/KaRvMbQ+
	helKirJeaamrDruMIrOEdtlpxMvsGXnVJ2TJA6cBC8lRBXetB+QA/tEDfuto9KAcO
X-Gm-Gg: AeBDieswEP4q0v/5BMZlaKm8gWK8tnudnAoy3VhKYZPFkKCn4ojTZSCojdyzxiegYq8
	COY5UNMLVJPMDUXb4lalxiAe8Pa/+flvEd1Pxxg2DFxbDamnh9vyBcHnGYxnSNXNzxAeImOFHlg
	qn5uvKmok7DPHTvc+q2MFLauH1HPV39sdYDYpLK0YlbPq7pueoMHfjGxzSyvLAlRcNrfvA+TlpG
	YkzIyofbSIjWiGbHuS7ycvuikFw0CSQkB6A5eSKAqvhJ6XUfGIV52SDMmUbqCCXEwv1iwwy3xVU
	MsF9sq6mbSoUMlvX6KcJXbwqajPAKEITJZ0gbCXqO7Cgk+PpYYda/KVlU7fkN9ltkIC48QZgrxq
	CW4FCb+EbLI+VBy+W6XrE8Qhop1z70Ifvs+sHSUXlbIzkXaMQWYjoCLHcRCUvUEACmMIVMPgp1i
	8caU0HvJG5NItMobix2J3F38iaalM=
X-Received: by 2002:a05:6122:4201:b0:56c:860b:c34e with SMTP id 71dfb90a1353d-573a55b83fcmr1685536e0c.8.1777386198299;
        Tue, 28 Apr 2026 07:23:18 -0700 (PDT)
X-Received: by 2002:a05:6122:4201:b0:56c:860b:c34e with SMTP id 71dfb90a1353d-573a55b83fcmr1685459e0c.8.1777386197727;
        Tue, 28 Apr 2026 07:23:17 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:16 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 16:23:08 +0200
Subject: [PATCH 3/9] block: implement NVMEM provider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-block-as-nvmem-v1-3-6ad23e75190a@oss.qualcomm.com>
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
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
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfX2whagx/uPEWT
 sCtEzrLLgCRMJ7wvBcuo6J8884ol2Ums7UBRaNeT+xIVEwSdgG0tNkmvggQNbYK5aV4QuU+Xh5z
 Dp1857ljxMIinVHWc4tdFqOLCB4QD+tlMGwtojAVs71C9lMZq+9Qt/9rogvt1kiGSBkldb9kxGx
 mtKGSEzRJMdA6Cnd0/pe8oCLly8EdHS+uoysum3Ljwa2lVdgrp4sWFv+19DUf9TalKKwfP+g1VU
 FOyfWkAEHbQJ8VE4LBh6/fGyVZSqHsgqryRJyjHTx0InLsRCXY0RBMXSsiEbGSvKrObmGiK8vRE
 ZXOAKX3v4owTBdbeuqye/s89Nwj+PX1S1iw++jtT9BPy81x/hupQkyExex3/aJSjSe5rvZKnrJN
 pQqGXONh1vM9CT5rAmtodGHaDLiyaJlFu5JDWu6H6dZFEPMAwyATlJ30O3qWv4JY9XOqCgVT9M9
 XP58sfN01kdp/f6+AyQ==
X-Authority-Analysis: v=2.4 cv=Uu5T8ewB c=1 sm=1 tr=0 ts=69f0c2d8 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VT4XjZGOAAAA:8
 a=EUspDBNiAAAA:8 a=0xOXAJtWE3glxeOP_3AA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-ORIG-GUID: kYs-4jitr0m6cdOUK-f3GRh_L5xb5n34
X-Proofpoint-GUID: kYs-4jitr0m6cdOUK-f3GRh_L5xb5n34
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_072321_913745_A90FA1D0 
X-CRM114-Status: GOOD (  25.20  )
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
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 block/Kconfig     |   9 +++
 block/Makefile    |   1 +
 block/blk-nvmem.c | 164 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 174 insertions(+)

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
index 0000000000000000000000000000000000000000..01b67c638a6dfd1393043024b6a7f3ebb947a57c
--- /dev/null
+++ b/block/blk-nvmem.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * block device NVMEM provider
+ *
+ * Copyright (c) 2024 Daniel Golle <daniel@makrotopia.org>
+ *
+ * Useful on devices using a partition on an eMMC for MAC addresses or
+ * Wi-Fi calibration EEPROM data.
+ */
+
+#include "blk.h"
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/pagemap.h>
+#include <linux/property.h>
+
+/* List of all NVMEM devices */
+static LIST_HEAD(nvmem_devices);
+static DEFINE_MUTEX(devices_mutex);
+
+struct blk_nvmem {
+	struct nvmem_device	*nvmem;
+	struct device		*dev;
+	struct list_head	list;
+};
+
+static int blk_nvmem_reg_read(void *priv, unsigned int from,
+			      void *val, size_t bytes)
+{
+	blk_mode_t mode = BLK_OPEN_READ | BLK_OPEN_RESTRICT_WRITES;
+	unsigned long offs = from & ~PAGE_MASK, to_read;
+	pgoff_t f_index = from >> PAGE_SHIFT;
+	struct blk_nvmem *bnv = priv;
+	size_t bytes_left = bytes;
+	struct file *bdev_file;
+	struct folio *folio;
+	void *p;
+	int ret = 0;
+
+	bdev_file = bdev_file_open_by_dev(bnv->dev->devt, mode, priv, NULL);
+	if (!bdev_file)
+		return -ENODEV;
+
+	if (IS_ERR(bdev_file))
+		return PTR_ERR(bdev_file);
+
+	while (bytes_left) {
+		folio = read_mapping_folio(bdev_file->f_mapping, f_index++, NULL);
+		if (IS_ERR(folio)) {
+			ret = PTR_ERR(folio);
+			goto err_release_bdev;
+		}
+		to_read = min_t(unsigned long, bytes_left, PAGE_SIZE - offs);
+		p = folio_address(folio) + offset_in_folio(folio, offs);
+		memcpy(val, p, to_read);
+		offs = 0;
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
+	struct device_node *np = dev_of_node(dev);
+	struct block_device *bdev = dev_to_bdev(dev);
+	struct nvmem_config config = {};
+	struct blk_nvmem *bnv;
+
+	/* skip devices which do not have a device tree node */
+	if (!np)
+		return 0;
+
+	/* skip devices without an nvmem layout defined */
+	if (!of_get_child_by_name(np, "nvmem-layout"))
+		return 0;
+
+	/*
+	 * skip block device too large to be represented as NVMEM devices
+	 * which are using an 'int' as address
+	 */
+	if (bdev_nr_bytes(bdev) > INT_MAX)
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
+	bnv->dev = &bdev->bd_device;
+	bnv->nvmem = nvmem_register(&config);
+	if (IS_ERR(bnv->nvmem)) {
+		dev_err_probe(&bdev->bd_device, PTR_ERR(bnv->nvmem),
+			      "Failed to register NVMEM device\n");
+
+		kfree(bnv);
+		return PTR_ERR(bnv->nvmem);
+	}
+
+	mutex_lock(&devices_mutex);
+	list_add_tail(&bnv->list, &nvmem_devices);
+	mutex_unlock(&devices_mutex);
+
+	return 0;
+}
+
+static void blk_nvmem_unregister(struct device *dev)
+{
+	struct blk_nvmem *bnv_c, *bnv = NULL;
+
+	mutex_lock(&devices_mutex);
+	list_for_each_entry(bnv_c, &nvmem_devices, list) {
+		if (bnv_c->dev == dev) {
+			bnv = bnv_c;
+			break;
+		}
+	}
+
+	if (!bnv) {
+		mutex_unlock(&devices_mutex);
+		return;
+	}
+
+	list_del(&bnv->list);
+	mutex_unlock(&devices_mutex);
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

-- 
2.34.1


