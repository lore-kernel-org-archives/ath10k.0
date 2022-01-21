Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAB6C433EF
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1PpE/dXhpbIVnY4cDBj8ZWb61qahTFS/o2z3CexNLI=; b=CpD5MDu1Per8M2
	lbByRKD2PriC3ZtYcuVdHloJH+MQ+5Y1xIWqDmV+0h+wLeAJiFp2GaOKf9+jIxeljscjp81ul8TVa
	oJ21zna3FrRgLSikz45lfCD2YY6r94io6TDQb6Vq7ebVYYSnS0dvHfKLUGxrx+X21uwWgJOZpXulW
	ZSZsJKm7yK93GPNMUF+Qfh+ek+DoJdkWgvj0zu7bhxySYv4hHVLjWy930W37y53S/3UMRZQN7UFmg
	QUolxWvB1DfuZsSfLIS1ZlCeZibC9jgbyaNtxcjjhjKwZ2NY0VLEicL9mFjDHr8b2SRrflaXysLJg
	Huqv53THcafjmt4pdM0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuGY-00FDfd-29; Fri, 21 Jan 2022 13:47:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuGV-00FDej-AZ
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:47:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0535EB81FAC;
 Fri, 21 Jan 2022 13:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E169C340E1;
 Fri, 21 Jan 2022 13:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642772860;
 bh=x7o9zjqgfkbCzwQb8cUTABQY0CFZutO8iy+xxbvuLDY=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=SYkca0wU4re8WAWOkzPg/rh6cTfYdZUpZUFZJH/KpPyc9dYj4AWWJBA1FcWGLyXqJ
 GqY8qOiNuHv7HKg2orGxUaR7Z6HFD1H8ZGSBhM1d7cAwCLAq71dyUqmc966K7h4jbR
 3ubpaWfSA1+zak+nFJeVePS/o3LAKKu9sLjgBDmgPnU3E0Wltmp7o5wRhXLftNjKvk
 kMOTQe9s6zyEWlxeOA6r1jkoZVd0h66ms2QOhp8iWdIE61/BcqRQ8v8livYPCg5zpq
 JjLnw85kBgREo0te1zBHV7GfF1G34KDYJfRGyA25uSKN1oUJRjEHBroNclJy3dbmrZ
 EjAleCIT6X0gg==
From: Kalle Valo <kvalo@kernel.org>
To: Yanase Yuki <dev@zpc.sakura.ne.jp>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Buffalo WTR-M2133HP specific
 BDFs
References: <20200414020312.GA910@dev-email>
Date: Fri, 21 Jan 2022 15:47:38 +0200
In-Reply-To: <20200414020312.GA910@dev-email> (Yanase Yuki's message of "Tue, 
 14 Apr 2020 11:03:12 +0900")
Message-ID: <87sfthci9x.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_054743_524274_FDF4B5A2 
X-CRM114-Status: GOOD (  12.28  )
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

Yanase Yuki <dev@zpc.sakura.ne.jp> writes:

> These files are Buffalo WTR-M2133HP specific BDFs extracted
> from stock firmware.
>
> Required information:
>
> * description for what hardware this is:
>   - it is a IPQ4019 based board
>     - one QCA40xx radio is used as 2.4GHz radio
>     - one QCA40xx radio is used as 5GHz radio
>     - one QCA9984 radio is used as 5GHz radio
>
> * origin of the board file
>   - extracted from stock firmware
>
> * ids to be used with the board file
>   - bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Buffalo-WTR-M2133HP
>     - md5sum: f29316d53eb216b97c0c328d508977c5
>     - sha1sum: d175e57fe8e09e309ac3c64d83ce46d7e3f09957
>   - bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Buffalo-WTR-M2133HP
>     - md5sum: b0d03912094d5ba91b3cdbe6c28de951
>     - sha1sum: 6759b46485fc47d93ada76cc8da111ce5e8b31c9

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Buffalo-WTR-M2133HP
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Buffalo-WTR-M2133HP

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 76 in total

https://github.com/kvalo/ath10k-firmware/commit/a92ca2948b1d6111a36163cc91b5b382f434e6fe

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
