Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E757DC433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IoWXZnU415A+h1u/8+JAPzZrkyA9+GzVGI/TxAeuzUo=; b=FKv+H2Gf1FOTLR
	9kEbh8KdRc/26lXGMQssYK/3yW52KCoZyZzmgHhMHSl2kTg9R5driYFRrtH+DglEPOHee1950TCee
	W8IzqM34uSAGK6lkFKfk5fDldZuYMcifa8JyfXq2w98jsdIT2Eg1GWhSJ0qfjRcfLfWq6o48PoOMK
	ZeyrSRSXPOWI/GG37KYSpdSHwseg+zbeKdF4HdGQmmZPz7wqqdFm1A3AuBBgdl8MwuGvxPpmnsAXk
	T3xKmwQNPYIuMOek59DsQKs+VuYUaW+x+sS/XM5HWYETaQZKMMYkcpGl3EuIvy9KCeBerZq4/OWdS
	NnXZ/N1usF3kmtCH3b5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAtwY-00F9Sd-Np; Fri, 21 Jan 2022 13:27:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAtwT-00F9PG-6S
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:27:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CD019B81EAC;
 Fri, 21 Jan 2022 13:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEAF6C340E1;
 Fri, 21 Jan 2022 13:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642771618;
 bh=O/vT+VV20MtIhSA6I1YDlX5aMEpzDSssu/IPeMgdOS8=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=Tr4OnNC9whoHHPUk5LIkYiSqgxslBaorI/0yWBPA4Sge3IodamdAH7lWtFabULkoU
 fvTBuAldzNqy24Z6xPYSznyc2qay8Pa03g00ljCOeJLqxigGCaqkn1xA/7JALmE2qY
 4Al2ZGVrG6oY91VfcVprSmXF7Gv6DB4ZoI/UlVlejbzwMz5gSCLNA34PXgU5rhu3ca
 r7AOyZpeHnPz5nXDU8I/ADuJyJsT9S1tsQvKtSDFpHLfjjuQyjlhNITPyqy26Vq0ca
 GZ7scYvwkjBTy0X0dH87jl7HTaVgpZLhIGFQ1QXz0Pdlug8uImCKw4nFEfod8quBxO
 N5lLljLA1eAgA==
From: Kalle Valo <kvalo@kernel.org>
To: <frank.shen@senao.com>
Cc: <ath10k@lists.infradead.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add EnGenius EMR5000 specific BDFs
References: <5DD5DD3C954B284B8B00D292B7482C300102DD7B59@snex01.senao.com>
Date: Fri, 21 Jan 2022 15:26:52 +0200
In-Reply-To: <5DD5DD3C954B284B8B00D292B7482C300102DD7B59@snex01.senao.com>
 (frank shen's message of "Tue, 24 Sep 2019 06:48:10 +0000")
Message-ID: <87zgnpdxsz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_052701_422636_1E88795C 
X-CRM114-Status: GOOD (  17.32  )
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

> Hi,
>
> The support for this device was added a while ago to OpenWrt. This AP
> requires two special BDFs to get the Wi-Fi PHYs working (correctly).
> The bmi-board-id='s would clash with one of the the IPQ401X AP-DK
> boards because QCA doesn't provide special IDs for customers and seems
> to use the AP-DK board-ids in the wifi firmware to change its
> behavior. This request contains the two files for QCA4019. The QCA9888
> one will be submitted in a different request.
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
> -       QCA4019 hw1.0
>
> md5sum of each new board file to add
> + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=EnGenius-EMR5000
> md5sum: e4e0c9bc1482b03b8240817b5918666c
> + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=EnGenius-EMR5000
> md5sum: a4e9856757014f4591d40ce93bab3e4f

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=EnGenius-EMR5000
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=EnGenius-EMR5000

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 62 in total

https://github.com/kvalo/ath10k-firmware/commit/8f150f4a3d52415b95fbbfead8dcaff458b80332

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
