Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41F2D29C4C
	for <ath10k@archiver.kernel.org>; Mon, 19 Jan 2026 17:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmEQ3DAdF2+6Wtmoo2Iw3yD7uj2xcoU63T9J/0jkrG4=; b=KYfnyCtsV21Dc4+aOIFmYGROAy
	3tY/gWYA45l3uGYkl9VC0UX8laMmXuKjEsqHjNzGHDxzkkW4j75qCI4uwuH/Ll+Qp2j4NFc35xjxG
	F2pL5aX/4Surd11I48S9AWMYk6gyLlb/KdXGsqKr7T92Ozvqe60cusLAToLGr3YR9bQU5+Wtjl3aq
	dxNW8qooIyT1CYRScEDQWRqIMPFkvhELbzQOjbV/EuPWZUpkxH/vaOOAx3KEuEWRxi176wfBrh8Hb
	FP98p3TKcP9XR/IB2ndPg589YvtOlqqsVQau3X8CF7+MqxMcUT6YEYgKRCVkhloCQuOjvyZNZ7g2I
	vQ+N1+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsjh-00000002asE-2dxO;
	Mon, 19 Jan 2026 17:08:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsje-00000002ao0-233l
	for ath10k@lists.infradead.org;
	Mon, 19 Jan 2026 17:08:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JGp4Fr774182
	for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 17:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VmEQ3DAdF2+6Wtmoo2Iw3yD7uj2xcoU63T9J/0jkrG4=; b=Kph8csSJPlcKZ5N3
	ooFTfL0fx/z0wo7ILoe2D+DwRZjo7AqMAMC1gXcr2GXZrycgehJmO/NyiQ6C5b3/
	BvIHH6o4zfZyHmPFnPGQr05JN7tVNdpP/B/kZEEwYwHlUQfLXvvI/Jyu2n4xlaDr
	8gVuvRa3co46R6gW2FSgQgOnKf4/tVvVsE791G7mKykgVBeew6psxewNGpTmdxbG
	QpWPJvpioVQwc7D6ufY2cUDa2nsbjWOSAHvxKCtvPt5IPVjAr12puDq6EWE2CCPX
	4zmYKLySiEBRWmfSkF3973G6wd+THbsl24sl1GFBRPmWeRG3oBtMQv8BjUNlAezJ
	88XlXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsj9a9a6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 17:08:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52d3be24cso568022885a.0
        for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 09:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768842493; x=1769447293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmEQ3DAdF2+6Wtmoo2Iw3yD7uj2xcoU63T9J/0jkrG4=;
        b=XyHQROMNZ2p3UFSeTMWlY7uHHyDsEOCFm+nNygpMqUWHOozu2jFmHgeZGVUgL8qAPD
         n0NOdZ1bxfGoLRCUoyTqaJXt9PTjaOxSM/+TBKrUzseSY6uwLCYyUzV0vJ+InnbzuCkn
         9V2tQigUVkht6s8dDMvYLe3EK/pAei2z8v1KMW/qRQ3Z3YZkRR75C7rmzE5T2a8g/tS4
         KZtQ5DK51LqaTQb/U189b7jfehesjLKji03mbWHDbgow8djDXMcltP2Gk4KvQQMOVTAF
         B/GBa73aMueU8FJKu/Rsx97mfT/+L+ctuH+yc4nxqqY4GCPiuHwFtMv8vGmmlEUZ6lLh
         jKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768842493; x=1769447293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VmEQ3DAdF2+6Wtmoo2Iw3yD7uj2xcoU63T9J/0jkrG4=;
        b=bWR1eh3xfiNjiS+MxRfuytcEIZ8GMiGqeG8Krs/6pqB7PEl8zv7DDBWBOua9EzozKl
         qNN+IH8RFR0vZKJNq5wfdNsfuWSzrGBeINmApwRzPfmNGrYQipr2lVU5h5Z+ntUxvXct
         pVPzmw6VZrGz3URAS/Ohx9aOaEPQ6IguO9IpdimeRPMV9UVm9Fk9OwNOAZH1feJRgj02
         GrEcQPhQ9Pgx/iTZmxDSuX3cZkgLitHf6k1FxOv7g4/R5S+25Yk5h9WJMTCPm/gJteSG
         9GgB6jhhI6cseWMJJR0T6Y5QLkP5fR9QGN8D0XO2xObX7PzE3FuFAyoSx35rOBgkD5km
         osqw==
