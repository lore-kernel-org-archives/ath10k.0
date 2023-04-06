Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2570C7619A
	for <ath10k@archiver.kernel.org>; Thu,  6 Apr 2023 00:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7DcqSMTIYEP7gt6W8fiXnXOjtolSTMqBTNp+dmalptc=; b=zDA0H/rZg6F39/
	5AzVWfftWOtDc7TUXJQCuLEHO9+i5v5VPoNxSgkI+liDL0u6DHUyyxKiNbBW2QupvKD0Pgg0X3CTo
	RCMpIFSkPbLr8BAMiLBRQkWfxE0M2YAhXpAM2+AWMradZxeblIs5Tlfmv8XSo3UYDMBOGY1wNU/yN
	K0Mw8cFEcQ86qt4B24K0Av5mM7cCmdWG3/Gkq3BdGxtUmpqEG7sSo12wMOkmmKsJFCxgznnTbFqBV
	8sT3c+X/YsMImCj6kNqSFHvDyw7+Jq0T6BPbH4J6IrtYRCX1RnaW9WqAV2ft+9jvQgXOjpH5FGwFh
	nlzx3FApMuEZuXSSBWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkDyd-0060Hf-0h;
	Thu, 06 Apr 2023 00:59:47 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkDya-0060G6-0g
	for ath10k@lists.infradead.org;
	Thu, 06 Apr 2023 00:59:45 +0000
Received: by mail-lf1-x135.google.com with SMTP id k37so48969897lfv.0
        for <ath10k@lists.infradead.org>; Wed, 05 Apr 2023 17:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680742777;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yt4Raa0OR7WXYxLqnylowbsWrZ6nM/R8HDW7bruIHEw=;
        b=D10ncPGBOgRnIMiXNNqC8g6FcuG5XW1ETHr/ppA3OvELqpITLd8QQao3FNum1hsuOJ
         jxhsB9+keRcDSwONGSWAD02jPi+cGbNkg+wIRadu09gXsB2RRXgxfBsUUUbT6Uh+oi/q
         zwyS8E5Oy7or+DuUOMyplI+DNxdLWF3XUckfZmYDdMTaRkOG8JIRXXzC6faJQjcoUNVk
         +Zjz5ak+OEnMRIehFKlGrCnSmWCcSqS/XWdrXL7lhxczgQiOm73CHgU8XAv6cvXUeg/O
         r6uXSnbDGp9w3rNFArKA4QX5suA1+Y7F7MKGrLQqBMVuQq4K2Ets3Ocfb0hlvgVjRPeP
         682g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680742777;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yt4Raa0OR7WXYxLqnylowbsWrZ6nM/R8HDW7bruIHEw=;
        b=nfDxuZ+DQ8dr40IBH1nyfqfeN/xRHJWskPYqR8IlIj7XG40BeNQ5HL38pEA99hRfHX
         HI2lEhc55+MfbIzL9nOyp608/9uAmlhfJeFviSaGtK0LhXQ4ccOTEkiM4dpFR653pM8C
         Y6mQvuXqABTh4FsEdYOAClHKnVEJmbAE7T2/NR2mH8zzs9UFYUEKqX+LHJVvfZjzSpLk
         RgpHsee+OzJhdSYVMVgoxCDrasXFl3iJnkIQ66dZwIrr69ng/7g8BLbFvMmDLVf2+ABl
         lMIIoI/Kzm0pFpsJuieosWBa6j1wblA8XWsrlqUXQlG7MNAMrvS57eTkIJUn13+s2prw
         L3Hg==
X-Gm-Message-State: AAQBX9diXbiRgQJnufRHYYg69Gth4unlobNe1Z6hPUfbUEi4HlzS8x5o
	Ly10lurEzWjf3lwXro5zmLqK2g==
X-Google-Smtp-Source: AKy350bvRQ4xglcKBLR2B3LO2fNEinE6KMqWCgUjt28/qklI1ZlXN0Al/TofHrb2Le93U72r2Do0jw==
X-Received: by 2002:ac2:5a45:0:b0:4e9:9e31:5f70 with SMTP id r5-20020ac25a45000000b004e99e315f70mr1995840lfn.56.1680742777587;
        Wed, 05 Apr 2023 17:59:37 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id v7-20020a197407000000b004b550c26949sm48280lfe.290.2023.04.05.17.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 17:59:37 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] ATH10K YAML conversion
Date: Thu, 06 Apr 2023 02:59:34 +0200
Message-Id: <20230406-topic-ath10k_bindings-v1-0-1ef181c50236@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHYZLmQC/x2N0QqDMAwAf0XyvEJtdWz7lTFGWlMbJlEaNwTx3
 y17vIPjdlAqTAqPZodCP1aepUJ7aSBmlJEMD5XBWedtZ69mnReOBtfc2s87sAwso5o7pj7hzXf
 O91DbgEomFJSYay3faapyKZR4+8+er+M4ATBWI0V8AAAA
To: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680742775; l=762;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=6wHUgDnIplyPhsLs7QHChoA/jlMqdzmIksoJsfliPu4=;
 b=Mg0AbrS53coeHuAmukl/B1WS0JpN+XpwrJVH/ak0bj7Ga6cjjpYcC3NaSYxTe9qwhDt8mFDD2Y5d
 Oe//HZGCBF26Of1Q4PodIBSJd+kb16DmZP5K1lqWFPaGlMN8gVl4
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_175944_256313_7DB0B089 
X-CRM114-Status: UNSURE (   5.66  )
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

This is my attempt at (finally) moving ATH10K to YAML.
One inexistent dt property came out as part of that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      dt-bindings: net: Convert ATH10K to YAML
      arm64: dts: qcom: sdm845-polaris: Drop inexistent properties

 .../bindings/net/wireless/qcom,ath10k.txt          | 215 -------------
 .../bindings/net/wireless/qcom,ath10k.yaml         | 357 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |   2 -
 3 files changed, 357 insertions(+), 217 deletions(-)
---
base-commit: 8417c8f5007bf4567ccffda850a3157c7d905f67
change-id: 20230406-topic-ath10k_bindings-9af5fa834235

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
