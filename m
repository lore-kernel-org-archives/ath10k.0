Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEE4CD0427
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 01:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OuOUyprpOAl+aN/Pwr6K2wJvLACCaUnkXSkdJN8k3E=; b=wlk5VFTHhvx95N+TDde+jGmCqS
	dHcIfE2yLQ5wmLJa6uEtUGPOaWbnVyQf4QP01YDvsdCxh8oQ8Kb2T+Dy4FzsJLqgUu2ieel/kKvhP
	8kxT7hG++SONYocDiNgUam+E1c4M0kBnY6mJVUgn+SqojFaQhadI9ExDlMYIUZkOZ41Scu9i+tkNl
	KdJeF0JwyAd0Fg4g7YXSJZ7iAIAP1AH4qe7RIXISP8tW+yf+Zdkq72llynxEGcbeQgQUqtBdacxeX
	AeamDiL08uVthXAl1g0P18Hw20YGgyy0R4dVaSGYEHBgT5JsL1ZSvWoPo7O/VMYiMYfZwukNrwj9H
	Z1z/1eyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvS1-0000000CHbF-3a0j;
	Tue, 06 Jan 2026 01:01:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvRz-0000000CHYz-2FXP
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 01:01:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060oFkt2530740
	for <ath10k@lists.infradead.org>; Tue, 6 Jan 2026 01:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9OuOUyprpOAl+aN/Pwr6K2wJvLACCaUnkXSkdJN8k3E=; b=IT10/NfKS6xP5lck
	HZNGYuQd6GNJ0jAwS6vc39GoF0T4oGbupZrEQt7by6ctp8rH8dNLBp7f6/HCdDEX
	4y8Z4U4m+qxOnY2xF44VAIE43W8/ZrMHZ4pny9ENVEpQomVIsnLMPXD+b7prC/K2
	Dcc58m/fKYpR+UigE98Vn/DTjUB95yqNJxrpb5nrXsoC3WSpqcW+bZhSNp0YI732
	Nu0AV+hovbzY+ZK09GAo+HZpMRb22Kjp2OTStLEEIqR2sUANpIRCrZRnEPrb/nbF
	er9L7HcQv+4r0wxlQbKQmqRb6r/j9cYYwQqZzUgZdoBR8w4GCQ7P+019Z+gA9k5r
	m0H04g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus2bdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 01:01:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed74ab4172so9943681cf.1
        for <ath10k@lists.infradead.org>; Mon, 05 Jan 2026 17:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661290; x=1768266090; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OuOUyprpOAl+aN/Pwr6K2wJvLACCaUnkXSkdJN8k3E=;
        b=Mcgiyxabvx0CCVyc/farfeCCCQn4tu2XPXW6ZYX1yrEuQN+l2CxR4uA+aSueUslavD
         H15QURwR+Qg1fOlY9X2BfMvycMzkcDzruxEoNuA1o677AQHUk3qgIwIJUFbidm30SOAv
         qCBLduuk4B2hjOthcb9m/mkpf1Apo47tSUim9SvQwldg/REjGOyGMr43+wmyJiQMnbqi
         VksW0+4EqsdRSKQSoi7wc9WqoIKxILtR2nfBz1nsWOwS8mvoAfaO5TxBZvhVXvA4aBRD
         AODg8lEtJMAXfOuHgpNEdxPqCx8T2Z73v/RY06aeOkeaOXI1M8bpePxfsQzMcKMxa1y9
         KePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661290; x=1768266090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9OuOUyprpOAl+aN/Pwr6K2wJvLACCaUnkXSkdJN8k3E=;
        b=ppaewS9pmY584+Q2fX/w0wtVRT//YF4r000AU6BDNmij3T6qE4a07rYbVph0NkeTQe
         PHy7SJn5kzErjSmEDF9+y8wUh2LbNkJVFIVgtf4d8Tb0YymM5PBKYQ8gK6myZM4B3w0P
         uO2G1ADfq91c7ju97PA3x8P86H0aHDjqkqmk1Xsd2HM7l2wNvOwhLxZQwMK7JzpcSqX1
         coUt/84Gvh8ui/DkvV78hDUKxfGYjm4ImFia9sBHc38QIYSyIrGQo0BedBMzVR2UnUup
         SzEXW+DMWOlpQXotpgSa9sW1NMskd81p87iXJo/nMvIr9hjjCs4JSQexRYElI7JMABdh
         OzNw==
