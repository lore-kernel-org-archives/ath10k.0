Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5FFCD98CE
	for <ath10k@archiver.kernel.org>; Fri, 12 Jun 2026 13:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=; b=li/Ep6WDvfC6VbgUFlBwn4DLmz
	XV3B6UqASdmn88HmhZ+fJkF/bNsba4b+jWz8Geazi8qggxufViKIWx497o9TXh+XeaMtGrnSRJTOh
	4RL573BV6DdQ3E1BN37gkh0KpJG2H3Tz2uxuyCnXC/tmvQQfA5uUzyhbI1psZQVV6Ka5jO7unEc98
	7b7p6scHGkzYot0t7AH5znfcCIMQ288NbZIYggo0t52upgjBIw6Qn0UPxrdiiGjthemUxDgEbyHoD
	MX9Zg5cYhiBMcn2l3BZR6/GR1B1jz+Scht9kUqapz5hwaV97ZA187Q0wqfAOAyBDba0dRs2TvuWXY
	K8vA521Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1p5-0000000Ax2X-2UJg;
	Fri, 12 Jun 2026 13:21:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1p2-0000000AwyA-2ejn
	for ath10k@lists.infradead.org;
	Fri, 12 Jun 2026 13:21:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj0H63661583
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=; b=YXrNqc06L7zlN7m3
	6IQJg5pacCoqFjf7ZZ6zyuvVf6fg9Ya2C196FmoQ46L5fU3vcPNDHRqBmQEmG45m
	9f/gc1ABjs2KdCZ/m08G7x8a/smCcdaTwcfP0oMWGSo05BRue/mNvDyFK4QoY8Jq
	TbakKrHEj7hM/a3ZScH98Ftc8o4S7b9Mqrjmb8FQsyA0u99fPfVFpnm6GpmapFxU
	CNRPwJi36GcnVOosFY5Sc2YcCld3jCDrUuAsYU8/fq+6/CjE82kB05pG8Ho94ABe
	u6TQ4djOFDkRbDw/+5lHtzKRofPfkkhrWrG/zdaRvANv6ZXFqrO7e+W4FUmL95jR
	FHucfg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xck6wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:19 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-69e48430627so780455eaf.1
        for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270479; x=1781875279; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=;
        b=ILqvJvBGITH3nPXSG/AIkedaNEONevRHtsfYIzD//Jzgyoiv7srr7lkxX83BkPI0eA
         Svgmm6Gck/FkY7m69vPgzFeAQKLxXSQ9HG74iJeXniLC9E1JASDGeliuoO+s+icAE2cE
         s3nGBMt9pRtKVhI9IrBosGID7cYjUfyG/EV8VwRDFDncQz21s4hFGgWHVOeIsi6n3a9l
         ywRSrIcUbhwsEUujSiQwdA7PYY71UZfHqvHEGUurI7Fw6FbStHgow6qiDzGZa3j49GIT
         xeD2e7/yfn7U9xiNboETVt1NqEQB6kzSeYfuoS9Zv2fsU3El/WsPxV1KVGCPnxQWynv0
         sbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270479; x=1781875279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=;
        b=ZL121gY3Z08oSqI4UBE3N0V2vKWSBG9Kr06SmUtZ1yfqud4wVev26GycyAnENzfFvW
         6rSuCbwszdmVAmwqUaYRR6hjvpm8THlXoaNIXW6SJNEpDdtaVypoRSUupOMVQ0Gvg0Bb
         5OjOJpaacbLyHNnC18fwl9G0taWPZKctFt2zbOMa1ZKTdPeM3zOeCPrF5GrHcMGMkXKd
         gBtd4zqveN2WQ69Pi2Du0hgVaExE3VGjzwbbRzvEus5jMie5gXQR8CV/US3sdtSWIzlt
         MvLVcLJMjZPA3wegVTnkCgOOsjllRJgaEuz4HI7P9ep8EAx5k57lM0N4GNUPPEj//Jgm
         cIog==
X-Forwarded-Encrypted: i=1; AFNElJ/PNQImbyNlAWm57mxuiXNoN3pWUoHQJugDMy7Wzq4psaLnK3KMDa3SsrCX0OKOrjWJLoukOrk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz68iTIKKylig7hXE9Tc6/dgnjaT3t7E5pUV0poprzl3LuNZ3qw
	ZTKKW+W+SO2uATCTEDE0scWTIM7CVFIiLJchCL44sPMMjECahAFAsJnFEydMfqjxugLEUdLq0iX
	L/aAJNHKxwxOd2iAe+Rhfk5TJZPDGxw5LkIHWWNSAag/gZZo1yJh3j1nQExbYHtxe
