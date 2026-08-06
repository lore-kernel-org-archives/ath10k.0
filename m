Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F12C56207
	for <ath10k@archiver.kernel.org>; Thu,  6 Aug 2026 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPeNqGPMRBWAfsA5CvuzYdqPrDk9qOkztMDjoEMaK1o=; b=kHeNkBJ4cnX2SwgYp3rCN0DSpc
	QLBzPTxqb0ATE7n46MbAWiDe6/94cgnNw73CpS9CRv2W3tkIX/WPnHd1f/ziQLdyIZ9++nqaLYYSL
	8fN6mUz6gy1bJxiEYZxXEAtEqu3qp5GgFqPefrO2Cq+IYqrBE0Tg/vCcsfgNTxxIjnYSP58uFbm47
	jN6OHCn5DCTlsEwuRboUzI96YtaS9H0yeCM1xZcH2LTg0UCiSk3auL7mZO8nDIQ/3BTuH2ITJtO9w
	1Ak05OAG5FBZ0GyWh7tKFAvCw04EKvrlbPmnP94qQ0tbjV1jga/jIlUnURzs/usa/1JtF8/72sGWb
	jdKe0GfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFW-00000005zga-3tA7;
	Thu, 06 Aug 2026 14:39:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFT-00000005zdE-1yQc
	for ath10k@lists.infradead.org;
	Thu, 06 Aug 2026 14:39:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ncYO1308825
	for <ath10k@lists.infradead.org>; Thu, 6 Aug 2026 14:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cPeNqGPMRBWAfsA5CvuzYdqPrDk9qOkztMDjoEMaK1o=; b=Tu7wovN1yUeuNh2h
	YaUwjkkkN8p0Y3Y4/b64xoMPKryZFIwHN1MEm+K6zTfr5B/pupMFOE93Y0b9hszq
	HNNiigNAb7txL8R0o15QcYwQijLQfpziy61yvktiD2bmL7qvQ5x3BkjpywMlevzV
	fZy0AzmR83bdWZ2Gq4azy4Y6Ail743FLZcaAWYcNiMyT7cMQ2qFbGz7W2SbHDBu4
	znBl8nhMZy+S8kN91o393vnzDBtZSZHE7JyB4njZ0mqAVxeO1IyJxAcKAfn5fLf3
	AJ6xisRMQLTiTjg5QAmDVuWERq8L9crSL7HxA3FyDTNPvCeJyfDDgi3zoitBNabc
	9o3wxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp729vfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 14:39:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5283df62d68so25621281cf.0
        for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 07:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786027146; x=1786631946; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPeNqGPMRBWAfsA5CvuzYdqPrDk9qOkztMDjoEMaK1o=;
        b=PLtNXDXtcWEkoo2J7OZXBp06kIXT46ovixX9Nu+TL2PYdUIKjsSlOAm4Kn2eZ4lDSr
         Dls81rKX+9rdlJIZnS860bSnJZ3H7VDrB7jlw0zZihvPVgxO5lWtUibG24b64b4RpOp6
         GghxxRMyZFTU+oM2W0fUYEtvhVJJGfY/R7CNZXgng9XTTQLeqg8YwRpTQYw8LnfhYhuu
         0Zaotm/8KL4BRBHpvuzyjcBFBvzXI1/GhRnCPSh4q1e9ifoDZAztAlW+/QQ3bb6OE0Bc
         flMU0gtnVJuwtxo6QXJ/WkR1IvrB4srAUj6tRKqnZNF0ukn71kuTKLJTyfC8wASyGMr9
         W3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027146; x=1786631946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPeNqGPMRBWAfsA5CvuzYdqPrDk9qOkztMDjoEMaK1o=;
        b=rrumDpD+lOML8sJhIVSX8e2HC6cbZEIZva96bEEZrnoADzPP2Z/DWEbFcaLYftu493
         vZhCHgrxoJ/Xt2WCcAHUTp1V39G0i6rfhPuswETazVoUlutfsOTWOTVIxpCEc4ZOg/T0
         uo7Xm0wbkTtR5DR/zYxf90qOtwCJ1r02uMQuzJ50FmkKSTKglzbjJX6973oNsSkkOpNV
         w622708hOQpAXF2HRKv/T2a7YnIkyEF/mnebDKRZq2QQ6gjZPcbtPoJdEdRXA0hRbcA/
         2P3d/MkEMD4eV2TYyMyCRwMN0CkHnqWEQyEweZRDVqQkQBUJpg/VEY372wZ7ueyya2rj
         5x+w==
