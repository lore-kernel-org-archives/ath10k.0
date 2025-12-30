Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99CBEE57C7
	for <ath10k@archiver.kernel.org>; Tue, 30 Dec 2025 23:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4CuQYcWJDm2WGHsZX04dpGhQA7HPPf+2qQrhA2V7ZQ=; b=fW/aAACZUueSYKM4f4hUjDVzdS
	n3j88B13R8cVmKZNDX1V2VGo80s0AWGPuUZT+6Tt5B0X65S0yEefRkYeY/AXMY9A/Lhby1rQtVVBO
	tIgwJqqG/DPfKweVnW/cAVcC7nqrUdnxEoldRFdttgOnFV24gAklT8Egv9rVj2D1VQsVBd05YzsFB
	bC1AlqqLXbe1YyNPC7LLXc57cWxIY2t2w3DDINDDVBAUn1jWvA9LeeVhs3+dsGLeXAlpt0JKAkr25
	dwU+pjeNpng9qot/2Lb4cKxp845OjADmnbWr8G4RSA/aqVYDMzv2DMIIG4BgH93H3julSXvasepUv
	hZrxnWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGC-00000005Rxx-28eZ;
	Tue, 30 Dec 2025 23:36:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGA-00000005Rvj-00hq
	for ath10k@lists.infradead.org;
	Tue, 30 Dec 2025 23:36:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUB8uoR3971615
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T4CuQYcWJDm2WGHsZX04dpGhQA7HPPf+2qQrhA2V7ZQ=; b=o0/OoV1OThKPsxHz
	si//UThuoOCGVSMdE94/7+HwvXZCDVXhmqZnBBs2OGmVHCy+1F/ZooG3jXKK5YTt
	4Whur72cD/C2Kt2nxFlSvBnPwxlYCKFEhsLSzb/mE8bbu05Tt7ML695ApiNdk6OE
	a3asbtKS54AZWJfiVXbGO9OVPqZNeqsUoTPD1Mh1nUbVIwzTfwImwiGTV94C+Wh7
	ALdd6bHE/Wuwdmwa46G0u3myvVMSwLYsUTGFoaZsGApVuRX+vOmk+cr6Z+Ql4cco
	IYznBc2nfWWRPj2Lvl9Oj5L/EgdvqVX6o2gGcvlxHunIXz8lG+UpcEHc+QSduj75
	fEYwDw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcdky1dfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d60f037bso230369051cf.0
        for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 15:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137772; x=1767742572; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4CuQYcWJDm2WGHsZX04dpGhQA7HPPf+2qQrhA2V7ZQ=;
        b=JtCdrHquBZ21LTq41ru0opy/MtKlg50QlzqH/eKKZkzoYXevbBErPng5gmCOhHoyZA
         9jC90h3DfqCO/Ga5o2HiqnA/UuoZGr2Vvubv0wPZ2QNbAmZZEOmrqoCp1OmjvhfVxPqP
         pSIwfyq6U8sBkF/pogmVxsrQV1nMyo573F5vSpE69FHfTxhQYJbWMKsEBNtDZ1ENWuNo
         qNAFU/q5fNWl1NAXIs4yDst2O4zlgUtiKBmYj/pdhOPXVU07AioTMS8yijvXb5NbjZz5
         8v4ZPaXrTfPGM+uNOjtaWzEimmSwXH+dnSX1BcZ10Umf9AG38QrDlQxrqU+wfivA+ZoY
         pgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137772; x=1767742572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T4CuQYcWJDm2WGHsZX04dpGhQA7HPPf+2qQrhA2V7ZQ=;
        b=RzrvZzX+JZMv0pApjUK2Z/ESvG3g+mj5SPaVboNMnErg/U8vrF+vbQJEXwPjdtTsz7
         KY5IKKKOT1ma4k6LBM2XpvZuMkZdfDnB+U0YmnF9JFnsgchYC+DDgfPT8gQTX6w/OB0S
         mScoBChO7T1fwRUmSTLy3Wory2IDQFz0pIGoORksuL82cIDm9G6dO4UYtpRVHdUE68zm
         OM9GSy02X9v1Viqxrsamrx2X9gyO62T+mF5ZiFsZGLM0igjbed1hG7osITg7zEelSA9J
         dSU8AHjb4nXvNwFrCmM/ZJ1gEgiX6ep/xftjXkS+rDTOE0nA47tly3iGMqjsB32nkGD2
         qLBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhfiKdn79va8VzMwXtBLYph89Vzndolotl6DY626QxDHdP9WDTMEnxr5rm+KjkVH4PqPHZ7F8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9Ysxb5VUeG/V3HDJCUa+WtSlJ50RAYnUyfUIp/QKTdT5p2RWf
	nsGEkTOF5STEGandjjooAMb82MmhqSbRM+7wDp/tTma3PbsBxxpJ2daRcCIwcjjIO4mZiv0c39v
	Q+l/R8QecWyjPnHAjEqVVNBlBu3C4RNy5WF1P45qFoxyJeB3faZwU54wG8xvATMBu
