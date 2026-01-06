Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ECDCD0428
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 01:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmEQ3DAdF2+6Wtmoo2Iw3yD7uj2xcoU63T9J/0jkrG4=; b=mS+29kJmfwFHlvzuQ70sBeWTL4
	VYvZhbB5vs1lawE3iNTx9mNc2O14ftTThYJcK50m2oMxJ7d8qVkdJ+jYwRebk3Vpmaixx1+M2CL5A
	F//6Xh3YE/yNxL/f6AHETbm55ryiYI3B21FL7UxJB5pQ3IKzM5TMOarwpD/4JixzxYOISDLEuxFLv
	FmSD2sMRfTgRoaLkOuml5bCP5ogHVkk9hZ3BCo22aXJOSjLKTqlDtQrhr7XdYuiobPHhJb/NXAEmr
	kJAIOfK+sClv5Nj98zY/z9NyIiZrSEXwRXqgE7tiNZiy+EecP6v6jK2gUbZfI5hr/GgmrVKI6QcAa
	IB7Kw7oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvSa-0000000CI22-3Sw1;
	Tue, 06 Jan 2026 01:02:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvSM-0000000CHwU-0Vn8
	for ath10k@bombadil.infradead.org;
	Tue, 06 Jan 2026 01:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VmEQ3DAdF2+6Wtmoo2Iw3yD7uj2xcoU63T9J/0jkrG4=; b=RBwl9ffcjfJFcxJdFQw+FsqoQa
	RzYlKNdvptPIEnwyJQb/iTsTi4Vzxpc4w0OKAcpBtMM7Kf32dDJqG3jEXymEhCOCnFZYjseA+KRGX
	ULb0N3ipKKGfHIkQnbw5+4zLN7E5+HRPBaEC5av/ssqtPj5qowASIGSCfHJ5iW4jfAuttWcXC7tz/
	HMzsev9xU1jtoYMklESTMBK3WrWuEZc1URNvPB7y0iuZmkoxtFlLrqTDdUDHhzTRm+k/5PX0hZt6h
	ECYkETYvowk6FVx6Hde88mQnZcdHRRT+0XXITaijz/m5RURZoGupnso50uCo6GVWnoaI0hG1QGng+
	ZV4+nVRQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvSI-000000091b3-0bPr
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 01:01:52 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nNrk2943636
	for <ath10k@lists.infradead.org>; Tue, 6 Jan 2026 01:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VmEQ3DAdF2+6Wtmoo2Iw3yD7uj2xcoU63T9J/0jkrG4=; b=SW/P6xSJUlMO/1NO
	ZraLhfiNhv4Yx6uqte310eETYjc5RwwEwXrmyl/+/JbwdG8K4VDnTsrkDJ+Ns4Ap
	msBVtI33aOP2jVgapEWGBxM1sKh7ipsuKUwwhKp5B0q+4Tw/TAs+vkavge4kNibM
	GEgidc9Sr1A38p4y/P4IDbNdqcTvlP0G2Gvqb08JwyUHMalXPAP6h1L3YulOMUoJ
	mpLz6ltavU6QR/dQhi8ZRignujAFdEt9wu/GzpZvmv9d2lVjxHZsVok54pREtKJF
	Td6wuAfcOC5WfL1lAV6LwJ8ucF6/XGFTurEk7a/IIwOqmuiOpILTiu+uDsfagosS
	Ia6WhQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv01eye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 01:01:45 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-93f5a368daeso9708752241.0
        for <ath10k@lists.infradead.org>; Mon, 05 Jan 2026 17:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661304; x=1768266104; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmEQ3DAdF2+6Wtmoo2Iw3yD7uj2xcoU63T9J/0jkrG4=;
        b=jVVpa9emCYJcCfFRj1rityHXf+TSkvt5NBVzetNK27E6ynBjJLr5CnX4ea6DLeXnHQ
         Xd4tRVXBAkn8PdwmokNUxiLrtsoza3Ke15yjXrjTO5xpxTGCnBdp9oXwr8nEimD7JW3d
         zf56et1XHst03DqeyNQ2IdzTdFhX3l7gghB5UuKrE3erJUv3SdS6hrAcS10Eobtll/JS
         6rxjA0DY4X+Ig4DmzrZU820IKSevWm1tVTlnuIP2O3cOGLxcmUQ0TWZcQ8S2HBlT1VQ4
         GfHzogXRqMPC0nqdfI9yzXZZJM5gA8jph94GrPndxtGln2/LFWgR8af6ZBoBcBc5Qo3U
         9iLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661304; x=1768266104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VmEQ3DAdF2+6Wtmoo2Iw3yD7uj2xcoU63T9J/0jkrG4=;
        b=Deeo+Uqdbah+CBGoWqNs4fJ78ZLwYHqT7AO6ibhx5GPTBQqnULJbzfmcCfWJvfa6OO
         BkbnyEFBfHdvfFuPAXRhsIVhzoyQs2FUDHagTnhGS42d/5udvRW2bDbIcUngMORgv7yq
         5KPqxf3iipy7PmG/QQUKuvKwaOP6QITs0zB8JTE+xdWcSFDg4xX3HwJK+5Igtuat4+Xx
         O6A1isdYgtve7wFJcXayWD4mwa15d3CzctqeQr7h7N0ywExmJqwvBV0YQ3z6F5RHMGsr
         NCGi3oO0H6Di0torQl4T0cKdfQNQBn6lUSCNSJuwu5hP2jo55M+t0ynL3pV6+2RYtKJi
         BbPw==