X-Forwarded-Encrypted: i=1; AJvYcCUeuNbDRA30LCCAA4vShI/MmVjs9socBtfGzG2g5owCuR4Y3BXAC5LAcJBnqPrm74+xQXYrRss=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZfHXxUsrbvVfSZowjjNiZTDAuP3bnsfyQlujGlPoPEXRsv+DE
	eqONl09+6EoGOhXE9IbjwK8RcMF7ta9a3+Llb/ptxm1UkzUT+Cj1hAQDDwhmgANSWf5q5zk6kac
	6Ut+su/hhgVRwOe9u2WoAPMqE3LCQR+cbWBKAzk9pwVzPNTmarOuo6eaevCUv2LHE
X-Gm-Gg: AY/fxX6JHLUplBN/4E/T1KOi/L6DVm2tdwdaqFD+ktgLpC2EBXYIG3KHG0jBgbhluDX
	KkKAE9JGHTAg+LS5gh8W7XvejRVFiayTIlEwu91VbT4/PCmyyLJlCP9FfJJHL7mzzojqTNQy0FR
	+dMsw7EfrEmXFfLyk47yiicas2EBz7U1C0J31DSW99GZA0Z1z7oH1AX3hYb0WnLLfanEF2cR4Tw
	GLci63xxDrOPV1TDdUnke0v8CjzVeE7fULsPgISj+2Nl7r6OwLAJ3APwthGyNyG4fdBmEixXOLp
	TqTdx3n8Zs4xuoRP4a9719krQIIwGkZAeHGTL7cq61GEyzxRjAAUK/ipw3VJ0VswmoenVEpFZLp
	dc51oWViHsUmaUZohMitOwdctI0js9rIC0lGByYbRlneEaX7b5qSnD1zjc/XWpi0eavA0FuYm5h
	lk3pxSUj+raZ2hAK8HWmtumSg=
X-Received: by 2002:a05:620a:6ccc:b0:8b2:5fa9:5c with SMTP id af79cd13be357-8c6a67c6230mr1583280885a.83.1768842492653;
        Mon, 19 Jan 2026 09:08:12 -0800 (PST)
X-Received: by 2002:a05:620a:6ccc:b0:8b2:5fa9:5c with SMTP id af79cd13be357-8c6a67c6230mr1583272585a.83.1768842491943;
        Mon, 19 Jan 2026 09:08:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790a9sm32661211fa.26.2026.01.19.09.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:08:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 19:07:59 +0200
Subject: [PATCH v3 5/8] arm64: dts: qcom: qrb4210-rb2: describe WiFi/BT
 properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-wcn3990-pwrctl-v3-5-948df19f5ec2@oss.qualcomm.com>
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
In-Reply-To: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JW2e3YORx1IvzyXTcxL1ItlNpE70OGRvUy5PXPZhVzQ=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBpbmTujVPIgEjXA8JnEOGDYcJirzEksl0B9Mua1
 l1mjfNi6zCJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW5k7gAKCRCLPIo+Aiko
 1UdOB/jyDd6V6C+z/elupzbVyBfZxyDWZuxMYSOT2VsBx2fd58Sxzk6ZO53Jte31TW/VqyR/G/E
 lQsewtI/4wZDG3xjBTHmS3FyaJdD52ySSz3gCSwTtdPmeKTvlQo6hSNfNOqAlT7r99TDYU/u9q2
 gtGXJIwVyMauamHvXspTNafx8ZMhBgExY/us5hxoE34Tlnhz5FiBUCnb9kYPhUfAmex0wH7ipYt
 LnD69aC8TOk0WW4XE85nU+ct4e5tW7hQy51yLSeoDX8fONsuenMGRgwUowVSgbqK8Lpjv9S191h
 S7O0Jm8c3gyJoiUVIDvhPwHjjRL1apRZyyORQGxGOY0Nc/8=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: SEG4x7auKlnfvisu20tIPc_IQCKzM2dz
