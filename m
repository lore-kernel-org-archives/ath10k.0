Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDC3C43458
	for <ath10k@archiver.kernel.org>; Mon, 29 Jun 2026 08:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=; b=CJIgpgEzAB3OLImNTZAieOyQzL
	IWdgTk1He3Vr4+/+u2iYQYUpK0N0qagK1y8vPAo3/12W3ngqnufmsnKefSY5oyFFunpWoH4n1lkSG
	yl5aSEPnt78+AdZbsTL0732LTuBCsODDtegRFZ+0gQa2yDwGnpARJ5slbzqcfIWWKo+sNCVOJjZ3S
	IbnPb7OwORztQrQP0CPJ/Hp3oGHwLISctDCzMzCQMVNpUXknExcokoMq2wPoHE63rKIB70B6HBUyB
	H/TXTGZPMFdH0exI4Hn2QDiV37qPdU4czzQuCkQBgO+Q2ZKVkbG8Ld4MyqDiLlyXyxDc8royvkOZO
	RSxmc+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7mP-0000000E3V3-00Rb;
	Mon, 29 Jun 2026 08:55:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7mL-0000000E3Q1-2NVD
	for ath10k@lists.infradead.org;
	Mon, 29 Jun 2026 08:55:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8OO4Q2349150
	for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 08:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=; b=Qnlt2MnxJR4rdAYN
	d+Ia4snWxrKPjUuSfEHA/c3vFeaUCLaJMMFwzHEPUvufZIirCkLTWZOR+Jcp7HAN
	S478oMv16icAgozsNwGSbvqAF27wTya3Rm6xtcxK8v7rs5TapvdzRP2p5mvSv852
	/vX4LGRHUqE85OxsMRUNzG5hmeGLiIfk7+RColCxhDRryqDCtENTBn4A1hzRSzA9
	rYKGlQKvFV1fZyF35Lc+hM6lexwkPwFQPyUroMV3mZwtri7AakkaPGbGrP4olV7l
	EQEr5lM1kMnQsYDYb/pylqZ8F+VNBADwUa8SuuSdrHA3FP/WSuJ+3d1nQOCp4fwO
	W0hwwA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s04p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 08:55:45 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-966c4d68d91so952795241.2
        for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 01:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723344; x=1783328144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=;
        b=AswRXmCvzKh9a9FRoKsCMuHsz+NNadvv9hcCEVbANvkUTtc7TYrsLO0Whj3wssYHMz
         9e1K6KIuIODIoM40rfiDYuc6hRw7jFVoocvdjKY+xYDnBqmrDsNh4+2HqpVGvsW3thP/
         2cv0Ep64fdbdgJAzEjORO6qMJ4+5qodHQaMCmD+0ASUTexh1ccI/xDEYjaAdBt8N00d0
         0U/sSu4chE1qLs/XRdj+bUpffw7hpk/c2mNsBPxdvPgsT9H9/hj9ohCqnIR2RvfEG21D
         9T/Zm8fAo5qBveTOlV8C8+bzbBWU6gySlfUoe1F30uNjbHXO6LjH3zzV6bfc1ghP93uB
         D6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723344; x=1783328144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=;
        b=AIGELnUcUKhpvWTLH7yGn/Jf7xACMT2ptkG8/pUTAY6srHtzHSS8jmdJxjJqbjQ1s6
         1ekRLa8WGDS4X+6Gk3RqzlDwi+MRHlr4TxQtAHoJclVLthJMdhhDYSALZF6HuufKUVgO
         D/DK3AQMaApJc1CJecbo4bM+V98XUfpBus11vZf9ckp+hzJuK+ttw2UkqPdhwZkU10Qt
         c5GTUyib4D8nhb8xdVA8ADinPPQxRDBOWbNSvx0oxXIrN4npeUqRQz9mstSwKbZMxg5X
         chIyPggfMhInZuHk21jhL/8c+61h4ejG43SM3rSXNtmQixwsV+nenlhvarC9WuYZsojI
         9qbA==
X-Forwarded-Encrypted: i=1; AHgh+Rom/3Kw7ggN0BNW2pDxjuTUQVFfADhhWR+Q00JxHw9ZNNkWhVxgWtnAkcXDS9h7yXY3JFhZyDA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYOWwiIQ13IBMMEP9J5Cv9dmPIWFb7H3WEbCTg0Hlq1KJa4gJg
	6wWKnFJFxOegHccufXAVrH2XNnyiUq0Wud7PfSOdq0c5klCBG8w3a9AMADf8hVOIOIoElaEYJ8Y
	JYt5JRIhFY0vRJuL+sZwRUJzkHOlVN5RnBM5DrZ9+TO0CfLZRFTYQQMAZxkNaDIVd
