Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3E6C433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMGq1LLvGgz1pUofI+Oli9VuzxGGXPnGh9RreC2GY0E=; b=lEDMXJ+CqmtX35
	B4Tr1jXkf35OXhdscBLdqSC1uG3aX4KGuuWFQUkWegNS+bvaLZws7GT2FcnrdJryt+oO1CZ6VEXgP
	RoKpt4ZFaEj/HFbkMwnjIJE6Wqu0q0v2fEV5tEvOHtUOAa5ipBJ9407zdlLbcnLNnTjCKtyBKlCOs
	p9k3+yp1XA47RvcteOuFEAMknQR/BB2XfNNLHQNN2QR5rg9dpZD5yUVq8bGDQFx6InSlJCA07FgWB
	rlFzT666CdRlFtY5RaIiQyxdrlS0tALFyMKoJn37NScX1g0UEOPoUHeJMAmqJ+ALQxKgKybs1Ikxi
	ApnKg73EFwF52YIrG3Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAtsI-00F7Nq-Uo; Fri, 21 Jan 2022 13:22:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAtoV-00F5g3-5s
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:18:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C7C81B81FAD;
 Fri, 21 Jan 2022 13:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F08C340E1;
 Fri, 21 Jan 2022 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642771124;
 bh=GjhjNzKzjgcrCJG8esKrd/1vCQ36OAVHD51GAQTyE28=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=RQv+6pkv1TSrtSHCtN33VWcyX2ojD4i1IncDaIEd2nuU5C+6FYfI/EUAOPhWLkSPW
 UfzHcTe4WPLdLXzB5miMRH293qbBVmO4V3sjNgj2Ki3iF9qUGWpO20gR3htLWW/SU4
 iKdU2rkFH1xgbdIjcsiGKcYjjkNPLNrh7M9hJsBtMyrmv6lrcHsVwfeiQ4f1k4QlqG
 V19X5J7G/G7yC9EkmiVnPuKmB2+UvjdZDZuTK2iq7bCZ+5H06++uBg3zpBiuFOt2do
 DpsygIVu2paRxZKUhanZBJluPUkRCe4GqtER32Y4U5NH1VjGxTjjknkkjfIDlvNwjR
 mAJD0gR7Fz+fg==
From: Kalle Valo <kvalo@kernel.org>
To: <frank.shen@senao.com>
Cc: <ath10k@lists.infradead.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add EnGenius EMR3500 specific BDFs
References: <5DD5DD3C954B284B8B00D292B7482C300102DCDC99@snex01.senao.com>
Date: Fri, 21 Jan 2022 15:18:41 +0200
In-Reply-To: <5DD5DD3C954B284B8B00D292B7482C300102DCDC99@snex01.senao.com>
 (frank shen's message of "Thu, 12 Sep 2019 03:46:33 +0000")
Message-ID: <87h79xfcr2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_051847_413385_6F908336 
X-CRM114-Status: GOOD (  16.03  )
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

<frank.shen@senao.com> writes:

> The support for this device was added a while ago to OpenWrt. This AP
> requires two special BDFs to get the Wi-Fi PHYs working (correctly).
> The bmi-board-id='s would clash with one of the the IPQ401X AP-DK
> boards because QCA doesn't provide special IDs for customers and seems
> to use the AP-DK board-ids in the wifi firmware to change its
> behavior.
>
> Now to the questions from the wiki page [1]:
>
> l       description for what hardware this is:
> -       it is a IPQ4018 based board
> -       one QCA40xx radio is used as 2.4GHz radio
> -       one QCA40xx radio is used as 5GHz radio
>
> l       origin of the board file (did you create it yourself or where you downloaded)
> -       taken from stock firmware image
>
> l       ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> -        QCA4019 hw1.0
>
> md5sum of each new board file to add
> + bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=EnGenius-EMR3500'
> md5sum: 0ca46eac922e0f74953bac82eea909e1
> + bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=EnGenius-EMR3500'
> md5sum: a949912fc3b94c16243b2802af54c188

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=EnGenius-EMR3500
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=EnGenius-EMR3500

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 56 in total

https://github.com/kvalo/ath10k-firmware/commit/4f719af2397bfdfa03921933d1df0208fa923d72

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
