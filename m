Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01E8606A327
	for <ath10k@archiver.kernel.org>; Mon, 23 Nov 2026 12:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h/FoHnJa;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+2DxMlQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gtYi0MuM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HVNW92KPaOSF54gmCgO2UWmCU5MAh/fhPfGmPOmNVdM=; b=h/FoHnJaNPRxCI
	fiRF5FkT9i5TwRJ/ZYTDNMlbUAdNAjiPL4xyGWFIGP6IaHc2dOFQqix+NG4ynp0E2vxS9JFP32wyL
	ZIGKHNwcl95vMcj+RnpuenMVByJJSBwS9TSHZ7F3QQKivulE8GjZfldECRd1qmFBjMMhwIO1vVgA/
	RVombFTvF10RHAFmJs3S3EbIPkmDIIBYrcWF2InNbtym6Bne+9o2FrD51l6iROPeaA8RFb1KSFfBx
	4SMLoSpFyJFDoekaDCd7thci0lFtVF1s5E4behEVCYbJWur44delFskYz5Q1DEDzKBjUypPSiUv3Y
	LzQDvRNUqnzjX837cFdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTPn-00000003PqG-1W5D;
	Mon, 23 Nov 2026 12:44:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTPk-00000003Pp0-22yR
	for ath10k@lists.infradead.org;
	Mon, 23 Nov 2026 12:44:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANCG9Pc2226658
	for <ath10k@lists.infradead.org>; Mon, 23 Nov 2026 12:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HVNW92KPaOSF54gmCgO2UWmCU5MAh/fhPfGmPOmNVdM=; b=E+2DxMlQiTKhQiN1
	41OzyP7xhWGVGVxjWdpo+hIAfh4dLb07feSmAW6laX/x4c8Vu42oMSK38nYeq5dA
	aVcT7R9/1ZuDuTLehc0rqhR8rDKA+fxRH5koAgFPzDNmOERlCO8e8a+uLFAk/cZm
	cEYtdWzySBfPx7ylEjNX7pA1CtDD8tKxwEgIexM6S1U0RVE3J3G99x8T7VUF/mdu
	OlHwKfxcB/sLV+Zjwbqhi8sbQYx9CizQ4BtCxrbE0cb8lF4ReZ1c0jf5X3sVF6sp
	CfaLtqkzRVAwPNaEIDTCCY/OagsWKbBoW1W+1mOmerZpKpp10awHlJ3iJkHfF3xq
	0ECb7Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p9c4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 23 Nov 2026 12:44:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495a1f5e47so535088585a.1
        for <ath10k@lists.infradead.org>; Mon, 23 Nov 2026 04:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795437895; x=1796042695; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVNW92KPaOSF54gmCgO2UWmCU5MAh/fhPfGmPOmNVdM=;
        b=gtYi0MuMRfyWrGZxsxOPfLUuznKpZYDflKmhJq2hPDmhJ8xx2fCDoA6wOsuV0aJAAO
         +8Nu1Tzd2kPBRQcQD6TmQthBOG+e3jkA35ttAdKivHOW7s0Xi3LuUf+w7jklRz9sWZ5J
         G7bYeLM7yxEoLFsldvHlGYEEoaCmS7Dxjyc823SBUgicW72s1gqa6cBCD+m6sJTR/4GP
         cUbPyibFSZ78xUWS6vX9s/Qq1lVY0HDwDLA1QE9D6oFURpEzpY2gFGH1Wblm+6oFsF8x
         IeeZH+n/X0xg6qzlAgoHhmdfXjPBxi1YCSJmkH0BEdnOcDPto/8vLqfjZzz67KqgGilL
         EKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437895; x=1796042695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVNW92KPaOSF54gmCgO2UWmCU5MAh/fhPfGmPOmNVdM=;
        b=0vNIcq5PRvkFj0JyWnDV8L5El8tOaSVZEpl4uw+i7TjOsC6azvEwW1ZV4afiimkZWC
         bCJPvANwguAdaob2m30L1RSN9HtmJt4n6xA5/ldJSJKqpA2A1vq+IoHKcLJpDr1k44V2
         WB1djvoC9lYhkKtePYRAp3Dg5zKBZqcP3EUMcSbbmoIJYlt5w+oZgZjXlYmkWFCuMbHf
         B9ZXMTTOT8cZW9/AFDkwXmLT0MsfFkW9a1uqEtqDq3+LxdcSDK6sburtbqWeJKyJK26d
         CyPz7PzDYkruUHgCDW4QIguP1/MdcVavtPA6uBLSR9g8D/VvgDpypp5sT2XgER0lcAWk
         JdwQ==
