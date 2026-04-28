Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB88FF8874
	for <ath10k@archiver.kernel.org>; Tue, 28 Apr 2026 14:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCqCzlz4VIr+zRAIjiPoA3dsT7YZuy9FJGQk0vmxxKY=; b=GGreM7dv9zEUSfSo2/eE1wKzNf
	5qKBlC2yZFpyRoZ3h3P6l0ZPtEWRitkMBnmXzVfXp9oZ7vIcPO253IjF4s1ZUSqzXhw9139XGyiDQ
	fXCX+C1G4N3XqsKRt9+OAgXFgxqQ45XXQuAu0ng9DmDP5P5TxSUFkQr0zItllbt2X95wGYgp/XD41
	qSgnj+J40GTrYbBRRoUMW0lHAuRMRau/4mDTbjRPJ4s/9FROleOv4olDpWRseo5a5Fk0Bfu4j5CIy
	hGSTIzS1Btq2nY6UJEFCLWmYEVFiKO8sJ+LrWOo0am4ZOozJqvtRDZtUCHFHsRKBB2+FINM9CTwGV
	AIeoJZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLN-00000001dfE-1duf;
	Tue, 28 Apr 2026 14:23:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLK-00000001ddd-1Hpa
	for ath10k@lists.infradead.org;
	Tue, 28 Apr 2026 14:23:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SBqmSu1625047
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yCqCzlz4VIr+zRAIjiPoA3dsT7YZuy9FJGQk0vmxxKY=; b=WW78sBvIUBy1eVFU
	njJYuxlMhWipbbcVudjhYGGP+XiDYinoeKFVUBhnPDAEGLfcScUrldggbPiLQx4w
	yRGYnTpOVRigSrjJgWenphU9HcLPtD80UsQ0NPNBxJCNY+Y2nRA0oaebXe1yf2ET
	XnvV+zwf2g5DC3bcqTe4l+IIwbQ6DCiXA1shrVwUbs6Je2t1uHc0Urky9gWUYWuV
	TWmdr6s7Zws1UD2ea8CbD5W5+zyyqfWV/QYthqt5G2CR7BfPyZYhNd+ZBIO8Mmek
	Ci+ElfzTMJxdzLH8mj+xDSTUQDkGLtZwg4YwdNwabusIJW1pSgyugppW5hNzLx5u
	Ey/iMw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsbex0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e5a336b44so153509891cf.0
        for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 07:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386196; x=1777990996; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCqCzlz4VIr+zRAIjiPoA3dsT7YZuy9FJGQk0vmxxKY=;
        b=SuHQ7uLncXqlMq42zQroYHeCdKAh0gIl/Ii+3RPyeakiMA7OhZwrq17ld0Cg/Ai3Sj
         Fg8bThiE7zDW3Jot8dKf56XDrZ+vt9WXkTofAwIb2fyaQUjC5SN53bXEPa/JjBzYadOF
         YcsWtZCtF1lMZ1UAEh1Nu5h94M7La0SF0R1/6HsXi2xOC9jyD1naWiVDI9QOK3HBpDpH
         iDzvHyYZXO/NXrhrKRZ80g5ugIu6M/hBkKYkugypgUrff5nGcr2fjUtXl4+1DKtWhKGe
         pgmBHSp97gtaYwIYI4nU1Opcbky1Z4bL9VYVG/Krl2xM6USYss00aE0Y6Vtuws3pt01b
         e2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386196; x=1777990996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yCqCzlz4VIr+zRAIjiPoA3dsT7YZuy9FJGQk0vmxxKY=;
        b=YkmUJckdfdzghNalI2C1/uC7v3G9MonkOy1iBegWDGTzMEYG+fg+4klFKsisOVQf60
         CTEuJvDdeVC+dbu5glAfGngprFc0bu5wjFbQ7pwMqjBoCAzaG2uX+anuk3Hqgctmfgf6
         00PKe4mbj2VmvSzQDyYTJa8u3k7m1ixmRHr8+k8XJLDxa6jedeYRFNo4svbGhDP9zPXu
         q0H1Of4RWTzNGBOXtteKe2BBvIWZaE+lpLNlaTeMAKpeSn/s5gGzTz9RJ8z+kbb5+EA/
         T61KK+kZ8Nxs96cByfu5PU3S0NpSKK2cLWae7qSDiLBufhIRRhNjVRPXW963otzE0gcz
         5QYg==
