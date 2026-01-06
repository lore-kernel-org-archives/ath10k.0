Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD26BCD0427
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 01:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qh9WNdUSE4uVt7sRG1PF/omHoIX+EjzR2cCnZgd0Qw=; b=pUDCPCL56HZhaY3NyoO+YIQyup
	mMFBnroH2YywEpEohAJMA2yTIrbXznOrw9uZ1ejHMRQhi1n07OWWD+Sw1xrSZ4L4IcQfE5kE4r9RB
	SDPQxiUKFrZ7rPdQdP+rCjO8z8QZZjyrzIODQ2SHOqVeWY5pLEPP38GPKe+Rsba1iPFI0xu/0y+au
	2hoJLvAgbJpsVRGQRfK8qiiX+jYeBsyonYE7uyJAOqlKEZf1JMkrZ+DD1mbqLeTzt+xGimwuB9rNW
	U/Y5iY6crb9B+OJWnky35iMVUUk3UN3uIiTlK0ze0SlSFnMs9a3UVA5/+7Nw9fRxeZR5J3vyHn/Bv
	bAQreXiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvSA-0000000CHlB-0RoC;
	Tue, 06 Jan 2026 01:01:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvS7-0000000CHfo-08Nb
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 01:01:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nfNK2597726
	for <ath10k@lists.infradead.org>; Tue, 6 Jan 2026 01:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7qh9WNdUSE4uVt7sRG1PF/omHoIX+EjzR2cCnZgd0Qw=; b=hVUdUDT1XegaQdjW
	QdDbzMLFZSqjWyry4+AqBCS31BsY8mqtU2e6pYhE95Qz3VCh2f8ZPJeKMqTY/pqu
	/ZuIM2tAxPJnqsH3wa/SYvUsTai1jtn+72almpHhLgef+c/jia49Sj/0E00WKdf6
	CCFGK+Qclfc73j0wWIhSGglxs8Z+B72LWLnENvdWizjVXPMj2GWaOL2ucKpCO+yp
	N/8Uny3TmoogQ1QDJ3p0/Iz2Lf8fnJYXBg1mtbGZCS1xCjF3zZABr8o2KG7lvvhB
	G4JcP2Hu5nDAvp9Q4dl7PxxJcwJwZCcq4RF8Mr+G9nd5lLYJZsg/mH/CF2XZl7De
	FWQwoA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bga8pjesc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 01:01:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4fb2f0cb59bso10679571cf.3
        for <ath10k@lists.infradead.org>; Mon, 05 Jan 2026 17:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661297; x=1768266097; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qh9WNdUSE4uVt7sRG1PF/omHoIX+EjzR2cCnZgd0Qw=;
        b=ZmcWQZp60AKHUPTPG3lMqhQds7woZKE89kihHkkaXMEmJBEy04hlbX5CvrHec2HIep
         3p2g/ehunlb7CxBStkjokDu74dkr1nnMRt4PQqe6ZeNGT9h8j1Z9dh4nrDG2u76uk+bp
         d/eDpkTIusaT4aJfV1erLWDcsf3win/E5Fl4qcY6OJIlSgKUfZHmCEJdJRcDLFnvU3Ze
         EwGThAFjNeJodjZufZmIVe1EcyTnU3E+AMySUHsss9JmGL8EKMTo8QI4S1VtYu/V/8va
         YkCZHViIDeNxlapqb4bVR5E5LF00NHAgtQv9U1nvENcyoX02c1yY9M7FYYnnV2ZIJKOI
         KQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661297; x=1768266097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7qh9WNdUSE4uVt7sRG1PF/omHoIX+EjzR2cCnZgd0Qw=;
        b=m9kcDPNxKeUKzaDoButf25a6ffZl3NQQ9OMCKCfDnl5JH3DTuLiLWSiG/2MoVzSfo2
         e4MD8gSOD50s4zJw+MBRerQSJmc+O6MWrPzo10ADoArrRzbWW3mtwiYPcnfecFGztzKh
         G8pBl9XisqSDU4Ohu/QJYZYwdc1iVwnjEoCL5l2ji20sB1nAYsNQCoLkyP2bu74BYzLQ
         k9ytZr2ccGWmXygc8oadyHHtkqQCxM0+bH9ZDG7yZHLS3uTlb5fksw7Ug6tyODlOwlUX
         Pc4U+NXkqt+mpUPdzjU6Bv+2i/glWvhCBHfzcJ+j3VX9CIqt/6lbQ6lA8wYlucufhQl9
         MWUg==
X-Forwarded-Encrypted: i=1; AJvYcCWdyfuGphqamIGS9TXRHSHAn5A8KwEoC7iaevdt03crIpLuHA1CHxFGS1cR3L9nWVvmuz+v2oQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBm/kzF2M5gvb+WxA0amgmcxOQhFJtxLnMrKtf/81zz4Rv/QA5
	DV8gsZlOJCbbW6A0Tolr+ygispuIlad651h8mZmJiVtUs1D6fnH2gOyT+R7YcPTGYah3n3rHq6c
	DWJgFj229z4BKTLo9tj/l8/GJp6oN/VRYrF4MlzsdyINIUVR9LYoFKYGpHjYvypSZBZMD2s51
