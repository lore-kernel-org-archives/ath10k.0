Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C177EE57C2
	for <ath10k@archiver.kernel.org>; Tue, 30 Dec 2025 23:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nyMn1t1Y4sxs8foeNzDrA8wjI1gX3B3sgRPx84ReXk=; b=vhkLRFsTFaUoMCRXUTtNiqaFvN
	RZ/WlilgquEJe8dNpc9XQcXlC6+XLZGvd6+r9CMk1TVrPPqPY4r7MHJkotEzeY8aCU0o9A392vZ6Q
	eJa9+4JC4xcLpYORrP28HpY6CvZh2EZ1ua/+6yPgh9yJyDvIs/E71Rla356fry4uHeIaXpayz1EWq
	BA8mv9oo1mEOSyz6QNwXXgvtEKw8+nMp4u3Rmj78bW+xIRwpYWiPmrLu/AALnqFHhYV7Jr6hWXbxS
	VJxTc5/Jefcx4+A0GMp0pkk2py22D6Eqm1r2XrCGdk9p3kQ8H1/dmho1IoaNfdDKaVFi1KH5cvGpj
	3DMwrvxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGK-00000005SAO-36DO;
	Tue, 30 Dec 2025 23:36:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGH-00000005S2c-1ynA
	for ath10k@lists.infradead.org;
	Tue, 30 Dec 2025 23:36:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUMZXmv2551543
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6nyMn1t1Y4sxs8foeNzDrA8wjI1gX3B3sgRPx84ReXk=; b=OiGDmxlV2tjiUDhe
	L8MxERLL3hL/yukKP5G0D3MSe4wjEPiYiShunx7uXJLkpW1cUslI7OoZMpE0O0tZ
	BRAaX4UCcy9mQCyVW3skcDhJQy187h1yY3q/X8jxC4krjeqdyNQQvb5GjzzCxt3X
	I5BwyIS+6gtProl1j9QD+agQOCpKM0PoqIIlk3PJBJgpdttAtesOo41cYBhSXOW/
	PaqEylB/9mT2/v6niPo2wsItC4PBoGCdPt8yseV5hURzOTSeito5YfZl5rDcrNvt
	rS/oJBODJaO6ImO7nsD5b+F5OkiCrHLloFFVRZGy3ypX6QWZk4UpH/jDYj6urbM1
	AFvx0Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0skk27c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f183e4cc7bso195021831cf.0
        for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 15:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137780; x=1767742580; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nyMn1t1Y4sxs8foeNzDrA8wjI1gX3B3sgRPx84ReXk=;
        b=HqXbr4gwv1jKuRJKBb87j2xDdpfVbUpLy4oHH6htKMljIUSE7Klp2zSf+O3YKqwzkF
         NprAgIt87sl49q4IOjpbgCjslCIOjGXFyQMEVlC6Ar+nvqwS2lDWHrt3Z8sRDGqj7HDh
         hrf6pK0AXs6lyWMTur8p9Xh99Wrccs4o8gAcskDwcZY/LpINEQneTw7IeFhDN6fB8al6
         Fv88HSdlA6apH/sli4K/AyDvGo/9eyS7H+fiM+Y5RnoEN646bus553wpmLLqGuTCAvp+
         UYk+hpv6V+Myw/yVB+Ghvn4ylIpBUuU4BpYyi1cJVXScIY/8zxB3vplpSFZMPi6XAtmC
         bwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137780; x=1767742580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6nyMn1t1Y4sxs8foeNzDrA8wjI1gX3B3sgRPx84ReXk=;
        b=dmD3ajawQILcqv1nixCqAYSO40NGGIZ7ey2jOFC2sP1ou6fJ7fNXHjqqHgF1eo6zM0
         39C+C6GLMXo2Ch5yFH0pgdKnUwQp80/UNzsD5A51GqCdsfr74MseBqONaYglVYPFbvYd
         60TroldR8H4ihKzA6+QYaY5WcuzfCc7DjMkg519kWrhOFfQbxht3LsLeXbwR52ItyPMs
         whDrSSfXAV3dLQeYTjT2jqJSCNiLzrxpdQZ/MwdMNuTyUmokRweGZtQjYKu00XEfhX1I
         gibOqTvyT00cKd6HUCVx4MHR7hJ15Mv0ZXsOMA4/X/V/oNID1EbxXbrAudcx2XDPaOvc
         1pWg==
