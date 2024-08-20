Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902FEC531DF
	for <ath10k@archiver.kernel.org>; Tue, 20 Aug 2024 10:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBsQeYCjm0Q/lqd2cuGUfWugcR1ni+m3/jYRHC3AXRA=; b=VKpHp58Z52td2ARf/t1dYKNnM/
	vuCy9UKxlj2uN0CLkg7Tg0D8BQUr10eoBks6aXd5Dbx80CBlB6c4rUKvN9EUyXySOI9D/pL8W2t2Y
	+RylWECzK8OV9M9DcQrZw//0ALzQRfO6YgWWj4leicfFQ+cloiduCoVWyYWSsgSpY7e21FnuIHKQk
	3j1NxK+c+Tm2jg+1wgcz9Pq7TIX/jTzixZa045ht85wsCnaUXMR8ubHxfPKt9EX05z45UXM8hBeol
	KgkV5wcnBq93E42midbSYdBC6vDE+0w7IG38sJhEc+0ySgtj6Ty8Y4SqJrFRP1U8qEuH+UX1xfkEl
	2v7rrhBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgMEN-00000004pfn-1AEw;
	Tue, 20 Aug 2024 10:36:51 +0000
Received: from a7-51.smtp-out.eu-west-1.amazonses.com ([54.240.7.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgMEK-00000004pf7-2B4o
	for ath10k@lists.infradead.org;
	Tue, 20 Aug 2024 10:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724150206;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
	bh=zNwcst9IvlDABut4kn+I2bdBDK76T2pLvWSXa/aMHNY=;
	b=Yh+mooPK5JRCNinT2h6nsjD/7zkFq5YETlmMBQBPCHLmhvUUF4BrMxIsFOaDvdp5
	K46QHHbp9R6hYWmlYOV1a+qRQRxiiyZcrUSjRxDcu+vV4Qq+kMfsIZ7Fq2DNmmoAslv
	2rI4+fou4Gi2JNReJsSbkS/uJYRK0kMZ4X6uFl5Y=
Date: Tue, 20 Aug 2024 10:36:46 +0000
From: Riku Voipio <riku.voipio@iki.fi>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k usb support status
Message-ID: <010201916f5c4ffc-c6546aa1-f5a0-4347-956f-47c900b8fa10-000000@eu-west-1.amazonses.com>
References: <010201916e974ab7-0dee7485-07f9-458f-a0e8-d49e8e756a44-000000@eu-west-1.amazonses.com>
 <87wmkbwo4v.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmkbwo4v.fsf@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Feedback-ID: ::1.eu-west-1.eQtNY3bfGboUEo0vzk/Zj4VaHDTS//4rWFBnt7DEpfU=:AmazonSES
X-SES-Outgoing: 2024.08.20-54.240.7.51
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_033648_720509_E5AAB978 
X-CRM114-Status: GOOD (  13.64  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hei,

On Tue, Aug 20, 2024 at 12:16:00PM +0300, Kalle Valo wrote:
> Moro,
> Riku Voipio <riku.voipio@iki.fi> writes:
> > I note drivers/net/wireless/ath/ath10k/usb.c comes with the warning:
> >
> >     /* TODO: remove this once USB support is fully implemented */
> >     ath10k_warn(ar, "Warning: ath10k USB support is incomplete, don't expect anything to work!\n");
> >
> > Is this still the state?

> The state USB support in ath10k is unclear for me and I have not
> personally tested it for years, I would recommend not to use it for
> anything serious.

Thanks for the quick response.

> > If so, Is there alternative USB-connected chipset with good mainline support?

> It's best to ask this in linux-wireless list. But Realtek drivers have
> seen a lot of development recently and they do have USB devices so that
> is something to look at.

Right, I'll check the options in that front, and ask on the correct
mailing list if needed.


Best regards,
Riku