X-Gm-Gg: AfdE7cmfwuaBm945j0hBHg2aEJtQ2ZYG6IHf3mO2gQD7VqQBDDNSk0a65cKKshKcnEb
	QzBew3R8NxHzREM3wc4mbXXTuoMTE/PptMCfzoGhb1daQMgSJAFzIAA32/bRHuDsMV+ydeollgl
	r1JenWwXMCHTUdvg83JoGHL1UQtLDY8AVDvdzwbJ0Gfy5CASNy2fUfeynIqERlX1wiCBYlgBXpe
	MJXGMSCTeh/QwlpAGrPsoTH/DxQe88GIRKXA5NKA2Eo0RzKI0oElmx+FX4ViHx7yaerUo+9o9Ba
	z4HDZd8B9lxHLc8WWdNig3Ms3YhWyOQEeoEtT+fEjHvKUF5uknl4Jc68MI1fH2Iqo7Ms1H+rGwx
	iGa6l8dPk1yupstp//hK9JkeLRKyR6TQEomxWVSmwUgQfCj+piusCUERPXsg305QyM+W2P2REMP
	dn5UVH5EN7j0ilTwAAxGGZDEDaIRhjymUOlwPiLYUnnzSPXWAowNXLrBUqbMl6oDOUtGeRT/u45
	EjD6SYkiLclPiHiNmRV
X-Received: by 2002:a05:6122:6b1c:b0:5bd:71b1:d5c6 with SMTP id 71dfb90a1353d-5bd71b1d988mr5371468e0c.4.1782723344098;
        Mon, 29 Jun 2026 01:55:44 -0700 (PDT)
X-Received: by 2002:a05:6122:6b1c:b0:5bd:71b1:d5c6 with SMTP id 71dfb90a1353d-5bd71b1d988mr5371442e0c.4.1782723343668;
        Mon, 29 Jun 2026 01:55:43 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bc8016sm6558981a12.25.2026.06.29.01.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:55:40 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:55:25 +0200
Subject: [PATCH v6 6/9] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-block-as-nvmem-v6-6-f02513dcd46d@oss.qualcomm.com>
References: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
In-Reply-To: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX57D4VyQLfBis
 5/jDh9axOsA71aaPii+UcrT0sJ2JdBXG8tDuhrSTuE5lrLmyJMbunB2MabUUiewRB0bHLWCX1DP
 aCbRAqBxsEnNb3n72Au1Uv8DPg3sqdg=
X-Proofpoint-ORIG-GUID: RIL00yR5TlC1JSDUJqPtBl2SWUAGvNyL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX8u7lxmqwD++i
 soDjmJvwsN4SGR/QboGPMDSgyL/5F5wlMH3g2SN2eKc4DyaiuDmRJPEWD5j7svpvUhtM2OeSDrc
 KmFA7EIFQiizQOycNquivNoCNHbxWH/vCkZx8Y6ds0NVArSfmFQrgxGigboWtrnOZ00jT5ZnxKN
 PJ6w1EwdhrDpW80E3mhqv/RnEojN7LDxnflspdFvOnS6O624CvmkxUEEMhTIS1rohf4U5TZSFU/
 HafyGXvFEesE3UF6qGAZNIp0QD/IQyB0U65bLCp6KvcaHl2AXD3YPpFyO2AtmQ3ZGO7LWDVT4cz
 0jVX7+gBOPCQJbqTgLo8xdPCHBTH8TBNWmzpEWxcATY7nuCUE3Etq+eExxYu7ORAAm//Ea2Owia
 UgNHR2wGC8N0oujloD0kctqw3W+RN3SZ/Hf8XbAbjpHCY+Nthz2q5L8xlisGN1Q6Z8g8XPxxVMC
 O3jcmyGm3rKMC5bJbxA==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a423311 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bEbww9rD5qa0LKludeoA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: RIL00yR5TlC1JSDUJqPtBl2SWUAGvNyL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_015545_618332_14BAB356 
X-CRM114-Status: GOOD (  18.36  )
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

Factor out the common NVMEM EUI-48 retrieval logic from
of_get_mac_address_nvmem() into a new of_get_nvmem_eui48() helper that
accepts the NVMEM cell name as a parameter. This allows other subsystems
(e.g. Bluetooth) to reuse the same lookup-validate-copy pattern with a
different cell name, without duplicating code.

