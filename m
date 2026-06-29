Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75D0C43458
	for <ath10k@archiver.kernel.org>; Mon, 29 Jun 2026 08:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=; b=PG0eQ305AmqHgUw8g5GBLhZCOI
	/rp9cH4Mu4jb/lMvcOCTHlTjWLEEAy8d9JH//IKJEYWZT8927VUelh8SVr00QjQQEaTcrN+V2Ugdp
	Zwudqr3rT3NroND5CmwPieadwMQQgpxMkZEAxBm2aKbkM7kT5rCbZpLZZ363RGroXxftvfPoZyZEs
	wj5HPSTA3Mo3Kh+l0Eoza0T2JH8TzMFHQg4DbPucoNyD4dFPvL/XO8+X7zfZzs3KiPblpYIu67Ops
	+WPerdZ+vNxGs1u51fcB/93giBJAhHM17xoy0uFN9+ryASChUe0/UjhkdCXpA2WQ/z06U7ULIGRUF
	MNkfFc/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7ma-0000000E3kv-2eMN;
	Mon, 29 Jun 2026 08:56:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7mU-0000000E3bv-49KC
	for ath10k@lists.infradead.org;
	Mon, 29 Jun 2026 08:55:59 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7Dqma2188734
	for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 08:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=; b=iq4VWTlsEF72+xeR
	4ttGhDzRIivrHn8pUV919TlnjWQskne00TWo/B6pv4C/c5TDY81vqnrJHR4XE7oY
	THxmHiVL61ti1m5iInP+4M1nadSovvZzm3ha+MdheyY+dqx8/d7EBfICmYJVcoeo
	XejDAXu55tkdsr8/EuMbTaqJIgRHXEeNv6EZeFcqTpVxoSLZ4jSI8FM5Us8aE6TZ
	MLm1hyqbfAdaBawkp+nFNEd4bFdPq+n/ah3AdtCjKbEXPdBIYP680DXc+odHnxMe
	+dHBQEZHsdIMBUf1IMMKwqN8o1yg8hGLhkmmlwh23gvMdLBw30CLGe9zBhgrN32C
	zXF7ow==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trdmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 08:55:53 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bd7ea84c73so4174280e0c.1
        for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 01:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723353; x=1783328153; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=;
        b=D6Oi9tfR382rBl5McZbn/4B4qyarnOQw899MXsFGMiUYt+FfHaXVASwF3Y+t84Y5bd
         erxTS0fqkCw5TcqPqDu5LrA6lTQv3LkBplEG4/9onKCtnaH8XVOCYR89HzOPAdqyekc3
         6xVf+QyvvTdo0kDvongUp8v4qJQuWZnSGJP6wJyq+jMfwgsPQkKETc1d2ss0LgEbGOlr
         lg4LDgDcJtM2SPtt5uxL9Equ7dZDh/aVBGlcebVhc+V9G8SSEb+KvbZsUhACIG9g9c8k
         s4HfIB3ATeMr3pPUfO60vCLEvLlLNbqbdXa1dGKILBVFs7RKQ378GrzkmRZVlzO4Ttr/
         GJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723353; x=1783328153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=;
        b=UrvL1pS8D6yghY5IqBC0yJt0XfngYvaWj4ONonXXR+AryFWPfqzidBp7xQpkQo2VzH
         auTLWfJnwXbZznZBUxRX+8by+h5YRLRCPAmq3P/2MMFw04lO+4b/7e9e8zLnQezdJ3t5
         kBeSA21+d7azfro6DcWGkUUZjj9Yw+1OJPbOjmhg2QBXrKGmJKZ2WLnasDniyVDY/bhf
         p7+/YDfMNL8utE+Fl3Dbk4E3nGf03NHexea0Py8fYP7TogIVGL4EA2cpwSun4fFGr7cl
         ajLsPVXw87Ca2YnIwMW/EFhkbpr07roJsPNgP8v+w3o/72kclA9PTj5V1UMatQUGygqP
         k2Ew==
X-Forwarded-Encrypted: i=1; AHgh+RoWGfYs1vVYDvzHBj2c0Oa0rd7IhJRxcpahxSNVVf0jefvBhd3lAfdLx2CUq54yWNmq7hDL5Fw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxerozad1yrY8mbZWjyCUHOzcZ63ACcbUvc/540EYeOOc0pcbe/
	vrzSI6Nzsf3MB2E5qKPIGw+FAuKg5bn5iNnjXCPbkw3NCZKhcjOpYoId7Cp7QT3KIjhtH/BQ3am
	EljD6lK5LbtG5WqCkI9sr0ENHSnWT/LRBVZ7cjf8C2Hk4d88laksf94056avP8IRO
X-Gm-Gg: AfdE7cnsaRzyiKAQwyCSMl1xyLYKNZVcExBBI0lgloJr6nIIu20yLnjRtJz/4r/eSm1
	dCSYMlSQA6yTxiwS6udPOfSVCa6KRMhzW4TF1YYejqkmnSHIRRNrlq1/CXy+bllvvKFYqNZR/lD
	TEXF5EIOsEpPnIn2FcxXnO0yn24WGgB6OsNbXeuaMp9fT9dx6Ou1x5ebnFmG6XBU4qYhdvqzu0m
	TpeWDmzEGzCUJUdAEAM9qBjqGWO1aPh9O+ztYjjbsyR5bMtb0fN6lVbmuahJKx/AOL4KQzy2Awk
	4P5k9b+81d/DdqaAIjtALTwuqSSlRtU4DRy05Z2T39NTVUb2ve98QX6oBEYpFyIRL+jv4YeqD1i
	5m0YJCKueqoJysKLqe7a4a9MIhSbZFslFcrMlnJj/Y0QmtL25eiPMHLKUwqGljVdqteJDeLUrao
	SDKLVbcu+DLvdCv/7R98ikkT84a2dcrkpveAvKAdr4CVn/M+FwP9WMDnKbX8CRgG5NnRXXgKfed
	LvhxwhzSu6WFQ1vqVRi
