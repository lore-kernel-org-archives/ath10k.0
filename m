Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA2ACD0427
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 01:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwsEluQ14kvyyo1kpLGYuEKcRxriDaAn9HIc9tdqUWY=; b=yuk0DPl59Zc9froM/u4y2Q9D/T
	+VPXqFj86qke3zuLKGeMdtPTsGm1DO/fAO9DViLbsgvcS5mb7Pja26fd6a0tbKLWuIPr+9UMraDR2
	8IM5Sipg0XQGugB4Kfz+l2KbqbIY6QGLGBN1KfJpAcxGNnWH8zuZXC0q4xiyNQLs2TJoeFtl/C107
	ulakmFIMuoFCfvgjDd8DfcuavF3WuxvnH9AFFks2c1ctJbbv6PJ+nZEFxbQQ2drbgnwjDq6O3DBnE
	To73wk5G0y0SNmFOcX2g1jWMrOkTfPMio+Dx/nRzJ1P044p9u7Cl5uSgeB63VSVxnvEOHkixVoygi
	HLaLqe3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvRv-0000000CHWg-0MfZ;
	Tue, 06 Jan 2026 01:01:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvRr-0000000CHVm-2XPz
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 01:01:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060oXKk2107273
	for <ath10k@lists.infradead.org>; Tue, 6 Jan 2026 01:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WwsEluQ14kvyyo1kpLGYuEKcRxriDaAn9HIc9tdqUWY=; b=MBPrWdRHhWco0L9w
	Wzhis6nlrn9HefrVu3jsK5KGssGZrmbr6VGnq8wmPBAnw3Vev3xPLgjGAKqMRLBO
	zK8fgsK7sYqhByJKhp6KvFNgOef7CzH5hetIKP2gbANqtryh93Q+QlG+yinNHq46
	stgiEpYe75hmYwkgrBqONiJ1NFIcqF5He+qC5McEoV4MODyGZW4OtVdeGqos2iBl
	jlLWZBxFvhRiVwtGYRyEqS95aXenn9bAGNHE7ptN1AtquZrhsq3xaP//tlHS8oAt
	3aZYwmvH0IrksRqGD+HS3j/ClMMIuvcg34bPo0gBCJnxGsfGUA7IdIHD9qy1xURm
	4dch3w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgr7380qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 01:01:22 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93f62c9ab4aso752440241.2
        for <ath10k@lists.infradead.org>; Mon, 05 Jan 2026 17:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661282; x=1768266082; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwsEluQ14kvyyo1kpLGYuEKcRxriDaAn9HIc9tdqUWY=;
        b=OPVYEr/pZ/b99Fj1umzdbfvBPeH8kSgPgXNwPlXzR1YOTgSu4P3xE1/Ndenc3yz/Fi
         X/Q9VwCaAEwD+9TVt7Cdix26r6YUtk5LkPwk4/aiZxTMdtnM5ZfujUX4O69jQ4r9rVOi
         NbTCD29Qs+dYrzGvgxeBZ2vkOMq3HrFeLedwy9Ip67pkO0vYE1/rCsxUO5tvAjyVsPF6
         ny1qWpI2DFN8WB6EQLnV6Qm45SxV3Offsl0EprKr90uGc/UmMnN/VDXBjEoJFd8Is0kV
         8LC5WzLcXXa9bHfLKQnuQs36kLGBKNVEGps+yWbelBhznyAXH+DJjhrK5AkjkvxtN9E/
         wF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661282; x=1768266082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WwsEluQ14kvyyo1kpLGYuEKcRxriDaAn9HIc9tdqUWY=;
        b=wvvD/avsB8uKfdqF6/vo6gI95MzQIRFGVuii42IBU64+lKuJC6gVSdS8yuOwQxEGVk
         1Kavw52GegRUHssOh5yK/Qr08D5lTWGSCh9VWVfheuGTgN14ifU9SBjMInnli57qWSjZ
         E3cL6u+uP0DZZPHyXjCv4mRnA7l9kyakBvwyv+VA6ps/7gTh2jXEnPjRoscruNbn8qXy
         BTQOedNCo5G11kHRNwtI1yPU7GjKPgLzcxiNS1Fuo29FO8VMadPjE8Prw5sMTE0tj97Z
         eADjznGAf6pYZ8oPCTDyiGa0dojzMYkKB+95ixVsuoGkjvmHtWoVPkcZe+zp58GXJnsE
         6PsA==
