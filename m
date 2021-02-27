Return-Path: <SRS0=rz21=H5=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC56DC433DB
	for <ath10k@archiver.kernel.org>; Sat, 27 Feb 2021 00:07:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9161364F0E
	for <ath10k@archiver.kernel.org>; Sat, 27 Feb 2021 00:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9161364F0E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XsomvuLWu5rBId9Wq073y26UJhaKbppqQTs6KBFbamw=; b=MePKvHrMx9yhmFvUY0o/qP+SQ
	YWkX1gYQVmskeMd/15kcahcKnFNW1BQo0zxhf5kheaEcYfOeD4H3IjAKBiL64y8/v3ZN1vVVRw6NY
	x0ZPrXoUDrNtIjYlhvfwR9u/1d8Rn+T24p5zaPtJWwfVf6JNEnml9fKvbDPMNhFw5HubAaA+uq1QY
	p7meXxKqJUAwr62xJyY4NwavcLCufNGuhqwzgJzTDeUQ6+j909/h4LF2mZCMhiNs+ygnpl9ahlDLY
	DYEijo5r91TleOwjOeeal0mvvOC/q9rqUjqzFyzPJG8TtbLzbvVkM7c/XFBeJ1n+4KkiEG3pLr8y3
	w1CnDGR+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFn8a-0000Pn-MP; Sat, 27 Feb 2021 00:07:12 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFn8V-0000NP-BT
 for ath10k@lists.infradead.org; Sat, 27 Feb 2021 00:07:08 +0000
Received: by mail-il1-x131.google.com with SMTP id e7so9534261ile.7
 for <ath10k@lists.infradead.org>; Fri, 26 Feb 2021 16:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V/QgjySotsTTVdKM924dOYklYwsFMiK/ajNbbKthpHA=;
 b=gLHBNYEJB/sf0lZ4/ATW+Te0FFR47NHf7VvIgvncrWMDr5Ncc0RCGYGjoIHAF032oi
 JZBSvAxvwcy5o7uTFm1+5BqHSiF9W0SW1cjn/bXvhzUiDceQ3LeniAVFq6thAp81JvWu
 5ME9RGS1HUB9ZBRDkOe8pZE0R3lAGwRgLDfp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V/QgjySotsTTVdKM924dOYklYwsFMiK/ajNbbKthpHA=;
 b=B+QlqEZqtZPtbNi7eaZsgLfBN3biui25aNzH3/Y4oL+ihfSQTUQKMdykNrPmOTYF0D
 RQeD1sfxw7Cgum3CSvuMvVdvkZA83amh5UOm+ggdf8zapIVpvQvmy1QJyJLRr7K6k96u
 bjbhufAtMnvOVAiJtWpJ7MhE/9lSpARBnLLsNx8RydqB2dsHeJR/cuQJNNNGIWXAcqyY
 wAIX+Q4RssBTL4+Yg7Zo9923EtYa2mVn7dY6mz3ZydOEsLVqDH4f3NiR+xWF3cO3sQNT
 KlqL9k1vRmJO4YHJBQKPnliz8BMehCsrOTR4+AwnXdTzTQGFMX+BTGrqp2ZAq7LT1Gdt
 JTdA==
X-Gm-Message-State: AOAM533EmnN+U9fu2cwmnpAW/SApHm142tVEp50baB5Jt8kXyONWuGxQ
 D64U+XB8OhIpjz/nBe1R7r0R0g==
X-Google-Smtp-Source: ABdhPJyAon+ilh2FwUVc+YIJ6cSHG5ttF/eYAm9QraH2G+xx/rqg1Cg24nqYIM0+3ZcYRrFDVdxVAA==
X-Received: by 2002:a05:6e02:152f:: with SMTP id
 i15mr4713534ilu.277.1614384425759; 
 Fri, 26 Feb 2021 16:07:05 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id w16sm5228805ilh.35.2021.02.26.16.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 16:07:05 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org