X-Forwarded-Encrypted: i=1; AFNElJ+41SjzlVGlnLLTZg7FCEyg1cwddjLhGbKNyCDUksM0r8E+xYGwD7S7mbSpWmZ0cJpcAwaUv0g=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZk9ZyF6NLlsCEARmzh5tdK63/5FA5kozIkC5dha2OMc0UFkl0
	SGhzw2wqH1M5QMFiXLSPqGSFogr9gAX5eApWZhIa3hZRxQRXGTJ/7NWdxpy58Jmou4Wj0mQgGUa
	JR0SslcLnksHfc5KVHVrT3g5SRnAONsAY1DZ0JNbUbZldY1C36aYA7AttkMmMGe3m
X-Gm-Gg: AeBDieu32Jn9kl26D+oPV34XTtFTmVJaDNTzs9UrAgCArqBgjOaFuibIuLjklcgdD67
	/mzG8flJhTGHCMbiErHJyZLqZH1szCJQD8b4wwjb19WFnwFnq4PpmMTLOb8dNH4ccdIv7IN34Hh
	jkc0yUPlrkAgQhfXiD/PQKNOVb/Ho+bKBVlrUGC97pAKaPwefhdKbce7SVYjz4jiJkK4XmKW8gY
	Rd+1aEXpJ+XEjHB9ARjXyZVyk5uKBdJwSdiJlunLIhfLgg+gSvE0XmvdJecjJkzrreSlvubYJ9p
	LJHvcBsT1yOqRZjVJ0DwXqjQSI4g93iQ7IgVIfMiM7dvOea87UDH2tju6YilDPTn3trH1Neu0Lx
	/JQQmbknbwqLsYRp5gh0uh2vdmk9N376PIJzUNwGuVLMB2AEdx+gewTP+cIXxdwwzWUNyDhXA8R
	w3ituCk1yNUtmN7CyMlbpHlyFU3V0=
X-Received: by 2002:ac8:5750:0:b0:509:5c6f:c0e with SMTP id d75a77b69052e-5100da85790mr39310881cf.37.1777386195891;
        Tue, 28 Apr 2026 07:23:15 -0700 (PDT)
X-Received: by 2002:ac8:5750:0:b0:509:5c6f:c0e with SMTP id d75a77b69052e-5100da85790mr39309901cf.37.1777386195170;
        Tue, 28 Apr 2026 07:23:15 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 16:23:07 +0200
Subject: [PATCH 2/9] arm64: dts: qcom: arduino-imola: Describe boot1 NVMEM
 layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-block-as-nvmem-v1-2-6ad23e75190a@oss.qualcomm.com>
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
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
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: yLBWKOoQrd6JwxKkvg2tUJmMQghVuveS
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f0c2d5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=gjCkitBQ8UzLeNF7HDgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfXwFNTBBy2qZ4h
 8HX65tf5Ol5HrsID9eReNC/zix0Zas66MZbtux/BI43SVS9p6pAYsuyMcFSOZWzEI3+/plcAqg0
 De9I7bdvG4m2yXxM5XWkXpm7lLV5fmzH966wbJ6BN4i2ADIjQ14iSRHlXzMoCcRro9lqSt/D2H2
 djtD2ZyvFSdcCq+7K5oJcDbKAFDiDtThE/qOFDUvq15bsGE5kOewOBykIijAPBNhjLdXiZd5fn8
 QTZt74nxrKpgN+YRKdxgc48vF3HC+VP4Bs7rZPIZCPOJr1vEgTkq/xfa/7Wk1CN9y6xqcM7A+4M
 mp/2GAwxbdot+zWoytkFlkwPr/U7E2wFQetB0Sou6RIXpDYQ378PlsAMGsQK5PDcen4LDnUVxqt
 zY3mChqMnEyFlNHkzHhinljtUBzSkpzfwToCjj7UM1JYKQdHTTh7HznCwX2p3bvvN10x2O3Hx5G
 xvw7ckgA1x4pFn1O7cA==
X-Proofpoint-ORIG-GUID: yLBWKOoQrd6JwxKkvg2tUJmMQghVuveS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_072318_353224_6E237D15 
X-CRM114-Status: GOOD (  12.71  )
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
are realively small, read-only by default (and can be enforced
as hardware read-only), and are not affected by board reflashing
procedures, which generally target the eMMC user or GP partitions.

Describe the corresponding nvmem-layout for the WiFi and
Bluetooth addresses.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index bf088fa9807f040f0c8f405f9111b01790b09377..dc85cf94f71cac8666cab30ccf37cc2d2f8fd941 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -409,7 +409,31 @@ &sdhc_1 {
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
+					reg = <0x4400 0x6>;
+				};
+
+				bd_addr: bd-addr@5400 {
+					reg = <0x5400 0x6>;
+				};
+			};
+		};
+	};
 };
 
 &spi5 {

-- 
2.34.1


