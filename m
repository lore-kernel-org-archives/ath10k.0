Return-Path: <SRS0=gUy0=NU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8915C4320A
	for <ath10k@archiver.kernel.org>; Sun, 29 Aug 2021 13:14:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8062C60F39
	for <ath10k@archiver.kernel.org>; Sun, 29 Aug 2021 13:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8062C60F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ozmMY34Int1NT/0beftCa2h7eAi/Oibvri3e+Q/wdxo=; b=Cb4Cd0ipdE3spO
	cJ8j70t1d7qnLR7Bn1T7HFWYGTpubRMMFrWvOZXWRz/VBZVlwxy6wqckOkOldH+4QlGJpHWEQP9x0
	+zQwfdpLJT43ZHvTueIjNh2lhBiy5oOf4rLJcCHtBFWbGB/UxmBqkgH/6+MGcs80Su7V1tywSTl4t
	2ABGmElYOq+mWgOApz2/CMb6fRioXg48e3KsFjKWix+0UTHbv2tBQQPGi0On8R/z022JtgRdlxF00
	xEnPfPzX8LpvGGPiwjktm/e8xl2XQnAfHsQivbvCWDa4u67+I1funt25dybzxhfpWeA0GmjeBIYW+
	sMZ3DWdusCq+3qzdCYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKKcz-00FX2G-8d; Sun, 29 Aug 2021 13:13:37 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKKcg-00FWtl-7p
 for ath10k@lists.infradead.org; Sun, 29 Aug 2021 13:13:24 +0000
Received: by mail-lf1-x12c.google.com with SMTP id x27so25332806lfu.5
 for <ath10k@lists.infradead.org>; Sun, 29 Aug 2021 06:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L38kgQv//emLd4ZPZWGNBDSkLJU2AA0/25feolL0iIY=;
 b=PKOPo4eo6O7r2pbSVyV6dlmRizAKPHv8Gsi1JEwGmBrBuRsuag0tYpek2/JgmUOwQI
 eVFwhDETUXPLgR8sqFRnl1Q/NXsfBaalYtozrjVt1zSW4vhaaLwkiOkdqVy7n4hNzstj
 4Kr8V+J00IjPN7i9vl4uwT7qwydvj33nnjbnDXSIVf2runmfYgKiJ5rbl7rGo4kWgT8/
 QARJ+34wCmWZT3/MmpDRYMF8tOsKV8N5bV8r1nh60A0q4JBOwdzpM7PkX0YVIWfwTzIS
 cu/p6/61SkR9cLiDvx36/rJC00sTqlp+HtOapdQaMvI53wVJlbTYPoF/YZz5nllo64ET
 MjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L38kgQv//emLd4ZPZWGNBDSkLJU2AA0/25feolL0iIY=;
 b=V5TKq6QVIL7MlcLCp1aF8tEVi/I1n7eDMRXqtbmKziMicm7HU6Nd+bUv+vziC1fS7h
 UeFZ8DBbJmb1WykutaGCWN2RpYfeWiovfOzkFKHEVflMEEhLxcGD7euP6iJ3CWjv+KGE
 xFKt/0D6dXbPu2xQ6HykXkhkYah4KvDKMLX7Po0zZvJhJ3XGU65J6XVSKYPb11h4T3ba
 AIaJsiiFulgbkqBFCOEba3X/TagPxP2THkatBqrgskEbMFj/27cBFwWYqycxC410Cf7D
 26taPjVCC28ffm1gefj0U2Elv2iR5mAmpyJ8nB2XDjFikbGUxT3K+b5u95HICbU9ei0N
 aUCw==
X-Gm-Message-State: AOAM530moBTTs+xx9l4mLV5vLyg03SK47sctEJWoAxPz8NY8VsjB//AE
 5uvVTDJdyteVV7xp+5VP6qD0UA==
X-Google-Smtp-Source: ABdhPJzdn7I12oW46O5UIXj/wovt7fy2VV2ahAwxWW+a4IFWY/AUt0BBSKGBtjDcX3VqOkSXoXKlaQ==
X-Received: by 2002:ac2:4c41:: with SMTP id o1mr10394337lfk.52.1630242796938; 
 Sun, 29 Aug 2021 06:13:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id x13sm712503lfq.262.2021.08.29.06.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 06:13:16 -0700 (PDT)
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
Subject: [RFC v2 09/13] arm64: dts: qcom: sdm845-db845c: switch bt+wifi to qca
 power sequencer
Date: Sun, 29 Aug 2021 16:13:01 +0300
Message-Id: <20210829131305.534417-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829131305.534417-1-dmitry.baryshkov@linaro.org>
References: <20210829131305.534417-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210829_061318_336221_E02EDB73 
X-CRM114-Status: GOOD (  10.42  )
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
index 0a86fe71a66d..78e889b2c8dd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1051,6 +1051,12 @@ psci {
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
