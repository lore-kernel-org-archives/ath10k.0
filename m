Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048D5D29C4C
	for <ath10k@archiver.kernel.org>; Mon, 19 Jan 2026 17:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+CtHSvBIXD+GWDzkmgHnLc3U/47Ulr6j8JFJ4c1VOM=; b=UcrIGKp1yb7oH2a24QoUDJAOX+
	Vt/FT+4ze5Qt4+5X9I53fpaZHh+Qx6vJhsyXSGz+drBjM0kegfnmdSFyiLt0kvHsUF+RWaKV6yjNs
	GdwDPtV+4JtOaoONDAYjNZzXoMPx8ZX36Zev77XFC6qBz4pDjOiXDeSyOYKXeSX/tfXEXPL6GEyGH
	UmUdrA4jcGVF5rdeE13y5eIb8EXAFP//E2HVuIk/qTHu1iqJH6gKz5aJ4M0OsIobeTlscIyVWMU4e
	b9/T/Ex3Yqqcbu9nEqVP/kFLiCtxMRw8RYqgS68WFIu/QgJuHh2hXkrcO69sMFu1Yqr61MH+5V0et
	E6dLF9pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsjd-00000002anO-34il;
	Mon, 19 Jan 2026 17:08:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsjZ-00000002al1-2AyL
	for ath10k@lists.infradead.org;
	Mon, 19 Jan 2026 17:08:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JH5Pac774045
	for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 17:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+CtHSvBIXD+GWDzkmgHnLc3U/47Ulr6j8JFJ4c1VOM=; b=WyeANskOrzN9I+2i
	7ysU0LR9udeXIWGbRTBitfi7PLzYIecTUx3JChBch+8KHRB4GmVImtKFnw1g8z/F
	JAwNFzJ2j5waNY45gdiBII5pP5zOzF+2oslIXhJzaDqVI9e2o18eLOGAnj/6sosO
	wuQ59XlrO2c1oV2H7v475JNzwdT5IkDXcyolcbVbL7/tZsvwkjzMuX1wRfuHMF47
	KdH7SjpcwJXrWUKarDkqmyhKaej6D3dsdjJcKQdr6Es+B8rlWTwPRFEdgWB6sVyM
	PoPJF3lF0TaUacpkXn806U48Be314BEj+d8sSgGUSUld+psWNVATi4r289XIFm8P
	sh9J2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsj9a9a62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 17:08:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a341ac9fso777162085a.3
        for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 09:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768842488; x=1769447288; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+CtHSvBIXD+GWDzkmgHnLc3U/47Ulr6j8JFJ4c1VOM=;
        b=C4aY9vlwFCoqbVnXyQyrRNpg1Z/zBtrweyvrbSA8Vhzvqb9zR52ybbXMGHddGi751e
         Dx1H3Z+0GXWjO0G7x+15GM8JPRMq1sfK2AcW/1xPHhLZnEkgkHaB0/edtkntTT3VGg6H
         wshr0f6e5H+hs7zeaYMj6CupBw16BCqXDjPxUBrJD9avL3tbnCk3QB1uFCD4g+fiFP38
         9M5XLNfqd6CGb6ko5FFAehmbykDc1dBFO5rWG09FNuzoDJDuEp5eWb0cihc5BYzBxy8+
         pFjhkGxBkWYAmkaO9rtvTUOyLiABfETG+XW0gESbTJhe6D3De4CDV7h8/J7u+ten2Z7R
         IiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768842488; x=1769447288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+CtHSvBIXD+GWDzkmgHnLc3U/47Ulr6j8JFJ4c1VOM=;
        b=TqXY82cIVmv6JrSPHCm2wYZ+EqFj9Zz7A6fj22Pqhig0l783Ta62e1sFSgwtelVNQx
         MhhYqouw6fHBKuXiI+fB8F95TZ+TDn/z+r2ZhqUSbaxgFIp5sOnkAU3/mb1eDymigwtK
         0XkGELcMB3spUzOSGq/+4+NY9RHgN35FBdTn1/tLgAK584WIRPiOONOG0ygunS+lPfGw
         WyaDqXCuI92cLSpMR3kcqLu9eHAYtjVVRb1rMGfMqJihq2caXj0sVsDQDmFRCoiwDhxu
         aqV+As94nfuobPtFPut9wq2WOOoSf8ezP/VBBr0ycrF5K6aYqXlXTyUGH+wj52R7Lzca
         AjbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZQo5lMo1bJjU37l1GXjJiF93g7etBtaThuGwHcbw7y3e8HijAcHgfi3QlnccWndWPHX2VQ58=@lists.infradead.org
