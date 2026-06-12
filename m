Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CC5CD98CE
	for <ath10k@archiver.kernel.org>; Fri, 12 Jun 2026 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=; b=1JIne9YhqgEa/nRzGqoCRpX+cY
	PyJau6vJCUOlAOettl7lg3Wy8zgYj6Sb2mIFIrTHjjleC+PeybmJ75NU4WYreWQ0Y8XWZ8yot25Qs
	E8n8ymd6prWI6g0OMaSNbo53pcNux1dgHEzicVowldCSaVMzhMwvaFehbmXaryuiT1xXLKRrPQ14H
	8uUJLF9yt2EdnEwXCxMbuiwWbn2n5eoYyzfs0JM+ys92YoQ5MzTbt0LuDSQ4QJSiKHmi6bpZ8s1jI
	94HA289ntrCp2m4jJvzIkp/Afs8TL7+sIgVmO/h2QZg4zvmXYjf62f2PkpKUVShCsem7rplGg/2nf
	uBgG9K1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1pG-0000000AxEe-1RA4;
	Fri, 12 Jun 2026 13:21:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1pB-0000000Ax95-30Qk
	for ath10k@lists.infradead.org;
	Fri, 12 Jun 2026 13:21:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj7MA3760561
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=; b=G9bbuHJns2jGAuQl
	c0OmC1/0RgFcZ7pu2qqlJpfgj0uKXnddJ3xd6ERtg9Mapdhviz2VhO57OIKzGvkI
	4EEsAKnu+WeJ6SpHHFNf0w6wB7C0OtHHfqPPxm6hMdJHVRmWUl/UlfzSYO2Zi3tt
	YpqODGm5tWyaKKsCqpRTKDrvuRPSHVTdRnrdIyipaf27n7w+OVs6YoTdLT0TH0ci
	WRKo8AfPax9s6U9HtnxoAtmH/2saLwqAZFP7nULUVgKyfS/ERJBRE/3KAtQrHd2z
	Zbu5Xr+GlfJ/PedbDDCY6Hfnma/rCEm7wdbusenoP0BmtcCsiRQ1Vl8mx2LxuMVe
	jixX+Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29uu2kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:28 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c7b5cf8bceso371013137.0
        for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 06:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270488; x=1781875288; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=;
        b=HJkRDMLtU2JCvZ1DlbElwS7nQmM7WDsKjvyc67HZ0fB192r1wDcxPi7GW348BxcKsL
         4lDn9rkFoK/f7uZSMOLcviTlOAGxwbxnje2phfzlFKFrlXmETSuHy+cHzupbceQrA8Ty
         FKgU2ecPrs6WZ9I4uqfjDs6NYT8gUfxAXOHkgBVohQJdeAaa4d/QLkUs94rYJ1djTV9o
         yYjQ0IGnTgV+VhKjMpLoQAyWdtMIDwrjGyoE+vJDCSZqNJHg73UI1pvb7h1X4HgUwop0
         eKXjwRp7EAbObKVNMyeZML4OhdvZvhVjN5eH4FEneSTnAcT3+mUuASAW+UWtRQ5m450e
         B8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270488; x=1781875288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=;
        b=Ex3tb9TlKvRuuIi8/lphU30AE3p7hTDa23q0Dk+2E+c7n2cGQLYtNm3oJoNDrd5tke
         1qNSRzM8FP8UGEGdL1Bnd8m/AkZVEmEE4Vm/WlV61g7G9BOHaKNUIGuwhZg5TO3UCEZc
         RS9BzH/b2ZmZok2B7UqqQg9sHUTdIgHlSAnYFdkwZ6KnJ/LiDQQotSJbmsmR+6G6XA98
         eHsfcHpNwZrzJGefk8PYKWXhfI4TOJ0N5WrHpkEL4dcE+vgsCBtqK7sklM4aUNZ9ZVLn
         17wRZAQtv09YLvCqERiAFjhRsNDhGWkTSRO0P2/W4k2r0WFL5SrU6O437EmIhWEhe46U
         Bj/g==
X-Forwarded-Encrypted: i=1; AFNElJ/tc4Zv1mg4IeyiIwKXEgWhp9uN1mJ3Zhi1vFye9eyJyQV2VNMDjqISB3kQuZ2TegzqXkghbWI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpRpj5bk68T39iAuXMU8P2Of8E7TqwLxOq0nNCgrlIcShGgrq+
	eYCzLt8rjs/8DfMxQKXjlSyMPo08Tpb06Bk64yaEMIMrBllpr1ZIT4qUtoflyD2gjt7JZy5icNq
	s4c/tpTfzQLR7vormJS1DcYpOIN/KhYK6uZ/Bo02jTvjhJvrotHalL12+KsfPfkOK
