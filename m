Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD2C60874DE
	for <ath10k@archiver.kernel.org>; Mon,  2 Nov 2026 16:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pbgayl2M;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cmS7v6PW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4Rf6Wqu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IE79JMn0wPrEDgdovegTuQ5M+CHvyEMAVwZJre8pogM=; b=pbgayl2MmrYcJi
	caZa0O8QdGuwsUifzWb0AgRRFUxDzxIqtbgWvFOCJEq/MdE917Rcv+q+5TUSRnx4KeAa+Bcc50Ghx
	HHiNe5xZPIRJ5IR/6+rp8o7WYqRgN3l2BXP0mLsBG2gLK189PhC5M9PN5KP37RhVgNM1CXMhtPntS
	NgVUxEkSUCL1hJpiRgZaAlBAEc0NWpqW943p7t25NC32jGdne9M4a028YV0VTg/mT7eS+OqNxsBzy
	tP+Ff9ntFcIAatzQUk08Eq5yBzl8Ba85VL8tnyODV+xU0KUA0f2JeHFlwCiZiMk1N8K5HUnbmXE5X
	L65mr526EQKaJ394L9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuse-0000000HHxP-20qJ;
	Mon, 02 Nov 2026 16:27:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNusc-0000000HHwR-0Tbx
	for ath10k@lists.infradead.org;
	Mon, 02 Nov 2026 16:27:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpJCl4070437
	for <ath10k@lists.infradead.org>; Mon, 2 Nov 2026 16:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IE79JMn0wPrEDgdovegTuQ5M+CHvyEMAVwZJre8pogM=; b=cmS7v6PWAAEcGhV2
	yVNk1/HoeP+HdcxRfgPcIqWH08IduF66sTf/rpn4Jtf77R3s9nR2WYT0I7J9pG25
	eC+wGpvzw+sCuUDQeJDiygd+V1PzNw1NmtNr4jPMb3E0oS0pESzxmB7H8cgBWpGy
	23fXshUi4C8NzebFlLl8LFtmnV4p0Q+QOMdfU36p3r0mZXBdb7zWPbQDSK2Abro9
	kTfjU5VHMuU9IH/JWX52vBGKIWJlyyeFdLgFY/Gh5vym2e51Isx6ZDqoWLudVan/
	w+/iSlGbo2tQSestH68O9MT4Ltn2hQtWY4eyqxLiNqrpz3nai7/A3QzAKj7Xv2GA
	pN7VTQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5h9dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 02 Nov 2026 16:27:28 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso441937241.2
        for <ath10k@lists.infradead.org>; Mon, 02 Nov 2026 08:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793636848; x=1794241648; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IE79JMn0wPrEDgdovegTuQ5M+CHvyEMAVwZJre8pogM=;
        b=D4Rf6Wquy76D9m9lxhPHODqhe2BVGZDz1kD6NGTrofqg6p69twReGLXySngbrITo55
         9Emae+9xI5US/1elSvf7np2kCWrP9v1Otz3MRoPhYFI0SLWZzerKTT5XoVOooK2BzaJM
         Kwu/97kqsIUjUCRt9tlyS4TkpBWDA1g09RgdsLDOY30uzWtB8TE3Ib1veRyZM+FbZ1rf
         gcPBG3ysQ6W0nkEOXTJJun7zZbvMJHj9o5aSlmjTHPmzhyLrGV0iqPzZKddBZ5k7XF2W
         pC3xwl4X4pUuG636WpLW/zibcLQaSB7ePPonxkuyb++FJOWiGE/fGVhAWq4Hx92r5iWP
         +UAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636848; x=1794241648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IE79JMn0wPrEDgdovegTuQ5M+CHvyEMAVwZJre8pogM=;
        b=a6t+Na4DefxTcnsMS/xWQ5O/ah1GyA/axWEynmKeWe4jg6CZ4C0XSrOeKcSkWnpg6+
         b/54FYddKFLeqDkjGMjBkQ5dzzU5znHb3Rh8MrD8bMH2B7idw6lW6ij1rVwg/YVx23UA
         eVuy5UDLRdOMFTVHEaqP3KqQknRXL7OUZkLP350P1NFj+PAxhTASQ1AstYgnJLQ30vSJ
         28+s5/t+1XJMameUTuuhC7/ssi6dFWkC3URDMDs90VHqfxaQz1Qw/SZDJWtyf5Qh81OW
         YDKLQ9jg0a7J3pWHVt/Mw79WooTHSSrwl+zLE70O+EyG7iX4x3IsToRwKO0vdl7YVdK/
         RxaA==
