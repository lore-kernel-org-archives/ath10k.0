Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310F7C433EF
	for <ath10k@archiver.kernel.org>; Mon,  2 May 2022 09:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nhPbeZ2OTHBJO27w4kCfypkQIO38M3/mcPdg1BWQKlo=; b=Cq90mwv5JkPs0L
	oFXUi1RTKjpxWX2UH7IrccbOq+8uN9UFATEsdpzSykGBBXOVpp6MQasU5RxKWcw0YbDaeTr4sRHx6
	ePadAgQ126ixlwyq0VN28dXOtWBcy2hZVg7bZ3yCHTWLZlgHzdujmO+QfexCiPfCo+kvPdA08jFdF
	Noku3GdZihiHoYKlC2BBIZ/JSPeSygzcgrLoINTaSCg+JjGGR+vfTtNBZT2QMLt393eBtwdnaqK48
	fH3FSePxpgwVB4sMFejpCmkBJA3W1Zl2rzvwh5rHilObDAaCdHnaVJ1KjgKd+AJDgDHiBtp9LJjeL
	LnY18dY9iavJnYrfaQZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlRz7-000WRm-9H; Mon, 02 May 2022 09:04:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlRz3-000WOb-Vl
 for ath10k@lists.infradead.org; Mon, 02 May 2022 09:04:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3116161073;
 Mon,  2 May 2022 09:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FFEC385AF;
 Mon,  2 May 2022 09:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651482283;
 bh=xMAoW3+E5Fsks2fprl1IkqobOvA3bVLRwVFaIxegYh4=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=SgbeudBhny4P0Cm/NFtZva32RjbxCiSuZ1ewGfOFuvAJVS2ZQREOPxnHrVPJK4Bkd
 1JNZ2JE/lKSAjz9cY2ggQUHOfTmXhnmNZHp/wCKFuswWBwSTCHdXhmoAlbsSfS1sQK
 DPQUE16MO4CN1d0ce4DAJlIGTMir9+HfuAVnOug0gvWz4yMmL61kZeRsWJVqb6jzAh
 YD6j59uyil34vACM4gJuoQyxgT2Jbhq7g5f594f07NiWXGE6ymSBG6MZlDpoZtuNUJ
 uyte0L8aZFArZ+uwz/ZBz1j9WP0TU5HJWBu1yEV4P4paEN/n3ByHLsEIYYcRhrhigM
 wdhZbpV8eA3WA==
From: Kalle Valo <kvalo@kernel.org>
To: Enrico Mioso <mrkiko.rs@gmail.com>
Cc: ath10k@lists.infradead.org,  Christian Lamparter <chunkeey@gmail.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0 + QCA9888 hw2.0: add GL.iNet
 GL-B2200 specific board files
References: <824d8187-dd92-50fb-30ad-b7ea7e1bc041@gmail.com>
Date: Mon, 02 May 2022 12:04:40 +0300
In-Reply-To: <824d8187-dd92-50fb-30ad-b7ea7e1bc041@gmail.com> (Enrico Mioso's
 message of "Mon, 2 May 2022 10:00:15 +0200 (CEST)")
Message-ID: <87sfpsb907.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_020446_092078_F18A544D 
X-CRM114-Status: GOOD (  15.72  )
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

Enrico Mioso <mrkiko.rs@gmail.com> writes:

> Hello all!!
>
> This is my first submission, so I may need some patience to get this right! :) :)
>
> I would like to add some board files for a device that was added a
> while ago to OpenWRt - the GL.iNet GL-B2200 mesh router. The device
> sports 3 Wi-Fi interfacesand currently uses the three board files I am
> submitting.
>
> * Hardware description:
>
> This device seems based on IPQ4019 / AP-DK04.1-C3.
> Three radios are used:
> - one QCA4019 radio is used for 2.4 GHZ operation
> - one QCA4019 radio is used for 5 GHZ for operating on lower part of 5 GHZ spectrum
> - a QCA9888V2 interface connected over PCI-E to operate on higher part
> of the 5 GHZ spectrum

Only one hardware per mail, please. My script is not able to parse
complex mails. So one mail QCA4019 and another mail for QCA9888.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
