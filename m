Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CB4CD8C85
	for <ath10k@archiver.kernel.org>; Tue,  9 Jun 2026 07:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=; b=t8Mwcdb5vXhkSz3pi6hRJvAV9p
	B2q53NUX0RiVoAFQsy7Lf5znCOHLm64buUfuCnwHBnwHbQPuB/unQEwxYDC5+djXwAwwgze1iufsN
	loAOqBqGezyetdMG8/hFpvq984Uj7mKHFvU2yerQhSApgCUolqCJTqrLdftl6kYioieppljvduuvW
	Zv1x9whKwf+yPWKDBfyF8IB7lwCdz96j8QLjDdtyJLhnL7KsIirRNTVehHNUOcNFmJVa559nlq91C
	l56klkEpPA/LEjPxoz+UsQB0YpjnkAUDIMzg8PTiuwfPWN5T0RD5rYRlreiK7iCPXgb2DgGMaescy
	8YYZONWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrHN-0000000501D-1Msg;
	Tue, 09 Jun 2026 07:53:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrHM-00000004zzA-1qge
	for ath10k@bombadil.infradead.org;
	Tue, 09 Jun 2026 07:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=; b=MinoF+xILfReexN6gkhDE106gp
	siQll1J8LfanJ5u8z+oZyYafwSRKGwWazine82CjX3atCRm33dQpILdV2nOJuQ+uo8qDj3ujJPIHR
	ROScLE7tL5TuOXrcUqxgf1U1ZEiVC2AwEsWflOwyNviIu4bk2gREh5iJ/YjLibHPZ0xvaxJkWYpHi
	A7+jGoRT8PxxP8mARhF615Ibs6jY+z1qPVeTPKGbhWuJ9LiRjBSdBdPxaCEVDEBonyM9KwYPRDJQu
	hILOpwxgTQNk/cxTYhQrAhnxMpduxfVu1zruEmfwUu4KmX0TP9+lahTevkdyxRbSdM8gCGSLJg9Gm
	/h2LF2bg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWrHI-000000027hz-3rNu
	for ath10k@lists.infradead.org;
	Tue, 09 Jun 2026 07:53:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rdRq1958611
	for <ath10k@lists.infradead.org>; Tue, 9 Jun 2026 07:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=; b=e5bwKaDPTzMnR0Ul
	MMl9KzjZPAO3D4cvHAhIzVz5+f4NuKCH3NhSokxJwdcgSWREJa/zXZS5EPkGnu/v
	2upG/2b6d4I4pjpXyUWeoPuNUMw5ILcpskCSIhx0HctiPPzjwKXY77Avs1KS3VYY
	fwvSS2wn4zQTvD2/dYODCRHpHEf7Q7VyyraHdWxMiMrmOzdZIby9H6hSBumpiZr3
	e+2kNnMcK7x3Wh1ZK+RKbxXDtLVxBkmhO228D+HagLcgN7zUKFCf/KHFHx0DS2f4
	iEJ713MhrnSeyuh2tPSmwvibmfErZu0q87CTcDk2VP5UXNLz7UVWcNQpnAlpRkoq
	KH2lSQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds8cvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 07:53:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51775f7b2afso115218961cf.1
        for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 00:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991617; x=1781596417; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=;
        b=hnF7aFcyBnQAVP5TJD5ojPff6S95M4DULT3svOcNseB/g7veV91oAmrSPpi59UlKNI
         1VQOI72l9pzamcdQfQpBRjafcjnxU7GOFdlj7/8e84FzVipDHpyVNmAIN5JJfrMKGh2A
         fKtiEIA9BsQ+2rsC3tTZAR+9gYUfpJMZIAdPpe7KlDrESXebBowI7FHZ0JC11Zmh2+FB
         a7VyXGCFHU0KyY7tK75lW0yBByPrQwTIa462Ho5/JlpTYSxo40LOOC49DPVNRQE+QH1x
         8KztOEZ064KwfQjHR3b79z1Ytc7tw7sygaov1uplxdwvFgSVxp8wwprR+QpVQ43o4gis
         Jj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991617; x=1781596417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=;
        b=g3mr4cdchBI4I97xkPIDEfC/gfQ8vFhd+Gab19j52j/3Zuyhe5kXF9KlzXc+9enHNR
         3DemGCpyPiCEBUH9Wv7I5TinrK1xMDg/LD0LqifKeGaPpfkatC3U7coyiDGjnCXGCGVl
         VK28TbQ7wsJcVy5brw4LvL0echruMr9PsOCeMBbj5MZfJqbkEcujE1UfDLaNUaTDddXv
         SLqXSdpy21XIPxkCQItAxzWakXroGeagkIv4RTPZlNzF7vrPlgiLAxWfvR/io48SjP2c
         FtpPV/onyXs5r4qYzd4UREakY0+6NVA3ce8ABsVrjWauta5y58TCatl4snC8YRn7hLBt
         LeHA==
