Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CB1C00A8F
	for <ath10k@archiver.kernel.org>; Tue, 24 Oct 2023 17:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=0mbedsLo8GGLAfxxBF7dHW/k0gVxjQcNLrhmQJmStM0=; b=Pc9
	0ahRdtOZnipIqpQ7FzErvHtGSE8VibcyJLbCP/BQEWmE8wpysgvgrt404yPvkpeTL022krO7kUs25
	pMXuDrdTwDIuEQte212TTFDNf10QHZweEn1WaSoIudfkw//5NDfzeT4/600oE1fGb13yJxJLPa3+/
	CF+adTH3gpGqPci/ltAcJGPUl/+ZxZlMKnlEMVlzlbaXALHW2psdciQXAVfVk5y2sZRV6ItD/hB5q
	QOgQ6Y7akwOO+otCx6aSYNMz5ggmlU7DSLT84TyIprvTxeT9Cjr0J2k6budbUZEKRh2PGGB3KXDgs
	qfSsolf6EPG/2b2qsINPNiIyatgtzjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvLQE-00AbwP-2y;
	Tue, 24 Oct 2023 17:42:30 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvLQB-00Abvk-1I
	for ath10k@lists.infradead.org;
	Tue, 24 Oct 2023 17:42:28 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-da04fb79246so753742276.2
        for <ath10k@lists.infradead.org>; Tue, 24 Oct 2023 10:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698169338; x=1698774138; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IiUyQYP0TuoT75NL7ZUXuVLk1dlI1JfFc9pMS1xuxEY=;
        b=0+DoDXZyIDWN0+nI/CshevuDvqCGcPiMMCfQ8p4QuDkz02HiaU87m0fctIyLd8VRMQ
         rcYZO4b7Ntkd3ElKrfql8u4Pp/xAn2qWVnQX0ICi9YRcdVVLKmIPNiE7P0VglvLP4zUx
         fT5PbU7ZZh8YmF7KXD7/Bs65rZHJUMUC0wqrayXVX5l+8ONo4zvqbPQqZUrZML1FEY9T
         FPs056B5R5ZNjqeImxP/3L3udawU/dGWldJvCFaRrmQ52/+/8aEU328V7mFhkvNN/Rmc
         cSl2Wx1hvusd7z/NxPWkzQmZCBiBTU7y5+fy5Eb7t+939n+qE8nIOShXyXYGMqMR9Yed
         IN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698169338; x=1698774138;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IiUyQYP0TuoT75NL7ZUXuVLk1dlI1JfFc9pMS1xuxEY=;
        b=ujkjwhxq+ywYj75iR12Fy9JEleLjcwM4Sjw6z6kPjz5NAfBUEq1jyUsRvkSJAa0gTv
         O0QO39zJHElPXCOglA4P/c/jziOFFa3a5000NLzxHBS96OQDwBaKEYzFCwl6PU6kErA0
         06s0ngOQN1zOt93kBNqeIw1RexaD7v8mdw5bxywTX5JXTrfEXksDBeqMfzoW2TPPcOe+
         eDJewKTY5n5pNTTPkuT79aRF/g6Rk1/GmzSF/w0vJOjNvC5W6Z9FzOFw+8tvryAU9Bc9
         RfPW+/dH1SqtYnIqNztSpcFanymWohoJPcQ70JRAZGClWk+STu7BotrwytQ0vfq0rMeh
         xB3g==
X-Gm-Message-State: AOJu0YzNAuARLfcCEfM+q7M2npbM7Bjr9yqtW2hHsv8gLPPcRGLyd4gz
	p8OERGry2SQhmGjaEOT4n45oXJRWpgnIMCwCYg==
X-Google-Smtp-Source: AGHT+IGxBUJ6AOf1u6czuQpcFOXKwJ3JNLy/s7RwipVOoLtmeRdVForQN5tuNUrGj1C4sbWae1Qtv6lDQzZihH6Diw==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:1083:b0:d9a:c3b8:4274 with
 SMTP id v3-20020a056902108300b00d9ac3b84274mr332751ybu.7.1698169337984; Tue,
 24 Oct 2023 10:42:17 -0700 (PDT)