X-Forwarded-Encrypted: i=1; AJvYcCUzlorzAMt0ApMpx+DkdYSLP/G6y0pdXdo2ntxd7wZtUcCeKe9wsNlDZ57ciNJX/PB2j+KGmRI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEiQOUwZYLVt4SgcBMbunbv8PzuORX5IDeEMXtC/Q/NAXxInE+
	QD71MyZ2MpawF5f0FOdKN57biqY0bApdq+FpNB+2+lqM2nb84yyzqkNefZIQPUR2Cj5ZgtjWEj6
	Avmk2N7g8z+jVzBuwEzmctWhtP8p2bOSOyBnJeDkNVFoERPSKvJaS2nSL2BvnYQkk
X-Gm-Gg: AY/fxX4Qrt7vt1RyJmlr2XeS/n4sw+pvDH4oA9CPEvEyLJXxOZ8qiWMn+7/AyN465wC
	0tngieUXEj+0CxXxkqjzzntfFF0iMjqNkbWT8Mpf0Yg91t1w11/jLzj6kmsOXt9yFrcPnz3iVkH
	EL/pSiDEBoGAQz+A/bT88MN8Rc0OjyEMC7aP550ajak/sxrclnkxlm9hJRHW2It+B0EZfiLRQrV
	gsitF78qfmSJhmjxsH8pHI7Cr8lCdMMwOeQvCNE0dyFJTd1D578Djje+nSfLehGnAO7A/3RSI0d
	wEJ3sez1zL41Le1RwEqti3X59dfB+WjVFO1IdF8TBMcgvWvGikRIDTo4C6feCABkNYMkI6+3JBc
	LaSdSgBcjnQuxTZbxOXZZqhD48zzXv6NKm+mffemU01FRvQoaZm5TbKJiYVGQim0s1adCYwEDxs
	k5dsxAU6ozMlw8Fa79LlB5WLk=
X-Received: by 2002:a05:622a:5985:b0:4ec:f791:738f with SMTP id d75a77b69052e-4f4abd753b4mr496100031cf.49.1767137779935;
        Tue, 30 Dec 2025 15:36:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnKOZyeFtAgzQwkf1IH0VQkWAyjQ3jiu/gxGz7mjyXUaQfJ69jiH+MtKxkffEKCn6Vhg4YMQ==
X-Received: by 2002:a05:622a:5985:b0:4ec:f791:738f with SMTP id d75a77b69052e-4f4abd753b4mr496099691cf.49.1767137779523;
        Tue, 30 Dec 2025 15:36:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:36:00 +0200
