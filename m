Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2DEC4345F
	for <ath10k@archiver.kernel.org>; Mon, 29 Apr 2024 14:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBy2kmpzdw0iu+shQSoNx7bJmznd+L61sp+luHwDb1k=; b=EDCE0gcYiw/inOut1q8sUeRlY+
	DFbKvtZtppa3HsiDjGBM5d1+5Axn1V1Q4Tcp1T1w1WX3RKJnqfEohGfs/NrjihOznMB0dUfnter+p
	anj3KuOQPlRG5HJ2D1JRiq9LXV+g9ahaMQSLBTH2hN8GqBveF6z8uMGxGAEfU+cqt+v8+LI/AN1oc
	hJCUvjK49MlB0/zOFJqVmrysb2ziePm6iEvduok8kBAdfpqDqaBU8eq7Ll0w0swlFM6gwvh20cXU5
	hm+niY1v5xuKI5FkCHCSb3CYO+uKXY0c4M3TN09m4rFumYjqhate9eNlnizoUhlcy7HYAYIG+DV4X
	Dzj/Vd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RgB-000000034N3-0imF;
	Mon, 29 Apr 2024 14:08:27 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Rg7-000000034Ll-1fQN
	for ath10k@lists.infradead.org;
	Mon, 29 Apr 2024 14:08:25 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2dac77cdf43so57464441fa.2
        for <ath10k@lists.infradead.org>; Mon, 29 Apr 2024 07:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714399701; x=1715004501; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oBy2kmpzdw0iu+shQSoNx7bJmznd+L61sp+luHwDb1k=;
        b=UEIT4JEcac/u3kIhIBDA+eu4dYVS7v320ef4h3pK7roMdaHg/H0z9O+Bx3+3zCxYww
         n2WmYNkISItJRGm1qK1zCeXAei9EwaEIwFIoQ5KyeEqYnl4kc5YvvjyxSUUoeH4/zpFI
         ZgJpH93LYS+TkdVEFvz0Jb4/VafYcrFBA49ghK/COan1cfDwigglm+2ycT8yhyOF2H0T
         jPn7oaYaeGlX9N7Yyhl8FZrcT4SeCyuLyHChnSqQw6OtEh4uOHwqEp698b+x70ILU++j
         AlNQDrBajp6PWjBGajFtDqRfkzeN/NvQ7gdEIHQ2NysRGYvjhh7hayr6WzDkqefHdWmT
         mZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714399701; x=1715004501;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oBy2kmpzdw0iu+shQSoNx7bJmznd+L61sp+luHwDb1k=;
        b=N3jPa0hMYfIEbaRCDTkuUNQdG4zjMUIO1fTwltAkRumvwBcgvf6rt6Dc5MlV86ckXS
         uH4iUi2HDZ0GHNAx5tEMROJffzUVivHyXA/hmaCZZfuKtH6cqmA499+Fx2TP7Q0FT2Oz
         o8OUwhjiLiqAcXIqdEea3mK7bQD/fC/qvLXgBZ2Vtzczd22iSNq0x2hmiTrprkTm5Zko
         jmPWOB7s2B/x5VixKUkxs6DtYxbIyJ1jZp9Vme2OwJu+jNyC5lnEEZ1N1y3JvV0eCYQB
         MjuivYEgMubMtUKMKYPNY8JLwx+/Tx7BRtC/Ce+SW5xwm7hxeJAE3jmUNKmBIXIEoJNw
         BNCw==
X-Forwarded-Encrypted: i=1; AJvYcCVU8laR55J5t7dOv6sn91azJ5Sr6OLKHZnn7sPG76s9esVlQhtAqy5oacAx19urRsRczT6p3yjeQWuxMTZay+v3bQYpGMnPA0k8kA==
X-Gm-Message-State: AOJu0Yy9fLF+tUgRwKz6uGxGCV95Wp7gXem46Yi96Y0uQIMaJSqdxR09
	qJoSHax161C6ENsIuUwRVmge9rqJoL8HxqhcBOPVBEE3xmdA5FBkH6zL3C9syHxSfhvuks2eUyq
	XWw4=
X-Google-Smtp-Source: AGHT+IGx5tX+xy8iJXA69SZQR1U/gQ2YxMQre7YD8YVUOem41NsX4VFYFSkbO1iHvPCmEz4H+9316w==
X-Received: by 2002:a2e:9b41:0:b0:2dc:bf5c:9648 with SMTP id o1-20020a2e9b41000000b002dcbf5c9648mr7245557ljj.19.1714399701145;
        Mon, 29 Apr 2024 07:08:21 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id h1-20020a5d6881000000b0034615862c64sm29585477wru.110.2024.04.29.07.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 07:08:20 -0700 (PDT)
Message-ID: <54ac2295-36b4-49fc-9583-a10db8d9d5d6@freebox.fr>
Date: Mon, 29 Apr 2024 16:04:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/3] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
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
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
Content-Language: en-US
In-Reply-To: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_070823_611261_60ADBB38 
X-CRM114-Status: GOOD (  11.43  )
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

Kalle Valo first suggested setting a bit in firmware-5.bin to trigger
work-around in the driver. However, firmware-5.bin is parsed too late.
So we are stuck with a DT property.

Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index 9b3ef4bc37325..9070a41f7fc07 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -122,6 +122,11 @@ properties:
       Whether to skip executing an SCM call that reassigns the memory
       region ownership.
 
+  qcom,no-msa-ready-indicator:
+    type: boolean
+    description:
+      Don't wait for MSA_READY indicator to complete init.
+
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: State bits used by the AP to signal the WLAN Q6.
-- 
2.34.1


