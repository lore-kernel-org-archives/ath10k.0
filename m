Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E9DCD0427
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 01:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tsd5DKtNLlMZcvaCZDHlRAYCf+3uNDXyfWJlLEmAqA=; b=ShHac3F1BNYi697lk85aW8b9Pn
	Q65frI3lW+Ef2kxqfb0B/PMR9dXGxAqWADLmzrrHYNkDmLUxuJvD8PriZixRFu5K3UymrSWbzYEyt
	gn+QJzddGpkk9YiHfUzj5MLEFM1qdBpU/d0jswFJi8R2LyNTbNwTXxhQSZyBGKNLSNAyKcJ+uZJVF
	eNSgWce4HumQT5+xnVcj05TAPCFlYbeBzR8tEtchs4NX157ye8SXJyUllIX7KVniM8e2F8KXm+jQU
	kXhEyrcof6nDOynxMg4vgQVVTnD+rFA6A7RgT/cCx5az3pLg07gS8YJqTOMV/dvFQuMOQF5d+q5JT
	sKcdKzAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvSC-0000000CHoM-2ITB;
	Tue, 06 Jan 2026 01:01:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvS9-0000000CHiT-0LvM
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 01:01:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nq0I203358
	for <ath10k@lists.infradead.org>; Tue, 6 Jan 2026 01:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tsd5DKtNLlMZcvaCZDHlRAYCf+3uNDXyfWJlLEmAqA=; b=fCx6c0/g2WBsHU9D
	9p6IP81MxY9kSvJgZnSqN9cy5nJzlR8KohzvSq5yFpUHfOPsPdocZEN+Oq7UotJZ
	d67UGBQA1NUlfJYPn1lm3WPExfnIPhVYUYnQq/zpvuHz8R4Cafpq2mox16x2Xyft
	ClIvP+jK9WjHWlNbZgOKNlUFmRXk88HD6DSt3uWnGB4z8JzpMXiXss/cqyIt/jx8
	8R6WDHPGrWur5thjXdZ+K8orUUdpynkwQ1Ixsh846aeLpGuJ+Mb3MC+H2SOFw5L2
	r1tIQKwOpz8vB4OWfDNJbw/kcUXoqXdk3rCfYflveOQMZXU4Kep5ACnjPyn+XmTX
	P4SIvA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggqu19fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 01:01:40 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93f57d3a1acso1300457241.0
        for <ath10k@lists.infradead.org>; Mon, 05 Jan 2026 17:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661299; x=1768266099; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tsd5DKtNLlMZcvaCZDHlRAYCf+3uNDXyfWJlLEmAqA=;
        b=g7iBys2qXb4NbKjgottW50I7lXD51twsr3JF6uu0XtvRkT7Sd+58BJnyjtk/pMiRgB
         Y4fgeXUbXIjNXY6xMXLt8MrSod1ntW2TV/el36vKetrErABpo3c8C3fBTT/fKDjjq53W
         D88CwrIZekjyhq0TFDx+FEY3ly4/WzZXzrPJ8IcTPcqJKQxYfhHmImXUXz+RrpVmBqTI
         QlP4fQVXruB062fGYIAk5lM6q4SQFpUDLTM6zFpdkAXRoIRWbESO3bsAEHvTfEE3Myre
         4rTyYKuKDgWp9Z/NYBnitUlId7NMxiYRTkC/zrw00dgFARN3LQhpdDjF8i3/ShSv3wjn
         PbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661299; x=1768266099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5tsd5DKtNLlMZcvaCZDHlRAYCf+3uNDXyfWJlLEmAqA=;
        b=DeGnw1iilCXUXqw6yobw/Ys1keOo4/HNHtvyZv0TZ8zEu1XjeNQOJQ21iMbbgsmeA0
         uiaKRGvDepp4L9IYKskkRqUUHwH/peQFdRozDipO58jwlbOJJ/H+yPblYBAghQjrPloT
         13ZuuXlyIyqjNQrzKu8RS9DbhbfB2LkLK0G/XSyFCRkWgL7opKcVGxJhYsZ1VM0/dB8p
         C5/A6vHgAGb2xzCTx8sWSKwGyu5Wi3j9zJsB7o6s79k+q5hy+tFswob5NJmDdfd6ASgy
         wN57GntbEZJvbDaOmBCXf4gR4e6UGhZYflyCFxjfyPzUkWENLH8HnA3da3VP5SdAGfBZ
         ZPfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0eEJCUMgcdkYqMooaj25dI6MmBRp7mJL0d6bX9Fpy3IqnG/3+8khz+2XqpG3Phe+ycLXqOUI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhibuuAlcREoiLplSKU18pO5Ab45qGIEszMlCriAXyTKDqTHZ3
	aQcvblBzPHJ5dF3e9v1Uy5XSuhjEEvmQVHzvIW9Vlu+eURzoPeSIncPPeS8deBg4QxlFB4Bn+1N
	G1cHzZjzGszc3+zHId2bAVrvdq5EW8SBzVCRDjIjP6ZU1WUrvdWOqGWDBAZMYbtux
