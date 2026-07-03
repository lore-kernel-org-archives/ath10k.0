Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3B0C43458
	for <ath10k@archiver.kernel.org>; Fri,  3 Jul 2026 13:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=; b=p1Pjb3XyD8CPQnVJzFO3Fa/nmh
	rx8FxdbsZI2+INmPpPs75Wui+JSdARJVyIIe0IKzNpjhfPwdcJSkZNjCvF/Pv3KlrR8oAk6QKn4QL
	j4CxLhXt1DDFy/CiMVpXmtN30vXz3x2mpFbkZ9B3IDJOy6FX3PsLS1MkeFYmjbtbn8/9Kceq97ptP
	LVKvmCg1QptF0qdsVBqV6LxoG63BEeoLzfixLayLHwUWr7QJs+J294WHORRLDK5TszRsJTFA8xjZ8
	XahuzyyeBkT8rYOl9NWzD8JdwdVpMROyFcFKvJ8hqWyjB37fmjahQ3YUnH7YGGx+waWpVwre+kyw2
	agrdTGjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeDH-000000078QK-13R0;
	Fri, 03 Jul 2026 13:45:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeDD-000000078Ke-1vsv
	for ath10k@lists.infradead.org;
	Fri, 03 Jul 2026 13:45:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BMlqK3136095
	for <ath10k@lists.infradead.org>; Fri, 3 Jul 2026 13:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=; b=m3ZeXph0qWHngde4
	cyKZge+jjCK5fC4rR9gZXCNMwv//46MvW0g5T3GTreKkoX81ZKjiGv2oAyBuI3J8
	AWDZ7yFrfxrLeyTltJ6MAyeFz1owlPAK3WMFy1/csjR+M6n+ZtfDY620VL38nM2h
	dJzUsWvGIC8BIEz8vc5uDQBGjV449EYxd1mORNaVVPAgD7kyEmii7WOT6T9SJhFF
	Iqhv18Qe4JGzwPqYT5En9tvzwEm++OlruahreWLUcXWodo6IduWS6YXkoMYvuwbf
	uX59OIdL1VpqYEIRfNysL+zWXfKlJDhp6F4c49B1EP5NfVFsPBai7e+vDDgF4gD9
	qOUvdw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5ak4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 03 Jul 2026 13:45:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f1d3eeab92so6128676d6.1
        for <ath10k@lists.infradead.org>; Fri, 03 Jul 2026 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783086346; x=1783691146; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=;
        b=U9ly9GPEFcJTEwE+z7S/9L4sjOyixacbh+Dt2vXsM9iI84XiR9LpIbTUDt3vr21WJC
         ylvh3X6pwrfdWvP/CB32TO5/DEkd+iqanEVUxjA0/F3Q7bYIpsBAAGEVyx08q5HUnORB
         b6ddGs102Kbym1EYTJfYNQChhcqEeKpdHYPK+gGf1oyURfn0lmld9ndzHncd1bi9AgMO
         DxA2vXhT7vqZzoUMkHQaG337XDaiYThBGJAXXVECwClAAzPLDEajmyFcy1oXwka94pv6
         hsfd2TQIvREMBJrLuIi0d83gBWzzGauY1BPJmHQiQzH+jdTcN/UootsPw7KUrEhuHG4c
         uN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086346; x=1783691146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=;
        b=aWsyNoXZ6QykcPP/Act34QLsTd2BsUKZJZQRoswkioyj/pjMp3E7hX+L7tMCABf+Hj
         ROneUAF0TRMvx7vVe2J18yzYBZnVBqGvNvKYFqQ9ENPw8nIORRH7zVljRICSSf+AC1HS
         Rv+zO49yUVJjUdIlX47UwSZm1Xu1ExR5qm9ORhO8RuwUSNw9D3mBO//OdlZ8tFLA3QXy
         CSEGROH6z3JhMAhI5aMNTaA2qJRBghqbczKdXYwUK4s3U8qeu4N9/vmK4S+7P6rvDBMu
         biZagI0XxRaZDTLUYu08qmJlRll24KDLrXqKjjO/BzE3k0PofziEyFgJaKlYAu4mO81P
         CbnA==
