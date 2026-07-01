Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AF4C43458
	for <ath10k@archiver.kernel.org>; Wed,  1 Jul 2026 16:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=; b=yQY3B7XpNB7RZ/u38Exe2dgnvo
	b7MNVDXACV+KRzeJ4wxYMWt7FlkcyzFk6/YMpyfdgEf4NMWf2on71qUQ2/Cuj2sen+6x3kAZ5yBGo
	4kaTv/DfcKieUMeXgJ4PsvkzYqJtkvBitp8fa+TeXB4z+HSHOnt93KXQIz9Nr76TRCDVh9+nctVuz
	J3RnCclqNw9kuxBRXdOUwr4lurOO/Y7FuoX0fpBn8rq2Nz6oLsfLtAIRof9BnlIvPL9T9fdEqAOah
	s3qSZQsUTAQFJNUalO3uqecYDEF4hnJZ88XMuW8yQQkxEdsJVwtszNRq+yVJ7dIqyChV52ysmmw8B
	CttKidjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexNK-00000002T3X-43pM;
	Wed, 01 Jul 2026 16:01:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexN8-00000002Suv-0gYi
	for ath10k@lists.infradead.org;
	Wed, 01 Jul 2026 16:01:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Fo9fL1428990
	for <ath10k@lists.infradead.org>; Wed, 1 Jul 2026 16:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=; b=BZKJB4GqHyp2aIyZ
	VaS0G0L0nXtvGM0/o2igDMHE6Bgn4FSYWPb20BGXgUlSQlQV8XxU3mQ8WVRBgyxO
	vtw5fDqzjZsJVqbuhL4lMBuo4CNA60vcPU/8pdd85/KWIuajtDaQNZKDhAaK4DVl
	9KESl3hjp4OJY1+PWLV4Bxi4I2NcuDm9RLTDSNWnjDkQnQPeek6d2pqcEILISHLa
	x4FM+XGu/yxeEULWzlJ5BOHlIuCgnaOc8ql0gSLzaJdZrjD7FadC4p57OGSxj0N1
	M0AmpR2ylGigBoPc9HZExgn1OesFrV3vIL3dzhMWHe+RadUcSo9LKLm78e60Pk2z
	H0yPyw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q08na4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 16:01:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e38fbc5so101169585a.2
        for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 09:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782921668; x=1783526468; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=;
        b=cE9gv4eAHtG+aCb5yrF0Ne+05qm20QTKHwIPjdJgHSr/JvAoocO1EYtIFrIu2DBBQP
         KD7+sQYgHwORZFh7s6LE8XXrgFuURjW1WbC7KllBnQPOk2NQZg86Vr8wENO+1xRjL9YL
         PHjaDw5yRu6no00evO+LVdEmGPUO9R+rF/Nty22eVed0o8keDUjoXJt64e8v3QNSBFdR
         1qHkEMP+H/Px/g6QRg5kehQu/Sl5zqVqsJs8wnOBalsc4bSg9YrpxizOYsYZR+a/x5zA
         vRLtkdKaNKo6vAy3QYH+KXanKMIqcaMbz01PJ3pJYWEqYLNFCilET3xwkaujosxMTRt2
         voAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921668; x=1783526468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=;
        b=Y7oCrGJ+BzJZon5/2MiZqnI4rm08HeXRmGbp4DHDRqXiNkQUoJ1WO3R1xI9mhQyzsI
         RrzRkzua566vFpdWCMIcvLrSuRBEF4a8aLaxnyYU7fs1ndu7kQ6YUfzC+p4i5G7hVnx5
         EAPXbuS6HrYnyqfOkrRfZ8a+2s1W353e+3AoEV2ayog5OGzDZUnuHuMy8bDEYkevb81R
         Omd2IIPF87warl2e8ys7nNJIszTkY5U4CaHuhQOsb7O9zknT0+//chup/POfNWzFhrIG
         oZGOn0RPeFRZBXmyDRyJ8xSCTWywzXd7wY3GPvVLp6fwxt+UiEyB+KsjhLJWphcvqMXf
         i5bg==
