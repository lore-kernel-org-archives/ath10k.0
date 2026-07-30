Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876B9C55164
	for <ath10k@archiver.kernel.org>; Thu, 30 Jul 2026 16:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=; b=YRfYC6HFdxBJPfjTnh8lifyVrQ
	3412kamLxc67UkFb/Esq0naSxWPv2X6qn+MfgB6rb8ITwm2Y6zi9Mnx3CbZ9d2vYFZYJypmzaIMTv
	Uu+sU5NXnZAqllRsb/JuawSxclWeeuAvTPeHgIfPZAq3pSjSNaTcpBo75VCJd1j+l7CjoBS08nacs
	PY7MXUoRZRgsQo/ArfqWQPjw9OQLrW4Yu2Cvvba7s3n1oBTDWsk/OzPP+AT0GorGDFihUELx+eLTQ
	szDSDKhorDhM6AQFPQ5dhOiIBJ6GBdcBv5YV3TYcPS7E5C/wtWdrG1AJ69YQyya+JzQS/UP48C9eI
	WLrLRsYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTC6-0000000AufT-2rLX;
	Thu, 30 Jul 2026 16:01:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTC0-0000000AuZ6-482I
	for ath10k@lists.infradead.org;
	Thu, 30 Jul 2026 16:01:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQvVp1371772
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=; b=otwBB6sTYEC5Pwgk
	p/a56NEtduZLgnFOT+mUbwZmBYWofu/93DrVNEGesvn2u1NO1kpmMFM7Y/EP7vAQ
	AO13YWtHuG0oz/mSLBXD6mnMuDZhFC/5pqiqRnorHsmA68wDO/+wRCcq4UppCqev
	eT2yaes1u/23RpAQDNO1tmdcq1oYCaPSMEpD+D91MJQ+xu4fenU/TzQh73qK61Uq
	/TMmMHfwvxlyPIhE55OFFtX+GSYHkNr1kolzgGL3vrQdxzMPiTOEwTy9YG6N8coe
	3oW3PLoWqs2jRYri8450gqjUbt6X3pksaQFP7MsW5DgGcw87aHzTbVjCx0BCZt0R
	EdMuZA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6yfrypk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:01:07 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73986bb438eso11260137.0
        for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427267; x=1786032067; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=;
        b=Xg9NYEiWpH4ym/MSZDe7j4pfJ6wK7Av6qt7smHtgA/iipjz2bDqQAbzErXZfemtEv0
         1N0g/CmE5Dchq2mpatIM0qBEzhbHOG2UtkMDTVYcirqON3KeguCwwID/5pYZqxFmsV7X
         h2VQNUtbPvAlzZHCSetSzFEmrZ4ndJACzJwPliP/cK9YAcwYe5pgZzJ5Krwkzv2sYiJW
         AhndVrjuRAtQu/ItVS5b4vKVOCy/PL3jgbam554JS9GBqisHbE6UxTxjkT8Bcs/qnb4G
         ZH1m8Hvig1oYNndgJvaJ2iPTc3Rcz/PdqptaHRTCj0d/qnUbfZ8+xfW4mjN+CEOTnVE2
         MCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427267; x=1786032067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=;
        b=rVFD3W6gh6iqoUJ+lpB156gPAR1vYnyQukiXTnlMSIg3dWWHIaiMaSLKXuvG7ajQhD
         47fvDY61Ekn45WoJ17yS+iWtyJklpaGOmaCoNDIV7sE7C+o2NUwLvKNPsqkpAcUS7Caj
         YCzgcnJmI+uHyrCixFdweUgNtGQ88LsPJ4O0eGUSddzHJZxwBoN1u/U3K18a41do6oKH
         VxDBGnnaqoKCiyqhWzSCi3RiOKH3NmdI2ScbcjdwDlCcsNp5l/HxYhpaA245hMJOuYof
         foAj84iNuL8Pj5367TmHw5LQONjPqvulQP0+uOvifr7dTZt8fsSo2Tuvthoc9wZtFpfu
         EZVQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6O2UX+5SgTvPomPfDi5TDgkdsIt33qEvEl/atD7X/+AMuvl+T6YxpiO+hjFptf0T8f+UeSQk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAXExmlgwkRDYzwF6JrZqa0eeG6vWmcEzxZ+hpdGskO3fBEO95
	nAh9X9iMRQ2iA0AiYGyA7q841zD2+0cFJuy+JkUNtgRc5pKIC8coXq5XV7O2e00FZRwnpJv4daV
	K5n60UcdPvvQtFOxrgn+9kHCH43/NiIMSxdB+uOgd1b1pejue4ZcAEtOXRGYPQexW
