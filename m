Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5D0EE57C2
	for <ath10k@archiver.kernel.org>; Tue, 30 Dec 2025 23:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXbs7DTtJpHSfn5vW2Prly0waEmm7i+yQR+ng+cWcuQ=; b=Aas6Qc6zRWoE5cOhg6i2fDMu2O
	xqfYgDwNuJiOH61Bt6COYuWsKwPsCKoMjpQaApdbF054dhNOgcjyaky3y+z6Svfj33NdjNah3J9DJ
	smPzHAKiMmRTEbcpsGenhxX59ZRSNOU7NCRoiTUH6LPkAYX01288z19LMRdwoCql532rr95D2V0qI
	mf/ur1V/ksdsM6dHhJUFYJvXpP/GTXs9busKbd2BS0N1q0UZVUSF8XSMQBPocLZ0Qu0PZp14jJ3AK
	rmez6iFnjumc4gZd5mOSEihMVcqtmges0vZVND8UdDZXgAqdtLaooFC3uQXyt5wr7c4w82c09bHEw
	qBWX4cZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGP-00000005SHk-0ZyD;
	Tue, 30 Dec 2025 23:36:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGL-00000005S9k-0ZOv
	for ath10k@lists.infradead.org;
	Tue, 30 Dec 2025 23:36:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUCtXVR714846
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xXbs7DTtJpHSfn5vW2Prly0waEmm7i+yQR+ng+cWcuQ=; b=RmCuZ46Wtvxb5Jas
	PG33QwpSsYmvl5FrTf4mNQmjVYcy0c9+0qPP4IuXcmmjsW/4nfFH6RZqAsw++x5C
	2pr9CPiJ6Ai77QJypILRE3ntRQVix7DAhfBr8S9geeKyMSBs7U533tYejFRelcfw
	0Z3mqXrVuofLASkDlrmKbt7TTky2Gon/SBw6qQMf4VXRWE8rcHv3kHmUf3MOMElG
	7rfNpM1TN92Pfz7kG/9X+xrXgjD5/xIEEsBqqEFLex74f9nKGYOdcTBd1VvWnGod
	zE2q9XH2/fpX8i6hdOfXezo5SvLJ9Y+SaUuFMDlU6w4txZ+GVbdHJo9S0Qvsni+z
	sWqubg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcf5ys6g1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6ceab125so274980571cf.1
        for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 15:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137783; x=1767742583; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXbs7DTtJpHSfn5vW2Prly0waEmm7i+yQR+ng+cWcuQ=;
        b=Qsz/ELYVnf/mS5NcZ7g85I+76TTE5+YevXtJIksgWBkNIZappubnaHBG3zhahvYNwB
         jHbfDhAoluKNmSSe2oew0CUWWZdxlZv6FcQ4bGIjq7CzfeCr1keTeCRQf+HQCQHTequp
         y+Y4OcmcIvAqA7Jmloc5D56MVxgASHa/1yhIWR3ywi/DKlLdVgneRvVpkPY/LW6QXTI9
         pVxVqSxEE9GaSiWIv0FE4lewcApjTWNzDF+EVOrWYi2hkUZ5BYMsHrZbHcRkqr++Chwz
         Kl/7Y0wtFPaDJqB4uJz0sQxCRRRhFpp0ZvwvLG/A4C2kU1KA7TZBbjUefDYh+Zv31Nbc
         vx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137783; x=1767742583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xXbs7DTtJpHSfn5vW2Prly0waEmm7i+yQR+ng+cWcuQ=;
        b=XMiucZXGqp1+uqlYmiCvebWZAdvno3aC5D+AIsrY+zN27htuvdzKzjlvSXOObzxFLO
         w8HlsErTSUETPrDx9XzjSp0gNPGUE8Wb5iYWTJz/737AvUOJjxV/96ZH4Z5khal3ANAj
         E0GI5UYJQTmupCVwcSTaVex1MMXOW0B5kCSz3r+gLrJtPunFJTI83FyYiR9JHUw7FN6y
         21SGPBrV265QxckqxHWMnhEFDL3WhyQLmHALpVHxgJc7BmUIZYBJI/RD1deZaVd6QyKz
         QGwkNhonOj/nPXUAoVjLOUXdIwp1Tm8d/1nK+oTkHPMRG6sVq0ZKZw21TFQMYuIkVLDr
         qlnA==