X-Gm-Gg: AY/fxX5VA+krnI7L3IDwVs//XBEZm3nxKjVQ5CsSSbHvQr2UUVrTlAkHWX14DcZHMv2
	88YSc8i5Q5exvxi5PPO1ZfMsfKNni43b7OmUpzSJNFCLIbaxxQ01fuf+4SjRiaVIPZpPU6T5kWt
	k2TOC3EauhrAODsUNYKfcSyRpLngqdkvRO2SaglNLtldChL2aDv/LhBzc9Iq2NivunOD2U+hK8X
	SxGsJxTj6hZq4G8o2E0r3IU9/vb5qkIgODPL82PJPIzzUtpH+ynLb9xFRLek6BZmm5JalOL4zUo
	gnCnbUD+l7bFEN96+koNL6zXWFd6RIpPPGnCD/wHEBkIEVlhUnNBPI/bWPTQ8DYbhpa2dOQJEgx
	l6YLgLDYHeReYibtZTTG/vRgjXj+wUpIYgoRP9lyekqAavF2MULJq4ta26WTgsPMmxynkJzvzv3
	aqbGiSXgL/tpKGq3WN5rt66vI=
X-Received: by 2002:a05:622a:4d43:b0:4f1:b9e1:f08f with SMTP id d75a77b69052e-4f4abccef46mr678516861cf.5.1767137772367;
        Tue, 30 Dec 2025 15:36:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlDPU6Dqq5czWrRWiRVo3KDmDnZib/IbWQyj9oxLhrnXD3CT7PTTDOP/hBeaierKDJ77x3Ew==
X-Received: by 2002:a05:622a:4d43:b0:4f1:b9e1:f08f with SMTP id d75a77b69052e-4f4abccef46mr678516561cf.5.1767137771935;
        Tue, 30 Dec 2025 15:36:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:35:54 +0200
Subject: [PATCH 04/14] wifi: ath10k: snoc: support powering on the device
 via pwrseq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-4-1ff4d6028ad5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3870;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7QSioEYvGLnmvEenw/yHYmMfZ9Xg0f5fS8NTJWat/EI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpVGHkHbyPI900A+jLy/7p42gbNUYAcF9OhJ9mB
 7CW85kKHn2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVRh5AAKCRCLPIo+Aiko
 1dx4B/0VHR786H300VxW1pwdym1Ee/FczTpqsCvyGjuyZ8bo/+du7C/9JfjMuGXPzW5orBpXdfX
 hOX0pOrMszp9hBJ/O0L+ApDBodhZDfskjO14Fa/4vPTzOjGk3yQ60DjzecKwh4KnW7w2zf4LhZ1
 P7QFGFWi8b+9wIcDtqcB8/jWIqsNxoVgjtim4ECCrX435hc50mrsI1sfzAFLEKhWWbFlIxxNRbg
 0vAy+Nqp4uYoS9P3h5pnYO7sJks5sGJ1MlpbU/0x7M+TKO2rcS8hS03VvOOGg3hZ6j7oZWMX+cX
 Gsc1rgY1RWm4Dr3OTJF4rS/sr/flKCwZFonWYiO8K41KPg/E
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfX4xJ6eUsPyejX
 iHCzt9lczn5r+5JivLzK6VgWMDWe/0ScyV/Xu8/RT6k41ERxOk+IW0NSnJ1LMKfM025gxBlgMZ3
 rPZkIlwTAEcCkS79ha0N5sSLv3PMCAJN1IxFc6x7tmoBDTrePqSLHFriNSmV5h4d6RTzQ35T3KS
 t/soUryvUXb36a9PjV/EHLHOOOMzDa2G0Wbh4o59eJQZQ8ePpxsEHXXumpzz+/MBN46ndYpN8SJ
 UKZJ/uoZnc0Dd+93Tgh/r7N410RYYTas2N4iVa9SJSFue9O5Qq5ewR95t690g6ov+rpo6h12If5
 8tHNsAvHYyjhZn7Z9Yiuac9Jpd/ZUd1McnAhXjDM93pDSO5U+h3Yvjz67aPSZq99wwED8WhH3f4
 3auLJoeGx0y0+X5tfTLA1DNh/4niftAN/N9ulzfgvHqprApiBqpPhSvB7CxkTb+4C4Fa8J97lAu
 jgGJO9u/JBId1+BaKLg==
