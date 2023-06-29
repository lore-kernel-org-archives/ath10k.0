Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F46EB64D9
	for <ath10k@archiver.kernel.org>; Thu, 29 Jun 2023 03:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JvdoKthakGle7+0jUgEwKl8qqGg1MAyl0yg+h+qFtDA=; b=AIOCZaXENO7MKd
	BkQsQWXbzk2DwY2/GnoY6L3b2j7EVkuHAUdSnpFfzGS5V36optd7+zmNZmgaNivVdhO9r1F6w49SJ
	VABH2gx0iUygvG32epH5Fm1vmT/bcRa/2yX41M+NipKLWZYLVgtjPRaFGvQRtdAwSzSemBa0GB3d1
	IlXyEYiiPx2DgEhNEOXxSPUHjY20aThttlc1g+zC85OmP1+3Dgpv/gTLf6LciHGFrGkh1OpEmjHT5
	YwOhCGnlgLiB+E5AyCI0SD2ULUw+f377tZUdRFIBJ/emOzqacNCOUa+X3/uIkHBYVE4VbST4L5vdm
	yQfVGZQWvUF7Tbdpluiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEijN-00HSVb-0T;
	Thu, 29 Jun 2023 03:54:05 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEijK-00HSV2-1Y
	for ath10k@lists.infradead.org;
	Thu, 29 Jun 2023 03:54:03 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-543c692db30so192648a12.3
        for <ath10k@lists.infradead.org>; Wed, 28 Jun 2023 20:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688010840; x=1690602840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PgRCWuAL+JILQAuJVgnpzN1VGDR5+ycwundGmuPsvAc=;
        b=Zp7/05od1Hzmg3DamsY4xVwfn6tMykIurlQXX5Rz4Xuof4ze/XQSv561GpHeqSpoKh
         2v+EzzaIXKRz/2+ZwPdbePYm00aj+7lpLYrNJ4hAYEhBfPYw1efyvEasC85ra7aPmZY2
         HvVIPX6DZQ3ldkpxDKKby+eFfCylabLuTSQA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688010840; x=1690602840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgRCWuAL+JILQAuJVgnpzN1VGDR5+ycwundGmuPsvAc=;
        b=DiqSiJF5zxpwpc8EHyr/evS1wnoBvWnbFTvcVm7AJq+WDx/cQoO9fC3InTFXZYt/Pi
         W1q6bZj5clORWntJd0lgix4zF5DC0frdmlgt51YcOBrnbA9Orp9+etQgOKZDqdN57f1p
         /mQMHN5IC5s6JrSxkgFWxmjY5Fa+BS1BFr7yTNzwvYryLsuj2oO9XKUwnj1DaxUxlRdM
         gSPrPhqRI8MUHEDtBJlcx0aLmsjQs+sZ14l7Ir3/Kr0lOCwEzd+zDdQ4jwKk986T5kZX
         F4dSGD2ni/7NKAStfy+YcbNT0u0sJb18vOrdGJdaZrq8BCTPMZo8LOP+UuUc4nPNYSpN
         qpFA==
X-Gm-Message-State: AC+VfDw9sMb9jU8WNhgSlYaJo1UdtHBGA6KVjeulMP+X4zHfoUoDrK35
	J49e0x3QoLE37gspJXty9OyVTE8GT6nF0iRcYo8=
X-Google-Smtp-Source: ACHHUZ6y8ticW17Bm2FXqsOoVj+oMchk8icLpia+Wu94tK8W+NMrPIcN6NkM7fNXF21kuk4TIlr51g==
X-Received: by 2002:a05:6a20:1605:b0:115:83f:fce1 with SMTP id l5-20020a056a20160500b00115083ffce1mr48159642pzj.5.1688010839715;
        Wed, 28 Jun 2023 20:53:59 -0700 (PDT)
Received: from kuabhs-cdev.c.googlers.com.com (242.67.247.35.bc.googleusercontent.com. [35.247.67.242])
        by smtp.gmail.com with ESMTPSA id r19-20020a634413000000b005579f12a238sm7019842pga.86.2023.06.28.20.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 20:53:59 -0700 (PDT)
From: Abhishek Kumar <kuabhs@chromium.org>
To: johannes.berg@intel.com,
	kvalo@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kuabhs@chromium.org,
	netdev@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH 1/2] wifi: cfg80211: call reg_call_notifier on beacon hints
