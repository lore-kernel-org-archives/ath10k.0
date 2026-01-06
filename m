Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A63CD0427
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 01:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNtdH/g1thI0zFb36R8TFQlQFWMJol5ad0xi+noohvM=; b=nou3HLQ7cg7yizTsSEhWbkLJKZ
	uKsbk+/rDVS0M+b44n6jGmF7z98csktgOEawrHoy5ONhqQvkj5y5yXFi6hLBq0rTygkHe0VyotW58
	9dx9pf2MwkmDqLn0E5uADbST+QqeKGFxUGYxlK7EZwl/B5RUcObF4DLlobfNDgvmhefWN1Dr+zw/m
	vxOaMsdvZhfS8V9t2s5LQLyO94pTgWTC06fkCf6bxOVOqCjxLstdNDvTD36ut0xB/ZbKA4UltrtF7
	q9GFCWxlkbb2x4a3pTWRKeLUJq/LMlSib+lVSbfW5UEgqAdMQWITncFr13NI0LM/wbu/SAqTG/cHF
	s+2FeyIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvSZ-0000000CI0y-352B;
	Tue, 06 Jan 2026 01:02:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvSM-0000000CHwk-30GY
	for ath10k@bombadil.infradead.org;
	Tue, 06 Jan 2026 01:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hNtdH/g1thI0zFb36R8TFQlQFWMJol5ad0xi+noohvM=; b=F31IYhysmaMh6NpC+jg9zWbBqk
	U576c9pKYIpHNLMSPUoe84X3FqF+HGpjWesykCaDtenV4Uqr8UmQV20/SivxK/0wc4SkQX7fAStzs
	zrqFfA6JzYVBgQYqGwaM3VBG9ZobwBBFYDHwSRvo1lME6TN2iL2Cpaz1I5eOSJkz1Isl5tCvCznPs
	hRXu1xuciAeluMwOjIM2PxFYTpNN6jzMnL6OxsY+7+LVR780xdhbDvk8tTu6Iqb8TuwOwHSvw0YHV
	JvyLM8e9/lio7VeZQawtEULBbuqGOaaS4PTI2lPSUNyg4B0CuGqL72G04Cbtmu0VeIGrHhLA6tfAx
	cggAKlrA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvSI-000000091bd-1WGE
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 01:01:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nOgq2969901
	for <ath10k@lists.infradead.org>; Tue, 6 Jan 2026 01:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hNtdH/g1thI0zFb36R8TFQlQFWMJol5ad0xi+noohvM=; b=pit6LujAer/2ESuy
	Zimq/qezG5k/2oy/c2vSCk5BYMvSBqT1+mKtdKXx1YQ0qGavnhL3Lzqu9a5gqBWH
	xRxtZl/aWaWwEXer8iyVaeVvAIsVlo+xNZ2YmVNOEZ0pQrP4uWWJ3KRHsAIapzfl
	VOpYtO48EErtPjhn3Vq4JYM/Elhouxn9dq+pD0m5Yo+xJA57jMzq2H27UvzjoCXq
	yFGjlv9kuwK7FpYWt+nwDLbcNb26PpMoXJOTxLL5npSbmR3qg0s6NTOZHcMEPx7k
	TkljoJIGfl2qfuFHf2MmXtC7RtplW8hViiC3S2L6UH5WFZ22EcVl92lrHwkcZV/G
	6zk0/Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggsvs7rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 01:01:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed7591799eso10198371cf.0
        for <ath10k@lists.infradead.org>; Mon, 05 Jan 2026 17:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661306; x=1768266106; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNtdH/g1thI0zFb36R8TFQlQFWMJol5ad0xi+noohvM=;
        b=iuoNGAa/9rgATge9CL1tRdP8pWMyDMrmzSGfpbm1gR+HIKBQKPjWtb0ioDvBMblaqb
         LWcdUGtmEQxTPsx+7dG7IazaqtVUGcw8YP963g2VLqZZvelj7LV0bVKxkSn06+enjw0Z
         W2An31LnJ/O0enzPChPluJreHkFhlqB3j5H1Ua6BEFG+3+DN1IiozfM4YuFmWGN65Pk0
         4Cwzv5KG1yYqpmX4chPNxmi7t/hCcoKjB0nOVLfdjY9NDMlRn2MTRs3gbhJUvcLZ/f4u
         yU6DPTUitCOY8nBAvi8sz7BQ02mfH3v4JGBcbBfP3/aWGuKt0L6JPxrDsDLYgkt2FPJh
         o/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661306; x=1768266106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hNtdH/g1thI0zFb36R8TFQlQFWMJol5ad0xi+noohvM=;
        b=i+BD/UzsmFOvIXOhS+zXhn7wI2H6BQkR6+WnpySDlDEgfUrb6xz5gHe7CUJjKBSNX8
         msUDuEVnS9KMu0o2+8hQjrkaf9Kxki50gJ3w0JfFi7bWICWXpVwLM5X1Kjyh0JV8gPgA
         LQ277DvuGUOz+q/Lu3GF4fnYUteeZiUyknXPB6ZYqt9tdLXpsj9paB7WhtKi6uj9urb9
         JcXBUJLjFVi9MP4ag8k5FBq95qZZD5n4yE3qDIRLELXEhujKpb+5ARb3I9AQhLEfXRKY
         NM+1mNEq9EYKjaU4YtFUexzdWAGcGCV+SHLKdqGkKxvrGnFzIpmMYAoTuHM0yV5wJInd
         HFNw==
