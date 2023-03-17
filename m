Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A153AC74A5B
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jL2jBify460pYQLt8EunWTrUglYjsSYZwsMJwpnk3Vs=; b=i3yEuj9UQkiIS6
	fH+ckhn5n34GXSmNdPJRBxavLcGcXMtLg7qjGP511fC9pq+FM1d36clGb1G1tzt18TrGAYQbV7XLJ
	VLt9ruZwh7g8bpIcW+g3nzPaj3r6L17SRTA3nCv8u+O6UVJ7l5NKRBI2AYS4SEMm894UYLn7V0oz0
	E1gGQdHy+ETczv3NKq6PnA9rAD+fMjqjNY8FG42qkhMXsGdSLXeJnl9i1NrjcP4TA4d1SY9GA9rp0
	snHKr5TvTzN6w3H0I9OgAg35zrcWUGz7yK1pTMhwl/wQBIsoUqQjGpvBfOp5/hTXrGStwXpRDwGWh
	UPdvSflD+cIf2s132s5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8JA-0023zv-0i;
	Fri, 17 Mar 2023 11:31:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8J7-0023zQ-1y
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:31:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE5366226D;
	Fri, 17 Mar 2023 11:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825F5C433D2;
	Fri, 17 Mar 2023 11:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679052696;
	bh=7OdlLbrLXb04om3FanCaGHPjUjNNEoUNA0M78GMf3WA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=JgL0HKEQucFclkSup+Vb10z1VcQmSuYo8fQOPp5ycL64zqgrEzViPmUAIGRd/4riM
	 qTEOWbE/sL4P4Wo9nIeQDN4ZrWkAFjyYgUAyjWtesWmJ31z6TkNhhz3KcrCoPozqIc
	 Z1SvUbeJONNDClmqmxz1gG6LjkEJb7geRLJNMVAHEL+25Iruy+VvibhKXnzbPGs+XP
	 W6qOYZ71hsyLYR3i+zajj2bAV4cbOlDumreKLKxVOc09E5/FuAprE5q6jEQle4issJ
	 aDFvLVwbemB2yj725DDrBb3LJy48UPsm5RSBPGbpM88iq+15PzVTyFYMpBFII6fm84
	 yzavBAQoU39JQ==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Aruba AP-365
References: <62bce629.1c69fb81.2a90e.6915@mx.google.com>
Date: Fri, 17 Mar 2023 13:31:33 +0200
In-Reply-To: <62bce629.1c69fb81.2a90e.6915@mx.google.com> (Christian Marangi's
	message of "Thu, 30 Jun 2022 01:54:16 +0200")
Message-ID: <87wn3flilm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043137_689627_97847D77 
X-CRM114-Status: GOOD (  15.88  )
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
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Aruba-AP-365
>       sha256sum:
>       a7fd4b262a3aa7bb1ae57bc442cc1e4bd0eb56c1883bd60d19178cfa1e099f44
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Aruba-AP-365
>       sha256sum:
>       63a8000380ad07689a091528f20f1a24465d08ba9540403a844f9ad6e203a298
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Aruba-AP-365
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Aruba-AP-365

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 101 in total

https://github.com/kvalo/ath10k-firmware/commit/57fc07bd53623a09ea73b2a75859302b9c1a17d1

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