X-Forwarded-Encrypted: i=1; AJvYcCX6hdze8Y62da6JqvlCqqQSqsLsnwJdVH8WfHl/6fSq/d8M4PloKjlcICE8lmDIx7iol02s5Cg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzynwe+mwKygs4DOLmcOY203JwRYLJIBpZ/c4o78NcBaFo3hA65
	pujvgy3MkMh0y2oRfy7NLBAnYm8a4DbhxxMer/Lv4v580WppJNezscaSwBjnzqbhLBjBbylHtIw
	Nkxb/R0kDuRqofWJ5ov282zLdduZsI+nOIFHe4Kg/0a0/y+YyiR+zcBGxv5VxU6LJ
X-Gm-Gg: AY/fxX5AcfhPsDZjtu+GmKtx/B2ulEldKl6DHVRIVLRUHXTeilGY2omqqswYlgk1hTd
	3r4VhKHRjtRswEAW/lBFglp/4QihthUNYAHa8dS4Il+ItNvvq0pjjXHXEIL2cN3uYw0N1JFPjQY
	S4kDEQo096t+bebLkUhRIXdRwODREW+nZUUBb65sICGZsNJsr+lkxU63SXDNyKPccEsNprjHHYn
	9169H1THujkbTf6UER6tfr7ICOrg3EdftdpJwmAoxB6KKHqg9a04DxnFGpr8kyv+T7EsczxBIqU
	KuG5TNgRd1LSQVmOT3hNOJmI+29XrydaQRoy3s5JP/wNeRH11vLQzQjDhBr38hFEDHBDMnMv3GF
	3nVt7Z3Vh4NgWjk3d+tM5xgbdp0ggeyol46v2pWFYQ20H6njlEDmGPBwx3XUGBEbHgDKNcMhyDD
	6DNhULTMAVt9CY++cVx8uzdHo=
X-Received: by 2002:ac8:46c8:0:b0:4f4:c7c0:bd15 with SMTP id d75a77b69052e-4f4c7c0c07bmr350491161cf.12.1767137783385;
        Tue, 30 Dec 2025 15:36:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHgFhlkhyhLFU8i2+WJ6QjjuayQocRBFfLuWGYbFfjr/Q0s6li8Tz2KAy4EkSJhFPlWPtZLQ==
X-Received: by 2002:ac8:46c8:0:b0:4f4:c7c0:bd15 with SMTP id d75a77b69052e-4f4c7c0c07bmr350491011cf.12.1767137782979;
        Tue, 30 Dec 2025 15:36:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:36:03 +0200