X-Forwarded-Encrypted: i=1; AL+hErESYujBjKyhKnzCWPkHGyahQgOPpGEoaiWv9nHl/S7hzEiMpH8f2n5tahErEAg9RvhRznPKVqY=@lists.infradead.org
X-Gm-Message-State: APuU4Z8slnr+gtxEXlcQfW6Ftt0NSCn8VJp0StqRrlMqMNHYSmTtLM47
	oEPEhWrQ3kxDWffhBP1MUmfD/OhbfgWGP88H0CGjmuCRZZQtDqLe9wTDoMQLgDktnixIAYdTq+3
	dFM0aF2mMiFCzTXbs0RSCfwM87ZptUDzNWiErwxB8tg73qaw2tVnd8ExHrHGXtt72
X-Gm-Gg: AZFdTZerFvkg6mkcyeTG2bmAxhjyVmD7cEqjz8ZlHHqisnGliwk/1tNJd2BlfOqbvf+
	bwA+sIM8U82HehjsVPkLKKhq27pKmVe6yBNynCFkpkhIL3LYXy0RTkYbUM2LRwPIK2toyh7a9KF
	pDjhn3R8zyYdh3ndslqarerk/nwLiKqgRVA6098IKvZsIxZrKvHdpSp2MFr9Pt1P7AV24fXO1Wx
	KQK5LLhuzV3Wckqd89RNxlh0SKUnrbq5BmA7NLgLChbo9kI3dsBgeqtiCYO7lGS32QoJAM+1Z3j
	3x1RrGtzuQnKvYqa12mDbE+WCxFinwukiVIanDmdkoLnSX3t0LASlf3/6oD+MHQtyBNTko4AlmV
	X+Yuh1MTEU0HAnku1XwE5J5NZ4lFuIvJTwaB4BLrfNwl1ceqCP3bsD++AK3x/8ZWldiRoBL//eM
	yBHLE8lnQJphSUQW3VSuM8v7D3saIsXxw7uTXKcw65iL+E/203qbYpdqH4G/NZFo92v23D6pLod
	gNDskCMUE//uue1SKvXP2vYXWAz
X-Received: by 2002:a05:620a:460e:b0:949:7792:1106 with SMTP id af79cd13be357-949ba823b70mr1899685585a.1.1795437894329;
        Mon, 23 Nov 2026 04:44:54 -0800 (PST)
X-Received: by 2002:a05:620a:460e:b0:949:7792:1106 with SMTP id af79cd13be357-949ba823b70mr1899679785a.1.1795437893752;
        Mon, 23 Nov 2026 04:44:53 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm649355875e9.4.2026.11.23.04.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:44:53 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:44:45 +0100
Subject: [PATCH v13 2/2] block: implement NVMEM provider
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-block-as-nvmem-v13-2-96ffe1f59332@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MCBTYWx0ZWRfX22c8d9p4C5CN
 Wd0jBJj7JuUnNwP6ts8tdQMVzhTZyWlehUWFSIF2blNfY0oNEQTOlL9trC+BITc5rgy8k6VHLoZ
 mpCX5yrwjZCBcP1BxAhxI4xG6eVrHcZR9Be7GBZF5x3I9+R8YDO5ac+VzE4e32HUSHrN86/HeEN
 QSaOpumi0DW9uHan4I8vdu6prGKyQCj90RlITxzI5IzJviW2oAmYtcyRZPKza2mMnY78rWs7ggS
 820ZLamnmlo6angVJRSMrgMDrbMKrhRb48dkjM/EV835F0GcTWC00iVjrLvyYaVRgzpbVvZTcGg
 INOisrbWLQTS4SOsV3XI0ICrOp5mDjwaug+mWL1lD10Jchv03dX2B5weYUmA+JvFHH96F7JiQma
 tIwcfFvv6uFTpaJ70ZU78s166ljVDA0qgrjhQ49vKckVIbxPgG66h60vLdiPwwoIUIEGL1dL254
 4f88ra/j6O/uiS6LGng==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b043547 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VT4XjZGOAAAA:8 a=PlhdpwwxGme58_HcCFAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-GUID: VUXAfoSeyaTShUE2Jy8yEZoecMM4El1G
