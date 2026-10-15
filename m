Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB49CC6B3A
	for <ath10k@archiver.kernel.org>; Thu, 15 Oct 2026 14:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nX8NHCdH1mIPZ8Y18DIA0kViNrTV399Gnyrkc+b8WE8=; b=rKJYjadN1WSvJPE/3sDbbNbYHa
	zJKdRPK62Li7XBtRvPCbFek8RRXfFsuxWkuIjKyfEKvm7tc6kug0zqJWfDSwhNlYWuibj9CY21TGs
	wBQMzFH2eTNodyz8R0staJOVdXHGVP18L8/Opac3VrZt0+QTPnoBv+rnGP6E38Sl/ttuA/hM+LOTM
	iQ+QwBWJYfNa1Nuv5TYkasrd327rK6HhZTbYCZ+3DjrAmEVi9UVE+Vi6CIczVDazVItrBpbZjxCjO
	GyFOR+ZQrjgU5vHI2adEzs5vWsO4Q9ox1nnNAxuLiWQFcFOehjEbbzynWWZW5E73q0yM/NA4XTlOQ
	l1Wuv6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMQC-00000000MrI-1NDA;
	Thu, 15 Oct 2026 14:27:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPl-00000000MQd-1ipb
	for ath10k@lists.infradead.org;
	Thu, 15 Oct 2026 14:26:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FDYO5u3462822
	for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 14:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nX8NHCdH1mIPZ8Y18DIA0kViNrTV399Gnyrkc+b8WE8=; b=Sogn1RWgHxcxg1pp
	Z5d3c+Qq0Badn10+/9vMC4yk8oGB1T2GgMV+HVF/RGEaiARDbqSQc6+IZ8kU/Srg
	GLK2I2DEsUTqoMlfy8P7/T4NklP6q/Kcq6EKKBeGDQYceqVm1t/V7j0ZaoHQ9632
	EKWx7E5wIt+32amyoGkpGOfKAUzIF1rNnBk20DsiTLyMZLh1YsYACbJlpVBkYG9l
	/7gNO5sshWnNACTslxvYFPwdhK45MjbXkElGzxMJ8FWt/MNrVYb7ecyYi64Sih9B
	W2JkRBskDaJY7IEMIVOBBAVtEYtxllEZ8oUAVcFZQFc3GVN/Emp60S/9+XOS7T2M
	RT1nJA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu6871s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 14:26:36 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc0a64ad59so133319137.2
        for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 07:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074396; x=1792679196; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nX8NHCdH1mIPZ8Y18DIA0kViNrTV399Gnyrkc+b8WE8=;
        b=P9cN9L5imzJKlOvZiTXAiodBHDm49QQHch5AliXpcEn9rl2U20iJiZB3nVYv/HY6/4
         k1ReRFWQtGrRmcWMLD6WVZKMsMuwNb4TJzE2k4Z9VL3eY2Is250LbJM2cw7YWiohv5YC
         rHpXBwq6P+bnLlTIpcol0hfPxiXq/OI83GAzdEYAL618t/j6NSIXxV34NbkVUTunbO30
         l38yDS+ZvimHWTYQQWAnkVnr9OfCyTAMG/Gg97sgcE3ifMGBRoVQ/XLvVUj7S6pdVVG7
         CKOD4bvu9A2Pz2kgHH3YU8D56l5mlOh8LHSkU6olwHH2HCJH/BdNQXZrsINHpCTzrhsS
         L0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074396; x=1792679196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nX8NHCdH1mIPZ8Y18DIA0kViNrTV399Gnyrkc+b8WE8=;
        b=EBi1dzqona0IZdNWFtW3awY3/zzXv4d8oUuq+o2mXN/xc2KlFkjU0Pf7Wd97fvHx6o
         rYaYSHj+/kIs86y4T4U/wzrJFWFcUuB8cWd8pyQxSeSkyBry2o5tD/+9ZgJnwJbXi0mg
         pGmw9BKjk9raNrjy6Pp7FlCr6Y/8k3WlrnoJ/MB5ZFl8TfmkGnZDd4GVOTKFQ9y7VUOl
         QkUlBQzbx2cSNFkuhbfHQzN5muONv0P2yhFbVztSdp9I5rtFkv8zN8GswQcQeMMMkYdb
         PGg0PricFGOQxeZIfeW+8SLlbu3aHuH1OjXhrp9IloedwzX1eW4GPZ1Q+GfQubnOouRZ
         vshg==
X-Forwarded-Encrypted: i=1; AKwUvBx2tubLxdFnMmJEW4Al+v/NsLoFEoz5S2ndARt8oDD8dAnz0bzrW3poaVYuobabdLFHyXrckIM=@lists.infradead.org
X-Gm-Message-State: AFq9FYI08JYclx5TU7qoEbcUwcEiS8ZwylyWavK6ssHuqy8lLhl/kkBm
	b0hjD0iWNUajjS3+Q9k6TZzLWatiSAwgRH2lv7OGOJPm+A3Wjm4/Anq+Xiv9S0No20vHR+l8GMQ
	YQkyzcIf9jjTYtpq0yjKvI5uQXSIQ+TIlTjtMrOhY/oyAmD+VVBbUstNtCUBJxXGH
