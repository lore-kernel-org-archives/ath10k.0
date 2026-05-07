Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4075BCD343F
	for <ath10k@archiver.kernel.org>; Thu,  7 May 2026 15:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sodB+04y/mdW/cdeZL+z+1VhhOZL3GKbJATgOyNhgQ=; b=XBTYV5Ix+9b1wW1wWrnDWZldsM
	pSf5PNXKLw8OnvG3wAbnQiCxRU1m8K584PioZJZMUnC89bNMfW59lx4cV3sDlQjXvCyfqt9ECwWZO
	6lTWqoABiAeN1QFg2+WPibi6FXSuqJmNeJAEOBb4RRKlPKw3tdy0rlDxaXnxdU/mGXtG/JuUy9vsg
	hEZL1Yt7Gfn0FooC0uPBM8r8iZd2PFW/qMN6ywFYPJ47TR21lXko4UZ+eG7mLhYp1yMBLALuRUn89
	kobWxc1YSjIspJrJr0gXBAWGmOE3iuQ2UWdPEascwtBNz52viAmZyID30queIU91Xknt9BBxDsSXV
	m/Se3Hhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0bA-00000004AsR-3zhM;
	Thu, 07 May 2026 15:25:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0b6-00000004AkU-1Zy8
	for ath10k@lists.infradead.org;
	Thu, 07 May 2026 15:25:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BcqqS3157830
	for <ath10k@lists.infradead.org>; Thu, 7 May 2026 15:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+sodB+04y/mdW/cdeZL+z+1VhhOZL3GKbJATgOyNhgQ=; b=LWAYSYESvvmgzGOx
	ZuGeDCIveSsdJxzhtGMmkhkB9d0hLh5zvSPgCuKllGO2/gjLQ7GoxOvZ+8pdHGUB
	KJtzP7511f9HHpgyexvDoSArItpj6N9yEWa8EvVoxY+mbm/YNwESbiRdgy6LC9Bu
	+ZKS3MxdMSncrx3AMJ3gagwV2V0tmpcM8jt5Zk+NelsffYsdqP9zMmfhzZ7Js9tU
	aHD3bxnBnPoGFwU4MHfaHc2CYKmfFxw0rOQZ/PyVSiNrPwLHBiCKHp/F3GPqaEiI
	vAsBWgQdVxpPZ4UpZ6kQ2xLOivxSe/Hr3AOqBRjm1//4obbgK3FORcxnClIxjE+S
	JUKQew==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf28hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 07 May 2026 15:25:07 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56eeff9a41bso2276436e0c.0
        for <ath10k@lists.infradead.org>; Thu, 07 May 2026 08:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167507; x=1778772307; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+sodB+04y/mdW/cdeZL+z+1VhhOZL3GKbJATgOyNhgQ=;
        b=H39MBIunSQ2M1znYrwz4ui7mhYzPP4YCDPPuUByV+H17C1XxElvmYkICuW0ycJ8dCl
         vP5CX1JB9P3P0e5SLt94BrXVMgdGPL59Jlbx32ah92CeOJHG+LYI5FRbRuAInHHLcSga
         ebUQUyVOwuQNfpOwBB8Ficf6p8mV32SnE38czXt6dgcLBABfQgURwZ5XGyGywdICDcIj
         D8+yBZXgCe++l4CB3YsnHq3Wcrhq6apOii/d8EJFdEXmeah8bbwG8yefTYvXDWKdX4gK
         7N8CqZg1cxKeji+o0djnT2/B5czJoelk7zy8RfsxdO0fCbJLujaRC6ZOFiesUG5LLUhg
         bERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167507; x=1778772307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+sodB+04y/mdW/cdeZL+z+1VhhOZL3GKbJATgOyNhgQ=;
        b=rBnVwAfFhXJA8flZeRXSW/j8V+GPNrf0S8fTNfFMClydsNqG0MuesqGwK6u9rZiRL8
         MtlF4cNjx8IqpZ05B4aKihmzs3DEVeejSqDFD0EYuw3k9FRgme50VXU/PpKRK4scL3yq
         xuxHAqOKRi22m9dibxCWPH5FZaUz3PQxN/VM9935A/K6i2tqZeK3ZWZ3Py2yMpXcfLZt
         PCmocJJcKt7VFUyMYJ9c9LpBOsK7GurGYuDlpWlBFbdRRk2O0UoaS7s3vIjmmY96qW6s
         d0p+kAIBA4wpVCVwGSMFfcZWusymURtaNVaJOks2WQnb3GBGtzlHkFasrZ8TYVIROb86
         ksWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3zfpgEycYB7sA6e9hN1nuaxpJYTX5x4ECS/3fYeEgQNHJOge3ct3M8bpzRutGrSvvHvFxmtU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyfJmZAIiek/9YeVCMaIRE1xnvWi6IsyKBw8Zspen/kx/BNGlcK
	almippv6QZFSK+JaFWTE83FQSvioom7tGTmhFLvUKSn5MQcLcQbf4ZO/8qQNkmcK2BeAjP1cy4B
	sgw4RyNOqbrrVCVcHdOQrtzQlPOMJBzJzITi6nYipc0MdiXzo1V7C81S/w3wGl/r3
