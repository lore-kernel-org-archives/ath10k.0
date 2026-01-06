Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143BCCD0428
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 01:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvLj2ZrhI8wZXWx5+lQ/XFK1dsetMDN49y/jhkiekz4=; b=nPFfYeuf98Ufrr8EDdFzJqGRqH
	ULkC4GRy+kJ/iqjc0eZyhDQoIhFNml1ds5kFtrYT0hDjIsovNrV3s92QXQ5aJjd6RGbyMDZdeYXk7
	ZuJYO9x2/PEimPuxEITj1pBxV4LVh7xzfn048yBVZNv2w7vxwlxN3PpK+Y6Jqn+pZPUzPrh+PlC1C
	mKrZrdrk6IFvpOsnvYnYe141QnExPB1xTRs2g0dVCEFady23am3TeNql4rkD4BGHZW8qWAV0rQBO+
	xwinIg6DdZQ1oOfTDPoReD7wJCHJZ9LKBxqsVns6wQBiNClKpM5Lgf4ctOlFShkX4snIAzGZeYrrR
	zBdrXteg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvSJ-0000000CHuk-40dT;
	Tue, 06 Jan 2026 01:01:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvSA-0000000CHl8-0vdV
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 01:01:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nq0J203358
	for <ath10k@lists.infradead.org>; Tue, 6 Jan 2026 01:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KvLj2ZrhI8wZXWx5+lQ/XFK1dsetMDN49y/jhkiekz4=; b=NsQ90LZWElNYoObw
	wyUFxyuvLOYFFv37MI27GJcR8wHbhww4Z0SaUMjwzeUKVcQW7MPiAi6mbjuikA2+
	kkurrsp83Cgcgln8Bi08M8sNRpDhX0K5ygbhikAaonTdVRwiubgNG+T2JDzRm1nm
	ks8KnPm/BN0wh3kSpERGi29QwHCHFz4cPJiPe+BYEtF/rTA17HyjyjPoce4PKJ1/
	mK94ijHaV4Ct9pfhNChNGaXTzXnqauqQjnWAAHBDb/eK1ML1CpSfMipP7rLw5S2U
	/B67lkAxn+Cd+fHlPhm4jpoyWQic+aiGTJVPeLpJFgy5d5iBvi3rv2gi5DVSMwxm
	OoIJWA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggqu19fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 01:01:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d26abbd8so13294411cf.1
        for <ath10k@lists.infradead.org>; Mon, 05 Jan 2026 17:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661301; x=1768266101; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvLj2ZrhI8wZXWx5+lQ/XFK1dsetMDN49y/jhkiekz4=;
        b=Mu1fOSmM8kj22BxGTfWFMhPqGO3JZ3Uu/WtUpyvY1P7gB1Y131v6Fmzgbn8Msammjv
         R+JB0StoHefgfi529eOllyv275XcY5iJW/Z15dTUSqMIQ3jCO0GPydUlh79eayIq1R+4
         SsF4pY0UEqiHhrfk5aaBSEODJAKiBVJLpFUY/Nh0Y0QXyeRcmhEl89dEohXfo2LpHzav
         nvhzC56FnP7PyfVNjRADv65TEBwXkLYGIR2Gm+FLeWjt5nm8kkE0BZ24MixGuxwQsbQ5
         shZzPWWbH8I0pXOMQIveu/is7sQwbT/n0oQ7zJBYugPm4kQwEj46wl76PRSs3McFPeIk
         fGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661301; x=1768266101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KvLj2ZrhI8wZXWx5+lQ/XFK1dsetMDN49y/jhkiekz4=;
        b=fDtvzY/mI9aS+Gzjjh0RFht7pGYAzbgqokvVlKjkJC7h6WEnNvTIozPimmginhS9NX
         07aTiY3XkjpNdvi7n3JichXYoRkNcxk+iqQfsFmk9rcKOKM+rZG8D9I2lb9N5z2COAQT
         kdEkJ059bkzCgFjQ07TYlOjHBoq2PE2XHGFQXKF29jzNeBjQJNlkDQv3kzI5ceJ+2dJy
         MeTHSVF/+/BQgUsHCu824CQySMJEteYq1hwDmjEUErXRvHx0D8PdrMnShNSKqSyhz/b0
         q3WvJ4/AoqRFEqcXenn5gzmAL8uJ4oEtW7IusUuphiyOi5GOUOQXtfWtQp0mdXEpM84Y
         qSmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlvLmJzeAeguzYFMqKmBI1a0XYWZsaISjXho2Ghws1lcOKHIuYz//k7lTNhVOD5sb3akoCgyk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5jeFf4T4VoXyeSZood4FH8yAuMq+Z8ZNFzcy32e1n4vDy88w2
	cVgt10kRV+chQCofqLEjACSw6ye41a3N87CQorQ3IBz6Q10ksKSzcccFBHG8ewmI3IGFPr/4lQ3
	5YJTsQj/dZZEDqhuOsZoqF0FrRpa7zFv467dORvHCOUgkUFWzt8eGBVVx2Q4gBE4x