X-Gm-Gg: AYBFou26sFCWGCwoXlkLU/1bwFnMtBi0ogSpmdA41lFqjUFln2epyKFDIMRbyg/r4DF
	x19SnCFj3zss918VEeybCRtQBMsd6jOZDSoblLSj1LEGzGS6Z5xoEUZeqS14Nr/BBg/zylgzDX1
	ccSUsaL7MO7KIMTAH9Zow4gK2jJquFzcHh1Os9RdITSWY4T4HKU/1pEs3pMNPsy+a9Gv1TKU8oY
	PNQjQzRShopt5F7wCp7Az+LPM+aTa1HKyK2P4QE09k7PbCNyQ7Lh2e84zOHFDtRkScDffyNE4m8
	WNph/G4VtVQ/rOQLoOEgxw+AYpkl3ZAJCXACfLvWt0FGYhDM1TNZNIYP5MEABriFlPf+fyYdrT1
	SsR2hEgsUPyBzhtpu8BwYmETOSmKZXNbUq0jbpHD3HzeqfRo06he1IzbMIKuK3tdGyifbxTUg2H
	ZemMSnlwuorZhwEUwd1h8kFaht0FWsRWYxsdJEiI/ucr4lce3iNTI=
X-Received: by 2002:a05:6102:a15a:b0:7cb:bbcc:e52 with SMTP id ada2fe7eead31-7cbbbcc11d8mr1668733137.0.1792074395050;
        Thu, 15 Oct 2026 07:26:35 -0700 (PDT)
X-Received: by 2002:a05:6102:a15a:b0:7cb:bbcc:e52 with SMTP id ada2fe7eead31-7cbbbcc11d8mr1668710137.0.1792074393563;
        Thu, 15 Oct 2026 07:26:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd6428b3sm69083145e9.1.2026.10.15.07.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:26:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:26:06 +0200
Subject: [PATCH v11 7/7] arm64: dts: qcom: arduino-imola: Add NVMEM layout
 for WiFi/BT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-block-as-nvmem-v11-7-f890ac74f87d@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: SUi41VjRrKHiDI3gT9OZFA5zVJUPSHPS
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad0e29c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: SUi41VjRrKHiDI3gT9OZFA5zVJUPSHPS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXwEGY2dUv9R+F
 Y05QApDI+JRaAMV+s87/7LEw6fKSy3BSha8r3JDKfrL52Koa+QLl9qUcp7/n5DliQkUPPb2Scmv
 KzD4WJzUSSM6bzrItiWCuTmAuQbu7pX4auF889FPnWnqtkE0LCBVARskL02T9VQW0JwVKGn+j3U
 KaToRNgHqva7JKam42tIAuYxy2IwoDUv+mYrjqXY/mDpFY/rbqdzmZg41nQCYkps1eMXLRBYLzh
 72XNrvdSe/CDkrgGx1jWQehCa7biksk4K67djgdo/8zTtXa9V1MagFmzs+HhooYS36LV0x4LX6T
 KClRrGmL20t4I8dQUArwSXS0+ZLjHpgigG0tnX08BRUCsj6NSB0h5iv2uSVafQqvnSNSdl4c0te
 eoy/YOPn660lNBITWEHm8Nklyo8Z9Oetbj7RpRPU+NxK2vTDq0q4mszTf/LU9LxhEB/YWUGwAg/
 cKJhXGdG5R1EAVu8cxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX5eSJGYu5sL5L
 mnh1yI37NriXTL/6KYGi96epgq94VUWnspdS/ye2awdzcuzHThhzGyMMyoG8wjmunbHtLjFTqeQ
 fzFqpwjHpeLq9yRy4cdavTG400aT4kU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_072637_707478_F569DC54 
X-CRM114-Status: GOOD (  13.15  )
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

On Arduino Uno-Q, the eMMC boot1 partition is factory provisioned
with device-specific information such as the WiFi MAC address
and the Bluetooth BD address. This partition can serve as an
alternative to additional non-volatile memory, such as a
dedicated EEPROM.

The eMMC boot partitions are typically good candidates, as they
are relatively small, read-only by default (and can be enforced
as hardware read-only), and are not affected by board reflashing
procedures, which generally target the eMMC user or GP partitions.

Describe the corresponding nvmem-layout for the WiFi and Bluetooth
addresses, and point the WiFi and Bluetooth nodes to the appropriate
NVMEM cells to retrieve them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index c472e13fceca4eb882a59af3be9f45022a923ead..582542c16f6c0ddd8e6fef3ef6b301ef33c5abd0 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -409,7 +409,33 @@ &sdhc_1 {
 	no-sdio;
 	no-sd;
 
+	#address-cells = <1>;
+	#size-cells = <0>;
+
 	status = "okay";
+
+	card@0 {
+		compatible = "mmc-card";
+		reg = <0>;
+
+		partitions-boot1 {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			wifi_mac_addr: mac-addr@4400 {
+				compatible = "mac-base";
+				reg = <0x4400 0x6>;
+				#nvmem-cell-cells = <1>;
+			};
+
+			bd_addr: bd-addr@5400 {
+				compatible = "mac-base";
+				reg = <0x5400 0x6>;
+				#nvmem-cell-cells = <1>;
+			};
+		};
+	};
 };
 
 &spi5 {
@@ -512,6 +538,9 @@ bluetooth {
 		vddch0-supply = <&pm4125_l22>;
 		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
 		max-speed = <3000000>;
+
+		nvmem-cells = <&bd_addr 0>;
+		nvmem-cell-names = "local-bd-address";
 	};
 };
 
@@ -557,6 +586,9 @@ &wifi {
 	qcom,ath10k-calibration-variant = "ArduinoImola";
 	firmware-name = "qcm2290";
 
+	nvmem-cells = <&wifi_mac_addr 0>;
+	nvmem-cell-names = "mac-address";
+
 	status = "okay";
 };
 

-- 
2.34.1


