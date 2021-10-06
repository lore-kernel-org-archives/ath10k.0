Return-Path: <SRS0=0INN=O2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650BBC433FE
	for <ath10k@archiver.kernel.org>; Wed,  6 Oct 2021 03:56:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33ABF6120F
	for <ath10k@archiver.kernel.org>; Wed,  6 Oct 2021 03:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33ABF6120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhAE2t++vipxeYbJwxZTVzrGKwc+Cpk5R1uBaSL77Go=; b=Ab/2jnCAX9x32J
	SVNPWHom7j1ah6zvJXhDfHcRdqedE/BDdMwTMik5x04mQ3t1qNnXVTe3rOwj95hvRRJ/dxcTDAOlK
	piEY+H3esr7GQZ15CZhvL+7No6ARg2e94pWV2jFayTyaC5TbiQo45MdwpRSyl/Q0Bdeept1wVb68Z
	O5nLHJ5ISG0CC2flm+DxY8eYArSiwUx9td9qesBC59xp8zO98aHVKykLYcxBWd19gRYUHtF/qFITI
	FBT/XhtOtS71HSkoz5e2bzNYm9oEhb02uOaFYsHSC3zprKc8iOXaKyNBY6LgxjmsxXCXoe0M/A8gc
	BZ3y5OjaumxDFsTJotSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXy1o-00Cit8-Vc; Wed, 06 Oct 2021 03:55:37 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXy0e-00Ci07-Qp
 for ath10k@lists.infradead.org; Wed, 06 Oct 2021 03:54:26 +0000
Received: by mail-lf1-x130.google.com with SMTP id i4so4605988lfv.4
 for <ath10k@lists.infradead.org>; Tue, 05 Oct 2021 20:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lOnAyrBq8epXVQrN/WDXQeiKNCDBNkNLvVnOhj3ua+A=;
 b=EXdBcPTCi9Pbs0BZua/dU4gI91si5Iub0rrfb+BVmheSvGSqXRSQ1kTj9Kqk/o+YSw
 Sp1PzSb7XxDE6ZWrp4WTBqXtYUK5/iu+ZIPqibNy9cycqyaln2LWVHuzozAYV3rtzlq5
 9JDIe22v3Rl6vzgtu8z/JAtQVwEN+sxrE1TnWj64YrQE2kjXFEYtiB6BN+wWrm+JRh2z
 9/9v8A1FYXQ/r87Ky9Q+TyRfQMzrhSFQ1bsbzanHx72oRBfaCXppxWib6kYzeC6exCA9
 QhKWbm+NHDc5HuI/TPTVgPnlLzD9VM/8PG/YDbKoHhCMtKa7spNdHPUdjZwN94pYp1e4
 Xn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lOnAyrBq8epXVQrN/WDXQeiKNCDBNkNLvVnOhj3ua+A=;
 b=sermjlqxccEhnrXcYJKCh8JmZ03uQe98MxQscz5Cb+O2CQkRA65NSTJisu6YaItD23
 aNEaqMZgB/MVlLala6l7EQYOBD80rC50VFvRsYjjasRw+an4sBhKmQgQn0M379oeLYbk
 KwsHeoXW53kG/NcHGtBXQb4z0HiTKo0PZfuexiuzjN6hsPMtgmbZEDE98E/sUjwiQxDO
 DZOosW3gPQhUN9yoFpiSrwC8GQynajKdHxYN11UDM+MlrNC3SWM7cPy8PQxZ/xS1bLy4
 6lFlTaJxbqb0M+sHBUSwiHUWquBUskLKbATTUwodxgKj7xls7Sb3KluZtItFLXKf4oY4
 ZMWA==
X-Gm-Message-State: AOAM532qULRn5TzqU1vrcXwkquifKHRTIibYu53IcoQ7AEp648/QYEUj
 pFvWtRhS5PdoJhO0n47H13yZYQ==
X-Google-Smtp-Source: ABdhPJytJDOF+lgU658ts6E88pAfppSJZDYauPQN5bzLfv3wFMtv/ZGbgZCMTKCWUMBONI7iO1qyjQ==
X-Received: by 2002:a2e:812:: with SMTP id 18mr26729407lji.497.1633492463509; 
 Tue, 05 Oct 2021 20:54:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s4sm2142967lfd.103.2021.10.05.20.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 20:54:23 -0700 (PDT)
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
Subject: [PATCH v1 13/15] arm64: dts: qcom: sdm845-db845c: add second channel
 to qca power sequencer
Date: Wed,  6 Oct 2021 06:54:05 +0300
Message-Id: <20211006035407.1147909-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_205424_906662_7B475BE1 
X-CRM114-Status: UNSURE (   9.01  )
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

On DB845c board WiFi/BT chip can use both RF channels/antennas, so add
vddch1-supply property.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index a6a34a959a91..0f3214c60980 100644
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
 	vddrf-supply = <&vreg_l17a_1p3>;
 	vddch0-supply = <&vreg_l25a_3p3>;
+	vddch1-supply = <&vreg_l23a_3p3>;
 };
 
 &sdhc_2 {
-- 
2.33.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