X-Gm-Gg: Acq92OHb/GCRHNxNchEALA+1wNQjkfOe3sdjiFCguEjcwau3gBNVn7JHX1UAyNF7JA2
	RB4ZYUKxFCEtoPuhQ1ubNV3Y9QnXbQzPOtP36sD2Fmqxrcz5fps3bbgx0pRO+ajGkvnW69Op7Zg
	n6jHUBdlqt+HHbyGQzJCCQPfMw0i1s18gyMKht4Zk8wfI0XZtphDm65Ga2egNWl1PW9EREBqYeZ
	J7goA260gd1tpniSWR8yqFt5LPq4Rh6stzLrX0EZskeLgj0VnHIEnEJNDKu8VzVWB5f/91N93GK
	eYfdWQ0BXNBJgpJcwXxeFYGXP6LWA5oCncE3hvwr0SQP5rVKIE0daxM5aU2hdXlqCodIR8dGgoS
	515ThfPJF5N7SoZdiBtwlh7M9f5d/hiPxuwUpN2WMoJekEBr9d3I3fF/Hd6W1a8RTDr3YChfSfk
	bc2JLfetEKsa5IILjh+YmrlccIQAD7u+1f8JDD4m6jMtmSVU6SCdriR60NwbqzRaa7cU6Wtwqg
X-Received: by 2002:a05:6102:a54:b0:650:a5d1:ee1d with SMTP id ada2fe7eead31-71e88b229famr1135215137.10.1781270487960;
        Fri, 12 Jun 2026 06:21:27 -0700 (PDT)
X-Received: by 2002:a05:6102:a54:b0:650:a5d1:ee1d with SMTP id ada2fe7eead31-71e88b229famr1135110137.10.1781270487392;
        Fri, 12 Jun 2026 06:21:27 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:3510:32cf:db6:13c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm59986866b.1.2026.06.12.06.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:26 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 15:21:01 +0200
Subject: [PATCH v5 9/9] arm64: dts: qcom: arduino-imola: Describe NVMEM
 layout for WiFi/BT addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-block-as-nvmem-v5-9-95e0b30fff90@oss.qualcomm.com>
References: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
In-Reply-To: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
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
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfXwvlpJK00vQEP
 bf1Nu6bQnmkfvvcZs9dcJu0wfgWNIAGTbXA9Sh/2hJpG3LQsR0C+A8sFAVhOzsN42NIqTOWelAz
 81/3txCp+ZRa7oRIXo8LWRGVbn1IBNI=
X-Proofpoint-GUID: 5wKUgYTLrUa9BAAWZTHSUsUK2Ry1OwuK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX14YaT/9sa4tB
 N5xRyaM+pROh2apRvgrwVUdFgKI6mOdQ0SoqBja5cvMLBS+mfTA8xFO6N+DX8eRBGjWlHyT5AwD
 hDyxS+u3T3U2WL931UAq3iKQ5ZfBgJ8Mf1FnyhJ0UBazF34MZKXNdmU5l11Cz9N7ERP0jqbx3Ny
 EDoSFd872TiVtNthUI0EI1kkUuRd7iXFbKK7nV/ESFeFgz/0Vyo8d6Awt0g5x/BHfIgeAEkYDK3
 RCTQbRKwfe2RwhOaN1v167zJUZ1lH7ZSHk8bq0WMgIUKsQMNxr1x/b6gJJHxkcm2W0WoMvTLHEn
 c0h6jjJQdNSUsVqVt+BMRZKb8uz2fy1yZi/hMW8RL9LTxYfdFU8jzKBFcwqZTFBsDVXNweHHhUA
 E80PZTq6Qh6CyclZUOmHE7oiCQZLRI0IToA++47kqn39MUN8MGxAGqZ+gbDW1Wh+8mFrsogJvPK
 D6xa3rgL5zVs+2oiRTw==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2c07d8 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: 5wKUgYTLrUa9BAAWZTHSUsUK2Ry1OwuK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062129_891740_4FE56F8A 
X-CRM114-Status: GOOD (  12.99  )
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


