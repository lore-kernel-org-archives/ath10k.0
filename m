Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FE0C55164
	for <ath10k@archiver.kernel.org>; Thu, 30 Jul 2026 16:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9PMz+dnble1GdL5feeV7xmOmc+UN0QuRZbXG4cK1sc=; b=oRgZnNkcHtiyuCBDNx6N5NUMmM
	yYjELFfDv3j5tgS/pvmemegcUHgBeeUq19PudawuQv1BLgIhX9uO9Mp/hh1gJeQsgDEw8umG9G1sD
	hODsbtjAq3TfCE7aejWj1fU6XVwQZNy7iXMmZmiNQyzxWG0vGs0j9PCZawtrpYvTKijqg7OSRuDEg
	yUSK4TBovreiT6Jf8RO1c4p5lJ2cb8tLXSBlpE7KbrV58ENkHx/eU6DbNXc2Ik8X0OyRX+mhqjfUS
	nDh8BKlQ6pUq6R4h1iqF2V+Cr3T1zCOgkZCiUPUqXtCRf129xRuz/qzBuOtvkyG6LHabktCgKNn0c
	MrEKmKtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTBs-0000000AuSZ-3fvb;
	Thu, 30 Jul 2026 16:01:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTBq-0000000AuQB-0hLF
	for ath10k@lists.infradead.org;
	Thu, 30 Jul 2026 16:00:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQtYj1371737
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v9PMz+dnble1GdL5feeV7xmOmc+UN0QuRZbXG4cK1sc=; b=dxeULNSLUcRNcK9i
	MlZ9849Moe7IBN/zZB4WyHHUajMW4KVHBCd4FW3YxgDE0NsmY9kJUlZEtPVQUcZB
	j68kbNcmPEQ1eCvdAki3GxBSRLBXWp4v2hg48LRqTrK2RR2BizZ34wuhaa9xwFJX
	toQfxEaCnq69SBpIujR9AmX1qhiahCDP//gLTMQIgScSoszdg+zsf1xr5iyyUkKd
	EE2VC1HNWGg4tuHr1FPQ5x0E8IA/zG3DONT10tKWWFKBpcOv4iT/C+V3vsC3c6nS
	UKdMhdwayjtfgMkIUqnERhu4Urj+QmpJP73YI1o8rqST8EOnkE1EuA+cuqQ4ub4V
	FhlQtA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6yfrymv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:00:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9309af14fd7so230985a.1
        for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 09:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427256; x=1786032056; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v9PMz+dnble1GdL5feeV7xmOmc+UN0QuRZbXG4cK1sc=;
        b=gbaDK1TmDBcEIRU5YBXd5ZZInen5Dzm9tQa1PGk0MvW7BruYUqM/iZ+zJ6Xbkyjl5h
         YRUHZ78m8o9zefeEANFxfzcyt009JhX+wrCHljOulGopdfsTFMhMQHnDBZ3CKi0cYijc
         kBI2+ICLnQXEoazHQpRdZxBXEeehZbmISjRDG1WLwYlmk74LuQvzA3mFrS9rdBKGvOnk
         0nCyJkjsA6t1lCNvW76ZIwF5nlhpw5e2eUvyfHZxX5q8QeAM0ksrh7RLsGOC7TnfHq9i
         EmqCH+fw7VTNVLxulHp/tzXcg7v/Mprj4b11lV3GRrdS15tq1QLrnfwLyi/At/EdoSBA
         WvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427256; x=1786032056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v9PMz+dnble1GdL5feeV7xmOmc+UN0QuRZbXG4cK1sc=;
        b=s+CwKdrP5tm0PSSPrwYA/+Ut3LMx4FJVI/gcwobOJE8Nb/ZNU1dQ+cNl96fzP4nzii
         jcYkjaTpuVXgy4lDaUvhsTw56PjJqu2zEmQZk2RKnH6ySqN8RQxSzf7ajF9djWo1/aW+
         ZLri8guAefC2cHZZF1rnbTzjigEipj9KmWdVsib+WJF6YhBt52DkvyeHIXACzpwjV73D
         xdd7LX6EtGFGtx19zcoZ7OHx3r9J+wF0fXq8iuyxchPQT1z54m7NHeDumtg4zBT8gxFl
         s6Yg3FQeovtXNKh8R7meLfZTQ35qtJwWXYbmEu06a6X/23rhkumzCjDESd1zWkbMSKHP
         5+Ag==
