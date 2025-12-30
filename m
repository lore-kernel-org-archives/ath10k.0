Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3BDEE57C9
	for <ath10k@archiver.kernel.org>; Tue, 30 Dec 2025 23:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yz0M2bONMw9l3lUPyJcEl7KC+6i7WH/5FxBRw7kdMZ0=; b=M4Xlb27OIDp+lJLVjie4gxaXtu
	WlgRkVq31TdamK/2TZClpxTeEhaCW2bd466lzAbOEyeD2LvYC+arVy7zYceZY5p3fWQgDYdKZo+IH
	9WZT0KJDQyPprMDwtLUZQH/oIFOusdVrWt/pv84vhy3ktJJu0z17yDwgECEha2+RWlznXBsnWBSFC
	CHpLWRyK21hdBf+ZrBs8sE8cWqVnYKe9BhWauE/ny5xRpBEVdX71H1aU4LuctRcQ4jn3VOfGkoiQ3
	1Qh2z4nAl9aG9tb7FDqQKqJlVcX6BajnPI8HrzpamTm6b9Aj3PCJ8bWkpiVuKpXXifncNNIH6/OOx
	KW+U1MVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGG-00000005S1X-1n4k;
	Tue, 30 Dec 2025 23:36:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGC-00000005RxC-0hpw
	for ath10k@lists.infradead.org;
	Tue, 30 Dec 2025 23:36:17 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BULqa5g2916852
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yz0M2bONMw9l3lUPyJcEl7KC+6i7WH/5FxBRw7kdMZ0=; b=X64159YKNjQ8Yx5G
	YnPZhErsuZ6tqOaha8guF+8eyfGU2/K589czzzwfeNSvMmvXtmOmrZG1q3FGGNZT
	Uh4Q5PG7h6nB1b6rcyqMHjxa28sRzW4jZ8pVKIlF+ODehbdsd5Qo9PrKhJNPTeOA
	wx07du9EUA+UESqsQGSqA+/eqifBTZbIN3GltCXFuDNQUCdAyhG4KVfEpuPUo/hc
	3WhYt2/FnvDrcnZ9ft7V1CRSf/qNq86LnYs1G7ISaluIOwJjEsad832vBS3gm9c+
	fa7GUZvo9IBHasngo2AQtOZGLDo7utIXkk8yZosDH6TV4G41Qy3DFfKkp8ZQKANQ
	UUAaww==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky26x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee09211413so274353201cf.2
        for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 15:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137775; x=1767742575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yz0M2bONMw9l3lUPyJcEl7KC+6i7WH/5FxBRw7kdMZ0=;
        b=jxQ5eEsBBuDc6jdOCPKHiguetAgRS9gvkPv5DkTY/qwvKeJMuWTytfQ6/PVM9T4x8l
         fH9OYo+dcngMkC6sKuystmYxXEy1tEBYLvdllDHh85GLh0WVUPzFGXN4Mxnwtl9/J+oF
         ajpuYIUODDZH4Ran9UOU7I6J+JsG0hEk7aAeWpq4TMZO+2m35bb0JLHF3tov4B3T6AUa
         e2obheCDOJFN+ByH97m7ojkz6NmiubMvGRU9dR7QrlSOS0yjEjkN2BT9RlYpJYHws84W
         z/H++xXGqL14FpluKEoAT0dycgfk22Dt1HGZTw+B/Nk0yS7GB4WHwBdr31jhJ1iUCfsx
         y11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137775; x=1767742575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yz0M2bONMw9l3lUPyJcEl7KC+6i7WH/5FxBRw7kdMZ0=;
        b=Vq08T5ZQcCyWForSRIkLgZaunp/F9lOS3wYJ/Wq6wr3EB0ChkyB6qQmW+4PaW+rnpe
         1IKGAssJycTVOquySZ5cL9rh8Jk3HGPpbae+pHdW+FzLtwxQtSrXGG0+sSDhgP7WNzUg
         cbnpJhZxXaRdtLwAF1LK6JnC24fKABrJsZqNCThvMMGncjCCf7jgpxSn9pFeEmjLvPsS
         Uq+APgyQceztLsU3WAoGsgrwAVGi5biGEO2mWje88TUzk2XLYsxzajoPCjK+9J9DwCU0
         yw0exPaatb1+ZpC4mO0QDzSv8wC83yq+NV2MyDypfaV4ChjBOv0Z8Hbjrb+V27t6fuZA
         65Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWmmxRw+4qS8zYrLy1H/EV2Xk+jOGpUaSyfIDPH3+3zi3Q6kWXq3k10ACAhDA7di2pFqhXSym0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4ZxtcSxl2OnOditzoBYELYJ33+67He11BCUNUYAgI0p25chBr
	6SmnAqXMkCh010GdxsgyOSDL6e/SQHO6O1NgaPgRc7mrTuZDTvL6yhxbe7wgL51aKRuJA8kEFb6
	ABIiCUsmw7wVNMpb8lEvfG/mCtkvLNYxGFVpoCe+QXpUhznUTUa/Nb43nlGj76iI8
