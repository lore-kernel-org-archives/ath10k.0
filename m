Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA1ACD1283
	for <ath10k@archiver.kernel.org>; Thu, 28 Mar 2024 17:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q8/9/ORbkcGjwuLtgTysJpP/mF9hJShjkEPYJiCnwv4=; b=14BgN39FSxTz6npailsAm1CfbR
	5RT5h7W0XT/5mqGlQDeWlrHygUnecLT9DRzYign0qDMDzNfueGECiQcJIDTSvkVddznPZHAuqUa01
	80Cvzm3ghA6dy0JL2OPHSSaxRpeD3lOTFnrrCoeUyzfCStJZihKNTFfvX4UBfwPyQRfXJREINqx5j
	agHSpGuVQnXYxPgddoT8AG52Axt7jFHEzBiEY4vYewtc0fWxUxJfxkafyMaceaCC0n/JakDQmnzWd
	AVMzUcD1xuqCa9TQPf1nr5YJ2tJT/ORaCGcfN7nkMvnGS6KXDC+hjqhkg6xOF4spEyAI3FcIAUu/a
	w1932jqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptj5-0000000F0Gh-2YUB;
	Thu, 28 Mar 2024 17:39:43 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptj2-0000000F0Ev-3Kiy
	for ath10k@lists.infradead.org;
	Thu, 28 Mar 2024 17:39:42 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-414925ba716so7570255e9.2
        for <ath10k@lists.infradead.org>; Thu, 28 Mar 2024 10:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1711647577; x=1712252377; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8/9/ORbkcGjwuLtgTysJpP/mF9hJShjkEPYJiCnwv4=;
        b=jpctGw+ijtkSYgdepterRZEVotX8czTInjB8yOETM89zVpzAXi+0UhKFKrPVtwmbRt
         QGvGWViFRyuiEyAfq4wl15SbE9GWmNEQEY8RnwrgDO90lOmfW+mCzHQOCkvFvGT5Lq+b
         xKhvLholoaArELvqlfsm6J/iYgB7vF2+xKXnSDyxTXg7rRvHh7EY+SPClVlzRuzTKIK3
         S6HA7dkp9TvujEkNrhF/rWycvqre8So0R2+mdI3IKuSjHhr+ZSllJbAXi5b7yT28YBGu
         84KOzgmBMev7kobuXa67pho1ay1L+EhVvR2MBR273qAxSABWReBsUD+MbJdTH4nrUuQr
         miNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711647577; x=1712252377;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q8/9/ORbkcGjwuLtgTysJpP/mF9hJShjkEPYJiCnwv4=;
        b=tdYDZvAhdF2UqpQ33ShnQaj3rfUUyjiuOefjv6WTTcSa5S32TBvy3tlLiGqGObupiw
         0JVMLKjPqL1A6bQ2hbPIIJFrfW2wyBQ35aN31vqQCzDDnpWuqFeUdktRwxSYKXF9MZRM
         u2qtAld8/1VoSRroIFL2kp7zhj8goEWVZnn9E13us3nFAs3xcWM+RM5pluP2MabfVEqP
         cPRzNSTA6i/68+nKf5pCoKy0+P1TBagblyidbGC8QuzfcIx3RZOFQPg3pf5Egl7KfPrH
         IR48Coe/3zaj/LmIDisxsRFGTX2cRaDjTmByNe3aUKUPFLE0l7Kmg7uchNJWASgIwEll
         pCQA==
X-Forwarded-Encrypted: i=1; AJvYcCXieHjVOyzvWhcXEYfWYU3a/pf+2UQH7PH3AvhflokxwnXgZSx9zReTPlCIKNGmkmQKYV6jGfyF/zW3UV7RX+KR4d17rro8myPFTA==
X-Gm-Message-State: AOJu0YyRT1VWONi4lf9v8vHAoXeX9/KA5tr6byBF9roZcggpsK5uhznK
	W5BJfbzlxIUPqjuwF3B1qtXpwhvJ+JIc9MRgdpTsVIWtfu1Oc242U1pqpEz3Ca0=
X-Google-Smtp-Source: AGHT+IGvoMWzHn9okxdnQDLNaRMhHYZ9/nC1JZKhOkus/dY7+YF0Qq7teVla0WlaFLqBT1sV9U3c6A==
X-Received: by 2002:a05:600c:4e8b:b0:414:8d7:8292 with SMTP id f11-20020a05600c4e8b00b0041408d78292mr50222wmq.0.1711647577365;
        Thu, 28 Mar 2024 10:39:37 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c510a00b004148a5e3188sm6066643wms.25.2024.03.28.10.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 10:39:37 -0700 (PDT)
Message-ID: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
Date: Thu, 28 Mar 2024 18:24:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v2 0/3] Work around missing MSA_READY indicator for msm8998
 devices
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
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_103940_890520_16AAB2FF 
X-CRM114-Status: UNSURE (   6.47  )
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

Work around missing MSA_READY indicator in ath10k driver
(apply work-around for all msm8998 devices)

Marc Gonzalez (3):
  dt-bindings: net: wireless: ath10k: add qcom,no-msa-ready-indicator prop
  wifi: ath10k: fake missing MSA_READY indicator
  arm64: dts: qcom: msm8998: set qcom,no-msa-ready-indicator for wifi

 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 8 ++++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi                           | 1 +
 drivers/net/wireless/ath/ath10k/qmi.c                           | 7 +++++++
 drivers/net/wireless/ath/ath10k/qmi.h                           | 1 +
 4 files changed, 17 insertions(+)