Date: Tue, 24 Oct 2023 17:42:16 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPcBOGUC/52NTQqDMBCFryJZd0p+NIWueo/iIsRRQ9WUmZBWx
 Ls3eoTyeIvvLd63CUYKyOJebYIwBw5xKaAvlfCjWwaE0BUWWmqjpDLAiRb/XqGjkJEYFkzwCYQ
 TMoNL41ElXzA7DyU345rGWovWifL5JuzD9/Q928Jj4BRpPfVZHeu/pqxAga6xlloq1zvzGGIcJ rz6OIt23/cfmGU7pusAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698169336; l=2664;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=v7X6AgaYGtLwlN3x1yqa0dzr/NEuarCPk3n9BpO0sN0=; b=t/Ub/yzQiuI1fBkkvEt7r+RmgkE6N5jCyDcKYYtcuRX0JU7I4tPXvRrsG8ukYhxbLdofgXYK5
 fRSaupgp7LWCw9dftF9BYantl62Zrfybz6X6RRUqMFlL8hHOmRxfTbl
X-Mailer: b4 0.12.3
Message-ID: <20231024-strncpy-drivers-net-wireless-ath-ath10k-mac-c-v2-1-4c1f4cd4b4df@google.com>
Subject: [PATCH v2] wifi: ath10k: replace deprecated strncpy with memcpy
From: Justin Stitt <justinstitt@google.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Justin Stitt <justinstitt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_104227_439680_7767F602 
X-CRM114-Status: GOOD (  11.76  )
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

strncpy() is deprecated [1] and we should prefer less ambiguous
interfaces.

In this case, arvif->u.ap.ssid has its length maintained by
arvif->u.ap.ssid_len which indicates it may not need to be
NUL-terminated. Make this explicit with __nonstring and use a plain old
memcpy.

This is also consistent with future copies into arvif->u.ap.ssid:

	if (changed & BSS_CHANGED_SSID &&
	    vif->type == NL80211_IFTYPE_AP) {
		arvif->u.ap.ssid_len = vif->cfg.ssid_len;
		if (vif->cfg.ssid_len)
			memcpy(arvif->u.ap.ssid, vif->cfg.ssid,
			       vif->cfg.ssid_len);
		arvif->u.ap.hidden_ssid = info->hidden_ssid;
	}

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v2:
- update subject to include wifi
- prefer memcpy() over strtomem() (thanks Kalle, Jeff)
- rebase onto 6.6-rc7 @d88520ad73b79e71
- Link to v1: https://lore.kernel.org/r/20231013-strncpy-drivers-net-wireless-ath-ath10k-mac-c-v1-1-24e40201afa3@google.com
---
Note: build-tested only.

Found with: $ rg "strncpy\("
---
 drivers/net/wireless/ath/ath10k/core.h | 2 +-
 drivers/net/wireless/ath/ath10k/mac.c  | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 4b5239de4018..ba9795a8378a 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -607,7 +607,7 @@ struct ath10k_vif {
 			u8 tim_bitmap[64];
 			u8 tim_len;
 			u32 ssid_len;
-			u8 ssid[IEEE80211_MAX_SSID_LEN];
+			u8 ssid[IEEE80211_MAX_SSID_LEN] __nonstring;
 			bool hidden_ssid;
 			/* P2P_IE with NoA attribute for P2P_GO case */
 			u32 noa_len;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 03e7bc5b6c0b..f3f6deb354c6 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6125,9 +6125,8 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 
 		if (ieee80211_vif_is_mesh(vif)) {
 			/* mesh doesn't use SSID but firmware needs it */
-			strncpy(arvif->u.ap.ssid, "mesh",
-				sizeof(arvif->u.ap.ssid));
 			arvif->u.ap.ssid_len = 4;
+			memcpy(arvif->u.ap.ssid, "mesh", arvif->u.ap.ssid_len);
 		}
 	}
 

---
base-commit: d88520ad73b79e71e3ddf08de335b8520ae41c5c
change-id: 20231013-strncpy-drivers-net-wireless-ath-ath10k-mac-c-c73a55666e6a

Best regards,
--
Justin Stitt <justinstitt@google.com>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
