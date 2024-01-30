Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB6AC47DA9
	for <ath10k@archiver.kernel.org>; Tue, 30 Jan 2024 16:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VpyDXlK61hD1QI31oUeDnUsni8/0Ke03qUlHK7bR94Q=; b=Vki3FEAkprHCKQ
	MQ7QqMw8ydanZOt47fKMClTFdT5zZj31n4cQR7ehxv+a7ZMdnPi3r2+/geOyx2oh4ywhAzSmeUhI2
	JazigKAs6lU9Xd+np6N9o48ZYYTJb6zPND6Xhl6RSmHiqbfpSlLfN4tkiFPFM+VJuysYEE7W6qXH+
	5zeSoQT2DOJxEVKFVvp88LVUM0xR0bxf17Z70WUL0mruUQR923a67vQDO0vp4rlool6OfGWbSBMkd
	5mb3U13HAJNV8tfCbLbsH/+d37VV1WM0eun744Pgc7hwaz4KfsuWdwftDuXgx3yklMClR6MzAxnmX
	KA3Wc5LC+wOy6m8V+Seg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUr8H-0000000HPcR-0DPw;
	Tue, 30 Jan 2024 16:38:45 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUr8D-0000000HPZp-46IN
	for ath10k@lists.infradead.org;
	Tue, 30 Jan 2024 16:38:43 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2cf206e4d56so45868601fa.3
        for <ath10k@lists.infradead.org>; Tue, 30 Jan 2024 08:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706632720; x=1707237520; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VpyDXlK61hD1QI31oUeDnUsni8/0Ke03qUlHK7bR94Q=;
        b=JQSf27lMN2jdFuBzfJWdN+fGMUw5l23QfbNIX7CNWDSr2WXXVuXRjeeG04g60uV0fz
         HEh/Ta0O7srA/IWZ/SsyF8oCK/cwgA6lw3B7dFfghMl74pgA76fxRDRJKoVQRGQcIjja
         3zt1PypUWIuJCUZhjuuRlY2E7qNF5ZXZFHQeXV8THENPqcjx28kWCl+Dbv32H7/1xSTQ
         VQ1PHdXl+88JzLPHISquOp0xk6Ve3+Wb4WQupaEjiSdTKTlSe3oSeMvOIjqkixulJbMs
         +cZ0FDqQY2T1jN2JDSI9qqKc3CBnYd81T5HtaEK1wkXCS3O4J/zr+wYDAfMTjwh4rGtX
         M4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706632720; x=1707237520;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VpyDXlK61hD1QI31oUeDnUsni8/0Ke03qUlHK7bR94Q=;
        b=oa8Firj/zht377Z8SCbg0YGAx1VbtirzTs+i4dhTqqS0Gs6icJ4guUwzxS4KWx+1Mr
         F0i0yLl7L9MqPCdkOvs0shWbCWlDJB6EI72KwfgDzqJJ1g091tbDIYnCpAZcj3wKkutL
         tnn8MhYTo9nCQT6ydQxGaeCYeehVfMXZybkxSQhdqgSCqJdIayklsUstXaK7UPAQSckt
         ubWoJxECkDwAgvh7Qg58WBCmPjCSqgaE+zJ5ZGvaidtCPEpGMLPKBCMSF8Obn8rcQOng
         BB6wRwGPzjHFJfFJhf0pcHLF2DBmv77ob6sXOWbNZ7xWvE1o4GdYiqJIdKAG/xJO77w1
         KhEA==
X-Gm-Message-State: AOJu0Yz47wfAwBxkUnQ7rPrkH5f26OZcX3Rvjw25eoZxRgwL2ZJ91rnd
	3mlF3W9BlDVgDoujA0CI/xiDWXUga7GMMW0pqsqyP7ZQ9RGxL+NEA1r0zL0pb8k=
