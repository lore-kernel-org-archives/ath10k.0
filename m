Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1352C7618D
	for <ath10k@archiver.kernel.org>; Mon, 20 Mar 2023 15:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m5CRFwL9DB/2uOcpJHG0GU93K+1lscGk4vCVdjN2hs4=; b=mzZuN+2MBQFLhh
	5DzB1GA8ghrBJU4MIE/Kx57dtKq+nn41f5PjE4mAOxWwTq0kqKhVFFLoAU3vuXW6LV9TQ/R6+ylVo
	YkNV8bfcCGiXhYIwKH16YdniFKNmS40/K0kEjegLAt6yNxEjFF7jBgv4zfUEJYbYpU9lsXpNXa71k
	YG4DgmRRuEkAbEY5o8gnAbbZqvr0/mJRNn7957MuMygJ6+89SEpxnPXJjuHFTh6B7Y6NoTz7DIMDo
	2ez5gxOFMmbKaI1UFL9IGdixn+kq86C49ok5ZJ2XAHx2aV5onOcYSGsrPc0v024KWeL0Rdq4+JvZK
	7GyAfG/ZCmLjTHQVwfQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHjx-009cqs-2m;
	Mon, 20 Mar 2023 15:48:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHjl-009clh-1p
	for ath10k@lists.infradead.org;
	Mon, 20 Mar 2023 15:47:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D4BE5B80ECE;
	Mon, 20 Mar 2023 15:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C68C433D2;
	Mon, 20 Mar 2023 15:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679327270;
	bh=1OtnWRLWSL4UAgv9PI+0MOjy0ROelFEyqpura2x+2Bo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=gK0t8aAdWfJD+O5DG/tu1NQoxxx5u12QqW7527S9gzVTHItsReOeOfRuHtkwqsU5C
	 HGx72fSYb8fPQiZpwc0oIGNzxbUnBA1ZSmZy26RJzIvJVlUzNok1v1GdQN+XnDu9na
	 O8LuL4GEd0exEcV5lVxJzGNkBfYcvWUJTR5tnRO9bU8lpZMKWE5wrL7rKYu2H5y2AP
	 O2Is2FwsotAAu7YhwnWBmEoQ4BZxjAphq8jnm1vATdmvdv9Gl7Wbu596eR2RMODEv2
	 dMwOgcRu2TxZt5vuep6o4aZCHOsNNmgSKgj905ccrhrJg/kbp+rZnTqr9Q3sdppDwP
	 dLniDRaxdqsJw==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Qxwlan-E2600AC specific BDFs
References: <6415f538.050a0220.c2418.c45f@mx.google.com>
Date: Mon, 20 Mar 2023 17:47:48 +0200
In-Reply-To: <6415f538.050a0220.c2418.c45f@mx.google.com> (Christian Marangi's
	message of "Sat, 18 Mar 2023 12:31:31 +0100")
Message-ID: <87cz53h1az.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_084753_745013_40F014DF 
X-CRM114-Status: GOOD (  16.33  )
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
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=28,variant=Qxwlan-E2600AC
>       sha256sum:
>       149658af4a352a7c993413ab72d83acc3b50a57f761ca5bcf5e597a98335aef5
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=29,variant=Qxwlan-E2600AC
>       sha256sum:
>       8aa2d5cf03c2b8e70452525edf6735d4313002c4bfd1f5054bdc2162b2f192eb
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=30,variant=Qxwlan-E2600AC
>       sha256sum:
>       88644ce0bb255157d4a1d8185959edcbcdca0af62e8a9e82855047759ad28b9f
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=28,variant=Qxwlan-E2600AC
bus=ahb,bmi-chip-id=0,bmi-board-id=29,variant=Qxwlan-E2600AC
bus=ahb,bmi-chip-id=0,bmi-board-id=30,variant=Qxwlan-E2600AC

Changed:


Deleted:

3 board image(s) added, 0 changed, 0 deleted, 139 in total

https://github.com/kvalo/ath10k-firmware/commit/debba9ed610e558590eea7d66e63dfc2fb12b1c2

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
