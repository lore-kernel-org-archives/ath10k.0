Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D48CD3439
	for <ath10k@archiver.kernel.org>; Thu,  7 May 2026 15:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uk7Oe1xq0TlLuceyYysifE8TQzhLGFxXPLlz8g3T7ak=; b=QzVlyW1KMVRfYLhxMHz+7dxpV0
	sqGIIW7wWwTOTU+b2PQT5A95yHdYUvSryEa/qRG9TVP+tuC4x3JmL8KbtzaG0EVK4ZOnAsADcSUgS
	v84+74A5abaOCP63cUTPqWBwwZf1CgZWUF3EH14s+Bij2apCnoWwqO2JJ9h0vl/VPx9J0cD/gaiL1
	Pry7LduqvktwFP1o6zEdNEdpKntSH0uJVh9GVuvOst0Czl1JhyWsv6vtAqODEPrtZcs1MhIUVsaRU
	Flr9hC6wYQ6PpiF7e6QtLIPAx88KbmSuOcqhhbZFGctdq50z3EwAYe/GJswLohfIdkPwMvQvQSkS8
	BXG69vYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0b0-00000004Ag4-2Fmw;
	Thu, 07 May 2026 15:25:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0ay-00000004Ads-1Yg0
	for ath10k@lists.infradead.org;
	Thu, 07 May 2026 15:25:01 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64791wBM3464037
	for <ath10k@lists.infradead.org>; Thu, 7 May 2026 15:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uk7Oe1xq0TlLuceyYysifE8TQzhLGFxXPLlz8g3T7ak=; b=GQGKmWwPpcYT7z52
	bh2TBhD3xN2aVw+NnsWrysEnuoLLqDCOscuj7MW+9REwKMoW7mY5/4nq9ouPjv/g
	thwhVWE3ViIlDkCt1ycf1AQFZ1cGZ6NmEpXCVrtcQnVpGRxU3RQxdHtKryWF6KTx
	K+xYI7lTzBNnoOWbnW+5KGwx1fJchODrvLFvjUD14mh/H0p4TxPqRr84WwFrh27f
	8N9KTX/ztpP9EOfYjCzV1eoVEbr61V9zen0za/2MVIw/iZ5PXTf+/ZK+7484+EIw
	Cm7l3M9dBPTFL56gluoApthPugAaLSFg/qxw+RHO+JWjyxvQoRxJcadQFKuQf+xk
	3Wj1hw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn2s9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 07 May 2026 15:24:59 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95d2ad5df14so1453816241.3
        for <ath10k@lists.infradead.org>; Thu, 07 May 2026 08:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167499; x=1778772299; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uk7Oe1xq0TlLuceyYysifE8TQzhLGFxXPLlz8g3T7ak=;
        b=ZYdxFAlzcnwNOmzWB6n/ZTOqDajNsmEEvgP0nYPEs5bBve3Af84aKDtnlzWQPNa/P4
         T7MmDJIEj8lg1KVbvVHyzD79T/gLLuBgd+5ETryekKmqumLRA+kiWMLfYDS2WFJ7zZuO
         vCdca1AyHPO5/zdgc9Gl9pX/o765m6xGT/m2aQttPogdTJTW0izDb09V7ybpGNTyt4u9
         k7ISPUVjlYuZ12DcTak/xWFI5fwHv1pTkBmp0k+XVR3BifEWZKEqBGFZxOpWf2GqwJd8
         avrvo1i24b0DRWv1AEAZW1obw+0Z6F13N+/YSGb4vA8hsfktWMZJJFuOKOC6oWYLCbFI
         bEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167499; x=1778772299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uk7Oe1xq0TlLuceyYysifE8TQzhLGFxXPLlz8g3T7ak=;
        b=FIyOtXVV8Q+uA9hdy2Ahm1yCrI+QKxYx/A3P8mh9tX46637pUvMyWu8mvEOBHbSxRQ
         iZkKjKs0N7DNfN/24oQpOIX7kkMdS8UptvH/lCiAiv6q6tTKeJ8Pcs4NKKPy2z2QSE1a
         kemF3+LZ9yEU074C14ZYpW4ygbBzg994t5bqwIlmOESkKs1qIwp1JbUOxXp5jHO7WWPT
         eEJGz1SeG4YJT8WDV1D7DNqTgnHidC54g1q/h4aatvMUwcmfE78RU5kb3PYuTueoSzU3
         x21tEwlqXREJ8zjgKMRvqw3JjcYAC5SthwDyj5XcblgjL9cuFv7bfKm79502N6CFoAqK
         5DlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Y3urQxpLQR3GOx9JDmAYUG74rhMqwA89LZobX6bQB02+CaVQsrm26xqs59uKfOYelK2e2PwE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVUB613XFuBCPKcj+DSI/a1OOmUFhToHwN0Z8/crSCAd5x3MPw
	fDKrf6pIyFreNyWu1P2iuF5jJJguvsA961+1SfJMo3dQzLDw5+NAWlt9tMCt/E7VXRwQdb5manG
	Vye5sNtBV6Lr7ovyRTlH6oMBWNF8sj8hgP8N9RCTkJkV3HMY6W0hnnOUf9+zBxh2x
