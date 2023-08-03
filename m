Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C696C001DF
	for <ath10k@archiver.kernel.org>; Thu,  3 Aug 2023 12:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0A8Pu0HvH8vsVD7k7edSdBxmt1HRK1HTZG/UOyFejA=; b=OMWIbiCFw2cExH
	fbZDvLdHMsfVEN4+r7uAagejXULliZiFkgd3qHzopLXG+j0A7gHebf9/g47zgmDh8myu0KxpZe5kT
	tVhELjRYXrfJFLxm6wrG/oktqbNFJDSDdlcrWyFlcxUCwWuUuI+AYxCCcIODt2/TtXvlQoxhGQHTp
	+kjmH7sZD8oHJWiOBgxe/ruDJI8QTqqabjzvbl+9g//CBMdsTKyR9BI2S2rbS8MqDRNAz8GVVZ9Wc
	ymVvxNz6knKpd82JVAayZ3aFDKgGgg79jKKnqgxIxMHLaHXhZAA7gjybrrfMhXrEJdeFnKhtvgPDD
	v50Od/Rp8JHwjT5nEffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRX7v-008ELH-1b;
	Thu, 03 Aug 2023 12:08:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRX7s-008EIz-1J
	for ath10k@lists.infradead.org;
	Thu, 03 Aug 2023 12:08:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BDA5E61D4F;
	Thu,  3 Aug 2023 12:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FBC5C433C7;
	Thu,  3 Aug 2023 12:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691064499;
	bh=482+ILE7ZMamSHtB0x3lhT08g9IXebDMgN7NCBSIK2M=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VqcHkBqtwVBHXZ4j+P/1Kc/ZaeR5mRYazZ2hkbar7tOvpgm/7/fO8EZPqhldjwTQU
	 oRUedb1FS9d1VseQtYJ2hhhqsllgXOaPRbpb3ErFVVJj4NApIhyKN7NOZIAgdQ0U5r
	 YKoHKYn7SfCxhvFuGVEX86RuYjYnFMSBW0vGyC0iHxLEScovd3P2aNz7QXBvMbOX8t
	 g5012Ob+Y8W8uFTlZCoO4E+ZSm1XRW6RzxbqG4/36FWPHjIusIkiNdG8qtnKTHdFki
	 QyeG0D66vrS5o3Xkhd01Q9SG0PiPjqMIA78lMW4H+ryEySdKhB6IQCVrqamss26OZR
	 xhtH28QyYZePg==
From: Kalle Valo <kvalo@kernel.org>
To: dukzcry@ya.ru
Cc: ath10k@lists.infradead.org
Subject: Re: [BUG] SoftAP: zero speed between clients on QCA6174
References: <02bed0819c13c14dc1f52d7d2b658b00280d2634.camel@ya.ru>
	<c7ecaf558a6b2b46c73ecbe8a291de3af40b35fd.camel@ya.ru>
	<875yavfeln.fsf@kernel.org>
Date: Thu, 03 Aug 2023 15:08:16 +0300
In-Reply-To: <875yavfeln.fsf@kernel.org> (Kalle Valo's message of "Mon, 20 Mar
	2023 20:43:32 +0200")
Message-ID: <87edkktjkf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_050820_500079_6E10CEDC 
X-CRM114-Status: GOOD (  10.92  )
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

Kalle Valo <kvalo@kernel.org> writes:

> dukzcry@ya.ru writes:
>
>> Looks like firmware issue. Fixed by downgrading linux-firmware package
>> down to 20220411
>>
>> Last good firmware 
>> linux-firmware-20220411
>> [    3.859587] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-
>> 00157-QCARMSWPZ-1 api 6 features wowlan,ignore-otp,mfp crc32 90eebefb
>
> [...]
>
>> First bad firmware
>> linux-firmware-20220509
>> [    3.767713] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-
>> 00288- api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c
>
> Thanks for the report, I forwarded this and hopefully it gets fixed.

There's now a new version firmware-6.bin_WLAN.RM.4.4.1-00309- available:

https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0/4.4.1

If you can, please test it and let us know if the issue is fixed or not.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
