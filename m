Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB24606A32D
	for <ath10k@archiver.kernel.org>; Mon, 23 Nov 2026 12:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WXj6HZy6;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d4XbwIfa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gu1crFOE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=q2LLXgfqwD+xrLJorPVwTBLDULLlABEy70l/ShybkrI=; b=WXj6HZy6eFEcog
	q//qaO988Q7Z3zZ1Kw/t8lSsjNPU7hFxDmo2IDZ+zXD7LmBB6pSZrCGmBTAi8roHAmb0HUwwXjPSI
	a4CJ8HKl4XMPMURd7r4BTCv7ZQbX1dk0xqF76Q8b5LOHAJJ8L3tbedgq5etfGHFnGpVjoukgjO4Xs
	b1kYlz7yLC0Kz2s+jv/ikPhU4wM8Zn09/gaTnga1a8uwFsuY9TbUYCe7fUXGAL3u1BZSN2p0BU5lA
	izvWh8NNxTAbNdPskH58xQ01IGRaW82w6BNu5B1n8hX2n5eiBO1Lx0MHp1XIhs2TxE0TcSaMIrI23
	KWrJMFC18/L8cXnB4v+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTPk-00000003Pou-1DmP;
	Mon, 23 Nov 2026 12:44:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTPh-00000003Pnu-2KVA
	for ath10k@lists.infradead.org;
	Mon, 23 Nov 2026 12:44:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANCG1p3301764
	for <ath10k@lists.infradead.org>; Mon, 23 Nov 2026 12:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q2LLXgfqwD+xrLJorPVwTBLDULLlABEy70l/ShybkrI=; b=d4XbwIfaFgm/G8Dz
	xl/ht/3kCWRIcMd0XvU5QvDpv2xoviFpVh0bPMuS7EFpE9zcTSDPmdZih/S0RXoK
	T0Zlpg684HmOWajh+tFVV0lVtzpVf1xJXWcLnbc0zQn2zGBFaRV3eUTHyX5gGpjL
	8MHbnsq+62DhuP4Tjn2WCgrEE8Y5p8XRo4NhfLrSUf5fkr7l/4DTcccHoiRoPLLX
	3nSOnupI5viJsIA7rZ/uH3FRwhIMvE4HlBNHGJH+13cIbXkA/uQgxTnqces37Ijd
	5ewwLIJjXgd38wmlt7oBIjDdEmZZcxxJ/7fQeeQfyuHcKrEemjnycNQKqZLIYMcT
	et25Sw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g741dfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 23 Nov 2026 12:44:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9213659143bso64693276d6.0
        for <ath10k@lists.infradead.org>; Mon, 23 Nov 2026 04:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795437892; x=1796042692; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q2LLXgfqwD+xrLJorPVwTBLDULLlABEy70l/ShybkrI=;
        b=Gu1crFOEHocZNeqUcRdDbG0+915SRPuG8hb5up2tKM1yNBDh18f/qRcddYT2OXTcxa
         5suLTzckiZ5q7sego5Uiv7ECq2fquOOIL58Y0irxRd7z86jWWYismckbqhcx2IwoMaet
         eo0dF4hyYJjzyqePfsBC9Ix9kyEIqK/Exc2pLmq/AM/LbOsDRbB492kzu30ydIkH18L0
         Zq9dku3uMtgBWao7axc90+VsWGELqheMpmPsEQoTp/L+rvzKCL3tHX9MBY65R6w4cfOR
         PsdAK495Q+ojFKxVC7f9Q/M4LeeGE1vFFHRQahINzz5Lwwyk1UeO6dvz1j1ugI9/n4B4
         x38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437892; x=1796042692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q2LLXgfqwD+xrLJorPVwTBLDULLlABEy70l/ShybkrI=;
        b=0ETIFdCH9vWPDcGKnj+OSFclSuEITSHm0zdodTQtfyoqK4drBrNM/4R5Kx9iBimTx3
         Weo21OzQaB5c/06ouoqZfTAg5fIsl875nUe5ZZ1XR2kp54neHu8eSW463CjtrgaHT20e
         GuBXaPMqnzczbzcy6wgocPBSpx51GkFKjGiNHRYvsKfAtXqDIRATwh7/KRxF0zfRyChP
         kBDm7ggt2IRb68mHD7tLK4BJncXW7HzZeA7KUdocHq++atW19wDlBtcTuJRgz2Ijd3Kr
         /ZbszZhc6TkWLVrzH90VBUXiByur+d0G+6Y7KAGbv23R0HMzhBC6eWW4ZkVYrKIuyo1a
         FY4A==
