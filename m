Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D141C433EF
	for <ath10k@archiver.kernel.org>; Wed,  8 Dec 2021 12:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTg54+Q/0aOwDUx/C1MnIwWuBJc+DYKYHM2hsyslu8M=; b=J6OVBKtiuOCjnR
	aTv2oykDs9jSK3jW1oIschnEGyPjl3+gkCOhSPQmUCMfY6WNru9456Yaj2MusMse3EgxxsTS68r0t
	jmcvYfS+4JkdJqHxG9kdvK3YFOq1EwY1r03cwTpJRl6NzaSqeo5lAU6sEyqeREwoNRIf7pfoRh3qX
	qNYj9fZkSHvX30wXxnRhPQZC+aLW2RgrIrTvaCJAWd3vsby7+3AAba8QaYAWkLmTtfxfaje/8MOax
	FvarKfdehOYI8e4ueI1AudVQl/O1ovhbaIRB7XVTNPKRrRSCUYLu4e3iJLZ6Inxh2rEitfzGSHtyf
	eTXUAnlj9W8kzfVWyP8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muvxa-00CT0L-69; Wed, 08 Dec 2021 12:22:10 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muvxS-00CStJ-NA
 for ath10k@lists.infradead.org; Wed, 08 Dec 2021 12:22:04 +0000
Received: by mail-qv1-xf29.google.com with SMTP id b11so2071052qvm.7
 for <ath10k@lists.infradead.org>; Wed, 08 Dec 2021 04:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8uy0DZF7lXHvcBRiAIjRsLK9cNEa6jf/rNNhdNudo5w=;
 b=cHX2O0p2l777DDyIx13QKGz8UX24Uk7UaRJHIphrFXhWQpCdBq/STZ3JU+jBVhQXFQ
 eEK73FHRc8ykrxIkcW7EwsQYpWU6hiH7uV8aTrQq5q6z9MvamNo8ByD3T0Q1O+bwdX9d
 mrsXJpL6z7KG9Q+Tf/oWyZrkkY+sClbYwIw5oqyQ0fK7+JQrmG45imzLDKke4y2afb2Q
 fZnfzwPckqBkkd1mqT5N+uYOuijVavructJJmCmCZHWTC9gwdoAAKeI8aKLjO1IBrob+
 8x/McZkGWEFExIhOMVDwl+XJQT24Tq3BHUhgUtO0J+N9HOzAtgD0z8aYTJYyWd3YbQxd
 HpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8uy0DZF7lXHvcBRiAIjRsLK9cNEa6jf/rNNhdNudo5w=;
 b=7ROknBxz7HWvqhLGennh6OpNbYf1bYvnpGEDxs7CR8CDD/BdOKkHFMP7z9IH6JciQe
 YZRqaaXrYVSetlqbEFjl0FTEGROgXcFFId3hqfu0g8C/eAaE0HZ3nmsc7FCNr0aIlxgu
 Cy9r3DWMqvrXGfrM9DkcQXzndMBTYsx18ZhqRDFDUf1dpjWNK8WciSMJgWTpYSBKOLMv
 B2j1QxAcxui/EtJxVZKBv1PBIdkqO+Yi3VnxZzR7RuldKXEPkng/jWrs1xx0VZxZR4f1
 FrtQcdGzm4v4kFntw4V5DlNUeKdgg/HZUwYYVmQc2tPXY492auJxCXKOZsUtkjky4ZXU
 6jZw==
X-Gm-Message-State: AOAM5334Mdac1bFxkiZsZPuRsHFxS6l123ksUMko8EW0s27O4kVtyTU0
 b5mR44XzCDqbkFfNZiih78AL3OXllC4m1VW+cg+C9REXPaQkSA==
X-Google-Smtp-Source: ABdhPJw4YNDPavQA3I/O4k+Cm2sSpqxXToag596Tt+4b8OC+lHeBZ071Vp1j5+4JZaFFBqijN0cyCd68ufQr4+BQKxY=
X-Received: by 2002:a05:6214:1909:: with SMTP id
 er9mr6882300qvb.118.1638966118601; 
 Wed, 08 Dec 2021 04:21:58 -0800 (PST)
MIME-Version: 1.0
References: <20211009221711.2315352-1-robimarko@gmail.com>
 <163890036783.24891.8718291787865192280.kvalo@kernel.org>
In-Reply-To: <163890036783.24891.8718291787865192280.kvalo@kernel.org>
From: Robert Marko <robimarko@gmail.com>
Date: Wed, 8 Dec 2021 13:21:47 +0100
Message-ID: <CAOX2RU5mqUfPRDsQNSpVPdiz6sE_68KN5Ae+2bC_t1cQzdzgTA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: support bus and device specific API 1 BDF
 selection
To: Kalle Valo <kvalo@kernel.org>
Cc: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org, 
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_042202_804915_A9C05F14 
X-CRM114-Status: GOOD (  21.89  )
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

On Tue, 7 Dec 2021 at 19:06, Kalle Valo <kvalo@kernel.org> wrote:
>
> Robert Marko <robimarko@gmail.com> wrote:
>
> > Some ath10k IPQ40xx devices like the MikroTik hAP ac2 and ac3 require the
> > BDF-s to be extracted from the device storage instead of shipping packaged
> > API 2 BDF-s.
> >
> > This is required as MikroTik has started shipping boards that require BDF-s
> > to be updated, as otherwise their WLAN performance really suffers.
> > This is however impossible as the devices that require this are release
> > under the same revision and its not possible to differentiate them from
> > devices using the older BDF-s.
> >
> > In OpenWrt we are extracting the calibration data during runtime and we are
> > able to extract the BDF-s in the same manner, however we cannot package the
> > BDF-s to API 2 format on the fly and can only use API 1 to provide BDF-s on
> > the fly.
> > This is an issue as the ath10k driver explicitly looks only for the
> > board.bin file and not for something like board-bus-device.bin like it does
> > for pre-cal data.
> > Due to this we have no way of providing correct BDF-s on the fly, so lets
> > extend the ath10k driver to first look for BDF-s in the
> > board-bus-device.bin format, for example: board-ahb-a800000.wifi.bin
> > If that fails, look for the default board file name as defined previously.
> >
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
>
> Can someone review this, please? I understand the need for this, but the board
> handling is getting quite complex in ath10k so I'm hesitant.
>
> What about QCA6390 and other devices. Will they still work?
Hi Kalle,
everything else should just continue working as before unless the
board-bus-device.bin file
exists it will just use the current method to fetch the BDF.

Also, this only applies to API1 BDF-s.

We are really needing this as currently there are devices with the
wrong BDF being loaded as
we have no way of knowing where MikroTik changed it and dynamic
loading would resolve
all of that since they are one of the rare vendors that embed the
BDF-s next to calibration data.

Regards,
Robert
>
> --
> https://patchwork.kernel.org/project/linux-wireless/patch/20211009221711.2315352-1-robimarko@gmail.com/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
