Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD366C5320E
	for <ath10k@archiver.kernel.org>; Tue, 20 Aug 2024 09:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATI7yA+SyAA4xOgCm10fwYIkh9B1J32ILqTF/BvqlLg=; b=iCNhRuPziKD77PD0IT19da+kJt
	rEpYMLbVAcVO8bxiswuqlzWgUDR9VGGiNFD3wb9W+8DMrF79vWr4EybQyUeO7XU4v2rvINdSCZqv6
	FZMnt5v+NyLEYeBNh08tX/C6SAnPPeZIHgU0iIvBukcp9Ahr+TSSltdRXsVQXIgLksRJBodAmxyOz
	wDVFWhy44QXI8mMEdD5Nt6SxRaJWwMRuK6bra9XxKXEFTJgrPOx0Q0DkqFp9TA67jylVU3l5OL7kg
	6cyd76dlBQTvXONIaGRLjsxffVTe8QGk8lXhwyWy0yH0ZD0PrwfahLpBLLEV2e0+DEmZkDzvxSdy+
	5+MnxRqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgL0n-00000004X0X-4A7Q;
	Tue, 20 Aug 2024 09:18:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKyF-00000004W6I-11eq
	for ath10k@lists.infradead.org;
	Tue, 20 Aug 2024 09:16:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8E9BFCE0A55;
	Tue, 20 Aug 2024 09:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C6FC4AF0F;
	Tue, 20 Aug 2024 09:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724145363;
	bh=liphyp34I6kdWmIsgAkn4GACV00Rz+17SCAxoo3lMzA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=dNZLm1NyFssxY9S1dcKbXrjuruJwhobL6C4kcu6HO93R6PTEFj7sMBqXLXjfi0cY5
	 vAtir9reepdmOIsdG0VFoyFZJqww7+BYSEDWf3rjKb9fbpDsG7N1w42/bT4o5HTpfo
	 Qk+LEvSZV8yYd9pANaqMZMNcZ9ZrSOjxXJL552L/kJE1o6gQQPx+x8Tp+j2g/2xoAn
	 300Eedj9ZV8m6mYF237vXYnCOR3C91zzrXIq4JIEp/PLcFdcHPe7ORobOAbvdPx4LS
	 3mOBE13aUlUwSBQYdJ8Rqgjdt05e2C4aSROAb7sXPRodw5nJRUCdXAYt/hkjtJ+4kI
	 L1jEq/p2UCcKw==
From: Kalle Valo <kvalo@kernel.org>
To: Riku Voipio <riku.voipio@iki.fi>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k usb support status
References: <010201916e974ab7-0dee7485-07f9-458f-a0e8-d49e8e756a44-000000@eu-west-1.amazonses.com>
Date: Tue, 20 Aug 2024 12:16:00 +0300
In-Reply-To: <010201916e974ab7-0dee7485-07f9-458f-a0e8-d49e8e756a44-000000@eu-west-1.amazonses.com>
	(Riku Voipio's message of "Tue, 20 Aug 2024 07:01:34 +0000")
Message-ID: <87wmkbwo4v.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_021607_640200_DD6F3D7D 
X-CRM114-Status: UNSURE (   9.97  )
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

Moro,

Riku Voipio <riku.voipio@iki.fi> writes:

> I note drivers/net/wireless/ath/ath10k/usb.c comes with the warning:
>
>     /* TODO: remove this once USB support is fully implemented */
>     ath10k_warn(ar, "Warning: ath10k USB support is incomplete, don't expect anything to work!\n");
>
> Is this still the state?

The state USB support in ath10k is unclear for me and I have not
personally tested it for years, I would recommend not to use it for
anything serious.

> If so, Is there alternative USB-connected chipset with good mainline support?

It's best to ask this in linux-wireless list. But Realtek drivers have
seen a lot of development recently and they do have USB devices so that
is something to look at.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

