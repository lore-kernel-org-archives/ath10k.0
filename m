Return-Path: <SRS0=xh5s=H4=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20770C433E0
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 17:53:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9D5264F17
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 17:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9D5264F17
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k3XlSVXVHxXJKGit91AzHI9NdSeRaOY2hVJfsowXGXU=; b=F1yO+/nsX2mCY9FTPip6USpoo
	nk8LKThmupkOV1QW5rWgFqeivQ2Dd7hGGBGlCcqVdL1XTl2IkC7fc1Bhaa0jFI80l7i2vY5H8EIP1
	duJmMk6x5yUGQGRrXfYX1WTreU3sPF2wiztLpRkywMkudjBBr3azwCK023gcT5SY0vYwiiDDdhQUW
	WWtcm8s51gy6LQTsgi7UnJoEcfWSNubmP5WgI6HhTssQhNeL4GVpTHUzkKpSDzr1WkFxdESLTtpVH
	kfQepxtnFwIvfomq048iffvTb4c9+nR70PcXGE1SF5/+iP76WDOaJZzs+/7iZVHG37pc9CFuEbpT3
	T652w/15g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFhHw-00012y-AC; Fri, 26 Feb 2021 17:52:28 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFhHq-0000zc-NN
 for ath10k@lists.infradead.org; Fri, 26 Feb 2021 17:52:25 +0000
Received: by mail-io1-xd33.google.com with SMTP id g27so9127967iox.2
 for <ath10k@lists.infradead.org>; Fri, 26 Feb 2021 09:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yytI7x7nMwQqYfkH8zJk8MWsbajZm7+7KB4c/JWojUI=;
 b=AFIgbIR9M1LUoj6H3z378i+R7QUdBO3CwFoWO44Dx08yOT0wGXel220fIR+hJZ9bC5
 qhTaPNWmINhWlJDPNGmD3tn2Dy+m2DB4wl7DnYLCKPjmGJBk4X+F7WdaV00KhPSZeVOW
 4OXK8iZYoHlSc9Z+QLSm0BfI+yujpjqT4QNJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yytI7x7nMwQqYfkH8zJk8MWsbajZm7+7KB4c/JWojUI=;
 b=rN8uJg6TNBAyyEkbMr/CQ5uJ+DQIfZWSCWRnq8tWeoMGGsPrlWvL1ZhsyNMOjI3vDg
 Mzndu/yTfpVN5VSPlGr3wosaEbGwRwcNXNiDvhsFQB7q2GkY48YA8Vv+xuQpmLgjKB5m
 WGddre3eS2jUK0HgX8gqm3l6+4PlZjdaqm3gbxsHA6FDa8+zBHVgjXuXgf8YNJIeN4o3
 4/Z66eES244+gZ96NCb9gUapGwbO8CKMWpI8N4F7MEXooabexGQ5K+/9bxF3dQFax831
 zQJys4DPTQ4vuWJ6RqW7zm4Onj9ab1ww66enPoBnja6BP1pz7jY9o4FuLWP17sANmkMU
 kAGw==
X-Gm-Message-State: AOAM531z6f4iE/K5Fo4KdJY+yh8RbGqY9iTq4T1HU7yodWCiMF7hn7AJ
 qF+g4EuqXC53O1XMNudWs/xV5Q==
X-Google-Smtp-Source: ABdhPJzDvP35cqoe+MlNhyNJMg/N0vt8re7YhfzdHlkeva41movmV4gDLh1tDN7Jsfz/AJTW9RmZeA==
X-Received: by 2002:a5e:8f0a:: with SMTP id c10mr3842450iok.192.1614361940631; 
 Fri, 26 Feb 2021 09:52:20 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id y25sm5594060ioa.5.2021.02.26.09.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 09:52:20 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org
Subject: [PATCH v2 3/3] ath10k: detect conf_mutex held ath10k_drain_tx() calls
Date: Fri, 26 Feb 2021 10:52:15 -0700
Message-Id: <38eef822d97917db50068eb65eb71ae3b83eb43e.1614355914.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1614355914.git.skhan@linuxfoundation.org>
References: <cover.1614355914.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_125222_789877_570D445D 
X-CRM114-Status: GOOD (  12.40  )
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

Link: https://lore.kernel.org/lkml/37a29c383bff2fb1605241ee6c7c9be3784fb3c6.1613171185.git.skhan@linuxfoundation.org/
Link: https://lore.kernel.org/linux-wireless/871rdmu9z9.fsf@codeaurora.org/
Acked-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 7d98250380ec..a595ff4f0843 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4567,6 +4567,8 @@ static void ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
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