X-Gm-Gg: AY/fxX5dOKs20cdQpqfAELw64MTLI0w2IWKWLGWzoocbwAQKAlDwxq7TOVofW4VQYHA
	QZD3Krd7QxXZ6ZGdqrdDW00AFEoKy3pc5b1LAW41SoE7Dk0MI6/gSfdVDKzmEmOb1j8Dm/9lCW0
	u8dtwcp3z4OYF3lOrTl1RkO5Qy1NYK7VMD+U6baRnQBhZo4ziWGYZjpySgsbx2Kud//TrP2YB+D
	Db8iSqYl0vT4PD+0JbFVQMAlEKlCMj6T/GYFeMf2Gb2vlMYVQJb6lXrQac4MqzC44VoSc0bzB1u
	Jslo7gnlNdnsQZOm4idpypiR1RM606M5FLCftQF4KuuvOVF5TrLBTkxMXpPbPz/z0dzy2hakmHr
	9XoSfglAi4yDvAHmfJly7Yu6euND1c4id3bVmowvdXAVDxkAtsSQjwYdBatOoM/yqnCzHciQBq6
	e2Qtvj9QkQ66x1cocHOt5g4bA=
X-Received: by 2002:ac8:5a95:0:b0:4ee:43b0:b053 with SMTP id d75a77b69052e-4f4abcd0726mr473645301cf.9.1767137774632;
        Tue, 30 Dec 2025 15:36:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMGGQVJr5nFU32BS3rqlRNKcmT4nwQuRPso4jlVyupuyImgGYdCOcdntUN7XRhnoHEMgqIww==
X-Received: by 2002:ac8:5a95:0:b0:4ee:43b0:b053 with SMTP id d75a77b69052e-4f4abcd0726mr473645051cf.9.1767137774178;
        Tue, 30 Dec 2025 15:36:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:35:56 +0200
Subject: [PATCH 06/14] arm64: dts: qcom: qrb4210-rb2: Fix UART3 wakeup IRQ
 storm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-6-1ff4d6028ad5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1192;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FGGim44BfWQjkV94IPZI9LwB/0tKRgJ7VqsLfgE2Ze4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpVGHkABOQMZr6Am7DyYFRXRSIogfZu+iSeRz6J
 dZ6Bzp6kY+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVRh5AAKCRCLPIo+Aiko
 1SMPB/9s6ve61Q1pA4PXAtBPD6/eg5LblpoBoY8MSqB1GYg0vr2VcRReBaI5UcN3j8+jf4XpfgB
 ipggYWe6Ll8hagzxVF86Oi0EMXPh/wMppwJPc5U3oQ6t/4QDozewFUp+uXkzHRoAu6l1b5rUiE7
 FnmlvBBDUiwJelnTQJDhNbem1sofjFQn3X3ToHeFOc0fWtdWkXMG43vqCQHKrv/FIWXG0CuAq7p
 mxoBrUC8z3iqv9fHWgOOnZr0efRh3h/V3D6w1F18vahSHPEKzn5kbXGa7loKJCdZeooj0S0qbcN
 /ZHQVn/+B1PDekoMnUbHdqWQ1bB75eCm98IJFmOQZh1rxPuW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfX9qY2bxILc4xr
 u7HoleWXw7meFr+EP2XM9cqUV0z7QUgvQOThLJOek8azjjguYTtPTIxqmlnfKyaYj/uMXJSNYbG
 pBsGrdOlsqhQGjr9rDhLawbxCAoXuC4NThN4vKGTKiARIkx9yMPW39M684L5CXt/SSyMTMVU59C
 0ESCoeyVg4YRyvzV1dEswIjRFS0nZ3VuSotbvX3v4m/h4UlDVFwyItSaA3HwcvYYLNiVP2Qx41c
 /ortw0UAO+O413t7V9zdy1d1QlWJjwrlBZIXKc2P3xWYf5N6CUk2g5DvdJn7WzQ++1pX7Q7hEW+
 LUoPpQ/S3SycNp27/E4CAt8yKw76c37761qGsxA9W/HREuJWmzEG0QKtIkXFfJRs+f+PYjQrPj7
 BTD9oN2T628kBg0vUteu9Or0l3tSJwUbWpzqASt+kMT8K5Td8ABTJDGz6jpqLhXA9Hups9B8EkL
 BEIsOsRyRb63hreNxZg==
X-Proofpoint-ORIG-GUID: N7qLLHI_GPRL_f07-7icbHSvpXHEvWVP
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=695461ef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4EO7c5U0FNLfYlZKXmMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: N7qLLHI_GPRL_f07-7icbHSvpXHEvWVP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_153616_245148_F67C8811 
X-CRM114-Status: GOOD (  13.87  )
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

Follow commit 9c92d36b0b1e ("arm64: dts: qcom: qrb2210-rb1: Fix UART3
wakeup IRQ storm") and apply the similar fix to the RB2 platform.

Having RX / TX pins as pull up and wakup interrupt as high-level
triggered generates an interrupt storm when trying to suspend the
device. Avoid the storm by using the falling edge trigger (as all other
platforms do).

Fixes: cab60b166575 ("arm64: dts: qcom: qrb4210-rb2: Enable bluetooth")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 0cd36c54632f..5f8613150bdd 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -694,7 +694,7 @@ sdc2_card_det_n: sd-card-det-n-state {
 
 &uart3 {
 	interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
-			      <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
+			      <&tlmm 11 IRQ_TYPE_EDGE_FALLING>;
 	pinctrl-0 = <&uart3_default>;
 	pinctrl-1 = <&uart3_sleep>;
 	pinctrl-names = "default", "sleep";

-- 
2.47.3


