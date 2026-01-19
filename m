Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521B6D29C4B
	for <ath10k@archiver.kernel.org>; Mon, 19 Jan 2026 17:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8x59fxfdz/jGIQYFQNs+4+juRLg1OwAMr5vtnTuLy4=; b=oRQ++ASty/ER5DVWOyOy/JJ2Wi
	7zTaNj+YEL87AdNKlaAL9f7cqvse5k2js0ZaNjIfFuUkC/CdKFXwI9G8mlV7xtu1qDKh5pzQ4q1cq
	eW3KszX8j1xuGihQoKgjemGhbR2+L8iqasYCIRQJvbE7VFLZu1mZ/BirD+mV4kUESgVjYMxByrL/G
	taQ+L2MfGiJ4ntUdYS7eic3zZZhRxOrw0xS3D1zxv1n2x42BTCqjbx/sgfvmgWV4SxnamXzAgTv6K
	7fRXWYbNE+pFPAItG+NDTdJ6bHleaa2iTMmK/afuzt4sKK0opoZnMBFIrM9KZoY/ebI8Ap+sLzZjh
	OJkXKKZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsjf-00000002aof-0EYy;
	Mon, 19 Jan 2026 17:08:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsjb-00000002amI-3u4J
	for ath10k@lists.infradead.org;
	Mon, 19 Jan 2026 17:08:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9nSFt2966239
	for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 17:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o8x59fxfdz/jGIQYFQNs+4+juRLg1OwAMr5vtnTuLy4=; b=nx/2obPUu9tYKqHU
	+rbwAW2aeKNeBerwL67DGNZoRSyjrI+dmna7UByzpWob6bR79enVJrKrAKfOwYBo
	r1nh4mw+lF3N27XKjUdtWz0iXQAIV7kYLQBmYE1Xc2tyDxXn7uN1TKikK5kppePb
	FA24QR54L5STksjkaDAC84qK9awpp24kYFK7ssPHiE3n4p4eSTxFyzz1xMuYmPyl
	Pv1ZUOx+v6bnYSB+aljz4DnC/v6DEovQRlTLiqJehLlnljhCsnhJoMxwr+WR4KC1
	vddu+RJktX+a0nHeJdynb69o/HQZDGE2jwv1vQrrPGKgD2jJSfYH9BE/7rjel8/w
	Foo7cw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjaa996s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 17:08:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52dcf85b2so290958285a.0
        for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 09:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768842490; x=1769447290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8x59fxfdz/jGIQYFQNs+4+juRLg1OwAMr5vtnTuLy4=;
        b=Txln489iiRAPA0eKiNhAEJHnCsaeF638Ru2pKUrmuN12yd5op9FHyZEazksrRHlKnB
         Mz0GBdPlmbR/bEIYIo72/egbDh24i/hffnpUbD3n2CNigdhDbaGpjReoFqVw2ppNbZBz
         /YhX9Y9oQNmlP4OCLTJLR7y8DkU7nIN3L2LvwPInkqnlccoapXTTqQaggekXNCyGMw0s
         xn1w/MztgfjHVaKENK1yI1Xx1jv6DnEPLCa1w1m0wF+mDEGgv5LdGJMJd2k1aGozAPLI
         sW/thRk5CErc3F4O6XdENqH0ZeughhXiQuI0thgxZeJVnLWctiMQP5HWON620KBoS68I
         TBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768842490; x=1769447290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o8x59fxfdz/jGIQYFQNs+4+juRLg1OwAMr5vtnTuLy4=;
        b=Ux+jvR06NTxU1GnRHiW1FFP21mTm8L2CM0TZ+JiK6xx8W9bEFCK4J7ruu4NKeMuYtP
         XUh49+cW+JoEoeIsCOFKXXGNdVGMqf/wFmABRBGp9hzqyP7BglwVwvoKgz4FI/PLKLqR
         Fb1rx5+knpIm0LKe+OAEEbKbJ3XIeCTVAdW6LE4AUFvNHhj5GYycVAPq3Yq61AQNjLSQ
         LWnjubP95N2S2m1rGUN9tv/aUoWiQrTkqX3kQYrSxInrey3dSJmshZIZEPCrVvWr+bvd
         FRnGcYq/wTdzIjdKrs3buCgZiSZ6M/RO2Gk4KLQiSBo98c3zCNpy+Mo85HjSBq5kYHnx
         5Rmg==
X-Forwarded-Encrypted: i=1; AJvYcCXn4ndMQtskfU2L56f30dijJ9RyJrie9KmO9soYKr6OdxAuIosf4jkZ2l8y1qUgkXWF08TbbTM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8HBi1AwuPSoKATcZ+UtY/YgwJHOESq8njvxwGRGK4dPtbfx1h
	g29CGY/CFrWgiAKgi4DWwE8tfL0UWJdV6ldWhohCeej9o9Z13hP0dJeOHQMpcMO9I+d9/EHYeu9
	OjeHFlMBaELFsJNtonfD831og3pHmTUIwtSA/MPH6xbp1oWlN0N0+MWKzydk9bQ7z
