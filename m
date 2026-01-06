Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBA5CD042A
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 01:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JO4Pi21OVHijpMNbTgyCYWdKmobPiE/rHbiYvQZIfKM=; b=dQWVPneBL7IpnFQm6PGcZJEosw
	X4fMRnO4sW8aQlNr3U0wev1kY7Oj5OpD9BXRK0Z0jBS9TY1VZXocaHYLH4zoiluFca+GGt9cmqN9+
	kisEWbsZI/edQo2QlJrkPGcSBaq9lNO4XPetgo2uefIr0BL3qJU/lwRsNzrXdbhGc2+TGJm6v2zm4
	Lf2oK+iyRQGx3xWh9RyvQp3uL3rC/6+12PuYy9+vKoB4otn403N6Tz3hkS5u0l/jQ8BK+mPa8wWDA
	HE3yA26ooLrYlalTSpeOijWpTWoSZWKuhPQyPjeyJhHdV51BY4AdnwRJus6v6njxv//lYrS0QE++e
	2t8+zK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvSe-0000000CI4v-0dTf;
	Tue, 06 Jan 2026 01:02:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvSL-0000000CHwJ-1dRG
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 01:02:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nbiG2746344
	for <ath10k@lists.infradead.org>; Tue, 6 Jan 2026 01:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JO4Pi21OVHijpMNbTgyCYWdKmobPiE/rHbiYvQZIfKM=; b=LNjFSgZub+8hN4ZM
	oZBHpZYo/6RJPJ634S+7e7ATt1GUBrOKOkAQ1dp9D1+tSSMGs3lbJfsd1W+w1uwj
	g9c8IyKAL2zU/zPkzbcKxNHf7xOztIerRw2FIz3WjCh4/tpMHIHLI15OcQtsjzDP
	k/nhrq6vObV8Mhy7C0lZ+mFrdOO0u/6wgmjAMZmZbS4tHrIBtSCdqjlqxvq6ExT8
	8mJF20NydW3iE3klTokDZUWqoHfpE1jHJnP0rPpXnqp2sD11mX2KFLvUyEAlPZzb
	c/zhj7+K0auhBmBZY+LrcGYv3ypdGKqYOC/gHi9oMflOwTE5ApOccCEWVdvmILzA
	69T/jA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgg9yschy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 01:01:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee09211413so12108741cf.2
        for <ath10k@lists.infradead.org>; Mon, 05 Jan 2026 17:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661311; x=1768266111; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JO4Pi21OVHijpMNbTgyCYWdKmobPiE/rHbiYvQZIfKM=;
        b=cyQeG09Wj/NeezByiVIsfDBynZ4OnRaJyx4c+I+Qz0fcSDkGRkEvCn7Du48AFoTFGr
         lVnXGhYT0LVRL5CnEOGCqZfJmSzspLUloBdAZVq6hIOcIt+xKjMUImd+QcTRlq9KXqE/
         bBewtWecHQYqTxPyl74t2VdPTgN8BD4RRtz7rgkY2BDqEgoLjaIco7kGskqp6REVATXt
         C8g8RfBa7U2dkFYCO1KhtGArKyF68YviQOIhLNyiiST7RY35sbBOy/+h3Ydv4S58xUty
         VOTziH1FDdTyFSjbQ8lxuMpKWZgJjkT/mBOHzVDi9B3kH76mKzs4OOrlyjoXub3uMf24
         BhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661311; x=1768266111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JO4Pi21OVHijpMNbTgyCYWdKmobPiE/rHbiYvQZIfKM=;
        b=tQHM8vwn76FJCIvvJP03z0X/ec40CoeIl2iKMKnJTJHLsKVY7mOpwmmnFSyqRSJ3Rc
         0v74pjsQ2IkPYHvpY9KCoxtmUht3xBzks3OyWZrOO27V69z2HyLOBEow2I6IpIZXvTEb
         lXlx9GP45RX+3F7sE3e8iQ4ZHTa94ZzZwWEXQpphMGGnV8uMKzttslxUD7H5/0K2bCyU
         HTnhupnUo8OFLgauEBwVrq/TwAYGN4QTBuOwr/FQPwByPdWM7/kJAELl7sqY38uGTonm
         Ve+IB01aGhdVv0iorr98N9VgolkX9kCDFxyJAMlSgi3SpgbqZrErxx2zzBcmYfnqWt12
         l2+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXj+47yZPw9j6uBOHYLIl+FWrYOZWHVqpNgVIElhdb2cCjYcF3+7c/HvGXr4Dv1yZ/78uZ+KDY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzL+4ulrTva4tLOg68tC0H04u8UzZtEEF2IUoaNuGDvM16ao0Ac
	vTPxRbKRXHEt/QP+GsCAW/vP8MSgk7Grg+8Bod4SfwfhWM+mjiF4S8NJs4cK3cO8t9EcBVzuteR
	xgbI8Nz4Gdjso2GNKWmdp1uVJegc8FOdsV58c6mTn4s5T2G9ZWsSb5j/8yVuMbVwP
