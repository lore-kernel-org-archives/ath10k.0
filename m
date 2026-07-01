Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E561C43458
	for <ath10k@archiver.kernel.org>; Wed,  1 Jul 2026 16:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=; b=l1EwiQaBrh1O3iYR47NHz/DMCR
	ogs3QHf0/63z2MTWKmIvLHbsmGGNKD4Nu3QtMqNwlTT6DySqilpe8fwi+TlBDYkCuxIHIKXQ8lkHp
	e6O1eyC7rNRsyVQcfIGGQUMVoX5WI35rOHuB2kONEqx2ikAtn4fPw8K3Q7QIr0Uow2kkQolFXK4Zq
	hd+1f0nxa9L9F9El7yNwFCbWX18FI45VcdXAa4ebbIZ3xA7L264rfsE09SGjgTzbvXHR4eSGvLFcH
	dm4bC4iTOI7IIPZe8K1K/G/edenJA9XWE7csRtluBr/vsadqDr/qKNv0cZvu4PJzzvOPmcDQf5i5b
	qNmZ4+JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexNN-00000002T5u-3Z8N;
	Wed, 01 Jul 2026 16:01:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexN9-00000002SwF-49Wj
	for ath10k@lists.infradead.org;
	Wed, 01 Jul 2026 16:01:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoATQ1552738
	for <ath10k@lists.infradead.org>; Wed, 1 Jul 2026 16:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=; b=Sq/4TlU6exhyzy+K
	qT9msILIdxixfLAxMRh0G1xJpAKvzWs+ZtpKWxy3uGndIQq5dUiSP6UBO4SL/Pij
	Z1jGh2bARokNq8G9wo5OP2turSINkMs51RaXW6y8CCNSEptt//shZHZFk+wgSfAy
	AvDvzofP45s1zaTXy5X1MKQH2r0Z7Id+XYNo9uSQqmGEWPua5QqEI8GfW7dtdRIl
	iji3q3edsCaC+54kQGJH2rv8D1nHj+89qG3sTtg6c9EHnu1toRLWSuucWo6SBHxU
	L1RYwdkd9PVMqapCHK/tRDocDlc1CHAjWB/DsLeETtI9XYrVe3ixT6G6u2JHDj4x
	D6AxDw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd1fre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 16:01:11 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a1791a6281so856360eaf.2
        for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 09:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782921671; x=1783526471; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=;
        b=Rgib2l76ZDmnfmOMmPSuI/mdwfkta67km2AvCdKPmc3cyoUvAsGlpu2cO3zSytXOpo
         UmolIsUHuvl8mREBgR+XPVD7CbblY0HZnOQ4cF2ZWA4dxQtaVGvdItyInN3vuCgEtxpO
         H/z2ZgiDyJATv7LMb9WnPqkPBz60TT8Xu4ZpdsFE/yFbOQ+/VnCeHK0n+31vkW69kkho
         TlCsHw6XlMZyZ7KWkHOKN4XBWpjsa2k9xLifvJvMk24zu0EYCbNYmJyKqpy50pFWGg4s
         AHRN+9dxYGQ9OHnxJsv/wE7yJW7dYJea+8sBAiS7lpBKZodkwl8RQd5Vvd4AebL+cMQ9
         pXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921671; x=1783526471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=;
        b=YnUFCdUjy+RbUkKys5Y7oMMWAjjXhWHbmmKNXgrCLFhEwOS/7B1c0P651fxYkUFtyJ
         skRIMnIpNy7dqR5AUeedXqBgLZ/vuQtViKjW7LH4w8YAFKTCbI9OfOUevp/KiuoOprZf
         TLWYbrR0uByIq3K1XjpIRWFy5V2+X7zdwIlc0dJ7iREYc9/8cF0vJ2gcgah5WZwzlkY9
         Uz9I59N4hblDDdb8Ut5BYbnJR1xJOQH9WklmtLDZnLb6fjDmKp1GBMipLcqy2flBJJRC
         aEMQyc0mJKS1v4HsmMZ8sd7akcorGSdJUjLwFQj6Rg/Cy75r91hGCpi4+15Gt3p2VIrx
         X6Hw==
X-Forwarded-Encrypted: i=1; AFNElJ9gbzbqK2RYblKmsrbwpY249VhAWm4JI0oSPlkB/5vYBnwwcd6270ZRGWpXTmQn7ygJY0aQQ2U=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzXshv24Vzl8sQzJFqL0PiB4VtsJsHl43UjeZ6PGyuL+E8Ewmo
	INxh+WcWmLLvs1nNhGgyqDEDC++iM2Rp6YfJfM8IH2kA3ZSKpaB7r6VcxqHyJ/+xQE9n2Xv4VeF
	+RkNBJfNTIfCuMCGi6VFzRPaUPloz4bg0PcU3krw3eRZ5aPUiCbFLuFW00pgdyIW/
