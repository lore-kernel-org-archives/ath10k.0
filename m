Return-Path: <SRS0=7R0v=HO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59521C433E9
	for <ath10k@archiver.kernel.org>; Fri, 12 Feb 2021 23:29:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12E3A64DE9
	for <ath10k@archiver.kernel.org>; Fri, 12 Feb 2021 23:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12E3A64DE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8eCLaAOgu86ahs45agaqSXm5mCXek1+u4gqgehIfPkU=; b=AHOk5JKr4EL4puKiPKSnF63nK
	3GHOgqsYT/iwCysRDeZGhe+/GLC7qvod72sV89whzCFsHWbRPist/Co0gKSmz2dL2yqBkMJqJi1Cq
	V8NK5dUanD+6LtVIoCovADcdp2sKk4+hdxDZIqWxE/vfxyfHjJ7gNcg4qKXiu0E9ZWT9f2PRQ1Zy6
	VZiWRzLcURAeXeN6P5u7P0U8BmfcnGOa2BfezQ32vvhsoq9D+SpZh9+CJuUG7OdHNvSTZfTkGOAsr
	thdXB5ZoOkIp7CSR0QrWjILtVAUHpUkqjm4mEqYyrPocUS3Vxdm4zN/J8b3ML22lYMHqHkiKJtbUT
	x4qYqYeiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAhrr-0003nr-Bm; Fri, 12 Feb 2021 23:28:55 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAhro-0003lZ-BZ
 for ath10k@lists.infradead.org; Fri, 12 Feb 2021 23:28:53 +0000
Received: by mail-il1-x12f.google.com with SMTP id a16so731920ilq.5
 for <ath10k@lists.infradead.org>; Fri, 12 Feb 2021 15:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1wSxvbwUEoDssegEiDIXApZTFvBALKvAL8rqFJ8yZX4=;
 b=DFRS+WXDEc4iZ1ShbpQsHajWLBQKVvhfTN3u7g1O6dJyUV896yDZDOQmFgj9e+KLLS
 34AzYt97lc7Q2hdk4LuOMiCliCRp9ErMbytM4JhkKn2DVY3puRy23XwIdfvFzPlnGIZw
 vCB8+jHiHVwhkDw6Zkvtt0NYFMf1SYbPk5+04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1wSxvbwUEoDssegEiDIXApZTFvBALKvAL8rqFJ8yZX4=;
 b=KcgvF+K8odIWFREkIezB7hw10YhWW8EOuX2C3VNOcFbhkFrTbTZmx70qE2Qt4pnnrO
 boJRh98pSV/cjuKAbUikZlFQAEIOv6ISJOGcsTNN5WFN9LKqbJQ+Vsahns7wJzYkFLXC
 +7ZIueqJ02ADBpQtpM6dK/8lVLVM1WPvpZJf6Cw64Z7tUhtoOBQK1a1GLtQ0Tg1vyZNd
 Q4mUWWXuIsscyS9NGkV1Fzjt5Iz+uK7oJZWCzL7EEsdyFtJEgPmFJ8guNg7y4cdJLaAe
 JNTuuMfN6i6GR0dBqkkNq3uK7BwbUKKdJS0z5gJezM7Jau463Z60CEZP32V6nRwpwdAX
 zh5g==
X-Gm-Message-State: AOAM533Gyejx90hsh5xBlgefcPDVgjaHBn9cw64Qj50RSCcFov7bWbV6
 RG6REwBGO389hoF7MiLO0fiYtQ==
X-Google-Smtp-Source: ABdhPJxRKCYNptgNLxveP5apbElOd/18CigXfgCySvTQBKH9f6qS/GXTzMlOyyP5wPkJP62xH336qw==
X-Received: by 2002:a05:6e02:4c9:: with SMTP id
 f9mr4232513ils.186.1613172528970; 
 Fri, 12 Feb 2021 15:28:48 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id i20sm5180328ilc.2.2021.02.12.15.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 15:28:48 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org
Subject: [PATCH 1/2] lockdep: add lockdep_assert_not_held()
Date: Fri, 12 Feb 2021 16:28:42 -0700
Message-Id: <37a29c383bff2fb1605241ee6c7c9be3784fb3c6.1613171185.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1613171185.git.skhan@linuxfoundation.org>
References: <cover.1613171185.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_182852_431983_730835C9 
X-CRM114-Status: GOOD (  13.14  )
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

Some kernel functions must not be called holding a specific lock. Doing
so could lead to locking problems. Currently these routines call
lock_is_held() to check for lock hold followed by WARN_ON.

Adding a common lockdep interface will help reduce the duplication of this
logic in the rest of the kernel.

Add lockdep_assert_not_held() to be used in these functions to detect
incorrect calls while holding a lock.

lockdep_assert_not_held() provides the opposite functionality of
lockdep_assert_held() which is used to assert calls that require
holding a specific lock.

The need for lockdep_assert_not_held() came up in a discussion on
ath10k patch. ath10k_drain_tx() and i915_vma_pin_ww() are examples
of functions that can use lockdep_assert_not_held().

Link: https://lore.kernel.org/linux-wireless/871rdmu9z9.fsf@codeaurora.org/
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 include/linux/lockdep.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index b9e9adec73e8..567e3a1a27ce 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -294,6 +294,10 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
 
 #define lockdep_depth(tsk)	(debug_locks ? (tsk)->lockdep_depth : 0)
 
+#define lockdep_assert_not_held(l)	do {			\
+		WARN_ON(debug_locks && lockdep_is_held(l));	\
+	} while (0)
+
 #define lockdep_assert_held(l)	do {				\
 		WARN_ON(debug_locks && !lockdep_is_held(l));	\
 	} while (0)
@@ -383,8 +387,9 @@ extern int lock_is_held(const void *);
 extern int lockdep_is_held(const void *);
 #define lockdep_is_held_type(l, r)		(1)
 
+#define lockdep_assert_not_held(l)		do { (void)(l); } while (0)
 #define lockdep_assert_held(l)			do { (void)(l); } while (0)
-#define lockdep_assert_held_write(l)	do { (void)(l); } while (0)
+#define lockdep_assert_held_write(l)		do { (void)(l); } while (0)
 #define lockdep_assert_held_read(l)		do { (void)(l); } while (0)
 #define lockdep_assert_held_once(l)		do { (void)(l); } while (0)
 
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
