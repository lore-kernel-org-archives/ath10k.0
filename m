Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C6EC433EF
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 14:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AI2FyrhQaLKioCuw3RXociTD+fX1VRrixX9nP9KsuGs=; b=dPQX/4E8ys2if1
	Kz3pFYYn6UWNDAw46qNItfQD0zG41Noe83DYu/v1iD5brMxE6mkU46Hz6L6XvlJ/KXp5S9wrD3oh8
	IMV61q+bRqF4ZD/F3sRyTjZ7r8kYYASsgXL54HLyGSU7gQgmUzuMB5sN2ZyH8vflPjIqsyqTt1Yi0
	aCdqpkvS92IEJSJ6BDfTVF2TdQj802I5IG3rEoLxz9KnsGgH8UwWYlyEQ1rtgLNb6dJCjc4/nYFqq
	SQUUxgN9Ns8WE64Gh+U2nzo6j7M56KeDv0clk3o2Hi4l9SSH/+fKZ6hNMiy3p6sSsYN2HORNCiMP7
	DDYpOqzcvdOCnynvR+TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuUj-00FHAt-B8; Fri, 21 Jan 2022 14:02:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuUg-00FH9V-7O
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 14:02:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C6ED66176E;
 Fri, 21 Jan 2022 14:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C73C340E1;
 Fri, 21 Jan 2022 14:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642773741;
 bh=RHtiGdUSEwm1QsrxJf0LxsJWuul6vFFfpYjsYDNzLlo=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=UrValyZsopBj9ZgRLf6ybKZQreD/hiYDstCNGwCkTs0jKM/4G14Vb+NrRjl52Mhf7
 yOyQd63JL2ZQREm/oZoi397mIE5OJISmnJgi+/VmvrbJYNRGe2wAsHJL1gpcV9aaqY
 juaIyJ+h72WUMJK+dQw9j9oYvz2EQPMzdKOjMzkYBdBIaNF6yV6+wrt7wbXAfoWI7i
 WWKwfYLZqYS5QMIAo0V3AZNG5Zfql2CU2lVFP9bjTx3oFoRcIS+zh5mbyuz/LHbHmI
 B8LeO1SMi6hQgOBt7Omgf3KYPzA/1nijsuKHTlw6MzKrc9W0duQS+AZp9nXUVhgV5/
 e5QRrcymMIlCA==
From: Kalle Valo <kvalo@kernel.org>
To: <frank.shen@senao.com>
Cc: <ath10k@lists.infradead.org>
Subject: Re: ath10k-firmware: QCA9888 hw2.0: Add EnGenius EMR5000 specific BDFs
References: <5DD5DD3C954B284B8B00D292B7482C300102DD7B83@snex01.senao.com>
Date: Fri, 21 Jan 2022 16:02:19 +0200
In-Reply-To: <5DD5DD3C954B284B8B00D292B7482C300102DD7B83@snex01.senao.com>
 (frank shen's message of "Tue, 24 Sep 2019 06:53:46 +0000")
Message-ID: <878rv9b310.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_060222_338055_738E0613 
X-CRM114-Status: GOOD (  17.24  )
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
> behavior. This request contains the file for QCA9888. The QCA4019 one
> will be submitted in a different request.
>
> Now to the questions from the wiki page [1]:
>
> l       description for what hardware this is:
> -       it is a IPQ4019 based board
> -       one QCA4019 radio is used as 2.4GHz radio
> -       one QCA4019 radio is used as 5GHz radio
> -       an additional QCA9888 5GHz radio is attached via PCI
>
> l       origin of the board file (did you create it yourself or where you downloaded)
> -       taken from stock firmware image
>
> l       ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> -       QCA9888 hw2.0
>
> md5sum of each new board file to add
>
> + bus=pci,bmi-chip-id=0,bmi-board-id=16,variant=EnGenius-EMR5000
> md5sum: a99b498f7820d6d48b63876d8d055338

Thanks, added to QCA9888/hw2.0/board-2.bin:

New:
bus=pci,bmi-chip-id=0,bmi-board-id=16,variant=EnGenius-EMR5000

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 9 in total

https://github.com/kvalo/ath10k-firmware/commit/4965bc76b262b61c476bd4f0606e846a3ef3a1c3

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