X-Google-Smtp-Source: AGHT+IE8RruwgdA0nx7lUTOLRYZAuNoIzluFUmMwW0/obCVYUN0QV9PJr1qGD1P3WX3+odbtu5oM2w==
X-Received: by 2002:a2e:a586:0:b0:2cc:6cbf:5cf7 with SMTP id m6-20020a2ea586000000b002cc6cbf5cf7mr7327900ljp.4.1706632720049;
        Tue, 30 Jan 2024 08:38:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVu+mK6Ryz5/VqZRcvSMYr+tdTDVltngYhKuEjayx8IE0yJlp96CDWvIysIgWkInligAuEZZmJA80SEY1XpDgIlrKmUVeGJWh5OTuOcn8qWiP+04deYtw+dytTTVr1NFhhTR2l9St0Gn1wkjisj61/tVbSlHJPmlhdqE3OaiVI7Wbh2m8P1VAeeA44eEoThQ9oMTR6sBYpuKePbaDrB0+IYFrQMP879UPNtLtmAYb0pHTMfIzZNYA3mG11o+uJ42uxGXgu2lLLd3t9kjtf8/hOs9S7wuGhUlt2jjOHbXHWK7Mhe5XrFl+W72TRShtOeWrl9ThE5sgMVbZJZR9s+DMhDqKbvGrJusN1v9qAffBp0uVYzIzpwtO9nIzMlWFF3bUElZrbo7M80X7hzp8JZxMbTzGPUYZ3RHlN4qQZvAp049aEnTHns32caVDfqsSdGzbRjtPBgI2Gx07Mm5qHPeZEiPjhuPXZE+WP74kuSTfRP/PHxm/swq1JdXKnZi1ji+vyhr/SYGAg=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y8-20020a2e9788000000b002d05e8bd84fsm219639lji.31.2024.01.30.08.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 08:38:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC 0/4] wifi: ath10k: support board-specific firmware
 overrides
Date: Tue, 30 Jan 2024 18:38:36 +0200
Message-Id: <20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAwmuWUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDQ2MD3fLkPGNLSwPdtMyi3PLEolTdgsSSDF3zRAPTRIPkNAtDA3MloN6
 CotS0zAqwudFKQW7OSrG1tQAINVu9bAAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1851;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TEQ8jOOdW9C4N7DptJHsfbYzZqm7WAXOuWhzqtkfQ4g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluSYO7h0IJF2XRBtVVaNpejrj5YPDtGDzKL1ng
 gAQs3MfnwCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbkmDgAKCRCLPIo+Aiko
 1RpTCACUEZvuDID4NMQkqH7mn816sf4Yr1B4k8eDltq6lnf/fTK35CVPNEjyL2Kyb+k0jk2AlFP
 50e3rEmqQW6MZtNR4Rw7b99V58k+O0PrFa9dU4KgxPNT9v3/GXCFmkAY14ACjOP4HVdosMbu4hI
 +3+Hrk9wMHO9TXI2lcjKmbw7gNw6nerBRT3pKtadBOr9A9BIKaINBzhQXqv9tZOpbA8vNDOPQ9T
 xB2sOQ9JWGTURgOdRfGFI7AITGnqFjghSBPB4f285X69iqsmwgfYdiZs0Vbwy67uTxGYD4/xJfO
 z5oo1v21xX/SbpkPRtqSKUFdeTtJk/NVUmqQtB04V4lJlJcP
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_083842_104396_66DF3A1D 
X-CRM114-Status: GOOD (  10.12  )
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

On WCN3990 platforms actual firmware, wlanmdsp.mbn, is sideloaded to the
modem DSP via the TQFTPserv. These MBN files are signed by the device
vendor, can only be used with the particular SoC or device.

Unfortunately different firmware versions come with different features.
For example firmware for SDM845 doesn't use single-chan-info-per-channel
feature, while firmware for QRB2210 / QRB4210 requires that feature.

Allow board DT files to override the subdir of the fw dir used to lookup
the firmware-N.bin file decribing corresponding WiFi firmware.
For example, adding firmware-name = "qrb4210" property will make the
driver look for the firmware-N.bin first in ath10k/WCN3990/hw1.0/qrb4210
directory and then fallback to the default ath10k/WCN3990/hw1.0 dir.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (4):
      dt-bindings: net: wireless: ath10k: describe firmware-name property
      wifi: ath10k: support board-specific firmware overrides
      arm64: dts: qcom: qrb2210-rb1: add firmware-name qualifier to WiFi node
      arm64: dts: qcom: qrb4210-rb1: add firmware-name qualifier to WiFi node

 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml         |  6 ++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts                      |  1 +
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts                      |  1 +
 drivers/net/wireless/ath/ath10k/core.c                        | 11 ++++++++++-
 drivers/net/wireless/ath/ath10k/core.h                        |  2 ++
 drivers/net/wireless/ath/ath10k/snoc.c                        |  3 +++
 6 files changed, 23 insertions(+), 1 deletion(-)
---
base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
change-id: 20240130-wcn3990-firmware-path-7a05a0cf8107

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


