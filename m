Return-Path: <SRS0=rz21=H5=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1271C433E6
	for <ath10k@archiver.kernel.org>; Sat, 27 Feb 2021 00:07:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C42C64F13
	for <ath10k@archiver.kernel.org>; Sat, 27 Feb 2021 00:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C42C64F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gc+C2ZbucVBTJ38lttnxvaGNGoxSjTXdV6EhhbUSh7s=; b=ZfHj9kEemCUTP2gZRGZ+OyI0A
	31hx8ObWvp08YReMhijMy/V3QSrFod7YXvBOZKg459pcCaYBCzChRIsbd0xSZjtyRCbeJ9dMI//mG
	dmkAhzsrRdVA+tYtLImNbgTYDbX7EAAsrf2HpLNY31jQxCs3nmivO6J1+H7NXzsWMon2/l04McNu1
	hUWyGKlD5eQrRBpbnaL8xeJWp+pkmJR1bNqFJutuAzmUqD+dP49TfiaXbXp5QgPBlbXUWpvGfK/U0
	dJrZTPqDIpPDjN/pkQax9xsaGAeRDcYaEfyGtfiEq4DRF2WZHwXCCZyCibrsFlNUnToo9BEkMLL2O
	sf1/klq/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFn8b-0000Pz-NB; Sat, 27 Feb 2021 00:07:13 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFn8W-0000OB-Pf
 for ath10k@lists.infradead.org; Sat, 27 Feb 2021 00:07:09 +0000
Received: by mail-il1-x12b.google.com with SMTP id q5so9532475ilc.10
 for <ath10k@lists.infradead.org>; Fri, 26 Feb 2021 16:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KDyipOQ/zGVT/OsO6YP4rsNag+Kuytihig+gLKvB9Z8=;
 b=LaYZeGozYDZh8m9Zcr5DguvGQyzVvG1qk6+v/7FntdsL/I3sVG06wPjHdPnjcZrUET
 xY5SJ7hU/xLUPFWSmJiJh2JucnddnVTTkkP5NzwA29W6K1xcDQ1SIXbxGUPeBds0IIBb
 /0QQjolx3Ez78Pr0DP8b/cqMkvnkaddIjzBWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KDyipOQ/zGVT/OsO6YP4rsNag+Kuytihig+gLKvB9Z8=;
 b=AmOnEOg303AQ/7UTkcyxr0d1GTU7j/h8znDP8w8InduhcjYbftM03nF8RKrH+nbcad
 gGcXLezAUWTM9krHQZWueO+TRLDdyLrib7WMXCg/2mHYanYNjn7HwiVSk+2lXKmx3bh3
 SUbR7F52DbZOXegJPxXfseuo6HsxSZif+tvzN6AkuNVjWj8zIZJ9pgxgFd65hMy0s2GL
 VORHfSfVMRt4w9jCV0iwaP0+hhrWyTFb0Qfr16BYMsTXubWe87nyIJFEmxjJmh1SpC7S
 +DW1db8FIbfXUUDGbWNJii5HqdfIII0L22iszfkcEzZmCbjkmXfNLFbdI2PMnEncQSAG
 lWOg==
X-Gm-Message-State: AOAM533falzHj71wVVqp4ii8LRJ325wyWRx+/J0zCb+qLZeHqx+2SalQ
 MFI67PPVrrzgxwUqpWq9DoCHmw==
X-Google-Smtp-Source: ABdhPJwzOwoAwB9GujMwkiN8ETBH1uSIX3ovqFMW7TfdMkfk0kJBXFE16/UXQm9KzXnBkIgQeIHe0w==
X-Received: by 2002:a92:cd8a:: with SMTP id r10mr4471884ilb.110.1614384427380; 
 Fri, 26 Feb 2021 16:07:07 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id w16sm5228805ilh.35.2021.02.26.16.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 16:07:07 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org
Subject: [PATCH v3 3/3] ath10k: detect conf_mutex held ath10k_drain_tx() calls
Date: Fri, 26 Feb 2021 17:07:00 -0700
Message-Id: <c9c2cd7b79f5551741c063239013919bf0e3f984.1614383025.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1614383025.git.skhan@linuxfoundation.org>
References: <cover.1614383025.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_190708_862050_D63E1E43 
X-CRM114-Status: GOOD (  12.43  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

ath10k_drain_tx() must not be called with conf_mutex held as workers can
use that also. Add call to lockdep_assert_not_held() on conf_mutex to
detect if conf_mutex is held by the caller.

The idea for this patch stemmed from coming across the comment block
above the ath10k_drain_tx() while reviewing the conf_mutex holds during
to debug the conf_mutex lock assert in ath10k_debug_fw_stats_request().

Adding detection to assert on conf_mutex hold will help detect incorrect
usages that could lead to locking problems when async worker routines try
to call this routine.

Link: https://lore.kernel.org/lkml/37a29c383bff2fb1605241ee6c7c9be3784fb3c6.1613171185.git.skhan@linuxfoundation.org/
Link: https://lore.kernel.org/linux-wireless/871rdmu9z9.fsf@codeaurora.org/
Acked-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index bb6c5ee43ac0..5ce4f8d038b9 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4727,6 +4727,8 @@ static void ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 /* Must not be called with conf_mutex held as workers can use that also. */
 void ath10k_drain_tx(struct ath10k *ar)
 {
+	lockdep_assert_not_held(&ar->conf_mutex);
+
 	/* make sure rcu-protected mac80211 tx path itself is drained */
 	synchronize_net();
 
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
