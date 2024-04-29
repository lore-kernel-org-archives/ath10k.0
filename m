Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBD9C4345F
	for <ath10k@archiver.kernel.org>; Mon, 29 Apr 2024 14:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZgN/Q2xaGtKT6vvkSTDEzO9awo6/5voQRCCnxevwdKQ=; b=shM81h8zeR+d/OBv0rujXh4E1f
	WrI1pncB7BR/D31FVaQjdtNt2iZlmwARuynKeQlc1ukfsIcLvJQTXC+aOFGD3P1Lq43EoCkH0hW/P
	KX8VuVNW/weRNYqh5gWr7jFe56Ucx9cUDtFK4wpi7C2ZXJ+oQjbjVRcWbffXthViulBvDL2UXYc64
	tF+sithyytUS5St6hk2j/yLKYXwLR6RT54U1dbhlPoObot1jSXWzOOPYAur0EJrydPjRJeAN3oqg3
	bZKDOSE5tNFe+atsEMQdtDskm06pHYNpbVrCioHZVn+Qb6HDE5LeRtuL0m5bcvM0T1jdgKTXnX1zB
	RdomRyOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RgA-000000034Ml-1yTY;
	Mon, 29 Apr 2024 14:08:26 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Rg7-000000034Lb-1gU7
	for ath10k@lists.infradead.org;
	Mon, 29 Apr 2024 14:08:25 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-34d05100927so802608f8f.1
        for <ath10k@lists.infradead.org>; Mon, 29 Apr 2024 07:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714399700; x=1715004500; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgN/Q2xaGtKT6vvkSTDEzO9awo6/5voQRCCnxevwdKQ=;
        b=gHKaxHT4qdQWZ8GYaHOk6FCZiS0lvQHOf24nHrFZQ7y93tZGY1hSuKILVTdSYeS5iR
         3+z9ersASAH59M3PlY2CVECuxOOKec87LuokQ8AndnTE0gr39L6EMBC7HK6B/d7jsxP2
         UOwiZLMYrH8jKXDpVfGOfaec7TCTo/w9h8nPakIVE8edbopgY3syvBF47YnFHhxat734
         GdcEr7IFRnSRmL0p3cTIDh7+5xIXCyQ2AYStLLk1exfM3r45w+1ZJR4E0zvKVH1ai/Uk
         1orO/QswD3t67ALfBNd5gOexGpuu+fWZg84EmjkhAvtmnqcw2pFZVDz8kAnReZFsJbvi
         9vrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714399700; x=1715004500;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZgN/Q2xaGtKT6vvkSTDEzO9awo6/5voQRCCnxevwdKQ=;
        b=BY5APd36SUTtIdG6Q2yZYBrpPnsk3G4bXmGNoFcbk5Jxr4RgW3B/p4DVF6vfNZG+l+
         wpnYgNEfZOUMh8z8g6trsnXCIoskqHjBseRHLI2hwsVzWfs6LwOFwhKt9p7JwM7P+Jsj
         1F/TM7Pap5W7wdLhT4TXknfzdy1Wem01JIWCQQj0O73FCsTRIQ+nfANO/o8yoQuR2K0H
         M8n3Txgnpf+ibrOC8QBSWJ59uZwc0z5hLyMhf2gwjRgUsxFvDC/HBmnqXoCpUA9Zljg/
         3o38maRzhapPEJjEO9Tjxn+a6IT/YPf+Sr7/ckTUb+wATtcVMSQf/ugbOUYjuloSNuPu
         RMwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+bhAKg0lLvA1Wu8SCVwrXjyLQEBJOf97Mcixx8Q7GxoDRXxJMxHmux5oqKsJ00xT2F+m8tNilXNViPAvS1tOR7+XAt9+dmdEpDg==
X-Gm-Message-State: AOJu0Yyf53IUsoxcd/oNsW0CSOwxx8itFcQFRagJli9KUzOF2cbHP4kS
	fpD5bHfqLSsFTT7a+oAdO3xFhyZFOMBC97T0aFMSONCQnTIGtWMGERvpMXoBxQY=
X-Google-Smtp-Source: AGHT+IEYOKVhPKai+Fa1uXLnecUJvyvuyl4SsHgSfkU/MZ0kr1joJET/wbdjmxnDeMCyPvAKUbffYw==
X-Received: by 2002:a5d:6306:0:b0:343:efb7:8748 with SMTP id i6-20020a5d6306000000b00343efb78748mr6534087wru.66.1714399700400;
        Mon, 29 Apr 2024 07:08:20 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id h1-20020a5d6881000000b0034615862c64sm29585477wru.110.2024.04.29.07.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 07:08:20 -0700 (PDT)
Message-ID: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
Date: Mon, 29 Apr 2024 16:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v3 0/3] Work around missing MSA_READY indicator for msm8998
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
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_070823_608780_5676B63F 
X-CRM114-Status: UNSURE (   8.35  )
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

CHANGELOG v3
- Add a paragraph in binding commit to explain why we use
  a DT property instead of a firmware feature bit.
- Warn if the "no_msa_ready_indicator" property is true,
  but we actually receive the indicator.

Marc Gonzalez (3):
  dt-bindings: net: wireless: ath10k: add qcom,no-msa-ready-indicator prop
  wifi: ath10k: do not always wait for MSA_READY indicator
  arm64: dts: qcom: msm8998: set qcom,no-msa-ready-indicator for wifi

 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml |  5 +++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi                           |  1 +
 drivers/net/wireless/ath/ath10k/qmi.c                           | 11 +++++++++++
 drivers/net/wireless/ath/ath10k/qmi.h                           |  1 +
 4 files changed, 18 insertions(+)

-- 
2.34.1

