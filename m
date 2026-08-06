Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD23C55ABF
	for <ath10k@archiver.kernel.org>; Thu,  6 Aug 2026 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxMrTZWIsd5PR+qlzxRw6lsq5IV1Qkuw+tEVxsLuc90=; b=JQr7OmB8dv25lzD26E3WNCfsJa
	Kl7zHIx5isjlenmiJ+eA3O2dRxGsNDzo6DcDSvACmOrdO4mlZ4i4WiCk/hr19WcFUb7HxXlyD1p6a
	t0R+cE/KoO5SnZaye+myPUPGA6mvaBEpdQoWIJQ0oMDcAi3XtlbwHmpoIRvTNNwOT4mbHAZDNNZkU
	AY+UhbDVgoMl41mufodprvd3z5KGwATAPrvSEKVpzy0vLanY8eMZQeb6tb6mKFSuqITnSSIFbfIQF
	XlRHFqHN2kaJlmTxUXIvt71Kvwv0xOXdmkMGrS0pVe69OMcDsPton6Ah1ntajon5BtgoUj5Kph6o1
	D+IwCc2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFP-00000005zbE-3St6;
	Thu, 06 Aug 2026 14:39:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFO-00000005zZe-0eK5
	for ath10k@lists.infradead.org;
	Thu, 06 Aug 2026 14:39:03 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ndsZ1625688
	for <ath10k@lists.infradead.org>; Thu, 6 Aug 2026 14:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dxMrTZWIsd5PR+qlzxRw6lsq5IV1Qkuw+tEVxsLuc90=; b=X5mfZwG2vEwSz4nP
	8Dpsyg8NvlJfWbUAYbvIhbsXmLWeyvGydzWxPRGf6yapBYAuNdhIKS25Mri+7Aw9
	oV+vjRPXsp+0Lf2NpedoxE5IkL9Ply7KWRrkfL1JdA8sirUKVD5ScQu/bndt0wMG
	fJL/pQ4d7oMOtAEASrrWKCOOqovDh8tfX8zrL55Ou732i/6pAvCWje13V7BFiSdR
	Xnzijtq+aKKk5p2rNqHzg8SV9nhAG56q6PgNS84K1cs1ENJmzdyOaQDoxYpDjkF7
	yx4wRHCmrGYSZOwVa5N4a+qxqchJWXfZ2C6AwCCuwXGO8Mt7eM79na7VJSmZyQ0l
	6NXH+Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvntnhxqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 14:39:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so40491091cf.3
        for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 07:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786027140; x=1786631940; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxMrTZWIsd5PR+qlzxRw6lsq5IV1Qkuw+tEVxsLuc90=;
        b=WFZHPC28uHCA2NXEcYjVOltHNZO9ic7/gUMvnYwYonok0tt58bT2YHthplejESkOBf
         VzxfWf0jNJ3+EMSskyeI7QFLKCzyeE1rZWz6UyDpg2oWMac7x3unSyZ1Ap/t9RNRBr1a
         kpT9Q2pq3N3rAdyAVV5OfENXS+nJ9fOasYK2JvavZz2BqX2egMJ95l7VL5b54F6UuKZ7
         sLhPY3DRwAW+WZ2h6SmS34rfrN80EKChcfVoS5uFwHI4nP8AwysTy1yggBlNLlY+JraZ
         wB486CCnmCWrQvPPUzBQQXC6MV9S0qhd3m+M0yuQf47ixmhKtQ1PRTEg3Ix/IwWilYSE
         UWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027140; x=1786631940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxMrTZWIsd5PR+qlzxRw6lsq5IV1Qkuw+tEVxsLuc90=;
        b=KEvcho6QcBPLetwVX9OWgd4pMqRW6qdio7agz87xheRd3vWx6tRPhymlsF1PX0Ehgh
         Z2b3gm4OdTAxbSyyxUdemf6juNG33I74qYvGP01f0KE1F/bC1h4ZD0UKO7uxuGS2xt4V
         8IlbApd0SR9jWdki/Moigk5IajiZLM8OI+NnAJ/eqoFEWGVdibPnWncVIngLVLASHtTm
         Ve5YbFyikSoto5Rr935fGBNU9xeVicEJqNgRFMrMc2hxdvrhOXGXiDHa8h16tO5cBRzi
         F4tc3MaDw2RoPgUWSRAK4eNDjTqryevYHh7e2SKCj13YNH5phQLHVxo08lh81YvaDyGS
         seCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrfhtx8YTUOqg7SA6WFPYhsuN0ZVJga3zSfFwZ2oCil0mshPTTzovkhxyXWZI+5++J/ApVUH9g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTk4KVI6tnLlL0oMGaC/cxAe6pQ8JffvVLFz3SlH88fZduBiUS
	J1PhXvqGkA+Dh1UGCLkt/DNn3r4ME4zJKA4n9qqdpR4Cgu/ispPR5Nq2rKsOF4zjVQfkh94XAu1
	9cpOJBKOsMyNls3StIxa6OAblgXire4aM4tQBhh5fPhEMl5A4LFIx8Odznw6mOfq7
