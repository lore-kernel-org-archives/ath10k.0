Return-Path: <SRS0=2NXS=F3=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA7AC433DB
	for <ath10k@archiver.kernel.org>; Wed, 23 Dec 2020 18:20:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D98FD22286
	for <ath10k@archiver.kernel.org>; Wed, 23 Dec 2020 18:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D98FD22286
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YBjLY7dHrhWQkmVJgkSeoDRil6AjPPNn8vEhyLa2QRY=; b=rUcpGf/0kR5gpkbCSn+AXSHiF
	gBXj1iSqYCcG9fnTsicST5udUvpgO901QjIKUIpZa718rogMW8IJPduBytqVnp7nsdjLOiq1iihHT
	V3e/x/dTIOR1AWx9Ii9SF8lGGVpEaM+T+FZaKGflLebzVozeqOHimRuKVOY9F1U8esNG1YaDRGsx5
	DQpAFwZGS1nHUBuWOkjq2QrgU/JxDml4vfo3f5dbBNSaC9LfvvVcB9qjHYjMvcWnrA+EFHqRJzWgs
	FF+iPXBC8MOWJI+FhC3ySaV2/rxJTaojcGwd4Nif7Bh7P6e69mWEVuwYVurnkK9O1Z9eIEiW/RwUb
	FqgjtK1jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks8j3-0005md-9v; Wed, 23 Dec 2020 18:19:05 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks8j0-0005mA-V9
 for ath10k@lists.infradead.org; Wed, 23 Dec 2020 18:19:04 +0000
Received: by mail-oi1-x22c.google.com with SMTP id l200so19070626oig.9
 for <ath10k@lists.infradead.org>; Wed, 23 Dec 2020 10:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1VWybfMZ+pFPUSGBU4pWrLKFoY1veqMlXo3rQ/KJ77I=;
 b=kQt/I/CMKoa13asburucitJ7D0kLvONhsW5be2qAfgrFaHhurmFYBOS7WQpyUUu5l4
 VpoZZIVxrGb9D1bt8KngWGkzTbGgJIDdarOu+3M1qt0+83PXZkBguFMP3ovULh89VJIb
 7mQdUtweCiXbIUY1vmKo1IfqhyhtqPjqx/PBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1VWybfMZ+pFPUSGBU4pWrLKFoY1veqMlXo3rQ/KJ77I=;
 b=iln4zNGPsEvwMwBfWliRlMppBeMGKWzQ0OhzcK9Gu+jjUranv9+2F0vqIShg91iJh3
 Ck6xGn2PGn5J+3Z0YsfaTDMx72EJdKsESqa8DtN0qF84l6IIY3bVKk4fBlliOWckG+Om
 h6fqwl10xXeoJCMqT56277e12255MQqmWPufw2xTMPYH6MVDfpIwFPCGTPFal/0YHm3N
 VBWSh/6Kl9OFa+iJ+p+50RFQohjIlplffnJr0Q7Km1KH1pMTQWGuich6tYpDC2NcZnzN
 EkWILgRi5Va0g93tVyvKoN2Q2EcVxZYAJw51aLjdo9I7Ad4yjaDj/8WkNFzY1mtxl4F9
 DfRA==
X-Gm-Message-State: AOAM530FU9Tf62Ho9jMcddesJEe+6dJNRZSwWGBObFSvVy/5QNbioLd4
 MYc0UIDJ9NILb3N9WjQ0r6xZ5+TIJxpoMw==
X-Google-Smtp-Source: ABdhPJz6bUKfgMf32GUKN1VbEpvrCUh2juAg/qco28fMrluAgqIMoemKA2iB9gR9A5WLNNBwXlJVvQ==
X-Received: by 2002:aca:b90a:: with SMTP id j10mr747477oif.70.1608747538733;
 Wed, 23 Dec 2020 10:18:58 -0800 (PST)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com.
 [209.85.167.170])
 by smtp.gmail.com with ESMTPSA id n13sm5678436otk.58.2020.12.23.10.18.57
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Dec 2020 10:18:57 -0800 (PST)
Received: by mail-oi1-f170.google.com with SMTP id l200so19070492oig.9
 for <ath10k@lists.infradead.org>; Wed, 23 Dec 2020 10:18:57 -0800 (PST)
X-Received: by 2002:aca:c443:: with SMTP id u64mr681296oif.117.1608747536728; 
 Wed, 23 Dec 2020 10:18:56 -0800 (PST)
MIME-Version: 1.0
References: <0BEB3EB4-E3AF-4236-BACC-E42CE2D094B7@adcubum.com>
 <3a3815a68576f1715fcc6db590099b84@codeaurora.org>
 <CA+ASDXP8NoGACT4OBEwMvj9B6KsBYBAwMhxSApb7D-fCvfxwTg@mail.gmail.com>
 <87czz06b2e.fsf@codeaurora.org>
In-Reply-To: <87czz06b2e.fsf@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Wed, 23 Dec 2020 10:18:45 -0800
X-Gmail-Original-Message-ID: <CA+ASDXN6FmPVwXYg+iO7fcgM054g+65A3dDOhedNrG5siFz_UQ@mail.gmail.com>
Message-ID: <CA+ASDXN6FmPVwXYg+iO7fcgM054g+65A3dDOhedNrG5siFz_UQ@mail.gmail.com>
Subject: Re: [PATCH] ath: add support for special 0x0 regulatory domain
To: Kalle Valo <kvalo@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_131903_039353_53441BFF 
X-CRM114-Status: GOOD (  16.78  )
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
Cc: Sustek Goran <goran.sustek@adcubum.com>,
 ath10k <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Wed, Dec 23, 2020 at 3:02 AM Kalle Valo <kvalo@codeaurora.org> wrote:
> Brian Norris <briannorris@chromium.org> writes:
> > Kalle is still planning on applying my revert patch someday, I think:
> >
> > https://patchwork.kernel.org/project/linux-wireless/patch/20200527165718.129307-1-briannorris@chromium.org/
> >
> > We just have to wait.
>
> Actually I don't see how I could apply the revert due to the regulatory
> problems explained by Jouni[1]. We cannot break regulatory rules.
>
> [1] https://lore.kernel.org/ath10k/CANe27j+fur52HydqqzLc2hBV3QwC2La8+RTJcV=5W5LkUr=PqQ@mail.gmail.com/

Thanks for pointing that out; I hadn't noticed that thread.

I'm not sure I totally agree with Jouni's logic there, but
(a) I don't have a huge stake in that (because for systems I care
about, I make sure the hardware gets shipped out with the correct
module programming) and
(b) it's probably best if discussion mostly stays on that thread.

But I still can't help myself: that feels like retroactive logic that
doesn't make sense. Jouni seems to imply that every module ever
shipped *must* have a programmed country code in order to comply with
regulations. My understanding is that systems could have been
compliant without such a country code (for example, shipping a
non-upstream driver; or enabling CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS
and specifying logic from user space; or other creative solutions
[1]). It's probably not ideal (because mainline Linux now doesn't
really know what to do), but possible. It unfortunately leaves a
sticky situation for these users, because they have to figure out how
to retroactively patch back in the original manufacturer's regulatory
strategy.

Brian

[1] I am quite familiar with a line of APs that ships this solution
(i.e., pulling its country code from the Device Tree, because the boot
flash has information about the country it was provisioned for):
https://chromium-review.googlesource.com/425619
I don't know what the module's EEPROM contains, but they're not relying on it.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
