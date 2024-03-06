Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62996C54E49
	for <ath10k@archiver.kernel.org>; Wed,  6 Mar 2024 08:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YkceKDYceYDeQ4XBB8A4mSK+rDJiaduuPabI+Vyi2Q=; b=ur9H0Mznnl54tJiLw9eDzJsB8P
	nppq6QwMprHPTSwLtyXs0fA/IJruX5aqmuhV6dJnNuzse84OZ76wAuYtdt4MWsPM7oD7T0lpcIDHc
	idsaFze0+HY69BlzOM7X1v2H/Q61+z/ZXDfhUZ6OsriYaNt7tTeZLNV0RIYpzbNCgbwrLq5gaZ5hv
	1bN9+gW767i4fQxi6t/ZWuZsPz+DFpwrSDDjYAIGDvCDHAAjM2JB6f+CZC2JWFYdYW4PPftXBzvyY
	6imEWKL23wd06GDYFlWEoGzPTeBwlt1+y/8zrrQFw3CjxXZ6CF0N3f5+yq21H3liADddRZdd2HODG
	muAFwilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmSQ-0000000GqpF-100r;
	Wed, 06 Mar 2024 08:16:58 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmSM-0000000Gqmy-140o
	for ath10k@lists.infradead.org;
	Wed, 06 Mar 2024 08:16:55 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-513173e8191so8272892e87.1
        for <ath10k@lists.infradead.org>; Wed, 06 Mar 2024 00:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709713012; x=1710317812; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YkceKDYceYDeQ4XBB8A4mSK+rDJiaduuPabI+Vyi2Q=;
        b=PXu1FXDdMnVqIdpnuyfL1Nh6pguqby5T0dMNkaGjFu2/sunfD8DlqB6pU3P9HF/p3r
         EDm2kG8+/ZhMKJ/JCJYn1t064i2JdweKaocZ9Su3j/ab2g0faF3d+QqI23tOZxVvPeEs
         XjbPdfANtKUPsHetomriWrFWmokWEW5peOwZurH+sXIPvTrYtS3YtEa9QO/5QbMDgwm3
         vRtJ5RbmOewEmq4AHM9D6Vr7QE4vtfI7tWKHdWdJeOoIlyS9lEYKgAmJIMR7rx51r/qI
         K4HlDXCwEfMmiGhdnU9N22cOYBytCU1QVXO8xQ6t8MGkryn6nFRwlf5xZVVQO/Js+et+
         nTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709713012; x=1710317812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YkceKDYceYDeQ4XBB8A4mSK+rDJiaduuPabI+Vyi2Q=;
        b=JnhlWgFvHI282RLPhTqE3P62JTOpN6P3OB36yFLNqmQuezEmKxwj29qy5ilbxv/fSC
         h3oa1/a6hiXh6WSoFcE0mvsmssknAghQGCxb8wVIIoctWzoHU7kaCuIfgEhdVV1/IzlA
         K7ezO53wil9ZUPy5bkZ/dQLrPWx52yLo9udHDCG7vs1mSyavESFrBv5u/K1JvCpl7RlM
         PCUIGCIsPfMT8wQLCeXahWWlRvNgJr2s3B+XCNggFs1TrPJYJBev6G22IlB2DOQkC1iZ
         s5tgSsnqBaCLxJUzkj1bG7xpBorjpjS8wnJ3pxP0fyfSL4O/ICzjibg7oLj3o7OBlklm
         Yd+Q==
X-Gm-Message-State: AOJu0Ywg/jQKOf+DrxQMyhCcEu9UPfDajgmNwY/V70XUx0Jx/mdyScI5
	nCqSiN5EV6i0V1r/oUF3olQhBO7YFmRxp/WMlEr5NLkq6GsnTn8gMytOYEScbB8=
X-Google-Smtp-Source: AGHT+IF+ClwuDShqfVljL8ffyjGyZsSrmz6wYNutDFQ/n+Qm8+lFOu5G4vbxasQpzp/6IC/gQvAotA==
X-Received: by 2002:a05:6512:48b:b0:513:2047:c9b4 with SMTP id v11-20020a056512048b00b005132047c9b4mr2641290lfq.39.1709713012085;
        Wed, 06 Mar 2024 00:16:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s9-20020ac24649000000b00512dc23bedcsm2162366lfo.99.2024.03.06.00.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 00:16:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 06 Mar 2024 10:16:47 +0200
Subject: [PATCH RFC v2 3/4] arm64: dts: qcom: qrb2210-rb1: add
 firmware-name qualifier to WiFi node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-wcn3990-firmware-path-v2-3-f89e98e71a57@linaro.org>
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
In-Reply-To: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=782;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9uiYDBpJ8s46sR33Y+BMEdKtwAlaQcnmoofd3iM8ghU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6CZv+iVyo1wfbrypxaHKx3SnslwDEkjXP9nVJ
 FnW1xP38nWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZegmbwAKCRCLPIo+Aiko
 1fZdB/9HYHeIyWpnh+TKnqzHb6FoB5f0awNGnVx6mfHM9PJzzMCvJL7aCczg/cRSASw8TIbpjWi
 BiBX9XdC+nMAuMbPm/xbHXq3PF/wFp+ZLR0OyaQGUG914jPkzI2rfdlSb6y+aG+CqjgqqjnUq9/
 gdcEiwmViO18zRvxlC5tbu2wniHhJmWDHgTdKMhFg6q1EHk50P+jBHboDUcJKgH0lrIz1Kolb/V
 BDbUMIShGQMt2tSyQXqKWZ+/aQ2fDTFzhGIqPUp8stbBrYG1gZH5HF45enNZoSMTOsakdsjI/Dr
 iPQ+PxfGxurrtSPUEJ3j3TE+/BRg+5oNwHEL68LHAlRyDAS8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_001654_326237_FBB57E7C 
X-CRM114-Status: UNSURE (   8.12  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Add firmware-name property to the WiFi device tree node to specify
board-specific lookup directory.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 64b2ab286279..338a12f98bfe 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -540,6 +540,7 @@ &wifi {
 	vdd-1.3-rfa-supply = <&pm4125_l10>;
 	vdd-3.3-ch0-supply = <&pm4125_l22>;
 	qcom,ath10k-calibration-variant = "Thundercomm_RB1";
+	firmware-name = "qcm2290";
 	status = "okay";
 };
 

-- 
2.39.2


