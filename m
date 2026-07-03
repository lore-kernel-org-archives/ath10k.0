Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898BCC43458
	for <ath10k@archiver.kernel.org>; Fri,  3 Jul 2026 13:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwhIzMOLwD/T1MG78AEfie5XOqWGm9fdRJaKy1+95/o=; b=S82G6MkmIzM62H6+tfWEgT/kYh
	Wy158p9XmgTNYfkT1c9uyJButwfPQKTDB7xUxem92r9bsgtHmgpyZm5t+/aYrzH1W+zcyMuHkXowt
	VAwSpo3GxZuWhZut6V0Luji3imeGLEKSpoApSh3xBQEvfETjCh6upXIDDkOqmU+d/KaGuW0SDSm9x
	Rel2ISa431s/bxQpqTBdCEr0pSL29LUugiGnvudUStKd1znuIiFyBZ3S2iEZgadx/DelUzJGPUdeY
	wiqaIJZxNae2scuq8tCVsCux5+5aVn7YpVm3Vn8WZtCfOSOnFzthrtB9N4c7yRJxvsDyEh9tg6/AT
	oP8LFUYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeD0-0000000788m-41h4;
	Fri, 03 Jul 2026 13:45:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeCy-0000000786o-0PqW
	for ath10k@lists.infradead.org;
	Fri, 03 Jul 2026 13:45:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663A399W3773578
	for <ath10k@lists.infradead.org>; Fri, 3 Jul 2026 13:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AwhIzMOLwD/T1MG78AEfie5XOqWGm9fdRJaKy1+95/o=; b=Z3c7nV1PTRoHjP9Y
	N8NDqCV0gtQJFr0W6O1wUDef4OW1eTa7rUWJcI+L3YuZPAYrKIcWudhVKzTJqrJZ
	eb8HX8BJlDfPhqHG2jSC/hXQilE0PXXKmZ/EXQukwgOqzO7ShYU5tnZ9sGpb5/lD
	7nQTCQR4TcNLAguTL9DWCbTEh0LP/73+RhvONYTPVoYavquvmBeDzrHwrI6hcJqC
	GmOV22R4aAteWaxzLt8ZOebOd031WA5/81BkzbBNFt/yQnXsvV37lXp+vd7Dc9me
	M/Bixtazx6p0hww+H1DWI4pq7M76d95uIY0eGBfVH2w/mfeJPD8nzdIBx4LRNVld
	RJCFBQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b038tyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 03 Jul 2026 13:45:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e663c29f2so68295385a.0
        for <ath10k@lists.infradead.org>; Fri, 03 Jul 2026 06:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783086330; x=1783691130; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwhIzMOLwD/T1MG78AEfie5XOqWGm9fdRJaKy1+95/o=;
        b=AoWW4AHaRwmCv2S7fQd6bi6CIGzYlrVT7ueAu00luRfMxhH1DKEorQg7hrOFbE9zSJ
         klMZEkwbU7N5Mfm89/bDjyoOEwAoZy67BtnyAu+O5IyDY2FbSP6kYlPamrJ7asnTyfsz
         4vuSSxdJULy0enPlGnWQNmNFg8NYcGDsrFwG0yaCyIN9HM5B0k6KnMy5RaLmoHbwTtfZ
         EJbI63To4wEMgOm76JDR1wnzCCcNbFQqD2TUV/WR+t4aKecVG7JMEHg9AkTuk/Q7Ra6O
         ndtMPmq7wa0KW3gUUyOtzuDqWBMcSwdf6wALscnIoGdSAa2U7SLgF75bgR/Kx9bPesTl
         DVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086330; x=1783691130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AwhIzMOLwD/T1MG78AEfie5XOqWGm9fdRJaKy1+95/o=;
        b=cQWJGWiYWyWZVwDZ7nXrrPdoMgqjRNjCgBLQQFQncGwOrPo41wdG0Y6Ax+329diFHn
         aoPeJozJsMpfqsr6Ay2bi1PKyiOvKFo7JSWoZEUx7egAbnylRtQKx6NlGHGSkSgmm5Ft
         1zCMR+w0QetozzxZ59drzBtE22VPbqUCOUx8C7bN5AcP82Y3w0y0btVZFwtwEtH04x7Z
         IyJz7FuSxHJpOObGomW2JCZchppdXJXk5CT50Q1+2vPieWz1dk+D0JCiFR0c7xrcYBKU
         8kx45civQIhiM90iwE/Ghhk9/vr9cykrLirs4WlBtT9XVFGxUvPzWU/1BbY5e6efUGnR
         SgZw==