X-Gm-Gg: AY/fxX6NEGhcIT/3yeqJsjNvA+x3MhQWPG2NkRbSIeSuK15RfDOMegKIGoS4/Qfr2eZ
	I83tvpoDW1++MIDPJRgINUUrbDbRuFzEVPyXSDTVwpDVuQl1w92vnaJ/ZbarwmTIt/WzUGSTd3H
	q4N5bqMGQAb7qm+AYqRyc46goSzK6P83UsmC9lMdeF9L97N2KP3K6tjBe1nQNn0MuoZSCsx3Bam
	N2h6AFBfsmhxu/cEh5oLlGBZfep2Ss5QBf2hqzYOjcsRdiwAQHQplVJOEpsPvmiXtrRF/eRowgh
	ic1zodd8/8IqlyEVp4UXdBvw8nt9Iq1njdhUn06/VHC9+dM0skRcxLT8qlwg2EI8AlNJIPnHRPy
	BC+IMDMAPf+XIN/+4poCmZ1sdTaKW06xPw2ou0IudLY458ePph+Kujka7tfjUjBlSDICI32ST+q
	dFzjVEX/r//KbvnjRylkRvd8Q=
X-Received: by 2002:a05:620a:1909:b0:8c3:6f20:2ed2 with SMTP id af79cd13be357-8c6a6963386mr1569144185a.84.1768842490331;
        Mon, 19 Jan 2026 09:08:10 -0800 (PST)
X-Received: by 2002:a05:620a:1909:b0:8c3:6f20:2ed2 with SMTP id af79cd13be357-8c6a6963386mr1569135785a.84.1768842489685;
        Mon, 19 Jan 2026 09:08:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790a9sm32661211fa.26.2026.01.19.09.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:08:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 19:07:58 +0200
Subject: [PATCH v3 4/8] arm64: dts: qcom: qrb2210-rb1: describe WiFi/BT
 properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-wcn3990-pwrctl-v3-4-948df19f5ec2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2734;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=enCKpNdnBrXZA+wiHIdAIv2kSpfxxx9vISm1ccZ1t9M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbmTtilwkBClWXXgiyKcWtWRAEl+wOgQ9AElnr
 wN2H+oTvD+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW5k7QAKCRCLPIo+Aiko
 1clcB/0bYfdqHWhPo5vtWeP35++T2K3Q9BRc7oVbgJJPq7w6Q2p4XxDPRwsC1AeWVNb0qyN+eg/
 Q/8e7v89lH3+HAgOS/ujgI2BCddyoFflPbtxvmDrXIUCMcV8tPl/1L1DzpMIdE7mURoIC3hsWsZ
 zsQidYoW/JEicp0mAfr4yQI3vEDiQA7VluDs87xUDOJLmvVtFIDN8Ayzy8T+F9klHdxVnSDPk+X
 WFb5MeuUgA7qVR5CANAJu42J4Lg2WeMs8KPpY6BuWn5imcCd/T63SgntdkGu3qZ43/g7eEgwVw9
 wQ9/2gDn7ksi/y4EjkSYhxVCn/1dPRKtbklYlWzu0IKLGJf8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE0MyBTYWx0ZWRfXztn6bH1Xjy6Q
 h+1mLPWcufFSMQz0qZwV4DCZay8G0vOyTyZxWJvOgP64b73/xzjuZhO/Bj8+J4jEmoRsAeURmlH
 W85ef2ycrcD6Rc85PD+XOVIrXbY8v0/IwKru2VKGfmbffhdrYQimocgv2qv0h5j4Q3ZTZONPExd
 vHVhADuTdJUWXzPHwcAajuSJcrYesLp4eKOKiqGXe6XEVEfAya6l/bXdtW/jHXKDRm/snR22m6p
 3rM+mWGWT1DbIFzZrGF4GlXPIHlL4O6sQJVeG2gUEjQ5xxMVRiiQd5q4omnN/ns9Jxr1VUmGEFO
 Sy6oI6yu39fT/jDF2wiGP0zQ02n4dZWOLr/ESuuL27eCnwbGPn2AfQ5TqpK9ds8btZJX4PZ7zPr
 h9v2iroEYJNdy2fcpP2gHez82rr/tS+DZD1tIiWH/OvZTfr2B42meD5PYPGQA6YXk4eJRjGZijW
 osPfygW3bBT9Lw02c5g==
X-Proofpoint-ORIG-GUID: eK3SKtVwT0hw-lw6mRBEJob-Q0G_6zwh
X-Proofpoint-GUID: eK3SKtVwT0hw-lw6mRBEJob-Q0G_6zwh
X-Authority-Analysis: v=2.4 cv=L8gQguT8 c=1 sm=1 tr=0 ts=696e64fb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GWXae9BK5adipm9ZVUoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_090813_065459_C6CC9C7A 
X-CRM114-Status: GOOD (  14.58  )
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
index 9814ac4896c5..737794cb8b1c 100644
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
@@ -754,6 +790,12 @@ lt9611_irq_pin: lt9611-irq-state {
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
@@ -789,11 +831,10 @@ &uart3 {
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
@@ -834,10 +875,13 @@ &venus {
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


