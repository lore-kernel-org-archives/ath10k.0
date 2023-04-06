Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D474C77B70
	for <ath10k@archiver.kernel.org>; Thu,  6 Apr 2023 12:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yVgWbfpdYKec9FheqyMBC9sB2Y/JrpQKgdhaJ0WJKeA=; b=c+xO2o5QhwPx8E
	sTkRWR8fNjbDp4ms6cwi5P1innfji+7cKb5i9IwTYgLYFoEHxGCWj0EL2WXeiYf1DuruF9k4twWy7
	I8vpjEM3oowK9X9nKGOe8v2MJhEqrTwbxwbcn8+V08hi0YQ1dGfeeWjOcNI4pWjh6vLdqoQZ7u0nw
	5NC3Y9488+BzPWlCS7eS0jsGa/PfO+OmmZLaFwi09JjZw/a5qjKI30ejKrqdRemp5tLQTeT/h0pfu
	R+GAIeqqtvWMWIJiIQEQWRPFyrDZ5muWr3eNAfHYbsq2sxM1i8+RUQy/IQq8tUEUHWJwtbW+4oMaX
	zPsNWc+oHasII8zg7aZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkP9g-007KuB-0A;
	Thu, 06 Apr 2023 12:55:56 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkP9d-007KtI-0O
	for ath10k@lists.infradead.org;
	Thu, 06 Apr 2023 12:55:54 +0000
Received: by mail-lj1-x22d.google.com with SMTP id x20so40583580ljq.9
        for <ath10k@lists.infradead.org>; Thu, 06 Apr 2023 05:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680785750;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MaSH6VKVyllvIVoyulNJHcX5Zf384xhMFQwlL1Td7+E=;
        b=wBrcBeQW24D98uTBGo0EznIAoclKHU1IAdAx6zY8SbvuSxF7gXlCdn7qAL1Fj293ew
         t6dDJAUTDlHKP8YDw4TqyykclcRLZn+5dY/G7JVAgDJb3uNISUGeERl2l2VpColLO33e
         08yUE/E3+8Ijpb3avjmTnjQ2HPIaR3ONP5ZX+DspKQKmJQdBCD7zlGwzvCpsrWx98a7k
         qXOWH44C4j84hPyACXmZbh0ofkdxA4qFHi7UygRagHt3M3hgvVvQ8RcNBqn4ovvc0C5u
         RDz7FYVWHkYwHbROAG48RXjuxKyiy6+wDC3UwzTrbZtsKE3U5QWoLbntn0SKLHT/l6ou
         X01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680785750;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MaSH6VKVyllvIVoyulNJHcX5Zf384xhMFQwlL1Td7+E=;
        b=yVXAHQYSOjK1b/22l28BC1q5WIQjk9ef1c6l4M4WMZGdYUtuvlUT8dt0BfYsXNV7Be
         HZ3janAIGScggX8rlj6EMx/KW/izgpvl1bxpqdHdjt/neQUlOB60NmCy7WgPN91lOlWH
         GRNSnbRu9ZyukEZc0ZtaJK93sX/E8MTd47H8BDenSis0UZOQLX9y6PPFZZsD00oeqoyW
         a2j1OYtuwDfz5rGf6VYb1bnwwabk7LDPkU4WhQH5w9bBQMbWed7kZJntyo2vRox0xIoL
         nY/eKVj5o9rb/bdr3RU8DSTYpZ43nPgZtm6PHim16e2IYTynRF2mWQqm2gf+6qtDCJ97
         V3xg==
X-Gm-Message-State: AAQBX9c5s33oDDsEPxC3Z1cLMwGTEu8MwWlOqwcsfsqMfgjNCeJZgfli
	kVPvnysA3JeADl+p0qCRY6VQDA==
X-Google-Smtp-Source: AKy350Z1qNP61kw9TRZ4XNYACGWroatf156KUNP22OewSG5oObfBOG2l+kpUy85buNwqWEyoITzSog==
X-Received: by 2002:a2e:9001:0:b0:2a1:bcd5:f2ff with SMTP id h1-20020a2e9001000000b002a1bcd5f2ffmr2885913ljg.21.1680785750152;
        Thu, 06 Apr 2023 05:55:50 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id i13-20020a2e864d000000b00295765966d9sm276513ljj.86.2023.04.06.05.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 05:55:49 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 0/2] ATH10K YAML conversion
Date: Thu, 06 Apr 2023 14:55:43 +0200
Message-Id: <20230406-topic-ath10k_bindings-v3-0-00895afc7764@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE/BLmQC/42Nyw7CIBREf8WwFsOj1OrK/zDG3FIoNzbQQCWap
 v8u7c6VLmcyc85MkoloEjnvZhJNxoTBlyD3O6Id+N5Q7EomggnJKlbTKYyoKUyOs8e9Rd+h7xM
 9gVUWGlkJqUj5tpAMbSN47crbP4ehlGM0Fl+b7Hor2WGaQnxv7szX9pcmc8ooN5Y3XKsyrS8De
 ojhEGJPVmQWf2FEwSh1tE1TQa06/oVZluUDESuN/RcBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680785748; l=1681;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9PQjGqgVuPrZuUbC6cUZqXg2lX9Q/iqPOnarm0Ir/U4=;
 b=QbX/IDeOvgPZmPLMuVm3A9jtVdyfC3mGd5j5WoF0iWQmtp0i76rX/IjzRRXkNMrWmz/Wk7/ZVWt/
 iFPFoGnsCmiA5N8Wxs3bp9f9TR7mX9bI4fl2n1CklFsuD4GgybXY
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_055553_162948_67B8232E 
X-CRM114-Status: UNSURE (   8.82  )
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

v2 -> v3:
- Ran dt_binding_check explicitly to uncover an issue with the
  example - I had 2 levels of wifi-firmware{}.. Fixed that..

I hope you folks don't mind me resending so quickly, but it was a
trivial issue. Patch 2 unchanged.

v2: https://lore.kernel.org/r/20230406-topic-ath10k_bindings-v2-0-557f884a65d1@linaro.org

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