X-Forwarded-Encrypted: i=1; AFNElJ8Bp1xkFcHz5OX7C/pIlxNFU27gPIPWGfAX9+coYi/zEMUMPy9cG8sn4fhzUqNdp/Y+9bqk70w=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjgsrlXOC9hJaScT2Nde+x+H+DWepRssGT5K2AISllJgKudHIb
	+0qnRuPh3CMan3ge5CUpPerRdkU/ihCx9IFrF4jHVWSJ2ZSmL/fJXW/GFFkq7YCXqzBWFwUeoSm
	eM2JeLSIGA3axQMqrs7Z5P4NgztVkSRCYUaXjsjq1vKJlz8hm54IV+OKdblPVCpfW
X-Gm-Gg: AfdE7cmhXEZv4Z4MIJOwirNiqGEoWVPFyofxblZ5zI0UqClANn4N0DGAq4hsOmzr/o7
	5PIO1K6tG0GsIP+9dY9epugajk3WaGDm7s9VqtfpUsKMgsxwCD/SJqiB08Hyk9bBbKtbXJOuJO9
	gtSR8Z3sMwXHR7UcrsdihpMcymgbIaJ8sSWqzPgLy9M5fMroyKwCIaRFLMIE9BI852RtCz/4vAL
	8/bCqKMjn16nz/Ik2gSWJ0dQS3UrVuNw7ZPaRwNq9W/plt31mrb2fUEploJ1+U3t0fDLcZXVauH
	yX4sYOLGlzQdO7M2n3N6NTHLW7oQhwcLjCj1Gj4PW5i4rLwjGnejQevtso9qutT+lQo7jN5cLv8
	pYrLBYmc2Hj2HjPeNw/nkLsFteCjRnAHcPlegeTU44uoPEGAWjDlmptLbEDAh+1QnfH4AOqhAoA
	aGiSo4P3fI0QgU9uBtq6aJbbZoI5zq3nu8TswUMJ29rSylq97AewqumKxDRLgfm04=
X-Received: by 2002:a05:620a:7007:b0:916:5f5:de22 with SMTP id af79cd13be357-92e8b29ea54mr485346585a.12.1783086330531;
        Fri, 03 Jul 2026 06:45:30 -0700 (PDT)
X-Received: by 2002:a05:620a:7007:b0:916:5f5:de22 with SMTP id af79cd13be357-92e8b29ea54mr485340685a.12.1783086329977;
        Fri, 03 Jul 2026 06:45:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm286135466b.1.2026.07.03.06.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:45:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 15:45:17 +0200
Subject: [PATCH v8 4/9] nvmem: layouts: Support fixed-layout as the nvmem
 device node itself
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-block-as-nvmem-v8-4-98ae32bfc49a@oss.qualcomm.com>
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
In-Reply-To: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX4GcJwq4ra6I2
 pqe42RYEa41DLc0bdHcfdr+f6AQ72bxTiCKhJCK6TPCXZYZOGIkqsGJh5FhEhGVTeUjEwaFFMNX
 5Lr67l8oSnk0Rr0UoteGVunBNsPxbV0=
X-Proofpoint-GUID: ESmapcArQKYzhXL4yavXNqDoaoNqI1-_
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a47bcfb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=4SYEPDBQci7QR0ImIkAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX9wjhZRaMr9rT
 MGXST1ILtsKk+gaoErkCfAT1+T6GVzGo9mcGaHXnmZlnxh7sms4h7wEcOvoPh5K4Ovpoy39F8u4
 hl2oB+4QBkBvO6X9bFh52OQUCqwXvlsMtmeanKJjjvzh3wej522vRS0MQHQhD7tovYffN8/Qsyr
 asu6SmMfEm76wRp8cYNkktoI/Jt57T4Nq77rCzC8pj2z/BpiihCoQDuIBZ5gD2O0PFVhVtzbIQE
 lVa23rW4guuaSaAPDSobAgHn5TSdaNcrKO7m+M/ReRp4wAffboEkgzPogwK+Nw7dw/bkfgpRFg5
 2X94FzHqTYSa9FTSW39mhTGsfTK+5yB9ABRmW/mU1ZCbSpCn7La1zzF/S+BbbREoYjFCXXhQhkv
 u16bSj4piY3Cb7bUMR9rrTCSt8CRmWpS2hhu9TsaAtztbaN5+jJ/0AgUrDzH46HkDV0MmOmvFNc
 XboPZ2nw7MrCi+d8mRw==
X-Proofpoint-ORIG-GUID: ESmapcArQKYzhXL4yavXNqDoaoNqI1-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_064532_260411_714261C0 
X-CRM114-Status: GOOD (  15.54  )
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