X-Forwarded-Encrypted: i=1; AJvYcCVNdktuXhijUmQFZ2sj6Nu6NPh78En3AwZKsrLrh/8XZBt5Ke7MkvLTV/J8r+YF72iuMr2xVVI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ1cjYpSh21zX6Ma+geraKQqqJlu1M4rIkh7YOxFmq0ynux3LW
	ecxqZG0wtcQAh2uMqHV9pljD/Ob8mOCbstFXVAv1jIKl4lCJxXQ0+4FEq6nzVK/7bYX8XG1Ldiy
	6uMmEoYfFAt4xlo8rh1yBd1jRqlSiptta8Vin4+nMUr+5n8lAhgYcn4u0WmEOebaS
X-Gm-Gg: AY/fxX5gS7GlnJVGBwu9dMywY3muy/1WnE/0+gNmMMoOkoEgPLVALqg72yOGRgxLySN
	rVrCNXiADuHfGWSzDxWmapWNRRYjt36Suj+Lc2jbV5bzikhFaBTBFfqNtODFM0cbavnP/TR8x/f
	/NNZzsM+moC3BydZRVkpjoIV9DOxnRko7KWFFxnV1cnBK5h+sbiA4pzwtw8ID8/12PGHiFrkVqH
	h1mB3mMwJW12cJOA8YU4YVAN+yk9lEiYF2kCFWf5Y1BkqaXWdsU8/eDNL9dPO+yyqTMNkZ+gvtZ
	Q47AHqdDFSYP+eWAWU3oSi6aFTzQgIDoAM+J3EmSE4nXQa8F4y57X7S+/tCDtMleP1pGjebdnio
	u5Pa23rek/7kKuQmoLE+g23j136ZjOgrv6Kc5zsRF8t8rUnbUrkpGkZmz0DDpIxBP2nhk+eM6Iv
	CXzxv+xu/IWl04wJOf4fU5Nwc=
X-Received: by 2002:a05:6102:2c0c:b0:5de:db29:5c07 with SMTP id ada2fe7eead31-5ec74374a4dmr390666137.19.1767661280486;
        Mon, 05 Jan 2026 17:01:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTMyPJnKFkiDK1RC32Rqs91GGXh4vJyLuMHRfMmaOQNSZheCMQ2vOq/C/rF03ydAJzzHnqhw==
X-Received: by 2002:a05:6102:2c0c:b0:5de:db29:5c07 with SMTP id ada2fe7eead31-5ec74374a4dmr390644137.19.1767661278503;
        Mon, 05 Jan 2026 17:01:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 03:01:11 +0200
