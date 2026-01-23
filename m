Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA34DD74EF3
	for <ath10k@archiver.kernel.org>; Fri, 23 Jan 2026 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3tVMdOq+RRmPd7zkB4BscKVMh/SgbBpBunr6VSji3Qs=; b=VNc8PD0yC290JaTcYDhNjU0dLp
	NDbofQ0nnxZcF/SBDRGYQgm3ZXFa17xX7PknWkTbvu6XuAT0Ik4XmMthOvEWFZnX4fscoYFvqqGkx
	jenwgn6Eo64XZYp3nqgOYGKsM61CqQDm89ZA9pkycJqpLHbwF8tM3fB3ldc/k8GYzogLyXNUxcmq0
	OVjRWeNe2xzn1UMghgitcmdtyu+w6GwDb39OaiwSGHhjLndQgCehQsH3TcuqzeMCfV8c7qUMmT1Sg
	A5nWdlEvT3QR5Ye2KmDG6aEEsTIc2V6MmgmFmw75h4/8rkKtVnBg1vK/l1vyH31OAvgv8PuRQwfJy
	wsRbmxsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJca-000000098kJ-0Ntj;
	Fri, 23 Jan 2026 16:02:52 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJcX-000000098jy-362C
	for ath10k@lists.infradead.org;
	Fri, 23 Jan 2026 16:02:51 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-459ac606f0bso1651825b6e.0
        for <ath10k@lists.infradead.org>; Fri, 23 Jan 2026 08:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1769184168; x=1769788968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3tVMdOq+RRmPd7zkB4BscKVMh/SgbBpBunr6VSji3Qs=;
        b=Ew1R7YIDI1I0y76r3Dlur5intH/hZUbqxkLL3kYMYGl/leAfNwTllTIuy5fBBY1aCo
         OqRPSIrEi63LHCDC3R/fo9Yoj0txC2A5A20ukvPBbD98k7WtHLrey2jx9OU068fMoO14
         Wuo/F3IizL1hhWfRcDt7YQT++l4D7ATRga29CoHM9EkwhBfe9PV7QMu7vbHwEPccJr6S
         yx1augDgmTpYLbWXceiUu/5paUVnjKPl6gGrsHhNVr1l4//9s3jx9e5prwYTA8JRnBGq
         psWyGgplVGi+HmoWBPgu2NXo/VE1dFQV3If5aqMdFqYuy5IM4WJ9rj0VDiMKaDY0Fu9N
         5E+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769184168; x=1769788968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tVMdOq+RRmPd7zkB4BscKVMh/SgbBpBunr6VSji3Qs=;
        b=H7AoSiaCeqpI4mP2f6yhoVc1JVZEROVmCQKNnnWgYevZvRNiQSgqjGpRRgS9tBplmf
         jpsaFt3bUgBG43xjr7ZiCeQGnD06VxgjiElSEZZ7JMVzyQwULjXISPu+Qs8K7NCWDy6C
         iBsLlqZeJG2OLeH6WhbcLV34n0Hgswrso8ReVTmIDJbekivsTJT6bdfOnHQjtjM0TcNr
         1+YmoUuph4YeXD8RliE+G7myh9N5jZwj/GNkHAYQE/x4ssKFRmXZaXqCw3vGvLZw572o
         ZSmvkOTXgJ4YAZKNc5AmMeKTUri0AluSDGKAD+XWqszsawKGS8AtBiwnN1R1JksigtS6
         mShQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqFlE2T+JQ9KlGNqWzBVxngEf4z+7bVI6bMsy1dYWgMgisw+VxU+xYPCiCyeqA7kh3CZ/vCxk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5zEyaRClKsejwKMMD+F4FbfiZiE+bUZpA/+lPDQMq9U3+B4Ki
	iP20zSptZ0yJcm0MmGgJmdihKBN7vUQS/WMhba7EAClZwda5GSiyUdj7Ij8y4x1m9bM=
X-Gm-Gg: AZuq6aKBglDa9VKSTw2avxu/+th18PizefJ9lebYvxEMHP80EeeWguNSEc8VeXLHO/+
	PrXtFvIMCrPQg2x6FDJBBbTlq0P5/iHFhMEi+DduCwRkRoW/RXW2tJUJJqrtFpbvuKzRPK3Y71A
	1bIw0OA1rxxxwjxhi9katawg2TB/VwDOMsjrNtXQmzKrhyboZwqdVbvygZPu3bIt73sb/k2FYAM
	RsdFsyOLykUVmSKMHtcKL1WR2aVIqhDFOTTC20Fcu9XT9JLMoh3Q+vRzpvFqJlJRZQ86gHKSayq
	KGbBNIauRpTxy4ZfChyOCtACuRM+9CyPd0juxbq9pauiwlXLFtnzN6vCcIGQahUwwOgurvjzEBa
	zNV/s/4U3JPoevXsiGTvOW5QzOArVtpO8iuaDqsIcxlf3AqWE+rNbiTVFN8uWEAczig5xHt1Y9G
	LQfArXT/L76HMyfUXPLVMDx6h/DSBoLhhWjEJzixVjK0RGorE3hMzxJ6j9DlYzodQF1yih/iC9v
	ogDWExOlTbyfbyOaHinO2NLKVt/uEw=
X-Received: by 2002:a05:6808:2226:b0:455:8b5b:c763 with SMTP id 5614622812f47-45eb1ec9619mr1597955b6e.67.1769184168229;
        Fri, 23 Jan 2026 08:02:48 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45eb42530e9sm1485317b6e.16.2026.01.23.08.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 08:02:47 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] wifi: ath10k: fix lock protection in ath10k_wmi_event_peer_sta_ps_state_chg()
Date: Fri, 23 Jan 2026 16:02:44 +0000
Message-Id: <20260123160244.262225-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_080250_026027_9B3DD0D0 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

ath10k_wmi_event_peer_sta_ps_state_chg() uses lockdep_assert_held() to
assert that ar->data_lock should be held by the caller, but neither
ath10k_wmi_10_2_op_rx() nor ath10k_wmi_10_4_op_rx() acquire this lock
before calling this function.

The field arsta->peer_ps_state is documented as protected by
ar->data_lock in core.h, and other accessors (ath10k_peer_ps_state_disable,
ath10k_dbg_sta_read_peer_ps_state) properly acquire this lock.

Add spin_lock_bh()/spin_unlock_bh() around the peer_ps_state update,
following the pattern used by other WMI event handlers in the driver.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index b4aad6604d6d..40259504927c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -5305,7 +5305,9 @@ ath10k_wmi_event_peer_sta_ps_state_chg(struct ath10k *ar, struct sk_buff *skb)
 	}
 
 	arsta = (struct ath10k_sta *)sta->drv_priv;
+	spin_lock_bh(&ar->data_lock);
 	arsta->peer_ps_state = __le32_to_cpu(ev->peer_ps_state);
+	spin_unlock_bh(&ar->data_lock);
 
 exit:
 	rcu_read_unlock();
-- 
2.34.1