X-Authority-Analysis: v=2.4 cv=N40k1m9B c=1 sm=1 tr=0 ts=696e64fd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ib3hs3rZ3KeRbPluJGkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE0MyBTYWx0ZWRfX1lwbwdZWHac1
 Mx9Wkc8Nbghrl2v/42sOwu+DPi+uwlesoR8sMFLGSKB4TB7wRlLEAgLCA/MtG3L44b1bVrdGC4a
 8mxOhjCOPWeuRDdtg3VKyIhu4Jq8fh1CIxWl/Xh1OXCtYkMWStgr+N7z585maC6bGBSkHK/2u7q
 /RkuREb4QAejWCb4kRjVEXqaiILg/FbWlNK92VxF6Xib+Xt8oZM/zH6Pj8tgN/PnI0HUgjDJDD4
 AXe6TRL/vt9KyRX0RcKgHycpoAR4ycV/YhfCP2oeveMHMGzM1QzEvfd17whmYoRAg+SzryH7X90
 UxWrj/c1597SAZVo7WNHSlGpNMg60CxI2qoZ+N2GDLB1QIJKlhlLGIa6xcc0BbAiMjVa6YTu306
 lzkdmhjjU8JvV6rnYFqn7XjkLVKAK3RXKw72fM7pTPx7dMUg7n2vaysX2i91/m2HlaWdBjXCGhN
 enGZvc1DeQokEGqk+Xg==
X-Proofpoint-GUID: SEG4x7auKlnfvisu20tIPc_IQCKzM2dz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_090814_593894_0A32FC42 
X-CRM114-Status: GOOD (  14.38  )
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

The onboard WiFi / BT device, WCN3988, has a simple on-chip PMU, which
further spreads generated voltage. Describe the PMU in the device tree.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 60 +++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 5f8613150bdd..5ddf448bed8a 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -237,6 +237,42 @@ vph_pwr: regulator-vph-pwr {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	wcn3988-pmu {
+		compatible = "qcom,wcn3988-pmu";
+
+		pinctrl-0 = <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		vddio-supply = <&vreg_l9a_1p8>;
+		vddxo-supply = <&vreg_l16a_1p3>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l23a_3p3>;
+
+		swctrl-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
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
 
 &gpi_dma0 {
@@ -684,6 +720,12 @@ lt9611_irq_pin: lt9611-irq-state {
 		bias-disable;
 	};
 
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio87";
+		function = "gpio";
+		bias-pull-down;
+	};
+
 	sdc2_card_det_n: sd-card-det-n-state {
 		pins = "gpio88";
 		function = "gpio";
@@ -703,11 +745,10 @@ &uart3 {
 	bluetooth {
 		compatible = "qcom,wcn3988-bt";
 
-		vddio-supply = <&vreg_l9a_1p8>;
-		vddxo-supply = <&vreg_l16a_1p3>;
-		vddrf-supply = <&vreg_l17a_1p3>;
-		vddch0-supply = <&vreg_l23a_3p3>;
-		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
 		max-speed = <3200000>;
 	};
 };
@@ -744,10 +785,13 @@ &usb_qmpphy_out {
 };
 
 &wifi {
+	/* SoC */
 	vdd-0.8-cx-mx-supply = <&vreg_l8a_0p664>;
-	vdd-1.8-xo-supply = <&vreg_l16a_1p3>;
-	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
-	vdd-3.3-ch0-supply = <&vreg_l23a_3p3>;
+
+	/* WiFi / BT PMU */
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
 	qcom,calibration-variant = "Thundercomm_RB2";
 	firmware-name = "qrb4210";
 

-- 
2.47.3


