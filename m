Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA4CC761A6
	for <ath10k@archiver.kernel.org>; Thu,  6 Apr 2023 12:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZSTlPqShaxxoxrZjHWSxf0kGWcn8VTI91jisvFZ2P/o=; b=1c8PKiYbz+wOy0
	qaSGN5ZaAxT4AGZhpbmCLMJZo0RWHE8y0YTIbzsYqqfeaoGQEFdceG9/Rmgru9Tfd4wddJnZQRHB3
	bBxzM4spQ0C8XE6nblCc2Trzmdrej2CHEeqGdnWdo8qHgj/N8YzdP4enPfatQDIHvfKbYKe4DOx1w
	buNw4aLOcGXvtcU5zsUCB7hEnxQ1MALGJqs8xDfwKNx1tfqLn+/i29jiL6+a/CeA81qax0Un/7r13
	zq5zLAb/wn5PwJqA8lwHKlrhk7nwEoVivHNx0j+pxhchNUg1+0IKFLRTokGb976Cj3hXqF0Zba0Zy
	M6szwmwAWUXuPaZjOX3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkP9k-007KwG-2d;
	Thu, 06 Apr 2023 12:56:00 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkP9i-007Ktx-2A
	for ath10k@lists.infradead.org;
	Thu, 06 Apr 2023 12:55:59 +0000
Received: by mail-lf1-x12e.google.com with SMTP id g19so37568510lfr.9
        for <ath10k@lists.infradead.org>; Thu, 06 Apr 2023 05:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680785754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vr7hvDh/glr30Yw4qpt5Kbr2lkI/viKC3PQIzjAY6io=;
        b=uKnjq7nO2hBgKSpX5Y9YkKQayH2KWplyH5jDhXRz+8bLdUOD23xPePP6fjFYIMylj4
         j5fBWQ8C9JIRixBqrvKCoVo3R5XVvAy1X8sdM1U48uqcaTJdSrBXjR6S3TJhnGTZali9
         Cup80wzwtjO/b6DqxM8TG7xvLlt50ecIkv5Biv4o09lLdGotkL7eD/0mNq5Cju884r0G
         gi+mp2iB+lh6wj0BQfMmflLc5pFIGhjhe2kBYy3Via3N7LqoDcGJBGRfkAczPcIVFbYh
         ljZxDiN1B5wN+ab6k/qo5RQ+6TnWW8LrFVt1bJ/jXWhY1a6E3Vk4Z+DR2ho/e7rrqcOG
         hJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680785754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vr7hvDh/glr30Yw4qpt5Kbr2lkI/viKC3PQIzjAY6io=;
        b=2/IEmrqnQ0ZJ/i6Anv5bzVcWuY6/Oygwzt1LTujolXCRAAQ4ZT7JtX9KI9NUJBjHvn
         9Ika9wSzYXxJNu2G09MtVeJxfVyIGGyczGkKAMXcV6tad9TCjYPMUtGK/ZcxS5yyLdkJ
         r5NqLR1i0u71crF8x1kwAWYPuUUbkHml5CqIKYy99cFg8VSQ9j7bzmFf1S1JaWkJVvnN
         RC02DVYYmzlQGg+lCwmBdbD4YUX5/DlQQwigs841X816P2k3fYwiTcyC5fByNbq30j6q
         rHrOQ/JNBoHJL7msr41wXKoh44gRLAuyR89K7HEWfvnQrUgqThN3CREm+PWqv+hTDnne
         Ps+g==
X-Gm-Message-State: AAQBX9ebgVacnFbOIVm+PM10b4WzA004JYRmrf4nPn14vlf15nskhdsK
	L8Mz+4FCtNu1PLqyS33YJbMAaA==
X-Google-Smtp-Source: AKy350bft/u4kYYCqIkqe8piY32mlGiSvRknbxsY+1B9JBEeVwyfVgN1xVSi86A6HZmAakyRWhmIKg==
X-Received: by 2002:a19:750b:0:b0:4dc:4fe2:2aad with SMTP id y11-20020a19750b000000b004dc4fe22aadmr2283288lfe.41.1680785753992;
        Thu, 06 Apr 2023 05:55:53 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id i13-20020a2e864d000000b00295765966d9sm276513ljj.86.2023.04.06.05.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 05:55:53 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 06 Apr 2023 14:55:45 +0200
Subject: [PATCH v3 2/2] arm64: dts: qcom: sdm845-polaris: Drop inexistent
 properties
MIME-Version: 1.0
Message-Id: <20230406-topic-ath10k_bindings-v3-2-00895afc7764@linaro.org>
References: <20230406-topic-ath10k_bindings-v3-0-00895afc7764@linaro.org>
In-Reply-To: <20230406-topic-ath10k_bindings-v3-0-00895afc7764@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680785748; l=826;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=A+cHJo96LANW/mYlLiz68VJ9kDkIsUWUlAaAZ/obM9g=;
 b=Dn5+ES2v+YAAgWafpzt+vz8m0ORlFjVLwi8YEXZDaB29+Q/YoyRu13AvSdzIDc7SZOeaG5v799hP
 oJjyfvzFA9JLz2Pd5IhvJX51acjGRuE09PGriA9TL+RaCaAoJaIP
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_055558_712618_D1AECDAE 
X-CRM114-Status: UNSURE (   7.96  )
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

Drop the qcom,snoc-host-cap-skip-quirk that was never introduced to
solve schema warnings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
index 1b7fdbae6a2b..56f2d855df78 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
@@ -712,7 +712,5 @@ &wifi {
 	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
-
-	qcom,snoc-host-cap-skip-quirk;
 	status = "okay";
 };

-- 
2.40.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