X-Forwarded-Encrypted: i=1; AJvYcCVWVmY7oHSxa0jgEFOCk4HsYnYiBb/+jh+MnsA267jnT/eOXILfqy6rlrxD7M9YL1IdsG3dHyE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwntXYqK7skipatYkcDNUEX54/DUuqj3AxjcnbkiQan8PAeUYeD
	LMA3HDauHEfEqf/4PMSJ/OMv4piCofbsGGiYTLMRDpak/lVf9meOQ7rtfdPn9mSmZ4AYJQk8xrc
	CtymXTudJPV2YGnbn34202tfcpJIsZfFZPM3ntNR8Tc/Bzy/vN7y1n+h2GUw9HsU4
X-Gm-Gg: AY/fxX6HE9vdnU1j8irxAOIbVjRNSD0cd5vsj6xorgdk+HvzD/ZjJMECa3mD+jZoVuG
	GkHLoMZpCGoAmKgVSsOgm6KcCsia/qwcyV2t6j+APKH4H2+AD+dXlLWaxDKbVrrZEbc8Nos3TZt
	M80Wiz6C9QqFjAKlCvbOt+SwY0fy5JApHYiDj8n1KuKttbQqTM8lfta/3nNM4sXzjwik4x/MlLP
	V6ss9/ncrBJmjDXBKY4gaYmDWWcEJHJwXtmlLtjBcLpvhoe+DnPc152pz4daFBwQMKkBXMCXApo
	GpjnFR05oDXO43Ut6a39DRUq+mizTH23+92dPrEpL+7GtVOcqtR9iY322Eh842BgqVzxVyTHZUS
	/Ldq3ym4NqWGgrBpWXa2kNQKZWFotYF0Te1IiQQ7uuI67QTtThJYeNIbvS48SpK5G8593JkNOZB
	6wcRjWzxdMxzyTfbrzcrEkcj0=
X-Received: by 2002:a05:622a:1a90:b0:4f1:83e4:7247 with SMTP id d75a77b69052e-4ffa77edba0mr20002021cf.60.1767661289798;
        Mon, 05 Jan 2026 17:01:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+5IzIJNwWT75Bh0S3llMlTTaHsdE2oxSePDzByPLYAXS5enj4ixoORoDpw3xOvmfFuqxWEw==
X-Received: by 2002:a05:622a:1a90:b0:4f1:83e4:7247 with SMTP id d75a77b69052e-4ffa77edba0mr20001301cf.60.1767661289211;
        Mon, 05 Jan 2026 17:01:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 03:01:15 +0200
