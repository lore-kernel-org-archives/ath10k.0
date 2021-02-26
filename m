Return-Path: <SRS0=xh5s=H4=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0ACC433DB
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 17:53:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3522D64F17
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 17:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3522D64F17
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=68ZjpdOwtDlC9+1uAuNfQ553HPZ5NhkjYotSroVGaRQ=; b=Kk3yWzt2ArnA3Elkm1TiSssQL
	nCXm9iAs5WNgE7q4vPAjLq9vD11U6F2VCwzYziQHwK41HstlAUkNb97OUTsaFnNIVOwfRi0o5b8lv
	h82tilaN7ME4P0irwOUGl9CvyMt5mxYL0m4x/DWT+jNhSOjNSrWgpQ6Z1Xc7LEUZwos2MoUvnUGo/
	+p9byEnLGdrNkXtZyQpAWD1/aJQvbxfMcRZP+fyY7I2cL20xlGUPXkYK0ZO1wW5AWXeaUJldF5zZn
	xait8tM6sPEJMyBflghyofe3siKY1HnHDVYWI7dVlILTdIHCipyad2cw1StN0mNb50OJw29QZk8y4
	iIcxsLz1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFhHu-00012B-N4; Fri, 26 Feb 2021 17:52:26 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFhHq-0000zW-IU
 for ath10k@lists.infradead.org; Fri, 26 Feb 2021 17:52:25 +0000
Received: by mail-il1-x129.google.com with SMTP id q9so8759365ilo.1
 for <ath10k@lists.infradead.org>; Fri, 26 Feb 2021 09:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KzQ9OBQajFeaiUpGgz5pU1UyInmaQ1PIgYZOHvN7J2s=;
 b=QmEx6PMwk5EzxsrPZJ6iRfQ/ny2qMbBfnWObiy0RKj7IzCtCtGd2xn3nfRRPTWrMDn
 8qODazbWCshriSjXgg2GqqfyIxkQxBwY1cmWSxb2GEk7YRApPYA3iYuVChku9DJatqOG
 Rg8jTRSgD/ztSQ1+1eAYv8ZZWPYSsXyi4jNH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KzQ9OBQajFeaiUpGgz5pU1UyInmaQ1PIgYZOHvN7J2s=;
 b=RIQbkF6mfByUS1llhXgpz6XZ9/AaxNzC6LHgTR44+N//5aDdBC/VLu+LV+dZwP0oW/
 sMxnIxUt3JCACm2DQt7rpPnUxt2xAHXE0FhiyOky4W74PpZKkxQaKkC4aEopfIIe65HV
 he1wDWTgVKlQB762Au7MHeUQXZT4rAQ5jE8Fkjjf/i2LZvxZZtgj03ctq3hn5QuQ/D/9
 m/u4mfxGL/JpjxV5p99oeKeTTUPYkL6rW4xBO3DQedhDJbcAzjIXxGrTI6pesCWSN4nB
 6I0f3QXVP8J9INcV2egEXn3eDNfuM/niGwektYT2WuoKkPlSQWqUfdUDN6oWwIWnKoKW
 BvuQ==
X-Gm-Message-State: AOAM532FDQJjG1pVEUByvZcRBgFRSLpe5BzTvRNHiJqV3vPA5vsOPBWI
 E2Bx95ZyuWV6rQsmqKYgeDCRKq24wMNJPg==
X-Google-Smtp-Source: ABdhPJzKtNZ9DqshtlkVijD2KykbsioNqaOrCP1Wc05drU0Weq1Yrn5ll6pcxxXm1ey3JQd/0u87WQ==
X-Received: by 2002:a92:cc49:: with SMTP id t9mr3302848ilq.86.1614361939062;
 Fri, 26 Feb 2021 09:52:19 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id y25sm5594060ioa.5.2021.02.26.09.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 09:52:18 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org
Subject: [PATCH v2 1/3] lockdep: add lockdep_assert_not_held()
Date: Fri, 26 Feb 2021 10:52:13 -0700
Message-Id: <a40d18bba5a52662ac8fc556e1fce3752ea08472.1614355914.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1614355914.git.skhan@linuxfoundation.org>
References: <cover.1614355914.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_125222_632984_6CE2CE6B 
X-CRM114-Status: GOOD (  14.28  )
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

Some kernel functions must be called without holding a specific lock.
Add lockdep_assert_not_held() to be used in these functions to detect
incorrect calls while holding a lock.

lockdep_assert_not_held() provides the opposite functionality of
lockdep_assert_held() which is used to assert calls that require
holding a specific lock.

Incorporates suggestions from Peter Zijlstra to avoid misfires when
lockdep_off() is employed.

The need for lockdep_assert_not_held() came up in a discussion on
ath10k patch. ath10k_drain_tx() and i915_vma_pin_ww() are examples
of functions that can use lockdep_assert_not_held().

Link: https://lore.kernel.org/lkml/37a29c383bff2fb1605241ee6c7c9be3784fb3c6.1613171185.git.skhan@linuxfoundation.org/
Link: https://lore.kernel.org/linux-wireless/871rdmu9z9.fsf@codeaurora.org/
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 include/linux/lockdep.h  | 11 ++++++++---
 kernel/locking/lockdep.c |  5 ++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index b9e9adec73e8..93eb5f797fc1 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -294,8 +294,12 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
 
 #define lockdep_depth(tsk)	(debug_locks ? (tsk)->lockdep_depth : 0)
 
-#define lockdep_assert_held(l)	do {				\
-		WARN_ON(debug_locks && !lockdep_is_held(l));	\
+#define lockdep_assert_held(l)	do {					\
+		WARN_ON(debug_locks && lockdep_is_held(l) == 0);	\
+	} while (0)
+
+#define lockdep_assert_not_held(l)	do {				\
+		WARN_ON(debug_locks && lockdep_is_held(l) == 1);	\
 	} while (0)
 
 #define lockdep_assert_held_write(l)	do {			\
@@ -384,7 +388,8 @@ extern int lockdep_is_held(const void *);
 #define lockdep_is_held_type(l, r)		(1)
 
 #define lockdep_assert_held(l)			do { (void)(l); } while (0)
-#define lockdep_assert_held_write(l)	do { (void)(l); } while (0)
+#define lockdep_assert_not_held(l)		do { (void)(l); } while (0)
+#define lockdep_assert_held_write(l)		do { (void)(l); } while (0)
 #define lockdep_assert_held_read(l)		do { (void)(l); } while (0)
 #define lockdep_assert_held_once(l)		do { (void)(l); } while (0)
 
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index bdaf4829098c..d3299fd85c4a 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -5472,7 +5472,10 @@ noinstr int lock_is_held_type(const struct lockdep_map *lock, int read)
 	int ret = 0;
 
 	if (unlikely(!lockdep_enabled()))
-		return 1; /* avoid false negative lockdep_assert_held() */
+		/* avoid false negative lockdep_assert_not_held()
+		 * and lockdep_assert_held()
+		 */
+		return -1;
 
 	raw_local_irq_save(flags);
 	check_flags(flags);
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