X-Gm-Gg: AY/fxX4DcSQt1ZbreKSkX7yxcpfKjI8FkUm3ZrphXVHVUqRNMskkH/yQPiR6jAVtpwR
	dFiDLwSHGQpYry2VWnhQQeFc515fYp+O7wkF2kjtQBqpSIk3Xg8f5iA1JMQDT4aJEud8PbIYevb
	89t+TSThbp/uwCbuEv+e6aQ6R+pieUULpaTxBt3UIwr20JMduJVaoWrSDZlDz5hCI3D9OS/XcI/
	8BvpDTttMP5eglq2K2rc8Fabj0EJChEsBR9o6wEwJCR9+OEREdLeAW8ZGtH3Ze+5n8dKricL71U
	sioZuhplKg7cCjAZjxyPJtCB0BzImxTsljjVM/kDn2rgpXCxsg38ZOcZD32/DiTaNvn9x8DB7AF
	FIfd6vG0vXlf5EDmcNo8XEWNcqHSMs4J6VXbS1o+f0nrP+AEl8xvDvBvB9qqEm/DFYqPkhBRiJh
	lMmOceJW22fg2qOOdZvNc//DM=
X-Received: by 2002:a05:6102:448d:b0:5db:d2b7:9511 with SMTP id ada2fe7eead31-5ec74574d2dmr443405137.40.1767661299562;
        Mon, 05 Jan 2026 17:01:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIchMWx6h9LQgm2INjt7jZLpa0baSCgZJT92LF35vomyPAvbZ7Z2gmXZvJx10AwyD/MmXxzw==
X-Received: by 2002:a05:6102:448d:b0:5db:d2b7:9511 with SMTP id ada2fe7eead31-5ec74574d2dmr443361137.40.1767661297733;
        Mon, 05 Jan 2026 17:01:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 03:01:19 +0200
Subject: [PATCH v2 09/14] arm64: dts: qcom: sm8150: add uart13
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-wcn3990-pwrctl-v2-9-0386204328be@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=971;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R5YT6nb9PgApzpeufYf7gthWk070NxoF+HtPuCCK/hI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXF7ZeuJ4H5kQTiKN0SZPAWoEkpvXEwqkfstAM
 oFfkcFhRy+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVxe2QAKCRCLPIo+Aiko
 1YNJB/91Nexwnv0JCxYQ3fcm0Z58dhtpTmhbVp0CaGAKg7i8jIX1Id9ZsqWTms+2sxzJTQIH4QS
 N4J1ZnxBkCFvfGrdqPu7j1ZDCg+CDX8nTrhqbE2z9s9XMR76wucz66SU2ATTHyWLWQYds/CXlBS
 +UaRxS2wXRfA6g7p6JPFctX4oSTLZlzIWsSBBsghkm+83cuPqUfDsJNR4QVwakCDavScMOrhzei
 fVb+vuo1cE7Rek/+SDQHIH54zHKd7Sak6FZDYkKgKz/Enl+bMGwZ2d/VUZIvv0CtviWxuCCNMSe
 JIdsWh/wdazrpirurs3xLBof1CtdRTNVlPkYUj9447wgGBQD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfX4ytWuAeJZmZs
 87Czdsbi9kUJOqs8zr8oF5N0uKLqcAsjF2QTzVRTAmR8+xmTZFpAQRWOaa5s4C0BSyB+XWK3aZZ
 RdEO/zoKI72AQ0wbk0GQXtDK7gVm7gxWPOmfhZOMmUSFnukf9J1D+eN2M13VLC+vpbJMRsGJRKd
 MFW4mQvtLrT5h3nV6jXfLuMYK9vjn208TDvibfMggyTDGdkuB61SZgajHK2Aah8ZCDBdRrYgjQg
 beEoAPsHZNPyW41VF2OdEX+dkz9Yf/rj4D1CBYmRZVYjbnL2eIBCr9gumTM6x4aZyNFsDbH7JHo
 T/lS1X2i30loIde0sQJ+rTEraz/qNASsjKlIPv7LLHi50/uUVsNl1YbqVKTD4l5+bBQcgkyhRqq
 Vku1zDdeWomDu/a5OEGMQeohhQqSe5o3kBHkcJlQygjpZsKEKcLMotT5f4pYZ2bDKR2gysrWC+W
 fIOqBf7+vdrpmMhtZfw==
X-Proofpoint-ORIG-GUID: RznhZytdjR80HqDLNDiqNR9tgQHgXObD
X-Authority-Analysis: v=2.4 cv=fr/RpV4f c=1 sm=1 tr=0 ts=695c5ef4 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tD0gfWrjhV-l0aOYTiAA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: RznhZytdjR80HqDLNDiqNR9tgQHgXObD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_170141_210198_2C71DC31 
X-CRM114-Status: GOOD (  11.47  )
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index d36a3d214db4..97ca5275d740 100644
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


