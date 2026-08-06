Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D72C56207
	for <ath10k@archiver.kernel.org>; Thu,  6 Aug 2026 14:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLlLllLuzegCOZuXn5+dUp09HoQyVIGVgRcx14v62PM=; b=kCaoMNqf6WxIKyXB5rISkEGe+F
	CmLuZgG5h53m5+azvm5xllMqJi2eFCm34sR3JpxqUIVmSRAdhgwTcYz7q9WYM4ozy09ngMWq6KL09
	lglTxKs2RoZ18TpBB/4QMf2Z6W0IHLF8YH4Qo+zo3h62jgkeUmfsw5oYP7NRFhVw+v/DxFtZA10x9
	dPcVJ53pjMLLMs6rPwn6a5y/K2qsaKOncodx0RGnNLIOBT9v3wdGdkfxcPa/WqMo3+u+t+n2cNFjS
	IdLWO8TrwHM5jIgC0wAIPvL8Tq3cxW+JPdNmKNqIOk39qmbvvsSYO5VLmskHxzzrKT3H5jS1qQRyz
	6j/W6JBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFN-00000005zZK-32R2;
	Thu, 06 Aug 2026 14:39:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFK-00000005zWp-3oYV
	for ath10k@lists.infradead.org;
	Thu, 06 Aug 2026 14:39:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nguM1308986
	for <ath10k@lists.infradead.org>; Thu, 6 Aug 2026 14:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLlLllLuzegCOZuXn5+dUp09HoQyVIGVgRcx14v62PM=; b=KOkasYZfyawfqtfx
	kp3fH+4kNrRaDxs/Ft0qbH520UYzF8ncdN1LyjUUifvmWrKfyxhOvX/rRAIbP+x2
	PIDKDAe9Yn4/XKcQekdSfwS5rkUtBHkMZU4GlS4Inrr7UL9bSZ6wHEFdc+bfQyjC
	S5NnzLF0UjugyEN1aKT7FLwdsGmal6wmLHhCA8jWKMRe8agjDwvwcItJNnLYndeL
	vcczEhML7MZJAHOjXJeHQfgwof9syCrGNWh2/nxRhf2Ja75/eaBHUiSYLrSWu96s
	6Z0S4mz+Mjnuwl9UU/uyhlygxL1I4eRnsw4oygt65Z9qvPoW6+hRJlluuHgHwhLp
	cCchZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp729ver-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 14:38:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e820609d9so224994285a.2
        for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 07:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786027137; x=1786631937; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLlLllLuzegCOZuXn5+dUp09HoQyVIGVgRcx14v62PM=;
        b=ReDc+UnPqSrIriAzZzu3tRFE6cN77NjStpLtqy+4kOljYT3v6IRli/8djGDGGqNgCV
         u/601w4Q5+kbrFOcGSWtjhm2DMdPKdJ8qpl6XMyqaSu7f/zg04jRcDk+NgcOrt1LzDYF
         iMPTKKWkKTqb8HCgtiZ7mll2+6M/UIoxmku42QLAqfmfmHS/fAvS03twdN7CVLVWKYij
         pNaHdTAhAy08WDWGixGqnOgufwLq70rNT89AdWXhZU+5y0uBpJhiWTwtYztjZ72F0YHs
         qwzuHNvzKT7iQ+iVdBN5shNPOr50rUvh+vI5dyl1Ef4MjE0kGabZMI+eD4B4QR4Zax6e
         0FmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027137; x=1786631937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLlLllLuzegCOZuXn5+dUp09HoQyVIGVgRcx14v62PM=;
        b=NbhLZ6HxXkapqY1aG/RkiW1NYM+5xHCEuGINghn0HULZET1SNxT+fjjGXQL27qROOh
         4ZiqH5PG5RmQIFd4a9p9hvYjZisJNlDmpEvkqaCyl9i6mjJhP0qtqKnbWGRtnkYhsQhP
         M6IrwE6HWC34XVJRJmO3UnpI3soCyHdb0t0uJomomTD8d+v/c4unNiqKOmWqG+iXhx3N
         ipplv4gLETqTZj1De1RoFv3lAwXPsO10Ityew49E3JkCi9plKj7hMzYwaeF+Q6lvSU9L
         o9nbhTBrdKyEoRNLMN7IwxyVpBe6iN9lr2NXF1JDxtLa51X459P7iW6Ojvh2xW9dYd9v
         vd/w==