X-Forwarded-Encrypted: i=1; AJvYcCXeUPqhFcqQpi9V1YcJe9XYIltMzyeumKOM7qnIllETK6P0vmlTyP8rA2xDMC1axaM01gqiLng=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkz0NXe7cI0Ak69/JyTmraN6tf0o3qDS/d457Ebvu7CMmpWuBZ
	SoKr65mINvIPdBhDdnO/7fEeQQVspN7niuyLQCYEWr1uZBG/NiQNiAiWd7fZ6Yfb67EQsHNdSlH
	l97PMy+imw1Wa020I9Bd0affBbdFLxtjWY4ZvuwV+dz76xZ5MYIkwuqWG/RYT6ipQ
X-Gm-Gg: AY/fxX7E8SXDjnMr9ko333okz2ysxViJPvESiP23xIHco+cp+a6dwDKnwjSfR3d5dkF
	J1/cAyE0Z+p3xtAon9iphJa00HSpJwBgo70ddWr12fC21qQF/QY+xreH0ImlfiY3Xo4jw2iqkzk
	37zc9sujqp5ZJ58CrW6gpmAyRG2j96wbcnBOjwTPNU0MmPgfQmx8VcPAoZbss5g82uFNKOkPw9S
	+vk486qWgp7ZYec4Spipl1wftzITsdQtrFj2Y78YJG4OBxPUxovm3AFYEZarrQZi9H3fhjKYAUB
	A3NTkssrmCfMFO0SvUe3IkXZAEyxjiRDaaFD8FmIfZV6FLb6TFFPFLdomjvh/tHMhr+O/xt3CtQ
	CHCcrfPTZ9MFSeE5Wg8LVCBLGvdynvGU/AWl+db9baD0Se0ZsXNMwdIQgNV7VkxNysHvsWJPgIH
	HZUQQdpEin1BdfQgu516Z3lYg=
X-Received: by 2002:ac8:6909:0:b0:4e8:838d:1992 with SMTP id d75a77b69052e-4ffa77f6357mr18671931cf.63.1767661306334;
        Mon, 05 Jan 2026 17:01:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiJ9YV7hLVUzOsZzbREsApzq5gkYftRNiosFkV9YRWQP5LVzLU8YVPsodno6kDXyTy61UaKw==
X-Received: by 2002:ac8:6909:0:b0:4e8:838d:1992 with SMTP id d75a77b69052e-4ffa77f6357mr18671321cf.63.1767661305866;
        Mon, 05 Jan 2026 17:01:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 03:01:22 +0200
Subject: [PATCH v2 12/14] arm64: dts: qcom: sda660-ifc6560: describe
 WiFi/BT properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-wcn3990-pwrctl-v2-12-0386204328be@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2906;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eaRJ4q8VTN/kzt6zPUYHhxqL68VERoYaklcKsQPQfl4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2ZM3K0MiyyWZQoyrySdVlyoFD21l23p3v8HbONupM9O2
 byYcfb9TkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMxL6P/X/17wWbfdJWzRC9
 krjia+byE8LWm5wfaISwldw55BeXEcQWFq4e+sgrdZLg0zzB5+KMZq/XClpm59t5VogKLbhX4D4
 rzdhE1N2B55rpLpspSiXcbcv/+fRMdnggY3O2v3dtyewZ7Uf3J3dLVZ1++oij5IGPFmtD6sKgcz
 tXiLx9uTCSLeXB9JzSnkRP7ZpqlmZ+/hmPTSbcZnu67ZyxxUXj0/lqAfJLHUJ7ZM8y3++8+i7Gs
 EnPQ+Bib35eaNcEkem+zhvlLPo/m8w58SGwvdP/zlLWn/+Vfp4/8FA8LikgyGlVe6iZt8mND7mC
 fMyLTZXWLO9+8OruR5dlEb4tDqVLQuPO1tSI2u2o3HwJAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: vVkOIdE3Ra1GpVkFh6Pgdj2b50klsdEU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfX+9u7o/V6fz8o
 9EXIYfWDyAEPbq/qgsOIWY/MweINmSbtSSJy1yy6eXYRkWF0bratQDwizn8Cy4QIUiJwOsAo1IU
 9Um84k3AR04vCdPaCTq59m4jdtbLBih86N81UZIQ7dOmTm2/fVRPZUiRBb3E+kEmkh9y68i/aKA
 eXkscu0e1PkzOJ8MbGHonlDiTatuqh7YBRyOYSmQzdaIwmbiAi3eOxrQbNVqtUVd5lKs/QvGkKr
 kh/FQ6pNX25IHfyBb0g0xwfoSVLcUI7775EHdLFT29TvK4wgdglcDCufADpf0tqZMW9ipv38p9V
 aG8L6s6OoWiOA8+X4W/nnWVDOvRrGQTVi5D9E14df06xhw2e42ncByfAmEdSFvFKfUnpq/EncHX
 0/Bl+QlRnmgLmV7+2UYrsnB4Hjg7Y/bNctntuhMyH+W54N8d6DrunqXZYVR6FVtU4FrbNYFB7kk
 2ZgxJWFAKNJeekJIMrw==
X-Proofpoint-ORIG-GUID: vVkOIdE3Ra1GpVkFh6Pgdj2b50klsdEU
X-Authority-Analysis: v=2.4 cv=Yv4ChoYX c=1 sm=1 tr=0 ts=695c5efb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=P7DiqjX0Ympmi5YR3GMA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_010150_858281_BE4F990C 
X-CRM114-Status: GOOD (  14.26  )
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


