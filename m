Return-Path: <SRS0=aPVg=NI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1469C4338F
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:56:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A5E960E76
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A5E960E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hi0MGV+tLHsDyVslw1JTymIvumi97xmCRWOAnIoPuc=; b=yCwvaxb/D5ARhR
	N7PtYpmcnhXa+zSwwgl5WrANF5BbSPBiVXoBrBCYmBOEGQMO3tWiEz2KWZ6VIKdf3VvuRAAi2x6XK
	n7IyomjZ3HiyPs5/TpLEcWJCUO1u6DeXi/6F7NZ3Vf314V9sJBK+OXiPa8vEUn+QJuZ6fhMIlXYDo
	p5RuOycjV3nBGQzszmTJYtvZxxRfKrvJPvEhMtDZL/Dpzvn7l9+tyRP2DK2h6h8HBUy+XNsgdnxzj
	9uYdDv3kDs7sFroW03FDLj51041hmWs0SG5qL43LuapLAqdxxDdUztaZYJmGQyFqrp1aVPz5R9lAZ
	AY6lONOa5aJty+qJdAAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFnOs-000cnO-9o; Tue, 17 Aug 2021 00:56:18 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnO1-000cD7-JL
 for ath10k@lists.infradead.org; Tue, 17 Aug 2021 00:55:27 +0000
Received: by mail-lj1-x230.google.com with SMTP id h17so30043740ljh.13
 for <ath10k@lists.infradead.org>; Mon, 16 Aug 2021 17:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u12rwXg8g4PJq/ZBmPuac8Qj8YYRwwb7Uj5T/LSY2zo=;
 b=EAAYpRI2iVZDTfCZlb3Xqro7/P2wtZ+jkRMZf1Bmh7AZuZINyv+zBfw/ockT4XoYLT
 QB/cN8F4orqXktrhSOfkliEEResJ0b5pqmxQ62pjSZViPa/GvUh+J3F3jdLlzCMrQQIM
 xHQTiw2dvd3RmKMMmpg1bP25EHiY+NSdxghJmhccESTLR3y+C9/fwa4EXqi7iu9nI/FP
 OCrg6JQtgfr5ilE4Qypv60EKDcw8RS1WESxnJs9KflYa6JFtcIzkXeVXPxktb31oRcch
 UteYQcWAA0Gb2cpQn7rQLebStwfVY9moW4BolAL9a3QqdepGzKAdBMrNAF0UC3z45+BR
 7PXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u12rwXg8g4PJq/ZBmPuac8Qj8YYRwwb7Uj5T/LSY2zo=;
 b=uJnHz/S24k62NAIkQ+ZTA5en4DFd6YhQerYZqzuNbzZZgmIWSYkOjVH/2ubT6KD2Mg
 DdY6IUYwbnLGEMz3wuE2ujR8WtogyG+1TsqI/iUDkrM5Ulm0YOtI89ztOFADF/s4W+NQ
 B/KOl+F886wO83ksHKEzNuOYCg4BRnYvqsc5YwH7YjInoa9x3u7Mj7/glXeXbl6SSUYf
 ZTF5aQ0xZSHamgNOlQ+pazXB/qacaYLnr2fhT+/JkxB2tXnDPaJYrI8AcE0vhpKXVB0+
 0TzEml0yWMMFI5TgBxL2oqCJjR0fGGAU5+vzaql7vCqaTW9WQLuHMlsnuUaqN54PnoRJ
 iFmw==
X-Gm-Message-State: AOAM533NK/EhwhkJQVwtOXS2lfH33CpJalsZBXYsk9F6uUQ8eE0bnbBv
 UK1hZXM/6021+nqk7xhNCIst6w==
X-Google-Smtp-Source: ABdhPJykxVR6EeoPt1Rvlafv3t+KywFGvitTYNxwTI9ilss5IuaqKndgqB3OhVtT7EruboGWfnj6lQ==
X-Received: by 2002:a05:651c:1057:: with SMTP id
 x23mr757286ljm.377.1629161723606; 
 Mon, 16 Aug 2021 17:55:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z6sm40719lfb.251.2021.08.16.17.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 17:55:23 -0700 (PDT)
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
Subject: [RFC PATCH 13/15] arm64: dts: qcom: sdm845-db845c: add second channel
 support to qca power sequencer
Date: Tue, 17 Aug 2021 03:55:05 +0300
Message-Id: <20210817005507.1507580-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_175525_719661_70092CDC 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index c9b694e934d4..3025e5efd556 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -342,6 +342,12 @@ vreg_l21a_2p95: ldo21 {
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
@@ -637,6 +643,7 @@ &qca_pwrseq {
 	vddxo-supply = <&vreg_l7a_1p8>;
 	vddrfa-supply = <&vreg_l17a_1p3>;
 	vddch0-supply = <&vreg_l25a_3p3>;
+	vddch1-supply = <&vreg_l23a_3p3>;
 };
 
 &sdhc_2 {
-- 
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
