Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662AAC5516E
	for <ath10k@archiver.kernel.org>; Thu, 30 Jul 2026 16:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPeNqGPMRBWAfsA5CvuzYdqPrDk9qOkztMDjoEMaK1o=; b=AcmkZK8+pk5tiFSg0B9tW46qYs
	Y0T0VzCCaiXggl5nPS+5d3fTBXxni9YFG/xBTZ65e0YiSwWr0wU8F/1XexEDLuzQ/kFty9Jjp4VdB
	oaKnVz0rN8ozqo5TmrUoC8NYWjl0lYpAAp0L0U0FbGZaLEUj0MAQ0Oo6aqlgFvt0XG/2q2WAvx9ye
	N9yrXWTFr9AWA7UOVcym8qbac6CFgQ4ExgRjKTC+vZbxDEZn8XRFYNl8Qb6AqBquA2Q+knv9dtL4I
	+rRC6xCNkeo9nuEKBm+xF9mJbmm5f0ysmj/xU2ND3z7A+cbsA9c6f/+5xcKV56iLFrVKvDj12su6q
	FunEJRWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTC0-0000000AuYs-0gK9;
	Thu, 30 Jul 2026 16:01:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTBv-0000000AuUt-4Byq
	for ath10k@lists.infradead.org;
	Thu, 30 Jul 2026 16:01:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQjwF1414015
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cPeNqGPMRBWAfsA5CvuzYdqPrDk9qOkztMDjoEMaK1o=; b=YT7WVXhEsZRuo4tj
	rRS18ZkhpL5M/kLvIYGgnkfXMVwlcTPPbuqRyMuROdWq9ab8QuFzzS63kAEy5Bi7
	Bvul0ORPu/UUS9bzL1gT27Zxr+5i5GR57qvYOl+bme9l1fq5wRTG5PZrnEw1l1eW
	1/rR4Hr3YnpsT2IOumRcSXZ6WlkW2Cw7icpC/OTfAsoMgmmy8/lGe11+NAlgfwKh
	4I7NSS5Jjo8umJcK+JZEfDhGuzM2LaU8JxjSapPBb1pC1al/8a794ME7mQaDak3J
	BmjU11jGwrDQ8FhK1xknkfHycAOXCqqXpbGdQGFoXBO6yOHNx/aJtQe9jm32PfGv
	wl8fGQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr891gjby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:01:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0408254aso13049221cf.0
        for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 09:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427262; x=1786032062; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPeNqGPMRBWAfsA5CvuzYdqPrDk9qOkztMDjoEMaK1o=;
        b=FPIYQroI9tLKfrLwP57BIbelxX99TRgVH9fwb5TZ+sC9sCCVSgPHWRAoz4XK1tIHTT
         BQPSR5CKkA3SGrImc7JyhZv6PzpUloi2Idao2FxXfa2UWsnL6XiW35wItuRVP+T8U70m
         aMvcFzC81IqeNKdwwmG4ZuKk3oDJbBmh9eqxl1mAn/SL20kwWc0LcvgiJoYscphoMTV4
         JsThsP0W0cRt876SdNmkFBzqSRDzEtVU/x59l/kKKjDY/yiH5lPCQPhoL4VA1OLMlmag
         GCsOcdGSg/Un3vlM1r9WUSe6NCr9dJLG4tZ9T+WKrjKg/yF3BF4xXU7nQzrYQxafAuv1
         3XPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427262; x=1786032062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPeNqGPMRBWAfsA5CvuzYdqPrDk9qOkztMDjoEMaK1o=;
        b=kFRAJOZ4B48XVSIwr46rhx8ENgPZ/6vd8ZcuiaUI4Kt2PAJbihXUmnoReS1AqrmgWh
         l7e4RnqarbQD+tHsSGlIj97OOV6S2nAJtF4IOx7U6pMmhxTWRhwuXWXpNCqXmmEZ9YTZ
         v93gBXK464j8KVlyNZTuoqpf5xdRPIXbePG1BFb03DIEjpsWDGy6O7vYldch9B33z3jQ
         yzE2gzsjjb7pF+bZVWwkeMRJErqy1QqNeXblHTE+bYCcZxjZvfQhUcNwMP182F1fwoBX
         Wfae1npMFSHR6H7X0XMy9p4KTKlGgWh/vZh14Q1P7Awku9us/W4n7EAvzEXuVg5RMCNi
         k2EA==