X-Gm-Gg: Acq92OFocWYMA3q81K/MOl91XeilyjffpbVLIELs1yMRyMIMkmfkzByW1I4xrwuvLdt
	q7/JGKZOtutZdrNRFyFSnoIjcq9+HIWiG+OEXz3SyF164oHNnSNkFgN2b8MmPcxS84io2i4L2bu
	4+I+/E+W1i8KUKLU2sM7G28QSCPHNIeUYVMEL23Viz+w3p/LkgAqF5kF4G9skMZpKPTD3O52swR
	n2F8ixj1N7TlvvcFgrwgdi/Zp/INkVA6+9IgtG3BKoTlgsta7ViKSkwSJBvkd+wFER/zFt+AsRe
	r/YQNGy9ifLa5/LZJXV0lWUn4MoIFJoUbcoze9fSQejqwhrlgQ8my8cMeOeVwu8K+qRTzJD/aqr
	BdTH+t5rLCY0gjE+QgGIo0uIiPx4uMMll3GG+OiEncp373WStzRz6hZcWmmHlBEYL8nZi1jypMZ
	4b/hlyTsqFC6lPj5SXZIlz5VEWoFzfmMby0r8eQX0I8xj78/WCaZGEe9iK41LDfYMlSCqTiYcN
X-Received: by 2002:a05:6820:1786:b0:69d:fb2c:77ff with SMTP id 006d021491bc7-69edc6f1377mr1695444eaf.30.1781270478939;
        Fri, 12 Jun 2026 06:21:18 -0700 (PDT)
X-Received: by 2002:a05:6820:1786:b0:69d:fb2c:77ff with SMTP id 006d021491bc7-69edc6f1377mr1695409eaf.30.1781270478503;
        Fri, 12 Jun 2026 06:21:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:3510:32cf:db6:13c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm59986866b.1.2026.06.12.06.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:15 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 15:20:58 +0200
Subject: [PATCH v5 6/9] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-block-as-nvmem-v5-6-95e0b30fff90@oss.qualcomm.com>
References: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
In-Reply-To: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
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
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX21hni2V9Ahdp
 jBnsATtjoYUK6u6Y5Tu/obXL+lQ5d3K2tgF5q3XguemzyOXj6b2qof5XNWzdpzXaZWdQk+eXxP1
 Jpw9IFWAj+0uIYu/HbLzRKKZiKkSpLN4jLD3umhXkrAxJgxXKRCMakQUIWAN9dyr0F2fCy1Dee4
 LkNV3vujqIr0IN/eErLIYkubpAbAKUAf/uEK9s5JwmLsf1l0xQoVDFqcEPu2iwN7iE+65otBCzg
 K/1WDluxWHCzAwbV0pEs6OHea31cEOl2qzilPV4TBXCalYfTOfWkBFKLaTtbE4qGI5FSJ6wUKxy
 +AwJVPdbAwFuF0NuCB/wZDAIoQupVuN9TtrpaNcezKuyaxBKBsRz/knMsMnFTwfceMXKB7WL2A5
 3Yk6O1ZCIxOOyrkDiMY2GDGcJwKV+udRQkTqM+yG0iW24pwNDXkviWjF6V94t4jrkc8RX5WmUa1
 e4Qo7PWB/WWIeU0wUZw==
X-Proofpoint-GUID: 0sUAtV3vRe90fwSA2lgaf0aRlY6JkaP1
X-Proofpoint-ORIG-GUID: 0sUAtV3vRe90fwSA2lgaf0aRlY6JkaP1
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2c07cf cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=bEbww9rD5qa0LKludeoA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX9QztOx12uMyT
 6LVFJr2FW9eAIp0Zc/tdUYzaoon52qN5Rc5Td5/hYncGMx1sAd+0V91vALIdpvNZZNf04ug3llv
 ze1GyslP44OHTROnHJY3FcKfleBux7E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062120_800522_632CC9CA 
X-CRM114-Status: GOOD (  17.98  )
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


