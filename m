Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BACCD8C9F
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 10:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrd8MOMRQbi5cop8RgeayKocEI5pMrJ+hTvcAwk0fUw=; b=WsLq1rbSxGorZFMrSVNOV5yngF
	eqfKDI3aMNmPDZZvIL8Jh0hv9jkKzm5LPdaiRKo71bvRuZd+0ASL+MQTaz9L5Be7geMyo2+/EEvxX
	PISExGMy4A0RjrIA/6tuI0Lbm/z9Ysn1yhqwLtpQgHDj94eSpTr0DcbTK8lA/KsJkTM8rsSl12JkV
	Wsku3xxuoCIYXFS0p5TViI+2QIL/GpTmu647A4PJUv8wb4d/GR6+99ALiddfYdNN9t/dzSDJG9EkP
	WWjrKHYe3jVmBQAf9mXmmQwkBNbrYRheGJPNz8ms5lxq151ajZy6YOcIlvPJslTf7TPgf6seJXNYN
	8FNSk1Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXZa-00000003Muj-0uK3;
	Mon, 08 Jun 2026 10:51:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXZW-00000003Mrh-0nrB
	for ath10k@bombadil.infradead.org;
	Mon, 08 Jun 2026 10:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qrd8MOMRQbi5cop8RgeayKocEI5pMrJ+hTvcAwk0fUw=; b=LUcw2/B5TIml3R7tDvV58FTKwB
	tITzul+R3c3Nt6r5RiwGb6/SVSuC+bgnDhyhyJwJ4/SE1uuXPPEacm+Gb9NEj/zPAudAqcyNn65zn
	usnJbA3PHSXYfb4QGLGzPuzP/LiQ9naN5LzdJkQh2rJeBM3wSw/wlT/gXR/pmCCegtaMtghBdBMkk
	9+0weHIMF50kHVd9zpA1MYNHOImb57Jdb2UgBKVz6jVdI0/cjCxJAPh2p3GR+Uu/r53oZtngGTA/+
	SwAd6+D2hH+vxaSTl1Nv8GQbdMGNUcNS4INIoRlj+Oy2EV1OwH0WExA9BNXjdWg5A6bJHawGbCYVN
	+d85ozFQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWXZQ-00000000skT-42ft
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 10:51:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OtfL2384511
	for <ath10k@lists.infradead.org>; Mon, 8 Jun 2026 10:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qrd8MOMRQbi5cop8RgeayKocEI5pMrJ+hTvcAwk0fUw=; b=oSQbd58TS3J4fPkh
	D8NBgfSqRE4G0ju5YPyk+rMa9ZL50PhSoGPPrFDDTcZhYBJDZEHkCnYuwgTMaYL4
	pjyrt9NcmgY7izp4qSZiL96gHSu/39EgZVUcTY/mQ7dtlF994wYMaBgULVGyyINL
	cST6PqqkX56lHDjQ29ZOstQ64nLHTtjSDmkf0UUjxxcK00WQaVUKDXf3StdVFNM7
	lqfpuRjiaPZ111Q1iRkcG8e0jN/7YtRnHTTmVU6M3l7EEEzzUzYBChpcrjshQPMX
	xA/Lop3FruBRkStXGV4C35JvHQ8SjJFhR2ncI8PEpNUVvo1dhNXaToiaV+CDYVpT
	UGb2kQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1fb8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 10:51:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5178aed25baso91483921cf.1
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 03:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780915859; x=1781520659; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qrd8MOMRQbi5cop8RgeayKocEI5pMrJ+hTvcAwk0fUw=;
        b=BR1MaehslsUUZ+Q5sLKIQ2eCtVWCgp6vGjcgMI5dXmficnrgIwtlGulEM1TTFBWc3r
         riLeGN5vtgaqUaJeK676Lbg5eYZ2TWONs4VC9bN/cyRd26rimDfQCG3hmJxjpbCBxxip
         vnp83SSPx0pvDQUiq5RRUo3VlC61WiH8YvFBl4a4OnMHqD92JQkwuiRJE/C5P0mYP3+p
         dkJ/0ZoUdgkRZuDzEvl0rpkMvtjdfx+la03ptRTKdcX9xje05++Akxv3RPfP7OTHxloR
         28IVlisMC7OoKBxDfDZ6TUimG9bCjlmOPYcM7Te7rlgIZCz7IIofbucbHcBarWFisTgv
         roUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915859; x=1781520659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qrd8MOMRQbi5cop8RgeayKocEI5pMrJ+hTvcAwk0fUw=;
        b=pCdiMIzSt2Bqn0ovvCgEEYS8cYEZSgwvTEjCuvIaHgw62fxn/RO7xrXpUdf87ZFHSV
         rGHWN0CoolunpfVQ4isXXHkWivpotCPR+p6NVA9gHqDBKkByAJtnG+QUVNPp1epHzebG
         tAfR/Sz57XWLOGrsYDo4z4Z02XGXilTDvqfE6rW3Z2LekR3wzRPNsL5hsz1X7A+9FFTJ
         Aph6i/wa1Cj4cpoiuHLbUqG39QPfck8ICBCaZt0MdN5lSpI572/UrEr71zR5ldgDEnmI
         XsSYzpSceUzUbV6XyO0VGIDAAupVOhVK2SYzCVyIdRV3HzpalKadJLHn6OFO/DU4Y5NQ
         ggug==
