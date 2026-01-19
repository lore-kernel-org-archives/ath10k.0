Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E069D29C4B
	for <ath10k@archiver.kernel.org>; Mon, 19 Jan 2026 17:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNtdH/g1thI0zFb36R8TFQlQFWMJol5ad0xi+noohvM=; b=uWMHDmjkCng0ox2CP/MmeDR9JZ
	nBdowNp/q8MsoDeMGEMwDftysHtYiIfwH8euJN9IZ4WTKnHM5t2VivNRIOaCBSD6Bn9pRm0rcJFvV
	xbUlZhClZAEsMYL4Y9NJB4eilkhrb1cGxl3ma8rVRajhWkX5e2M5rlnVAk2O++eiF/Nt10zSfSNvp
	n8owK+xyjtiUms/PplRFcFaKWhJ/SFsbNFLnskr8fOuZH7mmquldh0T0J02Wp7bREDyRbqDypV0Ao
	5X3uFy++RPjOc37nlllSyGehiRCxE0IQyxQe1faZu/oJsgK2aJOQbyuHxTxTgDXLIJZiB2NOKhmkw
	ruNsr2AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsji-00000002asy-0MAp;
	Mon, 19 Jan 2026 17:08:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsjf-00000002apd-3HaO
	for ath10k@lists.infradead.org;
	Mon, 19 Jan 2026 17:08:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JEop792306248
	for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 17:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hNtdH/g1thI0zFb36R8TFQlQFWMJol5ad0xi+noohvM=; b=lnFO6278K1RkOmGM
	Nkxef4OxEe2XuXF6buQMK5mxpHnxqQ2ajNOQS3qqCCuHbnXz8PS3pfK0kJZu+X/R
	AC2WJ7odQBgsbfCrOspzUto5kI+c7sHUSXFiYeMTUo8mVSHHXlOMmmfh5PbmZsj6
	Du41NJ1/zAWzbPzZRHxbzFJyr5YD5p4A77MD21ljsM3atu0A3T1SaRGissDV4ZNa
	Fa1KRREVdAIOAUo2gNntBaV2ahDqZ6tq6Jnn1Ai6p/2DPOCboTHQYAEF5GNr5ptV
	r+4P3+pHblD+y5+l5+5qq3+zms0zuSCM5b9ewyO2l1smloVFL3RcFDEaHTJu01SM
	drcdoA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bspqv8ds7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 17:08:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5e166fb75so1121360185a.0
        for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 09:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768842494; x=1769447294; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNtdH/g1thI0zFb36R8TFQlQFWMJol5ad0xi+noohvM=;
        b=glNIG3efyPL0SlHEcRM+ARviBKRhRljnYrS8W9KPowPrtSLSKCGIgZxYOqVk8Ppc3A
         lqUH9IBI1/RioJMBAEs9AwkIIb9PQF7crJTvwg42Nmk6WM3GpUGMfQfhXhCbd1//6zjg
         n2oP5AQcUdmUHv+FVEgQT6RmKrWo4j2RRgZ7arbFLl/n7XQPgpZOUueCzP/ZuFhMMy3Z
         TrhdITQtT8aJnuQw3XBPtb75g9+MhmCmCMxSIy+rWy6hzTw2Y14KWyBc0XlHFn3EDovM
         vXJP9RKYD6pKQ0dQ4oaBUdjAiov3GK8nM1lKTQ7AyEUFqIHM1GyVRdN1mYfk9GNNo9yr
         W4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768842494; x=1769447294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hNtdH/g1thI0zFb36R8TFQlQFWMJol5ad0xi+noohvM=;
        b=o/Zxb2B8ku58+7SvALOJwAg5y662fvgg5Lh1ltFkdOID+Hx5+uHQjlQBeXYQCQ56bv
         bP4pfGzPhdYKhTYF2n4yxdGjm+lQJDF/+cZpf31PzAxKC1Dt7YLSI1BIdPK3Q2/HFnQ5
         edhBFHibEr92XeysalBZCKAXmZRved1f/yOzNk70m/LlTrFflh5NN64HPrPobSoG+i5H
         vq9v5RBgKMqGlYYwD4jg7G3cS12tlUzgXpZTZilq90HNQPb+w5XB9uLX0ihjk3qBJv+t
         HBIMVDM88v/69Jy9PyIU8qYB5RhTDJfoBSGQN+FFtxR6siFaG1Z9f5tiSxuiv685dMdd
         vQuw==
