Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EACAC7618D
	for <ath10k@archiver.kernel.org>; Thu,  6 Apr 2023 11:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vDs3CX9dpf32bKu8pMiyiQRkELb/Qw6Wy+HoM51pWU8=; b=RE7WfqbZBHQCUI
	p9y5r6dm60jciNAanNeKrphC3whJykhdJcLznG142FjsrAxNfYWRTawQmke8/q3Pn0yCpgRRLbpzI
	5M2ISVE+3SHnNaeNlY6Jvh7RWacBYykl52MGMX6IJfQZTecQT1huV29SZWKg6bsK3GZRGkUjkAgjX
	ow+oLMRkOxZ4w/jLUpkxLO0hLGqhbRnWfvhrnvwc0PEve5o4d0i2UEYXEz+vUbANZNedSas57L7zc
	yOt+l+cHf0cMngH1FZjeyIA+1dSpTsuruozENKcnHb/k0F2bN48H1OGUXPi9ONhoP3WlPNV8bJGp/
	UAmAxfzUB8CI7KV4OXbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkOBz-007Dql-1S;
	Thu, 06 Apr 2023 11:54:15 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkOBw-007Dp5-1f
	for ath10k@lists.infradead.org;
	Thu, 06 Apr 2023 11:54:14 +0000
Received: by mail-lf1-x12e.google.com with SMTP id k37so50518358lfv.0
        for <ath10k@lists.infradead.org>; Thu, 06 Apr 2023 04:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680782048;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n6l0BLvsSWDtkRz9aUFi9SPl6s8wHflLgsTf9M4sGzY=;
        b=VpRvDS6I2j9ZGNfd6eTalAUFSUsn9koI9Ian09vQPED8vKdvjsCIF5Fu1SWKpkP0bf
         vpz9hDindB4QpEPaPB7QJkB9pQAqatYB4kDNB4lcQiJLLNEKgZNuPKs4Qv5HWwT00tgp
         66PeA2z8H9nOGJdt/NmTJU4jgoEQMEOdCwq7wV3+BAR0HD3v8G9e4RRBhEG2WncZPHed
         1y2Y7NFfBsIqjdGClDAghvkspFg3EgjeviUuNtEz1yH8AH2rr+1Tkybfm0iGFRia1dY5
         kTbiUFYPwyZUY4KYohy+0GETM4nQN2PHQmb8sKFQwedHIf9YAhAe3ft8lw0ME4/+mZWR
         5Whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680782048;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6l0BLvsSWDtkRz9aUFi9SPl6s8wHflLgsTf9M4sGzY=;
        b=QxnUqPix90HH+wsjZVmTqOvvQfq/ottOZ9zJfBNk6Gym4WYqIj6gufGZAlBtuISl1G
         3FeP6aMkFar3reNLnKy4YBgRTiwuIQXodmXelUu9dbLBqON6tiGU76wVCLl/b19AanT+
         ZbaugBXDbzAr6QAjKPkQQwVrq8QdVUip1lrD4m0Bn8hCPuyXfiKYxMAANguJb5PlthV9
         z5flkskDOHTsZf7kDsaucBvXF7BI6/j6WtqTWcXamqiNijYEewY9f1OKpwKdyrl3HUpe
         cq9U2AuS10qMCcXIIDWx+1YQI8YpLdRYbKnazDSHPdhL+UafUKEpZ3tstKny77dY7fWW
         pkdQ==
X-Gm-Message-State: AAQBX9eYMMtXQzlPxXm6BZ/XqSejRqYkK2VnOqMugVbj2U5iQ7aCiFgk
	/Z3aTaOk08ZiDhdP5zE7NsgDMw==
X-Google-Smtp-Source: AKy350Zh6vcE5UnLaiImstkVryfvKxUr33qlr+VPS1jLGGlCPEgbn7sSgvSI9t4ILDdqaqZJoa8+uQ==
X-Received: by 2002:ac2:5d2d:0:b0:4eb:1008:6063 with SMTP id i13-20020ac25d2d000000b004eb10086063mr2220897lfb.55.1680782048531;
        Thu, 06 Apr 2023 04:54:08 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id q27-20020ac246fb000000b004eb2cc16342sm237513lfo.21.2023.04.06.04.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 04:54:08 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/2] ATH10K YAML conversion
Date: Thu, 06 Apr 2023 13:54:03 +0200
Message-Id: <20230406-topic-ath10k_bindings-v2-0-557f884a65d1@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANuyLmQC/4WNWwqDMBBFtyLz3ZQkPrD96j6KlBgTM1QmklhpE
 ffeqRvo57ncw9kgu4Quw7XYILkVM0Zi0KcCbDA0OoEDM2ipS1nJRixxRivMEpR8PnqkAWnM4mJ
 87U1bVrqsgd3eZCf6ZMgGtuk1TTzOyXl8H7F7xxwwLzF9jvaqfuu/zKqEFMp51Spb87W5TUgmx
 XNMI3T7vn8BIrms3tAAAAA=
To: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680782047; l=1344;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=DD6FViUVUcssXUqtTtIT5cucIdZI183Y5KfYcExKX2s=;
 b=LtDRqLSySben0gRtpKCibrMbBVd8LsDQiiPxSGvgNhiosTTH0H+bs8YoXF0yI1n38dZ+Ew9Yv1mG
 tYGUwRCQCOZn8JFNK+Ceen6aJB2g91dOKePIkA+fCR5kochUpC/a
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_045412_556835_2E31BE08 
X-CRM114-Status: UNSURE (   7.13  )
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

v1 -> v2:

Dropped:
- '|' in /description
- /properties/resets/minItems
- Unnecessary level of 'items:' in /properties/ext-fem-name
- reserved-memory in examples
- status in examples
- labels in examples

Added:
- /properties/wifi-firmware/additionalProperties: false
- /properties/wifi-firmware/properties/iommus
- /properties/qcom,coexist-support/enum (and reworded the description)
- wifi-firmware and supplies in the SNoC example

Patch 2 is unchanged, picked up rb.

v1: https://lore.kernel.org/r/20230406-topic-ath10k_bindings-v1-0-1ef181c50236@linaro.org

This is my attempt at (finally) moving ATH10K to YAML.
One inexistent dt property came out as part of that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      dt-bindings: net: Convert ATH10K to YAML
      arm64: dts: qcom: sdm845-polaris: Drop inexistent properties

 .../bindings/net/wireless/qcom,ath10k.txt          | 215 ------------
 .../bindings/net/wireless/qcom,ath10k.yaml         | 359 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |   2 -
 3 files changed, 359 insertions(+), 217 deletions(-)
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
