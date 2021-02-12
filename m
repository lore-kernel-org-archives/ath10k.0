Return-Path: <SRS0=7R0v=HO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E48A6C433E0
	for <ath10k@archiver.kernel.org>; Fri, 12 Feb 2021 23:29:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93CA764E02
	for <ath10k@archiver.kernel.org>; Fri, 12 Feb 2021 23:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93CA764E02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OOoTnwLqGjKSlTjIXqlr4d4n0bwSUuL5hSGF6ivigxo=; b=x82KEELD3msk+dPHfZzril08+s
	J6c4QHwqQ0updBPL4TUD4nZzlgFh9h8zJrd/QsDV4uXzsv0U3PlHqmF2tDPOhy5kDy95mOnSOo1F2
	hpjbIqfF/zZ6DCQAJbvk6tTOP1Uy8Jx1zeG6B8UHlhceyIGLKmPw0qtAhKUCRT6kt+zw54E+5RpGW
	Ix+uScyPA6UZo1qjGkmvHlkah2PkKWzJm9mrX6hpLcvbyn2W6AdiKlaI9ts8IdbzOKMCeU26VqmfM
	0qPjoNCDhlNZjBy9A4p+F4F0FsWkhRkYzQboxOqdmi9tJPQp9MjbErdB1uctW6vsekkFa8ltgT9sg
	55vHldjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAhrq-0003nY-E9; Fri, 12 Feb 2021 23:28:54 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAhrm-0003lE-Rd
 for ath10k@lists.infradead.org; Fri, 12 Feb 2021 23:28:52 +0000
Received: by mail-io1-xd31.google.com with SMTP id f6so924515ioz.5
 for <ath10k@lists.infradead.org>; Fri, 12 Feb 2021 15:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ly2pdmyYXxhtuoCSAgENg5OM8ycLhypf9tqgVFI+2u4=;
 b=Quwx0P+JxiRRGABjyX8i1pZUR+H9o5Hl34uy0BwJ7eFj4lvVU96Vykv/nM2Dydp3ML
 G/yDWtiOunz2xOr0YULsBP7PFBcOIt5N6bt2iOF78QXuanm0WPWyH/bvm4HAXhjJWllG
 nDCORLO4+L50RQF0iD9IeL2GARF74lzgtxyaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ly2pdmyYXxhtuoCSAgENg5OM8ycLhypf9tqgVFI+2u4=;
 b=jVRObYMOXgVYwrgiWUhfahKBsV0OO6DRlKaK+gixWKD+eCkgTVlzxxIMKnhns4cx+S
 dXO7lNliCaZ5JFc1YfAVOvky+X89Hkk/TcILjgudcR1q/aTCBQhAYTCCMvuB2VnCR4Gy
 0nzJEFryvPKxItNUImSX3/jrY/3CvqkQND4qxlrqLa02LGrMvUykJXzU0QqQpP1WSmfq
 qtHEMRV6Lk8outtAHzyGS2opYDloAVvBtmYlWIC6fd/B1itUC9aqsHp5OWgd9mdh27b9
 wWovObZJ08VA88PW80NIBR27mtamOIbgXxraCDZsOdJ88gcm+v/+e5WaT222pW+Wc0DH
 Cd7Q==
X-Gm-Message-State: AOAM530lew2iZjTCKYSz4Ec3VtrTyQiasj5n3Z8ZsYLy0nFBCOKe5Zby
 u2AY7cnRLr6MXyfa+GPuYVhckQ==
X-Google-Smtp-Source: ABdhPJx5/tVjrSIJi6dtsF0msO8kox5c0tpNk2scRoWwMHOQysCBrTJMjAFHSVV4uHQd7THpyBdRHA==
X-Received: by 2002:a02:9042:: with SMTP id y2mr4808243jaf.94.1613172526761;
 Fri, 12 Feb 2021 15:28:46 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id i20sm5180328ilc.2.2021.02.12.15.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 15:28:46 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org
Subject: [PATCH 0/2] Add lockdep_assert_not_held()
Date: Fri, 12 Feb 2021 16:28:41 -0700
Message-Id: <cover.1613171185.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_182851_040827_83D407A8 
X-CRM114-Status: GOOD (  11.50  )
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

This patch series adds lockdep_assert_not_held() and uses it in the
second patch in ath10k_drain_tx() function.

Shuah Khan (2):
  lockdep: add lockdep_assert_not_held()
  ath10k: detect conf_mutex held ath10k_drain_tx() calls

 drivers/net/wireless/ath/ath10k/mac.c | 2 ++
 include/linux/lockdep.h               | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
