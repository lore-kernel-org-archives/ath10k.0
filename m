Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24293C61D85
	for <ath10k@archiver.kernel.org>; Tue, 21 Nov 2023 14:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJm2AAKwB8dttDk2ds58C6lud7uD2u27pRzDXssv7Bw=; b=jONUtVU3StE4zR
	hbW2FJSJJogiHmfuBpEss5+3MeL/KadRRbLRiN2h9oz6ComAJVOKai7HxV5/UtvGeif/YVWw0o/oW
	F9IjIX0FqVqSBzdlw5CbmmFiw7hzU9TIZJQUOlfHYC9A38vJVaePvbfJeCFUJEvyffxvmeN+jW4Vg
	rEbqdn3zjg33fRZJrK6tATDOEFUeIjyZ19wp6ROj21TAOqNNMBOAboe7SmfiUdAcr3AzcOSxlmkgb
	LF7IO7g6H1K9Ea4jOWJ2z3iWXdhbwA6yJwDQPyytDLplrAW+xvZ9hZGuo8wBKvXoYb0Q+T2z11qBj
	D+TIO0uPKAe4w8/Klj0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RX2-00H09V-0K;
	Tue, 21 Nov 2023 14:15:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RWz-00H08q-2I
	for ath10k@lists.infradead.org;
	Tue, 21 Nov 2023 14:15:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86C8B619B9;
	Tue, 21 Nov 2023 14:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D5DC433C8;
	Tue, 21 Nov 2023 14:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700576112;
	bh=VIpOQOGT75q7qTgqrJxcxGIVQak8KPvWT/q4sYulLoA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Od1Dap9EpxuEWwLk15GlQThOiAfQ7ea20ehkuZ6bR/xznRaqzSzNPgvxAXQn9BKqc
	 D3CYhPDrDyEEnzcp2Et9SbDtlViZXPJkXbiJ6DFRfzGoFbHzn1UHLm6LIgGgdAQt0W
	 WyIewP5aOrFY5/lMfw6WqVLwTBE3ebKEWY/9gC7DWwkxsqQrisJX2ss9pzzs8LPV+g
	 dw+yooijLfr6epaxIJAGWqkutlwq9IuWuVZzD+uqMsM1jarhZ9qpQl1E4iYRGZFJts
	 zfGQ1YcY0E7okeDCa/n4k37DKA20D4lZRYRUuXTvnnHhzcPrO1F3EOqHFRXZx3pkTd
	 glHRa0PR+nBfg==
From: Kalle Valo <kvalo@kernel.org>
To: James Prestwood <prestwoj@gmail.com>
Cc: linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org
Subject: Re: Power save setting while interface is down
References: <304ce305-fbe6-420e-ac2a-d61ae5e6ca1a@gmail.com>
Date: Tue, 21 Nov 2023 16:15:09 +0200
In-Reply-To: <304ce305-fbe6-420e-ac2a-d61ae5e6ca1a@gmail.com> (James
	Prestwood's message of "Mon, 20 Nov 2023 09:15:28 -0800")
Message-ID: <87msv76vma.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_061513_789269_17248CC7 
X-CRM114-Status: GOOD (  18.74  )
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

James Prestwood <prestwoj@gmail.com> writes:

> Hi,
>
> I've noticed a somewhat rare behavior (<1% of the time) where bringing
> an interface up fails after disabling power save. This is done by IWD
> when a user-option is enabled, and follows an interface
> removal/creation. The sequence is:
>
> 1. Remove default interface
>
> 2. Create new interface
>
> 3. Disable power save on new interface
>
> 4. Bring up new interface (rarely fails with -110).
>
> iwd[1286641]: src/netdev.c:netdev_disable_ps_cb() Disabled power save
> for ifindex 54
> kernel: ath10k_pci 0000:02:00.0: wmi service ready event not received
> iwd[1286641]: Error bringing interface 54 up: Connection timed out
> kernel: ath10k_pci 0000:02:00.0: Could not init core: -110

So I guess you have a test setup to reproduce this easily? How long does
it take to see this?

What hardware and firmware version are you using?

> I'm thinking maybe there is a race between creating the fresh
> interface and disabling PS, then bringing the interface back up?

Yeah, looks like it. If it's relatively easy for you to reproduce this
you could try adding delays to suitable spots in ath10k. That might be
give more ideas where the race is exactly.

> Setting PS after the interface is up (so far) seems to be 100%
> reliable and have not yet seen this behavior. Regardless of any kernel
> fixes I'll need to reorder the command sequence in IWD to support
> existing kernels, but before I work around this issue I wanted to
> point it out so its not hidden from view.

To me working around this in user space doesn't sound like a good idea.
I would rather have a workaround in the kernel (but obviously I hope we
can find a proper fix).

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
