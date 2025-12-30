Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A89EE57C8
	for <ath10k@archiver.kernel.org>; Tue, 30 Dec 2025 23:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wk/UYrnnjXipaBXYq+cjJDLHcQI4ENYT28LjgElhlps=; b=G5pXijOg/WpaRVLDrqRgNNUfCu
	n9OwRQDL6mVv+PZyiFvVe4Ig1Bm1r8X+NbxtJncXonzasvcFVr6hYyppHYKLItQG59JgY6YWie2Ll
	k0jtUA5GEmYsPGlRfzJksB4LxyvwPSdi7YkKINjRyOt4lJlPg4/Hv+zWwQPnE0OtgtND6YC1uhOVi
	FwDNHB+8CbTEQsQkQ5Xe2FQyDPpMzlsJkWC2sd2T/8X9PAhseJz3m/fyf0UTaXPk/h9h2jnmIEFVf
	49uvq142+d5uliNRMnq0aC1eB0oBF1c0bv8uCe9RSCE/KkrrzgRdSPn5xhzpQHeCQJW1MOIbmSSx5
	/M1BXseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGG-00000005S2U-3DoP;
	Tue, 30 Dec 2025 23:36:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGD-00000005Ry8-1PEa
	for ath10k@lists.infradead.org;
	Tue, 30 Dec 2025 23:36:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUFml7a871247
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wk/UYrnnjXipaBXYq+cjJDLHcQI4ENYT28LjgElhlps=; b=Uz5bxghFa+jtBFKW
	IoDA2XsQZUMCDrzo6flSzVSEKzTo4IPY1NuyFnKtSgAIMZ5+jKBbcv0MH2C528d/
	SmHWNbD2ep4LldxYBX2smVzeo5nSdV2Wfl/VEtDgqI+tAxxQTms4kMYcvIvwTjWY
	Fv6QYVtXmsXfoRrjTCr/Jx7QRKUVGIoNKxUo8MRgPY88EwNcDvsfCELIeMIXYytU
	TMC4mmqPwT8ugKAUtBZHVVlMC/1n+Pe+xIVcr/W40tK8NcgMaKMlwi1Y5OijM4d3
	IUrgxL8vJJ7E9qalneDRlmXo1ydiF1NxwJlL+OWl1rtfhgKzyzCUYA6gL0ZeXmDC
	YvDF5Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7462cp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed74e6c468so149236941cf.3
        for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 15:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137776; x=1767742576; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wk/UYrnnjXipaBXYq+cjJDLHcQI4ENYT28LjgElhlps=;
        b=biy9Yk0DLXmA2bJ/v1QfnjQv1mehf2knrlvgSPwGOLBEeO8qxxEX4yZj7CqognBGiv
         aBXkTVIzRyi/xOqt/BG1IgXQVvUF4vdxLDu4g3P0cGc7tvUPomkSX4FnfQq2aP4k8GLx
         c0vHvtZwSXLBmxPEhqqFqXeXS3zYd5ogamlpma634fo6znpzACIdOr+h1g1XZelau0Me
         GtKRvVcdWEZO/vxSn2baXvJg8l5FFWXhdYIKtzQIJv4aJc0x7Ydmgyj4PbXfB/X+qbBH
         3eGo08BJRou5fu9J1uurNUpP28K8VdsB2KyUqyKFNhp96sRjPiyj01Ks6LlSOBA2EhPh
         vggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137776; x=1767742576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wk/UYrnnjXipaBXYq+cjJDLHcQI4ENYT28LjgElhlps=;
        b=maZvaasaSJceQhmNevD0CBnxCRLSUhnRHB2m6MUmA8g0pR7UBZRs+Hl4yoNRy74kkD
         m9M8gGI9KUTFOfLEGo69MX7EMzJCX4GyeyKskeSgFaAKL8BykrmbNJAfzyAIHPSAXROw
         WYaYnI72tSCCJF4miHJQu6S68sz1EAmTHYQPWyxtj65p5SpjF0+5pbjFU31t9PGzL3k/
         iZ5yGhcsEGKkyCNUqWcepiB2vZG+1nW3X3FDiLv7ZG/DS4iRz6Z9oGX+Otmgm9ZaOf36
         JK5f6aTr1V6vkdmYeZcZWNE89FTXI5DjpAOp5A7dl0z6SUEvFWr1vJY9SaWJUkMJ2imX
         7Pdg==
X-Forwarded-Encrypted: i=1; AJvYcCUZFuClSOStNq2XhnfuA5VZGQeKnSoKPci2XPFp6RcD1qLNtPtLDZhtUUC4jZmWY/28mi0xaTY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy64QWLOZbbQVwMFYiJqxUhyhMx38IdrD3rkHRZNuP1aWUBLJ4c
	6OknPA/kqMuwjnzJzAKrtM5JgX18NAFcEyGVUXwjyN9DlNgWZywXLQp1+kFD0THxGF2e21T3xOT
	vykagA1mTczLr+Bd6yR2PWq65vFoO+5eov2IgZHkybO+Vt9wl/8awUlXisp9BuiIB
