Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55987C6FD1D
	for <ath10k@archiver.kernel.org>; Mon, 20 Mar 2023 18:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HR6AmFhhaV5mmM3G2WWK1Mn5KZMGA5iDShqUNUtD9Q0=; b=wAYpk5ObfaNg/P
	5g4GkUBkqSH5VflgMwjGCqRsSgrtCGLQyDMEOgw/5qvMYB4vp6XMZzKL6n/l3OAyZOfMQ/omYz0rX
	1iJ6bNvc79qMnTzeagYup2PNV0ydRYQyX/rg62Nko8zBnbKrBsM5jVrZxTFTapXCN8XdBPwsAJUDM
	a0BYwjfcwPLl6C1+QasB1AvfH278IWPptZoHdpth9oumzpbeQm2Y1XmH5Dlc6Obk5sO/74sjnTL5h
	7gS7bmA5yaA+gdg47ZvkLqnC3bilBblG3EjLSw8D41sVaYE19Vvzt5rXmifSXXPLRCww7G4Bi9heA
	Dy3QLle4mtJr/iyURpQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peKTq-00AAMO-2D;
	Mon, 20 Mar 2023 18:43:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peKTo-00AALa-0T
	for ath10k@lists.infradead.org;
	Mon, 20 Mar 2023 18:43:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8BBC861755;
	Mon, 20 Mar 2023 18:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2A6C433EF;
	Mon, 20 Mar 2023 18:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679337814;
	bh=sDLC//SPnJSbwZbuz3wTxDzPIwJ0qjTpmW5CZEG7EcY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YyznV0gJHD6IjMVWdRaSgEERivdd4V9szqkQWKvHcxnlaNKcXzia3QqEIH0ic6ovC
	 rGDS+Pg6qSRI7J5J/D3pb8vNuq2EGCko5CB3FgqjgV2qJ4fjUi851CbVHUJXkUDhwr
	 v67BkkE4sLRSeiY/VmRUs/tkYTz/cq+VbFA/G86HqwOz+Ej3QmlMzen2p3LTjki7R6
	 8KeXMV5r+vyyUWPALDEHzVlrF0ZqzoHa8CbQlq94O8SKGjwSagqz0bLo2zjfzzgzk6
	 6lyWy2NDDvgFQyvYHjY4FFVy7R/vMQNdaGOPK0FJD4hImvz62goMapcwD3wUkXWNFY
	 oCaNnkbY60GNQ==
From: Kalle Valo <kvalo@kernel.org>
To: dukzcry@ya.ru
Cc: ath10k@lists.infradead.org
Subject: Re: [BUG] SoftAP: zero speed between clients on QCA6174
References: <02bed0819c13c14dc1f52d7d2b658b00280d2634.camel@ya.ru>
	<c7ecaf558a6b2b46c73ecbe8a291de3af40b35fd.camel@ya.ru>
Date: Mon, 20 Mar 2023 20:43:32 +0200
In-Reply-To: <c7ecaf558a6b2b46c73ecbe8a291de3af40b35fd.camel@ya.ru> (dukzcry's
	message of "Thu, 12 Jan 2023 22:12:31 +0300")
Message-ID: <875yavfeln.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_114336_219725_3FCB43D9 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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

dukzcry@ya.ru writes:

> Looks like firmware issue. Fixed by downgrading linux-firmware package
> down to 20220411
>
> Last good firmware 
> linux-firmware-20220411
> [    3.859587] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-
> 00157-QCARMSWPZ-1 api 6 features wowlan,ignore-otp,mfp crc32 90eebefb

[...]

> First bad firmware
> linux-firmware-20220509
> [    3.767713] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-
> 00288- api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c

Thanks for the report, I forwarded this and hopefully it gets fixed.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
