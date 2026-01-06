Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992E3CD0428
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 01:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toWGAj7SgswRPrjJQFNYvHcUGCLQpi1FqKeAVpzqbvU=; b=4jWr2HloR0uBC6IyLoFW6GuGiK
	hmvh/2ev9e72w72aaZsVtiro5AeGtoJGXW9WAtXOoZYamYgunmYL5r70rrZzeYJRuf5wtULNL8ro4
	8C76+4Bh9x9xTVevSPkXkoLfR64SQJrS3dAi8f6LRpWb65MKAAk5xggne6ulYmMhUfxcRtfnxzBKY
	jdw3YEersZeyQYKouMc20VbX3VecQbfnBSBObM0ZVqUziM0lLChnav4Y6VTFvgra0IgjX3PiP3qcZ
	YN5UZUbPRKZeh80up/0f28b4YuM2csSZnWhqi+r/8YCCCPm/41kZwaLRT+qRU8BuYvOzClOe1KdWU
	pWHzxHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvS0-0000000CHZi-1GGA;
	Tue, 06 Jan 2026 01:01:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvRy-0000000CHYW-2woN
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 01:01:31 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060oMbw2599662
	for <ath10k@lists.infradead.org>; Tue, 6 Jan 2026 01:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	toWGAj7SgswRPrjJQFNYvHcUGCLQpi1FqKeAVpzqbvU=; b=iJND170NW1tlBMQB
	HYoxumSS2BP8uillqDNEGwEiprL8Z7jNmZVPJApMFMAswdb9bJ5/1fFbcpSsYXM8
	Bqsy3M6n1ZGBsDyKJvrS9X2Kmt5VPPKKfi/6jeViftU15HfJ0cycqXdrXQHTw2k1
	KtTh5+2/44vamyxPnAyfJXVhEMmZabVmzQeAi1AdKzkHWnBfF3dYwlXbP2E1N3AU
	s3iVAyZUUpAD45jQieYRy+3SX6KdHNLSizY6ULzhaaCxQ3JaFittHSPyC3v762Fa
	PMw+Yj2Km5cWQ2XIReRVz9EZraWD5CGdVvxEnM9FUuEpnOoTj1Y62B/VSv1+WkqB
	AOazbQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bga8pjern-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 01:01:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c1fa4a1c18so113550085a.3
        for <ath10k@lists.infradead.org>; Mon, 05 Jan 2026 17:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661289; x=1768266089; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toWGAj7SgswRPrjJQFNYvHcUGCLQpi1FqKeAVpzqbvU=;
        b=MI7XXPcJC5quffcMb44yWvFE1cTHPkfeCCXbEMe5jH8waYul8O7oIZI8P61cdnXHxS
         NWE/ThyI2JKiVsqrkw42zXPtSqSayQMQr8GwEQrXANnuWKya3LXjk71g6T+420wbHF+i
         2iGSd3NusYIuZGqwXfSC5OjWFLzHJ5i0LhVOpfxNZXaE7G+tUmIO4m6AY7WMHa/5BQRx
         QwyuFpMyGyx1qrLbGNRX3ZrRtgI/bcah+CBBDU1saiUeCEzY3rTIWLdL5fpJO+AaCUXT
         v92deDckaj9avw42AYYUZhVnSaERjCq5cNwVuT0jKGBTYXClyd+8ILfHGQECKb1dS+rO
         rNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661289; x=1768266089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=toWGAj7SgswRPrjJQFNYvHcUGCLQpi1FqKeAVpzqbvU=;
        b=vGhHVvZAvSs5U+K/vAIAdcvRIw/RQuNLnnJybAL6/L7SP+Ey1s0/1ihvsd3zVARISf
         /X0gJlKlnQL3rl1vJjYLbVSGpqi/2G4p8ivY1JSd8wwCCSE1eJiE2WdWR2R+x6AORAVQ
         pzOzsolDGBGbr5gUMsKSPhsm8TQNgmfuTNq2z92ndOyMGOLJHO9xOM4x19UNfXk6gjDT
         gLY1SZzbgIU5PeCc4f8pPfKn7zyHx/ykzVGDfSPMrzCfoILc1V7b5ow2J2wTeUFlMw1G
         EvE81o1QBCCOaII54tcUkaLeKZIdGuGEC9936trc1NmyhbXkrN1io3G78mZwGGy8Dtd8
         KOFg==
X-Forwarded-Encrypted: i=1; AJvYcCVqGDrE3CWo/jNQ9zzLYfOTTUlRdfRApnMT3Fo2WdhNTL3gsNmcugJ1nxUNUc2BF6WSx3a9gN4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt8SH4HqGmaVkspmC7O2zbpJaDRhHmLh+Gi4cByRaCmsO3CStw
	ABbiQi+8Ku8eCJc2Dl+4rQUXEn9ZsYfrXH+zIIaVMee3AHjZrQKwlsjgXph/a/buCyz2PaHmkEx
	l3jDW8pg+To0hrkRO6/eFbdGxS21Vt/la3/Ekpde33usaeNkdCMsYXbY+XQt6UENI
