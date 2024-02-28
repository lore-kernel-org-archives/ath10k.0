Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7534AC54E49
	for <ath10k@archiver.kernel.org>; Wed, 28 Feb 2024 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VfMmWTgZMkFzOQ84rBI1O8Mjtlt3aSPIt7WclmK5EyM=; b=F3Ma/ep6+bN4LhLAWMnKaMn3dW
	aVbKmGYvsVGu/CD+D/4D99yI2uaEjQmaUShx+cZCxdujeuvfY8DEnSA1wsoTS+ilsOSiHkCJ1pQoy
	Iv/X9+LqM+BAcNGqTGFGHX3Vp/8jXcVgUtGhDsCNZisPoVw4AKI7JfWEF3gqNgA2ZSAt6YBDOD2lY
	pcHnVoBNGQaXk0TJXk85RBT1A0fx1IGPZgx5se4xd7/pcl4Wqhhjnwdfb+EaCIv0X+F4mBIcJ5gpx
	n/YhoJLTV5juUikUHqIDlPHQP/PONA4xc6wbnlS7dyXq5pBzz3UwiP9pUOLJry0O84bVcZ4BkBoXi
	9bJWjvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJxv-00000009SjU-2gvL;
	Wed, 28 Feb 2024 13:27:19 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJxs-00000009SiL-2WXn
	for ath10k@lists.infradead.org;
	Wed, 28 Feb 2024 13:27:18 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a3122b70439so688612766b.3
        for <ath10k@lists.infradead.org>; Wed, 28 Feb 2024 05:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1709126834; x=1709731634; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfMmWTgZMkFzOQ84rBI1O8Mjtlt3aSPIt7WclmK5EyM=;
        b=jQNz/Lph/8oFaF5qLsp6dZ2J9uywlgrc+//TkfYbIJ8Rpb8kOtYXYFCsqHS2RcdG7h
         JoKjq7wyq8pSJJr7fy64n3Lkdx4umxnJjjZtP3Rs7tDMP2im4DPq4puVUgq0gi5DzrQy
         34pBQ09reARyb2pAIc2Oz/NC0vH/CJ16GyJ2YnboMWx0k4q+kqxVTp4F+MY0gI4V3PFF
         4kXiZCIibZ9O9x51Sj8UspbkLHdr4eSxPvNps0Mwd/brGAbYoKVvs7r6Eu88+Jv5XAw3
         rkxyngVkuJodlqtx2UY1n0DmzoiCxJK351zrEZoYvfK6Jpein8zOJHzaELA9rVbUSqhO
         WZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709126834; x=1709731634;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VfMmWTgZMkFzOQ84rBI1O8Mjtlt3aSPIt7WclmK5EyM=;
        b=SqCRLDUYEhYtPhPpoiJ+TYULi2wjdZuikCdD4x7Qpeah4ScVRB3BM4cw0KxQj5s1zP
         zKBIKKelwGFvvG4oQgHYJURMvDiLFMBNVDTZVG+mlwruX3GlZp6x8+hSc//iZppHyb/4
         Khh0z/RiVHM3+W/t+uGueLyz7msR6OBvPOa+Ovq2boeW2AolheYVXJEzqMWSKhbCwhZL
         eWjJTOxGcu260W9m5wJITNHq6usIGs7E74O8gLlBpBrgJ0Vtwtv0gTvDG1ATXZqy/2eu
         lJcWMabbhwyZD7RyyxNGx5PqCOyM3LhG3XlmMqETFqs/Yz3wkDZnf1YAXIPCa2QGz2u/
         DA9A==
X-Forwarded-Encrypted: i=1; AJvYcCVqBbe5wa0GgBg9mbnnMI7dCgNgK0zmYdYJMOlP8WPyP+GeFzfP5r8FTeJ/0WAhciyu9VMIBLCfMVGdinXv/H/nT8t23K4c2y7raA==
X-Gm-Message-State: AOJu0YwcqNJOonlBkr44uM9l7eH8+5komfWh1j4m9Te0Cn6o12lVoCIv
	yiFPFJrF9cVua2To1ISYLa7StuSpOyWRgxbmPpJB1NLBq/tG4RJe7jwN1D/RNwvcbasDedmpdxt
	LdN0=
X-Google-Smtp-Source: AGHT+IFDAu3EqnpC63S4kTkkbsELa25krrM0BKosxQQt0xC7xm7jBDJI38i+X1Tmt5nQTnzNOCutdA==
X-Received: by 2002:a17:906:4f0a:b0:a44:1be1:66f0 with SMTP id t10-20020a1709064f0a00b00a441be166f0mr348811eju.57.1709126834471;
        Wed, 28 Feb 2024 05:27:14 -0800 (PST)
Received: from ?IPV6:2a02:8428:2a4:1a01:6dfa:263f:dd7e:9456? ([2a02:8428:2a4:1a01:6dfa:263f:dd7e:9456])
        by smtp.gmail.com with ESMTPSA id s6-20020a1709060c0600b00a42e4b5ab00sm1839417ejf.41.2024.02.28.05.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 05:27:14 -0800 (PST)
Message-ID: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
Date: Wed, 28 Feb 2024 14:22:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH 0/2] Work around missing MSA_READY indicator from ath10k FW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_052716_892961_3CD346B8 
X-CRM114-Status: UNSURE (   5.29  )
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

Work around missing MSA_READY indicator from ath10k FW

Marc Gonzalez (1):
  dt-bindings: net: wireless: ath10k: add qcom,no-msa-ready-indicator prop

Pierre-Hugues Husson (1):
  wifi: ath10k: work around missing MSA ready indicator

 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 8 ++++++++
 drivers/net/wireless/ath/ath10k/qmi.c                           | 5 +++++
 drivers/net/wireless/ath/ath10k/qmi.h                           | 1 +
 3 files changed, 14 insertions(+)

-- 
2.34.1

