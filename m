Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C85DC5475B
	for <ath10k@archiver.kernel.org>; Wed,  6 Mar 2024 08:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTS5XY8s/SB49nhKp8RUK1O5fLNMn3hDEEbsJMc9miA=; b=qK86oZ3MuJogvPkKrfb7ERDgNl
	3AGpH0Hxi2JBY/8I3DloyCqv1jnonuXuz5qyH3s4sapqT+ow803HKXmn4VFpHwMsIOAXsNrubWM1a
	2F93e2L8NfrTGNt5VkdyyEFVzjWiQyfezSpve5zpyD3h2kX4ASHn5ti1395wFaFxEcLIrMDS1HlSP
	7/LC2LAL+JzQOeExLO1Nt6NhDt7hcfipZLdQaIgBLcfsz5z99TS3C7YW901Zc0flV5RSWR8yik60t
	pZSPkpJXR7oalFfjQLIq1riOeVvw7Ye+HRbYiIIl6WSlIeoA5+YnCt3o+OxQPgd6QhQtXx8NtXPiO
	RIzpshmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmSO-0000000GqoW-1Xfa;
	Wed, 06 Mar 2024 08:16:56 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmSK-0000000GqmC-0tkg
	for ath10k@lists.infradead.org;
	Wed, 06 Mar 2024 08:16:54 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2d2305589a2so101902211fa.1
        for <ath10k@lists.infradead.org>; Wed, 06 Mar 2024 00:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709713010; x=1710317810; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTS5XY8s/SB49nhKp8RUK1O5fLNMn3hDEEbsJMc9miA=;
        b=sVYTA0v661yI0/6JaMbIWU+Y7KuzrW06AtmR8gfUotn+O7aQTlwx2aAou4fQ+ItKIc
         Vft5Wl6WBOZE59PGgfkbCSnHsritfo9ZW2ybREWzKnW5m8LjFbrNDZ2UpDdHoqB/JacD
         Lm7zwtJXsbHRCjaYPERymoXJ2r7e/vUZhlkeAQe5K9Hbjt4W3+/6pZATiffa4NhBsAGT
         etxkpQbPuhGGb+2+mzLukcKAseDqqFuX9s7WOZaPvZJWJHGp4vIvLFLvKRa6gG5jTGcg
         TREl5OxzSRSbC36RA+inlk8WIyjwb8Oj3zoiQUksZ66ElAOn/GCopWSMIY2zXBYjW+AN
         Xbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709713010; x=1710317810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTS5XY8s/SB49nhKp8RUK1O5fLNMn3hDEEbsJMc9miA=;
        b=PE18xQfsegGUshnlqYXRy+SS9X9vKSiBmWvoxV5JFLhlIOTfcB/gHfkftbmdjelizM
         xLu7rzCoFYCi09rvUnScsms4fIWyl78QTHK2FgZuJuJXOKmRb47ycJGe+OIyvOMnOKvc
         0jIJS8nFRDMNB2dM0TroPOUccGkaqukQBsWlxl3vb10IlBLmJT8qB7bA89GWLl8kBfXc
         RNVggAac5/TesDj4QMIxVKqn6wXoDgdmimoGXdzWysegVNuOToARP3cadNF2bJ8UhxQP
         uZfbmDYbRuVk21qzQOc8aRMz8ZHfy973kUyGZ/NR4kBC04ObKGQJTboGMvzGhv3KFrLm
         fwig==
X-Gm-Message-State: AOJu0YxYjh+LP74Q3+C2yZW+GYHBMhALNHUxL/227ftbesGWeRFDBvsV
	Rdm3Wmug9Wzu+q+IUlCSNbNq3HwApJESvIz72D6ifKnaZQdDwKSH21d9fQnS7s8=
X-Google-Smtp-Source: AGHT+IEgaHSdksPyWwI8qXV0kLecP/kL8C/QFpX5KJwzlk00ddfN+2+dolSWeoST46cRkr7LtXpzUA==
X-Received: by 2002:a19:ae03:0:b0:513:46f1:f9cf with SMTP id f3-20020a19ae03000000b0051346f1f9cfmr2671834lfc.59.1709713010005;
        Wed, 06 Mar 2024 00:16:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s9-20020ac24649000000b00512dc23bedcsm2162366lfo.99.2024.03.06.00.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 00:16:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 06 Mar 2024 10:16:45 +0200
Subject: [PATCH RFC v2 1/4] dt-bindings: net: wireless: ath10k: describe
 firmware-name property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-wcn3990-firmware-path-v2-1-f89e98e71a57@linaro.org>
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
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fe8+GtFdC9olGNH3KClNdX80yaQnD8GK4+UPZdW/CLQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6CZudY3K+ERBgn01quv3X8bd6xQuJWaIyalJA
 c+k4QH2lX+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZegmbgAKCRCLPIo+Aiko
 1anHB/4yzEiv8VSiingmEI1JCac3UkFIWFWh+CZLWXZg7RPJ9Dyc279bV5TL7vQwqmJE1AXGG3n
 7dSo2z8dXpcNlJzouUEfuWljFKbWs7m6JLeZakJ68QXRIJ7iES1n6tDi3OHGmQDu+Vuo+nkTPMt
 bRx5sgWjIc0EjSlY1M6Q+wWHW9F+vIZww+LPJ95CDO50u6M8R8jCSmYAw+Ulr4KJ08jEiXIXpkd
 54VuzZcg0zu8GZCrH5hwTEuXJGO0SKN0KhMDa9NGY8RCi0IM+1h7ZlXZfrNR+eIpepENSVi+k+j
 1/ZDr4pgr4Zqrjzc0MUvNLBgGO2iH9CMQLdr70OJgVmIOGOn
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_001652_334611_1E1ED462 
X-CRM114-Status: UNSURE (   8.50  )
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


