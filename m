Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AE1C74A5B
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=04Qh2oxSNIA4acizEtOm+AfY7nqq+Ebz6/P4AD1PZTM=; b=VJDrvmqU76TDvf
	9/KEOrVkEJP5jPEShn8DaGwhFllGfAe55Uim3bzqaEy53bQoXNmkkA7Ij88ynJ94nlI4Fuz8osKqx
	8xAEOahZHQzhUMZXUSdpsrHn65Amnhwo4cCmiY2OgM9zZ7VAdbszOtzmm1uxQjJkp8AgAID2KJ/QL
	s1aQMmZoKfKWlHEMjM2Ct9EYLLC68o2McI9PHkw4jKHHiBJpGl+//zUfMrrtFgT1iLZAzZC5sHoN9
	GOUSVULux5PyhYnApWsXwpdMd4+DweC8KFOkXaehbGhkOBD6b7oAiIff+d6YRZL6r9iPCzDfhc3gb
	R1NywcBDq8OLWLCardRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8KB-002496-18;
	Fri, 17 Mar 2023 11:32:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8K8-00248N-25
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:32:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 40F3FB82560;
	Fri, 17 Mar 2023 11:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C777C433D2;
	Fri, 17 Mar 2023 11:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679052757;
	bh=7maZdIxjGcmjrEpwZAu6hlOZR4zrqwLFpWyHoICT07w=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ic2rSC3lY3V8489SMEbvKrtCPgETlgmQyhJWNhCcZjbd7sn/koHZkDy9szVwWHsVu
	 e93enq3lH0VCDaVZxCJ60+5sGV9JLa9TmIRoinHVDWg0NhMvlQssGNadUGLqqfR5SX
	 9KGAKB6MOtUO/niYyz9tGaFVTHoC/LyeJk1zENaSu9QRczkI1m/6pttpPtOFxWP33n
	 Wj4jTq4/SeP5IQIOfUycpz0Lm521vqdTi9JUlKj0Qb910La0UZlAu4iulE9d/G4NhS
	 w1S51+C6qJkj2WOGzO4dAX6A83dFKwqU73x/oHRUpA7okYBz1cWzcsb4V7BZRLEqbG
	 D0r7XBANkfGlA==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Edgecore OAP100 specific BDFs
References: <62bcea0b.1c69fb81.82b2d.1895@mx.google.com>
Date: Fri, 17 Mar 2023 13:32:33 +0200
In-Reply-To: <62bcea0b.1c69fb81.82b2d.1895@mx.google.com> (Christian Marangi's
	message of "Thu, 30 Jun 2022 02:10:50 +0200")
Message-ID: <87sfe3lijy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043240_830562_CD7FA436 
X-CRM114-Status: GOOD (  15.75  )
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
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Edgecore OAP100
>       sha256sum:
>       9b5b20d34736d7309d04706f1af6097975eeae881aef6922800661feb0fe0506
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Edgecore OAP100
>       sha256sum:
>       b636eb18ed7c2df6a6f2567009bf95c7c2252feea146b4f05d8757514fe1d6e1
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Edgecore OAP100
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Edgecore OAP100

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 103 in total

https://github.com/kvalo/ath10k-firmware/commit/9b26f28e852eeacb0a8a17a623e3a84552a48363

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