X-Forwarded-Encrypted: i=1; AHgh+Rq6Wd6dMS/+WXquatGbLOQneb48L6gqbzmEItzZIJ3um9Qu11KN3sZ2XjJW6VgRcdKfRSKKvkA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzByOrPvxOitPpCSV6LD+EfNobit3wUzVsHkMVhu/0SHbnvR4l
	xNtrbwInthvdst9rMMbTh7s9dHqeIx+HLkqQZZhNKARiDHk8ajdfwySwdrcFN8LvzvjDVJtGB0m
	AzJQ4T/yPjT3iA3MdbP4v4NoBCmokT1arI0k68YtuPzjy7xDxyL1HQ1GIGv7B1B60
X-Gm-Gg: AR+sD11PVqGuYpPMD7cm+YlNQJVAlwPXxfdUCJa8x4ADWdsUPdKecsNsOFqpsBM2ThE
	0zCXCGOqpvmPSNWUD1yymb6pXPvF+pY1zzRh3MxKJHP9hxwRlJ1WyhNJqE/FrrIAI9iZLhYOIlt
	EjJW8T2QoLpsgTjcNn7Yx11dV1bEZEeXleLK686cd0nuPck/YebJsV8G70r1I4HnhnC8Jo7ANxC
	jcYqq9fEXOCyk33crXFuE6Q0Djjt103TwOmbdwh12kC8JOlsaQpgyj5341MXBho6ef5J4L0YGh1
	TnUP6vtkiNOAn6NZ3YeuaZgvDYkptrE5NoipkYphorNzKL+33qVa/RJXsPHlhRgRcwUziuuNdNR
	K60qls7T5xGnqIYN1U0k4keV5OBK5AruSyMdIFk3nKFs/AeaMybdcbHf/AXR8iV6S3rOWWOqVJa
	fKB1Dgd3ccI4j7Bt2+H1++HnmEGe7QkI/5V3x+4QS2j3Mejqn0Bg==
X-Received: by 2002:a05:622a:1489:b0:51a:89c1:1eef with SMTP id d75a77b69052e-52ce6022480mr139973221cf.14.1786027145559;
        Thu, 06 Aug 2026 07:39:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1489:b0:51a:89c1:1eef with SMTP id d75a77b69052e-52ce6022480mr139972401cf.14.1786027145034;
        Thu, 06 Aug 2026 07:39:05 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([90.85.108.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036276e58sm270552166b.28.2026.08.06.07.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:39:04 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:38:40 +0200
Subject: [PATCH v10 07/10] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-block-as-nvmem-v10-7-be598b2a5606@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: rZ5cL7pO2pXntlmzBG9Ch-jUHIDZklov
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a749c8a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=JDRa4Jy4r6/BpSpxP2cCow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=bEbww9rD5qa0LKludeoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfXxAyfgeAXDKb7
 4ToFErzXgtwJnYo0GCzWUCLvgzUiDtyfNEJz8uU2CdrCx4MaoK2MIW422RxeneDuuzFnUvCurdB
 pgOCscyIPOeuol+3ad0hTwue8Kz6kQGN/vtvsH3BDXrbGheRQbwT5CaI0XMoGAzy3d3v7sZ3922
 xQVwufmSh2GpWfKMr2w2Bk5kvlb//88uAGCi35FpeaSFXbb93wuMRLiMH1cKZCAsSp33jM/0nF6
 YAxrvLpBYV45M8DjZpssnCDjjpQutJwonmJ0J/1PVzVqbI/y4dg7repA/jMMlYUKuAnndHZixzQ
 Yp6nsmAL02E0CDrwE6enQ+PVyqQiruLhmQoH6eSuoR8QIXe6dwISiiXM0+NtUXMC9DQwJeSv52I
 PB5qHmCq7AFJtKz6v07SRzT19+qrB3Y7eqXH0VN3aYUkQKPBl0PRGDSJHEafCooeuiZnpzPphG3
 m+kivbNaeIYqErT3Z/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfXyoo1+gokj9O3
 khEIfU1i258z+S0/mY479zpTULpxF6Bgn+X+R9C3H6+gZH/A7NbqhcIr59n1+Tshy6SRxe1twpj
 5cTY4cerWF+pVX0CGeEFzYjt33IXy0I=
X-Proofpoint-GUID: rZ5cL7pO2pXntlmzBG9Ch-jUHIDZklov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_073907_639138_3AC985D1 
X-CRM114-Status: GOOD (  18.69  )
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
 net/core/of_net.c      | 52 ++++++++++++++++++++++++++++++++++++++------------
 2 files changed, 47 insertions(+), 12 deletions(-)

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
index 93ea425b9248a23f4f95a336e9cdbf0053248e32..999ca0e9258c41580823b80e0ef6db26617bc968 100644
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
@@ -75,27 +73,57 @@ int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
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
+	memcpy(addr, mac, ETH_ALEN);
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
+	/* Reject unprogrammed cells that read as all-zeroes or all-ones */
+	if (len != ETH_ALEN ||
+	    !memchr_inv(eui48, 0x00, ETH_ALEN) ||
+	    !memchr_inv(eui48, 0xff, ETH_ALEN)) {
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


