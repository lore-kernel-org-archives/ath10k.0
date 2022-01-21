Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A2CC433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXx3CeqoeBo1pepkf/iutihUFY7zeK0VXj1RMhMHwho=; b=DEYX2vR2OcpqgV
	pnXAUGxq0C8WI7uXRKfhfIKirLIhDGOovt7xEvE2w8Ghgv8FymX9G+gNa7mFRJOkTn3aEZqf18uFa
	8muVdVb+EWdqK8g8LYa6UOteugkowos/S20kPuSkMrit+YWocS8Y+rzDYf0tEd8fgU4KDhr8U0mI7
	8+zEHMVVnFga1SeJXoZ3tSzYqk4a1iMsy97SIv0NqmDF0PvEpofTJ2yQLChe86XmJ4YtkBhrkM0sa
	xN025/oaB3bmkdEIxJ41muuQIwpMvs+pVgNOs+o3qMiaTH6y7tqC9iyFoCQ0SaYksqfwXb8hOGPlR
	zcAGmQ3CK3GJXGCX4aig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAvN2-00FRJ9-Jf; Fri, 21 Jan 2022 14:58:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAvMy-00FRHX-76
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 14:58:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5B086190D;
 Fri, 21 Jan 2022 14:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF9EC340E1;
 Fri, 21 Jan 2022 14:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642777107;
 bh=4IJ2TPWv6AZAGGENb/bwArcA5CtJHek7b9SIJmO1rvM=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=nz5EJ+3TATaNVG3oT6idKQHzwA0F4AMHqanO8Cbz3GzIM2hBKXeFL31P+RIZoDO9U
 Xi0P4ARXmWfgmRckMXEPrTJFMnCMbXHwhw4MjrkZWL/6CWD5qCgvU9lg5SP9rPMw9X
 JyanIjMx+gSjYqu6rsCwMwGq5C+MxfZaLc546/kSbJHUy3cPVyKFcyEQXgqjYX3PeB
 hf07gOxLO5+TTweojCCMgrVEY0BmCco9wuYIJ8eCvIRaiYgEdUx9Cg43Vi7WAgKNdX
 hLLW+XdasifJytmuWCyaTNOPOeT7DY3ZtwP5AMHNpoitEF6wRy8irOcjMqzxfXh9BP
 jMMfgJL7OPyJA==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA9980 hw2.0: add ASRock G10 specific BDFs
References: <4031513.NO3PqbrPAa@debian64>
Date: Fri, 21 Jan 2022 16:58:24 +0200
In-Reply-To: <4031513.NO3PqbrPAa@debian64> (Christian Lamparter's message of
 "Fri, 10 Apr 2020 15:01:23 +0200")
Message-ID: <8735lh9lv3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_065828_340124_6A78D042 
X-CRM114-Status: GOOD (  15.81  )
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

Christian Lamparter <chunkeey@gmail.com> writes:

> Hi,
>
> this is a set of board.bin files for the ASRock G10,
> which I wish to be added to the ath10k-firmware repository.
>
> As per the current "Submitting board files" guidelines [1]:
>
> * description for what hardware this is:
>   - it is a IPQ8064 based board with
>     - one QCA9980 radio is used as 2.4 GHz radio
>     - one QCA9980 radio is used as 5 GHz radio
>
> * origin of the board file (did you create it yourself or where you downloaded
>   all files were extracted from official vendor firmware which was on the device.
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>   - qca9980 hw2.0
>     + bus=pci,bmi-chip-id=1,bmi-board-id=1,variant=ASRock-G10
>     + bus=pci,bmi-chip-id=1,bmi-board-id=2,variant=ASRock-G10
> * md5sum of each new board file to add
>
> ae069744baeebfd6861e8080a92439ca  bus=pci,bmi-chip-id=1,bmi-board-id=1,variant=ASRock-G10 
> 9e196846841a186e61ea208cc873384c  bus=pci,bmi-chip-id=1,bmi-board-id=2,variant=ASRock-G10

Thanks, added to QCA99X0/hw2.0/board-2.bin:

New:
bus=pci,bmi-chip-id=1,bmi-board-id=1,variant=ASRock-G10
bus=pci,bmi-chip-id=1,bmi-board-id=2,variant=ASRock-G10

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 13 in total

https://github.com/kvalo/ath10k-firmware/commit/e404444dfc0baf7d0fcde21ab8ec333608c9960c

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
