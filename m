Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FA5C43458
	for <ath10k@archiver.kernel.org>; Wed,  1 Jul 2026 16:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwhIzMOLwD/T1MG78AEfie5XOqWGm9fdRJaKy1+95/o=; b=36y4Nid6HRUai2XGiyaXVv0QiM
	KIXEKczwAAH9kRvRis/48S/7LryLBo86GU5yDUBScvN703+5h93Uf8ZzFaeFxSKLTO2NwcNeFdWPC
	JP8Q9C1lbJLN03uUfQiR/yjXHJPSmi3jtZ2Zo3iBK0iMk7nY7V4Q3t+19CV5f9PJNWEWjNEHgS+nZ
	yny4LGZM0ZRbzFKsqHpEjfY5ct7RLthNb+/59q5XartbojMmBEe9ZW5VAhRYhgs4RVPQM/Mm0s2Dm
	TVnsNNVTjGVWg7Q+pbAp3WH4+XOOmA+oVx94p5Lzsde/IlzQz388U/bHM/Dsz6YDGAdIffIy5OONY
	b3YQ9VCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexMo-00000002Sev-16PB;
	Wed, 01 Jul 2026 16:00:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexMk-00000002ScA-2BR0
	for ath10k@lists.infradead.org;
	Wed, 01 Jul 2026 16:00:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Fo9Y91551241
	for <ath10k@lists.infradead.org>; Wed, 1 Jul 2026 16:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AwhIzMOLwD/T1MG78AEfie5XOqWGm9fdRJaKy1+95/o=; b=nI3M/mnSsplZXCvM
	E/yYWLSoIqVEdpGFBU5EwH/Gviv1hba+cB9tv/LWQc6yso+5yoIZl1/xERs98BVh
	sUlqRQWuUucfPwKyfl23pfghMzXqv9lYjjWJiAJlyLjAek/1pPn7EwsvDnP2KnMn
	aMGOlhKXkir+AMRgLkTzqcIl4N7QIjfUmZRiHs4qNQJZBFxExtThHLQ0YwH8Xc/8
	HseoertmTvfR5JrtSYZysP7IrkkfEcR6FYBk9RoiEfuCccjqN9ugmqnuryXBXknT
	oHIwJnvbojDg7qcYZGPfmki5GpS8DwHb7PMycCUrRljDrLi7zNo0MsCqNOVSHcH2
	K+DsXQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw4wnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 16:00:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e38fbc5so101089285a.2
        for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 09:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782921644; x=1783526444; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwhIzMOLwD/T1MG78AEfie5XOqWGm9fdRJaKy1+95/o=;
        b=A1n277l3MpB4BJ/K4RTJmrga68+yUatoOaRkjlyA28RGi7k10VQiFkA/P5iLgL1+2/
         UJMeJYM2fdwL4G6F/TFp4RUvpUDyA4AYf01ENF12wJ256dfyrP5i50H7+QibrogBxhOk
         vsbUJ2tHSwnmm6yOo/AIsDreQGY5rrnb6TJD+Ti2u5odjmgTyOqhbDwA1D1cXd8d8WXN
         NyCnLDdXYAjIX2I2+r8PuVA6tdIXeJJs0XBZdilsMEvskH1KUiTWjbOL7NmK0/+EGAxF
         8FN0FWQIS645G/rfK4skF2JU2Tw/gJB8wGwImm1yIOoVXqR86HTRvztzKBGRZpzCktDA
         cItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921644; x=1783526444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AwhIzMOLwD/T1MG78AEfie5XOqWGm9fdRJaKy1+95/o=;
        b=fh72woDID7Uq0097aBEcTCvg4PJYMO5KC1W6c9i/6BeljXZeo9y8wQG/W5MOhuQVFv
         Tu4m+xmBYfz++JA9irIO5e5J23XYCtfbMfkCqsQo8c12JMVN/mogNiOnb31zkFtu6Zmy
         eSHqDMt3wu15s+uFox81rK9nXyUO1ZqnmzOU/OnHwc9FIxqVMhQBORYW0WLp5RB969Cw
         iYluR+QD+5sovbAOYtI29hmUEFT+Z+gJm2jZ9RXHcdGJNV45D7c3bR6aXEed1ZdrIbOp
         rrhqxmyf7aOztIsk498jRgal4gdYM/RdunYo+B1vekIFltIiaANFAY/iMR6+9lfyakJC
         62Ww==