X-Gm-Gg: AY/fxX4EXxPFiKS8T/816phhLQDucZFK4j2lroz9WirGzVS/2EyS3MB005v8CTZb5HY
	5YsjYInpbHjmMXBtUwz3bA+jtxh94d1P0Hv3rwBRVceFOJ1FlgFdrV018X7bKJu54cAf2dt/XV6
	rnyTst0mDJpLtS6Vl+XthQ/xHqRBMXuyC+VJSTwMWPgu76W7yAd3buINxdzzUuVnwKhWXEgcWcv
	2dLKvkPng880VtucB5/WtkFcuND19W7GmCbt5i07oXmvgshF6a/Imnygpib7knb6HBH1y2AdbqZ
	goGy+7p0zdiuUqtpu0HmX2eP+ZltY6jAbqxeNK3EepzwjIL2gpaGXq98GfwLMABnAmgI1OLPSXH
	+tINMapwDiLEIXPkWTTn1Yd7S1GZRYlgmXmRDcka15tXzu2OOf5Ahy8Y2TtfEBM6nISjCnzutrp
	nmdCNMy3GAIup48t1fi7bKjX8=
X-Received: by 2002:ac8:7d8d:0:b0:4c4:6b67:ccd7 with SMTP id d75a77b69052e-4f4abd8142emr556974981cf.55.1767137775752;
        Tue, 30 Dec 2025 15:36:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeHlzNHwWVyNiGrkZdVK9sqC0WDCaSDH/a1Qm9AsXJCXQ2gjEF5zMOFMszSi6RF6Kpz0yqFg==
X-Received: by 2002:ac8:7d8d:0:b0:4c4:6b67:ccd7 with SMTP id d75a77b69052e-4f4abd8142emr556974561cf.55.1767137775304;
        Tue, 30 Dec 2025 15:36:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:35:57 +0200
Subject: [PATCH 07/14] arm64: dts: qcom: sdm845-db845c: drop CS from SPIO0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-7-1ff4d6028ad5@oss.qualcomm.com>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
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
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=953;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EjTShN8dVXi1WOodHyvaBSpGXyNPhP2Q+wFwV3+ERgU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpVGHkSBQ04fZj+gnaMzS5W5ExjJFumBCj37eku
 0e91W+btOGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVRh5AAKCRCLPIo+Aiko
 1Y1yB/9T2MJ50lAxN4Ym0ghqy8gq4J89OST84ANmpJsQq9cplqyWHEvCVx/T2VbwkWRlA/UYm0q
 4/g5GO+XzahA20G/QYH+jZhfyMlXbk9IIKMqSTL6cm/HV5UyyxH1mf+DNGYTGQK1+WzmT+b7ttl
 itCNZGLz9atRLFBp/AzRaVmYxzSQkrdNN1PdUtMLFLsHxaCBDZO1BgQW7Zp1e+JUJMEMD8iMXpL
 lm3OELTeBy/npBOI1Nz5DyLicQEjQukdWZfWUB7nRkfGjJ/v7FIcqQYzJmQLOlgsjGxat63qWbb
 1xZL3SvRz8+RgPhN1OkpsLwtLB+QmBieIqcz+P7G5tRqEhC5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Do9bOW/+ c=1 sm=1 tr=0 ts=695461f0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Vj5tKrsnPMLlX677hvEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: dVi3OHnS5tdRvMXZ9eoK-okFYDCL2rR6
X-Proofpoint-ORIG-GUID: dVi3OHnS5tdRvMXZ9eoK-okFYDCL2rR6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfXy+qHVMt+dxqT
 sYzQxGnqf4VP8uX4psiFdg6Rnpr+8ohiV8K7AxXxXtZhbQZ2Kr2l3XVrGJ6Tg+owBjNNurxuWCV
 CI2FudlvlesNY7nokuCHYRdlfpsKyjcoV3fBDDL4uh6svDjEU51j2yaP2B539EY1skVuM1j6Dh7
 cvOQMQw4Mkqy551ZWWpxMevfHFJdYZbLHbaxVmNZEtJRhuvfd7SqWAbFu22CI6XJg0SjmrreexA
 K0AUX9ukHJHgMZcBsCjfWG060WhphAjuEQmdnXRLmfyvCh0Lojognzqqq4KPIG5Zmup0UcKOwqp
 qgRlD3KgAdXQntn44mN2Fnu+QKfp3l/goiVV+XcxwtihNjyfk0lg+P0WkRgaTeLz63hdyOZ1azQ
 8oh6aU2VL6YGRedVSk8qyfO8I1Z9ptskhfUS6WPLlaWfolFr9Pdtb3BiTSBotbWJnJQ3WrGvb3Z
 kbyf4ae9uHoJtiqMUUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_153617_515149_781DFE98 
X-CRM114-Status: GOOD (  13.32  )
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

On SDM845 SPI uses hardware-provided chip select, while specifying
cs-gpio makes the driver request GPIO pin, which on DB845c conflicts
with the normal host controllers pinctrl entry.

Drop the cs-gpios property to restore SPI functionality.

Fixes: cb29e7106d4e ("arm64: dts: qcom: db845c: Add support for MCP2517FD")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index ce23f87e0316..ad283a79bcdb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -850,7 +850,6 @@ &spi0 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&qup_spi0_default>;
-	cs-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 
 	can@0 {
 		compatible = "microchip,mcp2517fd";

-- 
2.47.3


