Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D978C4345F
	for <ath10k@archiver.kernel.org>; Mon, 29 Apr 2024 14:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGP2iA16V5Nst5OwKNnVBbqTeg1qcPV1rwQPISYCkp0=; b=ReG1duJ303SlVEXFC6aQzDIopn
	aHgd1zTjlTc17KR2MVMX69VBm3UdGc6H/1TsJ0hWi4kMTjvTAJE37ZiqJG3NPcTG+OlDq7yA86Kuu
	F58iPFbfirheeeGo4bVeTnlTlD3Z5UcKzra/RGH1B6pttEMFghVx6sFA1NJ3xbM5JwinRbAqEzeBy
	qYoS8P/7gJaPrOZGZdnw72cLsXjbQveqBdPN9vDtyWqq92+lXL4mUc00WOzZPoJ2ES70bMsuBalJ9
	rtXkZnNXydc8ABgjVfaKlsUWIXHw5bk9VXHeElVPVJMmw4Rc7ldlDD1y8WQv265yHjsOI4E/r+UMU
	ElNZbOcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RgE-000000034Oa-3pBP;
	Mon, 29 Apr 2024 14:08:30 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RgB-000000034Lp-0LAT
	for ath10k@lists.infradead.org;
	Mon, 29 Apr 2024 14:08:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3499f1bed15so3219623f8f.1
        for <ath10k@lists.infradead.org>; Mon, 29 Apr 2024 07:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714399702; x=1715004502; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rGP2iA16V5Nst5OwKNnVBbqTeg1qcPV1rwQPISYCkp0=;
        b=mGsSng/vzC6kZUn3zMdsoTSRAAH1iTC5QxIlVUeWacVcDxkw8mRguX5VvJhU6ZMCN3
         XtRfhUKpGDYU438zWXv0KvrSNBdIDAkc+vlO5gjXO8uj/t97iZgdxhUgWV76xNjBlJxQ
         oC7venIOz/WE2EtWIK4MIJ2bXL/aIow5PDhEhB882bzagZgx4M/esduDPIei4BLjLbRC
         sETamqFjRELWRj7TGvS6XkSKO9d1R5EYFoPEKI6/KEOM2/XVzyndWJ1WODQHCGqo1IEZ
         DAOcP503DXhm1UCpUrHGcNOkA8m2DrtYvcf7BrH3D6GS4joggHtV3D7FLMGwSLaISVeQ
         ukXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714399702; x=1715004502;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rGP2iA16V5Nst5OwKNnVBbqTeg1qcPV1rwQPISYCkp0=;
        b=RnS6z5vTWxdWK1fHrso7MK029sk/CWOmoh7G37rw00UvkP391jCdHu3/JdJRl8U7AH
         2XMzXhg1oCUdtoRqwNESsuMBmglVZn0e1bH6zkm/SqWCcsciIcjqaRzwgzbqnp7XKBsS
         /mioQiTFt13y8Bayc6UEMdvA5u9aU2Ho1faA0xmj8lZHpfYz/nM4RS3K3KZCk/Ut/fnn
         sWVtgI8e8PGEOis0ONJj4z7kaNsf+yj9XW3tOKCQJUuffxK7fZzRLTMIffMXl2+9UiZX
         OYnKGrEuK/XTFoLrCIphh8OZ0TvPwFSjA38vAUw5cbFG34aJDcXSpRFaUmR8xNc80QXc
         /idQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKChM2vRFQE3ptDhSC1I6fTMEIaNxrhk59OZiIX6IkbhKEUrXzdpJKqOKOpQD9KToxkEpXr58tR5deNVWdnYgaw9YNJfZL1nz64g==
X-Gm-Message-State: AOJu0YzUL9nCe/rwmTiSjkVyyDBTJkptDPClZfrq3GEvCuKa3tIsWqTE
	TASqFhOGLlngGKkRCArOWWg3JctzOtb3rBWnSLRBj2kEInGWyKwYdWw3Um/20Zo=
X-Google-Smtp-Source: AGHT+IGZQ41fU/EkV4HmK7QBpPzyho5VaflH4h8vksb+XnkyV8QbMyfG8zg8SLKLUmGItkgqlupe+A==
X-Received: by 2002:adf:f3c1:0:b0:343:8bd6:97cf with SMTP id g1-20020adff3c1000000b003438bd697cfmr5372945wrp.35.1714399702664;
        Mon, 29 Apr 2024 07:08:22 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id h1-20020a5d6881000000b0034615862c64sm29585477wru.110.2024.04.29.07.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 07:08:22 -0700 (PDT)
Message-ID: <0914f96e-fcfd-4088-924a-fc1991bce75f@freebox.fr>
Date: Mon, 29 Apr 2024 16:07:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
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
X-CRM114-CacheID: sfid-20240429_070827_160059_D4628688 
X-CRM114-Status: GOOD (  10.24  )
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

cf. also
https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_835_(MSM8998)#WLAN

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 67b8374ddf02f..4e6245095adfc 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3234,6 +3234,7 @@ wifi: wifi@18800000 {
 			iommus = <&anoc2_smmu 0x1900>,
 				 <&anoc2_smmu 0x1901>;
 			qcom,snoc-host-cap-8bit-quirk;
+			qcom,no-msa-ready-indicator;
 		};
 	};
 };
-- 
2.34.1


