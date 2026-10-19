Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B07606A31A
	for <ath10k@archiver.kernel.org>; Mon, 19 Oct 2026 22:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dHBH1poE;
	dkim=pass (2048-bit key, unprotected) header.d=nagashi.ma header.i=@nagashi.ma header.a=rsa-sha256 header.s=ggle-ngsma header.b=DVkFHjYU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REE29c8UBh0TXGI809b1Z+iw+yDqToJ7DYkOaz/LGnU=; b=dHBH1poEMNN3IU0eVrC0hXS7AL
	1AJecTJPPn1JM6QTtC/baqrA5Ivll0GiW8a+8+lJ4U3b5VRhGdU4WUNcsS5wlIPQRDdeBbyQukl8/
	CYa7IZlDQvt4F7PFNY3zDjAZbtTWDvh51p+E0PcMTogLL5XEl6Az2Ffs/xR98IIhAhWpwnJjWMd5J
	uJE9OKf+m5quLe7FENrDlaIFy5OArzn8ZMAk97Cn7sbSKmiahzje1v9G6Ptvwax8kjg0BDHfISQhO
	lzmtxELDEkHsWlrcy/JW32ErISofY33ao2wm2jMruwzo9+UsUadfMWcdh9WvaDuKqVoTPnHovEYN+
	bWPtcYag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIwHg-00000008Vnj-1Ocw;
	Mon, 19 Oct 2026 22:56:48 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIwHd-00000008Vn4-2KZP
	for ath10k@lists.infradead.org;
	Mon, 19 Oct 2026 22:56:46 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3543215a12.2
        for <ath10k@lists.infradead.org>; Mon, 19 Oct 2026 15:56:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792450603; cv=none;
        d=google.com; s=arc-20260327;
        b=h4ZNJrjAQN1hEtmU9T5+yrQym2bORflo6W/vYQkxlhuwZdC0ovC/OvriuatxhzjaKI
         W5T4Jqk6ASQxKarE8t9Ij/rT0Dz43w2ZrjOlwAk5VJNna3/QBt3o07khf/mCcDGvMPx2
         lcoW8MsvSEERp11kLz1uflFeiRrV17bsYP53xCaKQctxEFMSmqb/lKHcW0ycTtmtwt+G
         IeUWh/y6QJrga6NqeJNJRqwiTd9GJ+uxLYJcOgoQoA7A33UoDremYTiF27vjenE/1+ZQ
         f7d8zK0U5dIp6S4lSLO9oBGSuuWUH+X5NMzfm5JUGspcsht46kp64iJmc/cGm70We5JA
         lfWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=REE29c8UBh0TXGI809b1Z+iw+yDqToJ7DYkOaz/LGnU=;
        fh=dqQuGYeP4sJTsKzvo36enlvsR6BxFYIi7w31+DsbNvg=;
        b=fj8RXLNgKjC4XOda68PRT+CWmJZRp+AsQahCt6cX+qNycnLc9QBO/+0HBh4eRdlg+p
         wgvy5/SsvSgy9lPGvqSRkhuKm1zC8IUIi8bdCk+IDgcdBWi6q6VgEOwAtI98k1rQmfTj
         XPXyyF29NNyJ7PIUVT+HrQlzHYDtHsFMfYBYyxCSyhA8qEc/hwvBn9hzeNI3nq1OGm6a
         guY7vRumU/Cn5Ug2We1bhw6yQNbaNJw2qNuLnefnm+7abuEcfU3+jlsRH+jZ/40L66N+
         3N5Wyybb74GBVAgFFJSZU+UpanyEYo/m2PykTZ7ul4PE+YxKXbWKZ45MFppjl3uPyw/Q
         cidQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nagashi.ma; s=ggle-ngsma; t=1792450603; x=1793055403; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REE29c8UBh0TXGI809b1Z+iw+yDqToJ7DYkOaz/LGnU=;
        b=DVkFHjYU+fIIufM/u5eBJR+tKZHLs3UDSLXoZwSqQID6oahJfbxbQLUA7prd+Z7JGj
         MF+aNKnq3NogM4en/2zUtBQvzZG589A1dkcRpdcuBo09/p5A+OUFZ38PVypYpATMxC8N
         hbN/hSrYnbo2hSJ/olnTuA9NosjOg77BAkXv8wZxZ0HBbzbT5miW0Dz191KUAnGJoSJ5
         FeeM1SOBgAgcAcjxBVwgf5qIug3Oy+/yxMDYq4CfeflNXOiJAXsS53cV7eQ+7htRpNWd
         NShy0oalxt8XnrobnWiIhYWZ7O/2ZC6qnBLJWCa50PbpGydUoEdGax1l7fgaV8IbccBd
         G5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450603; x=1793055403;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=REE29c8UBh0TXGI809b1Z+iw+yDqToJ7DYkOaz/LGnU=;
        b=ON31JF4UiL3kNWWATlCQJA9fDYpliUDnI5VJmyR66n6Xlg9wriXEiSoN2QWHK36C0E
         e9Zk45mrW4ATC2qs0MZDeEHAzx1gyMVPnpLBP5P2EcciiZwoQ0/Gpd1RlMce8uJ32r//
         Gq+YOgo2MWZS23YiXtN+UOLdNEUqsNHpZK1wKVrBriw7QHpVtwikuhsTdgxhDQ3QIv7d
         QuJ81dJJYqgQWsz4+c4k9XUHTciJ7h4l9/L/UNge0IIHidimHXjxsNvREod5rlQZ6awY
         ZoT5dXEusJkWOtRXic/jSs+IRRWn0ah8jQuxqIxvraoUm1LgGX5eRx5N/5tcUwt3d8rm
         b1wA==
