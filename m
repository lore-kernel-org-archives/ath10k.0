Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062BEC47DD9
	for <ath10k@archiver.kernel.org>; Wed, 28 Feb 2024 13:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlBHlzSiEBPWtuxmFn9XxBU1Hq+/oIayqPmB/zamnCU=; b=4QigKArD2YioSxCsJjmnGXIvm+
	OeoCo2QKhdnfaFGFABScsm8zt0JBUPZgBjiLTVxvo+LcwoCkCDx8BKg9UivfyezRL4EMrlFClV5e6
	Fl+aR176NbSYCkokrcdYTESp/WVIAgRhpdoxEApKzfmxEsqHPVKmERRCaaGZ45SgwUvEUNdZOeELs
	oigaBh36p+6kotopgVrGnct5rTg9EEoAIH+HINJO1Xlxe/EVXaQJMkHyxduaL0e3NQjW7BJlmGssb
	fdg3FmTc0Lfc+HX/BSKvwxhkKGFJL/3Xp9iMjh002QHdtBeTl4RGixb2LGFPZzPEB8ka6nqAvr6xn
	cf1KlxIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJxw-00000009Sjg-1WBk;
	Wed, 28 Feb 2024 13:27:20 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJxs-00000009SiW-2WTa
	for ath10k@lists.infradead.org;
	Wed, 28 Feb 2024 13:27:18 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a3fb8b0b7acso682991466b.2
        for <ath10k@lists.infradead.org>; Wed, 28 Feb 2024 05:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1709126835; x=1709731635; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OlBHlzSiEBPWtuxmFn9XxBU1Hq+/oIayqPmB/zamnCU=;
        b=MfrkBWZWhbuBxuuf8Z0mV9HHkfTHIvNSDf9NFSRGtmMLDD/nujtKvXYDiTkMGcZ7YN
         mQm1lwYXqE0aLsrh4VbVhg7Y4E2iEb8iJvi7FMbvDmvRAf+Lv/vZqcyPONd/Lssd1YNG
         u6mtCTC1NMyqRj4p3zxKnXXKlBHkHzFKIOZiqJJrjG6X2NS3EEWUYStPou9V4fiRFa4N
         vz9WAEi7FjXxgxthbkXEO6Q+pGcTlsjRThU03eWRiKz8bfdh0F6ds9wM0daZN9+HWi9i
         Hsd3vEUib0j/GRu2Y0j8KNYe6xzeHqgY0ocPXFZyHhq2WE7RRUtm2II01B12mHVRTxLO
         0qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709126835; x=1709731635;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OlBHlzSiEBPWtuxmFn9XxBU1Hq+/oIayqPmB/zamnCU=;
        b=iutLEYiOvllO3iCjSx+7lWxxJwsVbkU2YHeLskm+h4/CDCHKepsuE92oI9Hqb0lB+H
         z7UyUYmz79G6i4D8zxcGmwxxV7Pfh3dmfa4x5d5kZP+pAVxObHHkox+Ek6n50UXPjbUy
         jYhsXfRy8PWirMsWxnmkFQLG0uMJZVJPS2HsULvWxvc5Jo7ZnXp3PTZx+gL1WR7kcw2g
         yGccNv0M1noqjwKxho4kyhHB79iKmZKnJxNCrYpvmE9UDs+iAW69I7kNEXjxODqMpCyS
         Syd/1CFMeME9fAYz56MmsGAlVfOrz/swrPryg9GrdqLFlUUOkgz6DyHfemWElL5x9TBY
         6gDw==
X-Forwarded-Encrypted: i=1; AJvYcCUycAFekH0MFwdTHB1Z70giNIxepzq/HXqbTH+GxyId/YdYjGQIUSYBQhw8kQr4Zcu5aW7LfyY1LxJlPqwOd34zDgMpajx9DwL3qA==
X-Gm-Message-State: AOJu0YyuEmAIzmt1lDGkqAn8N3FZcVIz8DeRKE2IXb6adyhwOkQkeKpI
	wcFdUlJtc2VAluL4nqU50HpqYWiTrBm5HUYoq6OMob42LoQTIiQJWkCu9/UXdAE=
X-Google-Smtp-Source: AGHT+IF4ieAz5emSpqpP0jXkK0dEP3gJWfciU/k+bcViFKx5CN5o4HyJySr/DIl9xf+wQmFbTG+lzw==
X-Received: by 2002:a17:906:fac5:b0:a43:a7:c67b with SMTP id lu5-20020a170906fac500b00a4300a7c67bmr7566322ejb.28.1709126835143;
        Wed, 28 Feb 2024 05:27:15 -0800 (PST)
Received: from ?IPV6:2a02:8428:2a4:1a01:6dfa:263f:dd7e:9456? ([2a02:8428:2a4:1a01:6dfa:263f:dd7e:9456])
        by smtp.gmail.com with ESMTPSA id s6-20020a1709060c0600b00a42e4b5ab00sm1839417ejf.41.2024.02.28.05.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 05:27:14 -0800 (PST)
Message-ID: <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr>
Date: Wed, 28 Feb 2024 14:24:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
In-Reply-To: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_052716_892961_64BAF111 
X-CRM114-Status: UNSURE (   8.32  )
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

The driver waits for this indicator before proceeding,
yet some WCNSS firmwares apparently do not send it.
On those devices, it seems safe to ignore the indicator,
and continue loading the firmware.

Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index 7758a55dd3286..145fa1a3c1c6a 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -121,6 +121,14 @@ properties:
       Whether to skip executing an SCM call that reassigns the memory
       region ownership.
 
+  qcom,no-msa-ready-indicator:
+    type: boolean
+    description:
+      The driver waits for this indicator before proceeding,
+      yet some WCNSS firmwares apparently do not send it.
+      On those devices, it seems safe to ignore the indicator,
+      and continue loading the firmware.
+
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: State bits used by the AP to signal the WLAN Q6.
-- 
2.34.1