X-Received: by 2002:a05:6122:616e:b0:59b:9264:b06d with SMTP id 71dfb90a1353d-5bc2ae3c4f0mr10167360e0c.7.1782723352645;
        Mon, 29 Jun 2026 01:55:52 -0700 (PDT)
X-Received: by 2002:a05:6122:616e:b0:59b:9264:b06d with SMTP id 71dfb90a1353d-5bc2ae3c4f0mr10167320e0c.7.1782723352206;
        Mon, 29 Jun 2026 01:55:52 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bc8016sm6558981a12.25.2026.06.29.01.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:55:51 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:55:28 +0200
Subject: [PATCH v6 9/9] arm64: dts: qcom: arduino-imola: Describe NVMEM
 layout for WiFi/BT addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-block-as-nvmem-v6-9-f02513dcd46d@oss.qualcomm.com>
References: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
In-Reply-To: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfXybM3ooAfHE0q
 3zX9YlEBXvz4OLpkyWSrVrK1V57X0eN8cQQUD4fYd0JdXBGIRmCFDgWx2EMkk9OIDWz1YvEtplb
 8h5+7/3eM0/oQ0FcmiWe0NhE3rA6g0TTkvICwUGnyi7kDz3QTDA/oSqlZZRVCbjh69GbQnb9Obu
 RVd4CYQMC2bMP/Lb9pZVcWGGj4d4wcl82sx7FYrQPyzwIpm7VHTIo2/Y8MukbgTRscGezT3i55R
 z0EC9ZXMD5yLcFM/2E4+rtRk1V3XD/JxtLiwb1AEmlfa1yDSBNuBaAC1pNLvBasID9ILH4RUSFg
 PWh01bSuIRdOCFSFWafGMDYSchlW5ExuV+VaJPV+m5/uXDo8Fgpaq47RBt/HkfB6xb+IC5HY7/V
 GedrNevxWbTlz8ylbzv5jBJWT1Zf3iAf2gNnIR+6q2f8etOSnggcotPQCnzMbh8jFPV0G2vzhWI
 Vyii+vdtJaxKjfGQwpA==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a423319 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX+sNcB7nHb3Oq
 znV1ewOGOpPP0Of8YuwD6kMF0XOVoYot164ILbakoqqbknKumLyt3u72YO58JY9+WU0iOAeOCgC
 hK6t/P7T5QMCgDmj/xXo+Mt93Ck/Eso=
X-Proofpoint-ORIG-GUID: -F_JoIuUXXI-cHcMN2gYsF2YJuVgtBdK
X-Proofpoint-GUID: -F_JoIuUXXI-cHcMN2gYsF2YJuVgtBdK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_015555_075863_03AEC153 
X-CRM114-Status: GOOD (  13.67  )
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

On Arduino Uno-Q, the eMMC boot1 partition is factory provisioned
with device-specific information such as the WiFi MAC address
and the Bluetooth BD address. This partition can serve as an
alternative to additional non-volatile memory, such as a
dedicated EEPROM.

The eMMC boot partitions are typically good candidates, as they
are relatively small, read-only by default (and can be enforced
as hardware read-only), and are not affected by board reflashing
procedures, which generally target the eMMC user or GP partitions.

Describe the corresponding nvmem-layout for the WiFi and Bluetooth
addresses, and point the WiFi and Bluetooth nodes to the appropriate
NVMEM cells to retrieve them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index bf088fa9807f040f0c8f405f9111b01790b09377..128c7a7e76b5b089044745f5d6407d6391055fc2 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -409,7 +409,40 @@ &sdhc_1 {
 	no-sdio;
 	no-sd;
 
+	#address-cells = <1>;
+	#size-cells = <0>;
+
 	status = "okay";
+
+	card@0 {
+		compatible = "mmc-card";
+		reg = <0>;
+
+		partitions-boot1 {
+			compatible = "fixed-partitions";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				wifi_mac_addr: mac-addr@4400 {
+					compatible = "mac-base";
+					reg = <0x4400 0x6>;
+					#nvmem-cell-cells = <1>;
+				};
+
+				bd_addr: bd-addr@5400 {
+					compatible = "mac-base";
+					reg = <0x5400 0x6>;
+					#nvmem-cell-cells = <1>;
+				};
+			};
+		};
+	};
 };
 
 &spi5 {
@@ -512,6 +545,9 @@ bluetooth {
 		vddch0-supply = <&pm4125_l22>;
 		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
 		max-speed = <3000000>;
+
+		nvmem-cells = <&bd_addr 0>;
+		nvmem-cell-names = "local-bd-address";
 	};
 };
 
@@ -557,6 +593,9 @@ &wifi {
 	qcom,ath10k-calibration-variant = "ArduinoImola";
 	firmware-name = "qcm2290";
 
+	nvmem-cells = <&wifi_mac_addr 0>;
+	nvmem-cell-names = "mac-address";
+
 	status = "okay";
 };
 

-- 
2.34.1


