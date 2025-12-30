Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC874EE57C8
	for <ath10k@archiver.kernel.org>; Tue, 30 Dec 2025 23:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+J6odUgaa8iwTvncGdMwjsDOYue6NOpQi6sZNGxf7o=; b=nGRtHnEFnQiQ8cW6YP3aB5z2NO
	hDhagxEg3QnY6ecxvKpXzD+020Sq4MFs76eOzdt8zeNykJjaIkDqoZOqD/JyLst0UJMtwIwoyw4go
	lPlEIrVA1RcKu2Hdgy2uzJ+2JoRRuy1fYVSP3JEi5zl/1+T2JmfoJF/2jz2X3mTZB5B/1bdjlp+RX
	v9G4Uc85j9KZDKi77agpSz5tuwtGobHG5K8kfHRavr2zDZxzvkGjxSgtJQbO8Dsy/VwAJ1+yK22rT
	emlz1tzGPZOQ1UwkcTXtJaLgDAntpOMZ51+XPYXU6cB9ocrqScZu5fm0wYurxizNGYsQQEN+dt6ZB
	0Y38/rGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGD-00000005Ryc-3kd4;
	Tue, 30 Dec 2025 23:36:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGA-00000005RwQ-44sn
	for ath10k@lists.infradead.org;
	Tue, 30 Dec 2025 23:36:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUB8mQZ3971206
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M+J6odUgaa8iwTvncGdMwjsDOYue6NOpQi6sZNGxf7o=; b=DgvFeT/LbKpAbaOJ
	6pJL0julzqo9F5xShPc/sPjnNl6mQU+meQIux5oud1XPM38IrvDErvwTUBYOK97/
	FOqpZal5hMHfcSYMc43GdFQ1BUVVW7ba1pDXwPfFRxidheChhL8IemJYRXQVz/E9
	5SWom50wRnFtyn84TqATGvIj0zrQmz5b3gFgFZWGG+P+1KuXmfFmp7uJrD1qc9Nl
	rWJEn80lAYBpds9ZIVnJ1dLtP2WfrRzFEezT2Nrr9uNYJSZBLyeHMS18T0Shhe/x
	kLLWYkFW1Yf5aBmdB4Ba9QBVYOUHi0+rmFCbnWmkRMSz9UYTU3DxM8ww3nboD6k9
	IIb7hQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcdky1dfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee16731ceaso201806211cf.2
        for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 15:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137773; x=1767742573; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+J6odUgaa8iwTvncGdMwjsDOYue6NOpQi6sZNGxf7o=;
        b=beSJA2mqIccg2FJQdOFI12PkTzsG8e+QEF24lahpSd64/dD6+ossTUobOPETzDnBHz
         sj/bDa7heNhrjSxK2S2VsGloOwbcIksPG4PivhKgvP9xoaHXKp6QPmH2VF4GX4lujNnt
         AIqU2tHxHKalZKTqVm3sUmrRjBYtdFbg74O7y0atP0EoTU21pmg1i1vGg3AGOZ90I0JQ
         2h3vqriMEujm8v28jkGqqGbfj9NRpcFfU41aQCIi81xJbU5c+gpha6BDVP8AdpPY/yTT
         S0W7KVRkW7t5iqqFLIBbbZe/uWMpzUTqcLJMqS59eHM46dt6QZc7fPszE8P4IaEpQsI3
         Glhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137773; x=1767742573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M+J6odUgaa8iwTvncGdMwjsDOYue6NOpQi6sZNGxf7o=;
        b=ZInw9UscT06nwocwD/6vGohM3StKapTDOc0qbCajNdeA4dJYa3QcU2D1zn4DtJzPHh
         GlAQBhZ/jJFzJVJNo7h0nWKlGw89GzJ3JR8sHcRPqUpUM8LI13ByxvIMKw93CBgs8w29
         EuycitcX9E2nhq7m7olhTMzcQIL8ki1t8/Lh5AuwIwTJtsKj8qVlQDAv2oScKWp5cZnE
         37yP1ZQRR1nbju7D8ctvLD4wJj7FKYBdF2tuxyNVLXZ2p6Ag5RiH6J3jSQnl8usO+1Qu
         vJMUdx5BBZz04xZ9Kbb45ADnNjjBTpwPKPvJRoHJuEDkbFDogWfsS9bAEePHXECzN1ft
         FX0g==
X-Forwarded-Encrypted: i=1; AJvYcCUFoBn0fGW8z3jSUm2I+qzTEbh5e+C9Z65Yfg8kJ6XfcU7jM063ay84CPkWk2YEMp59+Ctr8iA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEeb9ZSapKPmiBD1MzEr3BXxSpcEmfwrCgWCExPo5NA8saPLdX
	kFgw6b3GqCLJmXVJjkb89fMB2+mSrVhc2qzl+amkLnKNmUnDnHG7V8e5J4AlNvBZalIZK449pZ+
	i6nz8kaWWHUtdH6fVvvVKlDtvR3uqet8C43KfWRHIMZaAmQHbyhCU4rIQ4vhBUSCV