X-Forwarded-Encrypted: i=1; AL+hErGt557NWED8GYXgz723BiFNBeloKV9HB8tf3esTb35H17uM+7Q48TpAE4FWvupDVx65F1B2Tcs=@lists.infradead.org
X-Gm-Message-State: APuU4Z/z1+OxA8rUOa/R+Q5n6rs/v5w78e3k24K9CjWOGVppF8jdJV3Q
	m5dNHRmqEKnMMEHaNZ8KbNlvjtppnhelwyfRpMqjJpHFBxgJ7FP1YJGa4HZ3tX8yCU/dZCvFChn
	YoW/WawRbltHfywgV/Bq28bECR39mLWDqtnsCA2ScwlT3tPgDymZwPl2QQUQ3nMSD
X-Gm-Gg: AZFdTZetyr7rXWSQAztpfvZ/AvmABtwkbL6+Qp5qRT0WoJXsF/YBIg6jyKhnXikRCiX
	Z12fDAygCKkcd2l/altGKQyl4NOawbhAUJMP6tJk46yc7rjyRrJJUPU+EGLcLMuVzyPAUq10OdY
	B9w/en9ZcxzIHzn/XJxe/l0BjgKiUgRgHuBuIgTwhtcl57VkLTVdJPCt1TnXZaLcCq1gbyVMiHK
	YsnP9wfOGdp2mjw0gC059veA+nvjplwqD+ILn6Yv0/5lsenGNpgFcj9v8e+hHuCl+ZIMGbAOFZh
	FxXMqu+7WTxUYKpQ0mUHPiesgUIwMvicGI+wUTq7lQ6HWhmOvYzSOlmbMtsKwKAedI4j+TPF0db
	3/Eux8M0Llb5lCgDQ0IrYtN7DONjATnqy344RX2r7MY7ylRQ4epuP/gBh3ZiJaXH3yCbQu9fZm4
	IxUOIkylKgyDF0hzLnOtjcXZHrFulrvbsEWauvQX1U/idi70v1JYPSAEBmHvNVk+mCJPq8HBoHo
	Q+KAS65CGzh/7tKwqaJSEmXsiRd
X-Received: by 2002:a05:620a:4493:b0:949:6530:816f with SMTP id af79cd13be357-949ba9fd6ebmr1899079985a.42.1795437891901;
        Mon, 23 Nov 2026 04:44:51 -0800 (PST)
X-Received: by 2002:a05:620a:4493:b0:949:6530:816f with SMTP id af79cd13be357-949ba9fd6ebmr1899077085a.42.1795437891451;
        Mon, 23 Nov 2026 04:44:51 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm649355875e9.4.2026.11.23.04.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:44:50 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:44:44 +0100
Subject: [PATCH v13 1/2] block: partitions: of: Attach partition fwnode to
 the block device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-block-as-nvmem-v13-1-96ffe1f59332@oss.qualcomm.com>
References: <20261123-block-as-nvmem-v13-0-96ffe1f59332@oss.qualcomm.com>
In-Reply-To: <20261123-block-as-nvmem-v13-0-96ffe1f59332@oss.qualcomm.com>
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
X-Proofpoint-GUID: 4WvTpMJfae0wkpqzBYBotPTZSYcG7pvZ
X-Proofpoint-ORIG-GUID: 4WvTpMJfae0wkpqzBYBotPTZSYcG7pvZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MCBTYWx0ZWRfXxXXV91pCS5P2
 YGkPFT8sQ7ThuizMgjG5dZH+3UNnxnYqrol1L2qDrBvYooh7g68VPWZlpkR0MzpQAfA2iBUa54Y
 OiNz4hQ7Z3JN7lDt1Hh/EWjW4Zp5VEQ=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b043544 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=_IYX2gaGVZBpxN60pRUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MCBTYWx0ZWRfXzyABGJxCjKKR
 uijOaFPfdSqB6CJPOvYVaasz8oKfAbhMURMF3GPVWimx/bsakpbHd5DMkkbiCXafgMOSTbN3H0D
 8bg/TqaFavXFRSicPFJbQBX8QPKkBvf+STcPlRlHqSwca2XCrfo0fBHiIHZ+TWBfEVS3iAjfUAx
 D1vOp4r0zbV4JMDPXo0J4L1qzyU4ZtJpxsPvqXP6+xM6WmXfFUQxvfiYhOK8ubIaVbrZ85deOBQ
 USWKR8UQFqE0NMk5G2hkDRR+1Gq86KweR8/Q3cZiOBmrq6sV1jwrAItW8HddrLreiimwCeVJgOE
 lYvEdMcndAQBFX+pjx7M76pJiyfA+yhtSWwYdA1iooO34Cjx6z5+/cHU+ImxXeUDysg37+2SWQG
 NlQIIGqmMSpbUvY7Vpz1p9vSXIQ50yqHiLArMNmWdamXBpm1H0DPafDAU4qUVgy10NY8eIMvy/9
 NIdszSK6u+806IX0JOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_044453_717501_8C53DCCA 
X-CRM114-Status: GOOD (  23.76  )
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
Reviewed-by: Ulf Hansson <ulfh@kernel.org>
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


