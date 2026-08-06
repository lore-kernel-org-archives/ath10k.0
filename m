Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F968C56207
	for <ath10k@archiver.kernel.org>; Thu,  6 Aug 2026 14:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=; b=5DxgLwkjjBcmnHaV5va3cRS78v
	VklOWXTp0Hwe87z51RZt3mFqdSKa2nFWYZBqnO0goKxcfRfzo0nkl8HJ6tRu1SgMygKve7Mlh47jK
	6Isc574rZYZnsRdHiDfc6b9aNKdCcht0NwZzN6GKhUJYw38xB2p45ZTJdWi3w+GoqWqxU/2bbtdkS
	ggJTBvjBTnEnfI/BCMON+odmeY2Wdbn4BJs9koC+rviXw0/K8FW23ejEyuXYtudlASx0k9rJv/cYR
	9u7bhzt6cffcki69v098KD0c0yX2P3YO2eTZRDQlSKV6A173AaRRRFVeVNiXKqCJeXzXXSsaSLKJ7
	hggz+Djw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFi-00000005zzh-1PM1;
	Thu, 06 Aug 2026 14:39:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFb-00000005zos-3ILi
	for ath10k@lists.infradead.org;
	Thu, 06 Aug 2026 14:39:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ncAm1308819
	for <ath10k@lists.infradead.org>; Thu, 6 Aug 2026 14:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=; b=dMUkAwfRDd94ITcJ
	ThymBVvr/uAsEmhYltnLdBgOLtGCsM13SpU7I1R+KHqilUROU9paqQKO7XtDhetg
	PVBuBjYCGdqam8jYXxy5T/qiV040YQCsxhS8V8vB3mRVIEMRFD1a7zWxDwFDd5m+
	sK9D1RK+Tyo5YQvG5VFtoS6aqFxRUjKyQhEIRIt9fVHW/zuCOoXKxpJmtDhgBncg
	ePMBEnGgV1mGvbRdQysHF6yLqNCKv6W3k/MIW5i/HPTF0aoWIZzQvwUrhJ9K5FnQ
	+qqM8x4p5DhndF1jJL0mKHQ+9Nw7DYmRDAS7S1GVjh2lH9CSBrg2cKAH4yoL/jNy
	CLLUpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp729vgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 14:39:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c20762d21so26070461cf.0
        for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 07:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786027154; x=1786631954; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=;
        b=EU/F7OhpszteFwlRcjXbcUd3F4r1j+WDhuzJ0W1FA3D48IaXIpQ/qLWYMsRUPBlpdE
         +FKpc8nI4jmWbtnNkSjyfPUFe6CqAa6HkQCU1nPqMkGHbKq9PatCToKSEGBvMMf1bi5O
         RfqPZJ3DrnxeK+ux0jCzPDurgQhIfZtuAoulIUifPlfuhbzjZ8+O+HTg6OVBNHFWsyUI
         oRx0lYXpekdw9h6OxGSOMq+GiYBnYXe97eG6DeIbQ6f62O2junVxm0l7GaZ0OemZ1XfX
         TX7Q9w2kVu4R9i4Ky0FJqY9BwO1JaTiq0YbOmO8vlLAI3H2izPElBa+zGWFKG7qI+fez
         oGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027154; x=1786631954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=;
        b=CbMyWb1IazNLAji7rz72ATv5eBCjSoYU3HX7c+Lmw9OuuYU3C3RscOjabjeAIG2I7Z
         yHh0FvCqZ4qv18BMT5LQHvT9QRKbLlBtlPILBefq4Ft52ELXg3mvkP9yG06/XVv3oeQU
         W0F2qKnZRfZWhF1TVbEOPr90O8h3mPhpkfAhEDFXAePBJ+BYrcMKyOflAODFcpise95+
         kMCPP7+ZOj8+cCIgB9dEZ9RLe+sqR/M3xvxkyGrsfNTvJxsqpypcMXEJ5NeuwelvwJOV
         8m/KXQeL80+PoCeF1aAEErLmh8dwVlCh3wW6YCLlYS7D9SQZN6J5GPdXhqzYVjuSIRr4
         HelA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7SEhIpz9KuowpnU7e5zPBb0YoOsKTGziQFDjGDWmhCxM/YgKUzrfd7KySo7H5KL2hmHKgq4Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzRmfjaBMMu2ywT7FILhl2hO/iSSC4kYTrs7fD33DkRPbfbbcE
	E0NG9MiJVLqW72O1Cn/uCilxgMyLDwbzEIuWfJa540UNPN7EpxJt618YgCN6KgP6TZ8JKdwEa5F
	CmxhSjDdOfT3neal8RALApyELSwspeL4l7k1/tO/oWvBsdapBSOnu2hk2KI30LMj2
