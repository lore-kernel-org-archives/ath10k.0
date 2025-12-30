Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2953EE57CA
	for <ath10k@archiver.kernel.org>; Tue, 30 Dec 2025 23:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+FVwNRLikQP8LSojRQtHGdUV511zX9zkUOVCzM0yiQ=; b=R64Ax4T9LEZGZbgaLhcsy19LSX
	mQOW5Pn1HSuMG9JAIX6L7fd5ByA5t305HQ/vT3UhfxFBVLAOPpMeo3i2nyoIQGbLQvxs6gg1t7HH8
	3PDGdGcz7mX5TDILtz9Q7Y4Q7VA9YGpJee7mj27aTqaTphUf4z4cBJyCU+Y2vSyfbOyPi7ZkUeMNr
	4nsJIPp5W55DSaHi1uK6lmBCHA1EJcwI98UWg9EtVADXtOKR8GbK7917IZkSHQHY9eSlio35+wMXU
	Ji0iugWmVpZTpET7GkSGqgYzQnExltAX28J99M6tB9zMtEkiEkqMN2r+g6ROh0Djivh5HXh+mkFL8
	7QYrMxxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGI-00000005S5v-1ijt;
	Tue, 30 Dec 2025 23:36:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGG-00000005S12-06e4
	for ath10k@lists.infradead.org;
	Tue, 30 Dec 2025 23:36:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUEKkiO3539728
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N+FVwNRLikQP8LSojRQtHGdUV511zX9zkUOVCzM0yiQ=; b=hGIXLqcexQ1Pj2UR
	Bkjfa/MMgfSquAig0IZEtKMMN97R8FB+VMXuAes8LaJToSI2uqfbcBaUsXfVY8a7
	movLC0e4Gh755YBmiIynBdBmrdWkGvYCrg2+3acmNu2ihATJNZ20eCIVVTz3wQ+/
	rgPxlg7voc5hQunfKHr9g+SBwUcBK2MxI+E3DIYNx91EpmQJUGYyWkn1SNzmj1/c
	ntfVIEa5tJHMbqpJJrHEQCyJWiFLzOtJnNIVAFSogUZQVa1/8dNzEItstQ/nQrcI
	RwI6Mu1Fsyin7Z+0s0eO8bu5JpDDOYyTJNK3RydUMG6IgFMdrVXN/ibwWz4RrOWy
	59UCUg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88yj97s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso292996871cf.3
        for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 15:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137778; x=1767742578; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+FVwNRLikQP8LSojRQtHGdUV511zX9zkUOVCzM0yiQ=;
        b=H8z1ZwcooWPL2fyvM3VTzurVwG6h8XQ8SGz6mVIs1Yhq9MH/IrFwoYF2JW856qIpqv
         2Cp5b1dYQETSf9dEcjbhM8iDaNDz54vwFNXnmCi4UXniZk8DD81zrDwlRJ5UU33tllXd
         L+hxvNsUD5bkm031qH3JnM2jCQHGgVApyLa29VnNnllGBkthepKNgqCT+HmpQSPcewo0
         OHzoK1wq3T9/f2qzomc6AZgBPcclsKSq/K+Hhx1KtcLZNqQhT5DYu4+0l+UNovP9UDon
         fGGt7NEkxRTjhmRpTuaAb1QAV5dD1a9z6TCPLZ41eFl9Q4i0csz4yqoxWWeiPpk3TbML
         A68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137778; x=1767742578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N+FVwNRLikQP8LSojRQtHGdUV511zX9zkUOVCzM0yiQ=;
        b=ljePd/s2Lo0cQQMdu+hqQiua1c9cra4JWjA/qL4sOd7UjPG04iUvdeXIJnDe92bjYU
         bnOehPoxgFH91zbGQXu5tHEELvLHiWmYuO7GRBP2bpL8EojR5MLqC4TQl50F1Bv30TKt
         b+RztOjdxuBDAaMfqkb6JIGQW7N3abYDXo0f3nt4lh90s9qk+OjjPLgSkKX/3EPVALeb
         em1oiedMAYT9dlBGmxyYc0+kCS9+cE/B2Bnk4Wo0W4BiCyCw4yBRWUT6ItusD32l7h+b
         lGue+aKxwWfeRDfvd3UsAh0suvQ18XUF2uwrWiM09GTCr4t7wg0YqOH2lm9umiBfkE8T
         X0uA==
X-Forwarded-Encrypted: i=1; AJvYcCW5RP1f6jo5vEoRBJ6CAdiCoKOQ+/e6KiTYNtJXPkQXQwgOveHBsE8Z583RfVqeVGE+7ToYiWA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZohkaqGLz4hlVrS8/DORLPDmjx7Axv/1EI+MqvaJKdemocTC8
	8YiTMTGE9pcmszpz2QYtq//F/5F+7/2iK0B3/gBCbM50EjVn9hENeLTbEV1h/ccADwtcFy6eBPV
	GocSAz1MmRI/KKzriNu70ym7rFG5CBkOokAOIdjuViZDU95b4JjmZM9+Xyw/KtXmN
