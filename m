Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D6DD29C4D
	for <ath10k@archiver.kernel.org>; Mon, 19 Jan 2026 17:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ex4s+EzJxH3coe9V2sL1LMe3/CJisGmDqJf1ChODQc0=; b=cXtjUSO3BJpTtgYmHIv7h9h2Tg
	XHxngiVYCe2iBCdvOD6Y0ClYD+QGFRA5zVi3lWvEFQdB6GbmsOLRgEgg98SpVQv0ZeppOOksK/GTb
	cpsZFfxTuqg8l+rfPHKqDFJLGsd4lRtoSPfGrxPwg6MvRRerVwuMi/oQdyUYS7QreSbQ6Q8Wl9VyO
	Ssn9MsCS6odxF8RwNAl3eWLTfzV3lkte6b039/8ZFguLZkpXPGAP46bzGLrsFXm7ECSfHOc+BffE8
	JqmwkcCMJ/TOFH8NX5HWR/v78fay5P28moDBGfBUuKJTuFXcPx3YiO1BYJVxRixJg5wTa2AUV51ks
	MDmVE4pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsjn-00000002axt-1oXJ;
	Mon, 19 Jan 2026 17:08:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsjh-00000002arg-2225
	for ath10k@lists.infradead.org;
	Mon, 19 Jan 2026 17:08:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JEoWxB2305875
	for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 17:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ex4s+EzJxH3coe9V2sL1LMe3/CJisGmDqJf1ChODQc0=; b=mJAWDcSPVvMbswGt
	9C3qxlm63ZGT2CtB4oFWcYLadgbi4fd+6QFeUJF8za0RK5ALE7JTXZsZPLTlbmWy
	7R/ZcOzfzLS2X+I6GKBhB99rbFwyAHDzrGrrL8QUbltblGh0QBrl8ON5sltNPRbm
	MAiGBB75fG8j+6RPyzQpfEXWrJL8AnJ7rjYj0urxK43RqzGnzg23Dgceux2KWuR8
	X3bHqDnPyAnQVqyb/aBIcKaczJ3FY6ulu0BNADjGPldIPiDfXAKzBqfHmYX9bJR6
	PbGTVYMXfdulVX19gWLmmegxpYXrPsQ3yJZOSfX6bUEYmn8liBh0wY19Q3ldh1Bp
	XfcvmA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bspqv8dsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 17:08:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f89b415so15825285a.0
        for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 09:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768842496; x=1769447296; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ex4s+EzJxH3coe9V2sL1LMe3/CJisGmDqJf1ChODQc0=;
        b=PO9F8w7v304poCG3XEs69qQjpLVmQgXSIwgWaCzLobrb4wnO8gjCU5DcMprvt1i1Dz
         F2xFM7P+kYKqLi8UAGUZD60UcGBAxN4+WXn28DyDZkomjcsjfAYXp/98VxcNlIeq133w
         nymBfBjRMk3s+mM/QllPUjZle1DzOlIUSllzcKUg/0XtknV6A8/kqctlFAIqzslj3csd
         ECzhBPt4LfxwMVUFTxoOx/1ALKI/Gqgsawi+LxWyI2hHK1E8Cg0Utjyniao1VKx8Alfs
         p/prsvjontxiizkUv7A6z70RbJZqw7uS3XFErv6fUueiHHcAgcbE8CO03L6X10RT5ojf
         XA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768842496; x=1769447296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ex4s+EzJxH3coe9V2sL1LMe3/CJisGmDqJf1ChODQc0=;
        b=VhIJ5J4TzIIKf/jGbf9GrvxyyNOdBT0nf/l36HyIulfDM0P4+tkXn3p5fi+lSmsYLw
         TOnxRw5EKcrkt9ZK/CzzOQZLSfUtuSQnfIblTpzAjqYaMyQl/hIlmQvvyUB6ijtcMXYA
         HeGS69YvF9QX4gScF8aKmlNouT1x3o0CVEGYXd5y2hcEa43sUITrP/8sRJWmN1aWh2WN
         xHf6n0ZXdXMpOqRkP/wJI401Kl/SwQUjPNaWwjnyzW6jhDnb6XVOW/ThveClwrN1y9gK
         SXFiaqcqo3HHzQ63H4PDNiAfR3z1btAbnJFw4Kj9PByKMfw25/t9yPny8PVuWyEfroab
         EGHg==
X-Forwarded-Encrypted: i=1; AJvYcCUPV1z/G/C4iYbETjEIhxbEL18zmPYsn7vkgw0m6gU0+ZdXqSqc5K9qMlZnj4tfqc/jTab2Tm8=@lists.infradead.org
X-Gm-Message-State: AOJu0YysFqKYrXl+ekANPqhPGGuNN7AHfO5YD4KvPJdp+9Q71sXvEIoE
	6CphTLRn5IcwqS/AZcf+i1KYW1G4RIGXyi15oTiMhV7LghJ8TQtJrvcCDta4nEMzJgNToxvMHYX
	KliV06jRFpKL9t9EvpEpBc5w44T49w4sN1TcE4ctJXGUw8Flb9bN6bYMDFBneUcTi
