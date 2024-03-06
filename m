Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E8CC5475B
	for <ath10k@archiver.kernel.org>; Wed,  6 Mar 2024 08:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUMpyp+aBvT4jutLW9xk5zk3hii55n3wtwwHJLBpTrY=; b=DdbMH/x15KBiKq6z9HAEjo4uk8
	GLTYp4ACMkae1sSuVTVwum0TZiaZvE36psuZDzYDWNYC6FsB9uJviZAJxT90T8fOGtvT0R5l99XLp
	LZUxMB4OZEWlOLeyZWWIgr/4wNEtOofUgeG6jfWBdSuYJ3gwWE42hIuA+L+xWe4SbqIJyt4klgS4v
	l1MJkBBFXezGNV+2rd8SOtHa93FX56L+kp+Lyy/fwIiWv3CV3Xub+YC6dqvl+62PeHw0vy4i+EYtf
	ohEJHXDhDO17T4YPnAW/M9CVtX5n7RPjflaZ8MNg6dW5YhUSf4A5081BOKnShB6oP80rpZgbfthQm
	aByP5nCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmSS-0000000Gqqc-0EaY;
	Wed, 06 Mar 2024 08:17:00 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmSN-0000000GqnM-0yMp
	for ath10k@lists.infradead.org;
	Wed, 06 Mar 2024 08:16:56 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-512bde3d197so595172e87.0
        for <ath10k@lists.infradead.org>; Wed, 06 Mar 2024 00:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709713013; x=1710317813; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUMpyp+aBvT4jutLW9xk5zk3hii55n3wtwwHJLBpTrY=;
        b=tZpHZO2r5QhQesCNmXKwBwWFB4x4opjofRunV5szFjUE8EGCgAEThGT2ho6MysFkn3
         6f410s0RS0jA5hMYNrQdEnd9hG0sQE+0KNRzO0jq/R8HG35FMdU1l/sMFt2IF0bjBIua
         pzCDbB/3GBhhuFOzKHBYOFmFPplkJoguBQ1W8rcOvGp9WdDCtsA23KrsDBc40yS6ATUr
         L28sFpUOxovlnXpUItiVSgJDA01/yt+fLF0RTNu3v/OFRrfkvb2FgZNp5p0dVYKJH6JG
         kQfDoy4Rai3j3fUneJkJhjUBnViMj3uRko64a+YG/T9Np7ujVlB2o7M/y24X1/vKsjc9
         JKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709713013; x=1710317813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUMpyp+aBvT4jutLW9xk5zk3hii55n3wtwwHJLBpTrY=;
        b=XI75HBjeBR6atNcC8kMpb6eEJ9q4r6S++FfW+ycBLWdCQFHIRKNLhvz6Pt7kQaX1Dd
         3BSHpk7HF1KyNvkxXVgXuOs91Pj54PzNGzLqEsIaQVO0fH8kEq7C9vFGlWpHScuymGh5
         BV2T3kDUV5nB29lTwEt0uH5+dy9mbeBdIdIf3bPq7fgmEO3k9KwdvmoK2WZFPHNkCgkB
         Us4iXgA8lJQOIAHqbVkqpskawxGk3a6CXpXp5qNVuPBwv97wdQwcgAyOIx5UjkFnWBDC
         vApMaCOGJ31mzZoYTqn05pgSDmJf0tKHEGSe6uBz+yjyaJ71uEsGFNDc0oALoZLQ6UTx
         Ze7w==
X-Gm-Message-State: AOJu0Yx9Ez+vdVVTU6bDTr7wCKKbiltlWOfF2WlfgLuUOdGBd6P87Sxg
	VZYJodw02vhvgso5vqZQCd5JoY6GjEd7DmFmAHrzs5y9gJsjwAY3BBr4dtR4+5s=
X-Google-Smtp-Source: AGHT+IHbn0SM7E/lVjSCZHRZwzRi0PDead5ffXoCFKJOGbm2VuIzaa+JgNKuc9Hp6zth2I1J6rcUHg==
X-Received: by 2002:ac2:5e64:0:b0:513:4b90:aeaa with SMTP id a4-20020ac25e64000000b005134b90aeaamr2501286lfr.51.1709713013133;
        Wed, 06 Mar 2024 00:16:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s9-20020ac24649000000b00512dc23bedcsm2162366lfo.99.2024.03.06.00.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 00:16:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 06 Mar 2024 10:16:48 +0200
Subject: [PATCH RFC v2 4/4] arm64: dts: qcom: qrb4210-rb1: add
 firmware-name qualifier to WiFi node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-wcn3990-firmware-path-v2-4-f89e98e71a57@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=788;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=IO0G01fjeFoKQavHxljn+OxdA/fMRHWzmgJlyEYmCss=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6CZvOTjBZtoSgh4NQNDNl/WX7IZ1W1x6/faq7
 hbuBSPc+SqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZegmbwAKCRCLPIo+Aiko
 1Ym/B/9ldUzS41jpPNUz625gZyscZqqwqmBt0uegSJU0zgfAndVYwH6MtJnzQoIibGDzAZm2fIH
 tpv7wOX+cp/LpxjYrpgSGgzENGZGSpZCqt3mBNpyOP/ViRa6Sr/LtaiyFIw+0HuXRsTSr8BdtPE
 ZpM613MAZjUpi23Cy+nVIEzjIo7A5i9euFCcr2mYOte34axrup9IpqSR/3L4RRRNhbedY+jQIKA
 KSjMbF1IWUXXEvrxHCp513J/jI6oUqS+UrPM03AsvSCS0NrteHdt/RslRVRHZtscgW6sbrpWo4n
 W+ETw/zQGAvUBdCg3FrWC/RSBr+3wHuXUCJRrf7mQMsYG3GT
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_001655_317321_1E8E8D99 
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
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 7c19f874fa71..cf1d8d6f1546 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -632,6 +632,7 @@ &wifi {
 	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
 	vdd-3.3-ch0-supply = <&vreg_l23a_3p3>;
 	qcom,ath10k-calibration-variant = "Thundercomm_RB2";
+	firmware-name = "qrb4210";
 
 	status = "okay";
 };

-- 
2.39.2