X-Gm-Gg: AY/fxX5jC+84XfhGBuFptKys7/BvwUYHE9RYeb1AP2+HqkKmLtNU8YOJnhrblUpX3HQ
	nYbw57eKhBC6WJsGBU+NfPVRgNKsn777pv6IaThBO2nZKDu7Y8ewRo47h3zWqS/p3SGKq/3fSlO
	pM0/nFm6GkiR2nFVUipERZbzzI9MkUyIpWOlhqg53fbQY27IecBsWnii77pYCnS8hnPMPPsapZ6
	aAnfvnR7NjLvXLRFy4oZPI7N1AbJoci5dpRIQvXJLXFJ9C891k8/R/X25B74usEE9gt4sh3rxXa
	JOviitQOXag0VRj2ZCSuBHNQSYeOybmWeZK9StTfqK4ZZOJzb4DnvD09CSFO9kGbElQ/H8Nvd/S
	Z5EARWv4lrHzK4610Sp4wjDhHHLVb0Ob9gQ9r+wExzDA/Sk2Swpzsyw6hW/XwrNgKmS0QO/sRV8
	6lA9EipIIg7C+1IQN7ij/VXeo=
X-Received: by 2002:a05:622a:2b46:b0:4d0:ac40:fab8 with SMTP id d75a77b69052e-4f4abcb609amr511678301cf.7.1767137778422;
        Tue, 30 Dec 2025 15:36:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH59lx+ZCDpow83PB4eH/5T/X29RNR0aVJbnqhYno60nbct3hC5Y5OsKlGMVfNCgjJmFDZvoQ==
X-Received: by 2002:a05:622a:2b46:b0:4d0:ac40:fab8 with SMTP id d75a77b69052e-4f4abcb609amr511677921cf.7.1767137778035;
        Tue, 30 Dec 2025 15:36:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:35:59 +0200
Subject: [PATCH 09/14] arm64: dts: qcom: sm8150: add uart13
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-9-1ff4d6028ad5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=910;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Pz4bYuDWOk27q8/d1KeCQS7z4vWcU9y3prNSQvbuMuE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpVGHluW6qebycSnrD5SNFOD5335n2RZeHUhSEk
 te7vraHp9eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVRh5QAKCRCLPIo+Aiko
 1XA+B/9Ku9Oec16ayWeVxl+sQOev59kRkI4jvd53Bo4+j993wCSjdYNaBIcMOjHpBtdsyi/DDeh
 FCqhwnxfxwR/cTOJeCd3hsWAoEPp4WsLb4HwvE5IIHlu4zQhsE7Q6D2qfsiqMUE7Fn52T4GEAwT
 5cCemYj0GzUO0yeFyn7bnsYk0FsfenLfPLViJXvkAT6CoqZCRM6Zd70UDRgNzeDLnlsyGYEIJ0M
 ZkLNxrAqNvJQiA6/WsXXq6tIRKw2+yRXdZ6k60oc7W7vAQU2lpYSfCGPED8gbKF6EsSAajYTlW4
 VMy3sEhDdO9MoAeR+LxRsuVtx3ficRB/NdBrAh7X+qu98d3V
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=695461f3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3uNi7MZmT9RZencDy0AA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: aaSyg51BULYfg_l6G7wKNlzUWYC_pyEw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfX18cQScPIfytM
 8PlwldoRfbAR3H+QRq9EJ4hc/hHB9aLnuRKiNWy1yUlHZxlWV14PUnH+L0jCaK5BiR9RmwQhqdE
 U1fAchBESYHAGGSUOha6hDReP5LyhXNmp4+cueg2NrOJedM9L3/u8f1DVexu24oLOJY7Pf6yTFs
 g4pHWtoMriDtts7ger66jPl5mWyIoldzauQxD3pus97EOEQP+XeLLW0mfyjLTJQswymETLFQpOV
 WuPXYaH5Yluz8zW5PItO4P7Zxfw/eHjQuI+6DTKfSi/xnMiihOzPBaVxYZpAo5eh+6WOd8r33Rb
 p+nXR71S15der6sBT3a5mqP4PapxEcBbpzbfZqMONCVj2HneI5owTWxvAYhuZwprY1BUskQW7co
 OyFXo5SegeshptYkbhecflBZcrwUIp9ty4tyVaYrOhZFZ2EJHi20iCuA7VkbzyErGskVfJxlxpM
 3UShl5NKEpYLk2I0DiA==
X-Proofpoint-GUID: aaSyg51BULYfg_l6G7wKNlzUWYC_pyEw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_153620_118854_F55204B4 
X-CRM114-Status: GOOD (  10.97  )
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

Add UART13, typically used for Bluetooth connection on SM8150.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index e3ec99972a28..24c1691642c8 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1693,6 +1693,15 @@ spi13: spi@c8c000 {
 				status = "disabled";
 			};
 
+			uart13: serial@c8c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00c8c000 0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
 			i2c14: i2c@c90000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00c90000 0 0x4000>;

-- 
2.47.3