X-Forwarded-Encrypted: i=1; AFNElJ+sbEsalcaTkoFbnyAnI+TW0YCPXf011dUR1meb2dgNGvkRwCJlDH0hbuE8RrfwNvSsP+0pTls=@lists.infradead.org
X-Gm-Message-State: AOJu0Yys23/lYbHI8rknmDm6aRxK7N/WydEEcOlTDwusgrVR4LpCDNyb
	XfNJ21h2G8v2Rn9nPWBhPpkixQy0zVFQqFYnMf5Bd1+U75eTx7meSNRu8bG7PIen/1Exh2OvsU6
	5Onqyz03o6bms0EprDXuoztkQBbcSBNHgKi948U3X//lGp05wexx7w/vlz6NBpSnK
X-Gm-Gg: Acq92OEdkXad7WNxpVHOxyhEfmAHRn3vsjhXxyRUf4HixtvLCmUYkBND/VfD4vHYCpL
	40KJYtTR51ab/fcpXN0PQmRQHvvr/gMGX/8fpLZD3Alpuy6owAbfaHxIhc6Ezgh1ktSnGqUY2sB
	arrKQ4gwMG1gxcjJMAwG2iJIMIi4+j3pqGg6S1HHPY7r3a9aG+Vr2t61simm4RRLFoYWU6kw6N2
	6D5i4bDQZGwbrFLb742W+ng8l4I/C6J/Sd1ELP1+I+Bv+d+VTxh7t6Rw/beBhiXgLqhoykUGjmT
	T3z4Go3iKPSNjNCl5TR0fMu8gApgsCf3qdYOxsVfIh0dA1/2lkpgLiNGQwQPzTgkeYNKgRx7jij
	WwnJcpK+pBqVkVrcrxk+2oOBjMmoiXFIMFUhl9gYN9XFlPrSMGBHZ9f8k4mFfk2jFxkf0PecVPl
	nvQeW40J3pGj9/yFQDTJYj1n7j6HA7OruYjBV3lWefcjsAZNZguiPecafqKUFA1Ms6PCzdyi5ss
	/BCuwBTmWPs
X-Received: by 2002:a05:622a:514:b0:50f:6415:1eb4 with SMTP id d75a77b69052e-51795bbf29bmr200722201cf.49.1780915859471;
        Mon, 08 Jun 2026 03:50:59 -0700 (PDT)
X-Received: by 2002:a05:622a:514:b0:50f:6415:1eb4 with SMTP id d75a77b69052e-51795bbf29bmr200721871cf.49.1780915859023;
        Mon, 08 Jun 2026 03:50:59 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051e9aa33sm850399866b.24.2026.06.08.03.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:50:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 12:50:44 +0200
Subject: [PATCH v3 7/7] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-block-as-nvmem-v3-7-82681f50aa35@oss.qualcomm.com>
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
In-Reply-To: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwMSBTYWx0ZWRfXwVoO+zpysUG0
 /qKrnc8kI35Y3BmfjAY1PNNIz/9RYO4lGNOqZIz0+3BgCiFl6KSITxywx6tLtxaKktbGyZGJodQ
 JHL0BZH671ouKHK3YTVtfZK/7pi2wzcKWALlBNzeSmrEhYNhoJJ5k7X2r95IhlxuHwlpLCH3/4w
 XkgYdmGKIK2+B2xKBPIbvTX1jHby3ki25I66s+vwLK5l+Ixf/oN2W6nd3HfP0/h6/06JL96rXzY
 jEzmcVTEUY+rbeml38kReCgGb3AnpoqHL0YenxwzLGcPLZwVUew+UummNHS2oBmT7oTRs+X9me1
 ep6kOyfAHr4EECGgsVZCJOB+sHwPxEYe/ZNfqE9k9iVNB7iIknGea54dej41g8f0jLjGs+TAyby
 /vJPIlp068QmMR/sqIU52MNBXO6cNA3gqYMvYnNjBFCplambZG0kz98D1pvvPfxPpf/i+RxZsC9
 RKdg4sZ5GrKiTKYE5iw==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a269e94 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=lrwsl_vcuUQb-XtIoRIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 3UF2ZNxUNDBt2TU1TDLYSfLbN8eWvz2A
X-Proofpoint-GUID: 3UF2ZNxUNDBt2TU1TDLYSfLbN8eWvz2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_115105_528303_5B429521 
X-CRM114-Status: GOOD (  14.73  )
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

When the controller BD address is invalid (zero or default),
set the NVMEM quirks to allow retrieving the address from a
'local-bd-address' NVMEM cell. The BD address is often stored
alongside the WiFi MAC address in big-endian format, so also
set the big-endian quirk.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 39 ++++++++++++++++++++++
 drivers/bluetooth/btqca.c                          |  5 ++-
 2 files changed, 43 insertions(+), 1 deletion(-)

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
 
diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index dda76365726f0bfe0e80e05fe04859fa4f0592e1..df33eacfd29fa680f393f90215150743e6001d5b 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -721,8 +721,11 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
 	}
 
 	bda = (struct hci_rp_read_bd_addr *)skb->data;
-	if (!bacmp(&bda->bdaddr, &config->bdaddr))
+	if (!bacmp(&bda->bdaddr, &config->bdaddr)) {
 		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
+		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);
+		hci_set_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE);
+	}
 
 	kfree_skb(skb);
 

-- 
2.34.1