X-Proofpoint-ORIG-GUID: VUXAfoSeyaTShUE2Jy8yEZoecMM4El1G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MCBTYWx0ZWRfX15KEmlDZgapK
 MOWj8qpwFy/Fb8qZpUxkad7id65Nd2e8y3gQsau3DK/y4ShwZt+aQEqtfX1aOEQd2GVPOfbnt99
 +iqEpbCSAG1WfHE9UL/MJH+EvoRQQNM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_044456_543938_FAB7947C 
X-CRM114-Status: GOOD (  34.19  )
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

On embedded devices using an eMMC it is common that one or more partitions
on the eMMC are used to store MAC addresses and Wi-Fi calibration EEPROM
data. Allow referencing the partition in device tree for the kernel and
Wi-Fi drivers accessing it via the NVMEM layer.

NVMEM is registered for a block device whose OF node describes an NVMEM
layout, either via an "nvmem-layout" child or by being a "fixed-layout"
node itself (e.g. an eMMC boot partition associated through its mmc-card
node).

The NVMEM device is a read-only side channel onto a block device.
Each read opens the block device with BLK_OPEN_EXCL to keep other
exclusive openers away for the duration of the access.

Both the registration and the removal of the NVMEM device are deferred to
an ordered workqueue, because they may run from under disk->open_mutex
(add_partition(), drop_partition()) while:

 - nvmem_register() can read the device through ->reg_read() to let a
   layout driver populate its cells, and
 - nvmem_unregister() waits for the in-flight readers to drain.

As ->reg_read() opens the block device, and thus takes disk->open_mutex
itself, registering synchronously would self-deadlock, and unregistering
synchronously would deadlock against a reader blocked on disk->open_mutex
while holding the NVMEM SRCU read lock.

Keeping the queue ordered guarantees that, for a given block device, the
registration has completed before the removal starts, and that the removal
of a partition completes before the registration of its replacement, which
otherwise would clash on the NVMEM device name when a partition table is
re-read.

Consumers looking up a cell before the provider shows up get -EPROBE_DEFER
from the NVMEM core and retry later.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 block/Kconfig             |  11 +++
 block/Makefile            |   1 +
 block/blk-nvmem.c         | 197 ++++++++++++++++++++++++++++++++++++++++++++++
 block/blk.h               |   8 ++
 block/genhd.c             |   4 +
 block/partitions/core.c   |   5 ++
 include/linux/blk_types.h |   4 +
 7 files changed, 230 insertions(+)

diff --git a/block/Kconfig b/block/Kconfig
index 70e4a66d941ff66ecb0ec34f4f7eff7fd1e4be40..4899ad572c71ffdbb62460d57623216254893ddc 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -209,6 +209,17 @@ config BLK_INLINE_ENCRYPTION_FALLBACK
 	  by falling back to the kernel crypto API when inline
 	  encryption hardware is not present.
 
+config BLK_NVMEM
+	bool "Block device NVMEM provider"
+	depends on OF
+	depends on NVMEM
+	help
+	  Allow block devices (or partitions) to act as NVMEM providers,
+	  exposing factory-provisioned data such as MAC addresses or Wi-Fi
+	  calibration blobs to the drivers that consume them. This is
+	  typically used on embedded devices where such data is stored in a
+	  dedicated area of an eMMC, instead of a separate EEPROM or OTP.
+
 source "block/partitions/Kconfig"
 
 config BLK_PM
diff --git a/block/Makefile b/block/Makefile
index e7bd320e3d6971a8abf584f5de42776bb54e8216..8200297fbcbab304beb4239d0c33da07011c3ed9 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -39,3 +39,4 @@ obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= blk-crypto.o blk-crypto-profile.o \
 					   blk-crypto-sysfs.o
 obj-$(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK)	+= blk-crypto-fallback.o
 obj-$(CONFIG_BLOCK_HOLDER_DEPRECATED)	+= holder.o
