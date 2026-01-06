Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B282CD0427
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 01:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ex4s+EzJxH3coe9V2sL1LMe3/CJisGmDqJf1ChODQc0=; b=BT5SOIgkUqd7PEbt/H4a//p0th
	FQcEnKsBsi1wG64QYuIGDHJmulFS4HYCqG3qhTK2nQsicMrqC+SVBXDdr2Pa74o0oolQmSmdY3M3d
	fX/StGHVU/nVIU7Y9DuJT8gGMEuqGNIVyr9tS5f6J1Bg0mEv9Sm+XpTP+2pvquMWkfwT25mng0RHa
	xYm7A+lrXLam0ZpQu7sl/6WxQQXx85k7PXcNWhuLks2xWP5LqEN0UDOXZdoXbENCevnjqHCvl0Asi
	ftPSat0LMJAs7wPjxjVKAQd0oCALR/5cfL+RsXVRSjPtaESTB5hv4N19FuI79L6hV8GFGxdIEV/Dm
	W2B+qjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvSa-0000000CI1U-0oG6;
	Tue, 06 Jan 2026 01:02:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvSI-0000000CHtT-48ki
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 01:02:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060o5nS2292288
	for <ath10k@lists.infradead.org>; Tue, 6 Jan 2026 01:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ex4s+EzJxH3coe9V2sL1LMe3/CJisGmDqJf1ChODQc0=; b=Bgv2jbDmLFM9KUh+
	VrvFw18/dz95CrplfgJwl0i33Mga+JO2UPlo11IsEzKgRI+fZue1jyZr0zn2T27q
	v2UA3y8uGn5Oz+nbU2dnbJG9UHGwQeqHkutFZ2XRfeN7wm7e2RZOlFcq2mzFx4Nh
	bE5EHnliVuz9hOKlZ8L68+R8HxUKbyVhQ2D3V5EhZ8L4oKZGE8A49oyPyBtUmSXH
	ThJ8k9ZmbihobD5gu/ZqvdwXX59cKL+UW/tfJhpMHBMqzXSj5DCUcpkd51Z5uKa4
	NXf0ngtWIwjSEQfu2SsMd/yZiuM5iHgOL5vbKTkWQwvg4Yo4iRjBeKoUfpq9HdV0
	91U65Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg79nk20h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 01:01:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4eff973c491so11109101cf.1
        for <ath10k@lists.infradead.org>; Mon, 05 Jan 2026 17:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661309; x=1768266109; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ex4s+EzJxH3coe9V2sL1LMe3/CJisGmDqJf1ChODQc0=;
        b=SQFuY8oYLEDEbabXdnYyK1IOu8/DgBID6pAY1RHkvNeYwxiGKTw5/nvXfbIR6GUAgh
         JmXlqfilFXZWGKpDZ6wdxsdy2MnT7kFkkuOWKfo2jxgffUTTDyZFOmJ9E+2/mHYR//Lc
         VDfwIaWkWWD4ikO6wQsoFmTbSXh0rNx/uqHRdQJo65vYrswEEZ3dWUK3pdXXlzJEmYCr
         ZspV/k1q4dV2n/eelYHonkyk8H7jpVkczrdnMFT66x9e9VGyl73OCW23G5DqsFZkminB
         jBL0zxsA3aG6SVAb6nazevxs8GKDbXcd75y7afVq5fxmasY6uV+QgJMnJIlt/7ryA4pC
         AuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661309; x=1768266109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ex4s+EzJxH3coe9V2sL1LMe3/CJisGmDqJf1ChODQc0=;
        b=bf0/Co2r1r05zyx1com4YVuHIjj1GnhHgtqSpVYVbXrXUU5rBtRheDJr6AXY4CKoLZ
         weAXZPs/OVw/6YwaCNVqRFPw9IwJikL0nZK0owEEKQnrFOIspqZ+K222e7hu1nGDYqZl
         f7ka+Dw94SWXIvNizThcG7I33zGqejr/CzEn7zcwT0B7nKsp4Y4DAKu8x2ngkj4ctytM
         n+hG9WUmMYWJyTwTVnd9/R9bIT6yks4HfdasJGUEW8hhsMVbwYaUJsTAjjsLdu5YTh/4
         s3GfJ2iAkyemVqwbMF0VOOj5SuW4NcvNuvmpibbFWeTeXUwdotd5H5P8yIoDkze963fF
         iBEA==
X-Forwarded-Encrypted: i=1; AJvYcCXK/KjnBsxYWyFYZgRcUlgLnV1PLyGo8VsTmVnRILcFuijYVj0UdpJx/YAg86knjbLaLUjOLA4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvv82qxFbhn6UoPAHfS+USB3+v5HRdOPBU1662k7YdUZPBGOuL
	/jSn1rqffCK3P6i984cgn/IO1WzYqmD4kqWczAQPMcN7l2VbbIcpPeOzlEeD+8S9O5bDtumngr9
	INuZEJ/mD1mqw70ewzeZjNHfSCqMW8oASTCi0N8GA9AS2pCkbs36In1S9YsrC939j
