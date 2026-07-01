Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D58C44500
	for <ath10k@archiver.kernel.org>; Wed,  1 Jul 2026 16:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=; b=LbYGQiZq0KAzk1K5gZhlf6w/F5
	dqXRVsdBRFHL7DkreDQClzMQn/a4oIn3hCmkK4eKGFope9NiCM8YOdHMcV+y7PfMARY7hsai0uI+s
	AohjN9Tgq21o/Hx2Ry6h6sRGdobIMJUfAFZ35CL+NsrkLGQv4Uh/FuSpxFe+h8kx73FAefGZ+/O5D
	zPDErrMJPBb1zhDQIBkU+OgyKzLSwny0NNK2jXd6/8Uwk2AV6POGr1as+cWpFhicavKyCX2a3oxXY
	OW+lMeJb/vz29kGXY3WrQ8Xzg2Z3XgesTf1LOL9EfHgxMlsaUlC43s8/Nxeiko8/ijdApiOjcrRNd
	gle9+6Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexMh-00000002Saq-0fyx;
	Wed, 01 Jul 2026 16:00:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexMe-00000002SZB-0ypg
	for ath10k@lists.infradead.org;
	Wed, 01 Jul 2026 16:00:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoBb01513121
	for <ath10k@lists.infradead.org>; Wed, 1 Jul 2026 16:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=; b=HRY1uaTeGIIRXKEL
	6wsaDKZf2cVplnvu8A7vouedWY/oJZ9OBdObNQEd5NXv59+E12gXEZG2Pue3jodZ
	Bf9nuB74OOOyxq3OY8Jnt8//r1cOb5bzbB87nvHHzfO+zPeP+gIGxBWsXvnSGkOB
	2sC5Leun+VnKFM05qXn0uwb/uc/49eaUxgwfH6B6lFtaXTBwCCWPZQsULNVLy1It
	7+iLF/bWx4bxIcjYIzCL94f3uW4Vsgk9mMqVs2JtjJHf9HuhdLux2WDTPsfCyZ6u
	1cNFycmRWxPCwad87+4Sxcdt48EMG54PciKP0BCWCVCgOYX4Zt3uVLYeRRwTEMPg
	qjISzQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwcxpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 16:00:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e663c29f2so101962685a.0
        for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 09:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782921639; x=1783526439; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=;
        b=VDYyIe6B4GztA/jnsPQrJysGmcmmHNVnWiDE5iyqAPWrrF3RKV7AkriC2j68MVekWK
         sie4qkeH6trsUNze3ZxpxxCS7VtbEQd+/0aHX4jBYMsFE7yMjd6x/7etFlpDSwvUI6vh
         rJAeyN2uXH3A4U3Eh3WJMfbCckW16Z+bDP0a6eVPA16sMHU25/gJjJpyxT57k+OO4mRY
         vG4Yim1NvhLVjVKEXUVLh5Y4dj4+FOlhbMXolGKNinicypL2QeNsCPGTWeF87/NZC/45
         Eck/87zA1nZAudm89BZXc3bcrJG9tTJK3NSRuvSCltKpkw/ZmoARMBAEmJQ6GzukPvrc
         HUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921639; x=1783526439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=;
        b=BI7LHo/cb452jHu/bLHnDUK/TfLFg5Dh2SZoFUhgf8w3Aai6aa5BpLGXkGjJH/AmWF
         vWDxAxX2Yp96SrpMcr8g8iaOZTJeL2AH2Njqb00VgPJdR3bLhcdWB5pXG0bDSC2/jIyO
         BuUvbzyuFkcM4LlTfG1+HcTtuhURI878EMy+N+fW3vlyPJ//ZfUSVVUa31GlIZbPy+RR
         FugUVCTk8QBbK6+UiIZQ3pK7pgnKsXZnzICKvN5P/jMUqIiaAtM8MEFLOT8KPWeI/3ms
         L7zup7zfnY/tFYuLuqhBTCrha7dJOSa+yWWb4x5f9SDK5l4qUVHa13k4H1Q1JboMBSD/
         nqTA==
X-Forwarded-Encrypted: i=1; AFNElJ9sDWHDcDASxAUf+P792mfntXdHZ1+jVqKd6pwAuMSxh75sAWci679m6fzzP3zA1xw+f//hUO0=@lists.infradead.org
X-Gm-Message-State: AOJu0YysRKRyyvF2pQZFmOIT1LuUb4OnVSXAydZ5eiqgfguJJgPEoKwn
	rMNV8894EFQFSj+7nZJ7hxRODKrieenkuwMFrGBmd5KlW1Tn48kZq84hpXdxmV8ZpZM3SWHzOFp
	4WIxdd0AzKtJYo7UZbhhQSGRVa0Ro4e1hcY3ECOy00kg7L97VCHXB3FcT1Wc+HRiP
