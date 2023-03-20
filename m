Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2ECFC7619A
	for <ath10k@archiver.kernel.org>; Mon, 20 Mar 2023 17:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ny9XtXf7MDXMuDInxoCU97ADt4rYc6gqQzVF7pKa40g=; b=db54nywWUIVLqK
	6IK5tRFFIdVUMGwymSNR0kzgotfz2Hsse90wgtGZGh5OwSRXrdT/LAJscJEvsqG/VoldI+Zn3cFEQ
	vCsJhSkjxb3MXcCDY+gouezBny/4fLTxfQxR4/cB9sxM/2spHk4VlmarkB0b5/sIAM0BJePGgdoON
	tIUOb4X0qVKyBP3t3tCdtVVANdYGHY45ZLOcl81IE3ehmGueGO4iJPN74WxWcsZ1oW4VmvNFh5Dtj
	jAzt4jLCa2+Fv8iXxI+PVyMSRZLH6yhKYFUkGKMgobOVqLO1/blj/SHEuNWAjVVyHR2ij5QBzHFtQ
	VKWfFYCn7N9jGtMqCTCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peIzj-009wFf-21;
	Mon, 20 Mar 2023 17:08:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peIzh-009wEY-15
	for ath10k@lists.infradead.org;
	Mon, 20 Mar 2023 17:08:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0D052B80FA3;
	Mon, 20 Mar 2023 17:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452AFC4339B;
	Mon, 20 Mar 2023 17:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679332102;
	bh=60KWmpYM1ok3uI1wJNWFMb+XYPiHcHccw9ba3zQMFiE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ekc2N/d7/cr9WU6w9ztbEnxX/nUcuQRdviI6RxKYhbeOPjUTQIBMgesM2KN83/Acd
	 SASoTsgYm5z7czWHuBriQrQuEoWsYvNXzcf82lTXIhTvTy5WXekqnjj27HkqNChIGL
	 gUXNBP16H5xK683qLp9YBY1A3jzMcX3cuiFKcbFR3PN5urR5cyGVcRqycQf6QeSXOn
	 I/eONHkpT2uuj8K3fOJfmiT1QuvrQQ4r+VHCfrcpjCScq7gpVXFPJnmNW6PYwVlJda
	 Lwhpjz9jPTNHJn03L2Xx0P8/6CjAAGJUcYKnTNo1NoqjYTPVScE+wRJTU+Sh0Za1Mp
	 CiVg5itr+lNsw==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Extreme-Networks-WS-AP3915i specific BDFs
References: <64149292.050a0220.f2a7c.fe8b@mx.google.com>
Date: Mon, 20 Mar 2023 19:08:18 +0200
In-Reply-To: <64149292.050a0220.f2a7c.fe8b@mx.google.com> (Christian Marangi's
	message of "Fri, 17 Mar 2023 17:17:20 +0100")
Message-ID: <87lejrfj0d.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_100825_515392_FAB57CBF 
X-CRM114-Status: GOOD (  16.29  )
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
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Extreme-Networks-WS-AP3915i.bin
>       sha256sum:
>       278316c2648d24020e45c9c7bec840a7189217c9bcb9e7d2acb7a7c380484c21
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Extreme-Networks-WS-AP3915i.bin
>       sha256sum:
>       747bd54a40790e8f0af7d51320b0a3dd93f059b544337ef78a43a4eb32dcbf16
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Extreme-Networks-WS-AP3915i
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Extreme-Networks-WS-AP3915i

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 147 in total

https://github.com/kvalo/ath10k-firmware/commit/8d4615f6c7f068f215034d74c5963726407bf025

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