X-Gm-Gg: AY/fxX6pj60GXcW7+LK2FU1SnaDYM8v39NAPjnebEzSy47ancjQhsOx8D8HxkA1wtYl
	O4YOHc9yXlcPT1TO9RhmEsQReVimiGoZLhZybu9D5GHSQVur5kBsEGZq/gsmO7hhBoB8IihZ2ja
	9qbzzQ4sjUgur4Q6ue1hNOZT0plCNtepHw0IJjRpOGSciRSoK1/mN3gYVQ30ftAdP7p6chdfvFj
	Ex3kEqMDRiVoOYA/zU8ZLGazDq2CiS4hCzzYjapa1OB29DVYoiXPrlxe8ZxSvH1vPYtFyaxwPO0
	5eDDk8q8V/pEEdi59wEZwvRz4yhlUHlFnvLYeZuNyHRsNWp5/GxPDQSqkhvTHMnDxh4IxKzrByR
	FT6AEDyrRcL3rZ1UYzPbn/bXoGrfvuQqZtsZv18SPl49hQ1V90P4K/zLOb9uqJvaDXxIfwlg7ki
	njTrwAFIkOoe2VyoDfys3wIGs=
X-Received: by 2002:a05:622a:1b0e:b0:4f1:bdb1:eac7 with SMTP id d75a77b69052e-4ffa77d90b5mr19653311cf.55.1767661311315;
        Mon, 05 Jan 2026 17:01:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2rfvBff9pcaENAxSLwBaEsGSjWXENSQaskdKeKTaq/4/BVsPJY11d5lKCuvFHjQ51JK1SUw==
X-Received: by 2002:a05:622a:1b0e:b0:4f1:bdb1:eac7 with SMTP id d75a77b69052e-4ffa77d90b5mr19652881cf.55.1767661310654;
        Mon, 05 Jan 2026 17:01:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 03:01:24 +0200
Subject: [PATCH v2 14/14] arm64: dts: qcom: sm8150-hdk: describe WiFi/BT
 properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-wcn3990-pwrctl-v2-14-0386204328be@oss.qualcomm.com>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
In-Reply-To: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5744;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=q9y+Dif9HlWdcnmMDM5hAVRBaWF08BPAccXmvU/QVEU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXF7a6K+/f+otdXC4XFp/otfrE7F6zDF5dXqGY
 p3jobuYaHqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVxe2gAKCRCLPIo+Aiko
 1bHJCACjyBHBDSElbc7bbb1YtK2V27VbPAlZja5rFSb4UmSUGf4P+/bMIGmkzvWg7VhiwA4AfuW
 zWuGcoDN0a+9YDfIDmOt+OJ3lSpRGzwVdeGlD0lHMm+Mlj//6KiMwpznilDD/vT8m3FsZ6+G0re
 y3KdWUNWmSrYVVFmZecqidWodYLjSVCqbiOW4PDhYRkzQowyaqvQIvDwBKYCgeDY1tm/ml1mk/I
 93200dHSJdLCidy+XZhi1tNb5DmG5avsiEnsfzMenn7iAR6PfbTg4CIRw71XFqvzzLb/CYWv/iZ
 VnLE/yCXgdBZaZVJU5gkoMhco6O2jM3H/uT41/Sk8jpCgx6B
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=M89A6iws c=1 sm=1 tr=0 ts=695c5f00 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=daeKR1c1ZtUuBhPExssA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfX1GDRm5VN4wUy
 RXHlKjTfr/hL8ZWnBc6bQ5UbaIlfFRLZfKZRcBnHJrsEivWsH1NAdY45rOqH2kxgpDTcjEP28SF
 AlBd8Lt1uOwArG0JijPGUYew89tic48e8PdfZLO955dgpvo8GB0FOG195ID83DbfXQ1ZGqbG08K
 dmuwBChoRFSl4TPbZaUMQQHDYTvpC7nz2Rql1AlV4iQlv79D5WaSVeWuBUpwAr0JX0R4n1qFdhY
 R025xUg5LuWtxhz2BcRXSBHn2JwomKFbQs3uYLu6QhjtefkzT5/p8AJiXgvEdwBYNkzkfQeYa7t
 Fm2Vn6eI93lf/+A2tDa1HSJPkIeGckFvSuBjsub5yLhy1kQSRmzlZUar3ZEoGG/D/+zdDVU+DPr
 OXqiKrGBe59dCBEHP9kCBa8hafSRyO2F7WpFsvpd97BhnUfXlU5nlzEoXrO+ctI0oO4S5PVpye6
 OxNt2PuxKvPBxK+JJWw==
X-Proofpoint-ORIG-GUID: n9XtfIQ0ogYIPNQa87vYyhBRvUelz6QC
X-Proofpoint-GUID: n9XtfIQ0ogYIPNQa87vYyhBRvUelz6QC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_170154_166496_6F19025F 
X-CRM114-Status: GOOD (  14.89  )
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

Properly describe the PMU present as a part of the onboard WCN3998
WiFi/BT chip. Enable Bluetooth part of the chip too.

