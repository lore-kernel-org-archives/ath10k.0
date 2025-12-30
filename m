Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F72EE57C7
	for <ath10k@archiver.kernel.org>; Tue, 30 Dec 2025 23:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2VC9sljONxXySxZ5faFBLsjMd99t8lT05SJh169vrPI=; b=wfFrkoTaBAcD//0/FlP/95PZUN
	5v8+gUNufdvAOTqDqjyA+q3JAA+Ki9YDBFrFPOmy9yTqeeeo0z53Xw+U7hAXav+kFqb5RB7f0jzgQ
	HKG91rldT3tWe7D63+GyAbrtCoHcDCDJxrUTpxFn7Y0po8/v9uNQ+5DEbjKLwqSXPzX106NqBvzE/
	qWLXe5C14sx+sz0Oh6VdNMfUwuzTe0f8jUU033GwjceDUsfNBHS6rBKI56+/27uLbpvU34Q/g/W3Y
	2+UzMslEBnrvxSc8n15544fAP2ADX+Jjj+WBvp+1MYWFmsp2F84NRSBLR8czkDPiO0J+dCf6QOJCO
	RLciASAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGA-00000005Rw6-0wjj;
	Tue, 30 Dec 2025 23:36:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajG7-00000005RuD-01OY
	for ath10k@lists.infradead.org;
	Tue, 30 Dec 2025 23:36:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUAoMcm956302
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2VC9sljONxXySxZ5faFBLsjMd99t8lT05SJh169vrPI=; b=RGv1zx62vhDXAxbK
	HyZp6ZQ/yYusA2BBaz1JYdIYGN6G02a/zx5BDhtpC7mwOoHflT6KB8ZKAbHXsmAe
	MuecGDOOs/aUlA82l8mL7tle68UiZcDenQMyY1H+fz+nJaEeh7RDLaJbKS2ez2Ix
	LtwBpYuMyTS53fyODFn0jU8R5gaqZWG1YfMKO3UYHj6JBHkpa3tD4Sk4z+LMCeiD
	QEVVDbPMZCHj2MkTLn7vC7FQ0zkqxeYMwGL0qnondUw32tJaDkxfVjuET/95FePK
	h6ff/z1CSIFoirlhj7mkDVEjTlSAcyrl/pCy55KAYY/NWQphD4x/OO1IUrF3Ry9V
	sMNwzA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbqk1ccy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4a92bf359so236068631cf.2
        for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 15:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137769; x=1767742569; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VC9sljONxXySxZ5faFBLsjMd99t8lT05SJh169vrPI=;
        b=VzdQ7F3bWui5h8PgjrrcFKVu2W24n6wAW9gZWzDH7xqJRvc+e2V7g2oyFXz9jZfaiz
         gCmJUmieFEo55KXkyiCVyBFFSrCshMRKly9u5vOWRuc/m2iOEkmhYF9HEWPrihmnu4HX
         ZIn6FYD0/KdA1WATuS6pOv1A13MTzR4zg9EH6ylgxPnxYbLd8lDTOca0n9hnvjM/Ekt5
         71l8LtRbEd4AOB9qC4R8VlbUUsGCpPDSmsNTt9g6+s94YMmt56etzglZC1F0OQcHlwp4
         Zn7FfRCDLjQcJqGVnRF/RtE9qVEPxHPUXbBVm4XgQkQB6jHRB7yW2+X4glk12OFx7V2f
         H2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137769; x=1767742569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2VC9sljONxXySxZ5faFBLsjMd99t8lT05SJh169vrPI=;
        b=WknDgw1KBsrohKnhNY6DnEGhXeNizFjFYjSP+Sw9WL3rj2KQInhNf617l17rHcxvr2
         ifEBpGqm2AipnjEzj4DXVJKfAtahiQtpREiO9CNP/iDTUmtoKADT9+7Mz7FnYpwgMrgN
         gKHpoEBHpCH6+RiXd7g2Hjg+KMc/4faZgnaK79rX2EEz/alZP0eyZs6rlUSOebEF/B3N
         OtpkwVIz+Db4JbRwu48NlM1f9Oi3ZugE/BjHxL9n5aj4WYsBOwtB7I1/R7+AwR2ec0fy
         yz9hYkDFclrV+NVhuZzw/0jYzUqlDBDfVUcatNzRqoUejKzO5xijZ48S8nNpUaLuuy7O
         brzw==
