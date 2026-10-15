Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3606CC6B33
	for <ath10k@archiver.kernel.org>; Thu, 15 Oct 2026 14:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPeNqGPMRBWAfsA5CvuzYdqPrDk9qOkztMDjoEMaK1o=; b=kLTlJDK8RFVw8tJholHg7Y9D6y
	AgyUy9yP3tTNTfvdBp6oB2jBZRSJKH3s6NmB/0Pa5GlB7MGiexELBZoygCPZaIo6MtDRYlgRg9lMS
	zkEst/K5RFSpqamoXtvRalJYvKdexfYjKd4Ye8fgURXJQUVfqnQkQ9QiO2baVnCLsrtOqpvOv2k9N
	AfcFN8dMu14Esf7plrHuMkXCE74FBv5QCSxC8cuvG3XJJOS+vo31SAROpr3fdBLCkzDHQKAOnl5ri
	9es6jx2I08S7e7HQsGiMbHn42jszMLp59bRjzIDArYqhdWXdJkV2jh+e+QSzafw7/wVLZvPnLjS90
	kDrhL/bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPp-00000000MVd-11D1;
	Thu, 15 Oct 2026 14:26:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPk-00000000MPi-2MTT
	for ath10k@bombadil.infradead.org;
	Thu, 15 Oct 2026 14:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cPeNqGPMRBWAfsA5CvuzYdqPrDk9qOkztMDjoEMaK1o=; b=mNPdzgswrVMDkLj456Tf/Umlk/
	IveNElAZMMLUYBafqGWnmIZorJTNyYgSx7UuyTq6JqnbSDQj32GIoHw2HxSNKfW0VQSyyiCThzEkW
	YI1U/IYcTLiprpdvqI5R7nnkXwhm0+382oNd9vdJTQyqwV/ykeAmWcMi8Q++pIId4CWZL0yGAPRE4
	xko1MVIGB1lmJzfXK0mVD9gezl6lHDMhjg57ZKNoAoVeip+eA3M0uaUrSLo2fp73b4S2wEJrbf3GB
	MZDTNrME9Lmu/sqIBpRpSZqahMYIEa26gyMos7BeEBu7Zeb7DUBDpwRBXAwr4RlXlmyshrHhafbLW
	zItO8gDg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHMPh-00000000TDD-1sNw
	for ath10k@lists.infradead.org;
	Thu, 15 Oct 2026 14:26:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAQOfH1597262
	for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 14:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cPeNqGPMRBWAfsA5CvuzYdqPrDk9qOkztMDjoEMaK1o=; b=Xw+nnUMXYJLgyFLR
	sgenKLp2gy1/pzlHNA6p1TwDnLe7EftRxd3PhapGoPbvljnOy+/Y/4qCM33jk1HQ
	Sxw+y6smKXcWD5SO2xNB/oxoY+PyYO7b1C9Zkq/KAmMgRT8pT0L4TWtgfrqwDjYg
	68qIFv54NdN6GtES8WsEnIBfJVIqkwU7kNo4JIMchhSBFAWEYwO4MnN0VwCUy24M
	B8tfk763BKDKIeiviXvivxge/iMhBiGWb43298FP3p8ZQKM/p72C6VpwEvvWn1qn
	vjCzaDUYIHUkcLg62wC3/8ub4IX+FfhFXAwv+LusR0mmSalYYk5D7XwjuNLNPPVC
	ljFEVA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v8x96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 14:26:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf67e46ae0so933421137.3
        for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 07:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074390; x=1792679190; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPeNqGPMRBWAfsA5CvuzYdqPrDk9qOkztMDjoEMaK1o=;
        b=Qcv6NrakK3PNNF4IsNwuhi/LwiOOyirC1f4b5EmTMM7va1P9AJrqv4/abbglcSjuM2
         cQGdHJ8MsTUjwHxqNzJhdj3Jujn7GeHIGm22KlDLco8Thv6DpDAOQNGugG64iPEp3Pyc
         1pqzsm9aBGBe3fjbGkRciQRF/1Vn6E9N1GR8BLAcns8nAUDvMOJEcy8bQqJ2DnKu1ndM
         zNInURd+F4pZku4ZiH5GbAs+MiETBBmaqeE/joDEjFfHC80Gpk5Aq4dHSB953Mm4HlhI
         P+jGEhO1Fwj2HUYtMlzOz+glFiMOoO3ZtFlGdcglzO+PZboGsobLteAiT/jQywBn8MuQ
         EH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074390; x=1792679190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPeNqGPMRBWAfsA5CvuzYdqPrDk9qOkztMDjoEMaK1o=;
        b=X2zVNLbXYzWehqomBdY2yagBEP0WElBC1xgsieSbX1Q8rStGbR0wyx8LEmqbjXnnnN
         5Ji1GRAa6Nm26xQItIEub1xtgpm4SREvq+Ey7FmI+WQ8q5pkOj+4HppjjVhkB/f3hIZ6
         vFD98fAGJBv/FuJZKqFE0pHP8IfDsVLJ7/pKAcgHpt0SwedfIu4lkjTX0UR7pQlJPFVJ
         tub5LI6ZFOPwZmsBVamiXjgPGz10FbB7XtLpVeauFDadgDkF/AxrhLfLQlUSyFYjFz2c
         UdsA+kUc3NOrsXgvcvLFMLei6oK0JySJd4+QIMdH0ATMUfvFfGWMn2mjkA2v3nWMtyD9
         J9MQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbR4TimZswsbWDaM7FC839hPi+2CM4AzHsdE2bKJmthDjvt5nitrcDDWocuythQ3oeTCzc8YY=@lists.infradead.org