X-Forwarded-Encrypted: i=1; AFNElJ//yBGUjAODrNwD0hBUBr785T7/gqNgfSUi+iCoSDANcG2Y++KDA3i9KP2Vp+0qlJpxIznaOpk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXG3cpuwcZ92clt6qklCy9ILC+DmS6qJlXq/L+iTlr2iW+8urL
	hEYqO1cjRIfVo+o/gK6r3OUz3AU9zyBkabGlDRXVNGS4IrBEWLVwNv+mSnTVrGvCaopgnfAnp3y
	pbHCRB0jhSR6JJRnyPqMVNaYRU+QOYFps0UUarTWYr/TOPxWTjWqEYGXIgM/rPAd8
X-Gm-Gg: Acq92OHyWiWRYRl5LfgGJO16ow91i9Qu8IswdPRiQCD/QrQU9R6UZrhlpq4n6VbjvbC
	CUrBHf398ipsaXmwLM+f8pc7LRewETH8IYukzmrff5LBkS3Hq7bbE5n41q8Ypd48XX/rf3+Z8QT
	VLWhQUGTnFtwkq+ebUWi9hSnsVnXkjpqTKdy+MTpIMl0yAGfieRWITtj95gugESoUeO1cg4OfC2
	iN+B8Y0effdPA4ILY1LM6FW/Uz61l7ziEL7vXq5uRXUADLp5k/Xpg5mpwhaBy3bNf/r6qUORTFT
	Kk3dG49jbeWM10GnZP4rhUyICNWxk5Buixn4kuLpqAsZmStzt859eYxHPnTD8Hcfi0QyHoSrvK8
	KFg81EvOtu4yULRXURJbUPOCX9FZ5ckPlJjwkbHhPtxAt7MrblmrsjvCVN7lXgw5zxrYLPbDx7L
	IVdhJ+OrYdxS0PTzei0qiTQUyXqrv4L5CuIZAYQNnZ+74nLBsTbluCh5hMmEY2TTKFo0EwftnqB
	p+DkZGTaHFc
X-Received: by 2002:a05:622a:1b03:b0:516:d7a5:afdd with SMTP id d75a77b69052e-5179867241dmr191571641cf.3.1780991616865;
        Tue, 09 Jun 2026 00:53:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1b03:b0:516:d7a5:afdd with SMTP id d75a77b69052e-5179867241dmr191571431cf.3.1780991616438;
        Tue, 09 Jun 2026 00:53:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm8121631a12.0.2026.06.09.00.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:53:35 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 09:52:33 +0200
Subject: [PATCH v4 8/8] arm64: dts: qcom: arduino-imola: Describe NVMEM
 layout for WiFi/BT addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-block-as-nvmem-v4-8-45712e6b22c6@oss.qualcomm.com>
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
In-Reply-To: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: d9fsIyYWk6lUPswNdKHfE7Z38sk9awTl
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27c683 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: d9fsIyYWk6lUPswNdKHfE7Z38sk9awTl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NCBTYWx0ZWRfXwvcqnvsNxK/Z
 fILjB6WuG5ehuKNL67vsI6LM7QuYOhHO8YD7eigXJpUoAT4JICdN8hWMafznbxErcvkj0gfc2Mh
 jCF3o14CjLEATQt1NlIPNv7TRuZVO/san+h1/QpVsbUGWwIgvneh76dgtpodul9A2cpJLxUyz8R
 PlmXdS8cxPMV1XqIzyuNj1iHR+dXuLaEMktHsWlZzLczXUhC50qfLQH7G15EbmCJE8xLR0jUBXo
 6LlRgZEl0Hr/zYw0KGFDt3IIPmq4Dh9gAuQDnPHXWJarT/iHl+8bAq5JNAp4sJmiBJAf2mY9Hg9
 THx5tO6+b5WkChOLFtxdgWRuQJBARwQeqI3Tdplht8Bee8cfHo+bO+VLhx7GMK5VX/vx0LB0UxE
 diT1yC9cIOXQGj2Zls2ctvNbv4M4To3j7hX5O3gipFf0vV9GfMLHuM9jxOB1iUcMsaDfYFACbNv
 Jmv4KnhDnGexYaYrk/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_085341_453464_89487721 
X-CRM114-Status: GOOD (  13.18  )
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