X-Forwarded-Encrypted: i=1; AJvYcCUO+k+G2X067zdXEocK6IZQ10bCyXsr/2Yl0DmrCGaNGum43L1LJnYuBSmscr8mp/iAmpeQQk8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZAq0p3Y99RCCH+4pdVh/ggTHqcEPSwffR1UtSSj1QI9Z5JCD2
	PngAvJMbEmlhakTmJUW7rVKPGm63dUU4PLwIbCIf1dWn9LLAshrHSRvFwVdZhXenQq3a/cXKb9m
	trSzevPXi+qMtm7ns7k/kYpc7heqAlTo/NZWb+ngzqrSNSwLErrf1H39NC2+Geo40
X-Gm-Gg: AY/fxX4utVIUUSH9fN0QXM/UXSEwu40yRMl3h8+OHQa72yziSLNTrwadeUwLh/nJUpv
	zUVkksN7gx1IQUQVlUmaEHltBDQTEHvoi2Uq5TcVSsHYOwiW9oxGnwNSkxdTMGTMZh4a0Taf2aZ
	RTsiA6cLN1M1zBbGxOBaXITWlqBJBKHqNeNwktXZU28VtEQ1oN533TKJeiEaEp8QdOUTWicwwN3
	jJV2kjzXUJSO0MgtHjaONfl2dAepw8Udi5GvDV3WhRjLAMzC0XO5YqVmaTQe506YU0lAeYNl8ux
	R6CwvREOEc+g5lS6NKOP3lrksxO3Yrbz0u6iLrUcER3lH0f0KGS3mvOxi6B0AO1VfHj4N2EINMG
	LTrw7FtWWFmKWvwtucjdLZ4hQnAySwL0szGcJpfr4KZXje6rICykznV378ltqTg12zmFcaI+2Iz
	QMUqkWtPSleADnn4cB2rMeCcs=
X-Received: by 2002:a05:6102:4a88:b0:5db:e32d:a3ff with SMTP id ada2fe7eead31-5ec75766a1bmr430100137.19.1767661303910;
        Mon, 05 Jan 2026 17:01:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfv4LR1s42S8DaPU2KbOxpQJdk3q7QsoDukGpuciqtoi4cKuPME3x1EvsMr6Q/jfWAk66FHQ==
X-Received: by 2002:a05:6102:4a88:b0:5db:e32d:a3ff with SMTP id ada2fe7eead31-5ec75766a1bmr430082137.19.1767661303481;
        Mon, 05 Jan 2026 17:01:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 03:01:21 +0200
Subject: [PATCH v2 11/14] arm64: dts: qcom: qrb4210-rb2: describe WiFi/BT
 properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-wcn3990-pwrctl-v2-11-0386204328be@oss.qualcomm.com>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
In-Reply-To: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JW2e3YORx1IvzyXTcxL1ItlNpE70OGRvUy5PXPZhVzQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXF7aKvZwOZUhotbdnZ0pAuTyDcOntsWVWsF/p
 InOqexTSXWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVxe2gAKCRCLPIo+Aiko
 1exdCACJMbsoAcCbACN2UqM2AdeEb9CSwAiQD0TbYdLHwQJSWOPJ1UR+RMPcIvsZsOrUFE+bVgq
 I/YMEZUtFCXMwh5g94/WO1C2MOUz0117I7aEYMVltV0WInGaJk2sZZXtQ2fE/cwrf9xHzN90Ecw
 T9zuxT+MsdY5sUrt9fs4NfQU1+e2TR9TXQ6/Kp/Khta6hWAO6DV3bt+ivvaWt8dvIvr69Boe37h
 C9oOupEUCP+oAB+hqOCa8wnWPXdQiEkXQoQrjfBGDQwvA69CRGczeHeN6lQIEt1F9OY8OmuyLwL
 pm7KYr3Uw3zF/N4XpVIkGbw+Wze7EDpv/MKgyIVfxlmHD9qI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695c5ef9 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ib3hs3rZ3KeRbPluJGkA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: tDJ3mp5isR5_Pxo1IuhX_rSKXA_Mne4I