X-Gm-Message-State: AFq9FYK1F/vRSCIaC3meITNIHp9rjLWIhW4eXskhq8riI1JolspFrz1r
	vPgY4w8QX7HdW8uiao3jhc8RXE4akb1ERQXq2nOTchA2JugsA5qxGpV1DfK1a45n+QkmGUq27PA
	15pOhclzzyNbXhMHaguAIGD0whb/vFYCiSFdKRIX20FNEZkoVBAsyODGqM5PDoP0d
X-Gm-Gg: AYBFou3OFUFNfAQKBXsgAI5EuGZ6K0m/WTTz0vczg/FXPSdaQPm8+GEsWjVzZ0Kw9l7
	xa16Qj6W8nQyFIpUOrbILgGgY+Ld3MG0cWJat2NeAKZ1QrUuqTtk/NURHC1IdP0w+NqqXO8bU8o
	86rFEsT96U6n1bTBzLD0Yh6+DSEvqN1ncJ1Z2h/Eob7meX+7sGwCzvL0HtSlxjozbOGcy7RoSvo
	gWwb97tnC+D/oM5XV/1jsZ5TCnhCp3yW5jaOyXzFzihgi/aZDS+fSgYa4ymOcY6LC18p0T1GIwH
	876QOsATAcWj1ooPkkS6nDlwZLkaeXTas/Kdf3QpT6vQ5nUXWfrit9WbM50oK/fQ4YUQCWIr7DM
	HDk6D+0a/Kbg57UZCc5EAXvLuT8NxEWL6ABVt4jk0NJAoYj9u7Ha3QOyZlwFh/HsJ8f0iAHPaw7
	0Xg0MdlIuL/G3FSVCd0nQitMSAwHheSvgotyialmbbO0jWlmIOchs=
X-Received: by 2002:a05:6102:5114:b0:7c3:3890:6076 with SMTP id ada2fe7eead31-7cb37250532mr5104409137.6.1792074390093;
        Thu, 15 Oct 2026 07:26:30 -0700 (PDT)
X-Received: by 2002:a05:6102:5114:b0:7c3:3890:6076 with SMTP id ada2fe7eead31-7cb37250532mr5104279137.6.1792074384767;
        Thu, 15 Oct 2026 07:26:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd6428b3sm69083145e9.1.2026.10.15.07.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:26:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:26:03 +0200
Subject: [PATCH v11 4/7] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-block-as-nvmem-v11-4-f890ac74f87d@oss.qualcomm.com>
References: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
In-Reply-To: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
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
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXyEmdpKwEHihO
 HIHkV0vSFynFN36IqMeyR2IkYJt1ciPEWQnLf+7/ceQXHNBayJqS81BRUNov0FZ9G+/TeG7Hfq0
 9U6a7e7KP/sew/hh5ZC0Xl+Qp9rtYl4J5BkcYzKxcgmN6xIg5yuPS4i6iRzaOpgsifCR6ouyRWj
 qQaw/tjFehhag0VcQXE8HS23sEWIm/EOKkQVDmhJzJdghNB5k6Z9xwM42hKYyKe7caGdkpQ4JQi
 IYeHmztbw7JVoaSuTbbrOXBZhqo8qCoNj6js39Tr/Ic57lTaKOhEtvY37aEQs1g7hI36Wmg+WYF
 ic3svZGlUhyXq6sriXod4fC6lWj2pR1XjrQCBu0fYiuuYOFZ1a3jBkfuOBeMh/Mja6G316T2Gm/
 J1wBBumsOTXkQdhGQleHFXWg6Joc/HBCCJkDJNPRlJIIiJnkNmiUwAUic5o1b3M3kXHEW6bMdda
 xNKRzfagCYth5XcbZng==
X-Proofpoint-ORIG-GUID: VGSXP7SrSjo28TrExymFero35aoL1Tsz
X-Proofpoint-GUID: VGSXP7SrSjo28TrExymFero35aoL1Tsz
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0e297 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=bEbww9rD5qa0LKludeoA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX6OrV1F6ozRU+
 J4v9dNg+Mm4jphpKrXW6go6V89QORKz9xh95YGX1IATnuV1GM0nOAokJbofwEbj2ftmLXhJdVWf
 IGTcewos44+j5xalfry/pJ8hRtbbcJk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_152633_970834_06786094 
X-CRM114-Status: GOOD (  19.76  )
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