Subject: [PATCH 13/14] arm64: dts: qcom: sdm845-db845c: describe WiFi/BT
 properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-13-1ff4d6028ad5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2964;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7LzbTKdhUl2NUOZfkS1Y8NaFZqr1Qnf7aC6QYgqUTZ0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpVGHlt4z1VN+r/pPI6AU/mqS10bThi9Wip+oPh
 anrX43GDfuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVRh5QAKCRCLPIo+Aiko
 1QIqB/4z9CRzsybrVzMYR/eL+ntwoRcXl+n8IfnBasvwWl+nQzvSxZvxfwOTVOQTRK/2Hcio5MZ
 5/AGI44NEDVP5mIa+x09TC055gUH93N1KsQHGabaEW0DdLgDDKAUfv49SCVX06gI9cktKbgEoWo
 3u0jenZpnNQMPpaYo47lgDPuTfUWOnLiB932/LH5CrOG8KM8MgwTi5uGZn9pV+sadu9yBDOAxzT
 3Fjob7IKfw53bUmdEt5kv8IoipTEO4idE7dW9Rrn9xzJt3Crnafuf5SwKgM932Gy2Pts47BSW8n
 pu42ll8LsbXib3RYbHJQ67N3r6wf+9W1t+3vGlEReYye6uXv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfXxl0733Er8SLb
 nUtGAJDnziS8wRHh05WEnJ41R+ZQavic+poDcTpX7z+iwvOXYwScTySMU7UL8RXB7O9kLYWP/nw
 FBrH4r4ZpfOtKt3/lfbAyvEcbe5ZLCKbjbWvD3n7nmq6Ya0KJp9lrxdbKGfvTGPhsm5Bq9lMCLL
 ZkMu9Ay8hYpnXIUY5r03arB2UfCXyL6De77x+yKMNAkjIYp1VXUnMnZNiAc3NoS+6aOl5O7OmlI
 NlsfE3JBMlKN0t7Mj2VHbQrZfMCmt81qxFhkVoblN749c1i9oZCJjduE0oVNDHAt8LPODg56uC5
 nv3pA0g6WXUpClzt3pPOMm4M18wD4waZvNF9TeTDbJxZGBUV5HyrVCic1zrz9QOo4khXF3CZkva
 AIeAJdNmPuF+4r9ZbKxNRPF+qKPmUS8IQ8tMpy9tuJwkRfjhisOtXn9hNaDZ4UbbrNd3ra91Ulk
 VCABe4/qQByrdjXPf5g==
X-Proofpoint-ORIG-GUID: NZxHj35sj-U0h70ptQ671aPy6lMPnNxW
X-Authority-Analysis: v=2.4 cv=KvNAGGWN c=1 sm=1 tr=0 ts=695461f8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=urIVL_JefrS1cr2SfK8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: NZxHj35sj-U0h70ptQ671aPy6lMPnNxW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_153625_331738_E10FFECD 
X-CRM114-Status: GOOD (  13.94  )
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

The onboard WiFi / BT device, WCN3990, has a simple on-chip PMU, which
further spreads generated voltage. Describe the PMU in the device tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 69 +++++++++++++++++++++++++-----
 1 file changed, 59 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 5118b776a9bb..db221d5c770d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -276,6 +276,43 @@ vph_pwr: vph-pwr-regulator {
 
 		vin-supply = <&vbat_som>;
 	};
+
+	wcn3990-pmu {
+		compatible = "qcom,wcn3990-pmu";
+
+		pinctrl-0 = <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrfa1p3-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p3>;
+		vddch1-supply = <&vreg_l23a_3p3>;
+
+		swctrl-gpios = <&pm8998_gpios 3 GPIO_ACTIVE_HIGH>;
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
 
 &adsp_pas {
@@ -659,6 +696,14 @@ cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
 		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
 	};
 
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio3";
+		function = "normal";
+
+		input-enable;
+		bias-pull-down;
+	};
+
 	vol_up_pin_a: vol-up-active-state {
 		pins = "gpio6";
 		function = "normal";
@@ -1038,10 +1083,11 @@ &uart6 {
 	bluetooth {
 		compatible = "qcom,wcn3990-bt";
 
-		vddio-supply = <&vreg_s4a_1p8>;
-		vddxo-supply = <&vreg_l7a_1p8>;
-		vddrf-supply = <&vreg_l17a_1p3>;
-		vddch0-supply = <&vreg_l25a_3p3>;
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
+
 		max-speed = <3200000>;
 	};
 };
@@ -1155,16 +1201,19 @@ right_spkr: speaker@0,2 {
 };
 
 &wifi {
-	status = "okay";
-
+	/* SoC */
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
-	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
-	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
-	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
-	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
+
+	/* WiFi / BT PMU */
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
+	vdd-3.3-ch1-supply = <&vreg_pmu_ch1>;
 
 	qcom,snoc-host-cap-8bit-quirk;
 	qcom,calibration-variant = "Thundercomm_DB845C";
+
+	status = "okay";
 };
 
 /* PINCTRL - additions to nodes defined in sdm845.dtsi */

-- 
2.47.3


