Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A6DC7618A
	for <ath10k@archiver.kernel.org>; Mon, 20 Mar 2023 15:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LFQOO8b/QWgQ2Nx7ExS3qprGGCwt37XjRUQfeDRhXiQ=; b=l8dNymaEDyKDUK
	SliGnMdO5poEi5S89LcjbNj3VlYB4cVG1tQpwK+xItdbRuc44WDAhttipyU990Cl8drHCjTooQsDV
	CqI/H8/L7Z1CJD1QdWEQfZd76Zji4vztHr7SwuLs0F4UcDjRK3Pv10RhwLZoZ5EBV9o7T7wyqSWMZ
	tbgnuVD6DmL6A3UpA1NdM54/hIAp5sibDuisGaBrXhyE5A2QklWazIn9mwuPmOlcCJpR1t76NRM5w
	FFslYx1hIJ/LNjPvg2Z7CpUyXBRPPGHwQMr4+GnesN4CMpElY/DhOD52MjHexGBmMfBJnz1oI1KGr
	l51HOfJzQ9btr3IBYqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHic-009cXc-0J;
	Mon, 20 Mar 2023 15:46:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHia-009cWh-0q
	for ath10k@lists.infradead.org;
	Mon, 20 Mar 2023 15:46:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E6590B80ECE;
	Mon, 20 Mar 2023 15:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243A1C433EF;
	Mon, 20 Mar 2023 15:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679327197;
	bh=nbEJhYkmjSW1iHcdrxRxxCScOFimZJ9vxS/IPo7x5vw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=LcuOciKhpRi5XAkYht3BIHW/fknoj//4tkt/ijhJue2K5xLP3sA3kNG+pcq8tGnkp
	 sDSU6dIu47MxRvfnu1/bRfyxjqeKdrisfEg/N3p8lttwdCBmssOELyIgbvNPA3Hbpv
	 CApTzIZTFLIPYHWTk4ydtj+s/Ng7Suc5Qr3qbu3bJLbkBmPkOPSQJWWL6S2T7j7zp/
	 bWNhZIyJg4BQozE4LvHEj5kz5jv9FhWfPdfDjqXgX/FlznvvuAmkEvPsGUXxXRbCx+
	 qILL7b00/Rq4uECUgsuRmc5LnguK+aVNz8dIt9Cvrs1IRkciFzNFYow9V5IFScftqI
	 reQS4WJWWDWaQ==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Teltonika-RUTX10 specific BDFs
References: <6415f44e.df0a0220.cb6f6.94bc@mx.google.com>
Date: Mon, 20 Mar 2023 17:46:35 +0200
In-Reply-To: <6415f44e.df0a0220.cb6f6.94bc@mx.google.com> (Christian Marangi's
	message of "Sat, 18 Mar 2023 12:27:18 +0100")
Message-ID: <87h6ufh1d0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_084640_449225_00D0FEB7 
X-CRM114-Status: GOOD (  16.31  )
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
>   - it is a QCA4019 based board
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
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=Teltonika-RUTX10
>       sha256sum:
>       db0d4e81dec9b8a9160c836dc1700acdb3a6e262a9449dc43a94f83272580ce9
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=Teltonika-RUTX10
>       sha256sum:
>       25df9a3d7c722e35bced1bb2845baa71945a964c284bc5f3a37af2244ffc9ecf
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=Teltonika-RUTX10
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=Teltonika-RUTX10

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 136 in total

https://github.com/kvalo/ath10k-firmware/commit/bf30b82ee5fea72b34a7e5ea6a9fc8a0d50242da

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
