Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A17EE01F6
	for <ath10k@archiver.kernel.org>; Tue, 30 Dec 2025 23:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAoSs1oY3j3/8c8jdjx6reTH0mrCMA4jyvduoT96uz8=; b=o+QwMhsOnaJfBa5+167MLODq9d
	6UzhpMpUbn8ggqjfX3h+lL7sWkD/v5rIN1TMeVLYKGhnFT0mcRTFrGuyy8ZhnR2QicxiZ1ESWmFBN
	6/mJG8om6s/EPmipXrS/8oPAEk+1uAyRUphNopaKxdLZmdZVZv6gTGOm3HfXmWtbgXDLNIz9U2S1m
	7F2kn6aqKys7lIqUgD/3IBbc3guM3YYm7PwV4a7wj6+BE2vNrNjTGwdstOdCUtpiIz6a7kHHYbe2k
	sa1Vjte2zkVmT0eySUTAlC0rqYHgSgMR/JonlPrkLlgP9Jhd9U7f+oXFVYiIxwF9uBq6tJQKy3eEM
	3S/0/zqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGN-00000005SF9-3iEP;
	Tue, 30 Dec 2025 23:36:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGJ-00000005S7w-3onT
	for ath10k@lists.infradead.org;
	Tue, 30 Dec 2025 23:36:25 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUMoTTX1722006
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fAoSs1oY3j3/8c8jdjx6reTH0mrCMA4jyvduoT96uz8=; b=N+ZrkBbEP+N+sIq3
	WGZOMdQwbh7LAwEZbSKmbkplz3RIKgws0FYwb6W3bAI2+yato/I2yLzxB4V97pfM
	A3UhYZtlUW8Hz3iFJvFlf1SnEc96fuTx7EooWbkNDrdffjof0RcIHjOBtAJ/MhjD
	bhG5S+FaIJOiIf7+4fIyxkFbJIF7SW3UYOpGoZckvgJhbljGEw2r40M/3Oyw9Ot6
	hYPb8NHeBenQpJK59vFyAEo7V1aHA5ltSw323jIm6iXaYisRf9BvIVSDcjC0p8HX
	iYfEoUjBka9+AxQJZrBGHomGeAiKL+DhKbimOZK8oqWs1e3ux4SgmygGlSW0jTUV
	ZW0G+g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7462cq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed782d4c7dso184055521cf.2
        for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 15:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137782; x=1767742582; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fAoSs1oY3j3/8c8jdjx6reTH0mrCMA4jyvduoT96uz8=;
        b=Hmhig8aSobaU3UN8A189/exC7SCR7DhkT/m6wiAnYrkgD29aPJqGqr+CP4+6TY08eE
         Y9l2mDcqQ3ngAOVAqORlBdMj0Do7cnKQbrs1oECU1vGxF36JZJzGX5UnLSJQiQPxInJw
         PNcRNcH9wX/wf8NfOFasHFh80H7K8ndNZp6fJiywcLhh7QSKV829jOI6QLuksNEuMnFZ
         3n4//GhbT/ukSAbBSuvaNgOMau26REj2pJkpDds+PdTnPHVllyMahl7pKLEKuOk5dyFm
         chU10mueAuu13xBJGfFcCHFpHC2u72ojOPNWE48n3yOyxFcp+8Cw6eq9SG9yfmmExSuE
         9Aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137782; x=1767742582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fAoSs1oY3j3/8c8jdjx6reTH0mrCMA4jyvduoT96uz8=;
        b=PbRHuxu6p4k53wCU6XpcgDkRQmWV+996FsKX5T+Qm1B611kNqqSzVmCh0fOeflDdTi
         CL7bfu5/s++BK6XHUMgJqrP38VI9pMmpr3segklpazh4bWLV59qSFr67Sr1ZP/R+UL3s
         1ufh1kBG25Z3Xw9EYUFXzyMCzBO4PylEKOlXrni/IG4kypi3nBlrbO5xEAynlcSonEs3
         KTcrdvXiMMGa6UtV9A1yBiJGZN1MX7R6etzxikGdQcoWsjrZ4yWSCrZIT2Um29d9SeVg
         SjG4jE5elokdNVM9qP1bvAbCY5k57hKOIzAsBy3hlrWhml8+3Een58wgukDQUdLzaTjD
         +elg==
X-Forwarded-Encrypted: i=1; AJvYcCWrZuPnlvWbXajW/4diKbUvw3qwDc3+lNH5i3TvBPZgjI0H6KkXtyeBOLFqkfrqfDHYriG5HdU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9rkhzIP9RwowUw6p5p2edlLLyQEuyXd3LbW82WhOz9smO09ix
	GhLcJtV49f8Cwio54uzes3feKaT9V9J2x+HGxMivS9cdthi4PtXTd56ZZ7PE9rxLv+lvTz+Olgy
	D8jq8P6vSLrQCviJjsefLrknW5/Xamp0aZ5KCR9GyhCNLTXMruNW+JyugpHuU3zE6