X-Gm-Gg: AY/fxX41strG2w7HqaPPBYZX5YVXpPM6lsZ1zF35nRVNmB//upXF/MT2jqT8EphC/Fr
	GcqAJ3McXk+XtDUgUbuMwUc7T6UxKKRh2UdpLyAojAyFuqZr5cgInH2gevQ1fYLRVVFzifdxEKt
	yF8H7k7W/trQTM7otpeiA5qQUCetWm8+55eulx1rmX76EZyEWoe4mqQiVwkgMpFkd3n8sAmbHCC
	QVSSVrs5eNM5pQ+CZpHExDZMTyK6hZWx6kYIEtAVfv7+iBmrAYS7JxK8fCVpG6LOYhHfbeDIIcF
	I5MJi3NufBt0m8m5AhjqWewVuKeuyvHtEhnJhBfxsO6ysPhHdAn+qTzQ3Z2/5gDU9r3FPQhcigO
	ywE3hZFRhtDDRnaEYlHYMcYGSGU4QLu9zOzYX6wy52Zs91cO9/EwiPMbcgHnzKw91vZS4stnJEU
	9vmX349XjsEIW6Dh5Nf5MFYYk=
X-Received: by 2002:ac8:5990:0:b0:4ed:b2da:966f with SMTP id d75a77b69052e-4ffa76da34bmr21391131cf.31.1767661308667;
        Mon, 05 Jan 2026 17:01:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGmwxi9YOkYp+Kj5Bqzdrtyu54onQjj7FG99+Fq838iN1qvkxSrv+NFDDAZ7ZUD561ezIHyw==
X-Received: by 2002:ac8:5990:0:b0:4ed:b2da:966f with SMTP id d75a77b69052e-4ffa76da34bmr21390551cf.31.1767661308206;
        Mon, 05 Jan 2026 17:01:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 03:01:23 +0200
Subject: [PATCH v2 13/14] arm64: dts: qcom: sdm845-db845c: describe WiFi/BT
 properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-wcn3990-pwrctl-v2-13-0386204328be@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3033;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/u1tgrZtHEkSxPcf5pHX7xHPoerlKHblqpNDjU74XrE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXF7axr2YseItmnkTg90KlXZF4jP2cDPnp+w6m
 11MJbzET+uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVxe2gAKCRCLPIo+Aiko
 1WmtB/95BUWWIbO40lh7AIu+2V+zI3fS1VO0vnTlojhc/1vdGj0kB/Ug+5TL5tB5Rdk6sOXAE8b
 Me5DW/hM9jhlJ6upLmROOBq7n3V/a1FP4TENKcCEmmAnn5INKtwO2nilDLbJLU+1gTmU79xM+/0
 1dov3LLjnGhFU90bR3crT9qfU6cqnxdeJ1+f/JHStf44/oCnrwsSNpNTCOivIR5V5Mb1WIAdUTN
 IaGmA+jLTQ0h9/YZBT539ZeZ+NPjUedUx6F/cJ0G1nnAVl2+Yt4v7qUWcWiBpOdGylYT6GlGRzi
 DR/Xc/f69bi0eLM+6Hb2/OuCZ4dYONd1abCQnqL8mCxdPXdE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Do143Q5f0J3GkLNRZJMIeZ91LksE8Q9s
X-Proofpoint-ORIG-GUID: Do143Q5f0J3GkLNRZJMIeZ91LksE8Q9s
X-Authority-Analysis: v=2.4 cv=Y8P1cxeN c=1 sm=1 tr=0 ts=695c5efd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=urIVL_JefrS1cr2SfK8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfXziKZSI+8uA3J
 5Xw2S2O87xOrHYKfvTL1ki2CDrQC4q+v7EU4imtszcGZ/gaEtpz2wlFInSi6ZK39qrEgVwB96du
 fGirflFjuz2oyUjk1mgVM3Iu4b9yFewVtOfzUF3QM0715GY1LteGK60LE1HsSmYT9YnPWIxCDLi
 kULMxBOuNvtrrG6zhHouTtZIyFbZGc3T30AVCnYb6UTqQWi3J6t4L3ownwAqSvuawStd6SpD/Ls
 hbAOiWFp0F9MEzneTeJxVvcnYb2MQjx2h0A9qyeUps0QKXubDqur50mTOyP+WQVS/ufN8D+wlOy
 nVMEExZ7+G0kU2ye+4d0UdLUJVThDvQ+FpQlKlTTp1aLqdoqGVp4w3kb2fLWzYXviPiIIBlzquD
 m3Ua+yDRmJgeHHTGZaWwPdDo0wTvBwmwocD4py8MxX52do1AVeajfpcTRfdtMWRzvRwBVqMPclE
 2oZtbi4nBYmqlNXFPTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_170151_366271_56731B31 
X-CRM114-Status: GOOD (  14.76  )
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


