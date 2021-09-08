Return-Path: <SRS0=6ef7=N6=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E94C433EF
	for <ath10k@archiver.kernel.org>; Wed,  8 Sep 2021 23:43:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFF9361158
	for <ath10k@archiver.kernel.org>; Wed,  8 Sep 2021 23:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFF9361158
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ojab.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bUe22I1RnqLhLnqBTSZE8G1/reEfv0jXrTyhuLJjX8A=; b=pGPZ6VTB7jKISG
	0sgpQLt4NrMp9neM+fIxXSAgn5ZfcWbAyVAscnd3NFKrjchUpnn5rn+BZWq+4EmSlTNvxeDxGVsgP
	1E/ZUJzjHfbirp8XgnOnAAd3cCxlvBOXw8qfkXCxCY2fzhbNo+gS2Djs1r50AyO3tm0emsTRf+UqX
	xz+BRR8dqK6oAB2rLTp1WKO7K5eJ5Q6B6OmDYQVBywwf9EA3UMxghjeYyUK+R1fUTLd7oKfgkpZVN
	c62iTqqsmc75UeGaFLyTE34CJ2Avmz+3uH1d+KKa33V5lV5bMcgiMK+2t49xyA2Lur84gcdo3NMCn
	abBFPTiZuazN8BEzkJZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO7DZ-007nmZ-Qs; Wed, 08 Sep 2021 23:43:01 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO7DV-007nlt-Rt
 for ath10k@lists.infradead.org; Wed, 08 Sep 2021 23:42:59 +0000
Received: by mail-io1-xd2b.google.com with SMTP id z1so5542990ioh.7
 for <ath10k@lists.infradead.org>; Wed, 08 Sep 2021 16:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ojab.ru; s=ojab;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=up2XsrnvlIFzj8+jd7lbSzWI6A4vHwt4fG2fDS+P6QI=;
 b=HpWJLAYbhN3lnywIcBJmKBR2fyhxhEkc/yleJGUo6GUunFhNL8Oie2lyK3RWHm2fsB
 jbaApLygjDbQkzs3WZgYWLHj8JbHwvLhbY31V7B8uMm0hO6I4MVvkTZMiFr0y72iWCEQ
 bX1fSIDqrl2OBrWEiZ5qTknR1tf7YjWdvLPu2Y8AzE/5gwVdUUy8YwL+jI02oVf+HZJZ
 zl1zBBWecpp0lWZD/R8aiowpzqyEMk1mfdkmrEhtCTMLyu6SlosFobt5OYNrdZmhVrTQ
 xpccguLy6X+j8EP6nKO8d3xZ1pt0XxbdA2klEMhABQvtSw26+POjoiKUdGECeA2MRO8e
 yP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=up2XsrnvlIFzj8+jd7lbSzWI6A4vHwt4fG2fDS+P6QI=;
 b=Xwaulh96P/rV93D3wfR97jWD5id5gmMTiaWtDYXVTmE6pnvSv+ehuDHqEkApXW+e4D
 1NEZQDm2fFlT27+7w7PGz71x7C969XMM3rTSA5/oKfwxl04gWkmI7vb+XJh7YRB2kS5L
 gm8DjDT0EO0Xp3Rb1sUIeO1tQf1GTY44UrtFwDhG97bGz16H0LlBT2wmSxWJ3J5DQ5CN
 61mLpsm1c3wbnTeBJ4YdSoUQy8GTstQmBjzlOEkjSouGExcCoVx5u4SJVTrPc13Sm6Rq
 5o5DdqgCqbe4Bbraak/YOddsRxJ9ORGb1pqOYVTeiOav3Wa91L85Y5wD4vDqPy1xh7MR
 p3Eg==
X-Gm-Message-State: AOAM532lIzFRekJg44LBgqGKp9Ykn455VDLYlXGe/7ujHKiR/UY6Qap3
 /LAM7qkEGFdf3zPPHunEgB3ypEA/zz7ghgP+Tkz/LQ==
