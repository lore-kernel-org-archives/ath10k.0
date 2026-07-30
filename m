Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95B6C55162
	for <ath10k@archiver.kernel.org>; Thu, 30 Jul 2026 16:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+r+249nF6a2qrtXG3fwd0XKqhJprD40LYapJr4TU6o=; b=KgRcgtFsPJ+O/azpPeror6X89L
	+IHIYQEKiPoVo/Yx/klWj7KVq5raaMSkMwTD9RfnKqPQytV9d+hx2mVf4MD3HMLXuOI7Ia484MqN0
	LziU6B6Trt1nLM5xbX7UDBZMUoJPpBQDC7ZEMIgOABHBxRdf9VcBnlAdOayBxtfGkowpMe+iLajPQ
	8pk4gDTsHWyfhJpgX+uEM12pGTBt1xckp0+l30863apS4G539OB2u+utL/Lptt8fXmQcATnzX0yvt
	LM1uo9hwc1Sb9WHvENyf+7kfDKsocom6OVIDCkst1oUQL8EGzzyQPcJxeQuDY30apl3lsgsnb/FWs
	BTkqLvhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTC4-0000000Aucx-2CRl;
	Thu, 30 Jul 2026 16:01:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTBy-0000000AuX2-3jO8
	for ath10k@lists.infradead.org;
	Thu, 30 Jul 2026 16:01:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQrOW1490210
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+r+249nF6a2qrtXG3fwd0XKqhJprD40LYapJr4TU6o=; b=CoQ+dBJ2w2OXWcV7
	89Yvmm28+CeLZyllRsKsEYx2lctJzjxebUPTXvnncMJYuuM8mG5FftOXEjE7Pbub
	i+c84ERsedV8jQDpkqL/kyr+aqqvCUcojbG6t4DKyuqLvEHA66yXRnE4TVQy22hC
	REpHvQ0DdAwnpUAwQdeUZU7fkLkcTHMeAy/Z10PpKMBKAamGTX9MaUwnXdH3/IBG
	MDiA7KkJal0svawJPgwTk88UazLOKDygNC0qYWI+dM9DoVjYo4aQaq6ZRdj7B3Qj
	8xdnU8MqzLJLaQiVSlkOSrRbL5SFX1RIrOoJFBUS1yoDaOd2WB0Px17lCZUOAVhY
	iGhUqA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8md0drt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:01:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744e80385dbso604137.1
        for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 09:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427265; x=1786032065; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+r+249nF6a2qrtXG3fwd0XKqhJprD40LYapJr4TU6o=;
        b=DC2Q+Fp4UGLoPxmyOZNKk6MxAP+zltzX0BNyRGuLJ6AewEDd/N7BUTndy6OtoSjKgg
         Ky7zTrVC6xZBwZHEFNMSMrM2VBF9+NK6mKODjZetDXDsxE0tZHnCDclu9jUQXgnti1pr
         B+ZNjqaD9cug8z4pbMCo8qdd+xSfonFirPnfqcBr1CXCSQe/28P/mumCWUng8G/zqdaa
         bHcMLAGyhhTokAHfJTy2fChwVJukHzZe7obbW05z2nDLrgmQTm0YZTMQbYpCTzpedJJc
         WM87zBbIl+bEAnCLRVP555DY5wovEWMR9+UsaE3XYnqld6RLBOXVR3oYvb+URkYJWJwa
         0LxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427265; x=1786032065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+r+249nF6a2qrtXG3fwd0XKqhJprD40LYapJr4TU6o=;
        b=iQyTob9PfDSyNbLi3cFouf5xZbPfkZ6zgSqCHvgWtw2bGZWwpgS+TcswhkXZvggMwW
         ZQlg+pd+HZxN4Oi6mct2ZvhxrSVr2VaAeU/GIUDS5mZ3j8aKfxoGGBiSJiuwBD705vWL
         oF+jcHHB5YU4fmtfzicZZ9/oEI0c9y9bB3adcKEf8Ig68bIlXp61zKMHTgVbgKTWwpSM
         UBK8UNjAQk93t24bmInE7Dg032r3Zmothr1+jqTDdHfQ3AL3f7M5TrZk8Kl40/5IBI9N
         pbYB6yQqhivXjdfjcjuJtj4yzMMnKIRPMwJPz7SLBBvDGNaV19JGFp7PclNUNHUYD/Ud
         zwvg==
X-Forwarded-Encrypted: i=1; AHgh+RrRw0hRt9LYyKff/iD+CpZ6c4DgPNzeq5IjMsNEbL0JDOhd6GuYAzIVHj6YPufdWoZCgBra1Yo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRLAjvpEqhQrCQZClq5+Ekv6jYFedhBF+pEUNf2jiextR5g3/N
	uJV6MOtJ9/sECVH0H0W/fz59yb9D/M6zWW3SSUNeKDCQbW4w6vBC2MHJdWWeU766n+iu/EdBSih
	0cqLYbTaz2nRm9ZDIAIYHKBrqFTVQlWHNhNvKRtc8IWoiWdmuJcYoxJzUl2kTVOJ7
