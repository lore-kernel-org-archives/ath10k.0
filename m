Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47CDC55166
	for <ath10k@archiver.kernel.org>; Thu, 30 Jul 2026 16:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLlLllLuzegCOZuXn5+dUp09HoQyVIGVgRcx14v62PM=; b=O4RGy+DX6wimUGJSlf/3SC79EL
	/AbetpIkNDo3OmAzw/1GYgcJMwp5HDroBvNgYq+UlGQ+OL/NylhaER715Trjid67MX2RCHMiucPLO
	Zakkjgsm82aaOquB5vv4bPrUy0VSdTAJravyDRGILv8o+KsYp0ujkjmSFZIAiZZkp8n1W8Myr7dgN
	3Cc0VzRYK0dfLzpl75bZzGQZRFDd/IMYDj/QUjIkTyXolI+khwNjvaXa60MraBGeknd3tQj0pHwoc
	/i1n4sZN88715+M+ktT0vuHad0enw5k5b63MrdBzpiBB/gwyjUPwWWBgUh+SsUjuyQAWzdU4wxVR+
	CkCAQ6/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTBq-0000000AuQC-2fRM;
	Thu, 30 Jul 2026 16:00:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTBm-0000000AuOA-3MFB
	for ath10k@lists.infradead.org;
	Thu, 30 Jul 2026 16:00:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQq1B1087311
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLlLllLuzegCOZuXn5+dUp09HoQyVIGVgRcx14v62PM=; b=M/jRX1TpvMeqUO/P
	PVSImvtbdOfYbcOhO0VXezo+gXswQjqaHNvsJ3Mbp0b8x8Kyeye2BSJbUG+/C4Rt
	9KdEnjt9DqMob4WOB+dpqLM+JfKHUAxy5gSjY/BtUJQncrKHUO3/rZv5R7u03tOr
	AXHcTNZy+Q2+koiThYECm5Vu07/NgdJWrdfhJ3F7qhjr9L6LeZ5c50O+NZVOiuce
	JCPyjNPfpScmNOyxtR2uei4gtyrYng/bz0zpFaKDRapZKZNBpGa0ocmPhQ/ESFPY
	ubUJ+4lOJYsrXa2QlWRB0oI7usRTN7gqiJfSihZeCr9DbkBPMJ1bF3tPXJbYuewE
	5jcxEQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n38cuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:00:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so24538621cf.2
        for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 09:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427253; x=1786032053; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLlLllLuzegCOZuXn5+dUp09HoQyVIGVgRcx14v62PM=;
        b=kQNHyknq1mtDQcu2CwVg/7fG6Pu26romECys2zK4+DRsjF//tlnRYrerdu0jAAnEoA
         la2Y6CrywkOmFZslSUqK5QbRbcQVf/qPKR67J1H+txdzkP5UW0HavRNsGanvN7fUwV9j
         Cr58gF8OC98SdeYhz8ftJvBJQ5wKA8e0zHmWiWWamhuBjNEOOQUvNVoq31t3MoFMgVUw
         qGGbBDARlKoHPoO8E3MVPQJvmSvmDERAL3J4KJJcIyNw25CjnIXLhWPJ5B2szEU2rCKX
         U7ILb9a2v4uzxKLr/p5JRf0DuomCwHIhneraO5wK16Skda/y7yQEkBUJsVuyn4HcMPFq
         bDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427253; x=1786032053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLlLllLuzegCOZuXn5+dUp09HoQyVIGVgRcx14v62PM=;
        b=cOFHmQ8eu+zSHdROl41fP3CwI8Do5i8VIt3SRCXvNX9v7uElpdCnVS8UeI5unEe6Lg
         EDBoij3S70gJceeXiWlVZDPZ9F6NiTxp8BZi5GbnLD/F12soTo2c5qaZ0VvfFZXmaq+m
         EbEiHerc2ejoGg1Qe+YSGJoGwlTXxBt4oRg+PZW76BS6grGUVYZL8qsf0zokmqEUIqIS
         AKBJFPtVOFQ/+UundpNA8zXKqStOyIyLdn3WKlupB5lpo0aCX1f0RVx3Zk4J53mzHJDP
         9RRndgd1izk9aes2BKG2DMpY/NGjKM3irvwQ3tXVtug6J91U+eRjWsjQ8JEArXDogjQM
         ctxw==
X-Forwarded-Encrypted: i=1; AHgh+RrsKv6iI9Ht7iJ7n+T1hwxZZbSF8gaAbZgkc+67g8+yOCn9/ALARGMEcC7Uw6MZ9r/W22IJJCw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzeremqoHDubhxoNrQSFE64KvrSWjn1aM8iRBOgm+CaT2Ylm/gB
	7b5YRpughRqcLZbm1xMvsLi6cwnouJhjCc/S2B72JvGq1o3fzUxtgM9sJVGe2TU+k8VgPIZKC0o
	yIjceLu9583TSQhHVR2N25WK5jY5a/uQNEW1LAOgtGA9FVFf0HVCgrxhECm/78OzT