X-Forwarded-Encrypted: i=1; AFNElJ9XpB3pC6nGwftuDl7D9cOpv8EznlejQKRJB8WqXAENeLOtZfrat/7DsX/DU0PGfzLYuKJebqk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrHAxoMEHbEOB3AUdRJdsJ0Q25ZJZQuQWGRNCzc8vBB7I5Ynuq
	6kBk5FK7qc/KkfOvKBWwL1Uhnqvs6UCTDL8I29EaXaE7IdNa9SQDun6RHCwgvcJGU/jGBieWFX5
	hW1Iacn5pOOOFa0liiWrmuCLykZdcrdXMjA+dXLjZqu65L7GXoWktOS50SQsi/7lL
X-Gm-Gg: AfdE7clkGEmj9GxTK6bB19874f+DuLB3aZbNStk7YaYZZeP87QZ+lgz8tfq6LMlwieV
	k2FwIU4XXm0XxYXAp6T/Cc71agLggsnr1OkhHkVBXC5wKaRHSiLWX2WX9kPCji/BC+ngdzcM82h
	17R/AV8gDSlnJ6NlATlBlnrsz/dZArHQaB1neNYIttEAgu44SoolP0wMT+f+RazwqfwJ6Ugy7ZH
	H3daASaGSQ4NHYw7KqHWua26vifAB6svu77N6FPpr00W1aQOVttmEptZgPnQ6eXY3qz1vxsYPkb
	51Vpz8PdcG2GHYs0DOIDIzZEVXiaRFtnnn5x5w6goWXp7Q6cLg65KU9MME0T7z3KprHGxyz5ita
	w6VwtNr2/VvN1G9W/hYsB9e2Uy12BZ9Ue4miQqIVKoZj0bKhrGFrz8yHAEI7Feoql22aVfdGhmu
	MeTYymuEGR9BB19PI6unGfCIT+/QdBESJiSnHlVJR88hl1DE8a1QKdXp0VhwEl5ek=
X-Received: by 2002:a05:620a:2586:b0:92e:5c56:727a with SMTP id af79cd13be357-92e78506001mr341368585a.60.1782921659835;
        Wed, 01 Jul 2026 09:00:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2586:b0:92e:5c56:727a with SMTP id af79cd13be357-92e78506001mr341219885a.60.1782921651391;
        Wed, 01 Jul 2026 09:00:51 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d19e03sm296613066b.4.2026.07.01.09.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:00:47 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:00:30 +0200
Subject: [PATCH v7 6/9] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-block-as-nvmem-v7-6-3fe8205ef0a8@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a4539c5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=bEbww9rD5qa0LKludeoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: IVSKJabTtRO2-XkyAsZ-9boawvuS5u9O
X-Proofpoint-GUID: IVSKJabTtRO2-XkyAsZ-9boawvuS5u9O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX5VFCqEqhBP81
 qTwpV5I7J9LM0d83kbpCq6pqEZlQXAGa3+rRD8k/NrcbJFrMNAjwQku7FfbRLtRgKgDbjWma8iU
 UspBGTdMbR4M8SZixYBVOyra4W4DTG3xh9iynAhNZiUtehOLEVPQmXNhtm8CvepEvudDzkzF4nL
 MdbJ9F5udWh6+0mnjqpfCC14LfYL8dBi7b7GvzUTUw5liYrYwNm3FsL0b9XTKZ5IyomSrEpgntS
 y0j8YV+8TwDNRQAcS2X+w46o0Bo4dDQuva40j/FFBeeI0FcxaswXb0KkVmZwDuCJDNkWja+ynFw
 y8yKMr6EdoDQpITqCf3+zvZs0/YIzU26I16CWqU+CJ5uCNhReglvtQy/33F9RRwHjF+RAvM+CRi
 hk1qkNxrZY6WqV2deHmczJGVZIVAgcXBQjhD50ToCiblFuJYboW3Sx0TGs0lpGnk0XAUP/ECHsP
 uPLkUjaFaIFKh6ubLSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfXybNByGp69Yc3
 Jm9jZrhTFz1tOIklal/DAMq5V1yHUuzqje7Hcj00AhDZzhB4V2riTzKWo1ypddXVG8+y3mYBokl
 kzqfnjP6MhqyHqftqdQY5aFanX0fWuY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_090110_211780_95A8A6B5 
X-CRM114-Status: GOOD (  19.08  )
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