X-Gm-Gg: AY/fxX4J6z8tvJxaLgjuH+GiQ2Uer2qicazMtH0GFdL7sovPBJD1wnk7ynzt5yEBlSe
	qyz/fyTdTQK9xqyGt3Cb6yMbRUyFS4nzYyZHJRoKRhcAvxdwGpc5gDI05VH5gXP/cXOVjjZdBqs
	44sZTQGcztWL2v5c7Qjgg08jleoo06UmfP97su7O3+Uw9TOSNCAKboWklW1h8hMubPYo9RKEk+3
	BCqxccYmBhA2642XjuEM4kHoy922cGJ44eJ0s6M3bkA/BpG1EP6k4uStGfNsRpG0s3bRb93b3Gq
	Wc4gRdV7CvJwLgIdsZ6xsbK8L0SGCIApWEhZTkcVo9VKEXIGAEggC+SUoSp/4D4XJ2E5Wq9hQm8
	7YLbpvso5vodZRX/fYN9Cessep3oM7ipk4VZuRzv7LMSM4XWlPDoxex02HJ9Dfj3++JRQoPzR1K
	2ZNLsfP06Tod8FOn7iKmEKHCQ=
X-Received: by 2002:a05:622a:4209:b0:4ed:dcf0:6c42 with SMTP id d75a77b69052e-4ffa77ba644mr18752411cf.40.1767661300733;
        Mon, 05 Jan 2026 17:01:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoefOZDx2zHfaoSVi9LoeU8tZQ/pUprtXoEP2cNM6nYtY1N/LLfnxX03xQAdXCwp2mIo1UCg==
X-Received: by 2002:a05:622a:4209:b0:4ed:dcf0:6c42 with SMTP id d75a77b69052e-4ffa77ba644mr18751491cf.40.1767661300149;
        Mon, 05 Jan 2026 17:01:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 03:01:20 +0200
Subject: [PATCH v2 10/14] arm64: dts: qcom: qrb2210-rb1: describe WiFi/BT
 properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-wcn3990-pwrctl-v2-10-0386204328be@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2734;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OJr4yv9vJmkaC7saidnllHnC/2Dn/uant8yGpklrbes=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXF7a+AuXommsi+raf46ccQEIGL4H6RNRglLRB
 hETuM60QFyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVxe2gAKCRCLPIo+Aiko
 1fbbB/wIur9WgLQAj85cFpCSRdmxky4RhlzO8L0F8FRtkGWU7Hfoh8M0yUWaC7FWbxm19Mc/Xha
 evzPI7A185XhJyAoZrKnTv2BVHxvrCn7i934dNXuexINmWVreXQE0enMQcEfPxex7E3BBFTSKGm
 g6oAxG6XLrRgvrP0Q+nnnyzqYvLkWElaiNzJLWT9kRKoLQUrHC89MCvYcoImPXE4Wg7xYTCpDQx
 37sVCDRuqsh659+tl0mhcrs2b3ckKwBruy1InqhrDRXnKNUZqueFSDQAZHDaKvlcSiSI/9Ju4vE
 Gev0U3ks6+2HxWLpww5yPid4KWZouTSfKxNGvuYjdzgnTBD5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfX97LLHLTza1F0
 ZGkNJcdsB+iy+l3u2SnEKN4PxgPxklt/nm3nfBi1D+5B8oFC7v4sHMKuobQvpwRfVOcDdaaKKZH
 FQRpfmtcNsJnsWy8gP09XVj2mZ8/i5xSblhMFi44HMqrWKkPiOZ3nM0nhaz3g3MbfmQmyB49sZf
 T6itGe2vrWu6MlNz9M9s3E8xgzINClUBMPNnm6rEO2BijZ6PH5NwDXdF2yIiN5rtf96eTBSrHjx
 fZRmhLGSA3h31xqiIj7FRcwOi9gNzu8K3/CVcyrICF8aP/rBbox1h+Bj3Uj4HLWJ9Mtb7+fr/Wm
 T8p9dE9ZJZGN7giIjrCU8la3hctITsrjlsjscJvemTLpPdKtZsuobHtX4+ohi5dG4zu53Ljxsip
 sfoegldAMrqjIuQXVj/tr6EZYGnpIUo50FJNyvTeO8ygzWxc4jIsKvUqDfFrEfaEBsDXGNOA1Du
 fYyDvSIH0v5N00WQJVQ==
X-Proofpoint-ORIG-GUID: a-LIPScN4F5_wR0aJrl4aAOqAeUOMR1e
X-Authority-Analysis: v=2.4 cv=fr/RpV4f c=1 sm=1 tr=0 ts=695c5ef5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=wL7gHOWyGnUXpuUc2qQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: a-LIPScN4F5_wR0aJrl4aAOqAeUOMR1e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_170142_335541_0CCB7AFB 
X-CRM114-Status: GOOD (  14.47  )
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 60 +++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 1b9ca957a94b..6fa2288b709c 100644
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
+		vddrf-supply = <&pm4125_l10>;
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


