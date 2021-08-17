Return-Path: <SRS0=aPVg=NI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE04C432BE
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:57:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4735660295
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4735660295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ViruOvXOU2wHN+XlehquI9T8VoW+F6zcw1BVvC9Nh9U=; b=TBvWO9gwjbVBi1
	rFn2DpUaImR/xfhuO/31MJI3u4l1C1/M/V5oDxLk+IRRaEWpR73BKKwOF+g+Q3azmr9n32MR/Vbov
	/T3dzAxf3G0vg4DFIwmO/K3+hOxONhy24Db14ISqPoVEl20VEHWlAEphlXPNMe8BNwXedVreRUmFN
	xA6kkSazbK10U4BEwlOMlB/pQyLbkOSgd3FePlg3BfORLKJnCHsN54U5NwT37q38aK1UydTf/iJJE
	aLUJH+gBpWPzNuXUBNyg+DvCb9r4Ipsj+Nx1hjj+BMkd1z5Cbhgu6hv8BCIagmxmvVzxWyHxLVVoz
	OzwLQurjYoVK1X/vmhgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFnPO-000dA4-14; Tue, 17 Aug 2021 00:56:50 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnO0-000cCG-2q
 for ath10k@lists.infradead.org; Tue, 17 Aug 2021 00:55:28 +0000
Received: by mail-lj1-x236.google.com with SMTP id q21so8573373ljj.6
 for <ath10k@lists.infradead.org>; Mon, 16 Aug 2021 17:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OF+bSNrekE/+0wO+D2wfK4wViZM9bqH0gp92GYiunF8=;
 b=cM7uNQKuu5dnPNA/r3uzwOSlkZGPgMBXADPm8THNYFEDMOjOGxMvMjdB3F7ehvUI0P
 jSQA1m7WSHuioIu9NDWPO3OdHn8GAH0tzSEWc8j+mykFH4nrhKP5NzOx5cWlQkMdu0Dc
 RA2uWCHVYIgOAWJ6jR9xFlJUQMdSzdNHIHTvXNti55cFv1as17iQHUl5vsZK8TFY2K61
 exYI8oCWgFFX8pQABZBDMWguDSKljIB0UJPlHFiOj7SGwv6L2gJ6PL3xjWYwtE6FdD5K
 vCdq3wGKZ851VeJQtub1ZdI7Y9d9Uu8uVXKZNBQLtLYE08MNV9fV3CjZzD2ejwh6ZdDx
 m85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OF+bSNrekE/+0wO+D2wfK4wViZM9bqH0gp92GYiunF8=;
 b=V1doPKZaeLtKqlr1lEhCy71EQynr0cLG4FGvE42aR9fiocgzUWxNbn64SiirzPUM8v
 Kz5VJ7jJbFK2mBHcbPzyNk/2FcEnPpqv6AXSdx5Y9H+dcDLR01prMEQ5sTtHooR4rfN1
 8ov2yI+DOFbmg2eG867hCWo597rJXqPI3ByLQmRc4W53cCLquEzsk5H02imdQy1wpITL
 YOR2EcbCRpSkTkHY4b6j40/vDlAuu4WWx4SFe9NNu7Dg3/j2MHfy79VoqsFRHo5AuOIP
 m3ICeGb7JVFZWhVY6gFlvZGClohs3wk1qTQ15HBnalOKWQNuO0EPYMqb9odsSGKuQgpU
 JuoA==
X-Gm-Message-State: AOAM531XtTIp4vJ1thlGM2o/s7SmZTmhPXwoKWnLHCTDxX5iL8cDDu8w
 DGNhS+5ViT+CY+LceNb6NBKKxw==
X-Google-Smtp-Source: ABdhPJxJzCYv9Dq92ptE7pADX3DwMYSV+uy30xcy0SMHC/VUEZ9Cq33n8a04O6lvZVB3SkR+ZA4+Yw==
X-Received: by 2002:a05:651c:1507:: with SMTP id
 e7mr795429ljf.368.1629161722074; 
 Mon, 16 Aug 2021 17:55:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z6sm40719lfb.251.2021.08.16.17.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 17:55:21 -0700 (PDT)
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
Subject: [RFC PATCH 11/15] arm64: dts: qcom: sdm845-db845c: switch bt+wifi to
 qca power sequencer
Date: Tue, 17 Aug 2021 03:55:03 +0300
Message-Id: <20210817005507.1507580-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_175524_252222_8564198E 
X-CRM114-Status: GOOD (  10.53  )
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
index 2d5533dd4ec2..c9b694e934d4 100644
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
+	vddrfa-supply = <&vreg_l17a_1p3>;
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
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
