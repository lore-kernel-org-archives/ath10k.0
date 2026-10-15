Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86AECC6B33
	for <ath10k@archiver.kernel.org>; Thu, 15 Oct 2026 14:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IE79JMn0wPrEDgdovegTuQ5M+CHvyEMAVwZJre8pogM=; b=ks3k/K81shbF7AoywZmvk4Kctg
	ePIt+oa+3LhFSv5jW8RORmp6fL/c3OIgqy4kc7a81Z7N4765DwYb/HH8sdO0utSdB7lcSVVgJRlCo
	UJ2cgEsVm4uuJRI6U7dHNjZC3tyuhq20IrAb3vaAGsgYsL3LgL6bW/aSV8mjk6BgZSxqiAr1suiFS
	LFS52o3EHNucDE5SOn5x8XmMvDdv7KONDeq/eXYnq7Q0zfLQeQAqQvSx5olzmndzCH5tIAf/KhG0P
	8iBwzfea8rQfwYWbj2/dNMM+rLnafGG5EhAYyaX79828bQemtBqpnoMfxKlAs+kvMIxvKBwuEUBWu
	gdi8JluA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPd-00000000MJI-3ivu;
	Thu, 15 Oct 2026 14:26:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPW-00000000ME3-3HAO
	for ath10k@lists.infradead.org;
	Thu, 15 Oct 2026 14:26:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jn4V3408850
	for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 14:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IE79JMn0wPrEDgdovegTuQ5M+CHvyEMAVwZJre8pogM=; b=FwjSPjvD7W2PMEe5
	Jhgvf42cxtSO7T1hqxcoWM9lmq71G57eUJzUPFYtXqaPlv3X+VOyFEFikHXdcacd
	Zxl++rFEoG+Qwv1Hi1KpUhXcPVkRjbT3alg7JqHIFnbsXFx6ZxYbyLpoED70rH9E
	qD7Q+kQp2NO5EKdmTCWHV4GL06v9Y7iWs3rvKmwusLx3YvK5ESchEPbC+NRAUEeX
	ZruNCfvaac/F4rmPfUfXDKtXd7QJpnbTjyukC+Qnb+b1KQhS8jLWOCf9/gQzY3k0
	SmFX0UF/jP8Hb/wdU3t+dvAdZRfGFgoYvHoOSAujVJE72GMFbTUVP6fx5DCq/0Fx
	c8Ixng==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn36gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 14:26:21 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc0e78a4ccso117229137.0
        for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 07:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074381; x=1792679181; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IE79JMn0wPrEDgdovegTuQ5M+CHvyEMAVwZJre8pogM=;
        b=fPB9Vnu/2Wx2Cv9CKhvvl0ZEnI0sPBzOqWl5LkC757CQTz4sgjanCBrNWHUxH2PMW7
         zXBZcDW/21B62HWbyV235821bb2iyAaeWoHOqUFVCqjgvwi4p4YgTTHgptF1z3cxxnXw
         EXxnFEux7wvknkRWBmkdR2mGZxo1jy1cEE6Oh+VSIeBsP2q3ZbSYCTHyh8JkN0D/5mCU
         HRDUbmlRcLrHRLy/XTWXTbMhrZiv0oQFtAwizkH7gleDpm5r7wIlv2zW40k2kWotc/M/
         k6aHMvw/+iL7gIZoJYRO2bCup7PoHToHHsSBgN3Rlwjg3yQXkWEBkEkC4T5GIkVr0yYp
         ztzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074381; x=1792679181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IE79JMn0wPrEDgdovegTuQ5M+CHvyEMAVwZJre8pogM=;
        b=lpah4rvo5K11yjV9sSrW+faRbHQsIUHhsD6lBRBoCctC6f3XbNrnpkRI7cAd15DG8i
         d30Ztx90nlrpERNHWYEZ7qBGmzM8CRvBGAX2DEMQ3r+BZgV4i5nBFmd1BObMCVYwE4Qa
         cd5zvwhXWQYfGsg3MR6UdrsTw5kSEWXiXb45n2qiRWJZ30+Tok4DZm16itF15a48MFrV
         WS0gDyA1WEsWQQ6d2yUCCNfMMZDduzYty0s4ma72eVQXsX51xV0ZaOL/MOX07PxhSim6
         alqAK5CypARP6ysmCi8QYJfZudaWu+Al58cdFYN0cC2QvNwCnzjKcrmBtINmso+o4kji
         PJTg==
X-Forwarded-Encrypted: i=1; AKwUvBymQ1t63cJMt+wny2IiHC046iEGy0nN+ISYJok2/Fvws0veZ2aSuUON+bjdqrbQN1qa3xr6od0=@lists.infradead.org
X-Gm-Message-State: AFq9FYJbPVArYAWIiKwAg10pOIsItZRU0iwOJDVRcPMqVfcJ1sxYjIps
	DpSQ+LnAOOAqjIvOsUY683g/DKfWWdXEuAUyNpgKj3pb1buB9B90RkrifcEzbRiZsoCVJOTa7qO
	CHCUG4qD+6q6x2dl/pUIAQdqeOdpAWBDUtyihCJiugYZqonBKfubvr/Jwd6gNlujJ