Subject: [PATCH 10/14] arm64: dts: qcom: qrb2210-rb1: describe WiFi/BT
 properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-10-1ff4d6028ad5@oss.qualcomm.com>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
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
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2604;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qL2gflnvdXT8Zbuzd5RGVdiolocJMGlxF5D7JlkGAxs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpVGHl1eArCTGYcdLB/w99f7QscISxVzq61zkxb
 TDUbk1iPmKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVRh5QAKCRCLPIo+Aiko
 1ajxB/9mlVj65pIRt3vIVHArpezX02P5FeMTN2z9Q/aE0QAW7jBIc2fPMZO4rTFc1MEG2f7ziHv
 CbIlbTiEXQugG2FXreSW0nCtkTYM4YlMp9FDTIGeAodRYOo3ljK3Scb3961fEvRhkdGIVFIvDOT
 7GpzzfyjWOv6WQ40TLbZIQj7IlT3b9zXGU+N5+4tH0Sn9V0U+ZKxqBQKnyPpOfZD+csJ+XkMOfw
 PLXkZTGE5WcGZHFM5LDry9IWU3uJSgjTuRPUGdSg53rMMnptXcuA+Ih8mrUyAHcBzZv6vMJh+MI
 ep6tyvA4bXNcK1zJ+bXzDrXxwthkK+kt2OlokoJ9Yjyk1oWd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfX2QyIwX3xY9Gz
 +RZAOPBrTsW6ZRNOWFs8UYsnMyt6Z0jfa2k4YLjmKG/4yxsGdhC9kgnTUMoUTsIrKQ10Jvsmh8h
 WulIDe8twFoyy7l8J9m3ZEX9t2BGxjrvlOuGe2y/flzupg8NXON5xCYJDkuXERApPOoWFCnOhG2
 BjYGIS8Ij3psPPHkm4Iig0bnOGO1Eg2UPtqE9ojmZDA2PIdAtXntlQXlFneqaccB7f6lvU0R+xV
 BWYfSfRv0iFFjlNQcsYJQ872YkvF4+2KiUQoP6QBw2+a+yWKtSCWMx9CsaUc8m7SfxsiEB3KkQJ
 KfIRtotpi2OdbXVr8IFJ2E4zjpPT6o03Idp5G+v5VcacHCQxitK8okpf09d+bKzRlly+yLrZaLn
 VQZ6vd8nu78DKzp9kK/oAELEbVO89Dvo4spDzJMZ6vLkExR+uJWU51Ikquut2vqMSRhMo8IYuVB
 as/Ixzp9g73QIjBZeAw==
X-Proofpoint-ORIG-GUID: P5Guo4feQvlU7egUAVnOzZd9pWy7HM-4
X-Proofpoint-GUID: P5Guo4feQvlU7egUAVnOzZd9pWy7HM-4
X-Authority-Analysis: v=2.4 cv=FJ0WBuos c=1 sm=1 tr=0 ts=695461f4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=e0lpCu-zAayEtEefm0IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_153621_727550_0396CB20 
X-CRM114-Status: GOOD (  13.81  )
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

The onboard WiFi / BT device, WCN3950, has a simple on-chip PMU, which
further spreads generated voltage. Describe the PMU in the device tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 60 +++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 1b9ca957a94b..4501bc34357b 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -235,6 +235,42 @@ platform {
 			};
 		};
 	};
+
+	wcn3950-pmu {
+		compatible = "qcom,wcn3950-pmu";
+
+		pinctrl-0 = <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		vddio-supply = <&pm4125_l15>;
+		vddxo-supply = <&pm4125_l13>;
+		vddrfa1p3-supply = <&pm4125_l10>;
+		vddch0-supply = <&pm4125_l22>;
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
 
 &cpu_pd0 {
@@ -679,6 +715,12 @@ lt9611_irq_pin: lt9611-irq-state {
 		bias-disable;
 	};
 
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio87";
+		function = "gpio";
+		bias-pull-down;
+	};
+
 	sd_det_in_on: sd-det-in-on-state {
 		pins = "gpio88";
 		function = "gpio";
@@ -714,11 +756,10 @@ &uart3 {
 	bluetooth {
 		compatible = "qcom,wcn3950-bt";
 
-		vddio-supply = <&pm4125_l15>;
-		vddxo-supply = <&pm4125_l13>;
-		vddrf-supply = <&pm4125_l10>;
-		vddch0-supply = <&pm4125_l22>;
-		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
 		max-speed = <3200000>;
 	};
 };
@@ -759,10 +800,13 @@ &venus {
 };
 
 &wifi {
+	/* SoC */
 	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
-	vdd-1.8-xo-supply = <&pm4125_l13>;
-	vdd-1.3-rfa-supply = <&pm4125_l10>;
-	vdd-3.3-ch0-supply = <&pm4125_l22>;
+
+	/* WiFi / BT PMU */
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
 	qcom,calibration-variant = "Thundercomm_RB1";
 	firmware-name = "qcm2290";
 	status = "okay";

-- 
2.47.3


