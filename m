Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2810C6FD1F
	for <ath10k@archiver.kernel.org>; Thu, 21 Mar 2024 22:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbuSOUvqWDsjyU4fjFA8El1Gew11D8TvfCnpljOHrBk=; b=Fs+JHZaPQLU5GiLhRzMVDhIrz1
	+l/LAhjNq4W8R/o0Uw8Y3TyILHwKJN8+gXjlsQh5FMgd0potYSBeIvHRtrI6XFAkbHEE+ZSI4Gf+H
	1NoDclbtv+yG1Tb9E6C0kwbYJs9eymugpQHY71rXzB9uTffp7FVoOpAy3temkeISMRMyqw9mvtaWS
	/CdfFwi4NmvvsqpY1MSAm+y4olD+gcAJudjm2b84S+wI1xx+GN4vxxwrahGkGqMNafLa7lrWX4DfU
	HIcVBs4bZjeeEveC86DbH6iv1b1unLL1dFyqbSDsEOFih7448gynVtehaMyn9WODRa8lLZoULn83z
	2Fn4R7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQjO-00000004uMa-1hpy;
	Thu, 21 Mar 2024 22:17:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQjK-00000004uKq-2xf7
	for ath10k@lists.infradead.org;
	Thu, 21 Mar 2024 22:17:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1B8C612DD;
	Thu, 21 Mar 2024 22:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B46C433F1;
	Thu, 21 Mar 2024 22:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711059465;
	bh=DjmJQ+78BPWvsjUAWnoJZsxc2vrITxo9QPDsDLcM/+A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=isCQZVOhwUx8IUng+hpByG45djv/aCqomgiN+lAwM5SalgcrXR7MaOtV2Zt74d93C
	 YudbDwv62+18fgCECgChIwHqRhV87r8NcvRpIaVLKDrNERRTZ+oj1OieZkEKkLW6+Z
	 LnhbP2lo/8rA5gZxp7cWjKHhsPFU5QyZuX2V2PZLuT4dkY0tizZHaTkSEeeEIdsJDc
	 h9WwM8BWDJlqKsBIybLuL2itFunpzZDy39TqGa1uU02PG8NDRryw50SKwi50xI0q+B
	 DZVvn+42IkzVniLvO72AfemDh22BFgA0BrFa7gwUq0joXHx7xixrko8chSvKetl5tH
	 cVg+ONEfm192g==
Date: Thu, 21 Mar 2024 15:17:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Breno Leitao <leitao@debian.org>, Kalle Valo <kvalo@kernel.org>, Jeff
 Johnson <jjohnson@kernel.org>, <keescook@chromium.org>, "open
 list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, "open
 list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ath10k: allocate dummy net_device dynamically
Message-ID: <20240321151744.246ce2d0@kernel.org>
In-Reply-To: <5039256c-03eb-4cda-8d11-49e4561cf1ef@quicinc.com>
References: <20240319104754.2535294-1-leitao@debian.org>
	<9fcdb857-da62-4832-ae11-043fe993e4ad@quicinc.com>
	<20240321072821.59f56757@kernel.org>
	<5039256c-03eb-4cda-8d11-49e4561cf1ef@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_151746_844494_A219B4D4 
X-CRM114-Status: GOOD (  11.63  )
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

On Thu, 21 Mar 2024 15:02:39 -0700 Jeff Johnson wrote:
> >> As suggested there we should just use kmalloc/kfree to match the existing logic.  
> > 
> > Please no. There is no magic here. alloc + free must match whether
> > you're using magic object alloc wrapper (alloc_netdev()) or straight
> > up kzalloc().  
> 
> Based upon the ath11k patch there must be something going on with
> alloc_netdev()/free_netdev() that doesn't occur when these aren't used.

Looks like init_dummy_netdev wipes the netdev structure clean, so I
don't think we can use it directly as the setup function, Breno :(
Maybe we should add a new helper to "alloc dummy netdev" which can
call alloc_netdev() with right arguments and do necessary init?

> So I'm just suggesting that instead we use kmalloc() and kfree(), which are
> matching functions, and which, like the existing code, are not subject to
> whatever is happening in alloc_netdev()/free_netdev().
> 
> I don't understand your objection.

Using subsystem APIs to allocate its objects is preferable to ad hoc
kmalloc().

We're working upstream, basic alloc/free of an object should work.
Took me 5 min to realize what the problem is.

