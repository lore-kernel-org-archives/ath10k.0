Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD449C6FD1D
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gn+geDQHCwZn4WxSkUE6S6LP2rXqNGDZ2WcEJgSXW40=; b=d1mIl4VoZzSpVs
	QOnuiRaEFlYIs/L/4v0OUOCELiyAi0I4wnwywy6eWGzcUHIRGVX4ub4GtxLOO2tL0ce4k33NAz1qB
	xh2XdHhNmNzz3/SrJnTIvVLU0/R2C9KyVF/kHTASrkhZwT3QR08etVbovLyAcnMjX1z4No6nS6D69
	2Frsw3ZJ+aPTrpKSaLa1lHd46LiADX9ha91E1goe5weQL06KxHrCFhsg5M7BsWbP/trl5b2zixIYo
	G9N1bz5TsG7TivREYGrzRf/NpmqNlTR9tBUCBGyC9Ql1JO3N3PrFh0VnVZDj/Ua1NvOLgmCvYWp8o
	L1Zn65wA6iUpT7au8oBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Pu-002685-1J;
	Fri, 17 Mar 2023 11:38:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Pr-00266a-0H
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:38:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9D500B82560;
	Fri, 17 Mar 2023 11:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB11BC433EF;
	Fri, 17 Mar 2023 11:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679053112;
	bh=Eo1A3cG+gIq1m/Msgi9K9tP8uu4mQ/BtI7CTzpkBTks=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ZGhCNTi5l/DZv3e4b81mbafbyR0tC3S2w84aCZEED0jj6O9q7s+GwGoRs8GhJpS0k
	 +S5gde90xACaKknTdcGDkIUkXlzRkEdsA9lCBS3toJ+u15l21JkYObR8tDhFt73c+z
	 BA7jMheZz6JhWPkduKVQZUIbDWaSHchiR4mv2Z3Dlm937ZouhwpAbTPzOF6wyo0sfa
	 mEbTqOKZjS/+fHpPk17DBA4AFRgPKwEMuGT+bTW374QpgZ8ZMaD8Hpb3FCT35hUoJV
	 dO9FUFsJJQ9OdiZJ1E8RQE1MzSVCwt8r+XhalG19SKfoEGLMIWLLipybIyw2iAD/r5
	 NMpNbG6ofDJuA==
From: Kalle Valo <kvalo@kernel.org>
To: Giammarco Marzano <giammarco.marzano@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add ZTE MF289F rev. AT1/AT2 (2.4G/5.8G) specific BDF
References: <CAJE2SDdBgf0FCAtT2m6Pz7xccuo7cTbPjmStskfn9iNBkYNc3Q@mail.gmail.com>
Date: Fri, 17 Mar 2023 13:38:29 +0200
In-Reply-To: <CAJE2SDdBgf0FCAtT2m6Pz7xccuo7cTbPjmStskfn9iNBkYNc3Q@mail.gmail.com>
	(Giammarco Marzano's message of "Wed, 17 Aug 2022 11:32:30 +0200")
Message-ID: <878rfvlia2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043835_265330_D1432F83 
X-CRM114-Status: GOOD (  16.19  )
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

Giammarco Marzano <giammarco.marzano@gmail.com> writes:

> this file is for add definition for ZTE MF289F.
>
> The device is currently under review as PR on OpenWRT:
> https://github.com/openwrt/openwrt/pull/10418
>
> Please ignore my email of 3 August, this board binary add support for
> 5Ghz on AT2 version with correct calibration data.
>
> * description for what hardware this is:
>
>   - it is a IPQ4019 based board
>   - one QCA4019 radio is used as 2.4GHz radio
>   - one QCA4019 radio is used as 5Ghz radio in AT2 revision
>   - one QCA9984 radio is used as 5GHz radio in AT1 revision
>
> * origin of the board file: taken from stock firmware image
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=zte,mf289f
>       md5sum: 175139f44d2ae01c2b23e093d571e962
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=zte,mf289f
>       md5sum: 175139f44d2ae01c2b23e093d571e962
>
>
> * attach the actual board file (board.bin)
>
>   - The name of the file is equal to the first id string in the board-2.bin
>     (minus the ".bin")

Note: There was only board file attached but the text listed two.

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=zte,mf289f

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 117 in total

https://github.com/kvalo/ath10k-firmware/commit/5ff99d697bc686a3b77d7644b61aadfa3b1c5c3f

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
