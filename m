Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B28C433EF
	for <ath10k@archiver.kernel.org>; Thu, 23 Dec 2021 15:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EOoJH4shxPhHyB/DwJmYvbNO6TL64SILEivix60ZN+0=; b=25RXapR5BdD1QD
	PXmAClpZLnCaXNhi/iJEYQYA8s0UoQ+8PGWKdK6shRCBMSKcQwWxylDb+AJRAxM6cEcdRLZlqf52e
	hMirLI0+wBzyYmmpgcgTbW4pBn35tkwstqfHvylimgK7/yPraw2+ou3j4KRQs8ylJrOevsMzfJlux
	W+kRZ9DsUeq8IxV2LV0loIVlexMSNYT4osu1W5noF0XCXLRluJ7vjxWBOp32AlmS76EWGv7wys9R0
	NwbyKIq3ewQfAhLmoCVwj5xO6VHHs2Tb/aY+TidbXIQKKxy6ajxQ9weiTnkRNHQYPrFfW3o2DmFer
	jCqsVNZjAMHyxQXWbejA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0QM1-00Czbj-Be; Thu, 23 Dec 2021 15:50:05 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0QLy-00CzaJ-Oa
 for ath10k@lists.infradead.org; Thu, 23 Dec 2021 15:50:04 +0000
Received: by mail-io1-xd2d.google.com with SMTP id 19so7089059ioz.4
 for <ath10k@lists.infradead.org>; Thu, 23 Dec 2021 07:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=62a8WqCVCfLtKcBuPYIIPd3ieisksyyskCcARTtW33c=;
 b=N+ENe7/Sg0yz+UQJF0BcJ05vwJhcPh2IrxxSASrH29AvgzimI23igkrL5cFygzqExW
 FV5IvR/w+OXFWvbbRldc51dUm2xbRXJ9jdUoU5DfWSSXjtqDutonMDjtNTqL2nYeSP1a
 P+g6+P9huB/mz8A0j5XXPaziZBiugm8n09euRa1RsdXMd1P0gO0Nxpoth1jAV8wewtZn
 LSJPFtyC8DKOxSFThmvjKKkojq9Rltd5Jm38PHbdyNThKRzXrcis0ltNDZVMaQLIGTLI
 bz9WmPkrEJP4uzxmhWHZT/TgyfrOeOQE56eFpytrOx4v0rGfqza8TYNEjbT1S07r9BGH
 +klw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=62a8WqCVCfLtKcBuPYIIPd3ieisksyyskCcARTtW33c=;
 b=y7QHcnUqLA1MmuQMZtPShCjZxgOx1KmGvkuAk4afXSL+BRjF0bFAQrCAoHs9WOnhaF
 Xc6vie/IjvMm7otYJVUz6SICvLxDN9m0eMQbILGMDfwRbASKAT+4RQpyFT5JD/XrzCtQ
 EJlaRCBX7wAGDS4EcLVkWh4ffPznEZa4ZGoUqVxgEHqIndlhCvw2JjsOe8VgxS+LrhAC
 Qq79Nu/FtQjp+fJ3x+49pyIrR01w8189ph4cczRQmNT6I0rVxTMsQfGe5O/7EXdUSw7v
 iKaQIvdtWTst4Yf1Zo+BNIZ76CnfX2UQ98vYDtGeGjoLDy2uwC/9W3r965s6gb7rBnf9
 pU5Q==
X-Gm-Message-State: AOAM532jqDNOnTqpJ8TAkFEk9dP9zwJ0P7ughykuUuUL9x3CFnGl4NRk
 LaWEg7UFcT3zDQ9Qr8KCd6X+DMSCJ7UbtLkw0MA=
X-Google-Smtp-Source: ABdhPJwEbqd7uZYcmlny31sQLctCH/pTjM8DqTv5mP5ne+ZG4nSoE+qxJfsYeEGP+lBa9W3471ggxfnncPuM/ikFRVc=
X-Received: by 2002:a05:6602:2a4d:: with SMTP id
 k13mr1407242iov.133.1640274600493; 
 Thu, 23 Dec 2021 07:50:00 -0800 (PST)
MIME-Version: 1.0
References: <20211214223901.1.I777939e0ef1e89872d4ab65340f3fd756615a047@changeid>
 <c156c75f-5797-917c-a8f7-ad7620903bf1@nbd.name>
In-Reply-To: <c156c75f-5797-917c-a8f7-ad7620903bf1@nbd.name>
From: Dave Taht <dave.taht@gmail.com>
Date: Thu, 23 Dec 2021 07:49:48 -0800
Message-ID: <CAA93jw7iF6SD+qbASxNspxvydNOz71GirmGqref-3uOmbRvMBw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: enable threaded napi on ath10k driver
To: Felix Fietkau <nbd@nbd.name>
Cc: Abhishek Kumar <kuabhs@chromium.org>, Kalle Valo <kvalo@codeaurora.org>,
 briannorris@chromium.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>, dianders@chromium.org, 
 pillair@codeaurora.org, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, ath10k <ath10k@lists.infradead.org>, 
 Linux Kernel Network Developers <netdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_075002_833599_470BC8E3 
X-CRM114-Status: UNSURE (   4.04  )
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

what is your definition "Good results"? I would really love it if I
could get back more flent benchmarks like this one:

https://forum.openwrt.org/t/aql-and-the-ath10k-is-lovely/59002

As the ath10k has cost me more hair and time than I care to think about.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
