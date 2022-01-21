Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375D8C433EF
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aArbhAWDFA7LKiQN759h0ncAoDqGzDck5huzEPeROgo=; b=bqvHWN7VMECfeX
	n57sumEzuWBgnI/Pd5RMBxdd702gPtM/3bWSl6CO8ZAAmMAaPk39+fCbUdORZFqoOtKZ8HuhTXaNt
	xJr7PGF+4UneMtJm9AEzC10rNCjJFvCjRVQEUc9c6uj7Q85ujnqTxmJ8Bhb8RFLzo+cc272LPH6ON
	w2USnkRNkqQMgK7mY1dpOplxJU54SYeuEu8fe/xt/CV5DWhaUFFlDM5TUSzNRR4V4ke5WxePYIHp2
	b7cJkckORa0DkXbGwe7bkbACWaQJwStPYgr/YCmKlNsWqgvENIc5lPC5tRs5vss/x/WAXBc3fluW4
	SsY2BIm6Pn7IRjj9nCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAtpp-00F6Ie-PB; Fri, 21 Jan 2022 13:20:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAtn8-00F51I-Hq
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:17:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EDBA36146A;
 Fri, 21 Jan 2022 13:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33162C340E4;
 Fri, 21 Jan 2022 13:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642771040;
 bh=aW+7p5B31a6bSxin/A9V1YL5/RfItbhfJsSniHcLKcw=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=JRGjoPHId3OjjeDNP8LB0450iwqOGoJNG3boLYmoqsAg9b2iqRqiq+Tg/qMWDdUqP
 ZDVY+q/kz7zyl4g8CNfScT5A/PzRmOBAU3pR6R5gwz/Rw0mjI/pkuVFgNDRbo8EAo1
 irns3j/KZclKTwPuQSeVaW+gEpS1+97o7DbLPBvqHOwNYWMgcNWLljjoOuDxIeKOrI
 xQvKLh7DXxlW47kzkdjqFUOVeEmVkRfslKhs1Q2muSamUTnZ9BvZ3N4UZADFz/rFoc
 e6j82iklnHQfeedj3C5cev7oSM1Z2dXwxtKTFrTCEtc0OPr7bqkG0H561Ao6FPUe0R
 /P7ug/rSXTjfg==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robimarko@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add 8devices Habanero specific
 BDFs
References: <CAOX2RU5Y4Wcw07YQ3Ly8v6jSWL1weB+-Eng_tLpNA0HMnQbB_A@mail.gmail.com>
Date: Fri, 21 Jan 2022 15:17:18 +0200
In-Reply-To: <CAOX2RU5Y4Wcw07YQ3Ly8v6jSWL1weB+-Eng_tLpNA0HMnQbB_A@mail.gmail.com>
 (Robert Marko's message of "Wed, 11 Sep 2019 20:34:12 +0200")
Message-ID: <87lez9fctd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_051722_678975_206C7E09 
X-CRM114-Status: GOOD (  20.82  )
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

Robert Marko <robimarko@gmail.com> writes:

> Hi,
>
> I am currently working on the 8devices Habanero support for
> OpenWrt. This
> AP requires two special BDFs to get the Wi-Fi PHYs working (correctly). The
> bmi-board-id='s would clash with one of the the IPQ401X AP-DK boards because
> QCA doesn't provide special IDs for customers and seems to use the AP-DK
> board-ids in the wifi firmware to change its behavior.
>
> Now to the questions from the wiki page [1]:
>
> * description for what hardware this is:
>
>   - it is a QCA4019 based module
>   - one QCA4019 radio is used as 2.4GHz radio
>   - one QCA4019 radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - it was pulled from the 8devices OpenWrt fork
>   - it is based on latest version
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>
>   + bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=8devices-Habanero
>      md5sum:
>      64d0817da715875483d323f2bb0c898c
>
>   + bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=8devices-Habanero
>      md5sum:
>      4e14531d145727a6b953113ae28f8c38
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=8devices-Habanero
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=8devices-Habanero

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 54 in total

https://github.com/kvalo/ath10k-firmware/commit/e2fe755032ad9f3f6a35a253947676e002b9de4f

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
