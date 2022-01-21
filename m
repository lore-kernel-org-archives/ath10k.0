Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E19C433FE
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W6KjJJZK0Uo+8xU6Ew15CV8g2Nh4DtRIeMtXIPIerVs=; b=tOg4LSgaA4XlJs
	x32xFR9bCq6WnumQjKsKfXi5ZMLFP6PQR8xH5jFqkR5+vb5cymOjYctxBiokmgOflZ6jeQi23MQMU
	/uS1b7MW2HMh1vf62V0f1MrPa53ECgceEBLW1vQNcnTloIxy+0Ol0YCY54kAjSgsrE2Tkc6Ke3Kfs
	XBG6xKPVy+w8FlP4kwhyrMmY2utq56Jw0Ie2szHknf1tXSKQ1h82JY101jNua4vVrzHA0u9X3/45u
	3o4gy6kfuZIForHvMB+lWCUR3stMUhQ6ipJGOJ6owIfBNBkGinHMk31CYrYJa7961xGq8DovgqyeP
	rmngjXLQNCRjzIstWr5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuQ0-00FFZE-Q2; Fri, 21 Jan 2022 13:57:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuPy-00FFXQ-EB
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:57:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 26222B81FC5;
 Fri, 21 Jan 2022 13:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BE7C340E1;
 Fri, 21 Jan 2022 13:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642773447;
 bh=GCClP8CfJ3EdP90b72CvQzbd+Xv2xiFbykKt77PTnnk=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=nEjZtfHFlAPp3owpy2ZjiztNg3U1IwL4xz7sl7lvRyLZ+ExGlSP93jFNBms6XWT0G
 NjZBo3Xk5wZEjVg+RiVFA22hzP9ctxmmeWRX7He71SD1/RyQGvsUDvTq2zQUGXYRdC
 NfG06OXCEpzdxC6yZGAtFDs5Dfyk1+OPbPRRZGHeiZb7VHL7QAw4xNmnm7NiifUgwj
 L0MAGYtLQi4oeoTbCI5eB9l0DERL82P5JmO8ZGQpIOS4mecvqVla75cWP6wBBXHeFv
 0e0L8xp6QP1uVyEuMGt39wvhVGCDiw6OrctMQ+tpdjpfsaOAEy0+sdU6aquONSQ0nF
 7V938U+YUQCEw==
From: Kalle Valo <kvalo@kernel.org>
To: Joshua Roys <roysjosh@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add ASUS RT-AC42U specific BDFs
References: <CANoNxL-5M3VOH5xujJQJHHGssfJ1O0_RA9=3eN+r+r7d8o7cQQ@mail.gmail.com>
Date: Fri, 21 Jan 2022 15:57:22 +0200
In-Reply-To: <CANoNxL-5M3VOH5xujJQJHHGssfJ1O0_RA9=3eN+r+r7d8o7cQQ@mail.gmail.com>
 (Joshua Roys's message of "Mon, 10 Jan 2022 10:50:20 -0500")
Message-ID: <87pmolb399.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_055730_646873_153F0476 
X-CRM114-Status: GOOD (  14.03  )
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

Joshua Roys <roysjosh@gmail.com> writes:

> This is in support of the OpenWRT bringup for the ASUS RT-ACRH17 a/k/a
> RT-AC42U (online) a/k/a RT-AC82U (GPL sources).
>
> * description of hardware
>   - QCA4019-based board, the vendor sources build off of DK04.1
>   - QCA4019 is used as 2.4 GHz radio
>   - QCA9984 is used as 5 GHz radio (BDF in follow-up email)
>
> * origin of the board file
>   - Pulled from the firmware image 3.0.0.4-382-52517-gb4d36a6
>   - The GPL release of the same version contains a different board file
>   - I opted to go with the board file used in the firmware vs the GPL sources
>
> * IDs to be used with the board file
>   - bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=ASUS-RT-AC42U
>
> * md5sum/sha256sum of the board file
>   - MD5 c19a73d44ff03b23919fbc055fbdf784
>   - SHA256 8d11b37973f44dbc65b40b3159d262c07e677591370f9229af45da466ab5e431
>
> Board file is attached.

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=ASUS-RT-AC42U

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 87 in total

https://github.com/kvalo/ath10k-firmware/commit/29b419cf1b56687d6aebaada1f74592fe629abc3

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
