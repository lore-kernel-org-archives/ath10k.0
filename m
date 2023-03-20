Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E416C7618A
	for <ath10k@archiver.kernel.org>; Mon, 20 Mar 2023 15:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8V2TQ0Jnl5R5SYw1wC/048g32ijQxXWPvWNcNXHAKU=; b=E+CAsf9ISdj6SY
	079sfVF7JrC3940zruTSNuWhNO/yFlLHwdYW26i6nZ5OsghvnWtQ9Z3A7ymHT5v4DtLr1kDp/X3/C
	1eZuJTBya1GDFpy4zcaNplk1gASkHv6Cd97/ZNXFc8H7B0S4BInqGGRftW2KkYjCnl7vHW1Tgmd+Z
	1umlfE0TfR10Qksti34KlYwJko7QLe1TjQnKi10XW7VbcI/u9w2zJEq2UprBwZjUXLZxkfyRP47xX
	dy5qvu7BrbkQkh83h/iXjQhd6NkEXqnlDTYw5yI0zL3pY4N2iJPx+nbCLfxx0PNhuMWPJGzaBdwwr
	JTGnpyKDG58U/N3dkaOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHnO-009e6I-31;
	Mon, 20 Mar 2023 15:51:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHnJ-009e4f-2X
	for ath10k@lists.infradead.org;
	Mon, 20 Mar 2023 15:51:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3D619615B1;
	Mon, 20 Mar 2023 15:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16284C433EF;
	Mon, 20 Mar 2023 15:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679327492;
	bh=xdxTWkqHQ/DFeLNH1P6Rtqi196l0qj8AT4Rh9E+VyHU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nlYE5C1+llMnHP+61vBX3sTUsrcrmrKgKJWojtdpLmcHICl0qcBbi6OQ83pp7TMM1
	 q76vTKLVhyskuynBJ2+VHlrMFeaMzRweI4sg8keLp9zfFYCwOXfkhFQ+PZpyUVQG5C
	 hgShYjt1KAe8kMbUf24fYk+uxI7DbFnijaDIwRuQzoQ9JxvAvGKSFqvZcmYaDUk7qt
	 qlt4kEUQWC3r9pLYtcbHyV1SE54cT6DDwwcMEaLWYb/vdXThOKpTV2TW3zpcxBMqjR
	 NFZWIc3CmJZVp/ubKZDnOr6JaL2zqUurPvhqrqQieNQ5g3KsjGhChSLjvwU5++c7+e
	 6uQKbtRfZYQfg==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: [v2] ath10k-firmware: QCA9984 hw1.0: Add Edgecore-ECW5410-L specific BDFs
References: <641498af.df0a0220.27b8f.f0dc@mx.google.com>
Date: Mon, 20 Mar 2023 17:51:30 +0200
In-Reply-To: <641498af.df0a0220.27b8f.f0dc@mx.google.com> (Christian Marangi's
	message of "Fri, 17 Mar 2023 17:43:25 +0100")
Message-ID: <87wn3bfmkd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_085133_869307_2179E67E 
X-CRM114-Status: GOOD (  14.86  )
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
> Resending due to a copypaste error (in ids list IPQ4019 instead of
> QCA9984)
>
> * description for what hardware this is:
>
>   - it is a IPQ806X based board
>   - one QCA9984 radio is used as 2.4GHz radio
>   - one QCA9984 radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - extracted from the original stock firmware image
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA9984 hw1.0
>
>     + bus=pci,bmi-chip-id=0,bmi-board-id=1,variant=Edgecore-ECW5410-L
>       sha256sum:
>       add8a7574c1bce2fedc43fdd69825510be68096aac86c5ef3e5bbd438ff18295
>     + bus=pci,bmi-chip-id=0,bmi-board-id=2,variant=Edgecore-ECW5410-L
>       sha256sum:
>       9786e70bcb62480d24ff8c5801fa1f211fe78eaf217566b4742b475b4034f4f1

Thanks, added to QCA9984/hw1.0/board-2.bin:

New:
bus=pci,bmi-chip-id=0,bmi-board-id=1,variant=Edgecore-ECW5410-L
bus=pci,bmi-chip-id=0,bmi-board-id=2,variant=Edgecore-ECW5410-L

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 22 in total

https://github.com/kvalo/ath10k-firmware/commit/8eee08fa8dfd9275fbc94a9fc40e1f7adcba82e7

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
