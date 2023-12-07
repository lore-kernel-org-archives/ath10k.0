Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51313C4167B
	for <ath10k@archiver.kernel.org>; Thu,  7 Dec 2023 14:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzGXqLCVjaoY1ayR+sG7poYrOI63cywaobE3iT31AYY=; b=bQdStbJId5E/zobHhTE5H12n2f
	HANdYZLm2UqzFY50t4fzDO3Yuje55mHdnK6yVHewqB2TNaGBz2fSoykHT8cW1VCdVWFD/oWiwStHx
	2ucjdpdHYnk5bwptRJumVSxj6zHNcwask49qgaM8R2YAqqUCXgmJSum0FV+sLjkFLFZ1mUzC71m9m
	YNCrkInjsyQktvFlE53lhZw4FbCKV+LHi3qOZnaRr8Ebcjdc4V7aOkxb9djI0biFLvkQOtLj2h8h2
	p7znqCwJnEWsfzs+rGDAocEJq+NC2XXYiJHRssB/1N919NmSt9eqsmAz/myYLG8hV17/QN07cxUSf
	TSoGS25Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFio-00D4dD-1I;
	Thu, 07 Dec 2023 14:51:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFil-00D4ab-1J
	for ath10k@lists.infradead.org;
	Thu, 07 Dec 2023 14:51:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EC06BB81C1D;
	Thu,  7 Dec 2023 14:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04F9C433C7;
	Thu,  7 Dec 2023 14:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701960677;
	bh=07LfC31X1JJK4ebKP0aqrZNByVpypDPDmuHT5/5EWyY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=PHONMMyIiEEzWUrmIXMzEs0wMy2VB0F9VKVbNqgDuMkPVNLwd/RO1zLvzyqGwL11U
	 qmczsR1tv6Fq2n30DpsaC9oNvSgd45dcGtQOlh+DDH6HLFQ5KToKHZOJgv36XixywK
	 5/LnJ0+uxbVnVyegnoA1F0xt7YUOj8Uoiuz4FuXvwapDT9gM5/rVU0T7WqG/1rFiUq
	 vzmt0uYx/lkdR897fwh3ron0C1IXdXt4RtsuP/l9JYA7mBDQGlAcoxLcKfu8XHVMUm
	 0YUw8ER7VqDVip5S5HFA5Ol0WBaBrfGr0eZgaCjNlP+WE1IgICMAw7ZFkl1bPEk57u
	 uASgcAMRKdgTg==
From: Kalle Valo <kvalo@kernel.org>
To: "Connor Northway" <contact@cnorthway.com>
Cc: <ath10k@lists.infradead.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Eero Cento specific BDFs
References: <CRMGV3H8ML7D.1GG8IDXBQGVY9@sff-f33>
Date: Thu, 07 Dec 2023 16:51:14 +0200
In-Reply-To: <CRMGV3H8ML7D.1GG8IDXBQGVY9@sff-f33> (Connor Northway's message
	of "Sun, 02 Apr 2023 14:03:37 -0400")
Message-ID: <87sf4enk0t.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_065123_594141_95AD2032 
X-CRM114-Status: GOOD (  14.66  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

"Connor Northway" <contact@cnorthway.com> writes:

> Hello,
>
> I am preparing a commit to port OpenWrt to the Eero Cento, and would
> like to provide its board files for inclusion in the official file.
>
> Following the wiki's form:
>
> description for what hardware this is:
>
>    - the Eero Cento (model no. J010001) is an IPQ4019 based router
>    - one QCA40xx radio is used as 2.4GHz radio
>    - one QCA40xx radio is used as 5GHz radio
>
> origin of the board file (did you create it yourself or where you
> downloaded):
>
>    Found in root filesystem of device at
>    "/lib/firmware/ath10k/QCA4019/hw1.0/board-2.bin.cento"
>    and extracted to two files. Added variant string of "Eero-Cento" to
>    each.
>
> ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k):
>
>    bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Eero-Cento
>    md5sum: 8bb585b9badf0e270585329e9bda83e2
>
>    bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Eero-Cento
>    md5sum: 714c291e5bbbeed34d19fe17bb80a36f
>
>
> files are attached, named by their id + ".bin"

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Eero-Cento
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Eero-Cento

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 150 in total

https://github.com/kvalo/ath10k-firmware/commit/9df38db1950db73c75c0ae38d1022ab864ce655e

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

