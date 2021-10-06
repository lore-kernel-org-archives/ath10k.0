Return-Path: <SRS0=0INN=O2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64400C433FE
	for <ath10k@archiver.kernel.org>; Wed,  6 Oct 2021 03:55:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 363636120F
	for <ath10k@archiver.kernel.org>; Wed,  6 Oct 2021 03:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 363636120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5R5UbtYgeqrPAvxrP8v0w2s+pp4bdZAOtBQ4HoeoRRo=; b=4QXf+QFjFRsrXD
	nsDOiNdPy5DIuOh6t0lt1M2PETM3Yraa/+zA9nH1krfQin8bemZiyXFWf/SPjDKyaRbmGl8EPrdju
	wdMtrRC3oZfeHdJJzBcY2AhpXfljfshNEIlsbYFv9IE0zq3QqaBOIOn2nZm/b1U+6RggIFKYGMv+b
	P54eixzq2HVtDDFglbu7Hnkf6EFj7VgEL3l6okDXwLPtoaG0hKGL19hj+Tf6zubYstLOs9lH858Rh
	xksnrzhITXweUaOtHCjWxKKhS+okIGRIgHGpqpsfZynGAIFQjgRoRp+UD21XpYtazjdSNEN7rMnYf
	YO4e8xveHVescduqxMgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXy1V-00CieU-2G; Wed, 06 Oct 2021 03:55:17 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXy0d-00Chyw-Av
 for ath10k@lists.infradead.org; Wed, 06 Oct 2021 03:54:24 +0000
Received: by mail-lf1-x130.google.com with SMTP id b20so4612965lfv.3
 for <ath10k@lists.infradead.org>; Tue, 05 Oct 2021 20:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/yFX2Zi7N+6O7NNekyBMBaaX61kWJ67YZ/rDfO9/pCo=;
 b=wbt/SYeVTpGchHAcroGs65Of1AQiUTTG33akfUx79AzYY7nm6RIYq5RhUXp+c9Jys4
 nXiObPAc9jCzAYIZ1poh6hdKRe+bj0bgMbS88p28gO6wqFmeLTYm4zuoD4+T3MhC6yjW
 ZepDlWf6ARy8vZhxqA1b3B0t0KcRz9417nhNZY94WNepBe4GPa6KVt65f7s9X/t4aZDk
 shoOxtV8sXrBvfORX2E4aaC1h8l1zuhYA8z4UiPS3Eu3WEKvzDt2tSUCWnrG0Jrlo5AG
 Qcx1rElX2rZ8uflS2LqYwzGzlTy4ej8i4J3tGxc/Gc0S07QUgsx8cN9arN3kElLOU6aF
 ypyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/yFX2Zi7N+6O7NNekyBMBaaX61kWJ67YZ/rDfO9/pCo=;
 b=gwR5oVvRLrWXQU4A6O4WYxEFJgzU82de/9MX2pOjhDaQniBz5lQzcGKdrf+eBJb0Un
 5V9MBLbbvJjmkEjTEWBH9UAPsBc/M3d2KriLK+8iLxKkmJwHZMCheHiLcuRY3ROxQY0Z
 GTFKWC3T8KSrRgT9MVlkE3wYDAPeW1yFZRg8hwjLzA/czzF7YQSAgK1iO7ZvnndYR3JM
 PRTBQIimBVvJwt15LIStzvDUBZup8YKnddySdO/or4NDv/eI62wWFRjllgtMfbxEzEVC
 NwoKRh41w8xC+X81mld6u2IwRUCjID8aFpcm3jaWzWGZdDK9xJfLFxLrRxa1CqmxE9fy
 cQ8w==
X-Gm-Message-State: AOAM531s/qZCsNszLYX+Rr9Pb65MHjx3WvUCgqofRsEZMZgl4WhP2L3f
 ajjeK7CMWS5YOjecl5Y/bl4Q8g==
X-Google-Smtp-Source: ABdhPJwT5ag+B+NF1iSiO5FkQOo/yXhp0aFso0y+wwdL536y1fd1PVtCEaOvxXhyUrfGhnEPv5FIjg==
X-Received: by 2002:a05:6512:2341:: with SMTP id
 p1mr7186976lfu.204.1633492461726; 
 Tue, 05 Oct 2021 20:54:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s4sm2142967lfd.103.2021.10.05.20.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 20:54:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v1 11/15] arm64: dts: qcom: sdm845-db845c: switch bt+wifi to
 qca power sequencer
Date: Wed,  6 Oct 2021 06:54:03 +0300
Message-Id: <20211006035407.1147909-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_205423_401633_A7FF749B 
X-CRM114-Status: GOOD (  10.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Switch sdm845-db845c device tree to use new power sequencer driver
rather than separate regulators.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 21 ++++++++++++++-------
 arch/arm64/boot/dts/qcom/sdm845.dtsi       |  6 ++++++
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 2d5533dd4ec2..a6a34a959a91 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -629,6 +629,16 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&qca_pwrseq {
+	status = "okay";
+
+	vddio-supply = <&vreg_s4a_1p8>;
+
+	vddxo-supply = <&vreg_l7a_1p8>;
+	vddrf-supply = <&vreg_l17a_1p3>;
+	vddch0-supply = <&vreg_l25a_3p3>;
+};
+
 &sdhc_2 {
 	status = "okay";
 
@@ -916,10 +926,8 @@ &uart6 {
 	bluetooth {
 		compatible = "qcom,wcn3990-bt";
 
-		vddio-supply = <&vreg_s4a_1p8>;
-		vddxo-supply = <&vreg_l7a_1p8>;
-		vddrf-supply = <&vreg_l17a_1p3>;
-		vddch0-supply = <&vreg_l25a_3p3>;
+		bt-pwrseq = <&qca_pwrseq 1>;
+
 		max-speed = <3200000>;
 	};
 };
@@ -1036,9 +1044,8 @@ &wifi {
 	status = "okay";
 
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
-	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
-	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
-	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+
+	wifi-pwrseq = <&qca_pwrseq 0>;
 
 	qcom,snoc-host-cap-8bit-quirk;
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 6d7172e6f4c3..99117eaf617f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1046,6 +1046,12 @@ psci {
 		method = "smc";
 	};
 
+	qca_pwrseq: qca-pwrseq {
+		compatible = "qcom,wcn3990-pwrseq";
+		#pwrseq-cells = <1>;
+		status = "disabled";
+	};
+
 	soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.33.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
