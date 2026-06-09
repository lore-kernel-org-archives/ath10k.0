Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6547CD8C85
	for <ath10k@archiver.kernel.org>; Tue,  9 Jun 2026 07:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41nbnSBEwQElk6GtkzYHQTOlycyPOuLRHHoqlbc4AwM=; b=gv+KqPlfZoFtCM3GHUQxxzCBTz
	lgXxXfGm5acCv8bFNzI5ZNnRHOOSPkAGYxa7drxs2IfbSr/l/k9K7IRVhsSX9lRw106nUxdXTmo4A
	MFkuqS9Ufrtjt+hyE9ro7wSD7tvf0fso+j2EaTpIBGEslOyJ4XJjrC+vKXlw0cG4GvQEy2eUhZ+q0
	k6lUshVQT4wBEFHdnhXHuEAvyVyzfJLoC8wBLBpz71dKipdffOpKMnb8RjlmB2PdMFhxPJTrGcIET
	4iwbYX5iSx4hCYBkiSOHEU/0pxsdjjy7D91m/IoklslGtSP/TDw+biw1S6MdkFm84p3BGKbXyNp9N
	332vqzYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrHA-00000004zq5-3RHV;
	Tue, 09 Jun 2026 07:53:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrH8-00000004zoB-1Okr
	for ath10k@lists.infradead.org;
	Tue, 09 Jun 2026 07:53:31 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rUHw1517823
	for <ath10k@lists.infradead.org>; Tue, 9 Jun 2026 07:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	41nbnSBEwQElk6GtkzYHQTOlycyPOuLRHHoqlbc4AwM=; b=HCH16y7kViKLrFhs
	7UsBAF+HpVtfvq6yHiDLxz+pt8PFwySxN8mnpW1Gdfh0XVDOyxaWimOZPRIb9Y6l
	WuYg/+wd1oCH6AjumAJ2aPpG7xkNc2YACExFChrPhea6T72oOfpaFljXnqD0+aUD
	Z1fYgJzF6FAhZKI16j4THgQ7UwvIjlAQTd7Xifd428Jf/bnFybCjkE9lIi+uqpaj
	o7nWVA2f5XcNAgEXv+ZaYAZxwkA4+j4eYpdeLUIcZNmJkqcI6sDBCvKiKnQhx+A1
	LsgMIy0sOAE7ML6VDQ5/2TQqt8u86ih7bH1BBDHRJ8S0ExMqnVRPrbZrU2TtWXee
	bcEBug==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr81f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 07:53:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177f07ea82so130754941cf.3
        for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 00:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991609; x=1781596409; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41nbnSBEwQElk6GtkzYHQTOlycyPOuLRHHoqlbc4AwM=;
        b=UCDZNdjd8MqNnD0FdCGWnpJBL22QGAUZOhHzFCzEkygqAiEyku/2wdTqoa/U/Xz8yt
         WMCM4CiHaDe/5f7tK15Vtye/byi/sYRcGnD+E6GKzuoE5ug8cjEm0UjRpzPBdWG+jP40
         NWPUTlKawDRqAH2EXActkHSlA7MYw/p1Xv+kuHJaggs8iUTY93JghGP5pc3vewvb8Z94
         jTtFC4PnED92/R13E8kAgz3SHdGc8lIE3DrWsUNRpv6rtAukpv7dhTiOvPFxKTq5qBJ4
         MiBLWNZl0ayxp3ZT1t06EP/Feytv1Ks8hQP5s3MVdAoMfIjbZnHXCDGrsRhIT4A7WR2h
         Bwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991609; x=1781596409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=41nbnSBEwQElk6GtkzYHQTOlycyPOuLRHHoqlbc4AwM=;
        b=ok0PTaHp0MdaILdK5uQJ/0ksnf0jaeWjLGiieC2YpYgX+I6RV//hDqPJJWfG3cCdWn
         cyFpqWd/bN4AfcvKRGZokkD/BYVQppMc0N+/W/Eip3M4Rw/kZv0vtgkk8BThbia1FWxk
         +WCibuIIGa5KIQI49vMW8KMjXCxXbc6O5VlGjkg3PWqOOfhoLT4dQw09CNOYzC7jC6/x
         p1SK4mEfEFSxG3pGxYVzE9vH3adaXcw9olgnwrbD7Os7CQ+myLrRdJBELKaLJX3AvhKw
         Z2YzjXufQLMn6Qj0dEBR1sDiqwoC3mHl9Roijwh1vadDAABMK4//f8JYVMovYVrkHaSe
         BMew==
