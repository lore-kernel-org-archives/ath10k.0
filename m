Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FDBC47DD9
	for <ath10k@archiver.kernel.org>; Fri, 22 Mar 2024 15:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RKRFNoMapxI3JJylCmWQ23Hlyixg87XxgLdaz5wdsQ=; b=UGlySoXWeknrL6sYPKtYYi8I41
	qKyRl7shvqFRdEEiezK1KWawbR74bCrhclTvZ7PIl5RNvpG1nqRQNR9EbbVM7E1HG8A3t8f/Yy8RU
	0DYSEu/oJXzhaRCril6VzHvFCuJlb8ibYtN/N1EhjvcGJvtmTtnxVcumGU9agWcahhFyR6IutDZ+d
	5ae3dptRYVsJNQpyKHzx178m4DCOIzT4Z2S1cXOypynwB6OMyViimO8uMUb2UnUiI3aI54ySDHUm6
	hEiTSeGjU7K3Q7DrMRcGI4SPOkodX9VloBDpzzjL/VIqj2ENsE4wKxnU5u/qIknysDjfyxWKP9Vf8
	I29QTeXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rngkA-00000007k6I-0u9t;
	Fri, 22 Mar 2024 15:23:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rngk7-00000007k4M-3a2c
	for ath10k@lists.infradead.org;
	Fri, 22 Mar 2024 15:23:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96C1F61361;
	Fri, 22 Mar 2024 15:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE20C433F1;
	Fri, 22 Mar 2024 15:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711121018;
	bh=2jKs8iXhSIhZoCfrPfcc8CMFgCUmi/F0p3tI20DDC8s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=phXk55hei4tv1d33xGsvZp2FCn8mCM1trm3kDZfQZdICDrEPJDLhK13MkrfHTJ3F+
	 bgnkYMAXoZsVDL0KFaNrewQEizN9ZhjUIakwhcOqCu9h7AtLMmYPmstvKhReuXKU6A
	 PNYisq/fQ0BFHUMNi4Vt8/1EWLXcjYeasaFYl2FKLaDuaBJhEIiSuNGBMxfu13fovx
	 B/ul9ZNN5Buz40ja9e+w+KnF57OBIjoKx4QmjCgZLBwHhmQOkAp4hd8HYzf80xaoi3
	 ZhAFHXouRrw3NeaETACnYVW3/DkQqpnuW1+UuopVNDj4REwqeESiG0E0KfnEuvLu1a
	 A1jG1pzvo5rFg==
Date: Fri, 22 Mar 2024 08:23:36 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, keescook@chromium.org, "open
 list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, "open
 list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ath10k: allocate dummy net_device dynamically
Message-ID: <20240322082336.49f110cc@kernel.org>
In-Reply-To: <Zf2ceu2O47lLbKU3@gmail.com>
References: <20240319104754.2535294-1-leitao@debian.org>
	<9fcdb857-da62-4832-ae11-043fe993e4ad@quicinc.com>
	<20240321072821.59f56757@kernel.org>
	<5039256c-03eb-4cda-8d11-49e4561cf1ef@quicinc.com>
	<20240321151744.246ce2d0@kernel.org>
	<Zf2ceu2O47lLbKU3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_082339_976089_34C26567 
X-CRM114-Status: GOOD (  14.62  )
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

On Fri, 22 Mar 2024 07:58:02 -0700 Breno Leitao wrote:
> > Looks like init_dummy_netdev wipes the netdev structure clean, so I
> > don't think we can use it directly as the setup function, Breno :(  
> 
> Before my patch,  init_dummy_netdev was being also used. The patch was
> basically replacing the init_dummy_netdev by alloc_netdev() with will
> call "setup(dev);" later. 
> 
> -               init_dummy_netdev(&irq_grp->napi_ndev);
> +               irq_grp->napi_ndev = alloc_netdev(0, "dummy", NET_NAME_UNKNOWN,
> +                                                 init_dummy_netdev);
> 
> I am wondering if alloc_netdev() is messing with something instead of
> init_dummy_netdev().

alloc_netdev() allocates some memory and initializes lists which
free_netdev() wants to free, basically. But init_dummy_netdev() does:

	/* Clear everything. Note we don't initialize spinlocks
	 * are they aren't supposed to be taken by any of the
	 * NAPI code and this dummy netdev is supposed to be
	 * only ever used for NAPI polls
	 */
	memset(dev, 0, sizeof(struct net_device));

so all those pointers and init alloc_netdev() did before calling setup
will get wiped.

> Also, Kalle's crash is during rmmod, and not during initialization.
> getting NULL after free_netdev() is called.
> 
> > Maybe we should add a new helper to "alloc dummy netdev" which can
> > call alloc_netdev() with right arguments and do necessary init?  
> 
> What are the right arguments in this case?

I'm not sure we have a noop setup() callback today. If you define a
wrapper to allocate a dummy netdev you can define a new empty function
next to it and pass that as init? Hope I got the question right.

