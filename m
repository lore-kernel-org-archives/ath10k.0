Return-Path: <SRS0=rz21=H5=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D167C433E9
	for <ath10k@archiver.kernel.org>; Sat, 27 Feb 2021 00:07:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2869C64F13
	for <ath10k@archiver.kernel.org>; Sat, 27 Feb 2021 00:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2869C64F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7wH66vNFVRBv74nxXGHdAn0aLlpvnDnpeczcq6dcgac=; b=2uRqhsAqCsE3uGmc3btjUg6va
	3BRKWkMPJsXYXBzkjfEin1Xu3aNrEA/QPAiwYnvT2uZ4jLdwU9zHR5hMeVb6xT1L5k1h0mKTYttzX
	7QTmg4sll9/g2Cox0GvddCenALgXirTRXNosf6PPF91G6UGBQeVFP5qRYUtLMucnenfXKnH2GysI1
	TJHO6ksKQxTaA1spxLWRkkWNOuSX9OUqTKz5nEBokK4Bol94LHNtC9tbw8GD9mMxOYhjWw+H2PRV5
	GxOBCkXhjSntj54mGrnfFD/KQeus/IkEqGd8NYpVzjHq15f9r6I9SBwxpb+jDyeAxCBRSL3tOrcFl
	NlUFnGP9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFn8Z-0000Pc-M1; Sat, 27 Feb 2021 00:07:11 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFn8U-0000Mr-8n
 for ath10k@lists.infradead.org; Sat, 27 Feb 2021 00:07:08 +0000
Received: by mail-io1-xd2b.google.com with SMTP id z13so11493858iox.8
 for <ath10k@lists.infradead.org>; Fri, 26 Feb 2021 16:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Zkk2haeiidsDP/ZwhF5BhqM9bPgv7fbdC7NxG6iRRw=;
 b=ZqyQCczX3RZW7Jszm8n6gTRjBH3oMoNrIOAtNYn3E0o4VlY0Ny9fXxmpeFdgAlUMRu
 o1cdHDYUKTpe1O+SoymyQ2X1REjAiQ0hlXiaEgQH8DCDxOvJfyRMSqKje5KJ71QhXVpe
 LlhlaZLTkZYMGTRJqaQBMUtC+NDbKFm0N4Qvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Zkk2haeiidsDP/ZwhF5BhqM9bPgv7fbdC7NxG6iRRw=;
 b=Hk7PyTNiaW/CNM0vsnidimskJ9qL/zRp+w41LYh3TOcNPz1NnTb23gX/6pKfghYvNZ
 VoTs1OzK7+bQ6wUlXtsC6/lQZKJXTt2FZMkkATHDqhr3Yr6Pxfe9ualKrF0TFjKPSKge
 6wRgqRPRXVyINIHz6fyVEXmzhAXXjcPNgFfWA+CeFJ5zASHEJt8raxXqetxL5Mt1CDtX
 F4njq+v5nfCKzPx+jV+8cGcBHNZtVY8vsW4vNKQo4tuD3hVO+pgCnQ0ax9WQN2iLJxFI
 Ryur3IQTaAmhCK6S0GonfTgsd3MaKx2eDHTAsVLwdaKckQi/fu7ddA/nBxxIsj1qr5vC
 vwMA==
X-Gm-Message-State: AOAM531M+8pxAi57Qpd8s/h4KgwkNtgmHrVRDG2+ZSG3rcIzzrv0i4QA
 +CC7DsAVwYWrVbEHHm7w0+xnAA==
X-Google-Smtp-Source: ABdhPJyKxa0J4mJ1Q3Us1nF3cWKJxJOJv3J6flPS+IR1ljgqemUo/UlwUf5R3XFcSZdCq19XPZPoZA==
X-Received: by 2002:a02:cc2a:: with SMTP id o10mr5563036jap.62.1614384424250; 
 Fri, 26 Feb 2021 16:07:04 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id w16sm5228805ilh.35.2021.02.26.16.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 16:07:03 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org
Subject: [PATCH v3 1/3] lockdep: add lockdep_assert_not_held()
Date: Fri, 26 Feb 2021 17:06:58 -0700
Message-Id: <c22a1c5ef8a7620dce02c26993b998777d432aac.1614383025.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1614383025.git.skhan@linuxfoundation.org>
References: <cover.1614383025.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_190706_352457_A72201E8 
X-CRM114-Status: GOOD (  14.72  )
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
 kernel/locking/lockdep.c |  6 +++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 7b7ebf2e28ec..dbd9ea846b36 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -301,8 +301,12 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
 
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
@@ -393,7 +397,8 @@ extern int lockdep_is_held(const void *);
 #define lockdep_is_held_type(l, r)		(1)
 
 #define lockdep_assert_held(l)			do { (void)(l); } while (0)
-#define lockdep_assert_held_write(l)	do { (void)(l); } while (0)
+#define lockdep_assert_not_held(l)		do { (void)(l); } while (0)
+#define lockdep_assert_held_write(l)		do { (void)(l); } while (0)
 #define lockdep_assert_held_read(l)		do { (void)(l); } while (0)
 #define lockdep_assert_held_once(l)		do { (void)(l); } while (0)
 
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c6d0c1dc6253..818d0ceed3eb 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -5539,8 +5539,12 @@ noinstr int lock_is_held_type(const struct lockdep_map *lock, int read)
 	unsigned long flags;
 	int ret = 0;
 
+	/*
+	 * avoid false negative lockdep_assert_held() and
+	 * lockdep_assert_not_held()
+	 */
 	if (unlikely(!lockdep_enabled()))
-		return 1; /* avoid false negative lockdep_assert_held() */
+		return -1;
 
 	raw_local_irq_save(flags);
 	check_flags(flags);
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