X-Forwarded-Encrypted: i=1; AFNElJ/EW7l3yCY5gYJwDmefI2aIjVQ/drVD17bKTrppieY50QpC269DiZLJDK8AcvW8s7L9uuQBSG0=@lists.infradead.org
X-Gm-Message-State: AOJu0YysfzFz1tIZJTErkgjWuRFz3hFGffMQCGWwiaCy1x7kXxIGw5MT
	CnigEnNx0QWaSoVDKnJk/8V7cLXdn/iPYMRVI+4YKnqIvoG3iQBKXpxjRKTG0UrgpGpeBJeuRb1
	2HfWJs9bgoNi3pux89vMb3vSVtE9Rouc6Js3JlFu/CQNNRMxVnRJY3zGCo2LD4YCUgN4piKf6Bc
	U=
X-Gm-Gg: Acq92OGp4EDd/v0SfXP5Jn7USnOicY8Q35IX9E7R/SnB15BV2Ij6dwT5R5MMgopkC22
	FGHuSU7Fkaa9g92sUVdeXdJs/ZhqbQf/YkY/BGFQMR/A7Cx1iTeRkBJ5SYDtlM9nlvKwyfQ8pan
	rM0TpVJC1tTBm1o+Ols1Wrqs4F5dVmymopMBhzgkf04Uulk2oyHRN5SnYLWFzbNitEJGqMPZ2k1
	OF182bX8tMBSSH7Xc36tuweCGZWDJ80xpGeXFRnslXfMNrpldV57Ti0nysyOQW5duJgCCT2kolK
	1byY99Mk8h5Oi5tbI45TnHfSrY3CJ7yZPndrKpiqhhuGz7FVbUklqSyGBzzRBQBU1E0kzfgJ+SD
	fPLDAe/Cvl5kEtydPQkWvjNu1kLbKMepHhQF23mbcjaxXwfmHZ+nJj3ClM+Fy0kWnf15Lr+X+R3
	50aKmWRuaxJxeGM/A268apTgFnUUCh0XhsMJq/qZV8R6BQBVFm2AdYTLZhXEu8qFp5QHoJj1evs
	ElumvzJxQJW
X-Received: by 2002:ac8:7612:0:b0:517:a02f:171a with SMTP id d75a77b69052e-517a02f1d7bmr164821381cf.36.1780991608563;
        Tue, 09 Jun 2026 00:53:28 -0700 (PDT)
X-Received: by 2002:ac8:7612:0:b0:517:a02f:171a with SMTP id d75a77b69052e-517a02f1d7bmr164821031cf.36.1780991608169;
        Tue, 09 Jun 2026 00:53:28 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm8121631a12.0.2026.06.09.00.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:53:25 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 09:52:30 +0200
Subject: [PATCH v4 5/8] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-block-as-nvmem-v4-5-45712e6b22c6@oss.qualcomm.com>
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
In-Reply-To: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
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
X-Proofpoint-GUID: s-tZkGzaKSV_yGJeZ6ak6THfsgdRRaNP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NCBTYWx0ZWRfXzdA3OYPI0RDw
 liY55eqTZ3TruXTVuGM2P2MBkZ4treYQVH4FyH0Z8XYbaxsHRsTW5Do0GrmmZSqhEOPKGcDthu7
 gGAOObEnOzsRFadsoW0j55winTh5MZf+lmG36OQGMCXwq2f0rmopMGPp2DDimsA6eyLuqwC7nj+
 tdn761COJXtlv43y4LoCknT5fEmsZp1NUwlwYCfKwbMKy4iwHU7ZcffJARCUN6SCDnuULq3HnGB
 SfYxX2MqIxIvrAK2yAY8x7qw9AJ/NJKrOYPGAPiBYHieZuHwbQOFt9V1ERn6L7ynx+GgfKSeoLl
 6xGHmNzYXteYbg53jO4nR94d2d5FLiCmx7znJ9HCIQS7dTX/BI/oJ9OhEeO2LeOAMYxwoYFYXyk
 urIX1jW7wXhP/R92eliGJPiCy5yc6NjZLIcyDli4xX+LDW8IhDkujwJs1xU/pHvgzYCd8mpnmmd
 56wy5oBohS2M2b7pFjg==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a27c679 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=bEbww9rD5qa0LKludeoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: s-tZkGzaKSV_yGJeZ6ak6THfsgdRRaNP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_005330_376309_DEAE6440 
X-CRM114-Status: GOOD (  18.42  )
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
index 93ea425b9248a23f4f95a336e9cdbf0053248e32..75341c186123e949fbe21f1e51fce3ac74d4f56b 100644
--- a/net/core/of_net.c
+++ b/net/core/of_net.c
@@ -61,9 +61,7 @@ static int of_get_mac_addr(struct device_node *np, const char *name, u8 *addr)
 int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 {
 	struct platform_device *pdev = of_find_device_by_node(np);
-	struct nvmem_cell *cell;
-	const void *mac;
-	size_t len;
+	u8 mac[ETH_ALEN];
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


