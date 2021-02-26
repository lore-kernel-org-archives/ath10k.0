Return-Path: <SRS0=xh5s=H4=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDF2C433E0
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 17:52:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6144C60241
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 17:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6144C60241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dRj+/jKCY31ggzh4vKNVLi1MVAnWjQVt557gU8O+Db4=; b=CSs5pnRxdz4avxszZ9Tp6UkM5
	PXJ0YEmb2B9MMTbjD8vzqj4JkITR7HjbfLp/9XnI6EeFDJ6IrYOS5le3asM9cvCBGfQoCjYYAVsLm
	A3XpKo/LO0Ti5orkGvu7p4CY7NBmq7UwP9jLGsHpVWP8NhxNE/v3VOsktDP4kDlzDGvDRCQXFg9WI
	GANku9LpW4rdLiJx98cvAs1nzoFyGN3hArtSC4k22e+eHPgvxn5XpkBjTef08KAP5Dlcv/ajyDc5m
	1sa6tHee6tLPpNAFI5feuxw+t0ZzpwA/ZA+j6lRWitPSNTjPZxuI2TpQ7YGi4VhJL6P+/SDvO+neD
	fVQ9CXpqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFhHw-00013D-Uf; Fri, 26 Feb 2021 17:52:28 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFhHr-0000za-Ag
 for ath10k@lists.infradead.org; Fri, 26 Feb 2021 17:52:25 +0000
Received: by mail-io1-xd2e.google.com with SMTP id s24so10491210iob.6
 for <ath10k@lists.infradead.org>; Fri, 26 Feb 2021 09:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RqKjcn5wYBxUDgGXla7FbQ8hvCQ5YPGkm8GvOW6PP/E=;
 b=RrvYZksgwaH67ZVRc4joOMms8r1OYTdoHXE2Z64g3k03EAqgOl+xfxRqrKdPLBQCqD
 9P2X5LJ7P1FLl26oNrdT/SZLMRs6Hh5JvPTRVmAf7HUgxz86AiUCdMNoqnOFVwGSor8F
 CQ2EJ2L/4UWf7DYLmegiVtOIJSan8XDN++IWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RqKjcn5wYBxUDgGXla7FbQ8hvCQ5YPGkm8GvOW6PP/E=;
 b=Ofu+eVi2MkIu1IzVxW+UfZnrH+cJwXHyQwQUea9t+cOmawSti8JEB2NG9HxQ3nAg2b
 BJxwhdb/sOsPCnp3VDxbeiQhCSz1E08e/G6XLRrXzblI75cAxVryAHJe4zhqHE42yN+m
 W5q2JTDCK7t6LIEYQ8XQ3wxu9XHe7B/nvu/5AGx6mdLsh/HfBfHHo9b9KCUfX0zgg4nn
 p6yiKc/+PGZHc7XpSsUZiOOjUT0YQGxIhbETapOcIQosy3upaElg/FVk6JZw2ULwkwP0
 IL+aiU1CbB2Cih0gnsBTErZTn0gzvsK73y3PyPruB3K1bek6aXlWhzsB8WepOrhDtq7d
 nzVA==
X-Gm-Message-State: AOAM5339uWfLgLYzml0Z7W25RaQrPo74mHRvSP5magXD8ZcaPlyZarZP
 y4/HjVB4SdIFIpicnK9fud3nJw==
X-Google-Smtp-Source: ABdhPJy91vIDGXJWk9N2yqhUo0q6PdFitbP4jcPN+5IeoXRVv4Hj7tj3DiojkGULgr5M10ZnMYY32w==
X-Received: by 2002:a6b:b5c2:: with SMTP id e185mr3784589iof.204.1614361939843; 
 Fri, 26 Feb 2021 09:52:19 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id y25sm5594060ioa.5.2021.02.26.09.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 09:52:19 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org
Subject: [PATCH v2 2/3] lockdep: add lockdep lock state defines
Date: Fri, 26 Feb 2021 10:52:14 -0700
Message-Id: <af1511df953fe49f95953cbc23d86fb7cdaff58d.1614355914.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1614355914.git.skhan@linuxfoundation.org>
References: <cover.1614355914.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_125223_437137_C69991A8 
X-CRM114-Status: GOOD (  12.68  )
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

Link: https://lore.kernel.org/lkml/37a29c383bff2fb1605241ee6c7c9be3784fb3c6.1613171185.git.skhan@linuxfoundation.org/
Link: https://lore.kernel.org/linux-wireless/871rdmu9z9.fsf@codeaurora.org/
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 include/linux/lockdep.h  | 11 +++++++++--
 kernel/locking/lockdep.c |  3 ++-
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 93eb5f797fc1..7c2622854152 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -261,6 +261,11 @@ extern void lock_acquire(struct lockdep_map *lock, unsigned int subclass,
 
 extern void lock_release(struct lockdep_map *lock, unsigned long ip);
 
+/* lock_is_held_type() returns */
+#define LOCK_STATE_UNKNOWN	-1
+#define LOCK_STATE_NOT_HELD	0
+#define LOCK_STATE_HELD		1
+
 /*
  * Same "read" as for lock_acquire(), except -1 means any.
  */
@@ -295,11 +300,13 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
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
index d3299fd85c4a..e3898c888ad2 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -54,6 +54,7 @@
 #include <linux/nmi.h>
 #include <linux/rcupdate.h>
 #include <linux/kprobes.h>
+#include <linux/lockdep.h>
 
 #include <asm/sections.h>
 
@@ -5475,7 +5476,7 @@ noinstr int lock_is_held_type(const struct lockdep_map *lock, int read)
 		/* avoid false negative lockdep_assert_not_held()
 		 * and lockdep_assert_held()
 		 */
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