+obj-$(CONFIG_BLK_NVMEM)                += blk-nvmem.o
diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
new file mode 100644
index 0000000000000000000000000000000000000000..628681f6b747b865100bcaec18ea650b08c6972f
--- /dev/null
+++ b/block/blk-nvmem.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * block device NVMEM provider
+ *
+ * Copyright (c) 2024 Daniel Golle <daniel@makrotopia.org>
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Useful on devices using a whole disk or a partition (e.g. an eMMC boot
+ * partition) to store MAC addresses, Bluetooth addresses or Wi-Fi
+ * calibration EEPROM data.
+ *
+ * The NVMEM device is a side channel onto a block device that stays fully
+ * usable. This is somewhat mitigated by opening the device exclusively.
+ */
+
+#include <linux/device.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/nvmem-provider.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+
+#include "blk.h"
+
+/**
+ * struct blk_nvmem - NVMEM registration state of a block device
+ * @bdev: block device backing the NVMEM device
+ * @nvmem: registered NVMEM device, only accessed from the work items
+ * @size: size of @bdev in bytes, sampled when the registration is queued
+ * @add_work: work item registering @nvmem
+ * @del_work: work item unregistering @nvmem and freeing this structure
+ */
+struct blk_nvmem {
+	struct block_device	*bdev;
+	struct nvmem_device	*nvmem;
+	loff_t			size;
+	struct work_struct	add_work;
+	struct work_struct	del_work;
+};
+
+/*
+ * The queue must stay ordered: it is what guarantees that the removal of a
+ * block device completes before the registration of its replacement, which
+ * otherwise would clash on the NVMEM device name, e.g. when re-reading a
+ * partition table.
+ */
+static struct workqueue_struct *blk_nvmem_wq;
+
+static int blk_nvmem_reg_read(void *priv, unsigned int from,
+			      void *val, size_t bytes)
+{
+	struct block_device *bdev = priv;
+	struct file *bdev_file;
+	loff_t pos = from;
+	ssize_t ret;
+
+	/* open and prevent other exclusive openers */
+	bdev_file = bdev_file_open_by_dev(bdev->bd_dev,
+					  BLK_OPEN_READ | BLK_OPEN_EXCL,
+					  blk_nvmem_reg_read, NULL);
+	if (IS_ERR(bdev_file))
+		return PTR_ERR(bdev_file);
+
+	/* the minor may have been recycled since the NVMEM was registered */
+	if (file_bdev(bdev_file) != bdev) {
+		bdev_fput(bdev_file);
+		return -ENODEV;
+	}
+
+	ret = kernel_read(bdev_file, val, bytes, &pos);
+
+	/* yield the claim synchronously, the file release is deferred */
+	bdev_fput(bdev_file);
+
+	if (ret < 0)
+		return ret;
+	if (ret != bytes)
+		return -EIO;
+	return 0;
+}
+
+static void blk_nvmem_add_work(struct work_struct *work)
+{
+	struct blk_nvmem *bn = container_of(work, struct blk_nvmem, add_work);
+	struct block_device *bdev = bn->bdev;
+	struct device *dev = &bdev->bd_device;
+	struct nvmem_config config = {
+		.id		= NVMEM_DEVID_NONE,
+		.owner		= THIS_MODULE,
+		.word_size	= 1,
+		.stride		= 1,
+		.read_only	= true,
+		.root_only	= true,
+		.ignore_wp	= true,
+		.dev		= dev,
+		.name		= dev_name(dev),
+		.of_node	= dev_of_node(dev),
+		.priv		= bdev,
+		.reg_read	= blk_nvmem_reg_read,
+		.size		= bn->size,
+	};
+	struct nvmem_device *nvmem;
+
+	nvmem = nvmem_register(&config);
+	if (IS_ERR(nvmem)) {
+		dev_err_probe(dev, PTR_ERR(nvmem),
+			      "Failed to register NVMEM device\n");
+		return;
+	}
+
+	bn->nvmem = nvmem;
+}
+
+static void blk_nvmem_del_work(struct work_struct *work)
+{
+	struct blk_nvmem *bn = container_of(work, struct blk_nvmem, del_work);
+
+	nvmem_unregister(bn->nvmem);
+	put_device(&bn->bdev->bd_device);
+	kfree(bn);
+}
+
+void blk_nvmem_add(struct block_device *bdev)
+{
+	struct device *dev = &bdev->bd_device;
+	struct device_node *np = dev_of_node(dev);
+	struct blk_nvmem *bn;
+	struct device_node *child;
+	loff_t size;
+
+	/* skip devices which do not have a device tree node */
+	if (!np)
+		return;
+
+	/*
+	 * The layout is described either by an "nvmem-layout" child node or
+	 * by the device node itself being a "fixed-layout" container.
+	 */
+	child = of_get_child_by_name(np, "nvmem-layout");
+	if (child)
+		of_node_put(child);
+	else if (!of_device_is_compatible(np, "fixed-layout"))
+		return;
+
+	/*
+	 * Sample the size here so that the value validated against the
+	 * nvmem_config.size type is the one actually handed to the NVMEM core,
+	 * even if the device is resized before the registration runs.
+	 */
+	size = bdev_nr_bytes(bdev);
+	if (size > INT_MAX) {
+		dev_warn(dev, "block device too large to be an NVMEM\n");
+		return;
+	}
+
+	if (!blk_nvmem_wq)
+		return;
+
+	bn = kzalloc_obj(*bn);
+	if (!bn)
+		return;
+
+	bn->bdev = bdev;
+	bn->size = size;
+	INIT_WORK(&bn->add_work, blk_nvmem_add_work);
+	INIT_WORK(&bn->del_work, blk_nvmem_del_work);
+
+	get_device(dev);
+	bdev->bd_nvmem = bn;
+
+	queue_work(blk_nvmem_wq, &bn->add_work);
+}
+
+void blk_nvmem_del(struct block_device *bdev)
+{
+	struct blk_nvmem *bn = bdev->bd_nvmem;
+
+	if (!bn)
+		return;
+
+	bdev->bd_nvmem = NULL;
+
+	queue_work(blk_nvmem_wq, &bn->del_work);
+}
+
+static int __init blk_nvmem_init(void)
+{
+	blk_nvmem_wq = alloc_ordered_workqueue("blk_nvmem", 0);
+	if (!blk_nvmem_wq)
+		return -ENOMEM;
+
+	return 0;
+}
+subsys_initcall(blk_nvmem_init);
diff --git a/block/blk.h b/block/blk.h
index 105fff157bfbd453ae4cfa993e8971ceb36d916e..0920afd23e9a701842f522243c246c75bbd49f54 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -839,4 +839,12 @@ static inline void blk_debugfs_unlock(struct request_queue *q,
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
index 69204d44adae11eb8bccf5db8d5d5eaa0fa186a8..39adc6f5e44cf736161c67e63602249a32b42751 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -417,6 +417,8 @@ static void add_disk_final(struct gendisk *disk)
 		 */
 		dev_set_uevent_suppress(ddev, 0);
 		disk_uevent(disk, KOBJ_ADD);
+
+		blk_nvmem_add(disk->part0);
 	}
 
 	blk_apply_bdi_limits(disk->bdi, &disk->queue->limits);
