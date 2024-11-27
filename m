Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07945D6ACC2
	for <ath10k@archiver.kernel.org>; Wed, 27 Nov 2024 11:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Id9ko+s5htGXfNjMB0EdrVaOKZQiusdnbpWHrvTf2EU=; b=Xi5uUCKwCUbJCWnBHBdA7+zYZL
	hZ5MGIGIwg9qIZuNAAO0RznHQwrl65pIzlV2wZpvy1KW8cSEXCW9FTx/7TkL9bmWs5mHg282lChbW
	xl+NTF+hvQCgnSDrcJ6lq4e6sTogLweoE8iAL1EP1oNHjwS1al+XUqZ3lBmRjyWN9YG0rUBrQHPrh
	ShNzL1jiT3KzLJyGKgi8XV5RQvWMgI2Jzgyt2n0t22mGMvMifmcv9hGj4cKpkZTYnIYlJcVgcjZRr
	3h0RUd8VMZyw797zIjGj8xN+SUUXxE9LNdwC1E3c21OndCJjHlK2qc6NfXU0XPTMdYjlCX+ftZkaW
	9SUvZGpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGGLo-0000000D1tJ-3etl;
	Wed, 27 Nov 2024 11:36:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGGLm-0000000D1sm-0J9C
	for ath10k@lists.infradead.org;
	Wed, 27 Nov 2024 11:36:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6324FA4144D;
	Wed, 27 Nov 2024 11:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE18DC4CECC;
	Wed, 27 Nov 2024 11:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732707412;
	bh=Id9ko+s5htGXfNjMB0EdrVaOKZQiusdnbpWHrvTf2EU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qQCK0hz106So74q2QhKkrS2G3wxMb6bMIo4pOXz31vSiAtFDS71elBx4rDmgLjPsn
	 oARzQhNiRX2MABLd0Zya0o3uuVeWyrRX32dSG56weg66NhcPA+KHKkg0mcFXCx9a7v
	 zkU4xYyso+LDXPLcGY7H2crliOzlBTIJzzbXBPLNMjDsJwIQl2qoARjQRMuHUMAqOe
	 dKF8Go3v2RsDM8GvZHGPuLhncoGTkrNCZa819+nwV6FHXVc3m21ECwClcD1zZt0TBe
	 218oqATIBndIhzynWtzzHISzeiUjMSCahZx7aAU5ADLKcmSzzncc7bQgUlZ7cXq/Kj
	 l8UBzFwpVvEMA==
From: Kalle Valo <kvalo@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org,  LKML
 <linux-kernel@vger.kernel.org>,  regressions@lists.linux.dev
Subject: Re: WARNING: drivers/net/wireless/ath/ath10k/mac.c:8750
 ath10k_mac_update_vif_chan+0x237/0x2e0 [ath10k_core]
References: <637c5bb4-5278-44be-9ac3-9c0ef9297162@molgen.mpg.de>
Date: Wed, 27 Nov 2024 13:36:49 +0200
In-Reply-To: <637c5bb4-5278-44be-9ac3-9c0ef9297162@molgen.mpg.de> (Paul
	Menzel's message of "Tue, 26 Nov 2024 09:58:22 +0100")
Message-ID: <8734jcx60e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_033654_178051_D973CFCE 
X-CRM114-Status: UNSURE (   9.31  )
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

Paul Menzel <pmenzel@molgen.mpg.de> writes:

> On the Dell XPS 13 9360 with Linux 6.12.0-08446-g228a1157fb9f, I
> noticed the trace below:

For others, commit 228a1157fb9f is from current merge window so the
first release will be in v6.13-rc1.

> [16805.002289] ------------[ cut here ]------------
> [16805.002296] WARNING: CPU: 3 PID: 65835 at
> drivers/net/wireless/ath/ath10k/mac.c:8750
> ath10k_mac_update_vif_chan+0x237/0x2e0 [ath10k_core]

[...]

> I do not see such a message in the logs since September 19th, so I
> believe it=E2=80=99s a regression.

Have you seen it only this one time or multiple times?

What kernels have you been testing prior? I'm trying to pinpoint what
versions kernel version work and what have this warning.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