X-Gm-Gg: AYBFou0PsS+4LwEdx/ERYHuAtSo6R8ufm8m2Ix96dOIkZT5Z8RRQ/DAXjSv+LPcS1dC
	bygeZt1T2cy/sBwc1LXV/eyR+lCiQwFRC7tMm7ASUEJPZ3uClZkH779HYhOHYq4s5oQOkYHLrkg
	CBOFykWWO14eYCdiGxwcMWTN1FCd2zhKCnvtkoxuH9cLxIPSVawz1iUJ1lVnTYeMEQXcjKZy6MP
	XWSrrQJaBhbG5M5wrfEMOmQqY/0EVFpVyBO+GeOfPoIth2Rogo8OgYd2WTahEZIqBk+3/gwTwYg
	Egk+sCtHNoyvXuEz+O4eh+PNL0nhL3t4rk81+ZBenGNGj9qfQjDXTgwitRhmPERgHvlVX/Y01L4
	HihgmdSWvLHM/4M3IkZGTsfBu6vvMxdMDY9+n1vtoET2/FnIl4jHAGgb8Kkxfl568Ql7N/dymeu
	QmOdQaskXsAgCQ8E3Jsxd0ZNP16hE/QF/EUXr3cNhGYpTPXyAB9Dc=
X-Received: by 2002:a05:6102:5cca:b0:7c4:a0e4:1a79 with SMTP id ada2fe7eead31-7cb37317ab0mr3850169137.19.1792074380077;
        Thu, 15 Oct 2026 07:26:20 -0700 (PDT)
X-Received: by 2002:a05:6102:5cca:b0:7c4:a0e4:1a79 with SMTP id ada2fe7eead31-7cb37317ab0mr3850159137.19.1792074379260;
        Thu, 15 Oct 2026 07:26:19 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd6428b3sm69083145e9.1.2026.10.15.07.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:26:17 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:26:01 +0200
Subject: [PATCH v11 2/7] block: partitions: of: Attach partition fwnode to
 the block device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-block-as-nvmem-v11-2-f890ac74f87d@oss.qualcomm.com>
References: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
In-Reply-To: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX2hZ13bX+CI4b
 gAuZ8xF23FFzDRS+wXASK0U8YC8FaNDYQ6M31JU450xOHi+6Q5O19CYdD1GedaM1d2hyivAvWHU
 SFEQZtnrJISok810FgvFd7AmTr1Q1uJGujlqv/A7cRvzBvREBK8xr6oEXBGHH+rzVFyAujQLBtc
 PwPLSmV1KIsNiLR9FsHETAGhlW0Szsbffi0VT24Tfjz30vDThmYWcY+BrRW9NiNJwGLxzdCdcQn
 CHVwTSrlAY5Ee3A4E4RHB8niJNu6jKnMiKR6H6O2yPMrcJo1gdF3SoLf283hYy1HP0zCp3ul4Yq
 iNYRUHHm7uaqkJNSUzDz0RWpWm1u9JiDQFvIPwjmcUAhJwK9UxD01UlWJzrESM6mGfBP9TO7MDT
 BKPwoqLgQxt153FBKpsFeP/Xt5JnHc+wEXkBstVhjtFfMHvJRfGfdAfvEwWS9FmIqEZup+wTGDr
 E1itUG/w2SN8UbXtJMg==
X-Proofpoint-GUID: _Cuwx5mWolx7q3ElMkEgmx-DvosNdz-a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXwRRBgl3Ojtn+
 XdlDFesUTGbH75ueEOjdQ0H84PuJj5JXp1F/tWsPEV5xqGrj/OE5DcjyfUe0Ky+7ZHEoLeuV3p6
 SWxDAmsF5DM4Xs2YYwuwlahGeggOmiU=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0e28d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=2ffTNAQyBkxXHBiWhEgA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: _Cuwx5mWolx7q3ElMkEgmx-DvosNdz-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_072625_163080_10ACB972 
X-CRM114-Status: GOOD (  23.45  )
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
index 53664ea06b6540e3d1155141adaafac7286f2d21..4fc7c80c407de42b2b31be2c82e0e6bc2a30c9e3 100644
--- a/block/partitions/of.c
+++ b/block/partitions/of.c
@@ -3,6 +3,7 @@
 #include <linux/blkdev.h>
 #include <linux/major.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/string.h>
 #include "check.h"
 
@@ -62,6 +63,8 @@ static void add_of_partition(struct parsed_partitions *state, int slot,
 		partname = of_get_property(np, "name", &len);
 	strscpy(info->volname, partname, sizeof(info->volname));
 
+	state->parts[slot].fwnode = fwnode_handle_get(of_fwnode_handle(np));
+
 	seq_buf_printf(&state->pp_buf, "(%s)", info->volname);
 }
 

-- 
2.34.1


