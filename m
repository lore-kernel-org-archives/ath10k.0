Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123C8C4332F
	for <ath10k@archiver.kernel.org>; Wed, 22 Dec 2021 06:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLeseykb64Ad2tGmJxx/+iJ6phtgtqfw5DZ4GjQEp00=; b=nF16TfdL5v1JgY
	rMgdWGAY3hTsd70C4LQ27hgE/L0y6AbmRwRGpjbYTlOERBcVrrnSGSCX6BgCYYLNGG22PabXyWfhW
	DBRIfkM2ngVjLw6rFDJWz2qmKG6OEcrNLBta2Xo+YP9z1g+yPaIPFueMGnTxQOFZOFo05s54PIjDk
	Iwgik8B2aauK/wZkycGzwLU7+6JgHRk9HLZL7y6VdpZfxicWHz5tcl1ojP+74DDPdyMhK+LKD/1bB
	1YJlpRNBSF/iZ/Hzq7OKPhtap33JbocxZfvk/zOL14g7GMqP55UM7vst2SJpQ7nI3Z4ZCDJG+/IRq
	IPrLmcO+TD3Wex/EaDRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzvMP-009Maa-Cg; Wed, 22 Dec 2021 06:44:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzvMM-009MZm-N9
 for ath10k@lists.infradead.org; Wed, 22 Dec 2021 06:44:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6F621B81B08;
 Wed, 22 Dec 2021 06:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4182C36AE5;
 Wed, 22 Dec 2021 06:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640155460;
 bh=06+qXAesbN9GTyzqoY1xLowtSXQXtOyrtPnQ4r9S/co=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=cVwgv+vb1M3zySXsc5SPxntomPGL41N8thu+7o0j6jRiFI93cW5sa387Ok9ooTiXC
 jgWZxM2e2+k2ZK7f+PBxS0M0g0j73rdE7SP/40BkW/KDUMAUo5bFoa88a7BbJCXkb4
 mMkBeMTeYqA33hdUwuiy2vP7hM2WXvggjgOERokiOoPZG42VWIM3HXFHG1TBLtR58O
 P5inrp+sQ8Y7qVPJB+pLQkxTNERzmSqB7G6RHh1A4dZmIAx1F+tDkR53at3E6jmxGz
 iFmGLvwGeRU56zm/uI4u5myR3Ag7hmEF0LW5hFyPgJRtBRP5CfmWfjaQ+1tD0Q+1QL
 XSUnOw+Q/JU4Q==
From: Kalle Valo <kvalo@kernel.org>
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: briannorris@chromium.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, dianders@chromium.org, pillair@codeaurora.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 ath10k@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH] ath10k: enable threaded napi on ath10k driver
References: <20211214223901.1.I777939e0ef1e89872d4ab65340f3fd756615a047@changeid>
Date: Wed, 22 Dec 2021 08:44:16 +0200
In-Reply-To: <20211214223901.1.I777939e0ef1e89872d4ab65340f3fd756615a047@changeid>
 (Abhishek Kumar's message of "Tue, 14 Dec 2021 22:39:36 +0000")
Message-ID: <87fsql2l6n.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_224422_924963_DAE8E64E 
X-CRM114-Status: GOOD (  10.03  )
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

Abhishek Kumar <kuabhs@chromium.org> writes:

> NAPI poll can be done in threaded context along with soft irq
> context. Threaded context can be scheduled efficiently, thus
> creating less of bottleneck during Rx processing. This patch is
> to enable threaded NAPI on ath10k driver.
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00696-QCAHLSWMTPL-1
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> ---
>
>  drivers/net/wireless/ath/ath10k/pci.c  | 1 +
>  drivers/net/wireless/ath/ath10k/sdio.c | 1 +
>  drivers/net/wireless/ath/ath10k/snoc.c | 2 +-

I think also pci and sdio should be tested.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