X-Gm-Gg: AR+sD109X5uF5hS6cJXqncXQVUND1I2bw7b5qzOWbayGAg1HddOmf0unT9beh/I6gcl
	/S5a5yLSq3k9BcmlThiiRZ5Tx3Hapu7xovOX0B/wMxtRNViFwj15s0OIvGQ97nD5FprFHKq25DN
	yrqjbCYAlmLXKvtP5S28oLlGHpItyGDB99BkY/AHdMYuDHHMp4dFKLyzmdIHauMVeYwIL7qDiLK
	sVEcf/j18GlyUcm4jekihIB+FBAy9KfJdR6jmZcgvXyLWt+E5GUBJjTTk572W0shZYhJOiylbuc
	8Zv0M0I31jrTs8fMjtub+ayjksRJauGuEOMRBDK4PBLkzX9gYmccqATQo4I7s9q4rrqjXaJBifK
	HYtzrBOhNxhT7PR8J9nbGllT1uhPzvxTtpDH1XX4mQbkbRGEYoeN+vbsKE2/nBq04sP0vUoNuG7
	2oWin7lix58EFeOp9XISqjFYwc3Gwvcmn6Tk46Mywa7lqguvCun0hK
X-Received: by 2002:a05:622a:4d8a:b0:527:73a7:ee21 with SMTP id d75a77b69052e-52b3871bcddmr35047061cf.86.1785427252169;
        Thu, 30 Jul 2026 09:00:52 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8a:b0:527:73a7:ee21 with SMTP id d75a77b69052e-52b3871bcddmr35046061cf.86.1785427251550;
        Thu, 30 Jul 2026 09:00:51 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:00:50 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:00:34 +0200
Subject: [PATCH v9 04/10] nvmem: layouts: Support fixed-layout as the nvmem
 device node itself
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-block-as-nvmem-v9-4-f72935817dbf@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Ar/eGu9P c=1 sm=1 tr=0 ts=6a6b7535 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=4SYEPDBQci7QR0ImIkAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: tPp_9WfQA-W17B0GPgdZ1xW5WTEsoOcb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX5rU9H5jHutLY
 vthl6BRD2daD3b5pL/tlPhnHZBOe8HcAuKXugDAizikoWMM/qAev2PHX6EexjyLdJNCcIyrQL6N
 UIwf7PaGjgwnOQCx0HIINupSpHhKiGWn3cUJYn+73HrLlTUSXnP3tGzV2uoL7zKVFyxoC6EmD5H
 2aDbY3uKtZSiTMTRKoqUie/hHYPgxnRD/657jl7XUvc0Gn4DdcBTKAmed/84Fbt7nKNZ1YXN8qy
 ML0EFsGz/3nzDrvq6jFR6qizqWY8SwdRRGn2dFhrPKz7oqIQeAd2EZANyU61rB354gL0PEHiLPy
 E1+a6hgN1gtPDOqHNNupPCXdHfpfw5uwA1uhOIYznwBVLK0WGtkgtVrgDwVV8sdK4if22C95Y+1
 CFGGPVwd8aTAKlGYeBG3dEOJ8WKu5Syrh88OKUvhuvU8yzZKMAB62xOeazN28h8wYckayV441D5
 yOa/sIPfraQEtgj3lRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX12eEt2Tn5YXD
 j9zuVvOdcsZ/RTH/xqBLUrlMkJHYmPC7eB64inAvTuitrySuoals8eZn1khIykMPkm/mMrlZeYp
 zy4lbpcLUE7PowOm0T+J+viQK40kVV8=
X-Proofpoint-ORIG-GUID: tPp_9WfQA-W17B0GPgdZ1xW5WTEsoOcb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_090054_981866_A41B4A60 
X-CRM114-Status: GOOD (  15.70  )
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

of_nvmem_layout_get_container() only looks for a child node named
"nvmem-layout" to locate the cell definitions. This does not cover
providers whose device tree node is itself the fixed-layout container,
such as an eMMC boot partition block device whose fwnode points directly
at a "fixed-layout" compatible partitions node.

When no "nvmem-layout" child is present, fall back to returning the nvmem
device node itself if it is compatible with "fixed-layout", so that its
cells are parsed by nvmem_add_cells_from_fixed_layout().

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/nvmem/layouts.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/layouts.c b/drivers/nvmem/layouts.c
index b90584e1b99eab4217cbe7ec48373e18a7caf0dc..efa631ce7283bdd6c8ecda75915911b5e3a33c99 100644
--- a/drivers/nvmem/layouts.c
+++ b/drivers/nvmem/layouts.c
@@ -167,7 +167,18 @@ static int nvmem_layout_bus_populate(struct nvmem_device *nvmem,
 
 struct device_node *of_nvmem_layout_get_container(struct nvmem_device *nvmem)
 {
-	return of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
+	struct device_node *np;
+
+	/* Search for nvmem-layout child */
+	np = of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
+	if (np)
+		return np;
+
+	/* The nvmem of_node is itself a fixed-layout node */
+	if (of_device_is_compatible(nvmem->dev.of_node, "fixed-layout"))
+		return of_node_get(nvmem->dev.of_node);
+
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(of_nvmem_layout_get_container);
 

-- 
2.34.1


