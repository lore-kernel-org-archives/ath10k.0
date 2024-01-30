Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7935AC48286
	for <ath10k@archiver.kernel.org>; Tue, 30 Jan 2024 16:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4VJOtIb2gzJ/Ge1sLyWe+9sjQ2zPVQUoV7ZriL+kag=; b=2+YLas8r2WXG1250Qc8yKUteQw
	OybmhUv5qdE7n69bcfWSUzWTYqKTWUu/Y54gUQsDixB7rtrlYdLPiAqfLxQTyks2KswV5J3fv/S+Y
	r72vzhGvWPngJT7QqidSvlisk3W8fOCZCgaUypj3d6HWNN0abj1XqX03MdJ/v/BG2TDHoQr+9SWhF
	CvuR5+5AI7Vsm896fd2vpLwu3wz1DqCXO0rVLnJ7ipmQdiUPfFxKNk4E4GHB9ejJ+nviF0Y67Tpqh
	/J49Itf1j/xSNAVENADTiD6kWV23KQHs8HO2DUg+RGWXFWe1bUUABVSafePM6IJt0p72rpvQwRbvV
	kafKOLKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUr8O-0000000HPh3-3RkZ;
	Tue, 30 Jan 2024 16:38:52 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUr8G-0000000HPb4-0jwq
	for ath10k@lists.infradead.org;
	Tue, 30 Jan 2024 16:38:46 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2cf4d2175b2so39713881fa.0
        for <ath10k@lists.infradead.org>; Tue, 30 Jan 2024 08:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706632722; x=1707237522; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4VJOtIb2gzJ/Ge1sLyWe+9sjQ2zPVQUoV7ZriL+kag=;
        b=sVFLEsCTlCf2c9Wudn4kcP9QscIaSL6FlssHUzNL+t0jvaZpoC+faFQnkQK6xCX4JD
         GaolzQM+Z4HlsXnCdq9WDrQnMu0sizPv1OrswQqxoh0vhKqA3NRprrWF5RflA89mcqB0
         hZj5LlHRyyh6FNtHV87S2Ljn/4u9oWR1wL7Sec+trQS6SZDqwog+EXjAVVN/S/85VgF/
         7ivEfc6NAcw1NcZkkGTkvr+IIuGxig+8Lb5uV5Ytau+q7KhMRLVw/PtSThTBaW6VmpBm
         sOu5uYpHpJg3rivPg77L4Kg1WTK/joEM7AXiITuBR1PjK20bJ/TonjA8z4bVvJyYgqkF
         H5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706632722; x=1707237522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4VJOtIb2gzJ/Ge1sLyWe+9sjQ2zPVQUoV7ZriL+kag=;
        b=OsTH+/BICl9wggrB5eZZNcg7c9bmbHBUWKVLs8m3aGKZlEBdiCfaDoqCMINK1I5ZuR
         DexPnJvn+KrAEwPXChcGjcxifpB3kZC2IKH2s/r3qLcp1Px7DtQL3cl7nwTheW8EyOtU
         RCT0cjCHtCML63n58foiDBnngHPlKIyK3wgHcpFrlne5AhbjKM6V6FkUHWY7ph5Z//Gl
         rXqofpZQkjIu4mnjEQMh+kpZJxkWFEI1VjPZfMPNi3PP5e++9lk2Bc8EDVGrdnscrXO0
         ko6WONoRqcbzUFh2gUmwRx2aC2tLn3LNj2kNJou2ebyHjeV4fFapcqbFN3N/D1/gWDM/
         Ksrg==
X-Gm-Message-State: AOJu0YxP3vAzQ8mY+rPzHXQmQwkiDae4tRp4X1yqOXMUwqOZO/ViTsgq
	OVq8h/mca1ur7QUOE+hW4/6MMvOTUWFlDnzRJHNdcItAcIaufFf6Cv8MnAf2EEQ=
X-Google-Smtp-Source: AGHT+IHJ6kVsOBZJGy19jA7M87XMNLU9GqkAiefdnQnvWehUGH/2YErtZzWclz5F4SKI2QHKE7Eiqg==
X-Received: by 2002:a2e:a404:0:b0:2d0:604d:fda6 with SMTP id p4-20020a2ea404000000b002d0604dfda6mr956534ljn.44.1706632722284;
        Tue, 30 Jan 2024 08:38:42 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUMr96uRImDqWUBlcBNTjPq/VQtrJDOgFWRoK1s8oidK0MV+hqXS6XthXlsJec2TNOTua+n+zZVf7ig+DmJqX3WF/pqKs4qobFn6pm98Qne4R2FWRuPbPaNoLTKOz18liaNHRwMv7Ck3zL7UaeOHn+NGlj4EC7eylq6f4O8/FxNjTnspwhkTUCk2STdgRekxljBmw0ThGYEKY3r/fecZBofYEOjDec979dWq36dorOZnP9VzrYfbCjuDWHNDMiklk3u4+8QKhqhVx3ZS2zcpCg3xSDy6jQPn6RmuSkmR69uFTBxA2LodnBcfxuQCvkrtYgXJCVevO/5l1a6bjIsuAZYKhbCT40XMWl52rmawRmhEo3JifDvs4zQEo0HHmOQZ3iZ2G7vRYPi/6t2ifP3oG/tZ1iMHO+xdL0U6UCBNYPDTIc5iOA5WsbwwZH5324Myh2PpHQM1gl/UxMxJex1SLUHDTdRA+m/7N1SlRFQUNYKR40LuIe9iQzQGMRNIY1nnTuuljKsrqs=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y8-20020a2e9788000000b002d05e8bd84fsm219639lji.31.2024.01.30.08.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 08:38:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 18:38:39 +0200
Subject: [PATCH RFC 3/4] arm64: dts: qcom: qrb2210-rb1: add firmware-name
 qualifier to WiFi node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-wcn3990-firmware-path-v1-3-826b93202964@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=727;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XiFXtXUgBeCWIuqGLN8UNFtmRcIWgYtyn5r3qrXpKIo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluSYPBV7e/wSr8zhiUF2LBnl/ZIFpoBsz42qL9
 C5+SqnQqcGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbkmDwAKCRCLPIo+Aiko
 1XLSB/9E83Xism8LqXSlXFQ6uIos+4MX1UKarwMt7kKvplSaK3TRWd2tLa1oov9G+f1Ovi78lyz
 Qpmxdp3yYxByLMRidFyP5Kwa2+QARD/jllGugCE2IhAdVcdvIpENH3xAEqvyOahzZ2e+ltoRRqm
 PMEVhs+Ov6/1iR1uvDOSDnsJsBWt8mLhIpLtVnfX8XDKGaaZ4MMuuNyR+sKg8VPeqRUhSznG8nL
 d2OFEBUne/HOX1M8Kg0Q8D/DTVc6Stg2g+dcNtLc4xlZQ46vhMRFQmd3esO8Xl1z112ibuUBBir
 UstnwmcIR6Uyk3VvxWXEeWUBpJrT8QFIOJHTx4oLiWp+uB7W
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_083844_368431_EFC0FD38 
X-CRM114-Status: UNSURE (   8.37  )
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