X-Forwarded-Encrypted: i=1; AHgh+RrZIOHzDgx6NJV0IMva2ASIihGRyqUiRQvpRtJyPcFPgIlDiGLX4HOrk8RUGRy5cNICKH7NGKw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwS+cxblAQdISm8e1FIBbC29cm+2GK/0kg+T8RbnLLX9PgvuP0g
	4MZHg+EF6u3Svw6YnvRS28i/QnOp/lUnJOdWtQc7iPcK9Bl8hP92vKlWFzsO2HQV9oTpy8SC1ag
	++TK+xW/1t8VY+S61NdNrrog2fhJbGvgC7VipIRl2plwBLUx6UvYLugt3C7RmdgT3
X-Gm-Gg: AR+sD10/Q0XD2ydI+gu+LQiR1GAXfL7cnbLc60Ub333l2sb9+qKxUbNl665N2PYLTOO
	kWqi7K5c+0i98Nnm1ckqE0tWRHHkr+/LsQZY87+aCKC3i5cV2qikFDvhH4DBPNQuA3MvNmEA3rT
	g7ztmzWNEajOIDvTaEBai1QWujlAiF34AG7y4wTGmC4Gply1vOI+mR5EE0gvMXl+MLT/IQHrbBi
	t4O0sg12D0ZzHmTTsOiy8dRJty0DNzma2CV9uscUHeexIo0IqXp6aOlu5Zyl4mGv29kNFsqAx+Q
	lGtXuHGxono0x9aY42xpdDGWZJvtsQyDvP7RjUuiKER9Y3R1XZWZf6kHomYcusJhI1z95sNUs1b
	0002AmOtG8KSqaDeG7s9N58CRhElhK8ySqa6lyvpZw6CDVYdPJDZ0Ll1UP64UMm5qmxnCqujb5I
	XRkx5xqZJHWbsN4K7bm48MtPJCPaPaQgL4wuaOGzx2NbVPKBO901mc
X-Received: by 2002:a05:622a:591a:b0:527:7d0f:863b with SMTP id d75a77b69052e-52b385fee43mr34234711cf.12.1785427255594;
        Thu, 30 Jul 2026 09:00:55 -0700 (PDT)
X-Received: by 2002:a05:622a:591a:b0:527:7d0f:863b with SMTP id d75a77b69052e-52b385fee43mr34232291cf.12.1785427254055;
        Thu, 30 Jul 2026 09:00:54 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:00:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:00:35 +0200
Subject: [PATCH v9 05/10] block: partitions: of: Attach partition fwnode to
 the block device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-block-as-nvmem-v9-5-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
In-Reply-To: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX5LhHtU1tx3gi
 hqqsBFWyQ+T0PpfO4oKaZf/NmV5/hvQknoIIO/eWy+37aNrXlM12J4TRS4SEOeCr3jzNes4tlI5
 Tgq8MJw2idAhOf4NPrx2KtkmYL6C1PNW4WgGulloT69Ewdr6maWGF2na8rrV0SaFXjWjjXgUN3u
 4d4AxShAlby8Iww5Yahyf/szkEPV0UyVAfspA8N1M0TxkYCqWCZkTki+7+9i88OLWQo8UH/HQcV
 5vm8rUvKR5CzwsxQ5enN5gqwHq57QtC5ZdGhcPZFr9swb4Il+UxaYqZ9aRc3GTrzHEhytJkDKMd
 tV+1nsCFVJQNnupCLyb+eoAAXnBBjdz18eOif9JtA0k8ijWqDmMHzZDTjCpQkoKcBp0jfwHMlel
 CzKx9V4ghZ9WxO91Fl0wAhqmMsEl3Z0RID8Cz3BpkPoI+bup2HFZnwGgHJuur3SwhBQqGKXhyIJ
 hKGZUQk9QghKgnT37fA==
X-Proofpoint-GUID: LrElDiFVQGhw6XBrfWVbMcSx1d48uBTd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX4jxTkm1LrJvs
 yF8Lg4sqNEpVP3E9sVHv0lhiBuWDqY4FEWm0uYyRRa4zyAs2XpAD0VlZX5rH2QW/F41bupG/k4q
 UzXxh1c0tMw+Ria5tJgA/tfyGowr0Cw=
X-Authority-Analysis: v=2.4 cv=Tv3WQjXh c=1 sm=1 tr=0 ts=6a6b7538 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=2ffTNAQyBkxXHBiWhEgA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: LrElDiFVQGhw6XBrfWVbMcSx1d48uBTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_090058_688275_06FB43F5 
X-CRM114-Status: GOOD (  21.48  )
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