[    5.479978] Bluetooth: hci0: setting up wcn399x
[    5.633763] Bluetooth: hci0: QCA Product ID   :0x0000000a
[    5.645350] Bluetooth: hci0: QCA SOC Version  :0x40010224
[    5.650906] Bluetooth: hci0: QCA ROM Version  :0x00001001
[    5.665173] Bluetooth: hci0: QCA Patch Version:0x00006699
[    5.679356] Bluetooth: hci0: QCA controller version 0x02241001
[    5.691109] Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
[    6.680102] Bluetooth: hci0: QCA Downloading qca/crnv21.bin
[    6.842948] Bluetooth: hci0: QCA setup on UART is completed

[   81.510709] ath10k_snoc 18800000.wifi: qmi chip_id 0x30224 chip_family 0x4001 board_id 0x55 soc_id 0x40060000
[   81.521713] ath10k_snoc 18800000.wifi: qmi fw_version 0x32040163 fw_build_timestamp 2019-10-08 05:42 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.0-00355-QCAHLSWMTPLZ-1
[   81.554143] ath10k_snoc 18800000.wifi: failed to fetch board data for bus=snoc,qmi-board-id=55,qmi-chip-id=30224,variant=Qualcomm_sm8150hdk from ath10k/WCN3990/hw1.0/board-2.bin
[   85.467464] ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
[   85.478132] ath10k_snoc 18800000.wifi: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[   85.487223] ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
[   85.758168] ath10k_snoc 18800000.wifi: htt-ver 3.73 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
[   85.901630] ath10k_snoc 18800000.wifi: invalid MAC address; choosing random

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 141 ++++++++++++++++++++++++++++++--
 1 file changed, 136 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 1eea9c5c6684..6ae6e07c37df 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -20,6 +20,7 @@ / {
 
 	aliases {
 		serial0 = &uart2;
+		serial1 = &uart13;
 	};
 
 	chosen {
@@ -66,6 +67,43 @@ hdmi_con: endpoint {
 			};
 		};
 	};
+
+	wcn3998-pmu {
+		compatible = "qcom,wcn3998-pmu";
+
+		pinctrl-0 = <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l2c_1p3>;
+		vddch0-supply = <&vreg_l11c_3p3>;
+		vddch1-supply = <&vreg_l10c_3p3>;
+
+		swctrl-gpios = <&tlmm 50 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_io: ldo0 {
+				regulator-name = "vreg_pmu_io";
+			};
+
+			vreg_pmu_xo: ldo1 {
+				regulator-name = "vreg_pmu_xo";
+			};
+
+			vreg_pmu_rf: ldo2 {
+				regulator-name = "vreg_pmu_rf";
+			};
+
+			vreg_pmu_ch0: ldo3 {
+				regulator-name = "vreg_pmu_ch0";
+			};
+
+			vreg_pmu_ch1: ldo4 {
+				regulator-name = "vreg_pmu_ch1";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -598,6 +636,10 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	status = "okay";
 
@@ -630,12 +672,97 @@ lt9611_irq_pin: lt9611-irq-state {
 		bias-disable;
 	};
 
+	qup_uart13_default: qup-uart13-default-state {
+		cts-pins {
+			pins = "gpio43";
+			function = "qup13";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+
+		rts-pins {
+			pins = "gpio44";
+			function = "qup13";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		tx-pins {
+			pins = "gpio45";
+			function = "qup13";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		rx-pins {
+			pins = "gpio46";
+			function = "qup13";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	qup_uart13_sleep: qup-uart13-sleep-state {
+		cts-pins {
+			pins = "gpio43";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+
+		rts-pins {
+			pins = "gpio44";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		tx-pins {
+			pins = "gpio45";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		rx-pins {
+			pins = "gpio46";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio50";
+		function = "gpio";
+		bias-pull-down;
+	};
 };
 
 &uart2 {
 	status = "okay";
 };
 
+&uart13 {
+	/delete-property/ interrupts;
+	interrupts-extended = <&intc GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>,
+			      <&tlmm 46 IRQ_TYPE_EDGE_FALLING>;
+	pinctrl-0 = <&qup_uart13_default>;
+	pinctrl-1 = <&qup_uart13_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3998-bt";
+
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
+	};
+};
+
 &ufs_mem_hc {
 	status = "okay";
 
@@ -709,12 +836,16 @@ &usb_2_dwc3 {
 };
 
 &wifi {
-	status = "okay";
-
+	/* SoC */
 	vdd-0.8-cx-mx-supply = <&vreg_l1a_0p75>;
-	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
-	vdd-1.3-rfa-supply = <&vreg_l2c_1p3>;
-	vdd-3.3-ch0-supply = <&vreg_l11c_3p3>;
+
+	/* WiFi / BT PMU */
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
+	vdd-3.3-ch1-supply = <&vreg_pmu_ch1>;
 
 	qcom,calibration-variant = "Qualcomm_sm8150hdk";
+
+	status = "okay";
 };

-- 
2.47.3