X-Gm-Gg: AfdE7clMoUJDENVwYuCmNSbl8V6uaEcot4EC/eeMjzfi88/8Ur/Ct24HLmUuIoPWny+
	1KhqWLII6hQ5NW27z8lo4jeoCUDpHymHTLeo0Y7i/aRf65620duElCMng2O+PU1eK+TDdPcJpcD
	YnpAQYkc/Z9KvafMMUJr1+xFhDMnmUGLkJo1syDgE4C67CR6uKs79VpvynwmplFciEo/PkBdHXE
	BB5MuoTFQYwzQivEescwSUAVn7hKm09w3Bu++HtcBYpKLOGh8oNMaL25keQZWXCt3/mKw3qETUS
	65mA5V8Abp8RVkiRiY/8ucfWdWKQ6aSH8b2o3DoBQI5NxML7QdM7u1p2ypnO/CEG6rggTCpuFnw
	HSZuUygOMQ/YGtuodbP86QZVIm4AghfhVD1xPCRNc4ozM7E3PCcveoYzECnQH2tR/xtvzwLhmYA
	L3CrhT9D4YobE4cCSZ3a5pm4cj+oA+dIVrV3I9BYtXBM5U21ZC+nGpsCHP1hUssas=
X-Received: by 2002:a05:6820:200d:b0:6a1:50eb:2113 with SMTP id 006d021491bc7-6a309b97f95mr1372463eaf.72.1782921669956;
        Wed, 01 Jul 2026 09:01:09 -0700 (PDT)
X-Received: by 2002:a05:6820:200d:b0:6a1:50eb:2113 with SMTP id 006d021491bc7-6a309b97f95mr1372277eaf.72.1782921668477;
        Wed, 01 Jul 2026 09:01:08 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d19e03sm296613066b.4.2026.07.01.09.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:01:07 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:00:33 +0200
Subject: [PATCH v7 9/9] arm64: dts: qcom: arduino-imola: Describe NVMEM
 layout for WiFi/BT addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-block-as-nvmem-v7-9-3fe8205ef0a8@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a4539c7 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: CEnZ9l9p9SOy1X-Srq1kRGPDHVB2JTyI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfXyPjP05iaUeap
 kpbqlSKRXi1taKIDZUzF+Yfx3AMQGaF2o021IGOrVL+0MlW8lpfBvzDTGYchNHpwP7+JAYQ9x9Y
 IV08D9QIFFZiwV9PgB5LZ5ufyvJYvlQ=
X-Proofpoint-GUID: CEnZ9l9p9SOy1X-Srq1kRGPDHVB2JTyI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX58+8czInGkIO
 ZD0kXw8jRqFTDZ5jHNN1yKfF5uPG+38FI4Z2ruGg730ZgMOJDDup8oSMMNi9z5tk9OzNggyINtk
 1Bnbi8ncKewWnWAbnkIhiv1I1uEzHic2LfeEBqOGgH0oKsroK510zxvYR1VOS926O48+VDkWtor
 e65kIyGSL+tElQ9f21dqirwssexYdSt6yQgYBbtS5RCV5QsS7Rs3yV+zZEeXhJgGQhCx3o8iNTu
 MFk6bga/Xr5J8+dhS6mjucpIp36YLg2RniqmlJbS1UmfBzcgUZx8vHu9G4mWxRMG1vQzLJiVte+
 0qMlDb27k37PePVhC2HBgnxAoLT5tX60qvy9P9IjE0qIkU5VOZjZmUO3Dq1HbE4AMQmg3bzPMgE
 bemU3gvwU6xqqEjIW8Q5URtvtgaxFHvHmjqGIvD0Ki36g+MdNWCqldV3fDlYDj9ErSQVYessnXk
 JdAFuGr6Q3p92B6MuDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_090112_037059_305FBB5B 
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
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index bf088fa9807f040f0c8f405f9111b01790b09377..38839b8a361e76f6c1989924b16095b9d8815f66 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -409,7 +409,33 @@ &sdhc_1 {
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
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			wifi_mac_addr: mac-addr@4400 {
+				compatible = "mac-base";
+				reg = <0x4400 0x6>;
+				#nvmem-cell-cells = <1>;
+			};
+
+			bd_addr: bd-addr@5400 {
+				compatible = "mac-base";
+				reg = <0x5400 0x6>;
+				#nvmem-cell-cells = <1>;
+			};
+		};
+	};
 };
 
 &spi5 {
@@ -512,6 +538,9 @@ bluetooth {
 		vddch0-supply = <&pm4125_l22>;
 		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
 		max-speed = <3000000>;
+
+		nvmem-cells = <&bd_addr 0>;
+		nvmem-cell-names = "local-bd-address";
 	};
 };
 
@@ -557,6 +586,9 @@ &wifi {
 	qcom,ath10k-calibration-variant = "ArduinoImola";
 	firmware-name = "qcm2290";
 
+	nvmem-cells = <&wifi_mac_addr 0>;
+	nvmem-cell-names = "mac-address";
+
 	status = "okay";
 };
 

-- 
2.34.1


