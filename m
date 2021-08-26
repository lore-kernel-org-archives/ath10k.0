Return-Path: <SRS0=L2np=NR=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B535CC432BE
	for <ath10k@archiver.kernel.org>; Thu, 26 Aug 2021 05:52:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CA27610A1
	for <ath10k@archiver.kernel.org>; Thu, 26 Aug 2021 05:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CA27610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvAZaXeUfUeXilfTBTDPnqM5NhAd8Sd2aPo5nIoXIbw=; b=ZrfngDytLH58qU
	GBAtDfluokV23GJSjjLyJvySsJU67r5cLLdAtTBi2TlnAlOsDzFZQkHDfkWP6eRz4dusNgeqwXqho
	IHiIaQig6lQDVB7gyAC2F4jNL0jrx2my1ywfHv9iU8zGSSChbyxJDgYGMnHfnKrSJyW73ImzJMCco
	5tDL27VpTrXYxzQMk5ZU/H5rWiEwfase/j1nYwWsAw+tEq/WpgEX96H0Ot8JnQSD47Tv1uo0ha5aQ
	WkSfI/tn+CSoDdK9O/nSpPHLXm2Kgg/EfRHoh69iwr0omgAS/f/G64bTFY/fbSasvzrNAAC4lPzgV
	4y7CBzkm7c8G3s5gPHSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ8IT-009EcI-A3; Thu, 26 Aug 2021 05:51:29 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ8IN-009Eav-1Q
 for ath10k@lists.infradead.org; Thu, 26 Aug 2021 05:51:26 +0000
Received: by mail-pj1-x102d.google.com with SMTP id fz10so1491244pjb.0
 for <ath10k@lists.infradead.org>; Wed, 25 Aug 2021 22:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ccQ0MGCdd2sOJEH6txbJHSp3br3UWRPN7Oxkykdkfrk=;
 b=h98ncCnoSgRO/F8RcTGwgl4lQgtwO7Z069Jg7gZwqH61LgYfFHRkVKlkk5SYejX3Qo
 wp+dBQvMBboIKtqJi98pwPqrfc0z40lBaUNd0lecBa90rVYJ+4XjuIYSPHipBNUKEW6J
 /Ns8wV2HFg8eY7ZT5jRFEk0xCu3jQqxN02ClQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ccQ0MGCdd2sOJEH6txbJHSp3br3UWRPN7Oxkykdkfrk=;
 b=se1xUtttCdLkQsC8v/5IYQ+yuCadqstJULKNTUJ2V2y0XUgis+Y3f//2xYPLgnGxek
 eDHA+4fFgLYmOWeP6dPTnk9bffXRKgRG7pIPkAn4Km/9+19JHBE8Rrk7SgNAYPnH5EAt
 7lX4ASVZtDoAMX09yw6izAjn/PpyB/L3G9zyO423Q94orOFjwvYocOIHdF7hAPYkVvF6
 /tJ5MSM97Fz4baSu/3jlwanRqzCci3Q4sK93wPtdGBHPTpNknkxOCQOmb0otgbDP7CwG
 +Lcav0ASYTu/8eaCTHd4J1YuIqdI24QVPLURMN7MGYgVXjP/mYWayOHLr70aiKE24ENm
 Q8yg==
X-Gm-Message-State: AOAM531stZcxItajJuYAzniz/nd1wKqOarJQLCZ8Oe8NtI/r6t9UgSd8
 36SvwdRGf7BIEe3dSmMGO9IqLg==
X-Google-Smtp-Source: ABdhPJxNdpjMBaxv04Np/J/tJKVtP0qIehTtqoqEULck0k4pYP27+H3m2/MaKclQTAZAaqJQhLiqIw==
X-Received: by 2002:a17:90a:dac2:: with SMTP id
 g2mr14392631pjx.45.1629957082083; 
 Wed, 25 Aug 2021 22:51:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c24sm2088939pgj.11.2021.08.25.22.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 22:51:21 -0700 (PDT)
Date: Wed, 25 Aug 2021 22:51:20 -0700
From: Kees Cook <keescook@chromium.org>
To: Keith Packard <keithp@keithp.com>
Cc: linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Nilesh Javali <njavali@marvell.com>,
 Manish Rangankar <mrangankar@marvell.com>,
 GR-QLogic-Storage-Upstream@marvell.com,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Fabio Aiuto <fabioaiuto83@gmail.com>,
 Ross Schmidt <ross.schm.dev@gmail.com>,
 Marco Cesati <marcocesati@gmail.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Dan Williams <dan.j.williams@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 clang-built-linux@googlegroups.com, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 3/5] treewide: Replace 0-element memcpy() destinations
 with flexible arrays
Message-ID: <202108252250.C1DAEE5@keescook>
References: <20210826050458.1540622-1-keescook@chromium.org>
 <20210826050458.1540622-4-keescook@chromium.org>
 <87r1egpym5.fsf@keithp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r1egpym5.fsf@keithp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_225123_143958_40BA058E 
X-CRM114-Status: GOOD (  15.30  )
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

On Wed, Aug 25, 2021 at 10:24:18PM -0700, Keith Packard wrote:
> Kees Cook <keescook@chromium.org> writes:
> 
> > In some cases, use of the flex_array() helper is needed when a flexible
> > array is part of a union.
> 
> The code below seems to show that the helper is also needed when the
> flexible array is the only member of a struct? Or is this just an
> extension of the 'part of a union' clause?

That's correct. I have that documented in the DECLARE_FLEX_ARRAY macro
itself, but I mis-spoke in this changelog here (the uses were for "alone
in a struct"). I've adjusted the changelog now. :)

Thanks!

-Kees

> 
> > @@ -160,7 +160,7 @@ struct bmi_cmd {
> >  
> >  union bmi_resp {
> >  	struct {
> > -		u8 payload[0];
> > +		DECLARE_FLEX_ARRAY(u8, payload);
> >  	} read_mem;
> >  	struct {
> >  		__le32 result;
> 
> -- 
> -keith



-- 
Kees Cook

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