X-Gm-Gg: AeBDiesBUXjwiw+8gzrVPBTa7dj8dY7okJJ5lCp9sXf9oqd/1HGo3Pv5hG8Cm7WNPJe
	40V4IQ8Qp2RuZhmESghbd8onIHDijfQdOUtkqSgj7v7u5quzFxQ853XHXyqSwoW567FZNJVjVlJ
	Bacsl5zE4eoC0iusS8s9ZZm0rObXRfsqVISJT1NL/S8tI2e2H4h8t0R/w+LjeYLs+1sNf1h/eXQ
	UwLbCzOalzQoAB2EuLIjsus4Yll4lXbaXfGHguuqWYNdLGRKusn3CiTxNq9KpIKCGgKhQcMObGc
	X4JQ7IQgJGUHWoMR0pfJKA+OisPf850kKKq465bUvZdNML09ay5qcIEOQ51WePR+A6N83/E8250
	5OBCkAisP9nRZjAV7b9Xz95rxaGzNKeQUiYha0cOYAr2CCS4R9GRcc/ljHgG8kcq2gOpWcxN8KM
	OoaCUGcxw/XlZ9kRy79oAxmH8SxWoM2TMJ9/14Dw==
X-Received: by 2002:a05:6122:2a13:b0:575:2166:74c3 with SMTP id 71dfb90a1353d-5755960bb57mr5381616e0c.9.1778167506646;
        Thu, 07 May 2026 08:25:06 -0700 (PDT)
X-Received: by 2002:a05:6122:2a13:b0:575:2166:74c3 with SMTP id 71dfb90a1353d-5755960bb57mr5381466e0c.9.1778167505322;
        Thu, 07 May 2026 08:25:05 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:25:04 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 07 May 2026 17:24:43 +0200
Subject: [PATCH v2 8/8] arm64: dts: qcom: arduino-imola: Describe NVMEM
 layout for WiFi/BT addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-block-as-nvmem-v2-8-bf17edd5134e@oss.qualcomm.com>
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
In-Reply-To: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfXzTDGDnd1KDSr
 /4D9fgw93J/AHU7fpo2NW9jmYQZNCWuDugOSBF6vnMBbG4eVroFx/+LQ1XkAEArmb6OISC49hKg
 PBDQciUOQ5i9VddnT63Go4HEhNdPP7LvUbzy/8iSVh7D8jo3MTrB+L9JkMxc6eujoD9aS+eKVQa
 9SEGlaU8lwLTYiJeLIDizJmtFg4Yfepn/oWyr6HSZnwimp8x3113OdsW3V/YtkhKOPtASJ+iVGC
 KiKoyyQVvFQJKQE6GPV03RuA1BmUoDtwoFrnj9H/hjO4POS8QwULaAlOXGN/O2XOdtW71/aroVl
 H3RA0zqf+DRD/zEC3snAqq4lslyvmASQA4Cm62FNQmWkbPaIl3xGYuaANfwQlrR8L8xXKRbQ7Ns
 pSyibEZCzjb3HOrjZciQpM5BPYFlEhTpHyhO6OscR6Zuo9rOCuXYq/dfrdErh4/FgS5m6raYMGx
 55m3wXvKfLjlLvbmaog==
X-Proofpoint-ORIG-GUID: 7WDwKzcu84zbUkEaDTQhvLX-Aa_FlJAw
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fcaed3 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=7004nz7suiqLHAzt4fYA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 7WDwKzcu84zbUkEaDTQhvLX-Aa_FlJAw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_082508_543259_C8910B2B 
X-CRM114-Status: GOOD (  14.01  )
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

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index bf088fa9807f040f0c8f405f9111b01790b09377..6ed91cccae2fbf0723629a4db12d2724312d50b2 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -409,7 +409,35 @@ &sdhc_1 {
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
@@ -512,6 +540,9 @@ bluetooth {
 		vddch0-supply = <&pm4125_l22>;
 		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
 		max-speed = <3000000>;
+
+		nvmem-cells = <&bd_addr 0>;
+		nvmem-cell-names = "local-bd-address";
 	};
 };
 
@@ -557,6 +588,9 @@ &wifi {
 	qcom,ath10k-calibration-variant = "ArduinoImola";
 	firmware-name = "qcm2290";
 
+	nvmem-cells = <&wifi_mac_addr 0>;
+	nvmem-cell-names = "mac-address";
+
 	status = "okay";
 };
 

-- 
2.34.1


