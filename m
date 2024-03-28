Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377FDCD1284
	for <ath10k@archiver.kernel.org>; Thu, 28 Mar 2024 17:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+f/pRvSBwUdMhwHshcL4qVDbpYUW3TaHUiQYZdgH3I=; b=cUbop14ZL6OnclIv9PBVE4mzE6
	noF0aAC/0RKAqDbOQSjQpsiwo7pXuJfFbhOJHb5ot6WFakNs2vvpVbHAbCN57AM+fSJ7pwWC8GDSy
	l5VWCojc4Ar7LFxKI0Y89Xmmv0mbKcSKlDaPVO17b+rcuZfKC/SCb31MmBxxMlP509+z8N51orJcC
	TO2hDnIC6g5omCNdTNh3EDAwFbvDrU6nQgebk/3aak5tDMA2f8axrGfYz/Dy4Hrv/rX1pGxdd4Z+k
	+3LvRxYWZlSsys5Z14+gyMNObsAi668A1qY8DoiMbyXwa8H4mzsY8oKLtAJU336wTpsyH9to+9QDs
	zpUBEpUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptj7-0000000F0HF-1JeT;
	Thu, 28 Mar 2024 17:39:45 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptj3-0000000F0F5-0rCL
	for ath10k@lists.infradead.org;
	Thu, 28 Mar 2024 17:39:43 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2d68c6a4630so13001731fa.3
        for <ath10k@lists.infradead.org>; Thu, 28 Mar 2024 10:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1711647578; x=1712252378; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5+f/pRvSBwUdMhwHshcL4qVDbpYUW3TaHUiQYZdgH3I=;
        b=sga1IhiEnQbRR2pjfYyMHMMBq0KYfSLqfm/K5Ncg8ld9Z5WmxF+RwyRmJVRcOZPjDk
         ZMBdMhO1cLJ2vfAsLIXImNflDNX6TzpBi830jvEtDHYAtSNkktf0AAjDb8vDdHGBxrR2
         n+zac8o8vznBXFrPfArTXAh3lgeM66igKygJO6qeWCZfHpepLQ3zV9mhmuLEuq+hQ9Xs
         BqIl5WZgGBDSaJ0kqanw1kRfetW8sZfiXxpEwW6XVkfl/XMB4v96xlJ+wsnV5Xh6B0DW
         uuq5j8cC3fA23xQR08569BTKmS/CdH2yrhSL98hw+pbyC2yXk8dLatRAcvfss7bArRp5
         0ohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711647578; x=1712252378;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5+f/pRvSBwUdMhwHshcL4qVDbpYUW3TaHUiQYZdgH3I=;
        b=EzCwXSGMM/9eMssCcoPQxkRuXeWNXijsCBBSylNke007eebphny4AhQAWzZ2iaW4MI
         /w53fqffD3p/RCwqwJ+E8zbAg9VJxF3QOm59ufHtTra8QVywzsvtk8LkMoB1inMS/7US
         sQJmyrdbISbGksxMfDBMCk5yEVFWaFZBS1mjGD+HCkNIS8lOpMu5jOzkswpNZyPjxqkN
         5/1lZh4c5pKl5mJGqqwbwn4MWR43oIqSItpk2fVUBbLo4AUsB6wB7tyx8AJ7Xn6RNn/H
         o012S5OYSzx/C+18mc1lOQ5K0GV6h8o/g2wabo2gFAxzNLLbhHO7wYQWESXc0ph/teM6
         XF7A==
X-Forwarded-Encrypted: i=1; AJvYcCUTdMIt5nzRIC0UaZGIpdaKJAbAw2YMI0Ck61qXifV8Y9rt6AbtMnM0yeWLbFpyvNUC4bNMxEOj9+hPNA0w9q0sTC86jbTUD9o14Q==
X-Gm-Message-State: AOJu0YwcLe4A9iVfF6GNCXAhJa8rMMmS14Flu3hEh+3OPEsaEsHhPCFU
	wIQPOE2w3+dq33mbmOnF1K/e8NkNz5r6axVRDz+7LVX9c9Ox0QbKaRX3bJh1LSg=
X-Google-Smtp-Source: AGHT+IFQBU18T0uIaawzs7r5eRFygg/fKL4VZsh6uLptoa/iScmPmWB9yGQE9bSbSrdNC/yyfCQCNQ==
X-Received: by 2002:a2e:960e:0:b0:2d6:e0a9:9981 with SMTP id v14-20020a2e960e000000b002d6e0a99981mr2780077ljh.9.1711647578125;
        Thu, 28 Mar 2024 10:39:38 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c510a00b004148a5e3188sm6066643wms.25.2024.03.28.10.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 10:39:37 -0700 (PDT)
Message-ID: <84f20fb5-5d48-419c-8eff-d7044afb81c0@freebox.fr>
Date: Thu, 28 Mar 2024 18:36:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/3] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
In-Reply-To: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_103941_569338_262C5E4E 
X-CRM114-Status: GOOD (  11.57  )
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

The ath10k driver waits for an "MSA_READY" indicator
to complete initialization. If the indicator is not
received, then the device remains unusable.

cf. ath10k_qmi_driver_event_work()

Several msm8998-based devices are affected by this issue.
Oddly, it seems safe to NOT wait for the indicator, and
proceed immediately when QMI_EVENT_SERVER_ARRIVE.

Jeff Johnson wrote:

  The feedback I received was "it might be ok to change all ath10k qmi
  to skip waiting for msa_ready", and it was pointed out that ath11k
  (and ath12k) do not wait for it.

  However with so many deployed devices, "might be ok" isn't a strong
  argument for changing the default behavior.

Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index 9b3ef4bc37325..1680604cd1b7e 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -122,6 +122,13 @@ properties:
       Whether to skip executing an SCM call that reassigns the memory
       region ownership.
 
+  qcom,no-msa-ready-indicator:
+    type: boolean
+    description:
+      The driver waits for an MSA_READY indicator to complete init.
+      If the indicator is not received, interface remains unusable.
+      Pretending we received the indicator works around the issue.
+
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: State bits used by the AP to signal the WLAN Q6.
-- 
2.34.1

