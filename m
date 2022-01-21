Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08B7C433EF
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aD4s8C7IJ7syIx1CEaKBmUV7W4gB9X8W69gBGTxPpmw=; b=LVNGAHDjitGC5r
	WC/BSBplrRHBOQnoRwwF1RR23pchpeiKNJ3nLRMTCV3H8yFXc46s6hbBWM1vDHQ5CazMCVL5yYWb4
	/xh6O0tOWSiTALD91qR5HewihbPAh5s+h3KCVyCyhix5GQT5iW2jrXQsfetulZsgEnNbh3CPuYUld
	USh8VE4jB1Y24/BBEENsOYPLjJf60mumV8apBMCtxFeBKsZSpJ6sBOVStRsUOWXMEMqdOtcSmGgQe
	MU3lUM+jE4V9b1KWoWrxRZbQBP7vl0rnxbYBCx9B9LKr9mATdYXK/dihDes4YttYZnL1E+kN5z0w6
	fDzDiPN9y0DJGntHgtRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuLE-00FEh1-LK; Fri, 21 Jan 2022 13:52:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuLB-00FEgL-9U
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:52:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD78E61705;
 Fri, 21 Jan 2022 13:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28B0C340E1;
 Fri, 21 Jan 2022 13:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642773152;
 bh=ycOfso1K9p+bQtJwVf4tDhwIcubNkNZSLfv8mrOiTfM=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=l8BKG0obSZ5uYMQEkdF3Hs5O/wMJNQpNx3LRDdfbqEM5SgZen31MVWbCCicbkwHH9
 n96axFx6QrPrzaPKzD6eJ4K/Hb2XQbwLCT5NC3WAKCuFOLJedSK48WXcBN44CqHcNJ
 ZSzl/By79hkgmPZF0TMM2UTGfyEkNof0nvbts/9AMMWRL3bbautadOBhz5Ad40R0hL
 AJmVbBwrdcrMNcMX9c6Gdo4he+UXk/0dKkZHTfvqR0094PHGrREVUK0ucKcnU8+6zw
 f/2Mv+3rucFTHZaPOYWR07Mf9VZzhLPQEnIzxg8xiTOxMOZsEYTp/gpTF3wBo6+Qdt
 Tbfwizxl3OaOQ==
From: Kalle Valo <kvalo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Plasma Cloud PA1200 specific
 BDFs
References: <2895944.CbtlEUcBR6@sven-edge>
Date: Fri, 21 Jan 2022 15:52:29 +0200
In-Reply-To: <2895944.CbtlEUcBR6@sven-edge> (Sven Eckelmann's message of "Sun, 
 22 Nov 2020 11:30:12 +0100")
Message-ID: <87bl05ci1u.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_055233_397017_01624750 
X-CRM114-Status: GOOD (  16.35  )
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

Sven Eckelmann <sven@narfation.org> writes:

> The support for this device is currently prepared for OpenWrt. This AP requires 
> two special BDFs to get the Wi-Fi PHYs working (correctly).
>
> Now to the questions from the wiki page [1]:
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
>   - was provided by vendor in patch send to me for the OpenWrt support
>     (Sun, 27 Jan 2019 22:23:37 +0800)
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - BoardNames[0]: 'bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=PlasmaCloud-PA1200'
>     BoardLength[0]: 12064
>     BoardCRC32[0]: 4993061f
>     BoardMD5[0]: f8727ab647005b96d83a0ab62fddb3e1
>   - BoardNames[1]: 'bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=PlasmaCloud-PA1200'
>     BoardLength[1]: 12064
>     BoardCRC32[1]: d88f99d8
>     BoardMD5[1]: be3e4787cc41754c54a8aa5e76576855
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=PlasmaCloud-PA1200
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=PlasmaCloud-PA1200

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 84 in total

https://github.com/kvalo/ath10k-firmware/commit/ff8c56bb347ae1e8ac063a7b5dedf59178abcd1d

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
