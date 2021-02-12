Return-Path: <SRS0=7R0v=HO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6D3C433DB
	for <ath10k@archiver.kernel.org>; Fri, 12 Feb 2021 23:29:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35E8664DE9
	for <ath10k@archiver.kernel.org>; Fri, 12 Feb 2021 23:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35E8664DE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IREVpz7PRhxitCapb0nDLUwX8jyECSeTSX3Cw9RZNSg=; b=paEzDyWauae9Z1ZaDJEboZpmP
	o83pWxQyvpNvdSm6U0zFz+P3rtUbl0lYoeUaRPta7ERajGzeYo1cxcVvpFdHiRIl3gEH3kJr6SI5G
	4gjiG+Ssjdo+P6t9W8YrTTrJ8TjjOWYkhq5aIhnDslgQXUjCkELgOo148XmaRchOShtSkHhaRvLDO
	7JpVFXBnor2v9LkEQuigre/xXozJpX6sJaRvnG97hWqN71kJah53QaEV8mEgSp9D5iVVJ3Kvevqlu
	hLLyX7lOuoBqxsGYCRDH+NurP7JyF0eP3Ccs529+VrCinys65DdVf8aj+ZxJq8W9sjEO4mhq8ch1t
	hofpP6EyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAhrs-0003o5-CU; Fri, 12 Feb 2021 23:28:56 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAhro-0003mK-KR
 for ath10k@lists.infradead.org; Fri, 12 Feb 2021 23:28:54 +0000
Received: by mail-io1-xd2e.google.com with SMTP id z21so908553iob.7
 for <ath10k@lists.infradead.org>; Fri, 12 Feb 2021 15:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8w8XQdxn9R0vTUUYKwbH7//7X6JrjWFRUImHZ2qHCEA=;
 b=MsK4Yp5tiWM/fulpatrxLLYBqeCGXaamHRMCb6oq63sXWcNUVVP2iuH/EpRTU/P71N
 U5wVLxv4rRqyBLWYgo0h0gt5H8QyMeMDAyvdeKpgYBwlKGWxkRM7vtC8dzVJXzNqIv/F
 go9UPLuCyA4cdM5ZZwhtXWdBYV1CGlDpw4UV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8w8XQdxn9R0vTUUYKwbH7//7X6JrjWFRUImHZ2qHCEA=;
 b=lgVwFPYkHV8HOhgYQqDnXT0ykdSj1WL7GyIPGzzYcHoOLiW4QjFg9FQCTsPq5KXXxo
 IAMIV1SkRSxa+DLetsUmbUTG8m6K3mXFn6D7G/TIsiKA9kD25RDLwfovzod/ZTkvJYEC
 qOwQLXa9iH//ThY94w+RiADKD0iRK4yRZpn0d1h+xl21VP3NWRPPeUIiKUkq/+7ehnj5
 szI7AG4N23GkGEMkiI1GNX0y7BpMLLjRm24HqmZDmEu6vSyLCWE8xQxcAV7n/SYQVjTZ
 deSYXdKtBxMQGqbqO+/lOQ0sIM7+JD3blTFFMBMibTk4ZogsoF78md8Jqvh3Pt02aXxC
 7+iw==
X-Gm-Message-State: AOAM532GeOyrGf58n125e3DOg01WVjIozxU641B6yqmV06kLQyZQPRKY
 cQiW6bBmYmcXCNrX0Urd5SFyeQ==
X-Google-Smtp-Source: ABdhPJyflu0RNWiIV3nbQa149G0hby7tBp9QoVfXWvAf6vhrbVm0ZDp9jsGcpqvP08a3LAahnffRrg==
X-Received: by 2002:a05:6638:3c6:: with SMTP id
 r6mr4761929jaq.115.1613172530821; 
 Fri, 12 Feb 2021 15:28:50 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id i20sm5180328ilc.2.2021.02.12.15.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 15:28:50 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org
Subject: [PATCH 2/2] ath10k: detect conf_mutex held ath10k_drain_tx() calls
Date: Fri, 12 Feb 2021 16:28:43 -0700
Message-Id: <0686097db95ae32ce6805e5163798d912b394f37.1613171185.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1613171185.git.skhan@linuxfoundation.org>
References: <cover.1613171185.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_182852_717738_4AFBEE13 
X-CRM114-Status: GOOD (  12.03  )
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

Link: https://lore.kernel.org/linux-wireless/871rdmu9z9.fsf@codeaurora.org/
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index c202b167d8c6..7de05b679ad2 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4728,6 +4728,8 @@ static void ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
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
