Return-Path: <SRS0=iK1b=OH=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BDEC433EF
	for <ath10k@archiver.kernel.org>; Fri, 17 Sep 2021 19:30:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A88E161019
	for <ath10k@archiver.kernel.org>; Fri, 17 Sep 2021 19:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A88E161019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ojab.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2jj+C+zUZ2ZvJtGqXARJFVlyAJJSQQBPUiol7gutyo=; b=K2JOG15/KAoo17
	VzORyYj0ckgnapKhs0J+qHf+2F9c20OyLnfYa7juCrtC8dIsvMdsjF4k1Tp1FU5Tle7ubb+0s/Ln6
	5RTMJsfvI7542k5kOfyAjDIvnA14+yEeNQ5T/zV7bqTwqhMPBlxCq9dBxG84Oq+1MUIoYYg0CGv/i
	EPV19FuBbfBBkGKKvM8avO9CsEVL6b9TjZ4ZzwlT7iYBJukuCA3QJdPnH6zvR174mHrL8zVA/dkqC
	HPSFEeRGT8c/q8rJD9GywLLFJvnsNwdtcSlMPCbRqnXGpoCkV3N1RtwdYQZBFoNKhMuewpClVKF0a
	f0fiSJ00XxbXlw89GknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRJZ4-00EvmG-VX; Fri, 17 Sep 2021 19:30:27 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRJZ0-00EvlP-Vo
 for ath10k@lists.infradead.org; Fri, 17 Sep 2021 19:30:25 +0000
Received: by mail-il1-x12d.google.com with SMTP id v16so11459173ilg.3
 for <ath10k@lists.infradead.org>; Fri, 17 Sep 2021 12:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ojab.ru; s=ojab;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ojecROmdoKkDHQugVR33EyjeLmCBRcyr3oOr5dKqIQg=;
 b=Ep0ZieCcO4BsRRbYVJprHD1D0tCQbXTeINo5K+rm/qMUe5lOMFaqTIx5rLAbUK3MZ0
 iU2JgBpLlUxdCT9DhLA8cvosIVBG7Fyjz4cZ9HLY48P5FGCV2UgWZRTVuMIdBE0GX8ti
 7coXIdlvUVOHrZ+ClGUILKUxAj0c5kbBFTiGEJtQPf+NkVrZijx4GqSF3O67JGs4GWVg
 bmIk6weEl1jaxtmRgq/wlX8dMuxRcgHhMoKCZUd+RSJNEsaLtfSt0MX6Sqo4aWrVfTEF
 /h0nUj+npLuTlV4j0AVc/PyneJXT1JaXpPxQ8Xycxrcxmsfi5XmsLZ212M+v5pMtFIG6
 VhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ojecROmdoKkDHQugVR33EyjeLmCBRcyr3oOr5dKqIQg=;
 b=WkOdiMTeZTVT83W/0ddklr4V9TGlV0Cgc36kA2UMHa4KMwTVwKNuGho3p8Q0dSUlC5
 7p1D0StdB8m9Rvg2TWASX557ORJjAGzchHdwK2vsL1/4CZgkMTsE/Z3xqikTBjzKM+gC
 WT2qneaiGiMQ1kP2FSfwOMlNtAt887eCPK6YWRR1wRDcJpVrt7oD6p7SQ9M+eAfNMplC
 qHMg9ydcflK20COruFe52o8YmQur1qpbJPlAiG2e9Y7nWmPiyT4xBrU4zz1JPczq16IN
 75YevNysR4oW7DvkBX/+xeIBf6o5LAXXm8Uk5X+VD4wErNSXYfsgjErOV4gYWEJBxXyE
 DQJg==
X-Gm-Message-State: AOAM532kI0QaX6hXy8gH/u+9wLFzL4eCYSE6CGOl4vZLTtZZfNhYXI6I
 BYnQg9LlmsSuWB8QGsgcbquo6/gCdTJlfk6yIy6mdg==
X-Google-Smtp-Source: ABdhPJzNhc+5vT8caUkTVnUoJ+e8ww4JroaL2iushz0B5BOIkm3zxnf+CYp3OJLGCdj3n2OSueskKdNmYpHTP0qsN6g=
X-Received: by 2002:a05:6e02:1bc3:: with SMTP id
 x3mr9490382ilv.113.1631907020457; 
 Fri, 17 Sep 2021 12:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210722193459.7474-1-ojab@ojab.ru>
 <CAKzrAgRt0jRFyFNjF-uq=feG-9nhCx=tTztCgCEitj1cpMk_Xg@mail.gmail.com>
 <CAKzrAgQgsN6=Cu4SvjSSFoJOqAkU2t8cjt7sgEsJdNhvM8f7jg@mail.gmail.com>