X-Gm-Gg: AY/fxX6BKRD5aQJMzQ3E9bhKhos7Z/2omifeEK8ADgGa/LLcsrI6C0rZuMntnEceL6l
	TCYFFtPirdhu3KQFgcO37mCx6Zi//cNYQILKWil+4DmDpCF10RYD+W0qUEXOU58mF5Q3AKcs4wA
	jUV9vk/OGy/YloOp7G/R9SWr0kZzGtWH9yulG6FRh2dSoAkedzU1vUxffOazP3KzlYAeQdiWtaD
	fUtOO3rKfXsU8cF49xe1JiZmiKh+kyLn9G4DmcWGgQU33vfKfYVs5tHWy4hQldKKA9Lkc22bT0M
	EMTIGdtvHo6JGlewOVnnXVX4mGh39H7baWInXOZ6pdBQgzDHYjOHeo/6Twx+byX1my9hf6I5eqa
	jgGc062XV2H+oBHfPp3693T8J3E0Z8VM5z8E3Cnp4V/vkqrDLobCfJGdpvQAbGmxRnrpgLRBOsf
	nnSLDwDoo2Se39EU1A96XJr8M=
X-Received: by 2002:ac8:46c8:0:b0:4f4:c7c0:bd15 with SMTP id d75a77b69052e-4f4c7c0c07bmr350486871cf.12.1767137773504;
        Tue, 30 Dec 2025 15:36:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHt+XoYSbSJNRXHtMXQNgN0f/XiydU8U/JTEU2GP7wJMRDcjK6UqRn6PIVza81M2IRsxDEozw==
X-Received: by 2002:ac8:46c8:0:b0:4f4:c7c0:bd15 with SMTP id d75a77b69052e-4f4c7c0c07bmr350486631cf.12.1767137773096;
        Tue, 30 Dec 2025 15:36:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:35:55 +0200
Subject: [PATCH 05/14] power: sequencing: qcom-wcn: add support for WCN39xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-5-1ff4d6028ad5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8160;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=G5Z4yR6nEsG1t9E48mwIwJpb2fx2CuxEMAwYvVJCpKM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2ZI4pMOE1aXJRkm0xhOXLnBtuXhofJsj6deTGt0rvqou
 ynUW4p1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAimjLs/7QvHi2x29XYuu7P
 xelC2x5FthbuFb3BkNgXkNkwNYTXZu2s0stSKRs0v01X2Tp9t8qfS3pdPs+2Hpv44f8fb78ob1+
 uqF358VaiTPW++62ezZffIV+Y4C9QH7S0kMV1WdHbLPZHD0We7Ew8W/ia+c8UnyCp/tsXuG8qfk
 rcHB5sUtXZcOn13qPC/SkWQW1etl4MP8Xt23W/rmmPtFaqitsQc8e3Ye3JvX3Vdx5JyZx43njNv
 OvC+hsmIU++TSgUyU54O2eumYvmoUWPJ0Rnu71jXn1RReu3jc1v9antHLZZatwHgytffgs/vqtL
 /4vsv7/pLw4bx39K1zRa/U3N/KHUjWWWphH+NYUSTY0mAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfX5YtVDUG5AiP6
 mxQSVC4ZoUG4sGbPuKJG8jnPWib2EiqvEKKllZiONbXceyqVXeqXwh6Pej/IZeanjCKaILdkEtv
 6C4b2Q6cwadxEEYcFe9Yvn1ysKAKi/RTgo1/YMv6AaLT41DZeqV9s2Jb7ngDlDBZmvXRYp/EDyE
 WhhjzanmgTTHod6BSygRSjSElZnr+7iSQ51FjyOYPh/4/NdhYGOSaYFSbgO/IKprH0gnhW3hLEB
 fzNPG3gZq2ciZ3kZix5KpBxfT1z1leHEdD6GxOQiLQ0tyS+3nsVptSpRDphQN/8RkP3zuGkizeG
 2s/8gislbqPRxDbql9Tqoy0rvB+/pdM73jrwOskcWQboEKxqYzvIeRoOHPMR6h3u1UG/oD+uD0f
 3mh+sG6vM9lhUL5xcWD3uHRihBDzN5pTqVaZ+1LessQt/GCNpFOq1mE3TAwUWk7dSXKwk0GYR6Z
 LjPos0ZTSS3lVSxsSPQ==
X-Authority-Analysis: v=2.4 cv=Wskm8Nfv c=1 sm=1 tr=0 ts=695461ee cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=I1O4o1mkfA9rNPu_QXcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: wcJAQiUcmmzITmYKUj6DswT4lBhXMWwX
X-Proofpoint-ORIG-GUID: wcJAQiUcmmzITmYKUj6DswT4lBhXMWwX
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
X-CRM114-CacheID: sfid-20251230_153615_021949_92A9421F 
X-CRM114-Status: GOOD (  19.25  )
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
index 663d9a537065..ed81d0c90a2d 100644
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
+	"vddrfa1p3",
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


