Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0831BC433FE
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ftXom2UnthOvYyk8usbcrcGrWbBH326J2jP7x2jSwk=; b=CYucpXewQKfZdE
	Nj3aIkcTAK/X95NiuihCAWOLI5ZXEIRU3xaRDeowwSvQYTWNgmdTvmEyIXZeJoAU5vR5udfrrsMDF
	YH4gMrcWEqAjWyAQkgU9zspQBUVAtmlVFoDQw4yqF3bPf5YFrqcSt0fOm564GBTbsAX7PlW6vIyQJ
	enn2mCR1/1FcOFOA0eYaFsc+uuauuqRMtxLwR/P/61NMFOCnZ8158+DquEzb+8ZJcHyJYYPs8fMsK
	Y0Rbzd2O2e5s54hhKU6twfc8ibosayBxJmj+nOoUUD6fLpfqhX6ZK5CoXXVvrIXifVtaTPL2oI9nE
	y0i0WOzK3M6Eu6Ry9SFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAtvc-00F91F-4o; Fri, 21 Jan 2022 13:26:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAtvU-00F8wS-KM
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:26:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2FF03B81EAC;
 Fri, 21 Jan 2022 13:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50EC5C340E1;
 Fri, 21 Jan 2022 13:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642771557;
 bh=dnmqzg0eU6yOJOtoBOcaSVEgNxuj16UCgwnNXP4/3BU=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=DDDUAiWzkmwTdqI5MfauLe6MfUfM2/wNx9Wc9kbtTpFCgRmeKd51IxxnlVVjCOMgu
 UO6kszSIwbw0sYBUXRUVpr7WdHJHXKU7y3l/p8C63tew2/v7MMfhIhfFFn/3lBSaSz
 F4cFlXJz+GPwCyXcgK+a+qVReEvYWP95t8dKllMvbg3GTLU1eb8StH0/cVvlYluP9X
 vhBb8JGvXFBD/L2ouulHmIQU32j7iQLp3VyPYmeq0+qViGX0QjFmfQDYZO1WBP4nZY
 yJ+IBk8P0TQArRKqxNTvBaUZy35fHLcAnZNKmuHy1BE/r1cjfBurbdL1OpNEIh1cmE
 UzXElcPk7Bzzw==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robimarko@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Update 8devices Habanero specific
 BDFs
References: <CAOX2RU6wCpdtUMSrnaPK9Bg8hyn-wqnAeZgszYe-T45MH4E+cw@mail.gmail.com>
Date: Fri, 21 Jan 2022 15:25:55 +0200
In-Reply-To: <CAOX2RU6wCpdtUMSrnaPK9Bg8hyn-wqnAeZgszYe-T45MH4E+cw@mail.gmail.com>
 (Robert Marko's message of "Mon, 23 Sep 2019 11:43:32 +0200")
Message-ID: <874k5xfcf0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_052600_850335_4EB8BCFC 
X-CRM114-Status: GOOD (  21.19  )
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

> I am currently working on the 8devices Habanero support for
> OpenWrt. This
> AP requires two special BDFs to get the Wi-Fi PHYs working (correctly). The
> bmi-board-id='s would clash with one of the the IPQ401X AP-DK boards because
> QCA doesn't provide special IDs for customers and seems to use the AP-DK
> board-ids in the wifi firmware to change its behavior.
>
> This update improves 5GHz radio.
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
>      56202ea33e96f16c65b75d464451c251
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Do note that it seems that only one board file contents was actually
changed, was that on purpose?

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:


Changed:
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=8devices-Habanero

Deleted:

0 board image(s) added, 1 changed, 0 deleted, 60 in total

https://github.com/kvalo/ath10k-firmware/commit/1fad4d7a4aab0bb7daaabd5324c2b87e438d9bac


-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
