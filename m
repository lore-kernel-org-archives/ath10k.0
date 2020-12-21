Return-Path: <SRS0=1k1S=FZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555D6C433E0
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 20:20:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1164224D1
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 20:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1164224D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NMJnASVVaopazDAwQTgRI60nomTZ73K+qb61ytfrcP8=; b=0TeRqoYso+bZA8JeI8cGzSXFF
	kBzwictbbsdrT3pDnZLvmW7OEAPGixmb5Zn1AKU7jfy0NiZ+caueL18AQmcUC+QSSDdT8ucBD7CBw
	M9UaX4VCTCt36HLGwt/zwEq9Ds2K+M5aOrJ2/KQpOnlOw4JUrBDSX5WJmugu8WBOPEKwNmHs4BhkY
	FDKk7NtQNTaYK05x+D4E0AvCRVKK9T7ajAXGkcg9c03Xzjjj3juwZsw3wz6rAgFe/B6/QRTAlbSK4
	4+Xq3/p3Ew5asbgr/1GJaG6t1W8Yh8H2Oa2ahMZBnDH9dLYnt3IuDXQalvtlicyrYub2H8d0hszRE
	rcRv9a66Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krRfV-0007Go-4b; Mon, 21 Dec 2020 20:20:33 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krRfS-0007GK-CD
 for ath10k@lists.infradead.org; Mon, 21 Dec 2020 20:20:32 +0000
Received: by mail-oi1-x22e.google.com with SMTP id d189so12484310oig.11
 for <ath10k@lists.infradead.org>; Mon, 21 Dec 2020 12:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D3Dnzn17f9m0v155oO/9OuYuDJ7bDZTltdNjWrzci5E=;
 b=AkxDwDnuYm53VqC4xV8e11XhP6gdcoAxI4s8RxA+JJO5ImqnyTmaRhj1T/8XCf751u
 E8s/AHSvjZmFYhJEc1BTk5K/QUdbtx2kFGebwnnw20fny2nRTBNTB634tr4opKqqDrIp
 RLXtLVTRQ1iOly5RVUhpyM9JPkOdBgGCuvZak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D3Dnzn17f9m0v155oO/9OuYuDJ7bDZTltdNjWrzci5E=;
 b=FBtMKRg9OP+6ko55j78nvvkcy7imBHBCsYvR5fFY3pr0jdD4eXFUBWZxv94+QQ0s/I
 D5ecKoZW3JQlsbJQmlDGQmAqVvv3JulPqwG7QaaVYQA+6k8LnddDnogQ1K2JWJvjOUtB
 Rx8G+8lewoP/VF0XEOKWDNLdmhb4sYe5oTz67xAlN2Kc5BacfJKjyVvrnZdlL9s0xgOr
 DPsCIqL7GaUdVsfD1OTZfoES3FyOsC8k7FF0CS5pcvTu5D5Qa8LcPXKbmxqfCeArselZ
 EeTO3+k7opKRYyFycUjDZwxLojWowhmGhHGHNSmYxjU/QpFipbqeL1mxgVsUvhZKjHm9
 J1TA==
X-Gm-Message-State: AOAM530REdjcp8SRmoW/YaHAp8Asqtz3sHVwzTf7NCI88RGxmsfTkABX
 KPLi9GDmSofzXBERz8slVhbMaqgB+NzMKw==
X-Google-Smtp-Source: ABdhPJwc3EXcKMZEX44yNcOdErsuRetMNBlsc4lGVOMFM9is9J07S2q2HJPR4/bN5CSntoSszVBNyg==
X-Received: by 2002:aca:4a84:: with SMTP id
 x126mr12135880oia.111.1608582024076; 
 Mon, 21 Dec 2020 12:20:24 -0800 (PST)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com.
 [209.85.161.44])
 by smtp.gmail.com with ESMTPSA id t12sm3921999oot.21.2020.12.21.12.20.22
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 12:20:23 -0800 (PST)
Received: by mail-oo1-f44.google.com with SMTP id i18so2500533ooh.5
 for <ath10k@lists.infradead.org>; Mon, 21 Dec 2020 12:20:22 -0800 (PST)
X-Received: by 2002:a05:6820:3d8:: with SMTP id
 s24mr12808980ooj.52.1608582022154; 
 Mon, 21 Dec 2020 12:20:22 -0800 (PST)
MIME-Version: 1.0
References: <1608515579-1066-1-git-send-email-miaoqing@codeaurora.org>
 <CA+ASDXP8LotnQZNvXYZqfYH8za6rx1DaZmnH21TsO2NmzX+OZA@mail.gmail.com>
 <87ft3zndfr.fsf@codeaurora.org>
In-Reply-To: <87ft3zndfr.fsf@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 21 Dec 2020 12:20:09 -0800
X-Gmail-Original-Message-ID: <CA+ASDXMK+8aOvtp-QgkXYXw=BZcFdo9H3ZFSXDsee0PFzUO97Q@mail.gmail.com>
Message-ID: <CA+ASDXMK+8aOvtp-QgkXYXw=BZcFdo9H3ZFSXDsee0PFzUO97Q@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix wmi mgmt tx queue full due to race condition
To: Kalle Valo <kvalo@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_152030_502940_843FCB00 
X-CRM114-Status: GOOD (  13.28  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>, Miaoqing Pan <miaoqing@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Mon, Dec 21, 2020 at 11:53 AM Kalle Valo <kvalo@codeaurora.org> wrote:
> Brian Norris <briannorris@chromium.org> writes:
> > On Sun, Dec 20, 2020 at 5:53 PM Miaoqing Pan <miaoqing@codeaurora.org> wrote:
> >>         if (skb_queue_len(q) == ATH10K_MAX_NUM_MGMT_PENDING) {
> >
> > I believe you should be switching this to use skb_queue_len_lockless()
> > too.
>
> Why lockless? (reads documentation) Ah, is it due to memory
> synchronisation now that we don't take the data_lock anymore?

As the original post notes, there was no valid locking in the first
place anyway, but now that we're fully relying on the queue lock, we
either need to grab that lock, or else otherwise use lock-free-denoted
methods.

One could say it's about data synchronization, but it's really about
the lack of memory model -- C didn't have a formal one until
relatively recently, and the kernel has always blazed its own way
anyway. You need to annotate *something* about a bare read, otherwise
it's not safe to do concurrently; either compiler or hardware can do
nasty things to you. (In practice, it's unlikely this particular case
will cause a problem for this reason; it's already a somewhat
imprecise check anyway.)

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
