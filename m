Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF37C6FD19
	for <ath10k@archiver.kernel.org>; Mon, 13 Mar 2023 06:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XqfRjLWXkiG5Wb43kz+A8dFCbRihi6JgBvYqN0QuBEA=; b=yyQnLhEvCCndvN
	blPZ5vmBKSLl3H2eV6Hk+sMpE70oZxZxHoRVmZ1TuxYP5VFiHmoL4aAYKDhzN0v82jPXQXg2g8fsA
	ShBW6EUZUEVlCFgqFnueTiae25xzlG9kzXscLV4vXmkJop1IthjKD4xcIBO37YzycfO9iv8J8RhzV
	AK1aPa8ZHufnXoWn36HbFTuoTbgrEgtirFl0WHszQ0djWPTtre7v0LiOYAlzfhUHnP7/21Gklrv8v
	K6wIIv5291YrfRA3U7YKOri69Qh4aaoluQDXicc6H8zMle5wk1Q+HL4xe5iXOZ5/02sMMwyyXbF8x
	C1qy8hVS/vBkEp1/EIVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbbqG-004UPS-G3; Mon, 13 Mar 2023 06:39:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbbqA-004UOt-Um
	for ath10k@lists.infradead.org; Mon, 13 Mar 2023 06:39:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5B724CE0C4F;
	Mon, 13 Mar 2023 06:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D845BC433EF;
	Mon, 13 Mar 2023 06:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678689561;
	bh=YhY5bTcA62cTrlA63Mq3LC3b1cNGNJkrBXgaaTWRNwc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=UgqqTYOdf16PGs5hs0m+TNKJOHZ7DQ69VdD/DGaoqsivRfuQ2NYn4Z4i0k+ofsTvs
	 nyiGMcVYBQ5o3lO6N0QjVQYm7HuHrhNw2Az2mlYf2Oo99eECKNQnPqA6O1K/3VGHdU
	 C8a/UZEv8WCHNLCfblw330QNRi5e4oqu4JJGL52/bKFvzdvJ+4EX1IezA3GT6asx0A
	 2Gl/37PXqwYSgdGJn23MjlC9t4MAUifGTnU1ExS9nRvGg7S5hdCNN+8P4b8vKarfje
	 8Tw3rWC0cL8vUci1BQsUb9OKOzpxVomPzjYsAU/rf3GX53U/sM4IagGq+8Or21A4Pm
	 MjcBfAXDrqoeg==
From: Kalle Valo <kvalo@kernel.org>
To: Vincent Tremblay <vincent@vtremblay.dev>
Cc: ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2] wifi: ath10k: read qcom,coexist-support as a u32
References: <CA+RD57MwUfAzF2u31Ews4uT0+A6uhjwwd40O=9uyZihap4nxdA@mail.gmail.com>
Date: Mon, 13 Mar 2023 08:39:17 +0200
In-Reply-To: <CA+RD57MwUfAzF2u31Ews4uT0+A6uhjwwd40O=9uyZihap4nxdA@mail.gmail.com>
	(Vincent Tremblay's message of "Sun, 12 Mar 2023 15:42:47 -0400")
Message-ID: <873569p33e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_233928_255630_3E88F0F6 
X-CRM114-Status: GOOD (  19.25  )
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

Vincent Tremblay <vincent@vtremblay.dev> writes:

> Read qcom,coexist-support as a u32 instead of a u8
>
> When we set the property to <1> in the DT (as specified in the doc),
> "of_property_read_u8" read 0 instead of 1. This is because of the data format.
>
> By default <1> is written with 32 bits.
> The problem is that the driver is trying to read a u8.
>
> The difference can be visualized using hexdump in a running device:
> Default 32 bits output:
> =======================
> 0000000 0000 0100
> 0000004
>
> 8 bits output:
> ==============
> 0000000 0001
> 0000001
>
> By changing "of_property_read_u8" by "of_property_read_u32", the driver
> is aligned with the documentation and is able to read the value without
> modifying the DT.
>
> The other solution would be to force the value in the DT to be saved as
> an 8 bits value (qcom,coexist-support = /bits/ 8 <1>),
> which is against the doc and less intuitive.
>
> Validation:
> ===========
> The patch was tested on a real device and we can see in the debug logs
> that the feature is properly initialized:
>
> [  109.102097] ath10k_ahb a000000.wifi: boot coex_support 1 coex_gpio_pin 52
>
> Signed-off-by: Vincent Tremblay <vincent@vtremblay.dev>

What are the changes in v2? Please always include a list of changes,
more info in the wiki below.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
