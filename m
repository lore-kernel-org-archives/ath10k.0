Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0908EE01F6
	for <ath10k@archiver.kernel.org>; Tue, 30 Dec 2025 23:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBwFc8aLDeICAZ3JQZO6nb8xlo5wDk574BoMUdPd5qo=; b=HeKRvma/huA+5ehI1EGC7gJWeJ
	2QqyvCG8/NwRtL8h+zxINtH8F4AoYubKuVcvN+CiOo9K5o7LnnPnENEVb1qUSIohmEvcworTb3qs4
	85TRmoGiNmmP3q0FP/VBseMceCiuu2Ed3dP1tOQarZ1kwuUJQ860PoO2SO9//wix4kh4VqT5LU4Cc
	S9XgKWA1WVGYwD+mOkAr1Q8eyfN37b4eyeHE6sgqmw60moLE7Mw6uPopd0IvLzXt1r6ZUJk8LE0rG
	eBzQN+tkjAqVItk6rmIWesQrOE8ZgEuGyNVfshpokhd0RhvRdf7shM5wUcE5/eBKLkd+zipDF6KKZ
	VfNqrR9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGN-00000005SEG-0oDc;
	Tue, 30 Dec 2025 23:36:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGI-00000005S6a-3CS3
	for ath10k@lists.infradead.org;
	Tue, 30 Dec 2025 23:36:23 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUAUHVp956496
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yBwFc8aLDeICAZ3JQZO6nb8xlo5wDk574BoMUdPd5qo=; b=ZhUesqf18kpP6RJX
	FKWWrYwjgZYsqsoYdnLQwUFgjDnjQIN7uMyAEoS0bVugV8KrAlpGoz5pGP19m351
	UEesBZvChNm+2qvoASvon+BEtahJPPfGN3m2S80u4W6d+f4ix+F+yz8V9hV7Holh
	3pvVw8XASEifxXEsCq3Vkjbv0UT09pFuIDM/aDF1jzRfYlB4bi/uH5wW51Olk2mx
	MGp/Bph5N1nF1ikWJexqsVfcQLFT4aIARJicf9UWWtU90i1Z9PnZ1851h6/J3BTw
	YkS5QKYyHtVWxFBVVRg7lYvSeu7qTKDhbNrZoXY3NzneMiNNr0c/nVoQhAFUVz3x
	NVdEDg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbqk1cd0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee416413a8so111175471cf.1
        for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 15:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137781; x=1767742581; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBwFc8aLDeICAZ3JQZO6nb8xlo5wDk574BoMUdPd5qo=;
        b=bQislBtFG/mxwHyPU6/6QG41S2jYmtCe5sbw8OfCyX/HM2DfQDaPZ2LFzZ68THYgJ8
         3M22TtSh79EWG6F4ujoqP7sG4QuItnSlW9eVN+uEacKlLAfQRYcmBUaleDgYBLwMUsRQ
         xgwnpiK/4v3WpeOaVzhLPGfjnSnjjlmrmVvW260Hk4e4eMSbahvUJoIxS3n+yQpPS0l8
         qcO/sbS1k3gb70TcLDAVE2wxvWcMXiVVIX7gMAbnDiZF8gTEQKQLIEdTRzF3Ne9URA4U
         9/B0yCvVFI8I4VaQL6KlRizO/zB9nBr5mu/9pQ3psIiIVJTWEiZGZQRr9ymJEU3J0lHs
         6KSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137781; x=1767742581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yBwFc8aLDeICAZ3JQZO6nb8xlo5wDk574BoMUdPd5qo=;
        b=dhuu+HSBKWCkEhu2a7E2ni2bt86Ngi5CvFw86USpVKSssvvGkUXqzgu8WMFgZ3bAQq
         WNEJXhpdPX7DmSOXvHGDgtflJiIWXHhA4rRgjWGmfgyxzHn6gYOg0+naHiG8jnYZiNoI
         6H1WCTz3FoTbv6sGabqUFB78hKxwaS+3X39U/1wbY8QaTxMR1uG2va+8cQCK/+W9HP+w
         +XFu2aGNrS82dUBpCNwSu9rEm7C8cD+HPvWB/XlZPZvSCZGOpTpwsaOjQL8rl04PEGnQ
         YaqldlXPn9fUUecB1by053iq3lEHxJQA5ZTGpD7xFmG95WodOVQTEGmNrpbmbSL9nrYt
         YsZg==
X-Forwarded-Encrypted: i=1; AJvYcCU3BkT+1cLR03lpSpcgcwKKU0NIxwAoi+c225CAggd1wUlmnKWWC1eP9gu59AhZnw7Bck+8LZs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBPDlCVbA6V3zne4whtk/hA96j1aI8HibP97AsOMqNYM+Oaznx
	SXvbwhfAI8jUc0Ud86ckk97IyPaKaIuxnlZXTKGc9JurZ4XF838YBuegJNfDg7q1o91F4QiOnmS
	aXTnxQLpMAgmIPfvL8mab0FeW8fSOiqhHKrvgNBNcwJ5zhIwaVVqkbbMxeHzCC4hk
