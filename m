Return-Path: <SRS0=rz21=H5=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F956C433DB
	for <ath10k@archiver.kernel.org>; Sat, 27 Feb 2021 00:07:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C86E64F14
	for <ath10k@archiver.kernel.org>; Sat, 27 Feb 2021 00:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C86E64F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rpVICAzTrtquuhtgAHZGAxCxYeU0sYCh3w81vVgKJtM=; b=RuPnn4eaQx+BISQNxqGprZxb3A
	R/TeZFuiExfeu8ix+w7WS1ZqgVXRH7seTP9KyH0hvEaIrOTHD3fd3Sz7ftf5Pi0M6wZHfhkcqkgWy
	zZ5ZjPMFQ4dmh04vpBqUl3CnKyKFzYETnhX0TYMbw1k4rLSe0Dxkl1++QHFtEqNtQZbemtYQpe0li
	RayCV0OgfS+8UzfnjhU75qVIS58WEzPoW8TRC7rDed9K79TpwV2MaKY08usnm6ghUDmEmT5XGwm0C
	/nyy2XBHrmjs7zDt3ZPt0J/WdZmok9qwnQBc0UkzLZmHYHbTYVFI8gIVus6fYXYlH/lqJxvEDL/Gs
	65xCs/RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFn8Y-0000PQ-E7; Sat, 27 Feb 2021 00:07:10 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFn8T-0000Mi-7l
 for ath10k@lists.infradead.org; Sat, 27 Feb 2021 00:07:07 +0000
Received: by mail-il1-x129.google.com with SMTP id z18so9542071ile.9
 for <ath10k@lists.infradead.org>; Fri, 26 Feb 2021 16:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OSmlNKAH65bzlnQXsk21f+18mG93Ep8ybFIZEp9s10U=;
 b=Zb2vsPMYmiEqTdjWpz46Iy4Guw0uZfsmTR8lWFEGzTskhLkQtwu7rX8BTJ61kA9XZP
 4P/tjGg6FpU88o3v9O6XvZrGDP4NtyxelZCvZ9Eu98a9eXgj/MY0A+4uAodEbKaA+cWJ
 po9s6C9FB1Vr+WYeAzAbOnsyinTTfofwEpQag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OSmlNKAH65bzlnQXsk21f+18mG93Ep8ybFIZEp9s10U=;
 b=cdeSM/ks7TXelZTn0HY7eqSzr987bHwQK72Itu5Ydve7tPX9GQWviaF20fodOP6/a0
 Wiwtr6cL73M91j6pe1t9MHb6RpcXziuOaM5g/MA+0JQatdi2r/CgwhglzF2RXnwHp+dj
 Y9YdwBWvkstXfUJDJa2oAD5Soyr5vPljjXBlj5+tgk79MpHZd6ChOn/DZ4U38AKC+6B0
 qcgO6v51z4zqTPzl4AOT/jIbd6QSiMmGNqFpITDfa+kCoYNGm6f47c11LvzQxIiPCpnp
 qRbI3urp221xhHYUn/mAh568NgflSK5R96lj/ZNCzS5F5LBrbhjACwc2w+FbtsoOinWf
 dPbQ==
X-Gm-Message-State: AOAM533nlm2RjtlxJggu3fOhopxtoJYnXLyn7zZNUwxjyiTaUzwDRRHS
 jJXd/3xwHRIwxwwmiiuJddusgw==
X-Google-Smtp-Source: ABdhPJweVmTRywkMYBz2Qghux6InHjNKdPGIkkwPvC9/BRfhxBjqwSHM4Pnp6/Rz/easnQEPe+Li/w==
X-Received: by 2002:a92:4412:: with SMTP id r18mr4455803ila.170.1614384422849; 
 Fri, 26 Feb 2021 16:07:02 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id w16sm5228805ilh.35.2021.02.26.16.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 16:07:02 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org
Subject: [PATCH v3 0/3] Add lockdep_assert_not_held()
Date: Fri, 26 Feb 2021 17:06:57 -0700
Message-Id: <cover.1614383025.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_190706_134264_0540F683 
X-CRM114-Status: GOOD (  15.24  )
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

Link: https://lore.kernel.org/lkml/37a29c383bff2fb1605241ee6c7c9be3784fb3c6.1613171185.git.skhan@linuxfoundation.org/
Link: https://lore.kernel.org/linux-wireless/871rdmu9z9.fsf@codeaurora.org/

This patch series adds lockdep_assert_not_held() and uses it in the
second patch in ath10k_drain_tx() function.

Changes since v2:
-- Fixed coding style issues
-- Patch 2 uses new lock states in __lock_is_held() and
   lock_is_held_type

Patch 1 incorporates suggestions from Peter Zijlstra on v1 series
to avoid misfires when lockdep_off() is employed.

Patch 2 Johannes Berg's suggestions as it make it easier to read and
maintain the lock states. These are defines and a enum to avoid changes
to lock_is_held_type() and lockdep_is_held() return types.

Patch 2 is a separate patch because it adds defines to lockdep.h and
kernel/locking/lockdep.c now includes lockdep.h - decided make this
a separate patch just in case issues related to header dependencies
pop up. I can combine Patches 1&2 if that is preferred.

Patch 3 uses the new interface in ath10k_drain_tx() function. Added
Kalle Valo's Ack from v1 for this change.

Tested on the mainline from yesterday.

Shuah Khan (3):
  lockdep: add lockdep_assert_not_held()
  lockdep: add lockdep lock state defines
  ath10k: detect conf_mutex held ath10k_drain_tx() calls

 drivers/net/wireless/ath/ath10k/mac.c |  2 ++
 include/linux/lockdep.h               | 18 +++++++++++++++---
 kernel/locking/lockdep.c              | 15 ++++++++++-----
 3 files changed, 27 insertions(+), 8 deletions(-)

-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
