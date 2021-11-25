Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB0FC433F5
	for <ath10k@archiver.kernel.org>; Thu, 25 Nov 2021 15:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6huLhSmwz25zM5VgZgEwxvudCFFi5saSM1CaxmO0tlw=; b=0PnNrZcned5LSf
	+Id3WBRG1PuNiM8HXdlR9D5bfzhi+0K7o3gKYyAOWLbeqpsyDg8MeS2S+xcHwUVc4bZg5+f3ZBpjI
	8WkXfFvcm4azib561LSkxqY/rEZnceZicMc/x30PBZz6DFFkPW5rsPcLo4Q4wmxqHYMDLi/cl3wZt
	1uqygCCS6AUZRZCgEnm8ow+qv0WiB74hRnPFi9e5pr9yshSQhuAgOoKWg/i9+h7yVeqGdmrf52/Ie
	YeamLtWnr6GUgs2o5tjiOtzsRWfyz2ZOjALULpuutj04pjQNFPifoFDtYaPWINQggeZlPhMyG5GyV
	NPesoykRchaLLdgK/Exg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqH0U-0086NU-Qy; Thu, 25 Nov 2021 15:49:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqH0R-0086MJ-B6
 for ath10k@lists.infradead.org; Thu, 25 Nov 2021 15:49:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21B2F610D1;
 Thu, 25 Nov 2021 15:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637855390;
 bh=y+FsVswUfu9wkFmXREI3ZDwQZ72b63X5+FsshXIQ0Hc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KCoSRh7faioLazqQGW84xvvL6HItmAwAB6VC0mFy5yoxWbl+gX0Z+vAW/VbLbZ8KB
 ZtTpGOtcnDuf1vmBqjvrGP1H1p1UEfPkKuP0VVQ9Cqq31mbA1YxG6yUpfhJIPF/vQE
 u1r2OhxvgO5eT1M11bJUdBNi1yDs6zZm13LWD805D+NWcNMul0qgMb/EaXURyjPqUD
 Lfvnu+4kQ2py7GAce5A4kazk1rb6yRJjNG1lQoCf1OWho4kHmCgdY08muqXvCwk+wr
 2E4EBP7xmAz7+OOE5rjJbPhjJnk1J8cOlCnLE/BWVB3MuBjcydtgG/VHuIiU61KoLG
 c1dZX6AJb4xTA==
Date: Thu, 25 Nov 2021 07:49:49 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>, Tony Nguyen
 <anthony.l.nguyen@intel.com>, intel-wired-lan
 <intel-wired-lan@lists.osuosl.org>, netdev@vger.kernel.org,
 ath10k@lists.infradead.org, Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: [Bug 215129] New: Linux kernel hangs during power down
Message-ID: <20211125074949.5f897431@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <1849b7a3-cdfe-f9dc-e4d1-172e8b1667d2@gmail.com>
References: <20211124144505.31e15716@hermes.local>
 <20211124164648.43c354f4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <1849b7a3-cdfe-f9dc-e4d1-172e8b1667d2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_074951_452708_76573A92 
X-CRM114-Status: GOOD (  10.43  )
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

On Thu, 25 Nov 2021 08:32:18 +0100 Heiner Kallweit wrote:
> I think the reference to ath10k_pci is misleading, Kalle isn't needed here.
> The actual issue is a RTNL deadlock in igb_resume(). See log snippet:
> 
> Nov 24 18:56:19 MartinsPc kernel:  igb_resume+0xff/0x1e0 [igb 21bf6a00cb1f20e9b0e8434f7f8748a0504e93f8]
> Nov 24 18:56:19 MartinsPc kernel:  pci_pm_runtime_resume+0xa7/0xd0
> Nov 24 18:56:19 MartinsPc kernel:  ? pci_pm_freeze_noirq+0x110/0x110
> Nov 24 18:56:19 MartinsPc kernel:  __rpm_callback+0x41/0x120
> Nov 24 18:56:19 MartinsPc kernel:  ? pci_pm_freeze_noirq+0x110/0x110
> Nov 24 18:56:19 MartinsPc kernel:  rpm_callback+0x35/0x70
> Nov 24 18:56:19 MartinsPc kernel:  rpm_resume+0x567/0x810
> Nov 24 18:56:19 MartinsPc kernel:  __pm_runtime_resume+0x4a/0x80
> Nov 24 18:56:19 MartinsPc kernel:  dev_ethtool+0xd4/0x2d80
> 
> We have at least two places in net core where runtime_resume() is called
> under RTNL. This conflicts with the current structure in few Intel drivers
> that have something like the following in their resume path.
> 
> 	rtnl_lock();
> 	if (!err && netif_running(netdev))
> 		err = __igb_open(netdev, true);
> 
> 	if (!err)
> 		netif_device_attach(netdev);
> 	rtnl_unlock();
> 
> Other drivers don't do this, so it's the question whether it's actually
> needed here to take RTNL. Some discussion was started [0], but it ended
> w/o tangible result and since then it has been surprisingly quiet.
> 
> [0] https://www.spinics.net/lists/netdev/msg736880.html

Ah, that makes perfect sense, I didn't see that stack trace. 
Dropping Kalle from CC. Let's hear what Intel folks have to say..

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