X-Gm-Gg: AR+sD13eB5LoxtIXVJlkxPsBHzJKl8WO42XoCPckygalXcUsZEFKZoDp84/sl5oZ8vy
	ib9wFPPP89gzjUfqA2nc9R6QhcMp29ZurV2Md9hZa2UkKXP22SW2hV700HFhV851/3SzKc8vxpt
	vSqrR6Xx+T7tXY8Egx/dpDCpU5vyJR8svwHyrzjoQI/VTGMGM4l3O7JUKot9YolhgJWK6Vx5B+4
	OBkbXzmi8FGRLcaUZDJ45MFf15OJM6NtlKEAzFZSJqAz7UnimfQteGklU1Zxk+eGdhAzGsY8krC
	BlSZogv140vg9h6cYVzGYUMJJH5mb4RO0GGO9w9eaJ51ljtXGrHE0CRn115ZXCvUxRsSFuDY5SB
	HQ5TPFAGRlaeakTES2fx2zj0mXp3JGkvZS9sdNq+e1FHZ3QeiuXDpXnsdqRgNbw03XOUMioUlOe
	d+3RT9UZEp0BVanHWzg202kcFLpCtf4UHauFfI7DvgQwazXeHazn7M
X-Received: by 2002:a05:6102:1484:b0:74a:b5e3:e96f with SMTP id ada2fe7eead31-7574dfce200mr1067387137.7.1785427264719;
        Thu, 30 Jul 2026 09:01:04 -0700 (PDT)
X-Received: by 2002:a05:6102:1484:b0:74a:b5e3:e96f with SMTP id ada2fe7eead31-7574dfce200mr1067275137.7.1785427263969;
        Thu, 30 Jul 2026 09:01:03 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:01:03 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:00:39 +0200
Subject: [PATCH v9 09/10] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-block-as-nvmem-v9-9-f72935817dbf@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=UZphjqSN c=1 sm=1 tr=0 ts=6a6b7541 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: MLu3PZhLDvDbJQiFkDQDJsGH0NYQyG8b
X-Proofpoint-GUID: MLu3PZhLDvDbJQiFkDQDJsGH0NYQyG8b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX9984xIkO+iIZ
 W5TeHsnhQbGG+4HUmyrN/owUEC3mWjN+Om6DQlbj1GyR/K/Hk6VWtnyYESYfPlsI3edJ49wOj41
 mTOIUdGLEOXUIRCD1TEjVMDQjGz6amI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX6f/xICYWpwUE
 FFo0NRkiwRICCkHv5tyMQED5hPFSmfNlyPbFKlH8BzqWQJjPVPnmxf6VRFy54TmYQx4jvkS348z
 aYZPcIzDmHz7RuKKlvcHQcK+e/KxDE5r+xbyP3F3sEosJVdZ8HH34LTsYkiVmA8dxOcFooV3VQP
 NSfx0a/oZ1DyCnEE4hPdNCMwccw41p/n7Uc3y3QpjQ/wdYqlmiXuHuZEq9+yJaagA354+fA3BQt
 nZpKTih0khm1i5fN3VSMcU5l0zBFRdWUHy3FpTsHnSNr3NU0K5ODCDqOlvEeEjCyazVRmAldjzI
 X2CmMCkRGNevQEc0oJqDuuzZelAd/LaHoBCF97RAvTPt2SXnigSK9O9QVa60dMAtq+1pq9Gt2Z/
 JUl4ZelTLSR50IUizenwyj9rslK/cIEwEzQdXbpi+bRMdV92IRpdgPovt1XYbFydAjXz1QNvbQ0
 mepAvRhsnymAz1J3hRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_090107_074114_B93B00D5 
X-CRM114-Status: GOOD (  14.53  )
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

When the controller BD address is invalid (zero or default),
set the NVMEM quirks to allow retrieving the address from a
'local-bd-address' NVMEM cell. The BD address is often stored
alongside the WiFi MAC address in big-endian format, so also
set the big-endian quirk.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 04ebe290bc784ea854ec7743bc753c3e41f556d3..06cb787b0559f3d712ec2b88d9e25a7d46fb00b3 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -723,8 +723,11 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
 	}
 
 	bda = (struct hci_rp_read_bd_addr *)skb->data;
-	if (!bacmp(&bda->bdaddr, &config->bdaddr))
+	if (!bacmp(&bda->bdaddr, &config->bdaddr)) {
 		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
+		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);
+		hci_set_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE);
+	}
 
 	kfree_skb(skb);
 

-- 
2.34.1