X-Gm-Gg: AY/fxX7N1OG8a11BG+clcG+znQQhkvLfLvzIkdwAXzzRWhATN29yCPSEqjkXRSrMD7Z
	6wVdFqN+dpTqLS+9ESOS9WI0x3MAoaA/KB+5L8C9GBjW1FIuhNxrP5jfdNsPBNCOWksPcaCZmD3
	Iza4WJ9yYldZhsfHNWbxo4UxKs4W8Uzzw7rBhX7rUbaQMrAKKn2fkjQQ9JQu6rh4dAbtYQGSUmT
	bpQwuNYVNRJua+XKgJABVLPJ+nmXprE4cC9UihTyaMn+13oOJmfgTob1mm8U/PXK0KKsB1J6Yal
	J48apLYxyz/lm4flEfAOE95oGyvlArzyatzfURU5YcjwLZbEtATDoXZEoBCXd6Dl5SkitJSEsXh
	qQu8b113UX04I0186oGpnWveKRUcPots9zHDLHv+yh2g9onvyG4pt75PzDBCe76OqYYbCz3gt7H
	jXzdGS8ftRnMvYkluaZIhFVHE=
X-Received: by 2002:a05:620a:1911:b0:8c6:a5c7:a7ee with SMTP id af79cd13be357-8c6a6770665mr1565236385a.53.1768842495710;
        Mon, 19 Jan 2026 09:08:15 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8c6:a5c7:a7ee with SMTP id af79cd13be357-8c6a6770665mr1565230585a.53.1768842495144;
        Mon, 19 Jan 2026 09:08:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790a9sm32661211fa.26.2026.01.19.09.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:08:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 19:08:01 +0200
Subject: [PATCH v3 7/8] arm64: dts: qcom: sdm845-db845c: describe WiFi/BT
 properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-wcn3990-pwrctl-v3-7-948df19f5ec2@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3033;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/u1tgrZtHEkSxPcf5pHX7xHPoerlKHblqpNDjU74XrE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2Zeyrvai64H5MzO2b+cn7kmzHZCmFXannyuk74fDY1N5
 f7Z7RfoZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEjH6z/69LY9Ht26i7Wa22
 j0ns3lmu2L6+lCplXq0Yo2+dnkJXhAST3t/P+Ztl7B8p+vyIZ+H7/yyXu0Wi4vvTrt0vzUnrdai
 trv+gV3IvR9FUQeDAhqVSjhw6fVJLSw3/K2vc/HEo8w3js5OsP25MCviRdkJz0dmtLS2BZ6163L
 7kbp7GYJUfHXlx9RInl8zPDHHSEi1LT7AalSVwLdk7dUe2JrPsbqWjSTnZJzbu2mS7dMqLdXarG
 nT7/+tsVayRCWb4+zqiqIOd8bm3udNpW8sra+zzOA4x381kjrIoDzc8fV9OcXJh0HW+J1klaz97
 3GtT9D7aM3/3eWEL0RW+gt1rSnpzrU+e+nrtX79kjhgA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Js78bc4C c=1 sm=1 tr=0 ts=696e6501 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=urIVL_JefrS1cr2SfK8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: _aHo-zRCsklIWPidp1OB7nS9PqdHA7Cv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE0MyBTYWx0ZWRfX9VTSMOVQWtMX
 SlMeAs6OdcWond4UYT+BP2D/nKJx0A6VWuXhOh/g1O1F9J4SFKUlJqtdzDK1gvtA0+jjESHtab0
 OdCSml/jAbjEcrtqAiCoOzlKTirzYf8j+HWrXegasD+BGHCciA/sGpiYt0cMZb1JpPz3yy32wm9
 Gpt4LF40mqWR1oQN3eTmwSOU0EEz4Z1i0QmlgewuR7e4UhggKmrCGFIELyzdxl44J28SXhLd1t8
 GfVtz/+qag0zDosUiDBBpUG0AhT+55oEg0U2bzajkkm9kqtUak9gKyzT8J9NnlI2QA5BhXc0WR+
 9qxHPUl7mzd/JIeKKvbD2gyJJEyjmSJCsJAOyHdnTeCgEFo3PcjzClP5nATFdNCNx4XItnJHJbW
 41RJytKFxrO6fqv0yf/rxn/7RqXJQZvmi1D5oz/UCoqV8zR6ACqFDXr4Yey2xZhauRXtyTFw2Fq
 uNZy2uffWblalX+GuYw==
X-Proofpoint-GUID: _aHo-zRCsklIWPidp1OB7nS9PqdHA7Cv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_090817_543433_AC2A81EC 
X-CRM114-Status: GOOD (  13.88  )
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 69 +++++++++++++++++++++++++-----
 1 file changed, 59 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 5118b776a9bb..02416812b6a7 100644
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
+		vddrf-supply = <&vreg_l17a_1p3>;
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


