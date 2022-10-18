Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BA7C433FE
	for <ath10k@archiver.kernel.org>; Tue, 18 Oct 2022 11:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8YH4ZbOZa0bONKBq3TuD9vmoFOE3heCCsANxQW3M14E=; b=e7hS6Fuz2MCVuH
	phCIVciizAw1fdrnDYcik4fEInxUM7OnhcL9b5eaBRyeZa2k+OnAUv5qU5IueSTgdzyjLA7Nie19k
	UPc0qAXzvdVIUzambNsfhtB9sfYtPCICaF/KZhqw2nmg91vdV4GLo6Vqz7nsea9hLyUmJQIoK+v7m
	IgAegU2qOlu69+fqReH7yn4MSBu9pTGWZfhP7lpMJP5oz94bTxNm8a5UIJMkDX36h/1Ac974+cTXE
	nyMJ3DsXmmqpid3/KRMCAb1UJvtFfFVN+cUOR9K7rr1i7dooLLLj9yD0f0OuuL4XDJx/MmlFlZkl5
	yWB7yTpphkDh8mAo38tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okkUU-00625J-S3; Tue, 18 Oct 2022 11:10:34 +0000
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okkUR-00622H-4y
	for ath10k@lists.infradead.org; Tue, 18 Oct 2022 11:10:32 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id 1A3E52B06811;
	Tue, 18 Oct 2022 07:10:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 18 Oct 2022 07:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666091422; x=1666098622; bh=U8wpPQWEh5
	8ZbN0yR3/VZpUrmJoyEuxzqpuZ/EhtzXw=; b=FPpwZhiUWWOv/PCuTy9vUJC9m2
	y4kcMr1P+uImmYjI46Xv92ahLFs8sL+43+uu+mQQDAlnwN++4Z+jlgv2JE+Tdnth
	57MgL3yzSKmTpdrCOe3jGSD3n64UuzXsEFVEKpcDvrG00w4TAwUgVcJ7bz11U99n
	zlqng7wZxojKWmfeXk5m4x+xN/F9eTr1Rsj4L1vDLAdTtYWIdCNhN6Yj8GvLQzWa
	Js/GfNKvRDpYwXt60W+bRsT4F6giIhIjBl/qd1mVKd2fVB9B1Q0GDdPfV+L+U50c
	42QWmLlXK4yZqL6D4C63EQySC/MN1RO+yRLB153bwyNjfT+coTICwFV913Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666091422; x=1666098622; bh=U8wpPQWEh58ZbN0yR3/VZpUrmJoy
	EuxzqpuZ/EhtzXw=; b=VZd/2vakzilt25m9+TVR49pb6cHZGnpEUDgXmg/uKH1S
	ezkNAa1xc4jfe0EASTLeFN8LavMgRgOrFcp4ivE4UY1AxI8uXwE+YmQYJM5FdQJA
	0zn5bXRIdgELqCXxEu20ZfhNbYNWZ4M88Zl4sep9w1bkK+nsJ5tMDLwlqhlHr+y+
	mZ7tkc8KlOh6K2Kj0yhRwrj5NDBi5mDBBGCs4cVz4SgLA9hTqO2Rp/gusFDrlhPA
	/I+TV1yfX1XB9e3jLg22edufBn+N1oYVBaNYW21KAz736Ggv/lsn3D1WPHst3aKc
	zLFAne1x3g83NLEU3ul7qdnZglOLV397AqYkLKQLTw==
X-ME-Sender: <xms:nolOY0F7JerDoGIsAmBfxKtLGb2lMYPC8nuTgwVtSpgIyIdWVp59gw>
    <xme:nolOY9X8k6RJyT4e6Clli2fd7AsGSmz6s25Uu96PNyJGwXUds0Uq8-kR6oYYFNb2X
    VQvr-s0ZgUGTA>
X-ME-Received: <xmr:nolOY-Jc5skPz9_8BOH24AnoMMaj-sQw6trDVGMo_8X6m7GJSj16ygWNJvrRtEf-GMdO4WzJONzJ9cbzhomnNNOhiUYL7odu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelvddgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:nolOY2EExM93ZvaD_0AIHeIYbHSXWgXx7dG8BzN2Vndw_Su6Wr6ktw>
    <xmx:nolOY6XHFPaCYLD01gF-rJ6vByk2WR_7xZfjErZEyEWN1zyRCldPww>
    <xmx:nolOY5PbORWxwcMFXp5ILYkgl8d0QxAiVBRNsZl_L75-yHIfg-29wg>
    <xmx:nolOY9rhQTer_LEwQrjfdRJwEsx99Y8oYxhepeYW1Ft3NYnZOY-DWHbBtAM>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Oct 2022 07:10:22 -0400 (EDT)
Date: Tue, 18 Oct 2022 13:10:18 +0200
From: Greg KH <greg@kroah.com>
To: Pavel Machek <pavel@denx.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Wen Gong <quic_wgong@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>, kvalo@kernel.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 4.19 16/25] wifi: ath10k: reset pointer after
 memory free to avoid potential use-after-free
Message-ID: <Y06JmkTYlD1qSkvz@kroah.com>
References: <20221009222436.1219411-1-sashal@kernel.org>
 <20221009222436.1219411-16-sashal@kernel.org>
 <20221018095356.GH1264@duo.ucw.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221018095356.GH1264@duo.ucw.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_041031_474399_9D52C3ED 
X-CRM114-Status: GOOD (  15.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Tue, Oct 18, 2022 at 11:53:56AM +0200, Pavel Machek wrote:
> Hi!
> 
> > From: Wen Gong <quic_wgong@quicinc.com>
> > 
> > [ Upstream commit 1e1cb8e0b73e6f39a9d4a7a15d940b1265387eb5 ]
> > 
> > When running suspend test, kernel crash happened in ath10k, and it is
> > fixed by commit b72a4aff947b ("ath10k: skip ath10k_halt during suspend
> > for driver state RESTARTING").
> > 
> > Currently the crash is fixed, but as a common code style, it is better
> > to set the pointer to NULL after memory is free.
> > 
> > This is to address the code style and it will avoid potential bug of
> > use-after-free.
> 
> We don't have this patch in 4.19:
> 
> b72a4aff947b ("ath10k: skip ath10k_halt during suspend for driver state RESTARTING").
> 
> We probably should take that one, as this may depend on it. On the
> other hand, we don't need this one as it is just a cleanup...

I've dropped this from all queues now, thanks.

greg k-h

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