X-Gm-Gg: AeBDietgVCHQDkCH6DB4oppfDMvVcXPAgtRmlyq7VwD7vp99yTtHklzfn+OP2wm/mNd
	wz6mQkkXfO2W1u//djCnbKRZ4UvvV+61ey4tQBeeP7qxm7DXDan9iqGMx0VgAgM0cF4CilMYpMm
	j2Axl1EPsoqsIvIeoF3F7o31G637UVrEPJ7DMTIGhMhQdl2hJDoxxreRdeuMHeUJulEn64Cp0xT
	dYJU7Y4kduOLUZTTVtbA97wL1+5JTO6pc+jZ0Oiru2GZBQTci8dBK9yiFuhIJwmHoqXnY/qggxq
	v6GeOea0ocCvewcGWjM+TRLcOm0EgKffsRbyR5Ad5/T3dQCQfsMKJmIkwrZI5Ykt7QIz1OyiA4G
	iJiqNTrW/TRkrIOPT8aAFdfcgtmrj2vN8bZZ/pbf74JLGyIzJSvT0BWD4ZnlKtiSxA4+phU49ls
	BVwOr5/rDm1y5RxK1ugYwfJR1UDYU=
X-Received: by 2002:a05:6122:1822:b0:56f:6add:9029 with SMTP id 71dfb90a1353d-575593aea76mr5335412e0c.1.1778167498684;
        Thu, 07 May 2026 08:24:58 -0700 (PDT)
X-Received: by 2002:a05:6122:1822:b0:56f:6add:9029 with SMTP id 71dfb90a1353d-575593aea76mr5335377e0c.1.1778167498276;
        Thu, 07 May 2026 08:24:58 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:24:56 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 07 May 2026 17:24:40 +0200
Subject: [PATCH v2 5/8] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-block-as-nvmem-v2-5-bf17edd5134e@oss.qualcomm.com>
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
In-Reply-To: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfXwZdUEbBQ/KjI
 3kdDhyZyWpV1gAgyNXplDcYJD7b2YmDrpnls1F0smvvexW/33lBErAaDnYHgK+mZvYacEwRiBem
 oHPKOi88h8ONFIg+d9HERizUqNeWZ25WOCDrRkqwLzdE/y2A+/6uizCE+hJ1Oa9UwMwzZ/S2kK1
 n7IlgeKO07eILCd5/OFzA9TMvH/Vz0ulzRPoJeHNXoi43TxL1JnGCeHirCd9cR/yPHp6LVqBg2d
 EZeXp5Ey/CxNMhqAwZjtIinKQP0gjrM2GzmywLzR68n0059jaPUGuk3fdTcqcaOJi2BR8P3U7do
 aG7oeYXFqAzV+epmzqV/5S4HvJPt1PCvP+B+aJq6NSqm147+dt2yn1wavVrHTxxWf4sMCpWgCLw
 f39/1NuWWJja3UdcPETZ2P7dkM8xtErzziU5+7t17OVEfpvxPco/3wTcNbHrHV0x1g/UXJ9kdFG
 f/o9d5awQFK12CnRjYA==
X-Proofpoint-ORIG-GUID: GUDj-SvI1bpoi79RmtUT65PJQJHwspQG
X-Proofpoint-GUID: GUDj-SvI1bpoi79RmtUT65PJQJHwspQG
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fcaecb cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=C98JESGoZJZpJ7w8-ywA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_082500_424082_21E394CA 
X-CRM114-Status: GOOD (  17.89  )
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

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/linux/of_net.h |  7 +++++++
 net/core/of_net.c      | 47 +++++++++++++++++++++++++++++++++++------------
 2 files changed, 42 insertions(+), 12 deletions(-)

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
index 93ea425b9248a23f4f95a336e9cdbf0053248e32..79b289de0f16aa5f8724e84d6f2300648c25b6c4 100644
--- a/net/core/of_net.c
+++ b/net/core/of_net.c
@@ -61,9 +61,6 @@ static int of_get_mac_addr(struct device_node *np, const char *name, u8 *addr)
 int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 {
 	struct platform_device *pdev = of_find_device_by_node(np);
-	struct nvmem_cell *cell;
-	const void *mac;
-	size_t len;
 	int ret;
 
 	/* Try lookup by device first, there might be a nvmem_cell_lookup
@@ -75,27 +72,53 @@ int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 		return ret;
 	}
 
-	cell = of_nvmem_cell_get(np, "mac-address");
+	ret = of_get_nvmem_eui48(np, "mac-address", addr);
+	if (ret)
+		return ret;
+
+	if (!is_valid_ether_addr(addr))
+		return -EINVAL;
+
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


