Return-Path: <SRS0=aPVg=NI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33DBAC4338F
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:57:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3ED660295
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3ED660295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRSNpR98aEtJwO8OocXnwzID6cZehv44Xayt0ep37Vs=; b=dAxcfc//dZIb9b
	wEjCMqHETqYv3AhI+663et/gwHINch5dBFqyu141hjF34Mo6VViOjR/LOGO2iMBG4qyb+w82lspnN
	McmdIim7Jxvv1HQVjA+HIBL/THluGRkCNHIGL89iTrQGzflxxDpNjlSoc8F5UTpvQDfilgW2pAdku
	6DVyijcYShz/OQO+2hBcanTHLODKIJMKxTva071/QcWsyKpcujQ4efIsLzKl39Zz+SfkrEvvAx+Qi
	fKgroKcwg36qchF1ip2be8fmecMms/Ig8n0zZGhCy7SDypKOuq7Ah8/dd7DakLD3QVHGRqtzBBYoQ
	bb7iuiRgOIOGl4//SScg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFnOz-000ctT-Tb; Tue, 17 Aug 2021 00:56:26 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnO0-000cCc-DN
 for ath10k@lists.infradead.org; Tue, 17 Aug 2021 00:55:27 +0000
Received: by mail-lj1-x22e.google.com with SMTP id n7so30226139ljq.0
 for <ath10k@lists.infradead.org>; Mon, 16 Aug 2021 17:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQt/DuSx0bT+fggEeQl7bKu3DF9WLrIbpvPtKTp1n3Q=;
 b=VDg7sgLR5PvBlQfeFtYC652lbHyUalwcdJFv+rouf/RrFSyuQcjGXyE9RXHErNdVHS
 qYGPxJMlLyv3bB2tVrucSjwatYAWM33+Ey7Ag6Mja6333jByHyjvAysGFQm0eLpXTKY1
 j7onx9jAPSxJPFAWf7O19mkHQD7hHKG7LfJ54Awmii3BXn8dCKMtmqxqbbsW1Vw92h4w
 DCnVwPdgnxImZ/OghvlON0r0uaI126uxDcGek3Qi4Ok8/vHc+eUuIyehPiLU2S8Gmp72
 uzNeiSTkrDgWP1xt4Tuj/8HB5wFcRubflkt8itoTdK/D+V1rV+ha9O3hS2Lf2ZwwE4pf
 vhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQt/DuSx0bT+fggEeQl7bKu3DF9WLrIbpvPtKTp1n3Q=;
 b=dy9wa2AQkXJppDLfTt+VaoYl2kZ/hddQz3mmFvApcdE2VXpMagR3nNZJCVYvXnkuku
 FjKIFwf9gUddlINFTL/Gr1OoUXQEh9iY8veB4+Iry/BzP/ogaAmq6842242Y8bqGQ4OR
 VuCng4S2LGlr+lhvS1TGotodxncxlvnlwgSR+nrRrYA/DCG3++6buwnEcTssYps0nxcA
 sqZI3MRsscVmLMmXH6i6GIPrMHmGyshoPBqPZ/OqcUPbwGnXk19oqSyg1Ub/IKSzWZNv
 GkPSmS5/D8ZI3zGoQrDVaFEy6nFqNp6jzfjHXmOT9k/OPsnDc8wf3eIlCPsw/QevcMJZ
 q+0Q==
X-Gm-Message-State: AOAM532xakx9Cjek8sjft3r/93rG51KEyRNKweeFze8tBJxf/ZT+Bx37
 pjTR6+0AGWOlkNJeGHoqc5LOaQ==
X-Google-Smtp-Source: ABdhPJyNLUS2dwSRaqJ5H76SvBhAQ9S/S789/Y5Oq9VF9A4kizqCDRIBv075Pxe7Gma8nrJ/Cpt1Eg==
X-Received: by 2002:a05:651c:985:: with SMTP id b5mr797712ljq.78.1629161722852; 
 Mon, 16 Aug 2021 17:55:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z6sm40719lfb.251.2021.08.16.17.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 17:55:22 -0700 (PDT)
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
Subject: [RFC PATCH 12/15] arm64: dts: qcom: qrb5165-rb5: add bluetooth support
Date: Tue, 17 Aug 2021 03:55:04 +0300
Message-Id: <20210817005507.1507580-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_175524_530136_374288A4 
X-CRM114-Status: GOOD (  11.13  )
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

Add support for the bluetooth part of the QCA6391 BT+WiFi chip present
on the RB5 board. WiFi is not supported yet, as it requires separate
handling of the PCIe device power.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 8ac96f8e79d4..326330f528fc 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -19,6 +19,7 @@ / {
 
 	aliases {
 		serial0 = &uart12;
+		serial1 = &uart6;
 		sdhc2 = &sdhc_2;
 	};
 
@@ -98,6 +99,25 @@ lt9611_3v3: lt9611-3v3 {
 		regulator-always-on;
 	};
 
+	qca_pwrseq: qca-pwrseq {
+		compatible = "qcom,qca6390-pwrseq";
+
+		#pwrseq-cells = <1>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s2f_0p95>;
+		vddrfa1-supply = <&vreg_s2f_0p95>;
+		vddrfa2-supply = <&vreg_s8c_1p3>;
+		vddrfa3-supply = <&vreg_s5a_1p9>;
+		vddpcie1-supply = <&vreg_s8c_1p3>;
+		vddpcie2-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+		wifi-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 124 GPIO_ACTIVE_HIGH>;
+	};
+
 	thermal-zones {
 		conn-thermal {
 			polling-delay-passive = <0>;
@@ -804,6 +824,26 @@ lt9611_rst_pin: lt9611-rst-pin {
 	};
 };
 
+&qup_uart6_default {
+	ctsrx {
+		pins = "gpio16", "gpio19";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rts {
+		pins = "gpio17";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	tx {
+		pins = "gpio18";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -1193,6 +1233,16 @@ sdc2_card_det_n: sd-card-det-n {
 	};
 };
 
+&uart6 {
+	status = "okay";
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+		clocks = <&sleep_clk>;
+
+		bt-pwrseq = <&qca_pwrseq 1>;
+	};
+};
+
 &uart12 {
 	status = "okay";
 };
-- 
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