X-Forwarded-Encrypted: i=1; AKwUvBzXsjbeaHKoEjeyjRrUmsTLwmOylkyefJZEEZSy0tSCSQkaqLcFi0oCsPymwjpaBgrtNTIXQfU=@lists.infradead.org
X-Gm-Message-State: AFq9FYJH5P7eJof327FR2eOfVCdfF9zOjAqvx/0Z6JkPPJEyhdegsnqv
	aFAB6+aKoOy6kx5gRV3KOG9pFCdBqnANnI5QSUy4mSfm9HxO41up3hUJ+kp3zUtnPzW0ZdCSMgk
	u+/GuKLH3RTcZ3PYoHdRIZcygSD9DYsxqO8laCI6+
X-Gm-Gg: AYBFou0NNgB4ULBZMnPUi5hKj/Ejmx6TBMWGQ8PrpVbIpGyhfAQi6UCQZTfeOy1cxUi
	9lxEMD7b37pEVxyHec5BxtUODBZ1yIx73rFlUoa9wsjt5utd9qZ/8wjODTstRtdEiUDw7dAIQJA
	4rfmLMq2DN9tOtwret/+QrygPYn6ygo7qvw4iZIGVGZmm2eqEF+soJwqlzpP4brjSk4QfBaTYPD
	dxShi6DD6lVo3rwhdai/h/kjxm5b3PgSbMyVKg77MYwLNfWalKMeX6JGGyO/xBoAfzZ1nZ++nbo
	NbuCVVqRmI0yI83hYQrb9EK+Ej+1hTIJDq6t2DxvzzdxMoC67xEigjDgS4ai+lSXadaBoY52XI9
	TW0dga5758w==
X-Received: by 2002:a05:6402:4403:b0:6b1:e361:5550 with SMTP id
 4fb4d7f45d1cf-6b3a81657c1mr5897174a12.17.1792450603223; Mon, 19 Oct 2026
 15:56:43 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-3-c847697b3558@nagashi.ma> <61207966-c403-441d-9019-583702833a7f@gmail.com>
