Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8918C6FD1D
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lewx1FgNzs31YRIVN7OEA6kHJEfYdVeA8X76MtepNxU=; b=IDSHzXFfyq1tLX
	5yKLmachZaPMl/We0YyoatieTCtnJp6Q0actdOs/zdBVlV2x4qiMJShjJ49VLyM1G/kUpTcHCpG83
	z9nrEsll7he53jekG2XhCjq3NVhCSqs76k3nZxR+WGyXxIXAwQfpzUZjVe8KXQnbrXp6D91YA4ajq
	khJVj5CGyVv3VuqU6oDRPi3EYBHhn7f3IADd+8ZopULFvDvjEkI5ynDXLYphoZjXXlyP08Ojis0fj
	zx4X95aqHwjVUnElVlUqHSMMGm+XDuGiCPJEDa7sMkJ5kWMksPkTwg9BM0Agce5J5QwlOSqozsDMV
	NXWsLpUkt2V32pvitHew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8IT-0023vU-1n;
	Fri, 17 Mar 2023 11:30:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8IQ-0023ur-2C
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:30:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D02F6B82433;
	Fri, 17 Mar 2023 11:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE23C433D2;
	Fri, 17 Mar 2023 11:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679052649;
	bh=LXLqORXKNKIJfa6KBoPq+/JzpxqJ+LcukTK7RDPDf6Q=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=aEPOb38HAKqQv/NJzyumrmD4GhguA53paAZSwXnveewQGzrAIU5osKpjkPDQ1Rnib
	 Fn7Bg++CUQmVrtJK3iqnmmxolXpf8mOPymowJ11X2ScesyzI65hlrxaRDH5it5AL9Y
	 D/1j49GZuxBFCie4cN2LvoCWXJaNU4Me4FWClUCXLyne9p9pOWiKU4PyLR1I/Ch2b8
	 5zotutMvHZ4CV+vSqq4XjDkxYVybG/lHOF8XhATE7YdEWI7lm60D3dGK3M+pfLvirA
	 CBfsL0XSdjEuQ4yRgyAArwYti+Fj3vBLAwEYSD/HL+jJCuHXr1AAA59apTir5XqBWO
	 gfHaNJI0awhKg==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add devolo Magic 2 WiFi next
References: <62bce2a4.1c69fb81.8b9c9.f548@mx.google.com>
Date: Fri, 17 Mar 2023 13:30:46 +0200
In-Reply-To: <62bce2a4.1c69fb81.8b9c9.f548@mx.google.com> (Christian Marangi's
	message of "Thu, 30 Jun 2022 01:39:15 +0200")
Message-ID: <871qlnmx7d.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043054_864069_769B2D96 
X-CRM114-Status: GOOD (  15.80  )
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

Christian Marangi <ansuelsmth@gmail.com> writes:

> Hi, we have many board file not pused upstream in openwrt. The intention
> is to fix this and have all of them merged.
>
> * description for what hardware this is:
>
>   - it is a IPQ4019 based board
>   - one QCA40xx radio is used as 2.4GHz radio
>   - one QCA40xx radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - extracted from the original stock firmware image
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=devolo,magic-2-wifi-next
>       sha256sum:
>       3827df1fdf182d907af87f83520d6cf6c9cc8873d14cddcc8d274ff91b53844a
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=devolo,magic-2-wifi-next
>       sha256sum:
>       ee86fd52dcdd7c719cea3348a89d2bbbfbb6169cd6a3a8e42bc4332f5d7befc5
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=devolo,magic-2-wifi-next
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=devolo,magic-2-wifi-next

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 99 in total

https://github.com/kvalo/ath10k-firmware/commit/2c35c6b2f41bb3fcef91e9c003b4d734f46a65cc

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