Date: Thu, 29 Jun 2023 03:52:54 +0000
Message-ID: <20230629035254.1.I059fe585f9f9e896c2d51028ef804d197c8c009e@changeid>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_205402_564171_F0CA783E 
X-CRM114-Status: GOOD (  16.09  )
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

Currently the channel property updates are not propagated to
driver. This causes issues in the discovery of hidden SSIDs and
fails to connect to them.
This change defines a new wiphy flag which when enabled by vendor
driver, the reg_call_notifier callback will be trigger on beacon
hints. This ensures that the channel property changes are visible
to the vendor driver. The vendor changes the channels for active
scans. This fixes the discovery issue of hidden SSID.

Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
---

 include/net/cfg80211.h |  3 +++
 net/wireless/reg.c     | 20 ++++++++++++--------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 9e04f69712b1..48e6ebcdacb3 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4783,6 +4783,8 @@ struct cfg80211_ops {
  * @WIPHY_FLAG_SUPPORTS_EXT_KCK_32: The device supports 32-byte KCK keys.
  * @WIPHY_FLAG_NOTIFY_REGDOM_BY_DRIVER: The device could handle reg notify for
  *	NL80211_REGDOM_SET_BY_DRIVER.
+ * @WIPHY_FLAG_CHANNEL_CHANGE_ON_BEACON: reg_call_notifier() is called if driver
+ *	set this flag to update channels on beacon hints.
  */
 enum wiphy_flags {
 	WIPHY_FLAG_SUPPORTS_EXT_KEK_KCK		= BIT(0),
@@ -4809,6 +4811,7 @@ enum wiphy_flags {
 	WIPHY_FLAG_SUPPORTS_5_10_MHZ		= BIT(22),
 	WIPHY_FLAG_HAS_CHANNEL_SWITCH		= BIT(23),
 	WIPHY_FLAG_NOTIFY_REGDOM_BY_DRIVER	= BIT(24),
+	WIPHY_FLAG_CHANNEL_CHANGE_ON_BEACON     = BIT(25),
 };
 
 /**
diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index 26f11e4746c0..c76bfaad650b 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -2149,6 +2149,13 @@ static bool reg_is_world_roaming(struct wiphy *wiphy)
 	return false;
 }
 
+static void reg_call_notifier(struct wiphy *wiphy,
+			      struct regulatory_request *request)
+{
+	if (wiphy->reg_notifier)
+		wiphy->reg_notifier(wiphy, request);
+}
+
 static void handle_reg_beacon(struct wiphy *wiphy, unsigned int chan_idx,
 			      struct reg_beacon *reg_beacon)
 {
@@ -2156,6 +2163,7 @@ static void handle_reg_beacon(struct wiphy *wiphy, unsigned int chan_idx,
 	struct ieee80211_channel *chan;
 	bool channel_changed = false;
 	struct ieee80211_channel chan_before;
+	struct regulatory_request *lr = get_last_request();
 
 	sband = wiphy->bands[reg_beacon->chan.band];
 	chan = &sband->channels[chan_idx];
@@ -2181,8 +2189,11 @@ static void handle_reg_beacon(struct wiphy *wiphy, unsigned int chan_idx,
 		channel_changed = true;
 	}
 
-	if (channel_changed)
+	if (channel_changed) {
 		nl80211_send_beacon_hint_event(wiphy, &chan_before, chan);
+		if (wiphy->flags & WIPHY_FLAG_CHANNEL_CHANGE_ON_BEACON)
+			reg_call_notifier(wiphy, lr);
+	}
 }
 
 /*
@@ -2325,13 +2336,6 @@ static void reg_process_ht_flags(struct wiphy *wiphy)
 		reg_process_ht_flags_band(wiphy, wiphy->bands[band]);
 }
 
-static void reg_call_notifier(struct wiphy *wiphy,
-			      struct regulatory_request *request)
-{
-	if (wiphy->reg_notifier)
-		wiphy->reg_notifier(wiphy, request);
-}
-
 static bool reg_wdev_chan_valid(struct wiphy *wiphy, struct wireless_dev *wdev)
 {
 	struct cfg80211_chan_def chandef = {};
-- 
2.41.0.162.gfafddb0af9-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
