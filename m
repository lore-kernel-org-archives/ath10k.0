Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC7FEB64DD
	for <ath10k@archiver.kernel.org>; Thu, 29 Jun 2023 03:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHzBwr0Zb04zn7ijjIF1/1+xOBA5cpcZoxCvvZHKJJE=; b=y6LugqFC6UPxhW
	UGf03TZCLupAPsPZYNyzYPRGu96RS07ifIR+tPdreMGYiDvX+YO31vqCI+T/6AeC77f7/iaLrq2kI
	MyZg0amj8ew9cd77clP53OYqTR9MqKG7M4ggOFuI3D0uM5J+wI3dTXBmf/Snu8F9eCQOw894lLLR3
	kvfXOqTZZamInWGWo81duVZckahN886J3NA+U/SQFwwYoJ/2xJJC+UgUdE1l8hJ2hZpFgXXITg7eV
	am7zEqJkn4aiSFLOP7o//9Ye1MJgzCPAbHcWIvgMG0MwPWCdQ/XxA3AhqcZFknoK0uosW8E8lYtY8
	oIY3u+7srqDIo+4ELL4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEijT-00HSX0-2m;
	Thu, 29 Jun 2023 03:54:11 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEijR-00HSVs-0x
	for ath10k@lists.infradead.org;
	Thu, 29 Jun 2023 03:54:10 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-557790487feso196381a12.0
        for <ath10k@lists.infradead.org>; Wed, 28 Jun 2023 20:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688010847; x=1690602847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2AHgNaBFK8JfNASOhLGds08CbGR9PY3Il9QtABWRh4=;
        b=et3Vu15oD0I0/VTYf3k59eeXyPxFA0clBBCUdHY1eXEFWGvj23bz+/zkFatUsDfBch
         IR+g/aHslPcC8iJreUR+tFMscRb6bLCjoLCrLTg+pc5CL/NHCvLT1Bez57oah4Kzbj9N
         G9klaQXXF9rXjC7VFINlryTVLbGlwBCQ2vrcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688010847; x=1690602847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2AHgNaBFK8JfNASOhLGds08CbGR9PY3Il9QtABWRh4=;
        b=igePEf5TjCA8EWiVpCt2zR2a43WudlM8xMv/WoAjvuRdq8pr63ljkSCdAJV8frXo7U
         1aadkrq0T68G94KnwYnIjP3uUMmvlih4SqZjd74qBmflM7fZ88/gw5tifsm3jmoaRYg1
         tCB3+tfpkMVoXDcx67pQA/lCoxkD/aqTGg8ci9fIl46x+MRlTYPlekEvTaty65lNZXHK
         vSg//gVqShTLgJLFdhFq68vfXKCGcC3EUkAmSlcuKviFhEeg6WnHYSixdKf2QZgT4g9N
         XOF/FN3mAx6/cDoYoWQTDjzYm9b4VlOy8PWOW8VAhRuEsuO5cmG69756WbprvXi7eAQE
         /GVQ==
X-Gm-Message-State: AC+VfDzA0TwBvLk2ugPKU8c0oDj3W3ItCxVa/jyymnlYxaEoI41KU+wF
	CSzLqDdXvbRhEKDKPi9wgyxLwA==
X-Google-Smtp-Source: ACHHUZ6ERoeG3uQAKmubsGmF14KTacE2DDCjpJbY0mZaPsbsZ/WEjLnqr+/Rj0L6NaJstrbDu/M8GA==
X-Received: by 2002:a05:6a20:7d96:b0:12b:fe14:907e with SMTP id v22-20020a056a207d9600b0012bfe14907emr5996043pzj.20.1688010847675;
        Wed, 28 Jun 2023 20:54:07 -0700 (PDT)
Received: from kuabhs-cdev.c.googlers.com.com (242.67.247.35.bc.googleusercontent.com. [35.247.67.242])
        by smtp.gmail.com with ESMTPSA id r19-20020a634413000000b005579f12a238sm7019842pga.86.2023.06.28.20.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 20:54:07 -0700 (PDT)
From: Abhishek Kumar <kuabhs@chromium.org>
To: johannes.berg@intel.com,
	kvalo@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kuabhs@chromium.org,
	netdev@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH 2/2] ath10k: mac: enable WIPHY_FLAG_CHANNEL_CHANGE_ON_BEACON on ath10k
Date: Thu, 29 Jun 2023 03:52:55 +0000
Message-ID: <20230629035254.2.I23c5e51afcc6173299bb2806c8c38364ad15dd63@changeid>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230629035254.1.I059fe585f9f9e896c2d51028ef804d197c8c009e@changeid>
References: <20230629035254.1.I059fe585f9f9e896c2d51028ef804d197c8c009e@changeid>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_205409_353337_02898D74 
X-CRM114-Status: UNSURE (   8.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Enabling this flag, ensures that reg_call_notifier is called
on beacon hints from handle_reg_beacon in cfg80211. This call
propagates the channel property changes to ath10k driver, thus
changing the channel property from passive scan to active scan
based on beacon hints.
Once the channels are rightly changed from passive to active,the
connection to hidden SSID does not fail.

Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
---

 drivers/net/wireless/ath/ath10k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 7675858f069b..12df3228b120 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -10033,6 +10033,7 @@ int ath10k_mac_register(struct ath10k *ar)
 
 	ar->hw->wiphy->features |= NL80211_FEATURE_STATIC_SMPS;
 	ar->hw->wiphy->flags |= WIPHY_FLAG_IBSS_RSN;
+	ar->hw->wiphy->flags |= WIPHY_FLAG_CHANNEL_CHANGE_ON_BEACON;
 
 	if (ar->ht_cap_info & WMI_HT_CAP_DYNAMIC_SMPS)
 		ar->hw->wiphy->features |= NL80211_FEATURE_DYNAMIC_SMPS;
-- 
2.41.0.162.gfafddb0af9-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