X-Forwarded-Encrypted: i=1; AHgh+RoJVy5HCLtUr6A9LAf+gsN1hV/z6oBXUbFu+/rcj5kpq8F3C1uuY29gD1qIvX4FCKqmPOcMob8=@lists.infradead.org
X-Gm-Message-State: AOJu0YylgAQVsDZ2nsruhhAX7vFWH4/e5vQHwx5E9QwbHF+zFfmQNPai
	ISTLsL4Z9lkOySWmKN53pJ8gguD9BUph2DVDkHZXDdBEAso7y9u3AuZQchT8zW/1uan0CCnDdvm
	utTa4Laq72h8KGveBBdDZKHl2cOAD48QfdEOj97POcbDtVvaTURjDHlo9ERTAOjN7
X-Gm-Gg: AR+sD12aBjYbCBh0LgZi7U4DBkQk81C+wCjGHh/Mbn09Px8bXh6ZsZtqr5DiXweyjmn
	rDGDonLrBUFrciYvqgq6Vhb2Ppak1UEKLsk/ThR6v2JX3jz8ZvvH3PT5eTOkZyPzt3Z30A50xDU
	4X2+yItGb/VCVrm+CWabIbJQU85z3LMAY5v2AH2VnfId8WzxMbAUOIrDJMiw1D0f93FkefaFRno
	lsRCBGTmGs9l87F56GegvKQ8u3h/jpiVMQnHghAc0KOaPzhBbAro4flR3qRDTDZCzyWef9SgHLm
	IxW/+D5TuFpUAlW70CxCrNEnQizSTgSolpls/I7PDXIrGJ6vki1IasRMoGpRKq+xlIwgN3AcNnH
	gOA5dJ7t4Odh7rZ9Ggkesqs917pK4Eqgl+1Nk+IO/ukjq9bE5DrXMvt7FD+aYmSmtGlUbXlU+CB
	LBLGdYxGRDghMf27hR3xylbb51ahrXI9ZV4D9+m8jze18LpXgYkMg+
X-Received: by 2002:a05:622a:488d:b0:528:1bad:a2a4 with SMTP id d75a77b69052e-52b424e2ebfmr11075381cf.15.1785427261816;
        Thu, 30 Jul 2026 09:01:01 -0700 (PDT)
X-Received: by 2002:a05:622a:488d:b0:528:1bad:a2a4 with SMTP id d75a77b69052e-52b424e2ebfmr11072291cf.15.1785427258968;
        Thu, 30 Jul 2026 09:00:58 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:00:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:00:37 +0200
Subject: [PATCH v9 07/10] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-block-as-nvmem-v9-7-f72935817dbf@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX3/8O03jMY/wN
 bzZqEOUM34x8u8IBNmpE7DBDbxc6IGpt8DxNOFnnzI2B9OMFLXtYtFu3NL7d2tpr08EoTY2wFRq
 qNkFnoyAqRSemKEUrUyWAwf9nVdscd65ynfl3JQoZNkVmsEBZS6KEptuh7sEmZghKzuPwWTJ+9f
 9H92+gkdDiBlHkB5pYy9KwTYxh5cRRCHz/2231XmCF4Iopwzu/8jq0e57PmSHJYorTc4adKLdLx
 7TVR5f7pVGW7AQsgJBJi/Y4/edkK6GPSPzxVkylXNayOVcf9jfnAvxAAcUGCThwmv05zynLLQqT
 ndVRl40gFHciNh3CgzRFb88WSfTG3g7ZWzY75Iv9WrHMG6z0/bCaYGbslq7NxsJIUlS9fRo3PLA
 kE/nwoQueSPgYgkZ+slXN5HcWBY3ruD466nH9V9yfnTeHIbPC7L8NIg5Zs/lsHHmxWJQUDPFyUI
 ObiG06gV/x4XijhxSzA==
X-Proofpoint-ORIG-GUID: xR5exZxLw0LRWMikyw1HlpMq0-VSy4Ut
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfXx+5MEUjJ6p3P
 z/1tl0ErtLOElGWQ+anH6UT/x0r72rfDnaOdqAJmf4ninQwClRnjicAJqgCcmoMui2ldzsWw0AF
 jwBCQCi6dfFrt3NI6ZGzjXKTpNBPk00=
X-Authority-Analysis: v=2.4 cv=PdzPQChd c=1 sm=1 tr=0 ts=6a6b753f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=bEbww9rD5qa0LKludeoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: xR5exZxLw0LRWMikyw1HlpMq0-VSy4Ut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_090104_073558_64258D8A 
X-CRM114-Status: GOOD (  19.60  )
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