X-Forwarded-Encrypted: i=1; AFNElJ/eXZoIOep4iSqtSigMIP/9ttwp07qg25cPVs5JJ5LAc7xg+tIb9NT7FI6rtK8Br8qAka+VZpQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe7MGhpM8Rx6DXcqyqMQ3hsls29LTD1dZKONTRRWhX5gf6xZpE
	ceTXZMh+EtJCSVrYXUD3sUPcAeCKtcr+TVcNhpDId6vmaa6ZTNeXFYuvcqNzAGPh9PZOBCjxorA
	3FUOAHN60Z9af/o+oZQFNjeAjrASnuEL1eo29yc5KQbiNifU9QN+mt59hihNpeh3a
X-Gm-Gg: AfdE7cnT8mBLrdJr2zsO6wY3VNfR2zoMhHnr9J9yIq11BffUKq4G4r4uegKB/K8xfG/
	o01ZDPw5xaqnSJb7kLJgydsJbfzSd9c5RqhCHiPPLe2n9OGmFsmxnB05u6262qESCn2vQ62YPmV
	9e0Fam4Kv1VzYDJ5rWNSqtaBOPg+WUXu6paA2IRyFMzTgFNRjGTbAHwUyXnaN1r4bkMugAbNnXD
	UBWO/y8gScY6U8Ms8ilj1pHZ8tgz1lUhs7Z0TP7IXe+97btkB8YCOTB8MeW3ggGaqh8wCpuiMKZ
	INNN55QT/jA2O9fRQAe/s4ExNfJC9j7bgFC+BdLJK9DrCInOmizu2fUrgGNd5xn3E2XsQP6z8xp
	TAkRnNzeey310PsW5ZDa3955/Ge77nmUMlYL1ohvHq5xwj78Sx9XwRbt88ts2CYb/O6c8ZcTEUF
	iaDJjXP8sH0gHcs5+u17qiP5KS1ubXdKV3wZYhcnm6TmTcC2oh7nR+muNY0aQZ8w0=
X-Received: by 2002:a05:620a:3186:b0:914:d093:abbe with SMTP id af79cd13be357-92e781d3eb5mr1407958685a.12.1783086345662;
        Fri, 03 Jul 2026 06:45:45 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:914:d093:abbe with SMTP id af79cd13be357-92e781d3eb5mr1407952085a.12.1783086345170;
        Fri, 03 Jul 2026 06:45:45 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm286135466b.1.2026.07.03.06.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:45:44 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 15:45:22 +0200
Subject: [PATCH v8 9/9] arm64: dts: qcom: arduino-imola: Describe NVMEM
 layout for WiFi/BT addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-block-as-nvmem-v8-9-98ae32bfc49a@oss.qualcomm.com>
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
In-Reply-To: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX5prUpGer4x5q
 cOMH0f9vBa5M2pM5A1IflJ1825WurWB7REy3mKdEgN5oXHvPZEKTMv8uuxwqDUaxMtvhrjX9hDu
 APEmY9xHypOi5PUtc1ENe0bKFSmvseI=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a47bd0a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: ytUAsECR4A_9Nz3jL4EgTpuY04M_Qj90
X-Proofpoint-GUID: ytUAsECR4A_9Nz3jL4EgTpuY04M_Qj90
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfXwm4WC15aqbXQ
 N4W8D0Tv3iRm7iFWw7IhSqTd1rqDhfqx1t268AWXorFmHB4fqZwNNPYYC7FA3nmHfo05p2kA7uE
 lhNlxHI7uK4yeqEpCUvwIWDpe+UuwrzhF46/oIAK6fx3We3rA8nw6nCLsdrkTWsfUPG1qG594H7
 ldUxmH+/ebSJTf2xC0R86OUv/RdGgJqNLsOffQEcOqHUZy2J9Os6KDjn+6a1rPiH0rx+Vn/g7Jn
 Sib6eLOge1/8FYbzOW7868WnzPV39DQa8FkSZWfAtYK4Xf4T9K410HCCVy6Z9pgcXowFjwBNfuS
 P2fzsLqyoKUZabn4axnz5W1GFNZIjX7Xkr0KAIITxQb13i8TSnZhmkq5Dv6NChTzWAaaXlhJGBY
 FiKElvmBN68IMms8iEv2VB5Sqn/8i5aNoKkMbDnbsnCeIpXtLDhzIjI3U1FFhzD8+hs2FPX2lYq
 OFwgrG9B9qiDumCFF8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_064547_561698_653852C0 
X-CRM114-Status: GOOD (  13.55  )
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