Subject: [PATCH v2 05/14] power: sequencing: qcom-wcn: add support for
 WCN39xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-wcn3990-pwrctl-v2-5-0386204328be@oss.qualcomm.com>
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
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8156;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RE5x+iyzWkq+myL/UhBPksXnYELVIZK7yVIYkyV8M9U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXF7Z4PYSXJjreNhQo0g4VN4zQEJz72nOo1Bsl
 FTSkKEYZFGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVxe2QAKCRCLPIo+Aiko
 1RmVB/4znVfiyGXJsJwane98IRGdlpZTj++hBTtO8qlpJ6T9RmVDgopL0fKjfWEaPcJEQ3iWAyR
 QXN4rhcttyl/0FA5p1JPIAtrvn9FSRUzBycGDMAsiOZ5HTB4jVGAyde5LsLxT1RSIs0lVKcTL7p
 +BQKu22ovgITvebJuSaEhuyheuBrTN1NA7VoNsuWNwA7fPcDI3Aabsr56NBTUlWBUBmPvTzJjr6
 aYKOxo4FVqWv5N5EOsoHhFFDW021GdDSaedsiXdLpNELmzNtABGj/bIGew5Mn64H4fnurnp8pKN
 YNSDDu2HuDMtpgVg3zCw7RPhBeziSqABstLqS2QDKCKpjpe7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 357IaX_ck2KpLUCUeIu2rocoBb1WP6N6
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695c5eeb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=I1O4o1mkfA9rNPu_QXcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 357IaX_ck2KpLUCUeIu2rocoBb1WP6N6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfX0KulfSXij0cJ
 FqU4KrUsz3PCcdGyWoZ353T3PpU4328xqy59RMdHDyA3UJDnVEB8Jpi5JPy7nS5Alq/MNZTGHEE
 ikGFlEIZk0z5TKfbXVj4a/DrjLLQZaLFAvMtN/d6KXY+6CefGAIR4vYPC1BgLgYHwoQynCa3Hm2
 W8y4E5GRRWE7ua07b14AZwP340cA7yfMQJKemk887puCXh/6Am/WotiDhbnEQFndf/HPzGcgLZj
 17DlW2raopdjFGjqf9+WH6MQyUunZBBjWjQm3gmPDhbdr6qpqTzUmdf/t4CJKnECoYMq7MmxiY7
 76gQ9kqeQtbyOQjxWlSEvwJEQmhCtdnx0qbokWFBkUo8JT0zjQnVKQz58K0eWKziB5X90vWNARO
 3ANg5YM6Bw4hI9qSoRVzswd6kRVUlz80mDXVAdHeif4bXnfcddx2EhbX06n+xsW3DUf4na+Q+Y1
 0jERijUQyiCFo70qJ7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_170131_598913_D2BA755B 
X-CRM114-Status: GOOD (  20.75  )
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
voltages over internal rails. Implement power sequencing support for
this generation of WCN chips. Unlike later devices, they don't have
separate enable GPIO lines, letting the chip figure out the necessary
parts on its own.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-qcom-wcn.c | 130 +++++++++++++++++++++++++++--
 1 file changed, 125 insertions(+), 5 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/sequencing/pwrseq-qcom-wcn.c
index 663d9a537065..c5071708e85e 100644
--- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
+++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
@@ -23,6 +23,8 @@ struct pwrseq_qcom_wcn_pdata {
 	unsigned int pwup_delay_ms;
 	unsigned int gpio_enable_delay_ms;
 	const struct pwrseq_target_data **targets;
+	bool has_vddio; /* separate VDD IO regulator */
+	int (*match)(struct pwrseq_device *pwrseq, struct device *dev);
 };
 
 struct pwrseq_qcom_wcn_ctx {
@@ -30,6 +32,7 @@ struct pwrseq_qcom_wcn_ctx {
 	struct device_node *of_node;
 	const struct pwrseq_qcom_wcn_pdata *pdata;
 	struct regulator_bulk_data *regs;
+	struct regulator *vddio;
 	struct gpio_desc *bt_gpio;
 	struct gpio_desc *wlan_gpio;
 	struct gpio_desc *xo_clk_gpio;
@@ -52,6 +55,26 @@ static void pwrseq_qcom_wcn_ensure_gpio_delay(struct pwrseq_qcom_wcn_ctx *ctx)
 		msleep(ctx->pdata->gpio_enable_delay_ms - diff_msecs);
 }
 
+static int pwrseq_qcom_wcn_vddio_enable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	return regulator_enable(ctx->vddio);
+}
+
+static int pwrseq_qcom_wcn_vddio_disable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	return regulator_disable(ctx->vddio);
+}
+
+static const struct pwrseq_unit_data pwrseq_qcom_wcn_vddio_unit_data = {
+	.name = "vddio-enable",
+	.enable = pwrseq_qcom_wcn_vddio_enable,
+	.disable = pwrseq_qcom_wcn_vddio_disable,
+};
+
 static int pwrseq_qcom_wcn_vregs_enable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