X-Gm-Gg: AY/fxX6iIYiLLS9+EkRBSF06Rd2RiuFfmh+P3Yukz5n4373HZMa4F6qtRZDP2HKMi0w
	XL6uVpZcFcFFV5veZn58gf3kkuu6PaQCdbUToABameTOsNGBvSAp2/ThX1eYBMRoLk9JU2b1AlX
	iFQbIM74k8gVE84igREzHOxqWm9UkMEtQyF7MBNc/8Yxw1eC83AqtjXUBvClt3lP1iJCt12z3nN
	2BpeCEncXiucgx3fsFlS42CP6B2wFlK3ng+NJfHGoCVtFX0AHf5Dja6WNoCd54TG2z9eJQY4raA
	O5h16L0D03iVsoH2E+FRj7PXGnw7YejrUkavArUsTEQkpbK1Oph2Hlfsbq0YMLU5GN7CtcVVyIn
	hqBa01hyrBfJBZ2XhP8tV1NccLocALnzrSRN4JYa7j3/gAKNfHsGq2poNaMOxXKMJ9dDJ2gLySC
	K0nSl6yYV7Np30QNI9x25kqXM=
X-Received: by 2002:a05:622a:1144:b0:4ee:49c9:a923 with SMTP id d75a77b69052e-4f4abdb66b6mr477095991cf.56.1767137782335;
        Tue, 30 Dec 2025 15:36:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkPqMdqJk/XCzk1e8ZyvUBpUaurMVX1soNXULfyOp66jtSt+yb9md0PSgAOZm8YQ0qjDZn3g==
X-Received: by 2002:a05:622a:1144:b0:4ee:49c9:a923 with SMTP id d75a77b69052e-4f4abdb66b6mr477095691cf.56.1767137781889;
        Tue, 30 Dec 2025 15:36:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:36:02 +0200
Subject: [PATCH 12/14] arm64: dts: qcom: sda660-ifc6560: describe WiFi/BT
 properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-12-1ff4d6028ad5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2776;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/qWwJPKoLPnWdm1jyHlJq/kGeX4sTHfpI9Ptnv3sGkQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpVGHlCjUGMHlkqkJafwLhwLJykGktOCOjkpAY9
 wWwhzlyFAqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVRh5QAKCRCLPIo+Aiko
 1ZqOB/9GU2/Bf/2GNGunBAoAKZe+gB1ID8NoQrA09/9ZRauuaoMy+dCCtYIDBM3vRl2CFb28OcA
 pgDJEoOPyMzCEfV1gSMyuD7P7rD/eHJ2v5lclrEGHrFBeR0ki/EalU6nNTUWWN5ygcKYM//UJXd
 v8QqOiqJ8Ztktem3BId5LhT4sVp6BsXNVwpJmGyqjjRbqL23k5ccCrYi27el/uzDpcWDkUscilk
 vt2LS8i70uf65bXCvZdd8rCTUojWi/nIwwpAxYRYUcDUb6bRbNO5co2pu3jppvt0AQtvI3mzjsR
 bNWBuTR3ETPU/KTXh3R5hBqGJsBQnFzb/Jz3Mspfy7Z6S74E
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Do9bOW/+ c=1 sm=1 tr=0 ts=695461f6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AhE6NyMZFPWiW_N_LacA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: yKFLPfPBKBO_IRpIL4kzozb_YMUptPBk
X-Proofpoint-ORIG-GUID: yKFLPfPBKBO_IRpIL4kzozb_YMUptPBk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfX03RoKjJCyVM+
 uxiUpn8XyR3vvTQpCCqTGVWtgiU8AZvBjTBQwNtAx/CM+DFr9Ts86f0t7jvOFSw5z2E5xlPqmbn
 4IfTaVoFmd5um/NOvhr7tTEHgCcpD4TFD4DMrBKNQEXKj+wjm2qIhsq4zYehj3SJyPXBcdGuj75
 WSBtuufgoVfMSpfgoHtFPV2cwaKYdRiHrlNYvnO6Ue3ASGKVwUguLYakOlhdKLoIMPg9SObdQ5I
 RD9OzKw3TafRrwyPfw1GWhDJ60XIOFZcz9i1b9A5h+xlNXScrkhicFnpcrHkV12pX2TTptQCw1g
 WHf9XgXPUJ4m61hmg9S5PZgR8BV3tUZMVt6XXSRsyHP/mC1+BqWntaUXNgvVyZyC0EmJwcS27Tb
 +jWj92Et9nzyidWcrpobLNBlXTw5cdKLIislpEohTFMxwAXKOzhaM0ROR1Xo4EzZ/ZbvJV5CZ8x
 22BLsVOlOTNBqqQwULA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_153624_127081_7BD15874 
X-CRM114-Status: GOOD (  14.04  )
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
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 66 +++++++++++++++++++---
 1 file changed, 58 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
index 74cb29cb7f1a..b4ea79cbcb3f 100644
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
+		vddrfa1p3-supply = <&vreg_l6a_1p3>;
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