X-Gm-Message-State: AOJu0YzktmimwXyyBKKlOd/KV8DTlo3IpkBhMFiGvNJwVzFTUE24llH6
	GSD96KiKCkRGLs1T9Xe8cBqcZ/h/PWmcJQF556pA2WO24KpBmlqbOxuCqxEW4bihC8JhSsJoszy
	hRoSuZf9HOpacKK0NEH1xZ7B6vCRjtaDajOYmqmS1Foj9g3zWrWzG1odj68DGeoMX
X-Gm-Gg: AY/fxX5QiH7BtFf57Xr1S3xd29Dw313jdPfr6epesi/5eKqveiSPL1dI/COY/vTXoOo
	m1M/auMZ1eUBqbwecXGUg3h30wUnKcJRCb0BgC5k0QqIsYWGBFgopsqVpyqieQxpxTMMIrRc1qG
	5JaNfUMSojqg9I6QI+AszuRfR58MP8bqCCwOCCL6rnc2mpIRriMUufi78UAfDb8Hfk9z/T13zIM
	pAMkrP7xdUl99R4GD9dy7rp44X89hA+h3byOtFSkkdz8YmfW6eKvSqOqPpSUmNtcOif2GIoj0iE
	GHZ7MXoehNYlRr8vRubSj3381FipNuxdm3QP+Vg9eUmWKZO+Qye0ABMxfMDPUu+TfCtOKDFAf8l
	zFgb48aaIi9o9q73LYBnRmJTMbWt8Iwu/Tci3UKkIUBx1BrBjMGdXXb6eVZlK4NYC5fvOafN/VB
	1QJWcAPzP7h/cfs/edBuFgmkM=
X-Received: by 2002:a05:620a:1911:b0:8c5:2032:3766 with SMTP id af79cd13be357-8c6a67099a9mr1629399985a.35.1768842487654;
        Mon, 19 Jan 2026 09:08:07 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8c5:2032:3766 with SMTP id af79cd13be357-8c6a67099a9mr1629394585a.35.1768842487011;
        Mon, 19 Jan 2026 09:08:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790a9sm32661211fa.26.2026.01.19.09.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:08:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 19:07:57 +0200
Subject: [PATCH v3 3/8] wifi: ath10k: snoc: support powering on the device
 via pwrseq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-wcn3990-pwrctl-v3-3-948df19f5ec2@oss.qualcomm.com>
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
In-Reply-To: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4976;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TngkZuAbDr5UJBjPXFExRZzr3EmJY7tCHVrw/IzceiU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbmTtAas0TfVBZ0zgaGJXwyQrA0uQ6KpWcbxdI
 h2osmaT/XeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW5k7QAKCRCLPIo+Aiko
 1ebQB/4o64wgCHd8jSj7Bz3CZ/+62x6a30IZawuIkYO3PivfZEHDbHoczj5oViXOUvo0FK9gpY+
 hykUvnNIU6bNL0iGUB4dDT+U3ZSIsqeNWAy9y3unwzTnNE1liGuOIlDPe2YMe3XPOPjJA8anID5
 JiLUCh+Vh7aQqH2I3JX7iezuUVscpFtGpDkQlxw9c5WofpRfrOFXlcITsLdaLimxyuGFOJC0W+3
 PAhC+dCvGuwkyD3zWsELpogZHWBhSlYHrwMgna5IoUK6nvyudXybtW7Q5/AgckAfHeYTCKpgLdM
 Cnvy2tBNGwS0HxWSaYMQSJbvTeW6EaFkBCb4KOnpwGwGh1XV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: JP-JnCuf-6OrPY4DlHXl677Lsa4hvpBA
