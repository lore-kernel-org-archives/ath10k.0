Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7F9E77197
	for <ath10k@archiver.kernel.org>; Thu,  9 Jan 2025 13:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9s4BIvIKq4yNbwBJEWaTczHqFsUmebiubwxHYrSeW1w=; b=O0dPxLqukxHvZmryGACEwGRsI8
	zqaO9iGcg+JahzQ6ouBYjgxxQouAJT74x2YAw8raEuny/mGFqiqA2MfE5dZiR/EszIFGuC+RLdsyr
	c4aLOP89tTQ0uqe7Rui1hdQvZxbVh2KEkKjRBk5tPxl64qa67Hscze2J2FoBNaWpI+HgNliUh6uOT
	aG8R2OO6wyrPAWx0NEOOLqENWmkH/P8jU/asevW8Bb/f076EjsQuXvsS40Q9FUJLiO2/lTeKIiLbr
	HbP0gUc0rhhddBrAX/t4M0lEmnX3K/Z2o2ba7XagtevQMmFO6Z0UgpLeB6nfOaBsjnLyZvxyXANmQ
	tHWv41bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsDj-0000000BwIm-2A2c;
	Thu, 09 Jan 2025 13:05:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsDg-0000000BwH1-42nW
	for ath10k@lists.infradead.org;
	Thu, 09 Jan 2025 13:05:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 947B1A41BAB;
	Thu,  9 Jan 2025 13:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1845C4CED2;
	Thu,  9 Jan 2025 13:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736427903;
	bh=nWmz63W1uAhpdYEaB77+TMv4CTNJnteVN4HUDYk5nZ8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OfrEku7Zpe3Ye5uB9yCX7USbrYiPRTdMgJEmagFPt7OhG+//bAUKoxBVN75YyneUH
	 FvcnbMntG7LXN3fMac8eBxbeDyqedlpNNy6NWwZlkFPhBQjwXPv5+iL/Qb9Fm1JwUa
	 CU2TfVzvarn4gZ0Kj4YPLqh++1r0Q7FhCBVK6SsKU8MiHJvIHZeZhqz0EhSxCP3r6i
	 B9zqOes8UbqUTC1dUcdH3ykm9GZJg2g+7xjZVmjmyNLNyjECa2qdLseHD6Omm+pZar
	 OcMl3M4URF/Enf8ov+/yuakGqob2jA+PRO3mBNVscfblek7HcPyDyaPx7OfaTdN2st
	 OSJg8+4nw87rw==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <jjohnson@kernel.org>,  ath10k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  lvc-project@linuxtesting.org
Subject: Re: [PATCH] wifi: ath10k: perform buffer size check in
 ath10k_wow_convert_8023_to_80211()
References: <20241225124710.91238-1-dmantipov@yandex.ru>
Date: Thu, 09 Jan 2025 15:05:00 +0200
In-Reply-To: <20241225124710.91238-1-dmantipov@yandex.ru> (Dmitry Antipov's
	message of "Wed, 25 Dec 2024 15:47:10 +0300")
Message-ID: <87h668dtoj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_050505_068871_215C54CA 
X-CRM114-Status: GOOD (  10.57  )
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

Dmitry Antipov <dmantipov@yandex.ru> writes:

> Looking through the following:
>
> -> ath10k_vif_wow_set_wakeups()
>    -> ath10k_wow_convert_8023_to_80211()
>       ...
>       memcpy(..., ..., pattern_len);                    [1]
>       ...
>    <- ...
>    if (WARN_ON(...packet_len > WOW_MAX_PATTERN_SIZE))   [2]
>       ...
>
> I've found that [2] makes no sense after [1]. I.e. check for possible
> buffer overflow should be performed prior to touching both 'pattern' and
> 'mask' buffers with 'memcpy()' in 'ath10k_wow_convert_8023_to_80211()'.
> Compile tested only.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

This code path should be tested on a real device, can anyone help with
that?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