X-Gm-Gg: AR+sD11y1lnCGYUjeWZFzxQ8kpthEzdEU0U/4YQYWKhD/PppgeBwm1CIJm9v2eh+nsJ
	0TzAZR2W7SxPbsQ8OMbErFEbeTaUZ+6Ehukhlh1mWQzibtXvbYXHXTXPmiZ93r3UuiY3B6xaIcv
	4nYKUfEdas1vkEdMy2zzMhqAnSoOUfyLf3yBJYTUi3Eni9IEzEPGOlTlScBOwnpTwbTOKUGwvlY
	2EQRa58jn0AE5TpzSVywOYZI+X5Ve9Qw/1Hp2UfXpogOTj5D3X7A0+YalJcshMsCCnfv2ZRGKg+
	deWouDRKkO67nXLhmp0BaszCFnNqhzbE3P40CBK0BFTHgd1P/6iU4dqKrof5g+Q4A9Uuzmvsofs
	VL686tN7sZt3bgZWVeF1RvHRLBaWzY9iJDVcNZDT0CPnjnpyAW0MU2OR0QwIrgFBsK2csG8Mc05
	9kpihHMDncsTYrS0U3Ni5/Ks0Sx86yOSGBhA8+DldlMhgongpfmw==
X-Received: by 2002:ac8:5acd:0:b0:50e:635b:5579 with SMTP id d75a77b69052e-52ce608e48emr133500001cf.19.1786027139895;
        Thu, 06 Aug 2026 07:38:59 -0700 (PDT)