In-Reply-To: <61207966-c403-441d-9019-583702833a7f@gmail.com>
From: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>
Date: Tue, 20 Oct 2026 07:56:16 +0900
X-Gm-Features: AclHuK9QItXkR2B2Q98NX99AOaM5Tsth9CYzCO-Xtn0rwNKADE_0wzaV0-bDX4g
Message-ID: <CACB3TCKJN8ou4qa8BKJZYGgv1RRH0awt-eu07YRDwPkppuLQJg@mail.gmail.com>
Subject: Re: [PATCH ath-next 3/3] wifi: ath10k: bring down a station vdev that
 never came up
To: James Prestwood <prestwoj@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Heidelberg <david@ixit.cz>, Fabricio Akio <fabricioakio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_155645_637772_662F55E2 
X-CRM114-Status: GOOD (  21.18  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi James,

Sorry, I am resending this as plain text. My first reply went out as
HTML by mistake, so it did not reach the lists. James, you may get it
twice. Sorry for the noise.

On 10/19/26 6:12 AM, James Prestwood wrote:
> This seems similar to an issue we see on the QCA6174's. I don't see a 20
> second delay, but sometimes after an auth/assoc timeout we get a spam of
> failed connections with NL80211_TIMEOUT_UNSPECIFIED. I've mentioned this
> quite some time ago [1]. Do you think it has any relation to whats being
> fixed here?

Thanks for the pointer. I read both of your mails in that thread. I
can't say for sure, but I don't think it is the same problem. I only
have WCN3990 here, so this comes from comparing logs, not from a test
on QCA6174.

Why I think it is different:

- In our case the failed attempt gets to the Auth stage. mac80211
 hands the Auth frames to the driver ("send auth to ... (try 1/3)" in
 the kernel log), the firmware completes them with status "discard",
 and the attempt ends with "authentication with ... timed out". In
 your trace, the attempts that fail with NL80211_TIMEOUT_UNSPECIFIED
 never get that far: each one is a short scan by cfg80211 that finds
 nothing from the target BSS, and the first rdev_auth in the trace
 comes only after a scan that did find its BSS. That matches what you
 found in March, that the BSS was missing from the kernel's BSS list.

- During our hold, probe requests still go out on the air. Only the
 Auth frames on that vdev are held.

- Our hold always ran for about 20 s, and only on two newer WCN3990
 firmware builds (c10-00459 and c10-00236). An older build,
 WLAN.HL.2.0-01387, did not show it.

- The missing VDEV_DOWN goes back to commit 077efc8c42e8 (v3.19), so
 5.15 has the same path. If your problem started between 5.15 and
 6.2 on the same firmware, this path alone would not explain that.

- You also see it on ath11k, and this patch only changes ath10k.

There is one overlap: your first case starts with an association
timeout, which is one of the failures after which ath10k stops the
station vdev without a down. If you want to rule it out, the patch is
small. With it, a failed attempt gets a VDEV_DOWN after the VDEV_STOP
(ATH10K_DBG_MAC prints "mac vdev N down (never up)"). If the
NL80211_TIMEOUT_UNSPECIFIED runs still happen on QCA6174 with the
patch, it is something else.

On ath11k, only as a pointer: I have not tested anything there and
have no ath11k hardware, so this is from reading the code (ath-next)
only. ath11k looks the same. A station vdev is stopped with
WMI_VDEV_STOP in ath11k_mac_op_unassign_vif_chanctx(), or in
ath11k_mac_stop_vdev_early() at station removal on chips with
vdev_start_delay, and the only VDEV_DOWN for a station vdev is in
ath11k_bss_disassoc(). So a station vdev that never came up would be
stopped without a down there too. I don't know whether ath11k firmware
cares about that.

I worked through this together with Claude (AI). English is hard for
me, so the English was written with AI help. The WCN3990 results come
from my own device tests on my comma four.

Thanks,
Shunsuke

