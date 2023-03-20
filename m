Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F3DC7618A
	for <ath10k@archiver.kernel.org>; Mon, 20 Mar 2023 05:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5e1DUIttmWWhuEv/+751vcZEy5t8Q+g/4opVjansptI=; b=w8LTbjtQBeZWfy
	KzuC3POZo4Z/x+tSKBKr7eykVx2FbvuseVj1h59KJ7ZGhZkzcE6CI6CZm7M+74J8Q1QSl4wjr86J0
	VI957uxzrUE6mS++B2KSEqszfpglhqwH+I0l9Y/S8SfF5Q/fN9I55saf4fJYV5rykgedJYH0r12/o
	SM6DQzNhqTuk5J5F5oqLZKW5gSFslnt6DSpFu+rcSxW/Vs7wdKfiVSkiWH8S7Xy3Y8B9lpcBV3wb9
	z1a+aKpvmSMDvEmOsZfWIashvz7oey7kOjev4iL+EjoJdaY7LYOPB0S4DM0BXHCzBA/Kear3/aRyD
	pax+HEb423ZNzWKM9slg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe8Wn-008CSq-08;
	Mon, 20 Mar 2023 05:57:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe8Wk-008CS9-2y
	for ath10k@lists.infradead.org;
	Mon, 20 Mar 2023 05:57:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9D738B80B8A;
	Mon, 20 Mar 2023 05:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94EBC4339B;
	Mon, 20 Mar 2023 05:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679291865;
	bh=MVJdg0zuxR0GxfRZ1sE+e2DoNdON37bKMRVAUgs+eRM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=H9Jvp51r+wPlZ5461I16/Ed+R8MZLuSFdnkp1H5AksroxSRhPBJCkXEhcwUowPEWu
	 dPwbwq+sbWKIZc74gotOjZ+OsILLeoBwEWzSVRk8UWZ9CrE8k+J8n+AGbStWap3SrB
	 MU2bqR2xMWWeMQcSSCteTWCx6nGdiJuVddPiavBWVPm+jdOKLqNmGnF9XsQi2D6AlN
	 SbcC1wjhHnh6n1thAyhFc8tSM7F8rI0ctM+y43gmb0IcUHHK/b4XnjC413sgJAG7Q2
	 aLS0ja7JoH37y9IrH02iuCKde3k9ixk0ntEvCi0aVj3J6nmE/KEfGpHH7RM1OxQ59d
	 cdoJgQ82Z0pNw==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add GL-A1300 specific BDFs
References: <641495ca.050a0220.da360.e807@mx.google.com>
Date: Mon, 20 Mar 2023 07:57:42 +0200
In-Reply-To: <641495ca.050a0220.da360.e807@mx.google.com> (Christian Marangi's
	message of "Fri, 17 Mar 2023 17:31:04 +0100")
Message-ID: <87bkkohsmh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_225751_121393_4CDEF8E9 
X-CRM114-Status: GOOD (  16.19  )
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
>   - it is a QCA4019 based board
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
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=GL-A1300.bin
>       sha256sum:
>       7dd85d4d5b95570985ecd4a66f51258d6973f14e57d715e49e0f6006a7b91f66
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=GL-A1300.bin
>       sha256sum:
>       9ec16a0670d71e29c4f9c0758babee85fd57982fad870a78ca779fbd43eb4731
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

I'll drop this one as there's v2.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
