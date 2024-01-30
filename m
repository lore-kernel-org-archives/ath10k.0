Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B184C46CD2
	for <ath10k@archiver.kernel.org>; Tue, 30 Jan 2024 16:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkBWOdO+qvsAeOVOitSdzMYitKjft4jo1MuVN9iIs+o=; b=Z1gjMEPqbJkPsh4euhOklaeZrF
	EuM88v13RtX1AAoo2O4Op8hlmr7xwRFmXnA35hAlaH7TOsE/lPirDmvGxSS0tSVHkkvbBScd9PtJh
	R6vsZjk4AOOFc8i1mfkDb0TgHJ+hIB0G0yhNcL2rCLj26kE0N9aIm0WEEQEf27Uzm1pelkb3XazIM
	YODqFOnrqnZvnY7lniqO3eAuMTk6gjVsC4GyBHF9RJFW/sa/Fd6xqqoOzR07wZohYXBAIwmCIaYaT
	JiFMnvKPLKgpd7mX+E5h70/QkBx/vFjY4tZrVQQ+q+V+njadC67txuYkIRRbKbUv7g0lbiP/eULcn
	ztOivKWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUr8J-0000000HPeA-1Ddu;
	Tue, 30 Jan 2024 16:38:47 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUr8E-0000000HPaQ-3Zej
	for ath10k@lists.infradead.org;
	Tue, 30 Jan 2024 16:38:44 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2d04fb2f36bso22311581fa.2
        for <ath10k@lists.infradead.org>; Tue, 30 Jan 2024 08:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706632721; x=1707237521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wkBWOdO+qvsAeOVOitSdzMYitKjft4jo1MuVN9iIs+o=;
        b=FLSb67Oz9QudyrGzO3NS8GFmCnMrR2XEBccPzlZ+tV5E6/R8q9hT6S+ICS0VH1U1a8
         WrPqCR7e06/QS0OMHQ3rOnLt4d2uqC+GfaQMsGYDeifUDm96R68k0HHbWaiWXOOUyPGN
         Bc11QpwD9sV+x6IlA6Yr90GrGmi2KC0mFWOBzBWB6+1TkUfy2PlmjGtf0ll01STVsS5Q
         XvWgebG3yNm0hhXUET3p1q1uXWRyxUZmfRyjm2OLzlwOCSIAKVQrodWbL4wf5jqhtdxi
         n91uO97Zgf4SJ2fFNhgj7+EJIikdyu05xtzrlMWyiChafxOy7uAKolH98JfTi8BSvRWX
         Sj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706632721; x=1707237521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wkBWOdO+qvsAeOVOitSdzMYitKjft4jo1MuVN9iIs+o=;
        b=EGlXUFOk8ViyNdUUhQc31YE7gPLABtpBHssxy+qQOeWU/Zg5AbLaffeQfUJOho+tfr
         c8MGLW8hAvE2vYa/xLa6ImTB2x8qJszkiTn/gKvaOEMXmmuisZj9dtvmh/ajhamZx7v1
         6DXeYDGW7gakAylwOIvVx9iUaJFjMwf4ictPO8U+0naFJEYqX/yE0yLLkYW/nSz/k5KQ
         xScyt3swEXXnl3Vu/bEQYjYHMgubR9Lw0n72+baJqN2O3gU3swXM6/y+h03jrGvRzu+X
         0cGPdBtJ2fppwxQGdX977QmABKjoR+q4R1l/NEynETLPE2Idzj4wy1F28HVXVGpOYKSA
         sksg==
X-Gm-Message-State: AOJu0YxKq021Rf8ztl3BInA8/waRAETzAy2q2YB03aKbPs3dtQde+SCG
	loEeKhdSNh66207DB6QjJV8g0/sR/4We5I4YtldxpkXDdhKSDhJi3OSH1MYoyU8=