Subject: [PATCH v2 01/14] regulator: dt-bindings: qcom,wcn3990-pmu:
 describe PMUs on WCN39xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-wcn3990-pwrctl-v2-1-0386204328be@oss.qualcomm.com>
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
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3229;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+qQ1M2lLHUY9VOnTAxKFSWl8p7pJdw4ZlpXlukoKYNk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXF7YEuFI1nPjM70ASOG40vYKExegfcu1r/tK9
 2GnG/rfayaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVxe2AAKCRCLPIo+Aiko
 1clWB/sExA7rsq4oLHQT9hWULFIGtTpyJtnzQg8pR/3v0pSialanL32mFSrGGXJosXZlMSADkQS
 jI745zddSU4ZO4i/OOOyGFHb0DkcxLhZ1sOqLV8CPnN6bhXLcinlx45zRgV/2GiUOzim62Uy9tg
 DQeCbnZALFYDl4mbp9KwltSrvokRQa29qO8Yigori7j0CGma9fghC1WAw4ihN2fh3YokfLARbeq
 oJX8E+iWvckASgO1ogQz08Wy+PqnU3QNwRbYwbf/9AS+OaleQ/APJCH1vhJpVnd0fSM+Cib7tor
 ZEhQgg3xvYypLZM5R6ZpjFrtH9LOg872JKLO4tGSMP0HA05l
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=QrxTHFyd c=1 sm=1 tr=0 ts=695c5ee3 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Ged_dzZm240b16LGnFsA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 8owD6lnZYfIfn3gk-W6vrMFbj3F4a2lU
X-Proofpoint-GUID: 8owD6lnZYfIfn3gk-W6vrMFbj3F4a2lU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfXy7Z36JDG0CPL
 WfBlcTRULZEnRSjYqE8uGzmyFeUKzHrmA0T2q3BoPBHW1gHzEqpHYAYoYcRG4LX8BunOPvcxNSo
 iQypl8raDXzir+amTV2NuMmnhd2Mg+ntP1oDEBTiJGQ6zd1VYXEboXKrvB0nNJNMCYnpeHKr8Zi
 H3ptWQOBZea2C13prjOUIdaju0Vm0TfZ6fpcfabo9gEbHDqj4YgF7R34MGfqB4jq5EGs0zLwdxX
 qexJg7svQB4znGmfMzjFqMuiWpvDd68Hohccsn+70Kh8UfPhOzAsCTcQDGRhI45orG1bDaKgqZn
 zDZxVaujQ/LwLYy8OGwNcV9I/oHu3fuwvupq3xFTTdCsGycz0ye8rxPKTtERbznrFhqiusaxu+U
 0U1xd+RUK1PPruYF+YwX/376tUTuw1ySD6O/Z4wYfudhjMH2XgsvI/ypq8qYrHviOCMD9iyAI+C
 0fcCfdBIsRDYVl/sLdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_170123_653587_D3D08846 
X-CRM114-Status: GOOD (  15.45  )
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

WCN3990 and other similar WiFi/BT chips incorporate a simple on-chip PMU
(clearly described as such in the documentation). Provide DT schema
covering other Qualcomm WiFi/BT chips to cover these devices too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/regulator/qcom,wcn3990-pmu.yaml       | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
new file mode 100644
index 000000000000..9a7abc878b83
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/qcom,wcn3990-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. WCN3990 PMU Regulators
+
+maintainers:
+  - Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
+
+description:
+  The WCN3990 package contains discrete modules for WLAN and Bluetooth. They
+  are powered by the Power Management Unit (PMU) that takes inputs from the
+  host and provides LDO outputs. This document describes this module.
+
+properties:
+  compatible:
+    enum:
+      - qcom,wcn3950-pmu
+      - qcom,wcn3988-pmu
+      - qcom,wcn3990-pmu
+      - qcom,wcn3991-pmu
+      - qcom,wcn3998-pmu
+
+  vddio-supply:
+    description: VDD_IO supply regulator handle
+
+  vddxo-supply:
+    description: VDD_XTAL supply regulator handle
+
+  vddrf-supply:
+    description: VDD_RF supply regulator handle
+
+  vddch0-supply:
+    description: chain 0 supply regulator handle
+
+  vddch1-supply:
+    description: chain 1 supply regulator handle
+
+  swctrl-gpios:
+    maxItems: 1
+    description: GPIO line indicating the state of the clock supply to the BT module
+
+  clocks:
+    maxItems: 1
+    description: Reference clock handle
+
+  regulators:
+    type: object
+    description:
+      LDO outputs of the PMU
+
+    patternProperties:
+      "^ldo[0-9]$":
+        $ref: regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - regulators
+  - vddio-supply
+  - vddxo-supply
+  - vddrf-supply
+  - vddch0-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    pmu {
+        compatible = "qcom,wcn3990-pmu";
+
+        vddio-supply = <&vreg_io>;
+        vddxo-supply = <&vreg_xo>;
+        vddrf-supply = <&vreg_rf>;
+        vddch0-supply = <&vreg_ch0>;
+
+        regulators {
+            vreg_pmu_io: ldo0 {
+                regulator-name = "vreg_pmu_io";
+            };
+
+            vreg_pmu_xo: ldo1 {
+                regulator-name = "vreg_pmu_xo";
+            };
+
+            vreg_pmu_rf: ldo2 {
+                regulator-name = "vreg_pmu_rf";
+            };
+
+            vreg_pmu_ch0: ldo3 {
+                regulator-name = "vreg_pmu_ch0";
+            };
+        };
+    };

-- 
2.47.3