X-Forwarded-Encrypted: i=1; AJvYcCXdGMS4XZR4Rlo8dzgcb4L2HfyP6NInA1bhN/V/JYEMfeQXU/DBszbmzQRirqCDXKra55p2SVQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQyyAsQnn0fxR58M3a1iUU4HegkHa01V4FMXmQqACSvoOvcGej
	5fLQManf71gJnf6lEk8pc+7IFgWsAHIIE/RiCGJiSa/eYdyeOsHFpqtM3JACJozkWla1xn8zsR9
	Kw4q0nm5gehuTJOX6XCR49TI8a8B9z0yK5HGkoE+0OiUZ0xWNu12fKl33SzD6X8jJ
X-Gm-Gg: AY/fxX4qE9lmSWncpK+wAksJnorxAXYciG10bVpK0nngm71fhG+bmyBNH62QkbeM9+l
	zH6xn5JDJ+C3Y3JtAoxUwAUlhLGjlQJo+vQT7q72QXmpC2D5sCQo//na2bGFB0lYnPSnc/eK5LD
	71jvbg0L8KUmH0nb9zhZ1CkQ0OXyl6AbJD/J1FWyWImHmBqumBnNx6pEcR85ImdDqPdkpyn0iv3
	MXQGKi6i96izgOT4RwMb2Uw/WStYWMKXLHwTyvH+k0rhe98zJMKnOzEFg60+z6xxuoYEO3wZAEP
	bpB9M0dQili4NGq2NvEBXyyTcYxF0FDNCQ5z0ddcaN+PF5Qi7BG38jE1nZ9jL/gHybDIdCDCMYj
	h3eBrMAZmGE57HaWkIkuoWYp0gPlzHkW++joD+d1hIcl29TM8N3Ein1IE+0+13gSPyHvM2gQztw
	JOLR07kC/wH9s+infAq0CcH0o=
X-Received: by 2002:a05:620a:a82:b0:8c6:a706:d1f5 with SMTP id af79cd13be357-8c6a706d216mr1173847885a.9.1768842494260;
        Mon, 19 Jan 2026 09:08:14 -0800 (PST)
X-Received: by 2002:a05:620a:a82:b0:8c6:a706:d1f5 with SMTP id af79cd13be357-8c6a706d216mr1173841685a.9.1768842493637;
        Mon, 19 Jan 2026 09:08:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790a9sm32661211fa.26.2026.01.19.09.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:08:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 19:08:00 +0200
