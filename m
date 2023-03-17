Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B10C76195
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOYRunhygJjZXNWD7OslP5j53hxC4trrokyYwA8YZOc=; b=p+83FVqnFXY4DL
	hhanYuWq34WTYlhsrhc005uDaNHtduhPwXFsYry5RL54qlGU7pD3eBkUszEOxtb6VzaWbTZoqJJt8
	4YWQJTsc8H8sqsJ65Xnr4mhoOc3T5JsR1uJ1dtF6g8YoYBQRuhePhhLl1/HLCVs33vy8zefgsLEAH
	6NZZvic40sxPi/Dlv7HwcYNObd2nc0p5P9f4NFjPc0PU6mYR8ZS0V+QD0HzqSGjtwX/NvxuMOHTmi
	YhQ/LuTlXVF4scT4+3LLF5aj3MuXhczNPU1eQyfuoWazQMHTjvPl1K2I0H71kZhf/sb/uVdzBHJZC
	6YVkC+WaHrIMQUj8TMsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8H2-0023iR-09;
	Fri, 17 Mar 2023 11:29:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Gz-0023he-0o
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:29:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C6E5CB82560;
	Fri, 17 Mar 2023 11:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4534C433D2;
	Fri, 17 Mar 2023 11:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679052562;
	bh=I+TvAqYBam468o4zSeU2HEDKKUQsoaixEk0b0wO/RFQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kj7U5NXkYlBh7w/A+gv4rewazraXfPPAj5LxAhjL/Ju7vDdY5m8hFw77D+eycW+ur
	 PdL3jQPkzkJbJnewvyq6aDrqPSnYf3vydONbKh+pmS6Ky1yuet5TjOJ3ASphJSHfXX
	 5YU4Asm5YGddzmzo+20wQKq4UsgyfmNNJdWiY/eYhhicG8mYw9DufiffOMtq8EkkWt
	 KgR7ma/48dp9fLqt6/h5VsQrvZL2MxThziv2Q5X/YYnmE1i1AHc69pRWrx1XoU2cUw
	 KW5b9Yef0EBsL+wb4Lyq+p1wtfQO/BuBloWZUo06VpTkKhDRqDwlDlFkqZmJPbqtJm
	 jAEPUj3AT8FsA==
From: Kalle Valo <kvalo@kernel.org>
To: Semih <strstgs@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: ASUS-MAP-AC1300
References: <CAAsRjRkCQQYgkWycitcRFJqGgKJzsOFLr=qWmUz5sP9=ekPKgQ@mail.gmail.com>
Date: Fri, 17 Mar 2023 13:29:19 +0200
In-Reply-To: <CAAsRjRkCQQYgkWycitcRFJqGgKJzsOFLr=qWmUz5sP9=ekPKgQ@mail.gmail.com>
	(Semih's message of "Mon, 20 Jun 2022 22:46:48 +0300")
Message-ID: <875yazmx9s.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_042925_433429_C647815F 
X-CRM114-Status: UNSURE (   6.41  )
X-CRM114-Notice: Please train this message.
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

Semih <strstgs@gmail.com> writes:

> Board files of Asus MAP-AC1300 (Lyra Mini) router. Board files from OEM GPL.
>
>
> bus=bus=ahb,bmi-chip-id=0,bmi-board-id=24,variant=ASUS-MAP-AC1300
> BoardLength: 12064
> BoardCRC32: e23a64d6
> BoardMD5: 403ed955c436842dcf1c1e8f0067a341
>
>
> bus=bus=ahb,bmi-chip-id=0,bmi-board-id=25,variant=ASUS-MAP-AC1300
> BoardLength: 12064
> BoardCRC32: 76e66322
> BoardMD5: c4ee6a9129e8f9c81b2bb9f278bc6338

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=24,variant=ASUS-MAP-AC1300
bus=ahb,bmi-chip-id=0,bmi-board-id=25,variant=ASUS-MAP-AC1300

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 97 in total

https://github.com/kvalo/ath10k-firmware/commit/9971dc20f4c479620c31f8a6f4ddcca315a46b46

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