@@ -94,6 +117,19 @@ static const struct pwrseq_unit_data pwrseq_qcom_wcn_clk_unit_data = {
 	.disable = pwrseq_qcom_wcn_clk_disable,
 };
 
+static const struct pwrseq_unit_data *pwrseq_qcom_wcn3990_unit_deps[] = {
+	&pwrseq_qcom_wcn_vddio_unit_data,
+	&pwrseq_qcom_wcn_vregs_unit_data,
+	NULL,
+};
+
+static const struct pwrseq_unit_data pwrseq_qcom_wcn3990_unit_data = {
+	.name = "clock-enable",
+	.deps = pwrseq_qcom_wcn3990_unit_deps,
+	.enable = pwrseq_qcom_wcn_clk_enable,
+	.disable = pwrseq_qcom_wcn_clk_disable,
+};
+
 static const struct pwrseq_unit_data *pwrseq_qcom_wcn_unit_deps[] = {
 	&pwrseq_qcom_wcn_vregs_unit_data,
 	&pwrseq_qcom_wcn_clk_unit_data,
@@ -229,6 +265,17 @@ static const struct pwrseq_target_data pwrseq_qcom_wcn_wlan_target_data = {
 	.post_enable = pwrseq_qcom_wcn_pwup_delay,
 };
 
+/* There are no separate BT and WLAN enablement pins */
+static const struct pwrseq_target_data pwrseq_qcom_wcn3990_bt_target_data = {
+	.name = "bluetooth",
+	.unit = &pwrseq_qcom_wcn3990_unit_data,
+};
+
+static const struct pwrseq_target_data pwrseq_qcom_wcn3990_wlan_target_data = {
+	.name = "wlan",
+	.unit = &pwrseq_qcom_wcn3990_unit_data,
+};
+
 static const struct pwrseq_target_data pwrseq_qcom_wcn6855_bt_target_data = {
 	.name = "bluetooth",
 	.unit = &pwrseq_qcom_wcn6855_bt_unit_data,
@@ -247,6 +294,12 @@ static const struct pwrseq_target_data *pwrseq_qcom_wcn_targets[] = {
 	NULL
 };
 
+static const struct pwrseq_target_data *pwrseq_qcom_wcn3990_targets[] = {
+	&pwrseq_qcom_wcn3990_bt_target_data,
+	&pwrseq_qcom_wcn3990_wlan_target_data,
+	NULL
+};
+
 static const struct pwrseq_target_data *pwrseq_qcom_wcn6855_targets[] = {
 	&pwrseq_qcom_wcn6855_bt_target_data,
 	&pwrseq_qcom_wcn6855_wlan_target_data,
@@ -272,6 +325,26 @@ static const struct pwrseq_qcom_wcn_pdata pwrseq_qca6390_of_data = {
 	.targets = pwrseq_qcom_wcn_targets,
 };
 
+static const char *const pwrseq_wcn3990_vregs[] = {
+	/* vddio is handled separately */
+	"vddxo",
+	"vddrf",
+	"vddch0",
+	"vddch1",
+};
+
+static int pwrseq_qcom_wcn3990_match(struct pwrseq_device *pwrseq,
+				     struct device *dev);
+
+static const struct pwrseq_qcom_wcn_pdata pwrseq_wcn3990_of_data = {
+	.vregs = pwrseq_wcn3990_vregs,
+	.num_vregs = ARRAY_SIZE(pwrseq_wcn3990_vregs),
+	.pwup_delay_ms = 50,
+	.targets = pwrseq_qcom_wcn3990_targets,
+	.has_vddio = true,
+	.match = pwrseq_qcom_wcn3990_match,
+};
+
 static const char *const pwrseq_wcn6750_vregs[] = {
 	"vddaon",
 	"vddasd",
@@ -328,8 +401,9 @@ static const struct pwrseq_qcom_wcn_pdata pwrseq_wcn7850_of_data = {
 	.targets = pwrseq_qcom_wcn_targets,
 };
 
-static int pwrseq_qcom_wcn_match(struct pwrseq_device *pwrseq,
-				 struct device *dev)
+static int pwrseq_qcom_wcn_match_regulator(struct pwrseq_device *pwrseq,
+					   struct device *dev,
+					   const char *name)
 {
 	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 	struct device_node *dev_node = dev->of_node;
@@ -340,11 +414,11 @@ static int pwrseq_qcom_wcn_match(struct pwrseq_device *pwrseq,
 	 * 'vddaon-supply' property and whether it leads us to the right
 	 * device.
 	 */
-	if (!of_property_present(dev_node, "vddaon-supply"))
+	if (!of_property_present(dev_node, name))
 		return PWRSEQ_NO_MATCH;
 
 	struct device_node *reg_node __free(device_node) =
-			of_parse_phandle(dev_node, "vddaon-supply", 0);
+			of_parse_phandle(dev_node, name, 0);
 	if (!reg_node)
 		return PWRSEQ_NO_MATCH;
 
@@ -360,6 +434,26 @@ static int pwrseq_qcom_wcn_match(struct pwrseq_device *pwrseq,
 	return PWRSEQ_MATCH_OK;
 }
 
+static int pwrseq_qcom_wcn_match(struct pwrseq_device *pwrseq,
+				 struct device *dev)
+{
+	return pwrseq_qcom_wcn_match_regulator(pwrseq, dev, "vddaon-supply");
+}
+
+static int pwrseq_qcom_wcn3990_match(struct pwrseq_device *pwrseq,
+				     struct device *dev)
+{
+	int ret;
+
+	/* BT device */
+	ret = pwrseq_qcom_wcn_match_regulator(pwrseq, dev, "vddio-supply");
+	if (ret == PWRSEQ_MATCH_OK)
+		return ret;
+
+	/* WiFi device match */
+	return pwrseq_qcom_wcn_match_regulator(pwrseq, dev, "vdd-1.8-xo-supply");
+}
+
 static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -391,6 +485,12 @@ static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "Failed to get all regulators\n");
 
+	if (ctx->pdata->has_vddio) {
+		ctx->vddio = devm_regulator_get(dev, "vddio");
+		if (IS_ERR(ctx->vddio))
+			return dev_err_probe(dev, ret, "Failed to get VDDIO\n");
+	}
+
 	ctx->bt_gpio = devm_gpiod_get_optional(dev, "bt-enable", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->bt_gpio))
 		return dev_err_probe(dev, PTR_ERR(ctx->bt_gpio),
@@ -432,7 +532,7 @@ static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
 	config.parent = dev;
 	config.owner = THIS_MODULE;
 	config.drvdata = ctx;
-	config.match = pwrseq_qcom_wcn_match;
+	config.match = ctx->pdata->match ? : pwrseq_qcom_wcn_match;
 	config.targets = ctx->pdata->targets;
 
 	ctx->pwrseq = devm_pwrseq_device_register(dev, &config);
@@ -444,6 +544,26 @@ static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id pwrseq_qcom_wcn_of_match[] = {
+	{
+		.compatible = "qcom,wcn3950-pmu",
+		.data = &pwrseq_wcn3990_of_data,
+	},
+	{
+		.compatible = "qcom,wcn3988-pmu",
+		.data = &pwrseq_wcn3990_of_data,
+	},
+	{
+		.compatible = "qcom,wcn3990-pmu",
+		.data = &pwrseq_wcn3990_of_data,
+	},
+	{
+		.compatible = "qcom,wcn3991-pmu",
+		.data = &pwrseq_wcn3990_of_data,
+	},
+	{
+		.compatible = "qcom,wcn3998-pmu",
+		.data = &pwrseq_wcn3990_of_data,
+	},
 	{
 		.compatible = "qcom,qca6390-pmu",
 		.data = &pwrseq_qca6390_of_data,

-- 
2.47.3