X-Google-Smtp-Source: ABdhPJyGEuoLSQC3YF3kxRyp4VjkbJsVtFOCMq06PZzRQb1nx4K/uFtuO/48yF5x8mjoPX1l1CEy+zh9Q/Dz0Y3oMmw=
X-Received: by 2002:a6b:f007:: with SMTP id w7mr106755ioc.112.1631144572943;
 Wed, 08 Sep 2021 16:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210722193459.7474-1-ojab@ojab.ru>
 <CAKzrAgRt0jRFyFNjF-uq=feG-9nhCx=tTztCgCEitj1cpMk_Xg@mail.gmail.com>
In-Reply-To: <CAKzrAgRt0jRFyFNjF-uq=feG-9nhCx=tTztCgCEitj1cpMk_Xg@mail.gmail.com>
From: "ojab //" <ojab@ojab.ru>
Date: Thu, 9 Sep 2021 02:42:42 +0300
Message-ID: <CAKzrAgQgsN6=Cu4SvjSSFoJOqAkU2t8cjt7sgEsJdNhvM8f7jg@mail.gmail.com>
Subject: Re: [PATCH V2] ath10k: don't fail if IRAM write fails
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Cc: ath10k@lists.infradead.org, 
 Linux Wireless <linux-wireless@vger.kernel.org>, netdev@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_164258_167226_4AC657E3 
X-CRM114-Status: GOOD (  25.67  )
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

Gentle ping.

//wbr ojab

On Wed, 25 Aug 2021 at 19:15, ojab // <ojab@ojab.ru> wrote:
>
> Can I haz it merged?
>
> //wbr ojab
>
> On Thu, 22 Jul 2021 at 22:36, ojab <ojab@ojab.ru> wrote:
> >
> > After reboot with kernel & firmware updates I found `failed to copy
> > target iram contents:` in dmesg and missing wlan interfaces for both
> > of my QCA9984 compex cards. Rolling back kernel/firmware didn't fixed
> > it, so while I have no idea what's actually happening, I don't see why
> > we should fail in this case, looks like some optional firmware ability
> > that could be skipped.
> >
> > Also with additional logging there is
> > ```
> > [    6.839858] ath10k_pci 0000:04:00.0: No hardware memory
> > [    6.841205] ath10k_pci 0000:04:00.0: failed to copy target iram contents: -12
> > [    6.873578] ath10k_pci 0000:07:00.0: No hardware memory
> > [    6.875052] ath10k_pci 0000:07:00.0: failed to copy target iram contents: -12
> > ```
> > so exact branch could be seen.
> >
> > Signed-off-by: Slava Kardakov <ojab@ojab.ru>
> > ---
> >  Of course I forgot to sing off, since I don't use it by default because I
> >  hate my real name and kernel requires it
> >
> >  drivers/net/wireless/ath/ath10k/core.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> > index 2f9be182fbfb..d9fd5294e142 100644
> > --- a/drivers/net/wireless/ath/ath10k/core.c
> > +++ b/drivers/net/wireless/ath/ath10k/core.c
> > @@ -2691,8 +2691,10 @@ static int ath10k_core_copy_target_iram(struct ath10k *ar)
> >         u32 len, remaining_len;
> >
> >         hw_mem = ath10k_coredump_get_mem_layout(ar);
> > -       if (!hw_mem)
> > +       if (!hw_mem) {
> > +               ath10k_warn(ar, "No hardware memory");
> >                 return -ENOMEM;
> > +       }
> >
> >         for (i = 0; i < hw_mem->region_table.size; i++) {
> >                 tmp = &hw_mem->region_table.regions[i];
> > @@ -2702,8 +2704,10 @@ static int ath10k_core_copy_target_iram(struct ath10k *ar)
> >                 }
> >         }
> >
> > -       if (!mem_region)
> > +       if (!mem_region) {
> > +               ath10k_warn(ar, "No memory region");
> >                 return -ENOMEM;
> > +       }
> >
> >         for (i = 0; i < ar->wmi.num_mem_chunks; i++) {
> >                 if (ar->wmi.mem_chunks[i].req_id ==
> > @@ -2917,7 +2921,6 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
> >                 if (status) {
> >                         ath10k_warn(ar, "failed to copy target iram contents: %d",
> >                                     status);
> > -                       goto err_hif_stop;
> >                 }
> >         }
> >
> > --
> > 2.32.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