X-Forwarded-Encrypted: i=1; AJvYcCVffTYMa4Fd2IT7L2aEVTMDufGiMcbrb2RQ/+ogq+CNU7/9prIM/7f6KowV0JFVRrqy0rUh8Tw=@lists.infradead.org
X-Gm-Message-State: AOJu0YywRjUrqC7N30yZuP+nirJFgsfk7LTpRYAq53G62124NX40WIDp
	wJettilzVMtIQ6B/snvs5SPD3ff0yFB4OS0cKMv83VP7a8w/vlr3HJy6K19Y3fA9ON/UDXocQgz
	CXUOYQ4YSSTyN9miIXfosL1H/YzyDPPPBKBm2y21p7GvxtYFYV+np1UZCI3A+Uvf2
X-Gm-Gg: AY/fxX612ruNkc/gmiHNl0XLIz+jLOTBjvQtBXjdvWbYYLhGG8zMigYtX2OKK6+zZXD
	4JiS7FhtxsDbS29MHxhz1uw0thrut4E752bL1A8nDAANcTQD+tLLBu8KdRYRwJ+FgsbVu9ibSb/
	8TFgvw6OlzH8bUCnRqj4bb7qK+kF2CRz7fokqqybWs/z7kV633NCKcxq47b09RcyYGeqxjTT31U
	hTfk1pzdCXqtb+G6Z8I+fcHGQXdmHTWUBCFAOT05jx5NJ/KnIQ3fnP6fGizbRsq+Zro2kUb0bMY
	vGyKKNIjVKQcIF1klKhbz4pgpBMNcDLXkXNp/+0Z4nbFcrHDu+KfTIZfkNwLNsbgEOJoQMTMWiE
	PjIjGUqe80InzD+okXTyVdNn3y1HGz1lNfULyWbmqPjLweCFSuaFePOamjPev1yHexwV7poUS+o
	yCt6wPfJMO8PnOEDwUVrz/oys=
X-Received: by 2002:a05:622a:7506:b0:4f4:ee07:91b9 with SMTP id d75a77b69052e-4f4ee07921emr180398161cf.47.1767137768823;
        Tue, 30 Dec 2025 15:36:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlBVfMEzLDzQI3LEOKbITeufy2b4hcGo237iBWEci59bAC4PLtF8ByBtf6K2+ozbQJPRmFew==
X-Received: by 2002:a05:622a:7506:b0:4f4:ee07:91b9 with SMTP id d75a77b69052e-4f4ee07921emr180397771cf.47.1767137768382;
        Tue, 30 Dec 2025 15:36:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:35:51 +0200