X-Gm-Gg: AY/fxX4r3iE83QK56SD2q98f6wkS6KU5wR0pe+i2Fac8pASaGzB8+YFYlYKpvwW024p
	GSF5IIsKy2fdyUsIX6Hli2rSxLb0tLVUdCCmtmjbwtp7yW2tSRlmIwDFPVwuuPk6hKV0h1NIROL
	JsHtkg2ejajB+ksBSZ2hNpE2ZVTN9sRGZG7VO/WBu9Tpi5DpAKDXkpj+f0WmSmpz6uDloq7uQPc
	JghCD9ciDsbhr5uc//RXa/egjB6dqROZGcZ4MuPwQghu9s92GtHQ+7vnwA220v4C5THKfpGh4M7
	z3k9Kt4tsv1bD0YGiD3JKQNh/S/VdbyB13WBBimF6WZ+uMsidJ4OYTRloxFVUy/bzf5JcufHIEc
	f9ZhPfvnB9s0ADDzL8NxwWYRUAgdc0JnbCG4g/cEKXpv0IYEOE1ZMMclgNRGIbnvCzDJNGWtsrm
	azuo5h+Y8DIz90BhZVD6f9cho=
X-Received: by 2002:a05:622a:6087:b0:4ec:f2e1:483 with SMTP id d75a77b69052e-4ffa76d6e12mr17788261cf.26.1767661296964;
        Mon, 05 Jan 2026 17:01:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjXxUcPH4SVqfn5bNTY2jmHhXwNYALWEoxJG7klZ5VqgG2/qKqzhz+fiZVGsmUcbbuerbXUQ==
X-Received: by 2002:a05:622a:6087:b0:4ec:f2e1:483 with SMTP id d75a77b69052e-4ffa76d6e12mr17787811cf.26.1767661296555;
        Mon, 05 Jan 2026 17:01:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 03:01:18 +0200
Subject: [PATCH v2 08/14] arm64: dts: qcom: sdm845-db845c: specify power
 for WiFi CH1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-wcn3990-pwrctl-v2-8-0386204328be@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2Pib2kwPZ7DtwTUQkou3mGrF+rWLEBJzLfmZbLG03XU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXF7Zlf5n0Dg26rwIIPNnqK2YFns3wZx16t903
 43lWvHimASJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVxe2QAKCRCLPIo+Aiko
 1dZrCACPlopmhMEjT9k6ib8gDTAHXIMD+WgZ5g8/QSHrZLMEMi4HDHghnDOoNwNm1NgDBRRyGUS
 h3LH1A7/KcP6PthaN1Gt4mtN7JaJFgmn7w4pSuQM22tb+cHchs4dAHfuDrTt8n/5EbR24ZPL+R7
 ySpex+Sw0hf+p/wN+px4X0jDQrYn/XCcoY8QN4YFI1q0GEKHpwQRPMx1h1SB2XbIUZKJpH4cVDH
 Q1lL8ogyLBdqHNz9ucKF6STXUBf3Z9tLCVFxwgg8ZuMZOIYRPC4R+l3z6KPyJne8A+cSBVREq2q
 tZfomdIN5pHS3W6ZowKRJiQZh1rThNq+q3kJ3RniBemodlI1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfXzt74BmhvlTcf
 rFzqG2mm/l+yBRMZN5ULWdK3OZwMaO4ADMOi1qtccwGi0RuxHOHjwbMmS8hNaMrdQhlX7xeQORg
 62lvK1i3+1x6+ioxYIAmQh5+5HpJ16Cwp/0FpW9vIUGPPz04DvJg3DNjgHDZEVPsmIs/xYZSJQF
 LZ4huqcIKCJZKb6lk0joQArex3OWXWJO5nG1aRbhmdZ+pkmdK0nHeZHl+hSEi0/rHYz7NuFkhi2
 /rKrlvUxuPUc6nsrg5eMAz1Zmz6IIqK9o6YlBfqLJek/kSvVANnoYSXh5+vDiK1tzD7WZqrZiS0
 q8TjySh1SBcC9cX6Hx/nIlvgC6SZ+VFaV3tyeodjrnecSw86oR6ioVB4hpKPGIMJXKuLgCd6HgU
 iKSLiK3uh5kUHJYiNqHgtxGMDCpOfBCkQYbvCKYEHq42GiNdmpgR8o2Y164sPYzbzDx9CC3hfK/
 fyi3Ft8waa38spkNJbw==
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=695c5ef2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bVOQ5LKHHoa9h4ffDBkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: -4QMzqu3p--UVreLMl1MvNkf8sNZGUsB
X-Proofpoint-GUID: -4QMzqu3p--UVreLMl1MvNkf8sNZGUsB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_170139_097051_174A68F1 
X-CRM114-Status: GOOD (  12.08  )
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

Specify power supply for the second chain / antenna output of the
onboard WiFi chip.

Fixes: 3f72e2d3e682 ("arm64: dts: qcom: Add Dragonboard 845c")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index ad283a79bcdb..5118b776a9bb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -379,6 +379,12 @@ vreg_l21a_2p95: ldo21 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l23a_3p3: ldo23 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l24a_3p075: ldo24 {
 			regulator-min-microvolt = <3088000>;
 			regulator-max-microvolt = <3088000>;
@@ -1155,6 +1161,7 @@ &wifi {
 	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
 	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
 
 	qcom,snoc-host-cap-8bit-quirk;
 	qcom,calibration-variant = "Thundercomm_DB845C";

-- 
2.47.3