X-Gm-Gg: AY/fxX6pxK3U/3G0YgWJj2X0Q4ZQNsso97Il8lTfBQRu5Zmf9vpZOJ8bEE7f2ltc88p
	Gv1oo33mXyDq+vc9mjraKZCQQoIGk3kV1viKkJXKhfEWaFFZdIuE8UyLvs1vn/RnWg14clhxcv2
	GLIV6Z+/wAqbLxw81/6v6Vato8No8Ir9XuMfzS4QL3vO3GcNw+NItemmdvUh2JfxMYyeQPC85vc
	T7h8V1ppmXeTkBA32zf6NtDquKLBkq5NWTrY+iWgFopFDKVXjNuSEU68sr77aX+p4CeKSZfcEnC
	CUM+7T40sLNhe3w8/ih+vOxdTt8D+Rlr4wqV4AypB1XnCW7vci1nmIvhUAjyot4X6zCDKac3PCB
	wEckH96W/YP5OLYtLP3nI06flen8JOrPdeAnbkIGCy3fCUSdNymviuhEIG6HTjFBVHjk10iGncY
	S69s7cSYz4QzFNo+MMJ0kp1ks=
X-Received: by 2002:a05:622a:1b92:b0:4ee:2423:d532 with SMTP id d75a77b69052e-4f4abce0824mr471951781cf.28.1767137781181;
        Tue, 30 Dec 2025 15:36:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFx/SYKuZWVg57DqMXeIylTkSzC4dXks9ZscJcuTRysFCAH78JLjOMFVgFClApXqQcqLSoAjQ==
X-Received: by 2002:a05:622a:1b92:b0:4ee:2423:d532 with SMTP id d75a77b69052e-4f4abce0824mr471951381cf.28.1767137780699;
        Tue, 30 Dec 2025 15:36:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:36:01 +0200
Subject: [PATCH 11/14] arm64: dts: qcom: qrb4210-rb2: describe WiFi/BT
 properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-11-1ff4d6028ad5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2688;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Xfiwra//zLSvKDun2ZbDRx+n9EwUzSsdsyZ+5gdIsp4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpVGHlGtsBv/9u+UkjlXRjLdVpGDSUR9SL9e9SH
 TaganuTQ7+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVRh5QAKCRCLPIo+Aiko
 1XQWB/0XGu4TFjAPBxjm8May0y5wOWD4HhP5IIrTPX8z3aPGnm6dR+Hk2JqDPX/llzbukU2zTMV
 ho3//Ab4h+brBn78kjakUfsTrbAuxWSVZd1YJSlEBIkuGim6mtlWo9nXGQk4QHw/f+fr2PWX3zH
 xj3kPBL25JL/xT1Y0+ZjBkbdJ7bBP5ggnhL2ZkbdZK0hnakyAQ6N/8/6K5EkTyw0zNd43EsUCHT
 sI4aFpAvNaHo/fKFq4yGdkusN/Tw16gpvqyMQf7FksQFDemRgh45OfSCdjzgRG9bebGDHfNxnjn
 9z1v2JIY48eB1zv2IJm+3bzIdmAeC/D29seb3xbnPcfxLHMm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: e7JmNQwU5pVEJ-1SGZuS0VRvi_s_YBEp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfXwvXZ1JeNBnc1
 1oUHKreSvwhXQkChVxvhC5ls9Zi84SV0xNtCzA/9N1f9uz6N+0Yh0gIGqhA5eUPa3i3U8/sqacp
 XOC66okh7aJnZBrRxzss5RXkvclpVbSpqFxlq5SuypP2NqTCMJC0VTm9l8sFydkpEgfP/Pfid0M
 ckpJkeQm8S6lYiYWEKTC3apBWGuVFwQHwlNTO6mUL8Qpq9zxOQlGyTb4CQ320LllJGtIL7IA5XX
 0rzEzHQYOTYEaI4GNRF4do7Z0w/wUqoK+QH0+gqQAeIOG4m0uopAKfTzitVmmGgcYfQGkTXDWCs
 B+0lMWxMi4ua8tM43azJ5CbhlK2wgO1PpNW3SBhR2unlXVppHy6CjcfaueKMImWr7YOga1WHZ5s
 IYYRUqqESdi1toPUgYiMSKLEvpn07+UA5k7XhZWwfeJQDQ8EufUW2NQCKsNTmmhtEKI0KwucS75
 +4VpGdaxnJ9DhXMHzdA==
X-Authority-Analysis: v=2.4 cv=Tf6bdBQh c=1 sm=1 tr=0 ts=695461f6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xd9rXx9432pcEdfSjoQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: e7JmNQwU5pVEJ-1SGZuS0VRvi_s_YBEp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_153622_847743_3D727D16 
X-CRM114-Status: GOOD (  14.07  )
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 60 +++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 5f8613150bdd..4e1b189dc9d7 100644
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
+		vddrfa1p3-supply = <&vreg_l17a_1p3>;
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