X-Gm-Gg: AfdE7cklkfXXlO4ymVCkFd9i/7JCrlgFoAiwKepfVAVH4cLTHMe/JIVwAWgJ7fX5cH3
	/Ck2wvEay9YTDWtTqnXXX9bn+AhcPHXFYEaWZbgmzjFxaqfqSzh9w0pviCBJV8s57uiqoLH8T8O
	HO8jAAXqOoktCFmPABXZunCEs7joxCglOb/SbuN5IZMeT4tbdrVKu8T8TfrdK5rSMzTASsShccw
	H4TTl09IUF8jOyZXLu9R+9etzbbBCv4C0wmBH/RuRoOuVnLUPqtOCeT4m1SYfIIlr+imF4Nqlla
	2ouWJtoxG/2BygkDZ657m9dI7Q7bMUgUg7o91TIgar/LoK9WGVAVBsW3VRftnBe6eBCsUa40n1g
	xyuo20HyWoI3IBOFKJoglQ3FoRArTwo9HRDUHiH0uAo7XgcZl8Zv38OgXxSeL1F2keY6ZYASgzT
	5KeaXGb/w0LCKVV//frz8H5hCbTPoyDRqEOem8aOTeS2YBWuaMKJtSpHgSSsHOuwM=
X-Received: by 2002:a05:620a:4096:b0:915:6ce1:3576 with SMTP id af79cd13be357-92e697c6671mr914775085a.20.1782921638212;
        Wed, 01 Jul 2026 09:00:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4096:b0:915:6ce1:3576 with SMTP id af79cd13be357-92e697c6671mr914758385a.20.1782921637397;
        Wed, 01 Jul 2026 09:00:37 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d19e03sm296613066b.4.2026.07.01.09.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:00:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:00:26 +0200
Subject: [PATCH v7 2/9] dt-bindings: net: wireless: qcom,ath10k: Document
 NVMEM cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-block-as-nvmem-v7-2-3fe8205ef0a8@oss.qualcomm.com>
References: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
In-Reply-To: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: oR0Iv40ESoXEl7q3aEK9XGRQ8lbDzNai
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX7V8GfDVr31lN
 ClLx2oqmVIlAuy0uaMnQIlESH83wp9LcH7wekalb3F9NkGX3qTzYGNQhckGkuxJOqg+ZPZFFMph
 j/yfs1Dy5T3EqNF6FUjj949LKB5Ec9o=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a4539a7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Xy7nGJaRzBGhkMsTZAMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: oR0Iv40ESoXEl7q3aEK9XGRQ8lbDzNai
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX8jF58uS6aAab
 FKDixtX1x8S428zSMGK/ks473ukzlSsm1FwK7g9iAXba0QQjJ5wRHookHTTRht+27hzx+0383AO
 1j0XQw+6wJAWp/hAxl5T+a2WQyjY3g2w/hhXn+Y/e/xVZ2LpCDMCCxq1QEMSQQEmb8xHQTLMP96
 DfBi1ZmsIifPxBeB12tKM6kAWCR5uhqGG8OssDTtm4Hb27JPK1gj3OwSRgLlyuAvy1Oz/pm3Qq/
 5UYXFBFcHOCl2hk8+N6NxM1pc4UQWpzfaPXlTkiRxVv/WyKgzEBB1CLAQ1sWOvhfnwM3gOiXj/y
 lcwwKasdTAmrRkiO2a1U1qGaILQuavbBeOW9GNcyVe9pXZ9zlFHvSVfOp8R3xLMpSVqyYCNaVA6
 AoY+d0QRjDZrWT4ARd+kzgukTASADDRbxvpDVVknERcWL+FGh/i714pkxuKfEf5iOZ2WOcq3+XC
 DlMm/nSGkvAgHVP6iiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_090040_523181_ED734A97 
X-CRM114-Status: GOOD (  11.95  )
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

Document the NVMEM cells supported by the ath10k driver, the
mac-address, pre-calibration data, and calibration data.

Since such data may also originate from chipset OTP or be supplied
via other device tree structures. All of these cells are optional
and can be provided independently, in any combination.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index c21d66c7cd558ab792524be9afec8b79272d1c87..878c5d833a9cb073520c256c1b72d0f1489e7f4a 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -92,6 +92,22 @@ properties:
 
   ieee80211-freq-limit: true
 
+  nvmem-cells:
+    minItems: 1
+    maxItems: 3
+    description:
+      References to nvmem cells for MAC address and/or calibration data.
+      Supported cell names are mac-address, calibration, and pre-calibration.
+
+  nvmem-cell-names:
+    minItems: 1
+    maxItems: 3
+    items:
+      enum:
+        - mac-address
+        - calibration
+        - pre-calibration
+
   qcom,calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:

-- 
2.34.1