The OF partition parser reads offset, size and label from each
"fixed-partitions" child node but does not associate that node with the
resulting partition block device. As a result a partition has no
of_node, unlike the whole-disk device which gets its firmware node via
add_disk_fwnode().

Carry the partition's device tree node through the parser and attach it
to the partition's block device with device_set_node(), mirroring the
whole-disk case. This lets consumers describe per-partition properties
in the device tree (for example an NVMEM layout on a partition node) and
look them up through the partition device.

No functional change for existing users, partitions without a matching
device tree node simply get a NULL fwnode.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 block/partitions/check.h |  1 +
 block/partitions/core.c  | 10 +++++++---
 block/partitions/of.c    |  3 +++
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/block/partitions/check.h b/block/partitions/check.h
index b0997467b61a54a8a621b9c155c8329289649460..326081499d9a6be730dbd659c110449cfa06921f 100644
--- a/block/partitions/check.h
+++ b/block/partitions/check.h
@@ -17,6 +17,7 @@ struct parsed_partitions {
 		int flags;
 		bool has_info;
 		struct partition_meta_info info;
+		struct fwnode_handle *fwnode;
 	} *parts;
 	int next;
 	int limit;
diff --git a/block/partitions/core.c b/block/partitions/core.c
index b5c59b79ca7cbb28d4d93478ee1c80908f76ee9f..72f435dfeffc63e897913571f319e5edd8e7ba88 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -11,6 +11,7 @@
 #include <linux/sysfs.h>
 #include <linux/ctype.h>
 #include <linux/vmalloc.h>
+#include <linux/property.h>
 #include <linux/raid/detect.h>
 #include "check.h"
 
@@ -247,6 +248,7 @@ static const struct attribute_group *part_attr_groups[] = {
 
 static void part_release(struct device *dev)
 {
+	fwnode_handle_put(dev_fwnode(dev));
 	put_disk(dev_to_bdev(dev)->bd_disk);
 	bdev_drop(dev_to_bdev(dev));
 }
@@ -294,7 +296,8 @@ static const DEVICE_ATTR(whole_disk, 0444, whole_disk_show, NULL);
  */
 static struct block_device *add_partition(struct gendisk *disk, int partno,
 				sector_t start, sector_t len, int flags,
-				struct partition_meta_info *info)
+				struct partition_meta_info *info,
+				struct fwnode_handle *fwnode)
 {
 	dev_t devt = MKDEV(0, 0);
 	struct device *ddev = disk_to_dev(disk);
@@ -343,6 +346,7 @@ static struct block_device *add_partition(struct gendisk *disk, int partno,
 	pdev->class = &block_class;
 	pdev->type = &part_type;
 	pdev->parent = ddev;
+	device_set_node(pdev, fwnode);
 
 	/* in consecutive minor range? */
 	if (bdev_partno(bdev) < disk->minors) {
@@ -449,7 +453,7 @@ int bdev_add_partition(struct gendisk *disk, int partno, sector_t start,
 	}
 
 	part = add_partition(disk, partno, start, length,
-			ADDPART_FLAG_NONE, NULL);
+			ADDPART_FLAG_NONE, NULL, NULL);
 	ret = PTR_ERR_OR_ZERO(part);
 out:
 	mutex_unlock(&disk->open_mutex);
@@ -564,7 +568,7 @@ static bool blk_add_partition(struct gendisk *disk,
 	}
 
 	part = add_partition(disk, p, from, size, state->parts[p].flags,
-			     &state->parts[p].info);
+			     &state->parts[p].info, state->parts[p].fwnode);
 	if (IS_ERR(part)) {
 		if (PTR_ERR(part) != -ENXIO) {
 			printk(KERN_ERR " %s: p%d could not be added: %pe\n",
diff --git a/block/partitions/of.c b/block/partitions/of.c
index dab36513eba336344c9558d486a8915624b0fca8..d4016f9b77ec078eb1adb32923107c012ca4a751 100644
--- a/block/partitions/of.c
+++ b/block/partitions/of.c
@@ -3,6 +3,7 @@
 #include <linux/blkdev.h>
 #include <linux/major.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/string.h>
 #include "check.h"
 
@@ -65,6 +66,8 @@ static void add_of_partition(struct parsed_partitions *state, int slot,
 		partname = of_get_property(np, "name", &len);
 	strscpy(info->volname, partname, sizeof(info->volname));
 
+	state->parts[slot].fwnode = fwnode_handle_get(of_fwnode_handle(np));
+
 	seq_buf_printf(&state->pp_buf, "(%s)", info->volname);
 }
 

-- 
2.34.1


