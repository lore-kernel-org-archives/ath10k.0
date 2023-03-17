Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FD8C6FD1D
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0NjgwfiTEc78shaUf4Ca9vJPgjzMGn3NzrgRmYd9p+8=; b=Iq1eNmwwzuCBiZ
	+7CQakjOOkL3R4PRUkeR7RjS4LaElKg8hFZ5hWNs8FGXq6HDVzRbyksvvyaLokeDZf7EwmF9h3p+l
	FkIX5naDgULl0exP+c/9P5kOf3BajnvneVPOysyNvqwctC4FvSQU3IjERm0s6eSbLG+htvWvBO/Hm
	KJhAPWrhCOnRmZf/qyJ5yAI1Xrm5i/Cc2cUbqpUOP7DSDqj7uQWl7IFT3QQGMZp8Wpp3LD01O3Z2w
	VntJlMLwdOCQzShyAFTkWlnwBVTHU7aiHyfN+KChYXjQ0RO8sr1eKhoJIgYpdHp/LSgtHd54MVbCV
	KhHiRRtlAJ4n9JtOxulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8X9-0027Nk-27;
	Fri, 17 Mar 2023 11:46:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8X7-0027Me-1b
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:46:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E89726228D;
	Fri, 17 Mar 2023 11:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C212BC433EF;
	Fri, 17 Mar 2023 11:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679053564;
	bh=7sMdoofiPFjueS94DLc1CgO9pBCCAHcMwVPE7WwaGj4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Q2F0rKF8+cEHaFTtahgPnixXZNYnrw4rofdZ9C6q/htdT3lFOdY+52q24MqSaYcXg
	 /tjAQxwVyWeTpx1JpRkUUeegzxfHk0hK7WLPDc7Z2rOqmrUX82TZgOPGA6/UDLWKzz
	 RWruVxwIwDX3tfmPDwgkcY7U3FZ+fwtPmVUku5GRYdh59B8n4kbySDwetskLt+dp4p
	 9502yGQy3q8IdHfxbHMKIgKBiMB5PaXnu3Gu7i+Wok67353YyQ1W4BklCj+on72oHR
	 PLaS0yN++iTK1SqtRj/2nDY7UTjFuA6Qma518aaD831OEN7MnfMWzjloKQF+dhlDw6
	 Ixvifo0Y19fPQ==
From: Kalle Valo <kvalo@kernel.org>
To: Mantas <mantas@8devices.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Update 8devices Jalapeno specific BDFs
References: <76ce61b0-e122-5402-d9bf-f6e11b611603@8devices.com>
Date: Fri, 17 Mar 2023 13:45:58 +0200
In-Reply-To: <76ce61b0-e122-5402-d9bf-f6e11b611603@8devices.com> (Mantas's
	message of "Wed, 8 Mar 2023 14:40:16 +0200")
Message-ID: <87cz57k3d5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_044605_574266_AC83EA92 
X-CRM114-Status: GOOD (  12.22  )
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

Mantas <mantas@8devices.com> writes:

> This updates 8devices Jalapeno BDF to fix temperature sensor readout.
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
>   - updated file myself [1]
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=8devices-Jalapeno
>       md5sum:
>       047757f6ab01f7aa731997e607993116
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=8devices-Jalapeno
>       md5sum:
>       bdb7619af5e098e1d08aafb07324e1ce

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:


Changed:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=8devices-Jalapeno
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=8devices-Jalapeno

Deleted:

0 board image(s) added, 2 changed, 0 deleted, 126 in total

https://github.com/kvalo/ath10k-firmware/commit/fedcd44bde5144d5ed21963ebee015f307a8e709


-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