Subject: [PATCH v3 2/3] lockdep: add lockdep lock state defines
Date: Fri, 26 Feb 2021 17:06:59 -0700
Message-Id: <55548ba63a7e1b9f17cfc50370dcedefc9d5dd9f.1614383025.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1614383025.git.skhan@linuxfoundation.org>
References: <cover.1614383025.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_190707_513134_0ECC4EFD 
X-CRM114-Status: GOOD (  14.82  )
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

Adds defines for lock state returns from lock_is_held_type() based on
Johannes Berg's suggestions as it make it easier to read and maintain
the lock states. These are defines and a enum to avoid changes to
lock_is_held_type() and lockdep_is_held() return types.

Updates to lock_is_held_type() and  __lock_is_held() to use the new
defines.

Link: https://lore.kernel.org/lkml/37a29c383bff2fb1605241ee6c7c9be3784fb3c6.1613171185.git.skhan@linuxfoundation.org/
Link: https://lore.kernel.org/linux-wireless/871rdmu9z9.fsf@codeaurora.org/
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 include/linux/lockdep.h  | 11 +++++++++--
 kernel/locking/lockdep.c | 11 ++++++-----
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index dbd9ea846b36..17805aac0e85 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -268,6 +268,11 @@ extern void lock_acquire(struct lockdep_map *lock, unsigned int subclass,
 
 extern void lock_release(struct lockdep_map *lock, unsigned long ip);
 
+/* lock_is_held_type() returns */
+#define LOCK_STATE_UNKNOWN	-1
+#define LOCK_STATE_NOT_HELD	0
+#define LOCK_STATE_HELD		1
+
 /*
  * Same "read" as for lock_acquire(), except -1 means any.
  */
@@ -302,11 +307,13 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
 #define lockdep_depth(tsk)	(debug_locks ? (tsk)->lockdep_depth : 0)
 
 #define lockdep_assert_held(l)	do {					\
-		WARN_ON(debug_locks && lockdep_is_held(l) == 0);	\
+		WARN_ON(debug_locks &&					\
+			lockdep_is_held(l) == LOCK_STATE_NOT_HELD);	\
 	} while (0)
 
 #define lockdep_assert_not_held(l)	do {				\
-		WARN_ON(debug_locks && lockdep_is_held(l) == 1);	\
+		WARN_ON(debug_locks &&					\
+			lockdep_is_held(l) == LOCK_STATE_HELD);		\
 	} while (0)
 
 #define lockdep_assert_held_write(l)	do {			\
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 818d0ceed3eb..f5a8200f24f1 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -54,6 +54,7 @@
 #include <linux/nmi.h>
 #include <linux/rcupdate.h>
 #include <linux/kprobes.h>
+#include <linux/lockdep.h>
 
 #include <asm/sections.h>
 
@@ -5252,13 +5253,13 @@ int __lock_is_held(const struct lockdep_map *lock, int read)
 
 		if (match_held_lock(hlock, lock)) {
 			if (read == -1 || hlock->read == read)
-				return 1;
+				return LOCK_STATE_HELD;
 
-			return 0;
+			return LOCK_STATE_NOT_HELD;
 		}
 	}
 
-	return 0;
+	return LOCK_STATE_NOT_HELD;
 }
 
 static struct pin_cookie __lock_pin_lock(struct lockdep_map *lock)
@@ -5537,14 +5538,14 @@ EXPORT_SYMBOL_GPL(lock_release);
 noinstr int lock_is_held_type(const struct lockdep_map *lock, int read)
 {
 	unsigned long flags;
-	int ret = 0;
+	int ret = LOCK_STATE_NOT_HELD;
 
 	/*
 	 * avoid false negative lockdep_assert_held() and
 	 * lockdep_assert_not_held()
 	 */
 	if (unlikely(!lockdep_enabled()))
-		return -1;
+		return LOCK_STATE_UNKNOWN;
 
 	raw_local_irq_save(flags);
 	check_flags(flags);
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