X-Gm-Gg: AY/fxX6/MCWP5OHJkayp5+tgv/8EnVZSoUlwvtfffVwZnZt5tIbeAXbtYX5M+9hS08w
	1YAygpMExnJLRqjAi9kTmZM2u9IVBoTiFxV6K5yDJdg77cDcECXy0Gyp2Ux6yabB/uN4ygSEU9J
	XD47fWWUqf4kfOIHPWlwcpCPhn2h8+b1hw2cj+oRoXKOnMo/Plwzi01bluCTSEFRj3DvsFGAuiG
	8BEolY3YHxQxomwuciTOHSJhxgN3cTyECCRJYnb6AUm93JVRDOppbxclPnwEjDtBaTD+4kWBt9Q
	l5XT0F0byki/oYf3hJ/U+cBuquAzdRwqcZRzAJ6zLg0S0mwI8XHPedLuB6R/lDx9gWI7PG6jndB
	2XhAKZl9f84grIJZrirQUgR097+9KfybhZWvDUENToWPTJ/YQhh+Ue11FfyF9koLFPmYSCIiPta
	OnBsSAkgUQ15B24yyacyYgeio=
X-Received: by 2002:ac8:7d06:0:b0:4ee:24fc:bea3 with SMTP id d75a77b69052e-4ffa770d84fmr20866301cf.35.1767661288623;
        Mon, 05 Jan 2026 17:01:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGRIkm3qB3iAMhjMsr9K7RBdmhsGoeWiJuR1zZQW9HRAWrshi4AJ0+6RJy7rL89ggSBiDVrw==
X-Received: by 2002:ac8:7d06:0:b0:4ee:24fc:bea3 with SMTP id d75a77b69052e-4ffa770d84fmr20865361cf.35.1767661287983;
        Mon, 05 Jan 2026 17:01:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 03:01:14 +0200
Subject: [PATCH v2 04/14] wifi: ath10k: snoc: support powering on the
 device via pwrseq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-wcn3990-pwrctl-v2-4-0386204328be@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4482;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vGKw+wEv4m8AuXcSbM8ug5QUp/CDr75AFUCT++yOsvs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXF7Z98G7nWfKXlYg2gNCIQMwgRzHPZzJbxVnJ
 z1q/ZSkHjaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVxe2QAKCRCLPIo+Aiko
 1fEZB/4tvPMVzx1O9X5hVg4SC8qKvMxE3IAdsH/tCrsqATAl0+wRT2TyB9Hn7GAeWvGOctHu3iH
 Wz1nzZlcEEGfMaeWu5SwWMpltRfuQ30OmP73iSkLDJIyDkaYgNS18F1gFf+O6ny0yTUySKvTrcD
 yyXDgiHMM2btCQT/nwRoSHoTn9L8puSf+qIsWNnwNXcYhQ//We6KROhs35aw/OlL/hwOSrlP/S/
 5HwYUn/Y4mmzJ5Htk1E8M+w9R1szu/pRNZ3IJKY3GuKUB9KSiWfh873JV70NTtpLblRXY42mIM+
 v4EhUqx2idwTvvn1tfM66om+MAtEwG9gtY9dLCdkm/h9l9Pv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfX/YDeDKg6aqP+
 4r8Unn4sQJYIPlOkwEqlK6OgP9Cox7FkZlTiN0rIT+AM4kV3mR5iK5QW06dggQwgDdJKKo0w92L
 kT6ehYpHM9zEdVYMIYIL0LfBcckg8jUpqYDctSP2+A8qgwlWei8mLLIWvQ9ms4Z3pxXMmtlHLH/
 EMzw4mBN6CDPrjXOllTboi9Smb35J9YSLP+m0grudaJADS5DhqMJVMJV8RecmetTDwXgRiwn5Q7
 GTd2Wfe2iwxsvdRZSTDqTRzz3yyPR/raXT8ZoYK3WsUZoB7ZlaH7RRuwLfI8oPOKIP5BvPJ1phE
 +L8Muyi6YZ6ASCkr9tTT+xckqCHE1sUYq77jAbPm+oGTKZ7sUmWVGysIoCwaC1Mztcxb502wo6J
 6OZ1sJj0nsHDKomINVZ5fE6FzhE9Zkin2qMiNCsICFL+z4r6ZWWwxqj3nbZ5D3u7cTaWJWChIXG
 2CcHq/wIM6kDmdjD6tQ==
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=695c5eea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JZG1H6jYz0umZupwJd8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: DhSQQ3-9CqRkDb2pH_EMDqpmndKIp4Hy
X-Proofpoint-GUID: DhSQQ3-9CqRkDb2pH_EMDqpmndKIp4Hy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_170130_758053_57524190 
X-CRM114-Status: GOOD (  24.97  )
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
 drivers/net/wireless/ath/ath10k/snoc.c | 54 ++++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/snoc.h |  2 ++
 2 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index b3f6424c17d3..3600c8eb19a3 100644
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
@@ -1762,7 +1779,38 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
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


