Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25789C3DA4A
	for <ath10k@archiver.kernel.org>; Thu,  1 Aug 2024 20:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xog2N/WyrIaPwtXz/O9Ydne6Hz6difkElo2MkclaQ70=; b=MbZTogg1XUZyjyCRwREMYJC0Qe
	1oGpQhEtWdOGFO9BWdcOvsupJiQbAQWURpSjEJbepKF6DlZ6LurH1ZzMUufX9ns6DL7mZ5gMMEW/t
	a8rnmgRlrf2Zn3yL0iocXjeamR8cWnnuWB0kjtvyWWsJxE4bVJMjHeCYU/H34WKL2k2vxpz92mcm6
	QBfSjmBWxWyjBE2U80ETre2cgKM4OCFMMuas8HpASE9ENpqQjUtDRAiwVOnjAH334NWN9vsVq6oAb
	VLvQq6RrP37aNj9izMV3gn3nXGwmlm4pVllxbBa7GNwddoit/3f7mEg02yfGX+EOqZHqAzC5IzXgC
	8IA15/zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZcLS-00000006dlW-0gkw;
	Thu, 01 Aug 2024 20:24:18 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZcLP-00000006dku-0OPN
	for ath10k@lists.infradead.org;
	Thu, 01 Aug 2024 20:24:16 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52efdf02d13so12121739e87.2
        for <ath10k@lists.infradead.org>; Thu, 01 Aug 2024 13:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722543853; x=1723148653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xog2N/WyrIaPwtXz/O9Ydne6Hz6difkElo2MkclaQ70=;
        b=I7oOZtI10GEGrKzad+Od6kevVdFbzW3TYlbOBr0Y1/4NzWIoiBwrWZ9/sW9v+wL1/q
         u+ik8s/MDI0Zsf+5Yak9tb0B/e3YWvLBd1aGxx6s0hSBNf9HtO2EYuA5a2+C11/ZwI1N
         D5cmUTQzI315NqGM1SwEhuBM78Lmuo0ugFNlahXyDWpZ6pZ2rvlTycrs1kxBHPgodCBk
         +9/TgLe8zg8bJ4ylBmYFAhYxXDmSKoT02hxqHWKf1XkxqUtTdm87PKAsg1SrJ+1OYAJh
         zgkmKhDM1Fvn+Epia6IM/cir9jAzp709HUuK0M7J12h/4zIVDrgRdw9VESbC4I9snA+X
         JRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722543853; x=1723148653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xog2N/WyrIaPwtXz/O9Ydne6Hz6difkElo2MkclaQ70=;
        b=mb/EYaV7igc0e9skj2Ocf3Tue0fhxjI+9O8B09yS0pcVYmg1fudHzGo1TqtNPJI+cJ
         bRA4Pp60EiNPZqFOGErkWd4GLf0RoVRTLjC5vaEi5IRcLU+UTqhu6YNoueNsCm78niQm
         2mhT9hi8zQCeJcBxaS/T3cLjID7ANeZ6BWHeQbL4kIRD+RwQOLZLHT2yi3kt21k6jwj3
         gaecVCE80KXe+eo0hjlfmLa+ZYotHcfy9DBaLg6Oxf7wqzHJOOXitY/fTEApGf667a3B
         MteoaykR346IUt2PPMcANupvoGgTMAEW8O7Fu6Tt5agkAwQmRbavQ2efJ/sJX1Lu2Qmb
         0ovw==
X-Forwarded-Encrypted: i=1; AJvYcCUWfuH7XgrH9RUBepJ5Bm72T9rErYgt1gy+99mBvle73AI0u8HsaPKo4Hfi7nzTjUkVe0aQqdlcAcix8uLTSWzEluqwRc4ZyuYQPQ==
X-Gm-Message-State: AOJu0YxkzP+o6NW4pMgLL97GP2NAxJhX/4AJXUBJlwfoSWgWYVSq0Xfn
	vpCeMHZRU7oaL5QdWCRj4MtGW2ctAfqNoJmur+KZ++Oc3PIj/2+mFfkYbZs=
X-Google-Smtp-Source: AGHT+IGuH1rYF73S/Bhb5uCYyJyEuO0qZ+m9zZ21jCjFdn/JPw6sm/sQWhH+c9Ry+bzHk9aTTkJB4A==
X-Received: by 2002:a05:6512:1110:b0:52f:cd03:a823 with SMTP id 2adb3069b0e04-530bb3b46cfmr1151722e87.45.1722543852246;
        Thu, 01 Aug 2024 13:24:12 -0700 (PDT)
Received: from frutis-latitude7490.lan (public-gprs367134.centertel.pl. [37.47.65.95])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-530bba29fcesm45662e87.155.2024.08.01.13.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 13:24:11 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Owoc?= <frut3k7@gmail.com>
To: 
Cc: =?UTF-8?q?Pawe=C5=82=20Owoc?= <frut3k7@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath10k: add channel 177 for 5 GHz band
Date: Thu,  1 Aug 2024 22:23:53 +0200
Message-ID: <20240801202359.794035-1-frut3k7@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_132415_156127_275FAAC4 
X-CRM114-Status: GOOD (  12.74  )
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
index a5da32e87106..aabe70fcd065 100644
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
2.45.2