In-Reply-To: <CAKzrAgQgsN6=Cu4SvjSSFoJOqAkU2t8cjt7sgEsJdNhvM8f7jg@mail.gmail.com>
From: "ojab //" <ojab@ojab.ru>
Date: Fri, 17 Sep 2021 22:30:09 +0300
Message-ID: <CAKzrAgSEiq-qOgetzryaE3JyBUe3URYjr=Fn0kz9sF7ZryQ5pA@mail.gmail.com>
Subject: Re: [PATCH V2] ath10k: don't fail if IRAM write fails
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Cc: ath10k@lists.infradead.org, 
 Linux Wireless <linux-wireless@vger.kernel.org>, netdev@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_123023_469512_2F96A885 
X-CRM114-Status: GOOD (  25.56  )
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

._.

//wbr ojab

On Thu, 9 Sept 2021 at 02:42, ojab // <ojab@ojab.ru> wrote:
>
> Gentle ping.
>
> //wbr ojab
>
> On Wed, 25 Aug 2021 at 19:15, ojab // <ojab@ojab.ru> wrote:
> >
> > Can I haz it merged?
> >
> > //wbr ojab
> >
> > On Thu, 22 Jul 2021 at 22:36, ojab <ojab@ojab.ru> wrote:
> > >
> > > After reboot with kernel & firmware updates I found `failed to copy
> > > target iram contents:` in dmesg and missing wlan interfaces for both
> > > of my QCA9984 compex cards. Rolling back kernel/firmware didn't fixed
> > > it, so while I have no idea what's actually happening, I don't see why
> > > we should fail in this case, looks like some optional firmware ability
> > > that could be skipped.
> > >
> > > Also with additional logging there is
> > > ```
> > > [    6.839858] ath10k_pci 0000:04:00.0: No hardware memory
> > > [    6.841205] ath10k_pci 0000:04:00.0: failed to copy target iram contents: -12
> > > [    6.873578] ath10k_pci 0000:07:00.0: No hardware memory
> > > [    6.875052] ath10k_pci 0000:07:00.0: failed to copy target iram contents: -12
> > > ```
> > > so exact branch could be seen.
> > >
> > > Signed-off-by: Slava Kardakov <ojab@ojab.ru>
> > > ---
> > >  Of course I forgot to sing off, since I don't use it by default because I
> > >  hate my real name and kernel requires it
> > >
> > >  drivers/net/wireless/ath/ath10k/core.c | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> > > index 2f9be182fbfb..d9fd5294e142 100644
> > > --- a/drivers/net/wireless/ath/ath10k/core.c
> > > +++ b/drivers/net/wireless/ath/ath10k/core.c
> > > @@ -2691,8 +2691,10 @@ static int ath10k_core_copy_target_iram(struct ath10k *ar)
> > >         u32 len, remaining_len;
> > >
> > >         hw_mem = ath10k_coredump_get_mem_layout(ar);
> > > -       if (!hw_mem)
> > > +       if (!hw_mem) {
> > > +               ath10k_warn(ar, "No hardware memory");
> > >                 return -ENOMEM;
> > > +       }
> > >
> > >         for (i = 0; i < hw_mem->region_table.size; i++) {
> > >                 tmp = &hw_mem->region_table.regions[i];
> > > @@ -2702,8 +2704,10 @@ static int ath10k_core_copy_target_iram(struct ath10k *ar)
> > >                 }
> > >         }
> > >
> > > -       if (!mem_region)
> > > +       if (!mem_region) {
> > > +               ath10k_warn(ar, "No memory region");
> > >                 return -ENOMEM;
> > > +       }
> > >
> > >         for (i = 0; i < ar->wmi.num_mem_chunks; i++) {
> > >                 if (ar->wmi.mem_chunks[i].req_id ==
> > > @@ -2917,7 +2921,6 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
> > >                 if (status) {
> > >                         ath10k_warn(ar, "failed to copy target iram contents: %d",
> > >                                     status);
> > > -                       goto err_hif_stop;
> > >                 }
> > >         }
> > >
> > > --
> > > 2.32.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
