Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DC9CED610
	for <ath10k@archiver.kernel.org>; Wed,  9 Oct 2024 06:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPvYSPUlyNo11D60Rn7xn72ZEXb5uv2wt4zjMOlQ4WE=; b=uw13aZDEleHPBG9lpRdyeOwXRB
	e6QsajAi/aiZT/uOWfl51D/dA9XUlEgDAUheO4kVGXpAfM7wSiArI8A6DXZBGwyq/hfKMEGnkv6v6
	56qYA/t7HzhTsKcHPQ4xUOTvMLLpFRXvFoJCeVq8D8X3kzEDh01HuMe6z1wcT9tKl98yQib2nEHUY
	Jovbz5WskDBYMS1OhReg8xG/elmEqgb3C4AhC46Hur8o+znfZxArVBwr8XfNhS0rN+z7W2wbBApoR
	ubBn2O49Stazegs1Kjed4JRs15PHnREEqRslBLMux05RttDYQukvq+hCtNNKxZ1R5uwXm9aHGuwSM
	rJwz1rjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syQdq-000000089jc-0V8p;
	Wed, 09 Oct 2024 06:57:50 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syQdn-000000089jF-1O5P
	for ath10k@lists.infradead.org;
	Wed, 09 Oct 2024 06:57:48 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9950d27234so448983566b.1
        for <ath10k@lists.infradead.org>; Tue, 08 Oct 2024 23:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728457065; x=1729061865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPvYSPUlyNo11D60Rn7xn72ZEXb5uv2wt4zjMOlQ4WE=;
        b=UoUgWPn6zGfawAiigBDKeSzm1hB9opMjH3BUpGicqwn6y7sgDt7JdA089qRLblZErb
         0tjTV/DoqwPLq14YSshkv4a1BC5t0pLCjamx2Wa1tMX/v4GejUURd3Ycri0qKqlyHj8F
         OZiQQX+eIsiVXWWmKL5eYX0S05nx6G6sJFdQSIv3yHdncqwrAp1ZEW5D7qWXeeXeOp7Y
         9TZfU+6oCSyotDaGj9ZFZ1ePEe3nWFTav9tH8BcMn4dBMnjx8VEBs7cG01Xu2CHainAg
         c2dZv4Vh9VK+fPIpfYTa4dtZL2S4m4vZDprqn6ihkoZTj39AheXydpvxkXrw1Cod5hb8
         1RiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728457065; x=1729061865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPvYSPUlyNo11D60Rn7xn72ZEXb5uv2wt4zjMOlQ4WE=;
        b=qBkh9oE0L5R1ahaxRGOddoco2HFUTeE6doxbZxgXZ4ZXkZoujJ8xqVfSNhmOjlmXgq
         PVCKvCwAxGUKK7fYqatT0XJ8Axz7c3M7HILmEk8zENcYk2xDLaixBuRwhLvwsocWIqNz
         z0DYNHrGiwCDdRTGKXDm/o23MNidYdg73KYhy3hP5KyJecFr1NU3HRnkRKeLWbqz2vxP
         A+0VB8BWQe8y0KPnQiYssvP9wiYDHNVBT/Q/XiKyWR/Wxi3ynsejgCXaxFA98ZjZXPWK
         E3e6GRwPmTDGNOIWUZmnrPWrUFBX+EJpiMa65o5vIrBaUsg8/5FQzLBFCq9AFcx+S/yT
         EIUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7KB2IAVpTKbvp+TNS32kjmzCpsVshRkIBDjRC+i1vEW1hcOgbJQqQgER30ieOgL4y77w6LHA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz69Sk3fnyZHYI0NVoZJ+VIbH8KEElVnRIEgNZU/bxw5OxV28a5
	QEl8EKV1TGnjI/jVA05ziFNTQmmdJ56faPSFkOvagjnGzWcsXZo=
X-Google-Smtp-Source: AGHT+IGzGHI/bUPLoB14IBW6oz/xRDOg6TnvNCvh1TiQvQNTqF6u593L5vc0eIz9x8PT1DHo2OBRLg==
X-Received: by 2002:a17:907:97c7:b0:a99:4e8c:e5c9 with SMTP id a640c23a62f3a-a998d19831bmr114753866b.20.1728457064793;
        Tue, 08 Oct 2024 23:57:44 -0700 (PDT)
Received: from frutis-latitude7490.lan (public-gprs367762.centertel.pl. [37.47.67.211])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a992e5bb275sm622758566b.11.2024.10.08.23.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 23:57:44 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Owoc?= <frut3k7@gmail.com>
To: 
Cc: =?UTF-8?q?Pawe=C5=82=20Owoc?= <frut3k7@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: ath10k: add channel 177 for 5 GHz band
Date: Wed,  9 Oct 2024 08:49:28 +0200
Message-ID: <20241009065051.51143-1-frut3k7@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240801202359.794035-1-frut3k7@gmail.com>
References: <20240801202359.794035-1-frut3k7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_235747_392844_76677109 
X-CRM114-Status: GOOD (  12.73  )
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

Add support for channel 177 (5885 MHz ) for the 5 GHz band.

Tested-on: qca988x hw2.0 firmware ver 10.2.4-1.0-00047

Signed-off-by: Paweł Owoc <frut3k7@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.h | 4 ++--
 drivers/net/wireless/ath/ath10k/mac.c  | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 446dca74f06a..3dff8c028526 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -39,8 +39,8 @@
 #define WMI_READY_TIMEOUT (5 * HZ)
 #define ATH10K_FLUSH_TIMEOUT_HZ (5 * HZ)
 #define ATH10K_CONNECTION_LOSS_HZ (3 * HZ)
-#define ATH10K_NUM_CHANS 41
-#define ATH10K_MAX_5G_CHAN 173
+#define ATH10K_NUM_CHANS 42
+#define ATH10K_MAX_5G_CHAN 177
 
 /* Antenna noise floor */
 #define ATH10K_DEFAULT_NOISE_FLOOR -95
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 646e1737d4c4..cee6a4d287b5 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -9543,6 +9543,7 @@ static const struct ieee80211_channel ath10k_5ghz_channels[] = {
 	CHAN5G(165, 5825, 0),
 	CHAN5G(169, 5845, 0),
 	CHAN5G(173, 5865, 0),
+	CHAN5G(177, 5885, 0),
 	/* If you add more, you may need to change ATH10K_MAX_5G_CHAN */
 	/* And you will definitely need to change ATH10K_NUM_CHANS in core.h */
 };
-- 
2.46.0