X-Forwarded-Encrypted: i=1; AKwUvBzpJxn0thWh52W7n/YdZksrNwLJEGGEgoRvENmRaonvbtOZDsuaz8PVUnxV51jB80wyZuS28R8=@lists.infradead.org
X-Gm-Message-State: APuU4Z9r+6FDSQvvHyIUe1a7JAOmzek1PPR49yJaYYrBYowqU7OsqOnO
	X1ro/66xOGmBzHfWui0A4FbAwD/3WhEOb9Q7l4Vwjm7rhwuiCsPMQcQ7Ul1/Up1mkwXZmXjzMWc
	XGxm28wE1oOEJvbeJQo7u34jjGEucsxp6/zF09FehvpO5Tn/XqtxYxQgrgIFQ1WXU
X-Gm-Gg: AYBFou0dM7oo8dhyzLb/JulUNBJ77bxwOU/WW/6JStuguGlZxzz+le833OXu5QYejYO
	0VBpLPXsTEoiUSMcdHInX7wKa1BidEeg5DmI6LraXAQf5Noj/8ZHpE6nQWJbDU/Xkb7Db4vRpF+
	3WC7OkdXsIjRS7LGJ9KhjtJN5RxCmIIuUj2k/ShhtmBpkY+bHhFpjtiOqp2lPgJ6Xo6waFG3JZV
	YNOZdraGzGkYdCxiXX/pX3jgPi/jQV2ljhRp/7b8I1SrlOtj71WgRAAo+sbd0dCyO8T9yt/Rhfc
	WhR7jtR2qRZUiYXz91ycxNP7/Y8VZeZvPMlsu/uJafqntvLmAui2I8c048Z20Lm8eouXOjDk0ef
	jJLNLn/XryhgBzzPAYNdKbTVqDu2tCZpk0iK+UH9yA3RvAN0z/OhHze+0JejYHrStf1tdgc8d9j
	/HWJ2mFiCrYq85uKaYYe5wQKWNou7vsoF9uFiYNMTXW0OAGxt3FS8TdbruZ/UkNKO6c0AYtK/E0
	LZDoFnp/BQmBO7JxvAJCWeFEU+I
X-Received: by 2002:a05:6102:8097:b0:7c3:3890:6076 with SMTP id ada2fe7eead31-7d0725cfd65mr3871162137.6.1793636848041;
        Mon, 02 Nov 2026 08:27:28 -0800 (PST)
X-Received: by 2002:a05:6102:8097:b0:7c3:3890:6076 with SMTP id ada2fe7eead31-7d0725cfd65mr3871137137.6.1793636847453;
        Mon, 02 Nov 2026 08:27:27 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm20490695f8f.45.2026.11.02.08.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:27:26 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:27:20 +0100
Subject: [PATCH v12 1/2] block: partitions: of: Attach partition fwnode to
 the block device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-block-as-nvmem-v12-1-f4a2a681087d@oss.qualcomm.com>
References: <20261102-block-as-nvmem-v12-0-f4a2a681087d@oss.qualcomm.com>
In-Reply-To: <20261102-block-as-nvmem-v12-0-f4a2a681087d@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae8b9f0 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2ffTNAQyBkxXHBiWhEgA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: TippmZloPib5NM6A8QyQJORd6Xf8d6hc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NSBTYWx0ZWRfXz4hgDGNkBV50
 vCbhLWNivmkS15YkM5+LNGLizeIYHPaI/hraGYjLWbJuLCFWJYvCixUSzq/Y0b7RPrZyp4jWnlp
 xrE6mTsDcjFIFjQ2gx2eIDXK/zKeUpjrM8coWBgxE7F9DIE3CBCFr2k9J9JCB6G8nWrgL/BKDXU
 FGPgjfymZDPnEgkjIxRpjcV5d8aIad5y4/CMc1nnjE4SMqjp05GVkJeJ/Pw3ZC52EtQ0RRy3Uy8
 3jSW7kwFb3C37J01zIFoM3mIeyo/pFQYDQVCewuJX4MhirblOJvZOkwzED7Lrd/rwaTToX4H5Oi
 iITdlidiWc6FHnIr26YbctJxXFHf3lNqOrLuct+qfCMwdS/6kraQjoOExIAVLkHQ2QGpthsYkVT
 rXsmOMIcj2myLmMD94XrpA4FTenWDj+tFF2gIFKsl8lgnLJthmzHEh4Y43JMLscTi+Unrlx/Xcv
 och3199KclAgDYb2o1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NSBTYWx0ZWRfX4gm/ij+UEXK5
 FXqbPOihzC+3E/L7R1CY5xLryGHFAF5DNdeCRxGFkY8T8CxNkv0VbYJqbI0AWwWKJpqdNHA15WD
 YUaEbRmypkzUWzRjM6ZPoSXzI+yLxPE=
X-Proofpoint-GUID: TippmZloPib5NM6A8QyQJORd6Xf8d6hc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_082730_274787_E763EF57 
X-CRM114-Status: GOOD (  24.34  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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


