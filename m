Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF960C54E68
	for <ath10k@archiver.kernel.org>; Thu, 21 Mar 2024 14:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pH2prGeFdJHwwa2fwQUUxFRLlz1GTq7varQulC5JgdY=; b=oohdvDHNVQFNLA8IPA5qE6DXmA
	gO1Ej6s8j0d27Vb8fTK+ouydFgBNeSTthSC9tpbnh2XG4UpeYGqL99vJKIWm3vOT4mFf4DRye8pcw
	QZIOLcF+XNTJlyNnFNYHp3bz0rfYoRQSXCZVVaNAqBMmKMOlLT1WnMnyCVVgmQ7W2qPrhsswM9iK1
	hQGBGBq9T23sDceNB9fzGNqypdx3Zd6aRSlq3/tPQ2YjTKH2dRfMmvr3S4wYfxMpacpbTWMOKqSRZ
	MIb9lvnAQGXvGcS8qcPnMFf9/B0cEKrCx3LgjlAJwgVrwNF5e18zJXIYOkTnQ6SZnSaOchCZQ8+IW
	TCtixgPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnJPA-00000003GvS-1hCp;
	Thu, 21 Mar 2024 14:28:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnJP7-00000003Gu4-47Fr
	for ath10k@lists.infradead.org;
	Thu, 21 Mar 2024 14:28:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C7EA8CE1375;
	Thu, 21 Mar 2024 14:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDABC433F1;
	Thu, 21 Mar 2024 14:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711031303;
	bh=pH2prGeFdJHwwa2fwQUUxFRLlz1GTq7varQulC5JgdY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SpxN06LppfVgIhmcsu1LrlaPRuDknGG/5OjUT5Wu+HapT8qxkC8DGJ+6guCxsERy1
	 PXZpdK+Dm1USZIRFXud+clP1GT8QF72UPK7UfyHLkoAsFM24+lUacMN98ru+KSstF9
	 OYj9uf+ri6/KXrTMW/4glRlbmBr29nm06GuRCGKcXVApw5eNf4g8DJJoGK6qz+rAGv
	 J3xCmoV3A/XHruiLd9xAyosdmPjSmq+ePeZs8x4N25ak1RxBXhnTE+xp94RQ8LYc9f
	 0LI5lyBQsTHoSzT0UOAl2NrNRpo9fzTVhGpL/H0FR3Wl/2Gv4YV9tpbUHAT9sjIENR
	 tGTK4DbXeziKA==
Date: Thu, 21 Mar 2024 07:28:21 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Breno Leitao <leitao@debian.org>, Kalle Valo <kvalo@kernel.org>, Jeff
 Johnson <jjohnson@kernel.org>, <keescook@chromium.org>, "open
 list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, "open
 list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ath10k: allocate dummy net_device dynamically
Message-ID: <20240321072821.59f56757@kernel.org>
In-Reply-To: <9fcdb857-da62-4832-ae11-043fe993e4ad@quicinc.com>
References: <20240319104754.2535294-1-leitao@debian.org>
	<9fcdb857-da62-4832-ae11-043fe993e4ad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_072826_228338_C6CAEE09 
X-CRM114-Status: UNSURE (   6.02  )
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

On Wed, 20 Mar 2024 08:12:46 -0700 Jeff Johnson wrote:
> NAK this based upon the ath11k patch results.

The ath11 patch is much more complex, I'd wager this one is fine.

> As suggested there we should just use kmalloc/kfree to match the existing logic.

Please no. There is no magic here. alloc + free must match whether
you're using magic object alloc wrapper (alloc_netdev()) or straight
up kzalloc().