X-Gm-Gg: AR+sD13TAvR5rcso2Qax+nqkBJ3RJUvheZ+61iVEFF0Ex3wDZ2Md3g/H5+N805ery+N
	3DQfPmR5f5AU/HP8aq+lvSgmnoSd+IoPAUCRocwS3+ZZDv97IueP+G4AKb4L3+W116H/etJ6RUE
	eVJ41Vy/13mBRKKZC/5lAcPbWzyXGnkKgd1qS6KUS/lCdXwYMOgwUGMALK3WZPN9ayDzIN6g0QF
	PPe73fYQh2TghQ7/FDDjIfg8nnJyo3SW8AF/6SS1DS5vklhE8ob8Ruznrb1ODe+pNwOnw7qj3OZ
	ucLXs219V7aAINNUykpcMAokHAMfOIv5M3mF9TUuzLgh9mowt0iK+/436kDQF+tdbZNofi7SDcP
	fyKkNcXuR+aa7/49Yc0hz0mtyeohfUVndCK4bI4QVTr4TdFolAxO4I5nP3AUtx3MzW7NEPKyCF7
	yzx3qStGOfyiz08OJLL5pxipjY4n6rYNpKVSGRf6tHtf6Gy9zaSokZ
X-Received: by 2002:a05:6102:c09:b0:74a:84ea:4f6c with SMTP id ada2fe7eead31-7574ff6c30amr1313376137.15.1785427267067;
        Thu, 30 Jul 2026 09:01:07 -0700 (PDT)
X-Received: by 2002:a05:6102:c09:b0:74a:84ea:4f6c with SMTP id ada2fe7eead31-7574ff6c30amr1313267137.15.1785427266454;
        Thu, 30 Jul 2026 09:01:06 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:01:05 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:00:40 +0200
Subject: [PATCH v9 10/10] arm64: dts: qcom: arduino-imola: Describe NVMEM
 layout for WiFi/BT addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-block-as-nvmem-v9-10-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
In-Reply-To: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX3EM5xLOSry7N
 Q5oSuib3a0JwdrLtKTeTVhbwcOgcD9yspPqsi85XtM3kDPDjlJNVQqUjCh7B7xgtfslHG8SlkoX
 drTRfPpOjLcANPGEzb5WRSnKtswllkUSEktlHDVlL44mYZ4pHxdqO+OeBmqNfqNWsWg7vIQPJy8
 I3UFYBEx9B4YFyzjXuolXx733uv3iHsoPrxwdnlg06jwHjc9VL0M8vckHIKAt9+1ObaYGEryPy+
 cBqU6ZkUrqXJUmoo92YrF3u22ATG72u6T0o0xPDWRQMaVvYdikC8fq/l0aKKTskzVsHs1mq+RHQ
 y/OZUq2hryjuAm82lwOUnq7LiH5uYpqiYy3D1fB9aJHadD5dGDfseHrCbKi5scAxF7xUVFbPC2+
 kIrGBX10H6B45AREdcvHoa4MMIrvdsfYdo+03WA3kG7AD1ajeeRpRSmrHPjkQSXkusQcmDRC0f9
 ibLUlDCV9d6TUuO29uQ==
X-Proofpoint-GUID: stPtjY8jAMewZWpjDNMnmhngEaEzGq4E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX7TKl8evR42wY
 tpTbeZS47rwPlYnx1Qo49/DI0BP8AK5uGGdI2fsqOmGvWhpRUNbQ/gghFaer7IwAl1p9VSlSyBv
 oWI9p004Ub7aPGYYd6b9r9ue/rSToik=
X-Authority-Analysis: v=2.4 cv=Tv3WQjXh c=1 sm=1 tr=0 ts=6a6b7543 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: stPtjY8jAMewZWpjDNMnmhngEaEzGq4E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_090109_162134_54066416 
X-CRM114-Status: GOOD (  13.52  )
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