X-Forwarded-Encrypted: i=1; AFNElJ9ICugJnaf62MVBJqAle19Vf+g2V1zh+dh0h/x9X24ReUC65ie73cMyurSrVgtZEBBU2sTScZE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmNccTnJFmCCgrc2lze2U2zHyfif2Y8Ciiio6IfxLlzOHFv90R
	f5SftgIxp3MWWb8lnq9/gLCd9m91jCs5yjvjZTGu6q+O+R6AhTxt0O5rpY21KB0PFouD0L/4v9c
	3/UhCNOeS6MRvv4ymAMx9lDb7ivsmO41kxRG/+8c5Hmp40bTHT6fp5muPRKFx+S3i
X-Gm-Gg: AfdE7clRVvvaCXZk8SNvgkR30hP15Kjd7i9fCVPc/U9avKlXOGD7UV4lzY1a9SKkCft
	Sg94NNqyiR3G5jmGsc6Dj+2sZlaW9pa1Fz6Q+Hrp8YsgLatPfa9Op1c9rMmUfGPw5IJElz1oGUg
	IoQUnJOADCd65oon+XqQyAvA9zGwuRsU1PC7u4q0lwhsYHZQzU0P3gJ3i4oY17D0sDLC1jbBxBM
	yzlxWKCMF3DyD+x0ld1PFEVquzboywV9ov/jXw87fqFsdGy0fDQH4IEM2Jsu7EMaTpQLbpi4PWi
	cYkgQqHHpLl3oDvtWCUJgDjhVYv8KcHuR4qoylWFKzV6Gp3j6x6N2lS9QqdaugRI3+QlIMuzb0a
	Q5RA6bqD6fcSgGRqgkJy7OYX6RV0nNQKIK3xb/4UHWM7OZ1mA3wDIbuuxsEMw/lUIF6DD3KnUX7
	SMqeVQz597I6ByAaRe6YTmYUvnw52cyNWMN3k7yOZ+WP7k2do6BoKrGBfBBhKHv94=
X-Received: by 2002:a05:620a:6086:b0:92b:3720:bc59 with SMTP id af79cd13be357-92e782578b7mr323527485a.28.1782921643139;
        Wed, 01 Jul 2026 09:00:43 -0700 (PDT)
X-Received: by 2002:a05:620a:6086:b0:92b:3720:bc59 with SMTP id af79cd13be357-92e782578b7mr323511985a.28.1782921642439;
        Wed, 01 Jul 2026 09:00:42 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d19e03sm296613066b.4.2026.07.01.09.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:00:41 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:00:28 +0200
Subject: [PATCH v7 4/9] nvmem: layouts: Support fixed-layout as the nvmem
 device node itself
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-block-as-nvmem-v7-4-3fe8205ef0a8@oss.qualcomm.com>
References: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
In-Reply-To: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a4539ac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=4SYEPDBQci7QR0ImIkAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 0iuOCJVa0F3C4oLU6AUGCGf4jxYhidaY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX5cusV7E6Nr5r
 xgi93DltUDUU2rOf5VEKI6Zx/BKDd2p+CgzcIC7LaJ81Pj9+clXJ8Tvg/wHtPb7WIqcSb2mFJy6
 9G6zK4j+uNDCOV6B+ZZqm1oCDtGE5vY=
X-Proofpoint-GUID: 0iuOCJVa0F3C4oLU6AUGCGf4jxYhidaY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX708iWF6UrWBi
 5tY4oZ4ul1wzNb5b3eBAHR/2u2ziq3RnvWhkCtn+pnGfudtxAgCyg1gNIWFXg39eP6un1tGQQ4H
 m+bIA0TjKRjo+3i8FLuh6OTWJuzyd+tKQpLTETtCtsL0H67Kd7UPc38D2/cUpQb+zc94m2T0dXk
 OWOfudpVkBITTEvrxF2yd6r+G73177NfitqK/j7tPZZlvzCUKz36GbFBInh28yRGLounlI5Z1EM
 UEU7huRZXX2HngkB6dneqK+qIcoo+4e8Lpmp53sCvr71RcmZriKL/eZYVk4D9idQAtqwz1y/GvH
 gTDmZMJ9NansWODZiWi2toHUbgRtfS8KRUmn9M9A81Xkg5acxfU1odjOdLIiH3ops9gnfG9A5KT
 pKbjqyuVlrn6XM2ugomwBu91sdyRL+HJF6/z8vBEW0EOTtTzrNO7I+bwzHF/U9LmkhFa86g26iC
 MvXgp5xCam3L/ANvu8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_090046_684530_1D6C9DE1 
X-CRM114-Status: GOOD (  16.26  )
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