X-Google-Smtp-Source: AGHT+IHcR/INXyMQm7cdRP5o+9K7B+ied00nBC4Mz80JeX54GoUA4psIYuBL7binxxZcxZZAfrB9cg==
X-Received: by 2002:a05:651c:b0c:b0:2d0:5fdc:84d1 with SMTP id b12-20020a05651c0b0c00b002d05fdc84d1mr1290249ljr.44.1706632720882;
        Tue, 30 Jan 2024 08:38:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV2tk9lqy3/Osz6GkoXbmkKRKU79W3kyQt7xKU24VjtYesQV8jOsU7nwsvCoKPzTnfJtemTDTwKyr5opJ6cYvMIr/zcy8+VpoQeqJHmNfCHLJRSlnHgA+GwR7xJSgGakIarvma+3zBwAGtHjoFI0jTZTkyOxFxIyG5J5W1n+zkbsxfQcdaJDc4k77OnFdMLWB7c86yVHLY53/LNnNFaeq2zaNjW4GDOFBGoPrfW7uJDYElelKbPlQNOB+3Gy3uUFPXnQn9b6mmE6VZoRVgFdGygNotyYERVw7yo3sHgPNSEfdVRNfxIO0+x+8T75TKsVL9h4GfQlm4PkOZfQMDJxcxr4FMA200BTWCbaJQKQoCbqsQ3N1PUxLeIBdYpjbOELZ7John63NG/0bAxmvoq724tY31KWGQih0fG6o/o+yUmahpp9VAIgy781t9+3bAWelLXKbAKv8vpN3wg0/+x1jTVJXlGaQ4q079jQicyedCTfQ+tjHldfvdK/VM6nDlE2sdvaHkqdF4=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y8-20020a2e9788000000b002d05e8bd84fsm219639lji.31.2024.01.30.08.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 08:38:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 18:38:37 +0200
Subject: [PATCH RFC 1/4] dt-bindings: net: wireless: ath10k: describe
 firmware-name property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-wcn3990-firmware-path-v1-1-826b93202964@linaro.org>
References: <20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org>
In-Reply-To: <20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org>
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
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=joeNalrvSUjxzcfitaywNQDHhfJkpn+IjrWfLA33KYo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluSYOCdILkzqsMfLapfo+/MAwxlC+pnmkooirH
 Yhd8TeS1XKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbkmDgAKCRCLPIo+Aiko
 1V+mCACrGM7TycyL1KFXPHVZL5m0Q5zw/LB7sV5JJ/fmGxdeiew65D+nDORGLxPcRdDJOR9UtdZ
 +8uP8B0Iq+r6cSuLQc38hsyTN2SV6H5565TRaO1s7m1gYHzLCMvpPu/oJZE8UuKkXYT346BEd4d
 6feUydYenZ/v+UiIlewcTPuRwM+bnBJztIV3x2p0fzZ87ZY9AmwZCwQpL+ucGSlJjrTug2Fiw5E
 jYavB1j35o6RGIDo7smxNCutkppRBzjIQt+sTmx1PTWbrs1bM3uOlly0M4Ved/gYHhZmFq/H1Jp
 HfNW/erZEnp92AvTkAYKMrRUMog7HA/HPxSWNkedfa7bMGTj
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_083842_954193_E6DA997A 
X-CRM114-Status: UNSURE (   8.75  )
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

For WCN3990 platforms we need to look for the platform / board specific
firmware-N.mbn file which corresponds to the wlanmdsp.mbn loaded to the
modem DSP via the TQFTPserv. Add firmware-name property describing this
classifier.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index 7758a55dd328..d978d850ce93 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -72,6 +72,12 @@ properties:
       - sky85703-11
       - sky85803
 
+  firmware-name:
+    maxItems: 1
+    description:
+      If present, a board or platform specific string used to lookup firmware
+      files for the device.
+
   wifi-firmware:
     type: object
     additionalProperties: false

-- 
2.39.2