of_get_mac_address_nvmem() is updated to call of_get_nvmem_eui48() with
"mac-address", preserving its existing behavior.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/linux/of_net.h |  7 +++++++
 net/core/of_net.c      | 49 +++++++++++++++++++++++++++++++++++++------------
 2 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/include/linux/of_net.h b/include/linux/of_net.h
index d88715a0b3a52f87af23d47791bea3baf5be5200..7854ba555d9a55f3d020a37fe00a27ae52e0e5dc 100644
--- a/include/linux/of_net.h
+++ b/include/linux/of_net.h
@@ -15,6 +15,7 @@ struct net_device;
 extern int of_get_phy_mode(struct device_node *np, phy_interface_t *interface);
 extern int of_get_mac_address(struct device_node *np, u8 *mac);
 extern int of_get_mac_address_nvmem(struct device_node *np, u8 *mac);
+int of_get_nvmem_eui48(struct device_node *np, const char *cell_name, u8 *addr);
 int of_get_ethdev_address(struct device_node *np, struct net_device *dev);
 extern struct net_device *of_find_net_device_by_node(struct device_node *np);
 #else
@@ -34,6 +35,12 @@ static inline int of_get_mac_address_nvmem(struct device_node *np, u8 *mac)
 	return -ENODEV;
 }
 
+static inline int of_get_nvmem_eui48(struct device_node *np,
+				      const char *cell_name, u8 *addr)
+{
+	return -ENODEV;
+}
+
 static inline int of_get_ethdev_address(struct device_node *np, struct net_device *dev)
 {
 	return -ENODEV;
diff --git a/net/core/of_net.c b/net/core/of_net.c
index 93ea425b9248a23f4f95a336e9cdbf0053248e32..11c1acca151266ac9287457b4050a54b08e2b5f5 100644
--- a/net/core/of_net.c
+++ b/net/core/of_net.c
@@ -61,9 +61,7 @@ static int of_get_mac_addr(struct device_node *np, const char *name, u8 *addr)
 int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 {
 	struct platform_device *pdev = of_find_device_by_node(np);
-	struct nvmem_cell *cell;
-	const void *mac;
-	size_t len;
+	u8 mac[ETH_ALEN] __aligned(sizeof(u16));
 	int ret;
 
 	/* Try lookup by device first, there might be a nvmem_cell_lookup
@@ -75,27 +73,54 @@ int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 		return ret;
 	}
 
-	cell = of_nvmem_cell_get(np, "mac-address");
+	ret = of_get_nvmem_eui48(np, "mac-address", mac);
+	if (ret)
+		return ret;
+
+	if (!is_valid_ether_addr(mac))
+		return -EINVAL;
+
+	ether_addr_copy(addr, mac);
+	return 0;
+}
+EXPORT_SYMBOL(of_get_mac_address_nvmem);
+
+/**
+ * of_get_nvmem_eui48 - Read a 6-byte EUI-48 address from a named NVMEM cell.
+ * @np:		Device node to look up the NVMEM cell from.
+ * @cell_name:	Name of the NVMEM cell (e.g. "mac-address", "local-bd-address").
+ * @addr:	Output buffer for the 6-byte address.
+ *
+ * Reads the named NVMEM cell and validates that it contains a non-zero 6-byte
+ * address. Returns 0 on success, negative errno on failure.
+ */
+int of_get_nvmem_eui48(struct device_node *np, const char *cell_name, u8 *addr)
+{
+	struct nvmem_cell *cell;
+	const void *eui48;
+	size_t len;
+
+	cell = of_nvmem_cell_get(np, cell_name);
 	if (IS_ERR(cell))
 		return PTR_ERR(cell);
 
-	mac = nvmem_cell_read(cell, &len);
+	eui48 = nvmem_cell_read(cell, &len);
 	nvmem_cell_put(cell);
 
-	if (IS_ERR(mac))
-		return PTR_ERR(mac);
+	if (IS_ERR(eui48))
+		return PTR_ERR(eui48);
 
-	if (len != ETH_ALEN || !is_valid_ether_addr(mac)) {
-		kfree(mac);
+	if (len != ETH_ALEN || !memchr_inv(eui48, 0, ETH_ALEN)) {
+		kfree(eui48);
 		return -EINVAL;
 	}
 
-	memcpy(addr, mac, ETH_ALEN);
-	kfree(mac);
+	memcpy(addr, eui48, ETH_ALEN);
+	kfree(eui48);
 
 	return 0;
 }
-EXPORT_SYMBOL(of_get_mac_address_nvmem);
+EXPORT_SYMBOL_GPL(of_get_nvmem_eui48);
 
 /**
  * of_get_mac_address()

-- 
2.34.1