X-Gm-Gg: AR+sD1167H6Q4p/aD9xdDZoJ9uX1nCk5Q7WGIIcgjjwcRVkYJivuQEgBYx4Qc5SS4+q
	u4OsMGc8bgCd8WVS91nkhW2ox2Bn4Bx9Evbm8mLLAjxaiDuW0q9z+QetsO39iKbazoQ7xHJU3KD
	yfPHqt3ylsbLBn23WBxPtlpQtN/vM/DiTejRDWM6tiWg++Rz26a/gsK10Yx73IV/IALTgBoc1cQ
	J8UFm+oncYfJmqoC9WzIq4KFTLHm4Ilg5IBWkc+CQcUEdt9NtYuz70BsDk8UcmEtwBIExjNQtYw
	xeCAS7wnFqnclt4U3u00wsEKmDNrpeCyLU8E/mYfBOLXBBMwTsq+GtDPRgyt/j5Unjh4yUijf7s
	u+cBPEhC6aTdueJjcki1Pi+pk2/HMJvr0WGJzibTOOVoklNeVhQygFQS1WkPd1Cunx6MRdr06b0
	BWUlXFOjSjOL6EUKc+LQHEA3wMJVeobPOGWh9HJWdsi0I3IbCEBw==
X-Received: by 2002:a05:622a:1448:b0:517:8f2e:5d97 with SMTP id d75a77b69052e-52ce60c07dcmr146322141cf.22.1786027154036;
        Thu, 06 Aug 2026 07:39:14 -0700 (PDT)
X-Received: by 2002:a05:622a:1448:b0:517:8f2e:5d97 with SMTP id d75a77b69052e-52ce60c07dcmr146320971cf.22.1786027153456;
        Thu, 06 Aug 2026 07:39:13 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([90.85.108.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036276e58sm270552166b.28.2026.08.06.07.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:39:12 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:38:43 +0200
Subject: [PATCH v10 10/10] arm64: dts: qcom: arduino-imola: Add NVMEM
 layout for WiFi/BT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-block-as-nvmem-v10-10-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: P9jzmy8_xIBbpBo1WSzyVFmW0gBK_OSS
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a749c92 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=JDRa4Jy4r6/BpSpxP2cCow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfXy+0tBOIDzpUD
 FYncwKM0qApNRh8Er+86VnWzl0ZsRITUv3EqLYXefwr7IpjCfe0WMS1I8hjWOU7svmm3aDqBea+
 Gd+gyOeljZbV6JEdX+NtA/gXBhp6HA9UTGGrxFb67JZr3fRNf5qimJahn3m8Rq9xAZIaO08FbvK
 zht3I9pFHytcFNMWmcjheKssNR95xRylgLGHscZsQVeHRPUcbNE4JYkbdC4ufuk5qTXJO+hvaR8
 rSQhq2JYEBCZXSCl3FTlCL/19GbQ6KT7JQwtd5BuRVZLX4RAvB5qJsPFc7kPIMH0HPX67bb2+35
 TUfuoNCujOXV2fTB9H3L1ygCDU2AAEAV33RAsJCaB/XQ3sujWVhqOl0qt5G9rxt3qee2npfZeIn
 v2QFtsrGi9wS2CPXwDmGsgvMHCwXQ56bYyHwalKFhQNFnmkGv2C7K/OuV5+9RsVhlfNYCd7ViuG
 KEOK1fxs3lTsfFDaSGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfXzakXLR6z0jQW
 99ko7zE35n80Zzqh8zZ0ZUMz4BALt73DcE2mC6LWrYbY4NICu5m27oCTFbmYoGHAOFWj7icOxHq
 xYuIP6NgevSQwOGF9+azRQD1/pKq2NY=
X-Proofpoint-GUID: P9jzmy8_xIBbpBo1WSzyVFmW0gBK_OSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_073916_001735_0201EF1A 
X-CRM114-Status: GOOD (  13.59  )
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