X-Received: by 2002:ac8:5acd:0:b0:50e:635b:5579 with SMTP id d75a77b69052e-52ce608e48emr133499151cf.19.1786027139362;
        Thu, 06 Aug 2026 07:38:59 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([90.85.108.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036276e58sm270552166b.28.2026.08.06.07.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:38:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:38:38 +0200
Subject: [PATCH v10 05/10] block: partitions: of: Attach partition fwnode
 to the block device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-block-as-nvmem-v10-5-be598b2a5606@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX8BvfRBQiQjHh
 VEHd4nNoRyhuGjEv2V3qFtjOrnQIBF7idrrgbcUKYvkvgU87fzpZ4glhkIMLqiZOzMXmc57a3Aj
 5mPd+Bjj5SI2xVXirrlXK+hXzxdIMkiCSq6wAKDasYE4dOjRMEGP5W+D1U800+2vG4whx4mHXwO
 Sb7nfg4lE7q5PFkYbTRDFccQ8GsV9w2SjkEzzR/TGyMyXyeQXmur8jzBtRyy0Z/SNun2f7Q6psH
 X1G1OM0gxHPhRMJ+RRNpoJeS6qDotJTS+6ABy9L4gZmO4IO8BsXGtZ0uwODcIDT7G/ARhkTIbIN
 z5NXZWrMZQzCcF0FJnpTgNl0xxI/53E9rrO6MlVDcQQUYZuucod0v7xssmQjzBmtY5EsXsnjlgD
 q1JL57il3D8dum/LbJo1a0kCXtYmCLMNdfe4q45FewlcdAcWkdexz+95oqrda/FG3r1G/RviPcj
 JzPwNUAz0zPQnJcxPng==
X-Proofpoint-ORIG-GUID: 6DzAuPURf-05YExSPAEWGsvmnrzUQF4q
X-Proofpoint-GUID: 6DzAuPURf-05YExSPAEWGsvmnrzUQF4q
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a749c85 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=JDRa4Jy4r6/BpSpxP2cCow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2ffTNAQyBkxXHBiWhEgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX+p6p35laSVdf
 Yct8uPFZjqZdqr7NZR6edxWG+W7Oh9Vl5+5LQlwGWH/fDKRXH123uEqjBlzAlpp1XpoUaNed7Vt
 QC6Bbqz7xLpE37YjmaEQ9KD5XNv5P+w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_073902_213299_7DC16025 
X-CRM114-Status: GOOD (  23.53  )
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 block/partitions/check.h |  1 +
 block/partitions/core.c  | 20 +++++++++++++++++---
 block/partitions/of.c    |  3 +++
 3 files changed, 21 insertions(+), 3 deletions(-)

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
index b5c59b79ca7cbb28d4d93478ee1c80908f76ee9f..eee954df1ac6ef7dd4f02ad5c9d49aed778bf015 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -11,6 +11,7 @@
 #include <linux/sysfs.h>
 #include <linux/ctype.h>
 #include <linux/vmalloc.h>
+#include <linux/property.h>
 #include <linux/raid/detect.h>
 #include "check.h"
 
@@ -110,8 +111,17 @@ static struct parsed_partitions *allocate_partitions(struct gendisk *hd)
 	return state;
 }
 
+static void drop_partitions_fwnodes(struct parsed_partitions *state)
+{
+	for (int i = 0; i < state->limit; i++) {
+		fwnode_handle_put(state->parts[i].fwnode);
+		state->parts[i].fwnode = NULL;
+	}
+}
+
 static void free_partitions(struct parsed_partitions *state)
 {
+	drop_partitions_fwnodes(state);
 	vfree(state->parts);
 	kfree(state);
 }
@@ -139,6 +149,7 @@ static struct parsed_partitions *check_partition(struct gendisk *hd)
 
 	i = res = err = 0;
 	while (!res && check_part[i]) {
+		drop_partitions_fwnodes(state);
 		memset(state->parts, 0, state->limit * sizeof(state->parts[0]));
 		res = check_part[i++](state);
 		if (res < 0) {
@@ -247,6 +258,7 @@ static const struct attribute_group *part_attr_groups[] = {
 
 static void part_release(struct device *dev)
 {
+	fwnode_handle_put(dev_fwnode(dev));
 	put_disk(dev_to_bdev(dev)->bd_disk);
 	bdev_drop(dev_to_bdev(dev));
 }
@@ -294,7 +306,8 @@ static const DEVICE_ATTR(whole_disk, 0444, whole_disk_show, NULL);
  */
 static struct block_device *add_partition(struct gendisk *disk, int partno,
 				sector_t start, sector_t len, int flags,
-				struct partition_meta_info *info)
+				struct partition_meta_info *info,
+				struct fwnode_handle *fwnode)
 {
 	dev_t devt = MKDEV(0, 0);
 	struct device *ddev = disk_to_dev(disk);
@@ -343,6 +356,7 @@ static struct block_device *add_partition(struct gendisk *disk, int partno,
 	pdev->class = &block_class;
 	pdev->type = &part_type;
 	pdev->parent = ddev;
+	device_set_node(pdev, fwnode_handle_get(fwnode));
 
 	/* in consecutive minor range? */
 	if (bdev_partno(bdev) < disk->minors) {
@@ -449,7 +463,7 @@ int bdev_add_partition(struct gendisk *disk, int partno, sector_t start,
 	}
 
 	part = add_partition(disk, partno, start, length,
-			ADDPART_FLAG_NONE, NULL);
+			ADDPART_FLAG_NONE, NULL, NULL);
 	ret = PTR_ERR_OR_ZERO(part);
 out:
 	mutex_unlock(&disk->open_mutex);
@@ -564,7 +578,7 @@ static bool blk_add_partition(struct gendisk *disk,
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