Subject: [PATCH v3 6/8] arm64: dts: qcom: sda660-ifc6560: describe WiFi/BT
 properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-wcn3990-pwrctl-v3-6-948df19f5ec2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2906;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eaRJ4q8VTN/kzt6zPUYHhxqL68VERoYaklcKsQPQfl4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbmTu6ERQN/n3s6ZyXfy2h1PRCYgIRstbR/tfH
 I83hjezuYGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW5k7gAKCRCLPIo+Aiko
 1ZCLB/9Uqvx73fSQsnp64ViiGIrTEjmQp5plbPcUl38bJ5ZnfVPbSYr1gDzOGBkSrqMbSX05kLJ
 zJ1nxmGXy6yMw6ap9u0weWRdCyrDv65je/5mmJ0zpLMIP0n50PlvGET6NKe9w0PhqdHISnxVX9z
 N0rMvM/wcCqh4ChDSEjso/x9YxjBifyUUIqya/ymHN9l3SikHu/FBkkkT7f5zdUdJexIMg/f+Ms
 dcf3ZzUVEFWBPoiFb6rMmynrFcoJdqQ3st5nDaaqzEG+EUFIMqNPpDWqCYPe0VE6d6wvq/t0hME
 AQVF4lm+ciXF+gFGwcXFGhrSQxQ4oCTPQ6/ZEyaQp4AK2ryI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Js78bc4C c=1 sm=1 tr=0 ts=696e64ff cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=P7DiqjX0Ympmi5YR3GMA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Bf_QNqswSHmKJY9PH0busz0pOg14YUpE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE0MyBTYWx0ZWRfX8IyQY8tKuXg4
 qr8XkMFYhURZ5kO5qWAo6jbdmH/e6uAV5RmJ7U76DQ8is+rAb+hode/vHZ9xqLu4+0wU9lXorMn
 U9hsj8p9XlY37s/ENfjb7/u3xuP0xB54Ibhv3jhfQTj9IN0ENPMEF/hD79jEfLsI/qDfDyhMZYr
 fKfDQ+09EvfCNDdMrKLbobW9aSKiDNem5NTZXnJGkfD6ze8L8JYT0Y8b6yXcwQYURfQjk1aZd57
 5L6FIpav0QyrRMWDcrC22h10S7oGuhE7KdV9rTJ/eD4UiLg7/kxVrji+ppC3GPcwom8u9N9COe8
 LzoBi2lH+LQ6kUtTozGOdJuJ+A0cow8RPWlk5uX/dkfZhdKNCk60Cehtm9goRJjL9j2XadrdezW
 Wr3gdiPTx1uZQIv//rUiq7I21cQLLNZgubdsgH71UPWTs8o6wSPMWpqLN+YBaD1hKtrctb9KgG0
 eLXMhZcXBg8JZhhtA2w==
X-Proofpoint-GUID: Bf_QNqswSHmKJY9PH0busz0pOg14YUpE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_090815_838683_9EE0B1F3 
X-CRM114-Status: GOOD (  13.65  )
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 66 +++++++++++++++++++---
 1 file changed, 58 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
index 74cb29cb7f1a..9e14f53b552e 100644
--- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
+++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
@@ -108,6 +108,43 @@ vreg_l10a_1p8: vreg-l10a-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	wcn3990-pmu {
+		compatible = "qcom,wcn3990-pmu";
+
+		pinctrl-0 = <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		vddio-supply = <&vreg_l13a_1p8>;
+		vddxo-supply = <&vreg_l9a_1p8>;
+		vddrf-supply = <&vreg_l6a_1p3>;
+		vddch0-supply = <&vreg_l19a_3p3>;
+		vddch1-supply = <&vreg_l8b_3p3>;
+
+		swctrl-gpios = <&pm660_gpios 5 GPIO_ACTIVE_HIGH>;
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
 
 &adreno_gpu {
@@ -197,10 +234,10 @@ &blsp2_uart1 {
 	bluetooth {
 		compatible = "qcom,wcn3990-bt";
 
-		vddio-supply = <&vreg_l13a_1p8>;
-		vddxo-supply = <&vreg_l9a_1p8>;
-		vddrf-supply = <&vreg_l6a_1p3>;
-		vddch0-supply = <&vreg_l19a_3p3>;
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
 		max-speed = <3200000>;
 	};
 };
@@ -238,6 +275,16 @@ &pon_resin {
 	linux,code = <KEY_VOLUMEUP>;
 };
 
+&pm660_gpios {
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio5";
+		function = "normal";
+
+		input-enable;
+		bias-pull-down;
+	};
+};
+
 &qusb2phy0 {
 	status = "okay";
 
@@ -503,11 +550,14 @@ &usb3_qmpphy {
 };
 
 &wifi {
+	/* SoC */
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
-	vdd-1.8-xo-supply = <&vreg_l9a_1p8>;
-	vdd-1.3-rfa-supply = <&vreg_l6a_1p3>;
-	vdd-3.3-ch0-supply = <&vreg_l19a_3p3>;
-	vdd-3.3-ch1-supply = <&vreg_l8b_3p3>;
+
+	/* WiFi / BT PMU */
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
+	vdd-3.3-ch1-supply = <&vreg_pmu_ch1>;
 
 	qcom,calibration-variant = "Inforce_IFC6560";
 

-- 
2.47.3