@@ -708,6 +710,8 @@ static void __del_gendisk(struct gendisk *disk)
 
 	disk_del_events(disk);
 
+	blk_nvmem_del(disk->part0);
+
 	/*
 	 * Prevent new openers by unlinked the bdev inode.
 	 */
diff --git a/block/partitions/core.c b/block/partitions/core.c
index eee954df1ac6ef7dd4f02ad5c9d49aed778bf015..c83227710584a6feb25c8abae3b319cfae9cce5b 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -289,6 +289,8 @@ void drop_partition(struct block_device *part)
 	xa_erase(&part->bd_disk->part_tbl, bdev_partno(part));
 	kobject_put(part->bd_holder_dir);
 
+	blk_nvmem_del(part);
+
 	device_del(&part->bd_device);
 	put_device(&part->bd_device);
 }
@@ -406,6 +408,9 @@ static struct block_device *add_partition(struct gendisk *disk, int partno,
 	/* suppress uevent if the disk suppresses it */
 	if (!dev_get_uevent_suppress(ddev))
 		kobject_uevent(&pdev->kobj, KOBJ_ADD);
+
+	blk_nvmem_add(bdev);
+
 	return bdev;
 
 out_del:
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 644b9528f2749f82df4d014adc0149dc42c986a8..8f2708e4075e7390ed58ef764ddd4684d4bc1458 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -15,6 +15,7 @@
 struct bio_set;
 struct bio;
 struct bio_integrity_payload;
+struct blk_nvmem;
 struct page;
 struct io_context;
 struct cgroup_subsys_state;
@@ -74,6 +75,9 @@ struct block_device {
 	int			bd_writers;
 #ifdef CONFIG_SECURITY
 	void			*bd_security;
+#endif
+#ifdef CONFIG_BLK_NVMEM
+	struct blk_nvmem	*bd_nvmem;
 #endif
 	/*
 	 * keep this out-of-line as it's both big and not needed in the fast

-- 
2.34.1


