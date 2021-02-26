Return-Path: <SRS0=xh5s=H4=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA1AC433E0
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 17:53:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A2AA64F17
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 17:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A2AA64F17
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uv3LCiGffn2XUKTEFSOJX3gbs+Uzx8IRAoo6pRj1nGQ=; b=jgnd/k0PM01YdzQdMdbBj20DCt
	80fRZqO2Q6+PwKpLD97vsDZx6LbJSmie0tWC4sRmyjgXYpjD7UWKH+hP5XUepUnRvvDYeH+RQhi8Y
	5WWHW+XpTchThyF5ONG42aE5GWMAWjWARAGGOWTAv7ztKi/tJiIlTX12JTXUe1WUjnJRSRWMYEhoV
	mwqEU2K2EjuHtndVVMZi+T9Uy49IGbQ0hwiIwWDq0P+YT9+dZiLINOP6vRGiI5idTj7YPNyuKBuXv
	iYq5a7m2c2AFOnWmIjx4TPeIyln4rkvKtSmItwd/+8d6vljyq2iwScREEwTO1iLCvl2Ag22T5PBS8
	7EbzZsDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFhHs-00011e-Hg; Fri, 26 Feb 2021 17:52:24 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFhHp-0000zU-Ve
 for ath10k@lists.infradead.org; Fri, 26 Feb 2021 17:52:23 +0000
Received: by mail-il1-x135.google.com with SMTP id h18so8721968ils.2
 for <ath10k@lists.infradead.org>; Fri, 26 Feb 2021 09:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dY88CmhEdqi8wt/ahIMuuDlu90hzE7DFVh5FsuKso0s=;
 b=GEozSIwSQMHght7BICfIen1ZuqO1Uu8LnD6oos4DAN9zjNzl+T9of+vQKxslcE2Bjl
 B+55kRiyHRj05v6DxQbsCcajyLUzb5WsFfKr2roMoSzknE6EsZ/a5Yc++mYmoMWZoxEj
 pCBOx2bG1l70JBbuNroc8ck/XWt9UWsOLppl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dY88CmhEdqi8wt/ahIMuuDlu90hzE7DFVh5FsuKso0s=;
 b=G+rdxITmlOUw/kHE7nAJiBIbua4balHN7CbJ3MNCRETSSde8YFOAWd7e45anoleXPD
 F+V159NE/hKyQuxMwsV2+JMdTEfUdMyveex68C5u1FDEAmAVIjMvxZ2jIEcGBhfr5JLp
 1OTdEB+JlonyQ05hcJy+c9vytdEy/ZERITue/xgTBtvjbcOU3c7X01slEmlnf+WLGi8w
 bLwNtB7PyKWBggt/2xVYdGMryG8BgpyUjZLHgycnTfRr9YrBCRXJeb4L0MZuv96us8DO
 ED5k4cI3e3ZpWcc3n7z/x4i9LvnXZ1E4uogBiZyBpRfQGbOIrm5kzXl4wc/FxHt4bKnI
 4FDw==
X-Gm-Message-State: AOAM531zh1dEwZfiXLPoGU/W2rhJF0C++Taa++gTOiPq42JouODhFWHo
 7SDK/skmRnL7/Gwssyq+fllUxA==
X-Google-Smtp-Source: ABdhPJyk6Fd7CHK3TK6ZvIe6aA/9gQV5HhrgT8cwxOjO3hwk/x87J2J5g+K3jvzjCy1GS3+/u9qmFg==
X-Received: by 2002:a05:6e02:881:: with SMTP id
 z1mr3371733ils.288.1614361938177; 
 Fri, 26 Feb 2021 09:52:18 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id y25sm5594060ioa.5.2021.02.26.09.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 09:52:17 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org
Subject: [PATCH v2 0/3] Add lockdep_assert_not_held()
Date: Fri, 26 Feb 2021 10:52:12 -0700
Message-Id: <cover.1614355914.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_125222_132762_FC1FAD16 
X-CRM114-Status: GOOD (  14.46  )
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
 kernel/locking/lockdep.c              |  6 +++++-
 3 files changed, 22 insertions(+), 4 deletions(-)

-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
