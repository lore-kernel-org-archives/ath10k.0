Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DFEC433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjjZWS7gJL8oeFp0gEgW2rmXFCny6KhlTpSCo6XxGIs=; b=4hlLXndjdRNvB0
	Goub4tr+6TKPp6GCu4S22WU8SgCS1u+4yFZKrcPgfi/gxEbhwQJRylCNtQNDLyVYMdh5Ko1gTmqA4
	n+lihE3D6gziTUtQJ9JqWes12chql9kHQUid/RFVHk7xw33vYpqXKG8eVZ8XHk524FI5VOBTycTWQ
	9vfOql9HliVNUdAPuAUA27Q95udC5BLZB4chHqzDgvgOBo80TjSDz2n8iGFiqvI1TQYys4q+u32Wy
	6EUnFvtOruMZtw3EG76Yx0U71sLawrWg5cPUhwPDot54qqeVYb539iGpZp4ZKaUtq1uKZ0pHhFulT
	+P5OjU13RIzCFF1SJltA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAtit-00F34L-KH; Fri, 21 Jan 2022 13:12:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAtim-00F32W-DT
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:12:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1DE40B81FAC;
 Fri, 21 Jan 2022 13:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CE3C340E1;
 Fri, 21 Jan 2022 13:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642770768;
 bh=KQ6nEOqeQNxnc3T5WaJedePLeDnGCtb4o7pdreE6XVU=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=VlY0U567cQo6gCIFGyo+Fz2YwP6wpGFgnU686Ia+ZqOXq9lpXt99ebX4IrXK5jmbZ
 9YA3OCCNyuMPka+P2/RaQNAF9lduobTVBBEjzae2cx3iHTzeouj2kghQ5Kh5r+8jgW
 UMAdgtoHAF72B1CMy9l38d1wWmY7WaSHxwHkt6WhWxfnKt/7H5NgaA7u5LN/HPWHwj
 J8SFvc3BQmJRbV+623LgYqtIzL7v+8RPIMLW4QaaMTh/u1UXF6zgOMi20qjvWxz/U1
 +wRh/LmvcfuqL5QaqXJ8c29EqV86yaiEVlDtIl12XagLGEeJXGI1z+bXVMjFwT9n0B
 9a1bxlyad9/4g==
From: Kalle Valo <kvalo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Update OpenMesh A62 specific BDFs
References: <2312547.eMb23psXx6@bentobox>
Date: Fri, 21 Jan 2022 15:12:46 +0200
In-Reply-To: <2312547.eMb23psXx6@bentobox> (Sven Eckelmann's message of "Mon, 
 01 Jul 2019 11:42:59 +0200")
Message-ID: <87y239fd0x.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_051252_645854_C0DB47D1 
X-CRM114-Status: GOOD (  23.38  )
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

> [resent of mail from 2019-06-11; seems like @datto.com mail server ate the
>  outgoing mails]
>
> Hi,
>
> The OpenMesh A62 AP requires three special BDFs to get the Wi-Fi PHYs working 
> (correctly). The  bmi-board-id='s would clash with one of the the IPQ401X 
> AP-DK boards because QCA doesn't provide special IDs for customers and seems 
> to use the AP-DK board-ids in the wifi firmware to change its behavior. This 
> request contains the two files for QCA4019. The QCA9888 one will be submitted 
> in a different request.
>
> This update contains:
>
> * add of the antenna gain
> * adjustments of the antenna sensitivity (see minCCA power threshold and
>   configAddr)
> * CTLs for DFS channels
>
> It supersedes https://lkml.kernel.org/r/2795259.fejyDvFH3e@bentobox
>
>
> Now to the questions from the wiki page [1]:
>
> * description for what hardware this is:
>
>   - it is a QCA4018 based module (based on qcom-ipq4019-ap.dk04.1)
>   - one QCA4018 radio is used as 2.4GHz radio
>   - one QCA4018 radio is used as 5GHz radio
>   - an additional QCA9888 5GHz radio is attached via PCI
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - it was created by the ODM and QCA for the OpenMesh A62
>   - was provided by the ODM to OpenMesh for this product (this includes
>     distribution)
>   - it is the latest release from 2018-11-28 (with fix to have
>     antennagain at correct position)
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=OM-A62
>       md5sum: 7642733bfd0c53927209a25440a484e3
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=OM-A62
>       md5sum: ef250f4c8ac057e9995b08e28c482423
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:


Changed:
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=OM-A62
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=OM-A62

Deleted:

0 board image(s) added, 2 changed, 0 deleted, 50 in total

https://github.com/kvalo/ath10k-firmware/commit/f305604442001fd45f357fed38a6c4a59868f4ee

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