Subject: [PATCH 01/14] regulator: dt-bindings: qcom,qca6390-pmu: describe
 PMUs on WCN39xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-1-1ff4d6028ad5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2272;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jfQ+/qPGweFSmUYX5ResG9wJ7q+g2knAiJRbFI0KjZs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpVGHj1fMH3UB6gpXfhbLP8H2wwG2BrpPCWb2KN
 W14PxzmW4KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVRh4wAKCRCLPIo+Aiko
 1aS6B/0WaxFzceLPR9rYkNcOBfiwsm3KXXTCqJFMZCoo7hzgtl31MTKK1YmnJmrglbnTplPzDaq
 Pyu0OtP8hln83ySBB0iANbOdhH/AgCV0aO1b+W1sp5lBpmrylJ6Oh8ruEnJen0A/eTE1NIDDPBH
 hISbmUKX7ppK83kFZFin4NwSrcY3w0WXP37WsgQsh585d77vqaYfjmXOwuX5Lf2gUSThmG3hPRa
 fey+VdGjt/g1yKHvVHt4Q2gfJ2dwTE8eSyTDuER8B8tNqyGkMMwaqf1JDVOVJBzUqXDKDVNNtGC
 IiakNaP++kNmYQifz0jHznau96e65Bq4orSg7400+Knic4Z2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: DsTyxkxedfCdP_daY4cJDXaRYzWny0HD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfX12xkrhLRhOH4
 6lXpW4h2MhlTUGS3VT/6rJF0fOyapu23vkVTRrtoVuUjzjdwlQ1ITEg2JHvm7kZ5a5Wa5wuexOP
 Quqc0Dz/YRXChAGfcSmmpiLrJtood7LhhvSnva2vr06WqQ7KAVfOO2E6MSvlbP8ITR4xaz+Q//p
 mo5MUIfliZmwlc4Wi1VZQ0yjZrGouVcjjrFWhC2FtuatYB7zIIBINhvVXtV8IvVzGbpqPEks6JM
 W8FKoFDNNvb0cEfHkTHL6DuA9IqQoGEUoaOKOitXSC+FQD9X8Dnr3SXLc5bmO0fsmzFh2aVIuUw
 jOrVNp8EO0Gl/nTdpvV5nDB5ehITllcphYQohbcSz9pT02Wlm/YKJBUVrpm4phP3aXttgaXl7ul
 XZNZav7ITHKVnh+Kc4QMEV1OKXhU7q3UvKjPNnyI5lM61hRWFqHerlwyGZPekt1Horq6AGYypSS
 UzM98yiugQ9MhOIs5RA==
X-Authority-Analysis: v=2.4 cv=Tf6bdBQh c=1 sm=1 tr=0 ts=695461e9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FaKla9bQ5TyOH8GUl7IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: DsTyxkxedfCdP_daY4cJDXaRYzWny0HD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_153611_051524_14279F69 
X-CRM114-Status: GOOD (  11.55  )
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
(clearly described as such in the documentation). Extend DT schema
covering other Qualcomm WiFi/BT chips to cover these devices too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/regulator/qcom,qca6390-pmu.yaml       | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
index 47c425c9fff1..dc88523f46f8 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
@@ -18,6 +18,11 @@ properties:
   compatible:
     enum:
       - qcom,qca6390-pmu
+      - qcom,wcn3950-pmu
+      - qcom,wcn3988-pmu
+      - qcom,wcn3990-pmu
+      - qcom,wcn3991-pmu
+      - qcom,wcn3998-pmu
       - qcom,wcn6750-pmu
       - qcom,wcn6855-pmu
       - qcom,wcn7850-pmu
@@ -76,9 +81,18 @@ properties:
   vddpcie1p9-supply:
     description: VDD_PCIE_1P9 supply regulator handle
 
+  vddch0-supply:
+    description: chain 0 supply regulator handle
+
+  vddch1-supply:
+    description: chain 1 supply regulator handle
+
   vddio-supply:
     description: VDD_IO supply regulator handle
 
+  vddxo-supply:
+    description: VDD_XTAL supply regulator handle
+
   wlan-enable-gpios:
     maxItems: 1
     description: GPIO line enabling the ATH11K WLAN module supplied by the PMU
@@ -132,6 +146,28 @@ allOf:
         - vddpcie1p3-supply
         - vddpcie1p9-supply
         - vddio-supply
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,wcn3950-pmu
+              - qcom,wcn3988-pmu
+              - qcom,wcn3990-pmu
+              - qcom,wcn3991-pmu
+              - qcom,wcn3998-pmu
+    then:
+      properties:
+        wlan-enable-gpios: false
+        bt-enable-gpios: false
+      required:
+        - vddio-supply
+        - vddxo-supply
+        - vddrfa1p3-supply
+        - vddch0-supply
+        - vddch1-supply
+
   - if:
       properties:
         compatible:

-- 
2.47.3