X-Proofpoint-ORIG-GUID: tDJ3mp5isR5_Pxo1IuhX_rSKXA_Mne4I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfX0YGcZgwMInLD
 gmdx5Oxj0K2ET9BOyrhcQHto5GCmuH4hTTn0WyBmlB3oZwxSdhk81r3A6z/DPbOIpKg7vSUTt7V
 XoXZMMg83lnbrvO1UXXMFgO4CyZVHW0HeLRFensLjy/x8oqMWGshSUgzmJ5otsZPho8Xm4tCBEp
 5g2bFYpTFQY+mFEgczWm/cf+c7eabavDPpdqQcd18KxhOGUxBLHN4/yYVzuAkdMh/GEkLlvN5s8
 23YxI8MtAMmdi1umZmST4TlYxmYEgxqSpkVm6KTp54chPf4nTnfKhfOAGVjlolgqcrtQJEZERqI
 DLK0eLOfqhZh1bsT8mMmt00raq4NdY656KAa7M5kC+6utYLManhOw6TKqE/1RX7dOgqmu0TmrIh
 0ljP3Zbx7G+K51OTbK0zlyLB/yz5It3O9wJ8hWg8cIEica9dgwKAvmwhpYQk3FCtB4EKwlj1Xrf
 dgE051FTVQ0MY6Ce0tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_010150_825047_49620EA3 
X-CRM114-Status: GOOD (  14.62  )
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

The onboard WiFi / BT device, WCN3988, has a simple on-chip PMU, which
further spreads generated voltage. Describe the PMU in the device tree.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 60 +++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 5f8613150bdd..5ddf448bed8a 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -237,6 +237,42 @@ vph_pwr: regulator-vph-pwr {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	wcn3988-pmu {
+		compatible = "qcom,wcn3988-pmu";
+
+		pinctrl-0 = <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		vddio-supply = <&vreg_l9a_1p8>;
+		vddxo-supply = <&vreg_l16a_1p3>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l23a_3p3>;
+
+		swctrl-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_io: ldo0 {
+				regulator-name = "vreg_pmu_io";
+			};
+
+			vreg_pmu_xo: ldo1 {
+				regulator-name = "vreg_pmu_xo";
+			};
+
+			vreg_pmu_rf: ldo2 {
+				regulator-name = "vreg_pmu_rf";
+			};
+
+			vreg_pmu_ch0: ldo3 {
+				regulator-name = "vreg_pmu_ch0";
+			};
+
+			vreg_pmu_ch1: ldo4 {
+				regulator-name = "vreg_pmu_ch1";
+			};
+		};
+	};
 };
 
 &gpi_dma0 {
@@ -684,6 +720,12 @@ lt9611_irq_pin: lt9611-irq-state {
 		bias-disable;
 	};
 
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio87";
+		function = "gpio";
+		bias-pull-down;
+	};
+
 	sdc2_card_det_n: sd-card-det-n-state {
 		pins = "gpio88";
 		function = "gpio";
@@ -703,11 +745,10 @@ &uart3 {
 	bluetooth {
 		compatible = "qcom,wcn3988-bt";
 
-		vddio-supply = <&vreg_l9a_1p8>;
-		vddxo-supply = <&vreg_l16a_1p3>;
-		vddrf-supply = <&vreg_l17a_1p3>;
-		vddch0-supply = <&vreg_l23a_3p3>;
-		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
 		max-speed = <3200000>;
 	};
 };
@@ -744,10 +785,13 @@ &usb_qmpphy_out {
 };
 
 &wifi {
+	/* SoC */
 	vdd-0.8-cx-mx-supply = <&vreg_l8a_0p664>;
-	vdd-1.8-xo-supply = <&vreg_l16a_1p3>;
-	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
-	vdd-3.3-ch0-supply = <&vreg_l23a_3p3>;
+
+	/* WiFi / BT PMU */
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
 	qcom,calibration-variant = "Thundercomm_RB2";
 	firmware-name = "qrb4210";
 

-- 
2.47.3