X-Authority-Analysis: v=2.4 cv=N40k1m9B c=1 sm=1 tr=0 ts=696e64f9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=s7CvTC462Z5CboN7hzoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE0MyBTYWx0ZWRfX1mWXu4vYHDzF
 xPMkEB/L3ql+EpbVVuTUmhCEpk+vf8JaA5mWqWkRZS/7gQ+2Ig90keG2pSY6o7FRf299Ti9idOk
 jVs4Tgn4H/Xl9hlKZ3rxSmUAMtU9nGTaWvX5hdDL/OJ8V1FUUJl3YV2tSBUx+tF2mDPIrfacUwS
 1Fp6tLOQTFh+yjL1vmuwf6FTCpNNMsXHpgAPyPWh8CcxkyxBv49OoNKUMZAxIhBCHDIb7MHH1wr
 2Ozj2/+wFwt3JgMpuE+LmeXRk1kmY2lYMcbs4W8/zMHwcKeTZ3nryjJY+1KNhreBxc5HUucBIti
 t+Sgr9ZJ9fVzEVZZMQrnCwIiBDlGLWasmptDuqnwJ/+uiQLy/Q6i9Xdh5XPdmxYQH7DAoAhqRaa
 kANSiKJgF8r8cg4T33bu//7/Wa07oG8zfM5tiyKzwVJpXfeMoDm3nIdPZF/PgF20oRMSYVwBpN2
 F0wX3B/yybaLurCefDg==
X-Proofpoint-GUID: JP-JnCuf-6OrPY4DlHXl677Lsa4hvpBA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_090809_594461_8F2C2A4B 
X-CRM114-Status: GOOD (  26.47  )
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 53 ++++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/snoc.h |  3 ++
 2 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index b3f6424c17d3..f72f236fb9eb 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: ISC
 /*
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/bits.h>
@@ -11,6 +12,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc/qcom_rproc.h>
 #include <linux/of_reserved_mem.h>
@@ -1023,10 +1025,14 @@ static int ath10k_hw_power_on(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power on\n");
 
-	ret = regulator_bulk_enable(ar_snoc->num_vregs, ar_snoc->vregs);
+	ret = pwrseq_power_on(ar_snoc->pwrseq);
 	if (ret)
 		return ret;
 
+	ret = regulator_bulk_enable(ar_snoc->num_vregs, ar_snoc->vregs);
+	if (ret)
+		goto pwrseq_off;
+
 	ret = clk_bulk_prepare_enable(ar_snoc->num_clks, ar_snoc->clks);
 	if (ret)
 		goto vreg_off;
@@ -1035,18 +1041,28 @@ static int ath10k_hw_power_on(struct ath10k *ar)
 
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
@@ -1762,7 +1778,38 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
 		goto err_release_resource;
 	}
 
-	ar_snoc->num_vregs = ARRAY_SIZE(ath10k_regulators);
+	/*
+	 * devm_pwrseq_get() can return -EPROBE_DEFER in two cases:
+	 * - it is not supposed to be used
+	 * - it is supposed to be used, but the driver hasn't probed yet.
+	 *
+	 * There is no simple way to distinguish between these two cases, but:
+	 * - if it is not supposed to be used, then regulator_bulk_get() will
+	 *   return all regulators as expected, continuing the probe
+	 * - if it is supposed to be used, but wasn't probed yet, we will get
+	 *   -EPROBE_DEFER from regulator_bulk_get() too.
+	 *
+	 * For backwards compatibility with DTs specifying regulators directly
+	 * rather than using the PMU device, ignore the defer error from
+	 * pwrseq.
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
index d4bce1707696..1ecae34687c2 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.h
+++ b/drivers/net/wireless/ath/ath10k/snoc.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: ISC */
 /*
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _SNOC_H_
@@ -53,6 +54,7 @@ enum ath10k_snoc_flags {
 };
 
 struct clk_bulk_data;
+struct pwrseq_desc;
 struct regulator_bulk_data;
 
 struct ath10k_snoc {
@@ -73,6 +75,7 @@ struct ath10k_snoc {
 	struct ath10k_snoc_ce_irq ce_irqs[CE_COUNT_MAX];
 	struct ath10k_ce ce;
 	struct timer_list rx_post_retry;
+	struct pwrseq_desc *pwrseq;
 	struct regulator_bulk_data *vregs;
 	size_t num_vregs;
 	struct clk_bulk_data *clks;

-- 
2.47.3