X-Authority-Analysis: v=2.4 cv=Wskm8Nfv c=1 sm=1 tr=0 ts=695461ed cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Hs-j7k2oS4XMYd915dMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: OSkmklAM0_06PJA8wi87bf_AaZ3QjbxS
X-Proofpoint-ORIG-GUID: OSkmklAM0_06PJA8wi87bf_AaZ3QjbxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_153614_057125_913BBD76 
X-CRM114-Status: GOOD (  20.64  )
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

The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
voltages over internal rails. Implement support for using powersequencer
for this family of ATH10k devices in addition to using regulators.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 43 +++++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath10k/snoc.h |  2 ++
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index b3f6424c17d3..919d4b0b87cd 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -11,6 +11,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc/qcom_rproc.h>
 #include <linux/of_reserved_mem.h>
@@ -1023,9 +1024,15 @@ static int ath10k_hw_power_on(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power on\n");
 
+	if (ar_snoc->pwrseq) {
+		ret = pwrseq_power_on(ar_snoc->pwrseq);
+		if (ret)
+			return ret;
+	}
+
 	ret = regulator_bulk_enable(ar_snoc->num_vregs, ar_snoc->vregs);
 	if (ret)
-		return ret;
+		goto pwrseq_off;
 
 	ret = clk_bulk_prepare_enable(ar_snoc->num_clks, ar_snoc->clks);
 	if (ret)
@@ -1035,18 +1042,28 @@ static int ath10k_hw_power_on(struct ath10k *ar)
 
 vreg_off:
 	regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
+pwrseq_off:
+	pwrseq_power_off(ar_snoc->pwrseq);
+
 	return ret;
 }
 
 static int ath10k_hw_power_off(struct ath10k *ar)
 {
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
+	int ret_seq = 0;
+	int ret_vreg;
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power off\n");
 
 	clk_bulk_disable_unprepare(ar_snoc->num_clks, ar_snoc->clks);
 
-	return regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
+	ret_vreg = regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
+
+	if (ar_snoc->pwrseq)
+		ret_seq = pwrseq_power_off(ar_snoc->pwrseq);
+
+	return ret_vreg ? : ret_seq;
 }
 
 static void ath10k_snoc_wlan_disable(struct ath10k *ar)
@@ -1762,7 +1779,27 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
 		goto err_release_resource;
 	}
 
-	ar_snoc->num_vregs = ARRAY_SIZE(ath10k_regulators);
+	/*
+	 * Backwards compatibility, ignore the defer error from pwrseq, if it
+	 * should be used, we will get an error from regulator get.
+	 */
+	ar_snoc->pwrseq = devm_pwrseq_get(&pdev->dev, "wlan");
+	if (IS_ERR(ar_snoc->pwrseq)) {
+		ret = PTR_ERR(ar_snoc->pwrseq);
+		ar_snoc->pwrseq = NULL;
+		if (ret != -EPROBE_DEFER)
+			goto err_free_irq;
+
+		ar_snoc->num_vregs = ARRAY_SIZE(ath10k_regulators);
+	} else {
+		/*
+		 * The first regulator (vdd-0.8-cx-mx) is used to power on part
+		 * of the SoC rather than the PMU on WCN399x, the rest are
+		 * handled via pwrseq.
+		 */
+		ar_snoc->num_vregs = 1;
+	}
+
 	ar_snoc->vregs = devm_kcalloc(&pdev->dev, ar_snoc->num_vregs,
 				      sizeof(*ar_snoc->vregs), GFP_KERNEL);
 	if (!ar_snoc->vregs) {
diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
index d4bce1707696..eeaa1c009cb0 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.h
+++ b/drivers/net/wireless/ath/ath10k/snoc.h
@@ -53,6 +53,7 @@ enum ath10k_snoc_flags {
 };
 
 struct clk_bulk_data;
+struct pwrseq_desc;
 struct regulator_bulk_data;
 
 struct ath10k_snoc {
@@ -73,6 +74,7 @@ struct ath10k_snoc {
 	struct ath10k_snoc_ce_irq ce_irqs[CE_COUNT_MAX];
 	struct ath10k_ce ce;
 	struct timer_list rx_post_retry;
+	struct pwrseq_desc *pwrseq;
 	struct regulator_bulk_data *vregs;
 	size_t num_vregs;
 	struct clk_bulk_data *clks;

-- 
2.47.3