X-Forwarded-Encrypted: i=1; AHgh+RrrrV8NQrXPronPMCzUs4Jp3Nibz2jztw6vilIe0j4qUrll4iD8+Bv4VWUeVHYgEtq87wOYFbk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUxwKvBgrKXuwyU7Wrd+AuTWy9OO9ZZER+IDd3xVI9Cv+0jauN
	sYReF6VrroGIlIYYWua1v2NaVba+QjpODxa56E+z+L9+90l6yVCrroIuLH414SFC+DNURsqbDUf
	cws4jVoSEk6nQQUZKvZzwQZ5c3VPHE/IIAzP6i6OEZh4MPdL5Bf89ZYyLSChGiEqa
X-Gm-Gg: AR+sD13jGbxTZs/5yFnfSX537OFTzV1Ktk8H46pHLy7+jkybn2/WR0R17bh60+uBAFX
	twUQ6DqLQtAmXj5TVgjlJUiEtpJElC13hAaB+E0JI+TAA9TMcPtife13eat/230tCoMLUfiUZzY
	Az+XLfuJsKbG6/mr09E8FKe1XU+wVrGUedDLbIKlwMmvyooGxjIN/0cV4qyn9g+vf6VbiFXpx/W
	iFBuL8iCCFwQhHUbO0+RsQukX0r+YpwRJZJDyIIVYOaibSQeGac2EwjSPVtxedsAP4HkYzO7CKk
	dhzmHJJy62HKIj+Dv7eLGCZ1pwg1ZiWd4LECE8SJ377hGfGOiQBvw+7iKVk7mkK00oq2Qd6MntO
	XgS1cxpXtxDedf4DbX11+eIVdXRP7T116+MUHfLAd0ytqUEGgLpkOe4QCPxHJaMsK3JrUxo6qDP
	g+5xykEmOVaciZcE5aA76bb27smZ6XksYCzN6SgjyPFK6+gGGsYw==
X-Received: by 2002:a05:622a:4ccf:b0:50d:e471:2d1e with SMTP id d75a77b69052e-52ce61b4ef7mr159133471cf.35.1786027137137;
        Thu, 06 Aug 2026 07:38:57 -0700 (PDT)
X-Received: by 2002:a05:622a:4ccf:b0:50d:e471:2d1e with SMTP id d75a77b69052e-52ce61b4ef7mr159132431cf.35.1786027136590;
        Thu, 06 Aug 2026 07:38:56 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([90.85.108.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036276e58sm270552166b.28.2026.08.06.07.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:38:55 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:38:37 +0200
Subject: [PATCH v10 04/10] nvmem: layouts: Support fixed-layout as the
 nvmem device node itself
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-block-as-nvmem-v10-4-be598b2a5606@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: ou9LrpRTDFntoGvxUaZ2UkQanTmSNr_Y
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a749c81 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=JDRa4Jy4r6/BpSpxP2cCow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4SYEPDBQci7QR0ImIkAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX2A3+0rEHDH4A
 hoBYEJbRpfBpyEbm2+ruA8zY7wuRe9vA8zu/wLXawYMvvKaA/QfLgeJCZqJpHpuY8a/6er/lJke
 GROsaMpo1SAd+qjgUuR/lkRZE0yM1s5hebeX33YSeA5crKALMIFqdMgJwQkTFVVtVgkVfbSH1pD
 6yhtHGLREutpA/wotkplUoGhGStw7hm4/jv82G963/AOOv/Zu61lnzo9kpTvjSUGBB4gYB/q2gV
 GDGSkVct9tM841lhlX0Hafb6UmJFrF+tvrM7IuvXZ9UZYOJBoicTwV97tGXITLh3pt5xaRuSrrw
 gINx50V2DVmLLgPN9OQBbatq3SF+P4rCjMwQwqKfqPOwIUDNshrroQ7VPR3a7xGba+ODrFTob4y
 E4jPFo4QESvtCUzVIHOY9wCOKDSC79SQWS1Uqb3zrU/hqSN11sWUVcVB6JFyOQZO4XxbUoMKwY2
 WCj74q8HQh2DesBT7oQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX5Ki9aGZ0a3rA
 1j7H1djEd7a1p03SVmcWJO1sf64i7KqTggnLSf4l3BORPCmQi5R6/zTYXHzhRDZBDqIqRCRdvK7
 cp+ao5emWCavDBNsgKm5DFbSvtNPuGM=
X-Proofpoint-GUID: ou9LrpRTDFntoGvxUaZ2UkQanTmSNr_Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_073859_074383_2AF2279B 
X-CRM114-Status: GOOD (  15.63  )
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


