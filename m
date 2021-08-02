Return-Path: <SRS0=8Cel=MZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6963AC4338F
	for <ath10k@archiver.kernel.org>; Mon,  2 Aug 2021 02:24:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BA3E61042
	for <ath10k@archiver.kernel.org>; Mon,  2 Aug 2021 02:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BA3E61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7U7CGtnoS+jl25cHdxoy6VcbYmDwoI7XF+YMTOkvng8=; b=Y+euxrNcpuYQl7
	TNLShYqbgVhS6Ubzftziv0RYO+a8q/QpoteIox7p2deh9pdoEOYy2JTjSkkdWHml8QNg1fbP96aw+
	yyERIF/Nxkdeye3RTQc/3J3sUWNEcsHDwLpwJYwUfNpOHpx7h72tuV7CU6+KkZCFPsedbvtwM8Qk/
	iNSLSpo8x2EaeYVt5ViSk881yV38QpJFg/GFP1XXJb7NZoxFXMtIv1Iq415jxKzKXadzzlsmd7eIn
	ujKrItUbY7kK3MlAWNnnTJFDIK8UVTf9eNZIRUz70e6gVPS1ryvkXlXZ6CmBT90pnYE9tZatfcNU8
	0fXtsdsb0Kzb8HjXhUOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mANcU-00EhHd-8K; Mon, 02 Aug 2021 02:23:58 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mANcR-00EhGf-AJ
 for ath10k@lists.infradead.org; Mon, 02 Aug 2021 02:23:57 +0000
Received: by mail-ej1-x62f.google.com with SMTP id oz16so28345050ejc.7
 for <ath10k@lists.infradead.org>; Sun, 01 Aug 2021 19:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kcU9zh0OTfEVkVwBtfOEs7GMplFE2emjbqTkOWvTJmY=;
 b=MH4e5RPIr6Gd5OKpKwYKjBLLrC1KcSfy3ETOyVLpDkTMrd1BirTdjNvMLKblpkeCOy
 RXNWkBcZqxsIZWBC5WYhTz1EnDPGVInOJVRBpoMn0V+9mQsoL56ll0eHjb0nReKOOB4i
 2JH1KRuhIVtUptWWd3PwdksBdx/muzswJCPECQPhhscy14K9Yb8qtJ4ZaKaf+ehBo0/8
 BJPCCR6QeKJTFgH/Y6SHFNHhn4h2fj9NUBgo7NunQIF3vVthZz9vXMvbu4HWKkvbWgVT
 5r3gUiSvlpxehbCbsd30ac2XgMQoEeUneSDLdPdUxJsn5e0AM3UU57JPcQ2+RdjhIWby
 pQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kcU9zh0OTfEVkVwBtfOEs7GMplFE2emjbqTkOWvTJmY=;
 b=HuSeo43YM6wCnVly5ab0zTPr8etnNPBfo6bjhXcmzhw3QIo6dqcTCkbpj0M2MdehDK
 FQrOIz4/8566NVmImmWyYc9h5nYN5RXNVNuveE4Dq7B6sW+kofPiiLQ6VWTXGj2w231R
 hNLBWYEe3+6tPwuqJZUR6BHESCyWFgbIhvHy6MX0gQoAEdKSAbHeXYpXysrDfKc+cFC/
 n8KetEaQSCSSPlhbIcKkGvIJzVtEPTVP3kC7AI5AK6uvGt1sJxYeagzVv3ycJ90LEba2
 2g3ghfAbgExP+W25bD+uOogxkSjW+5QGKa0f2V3bDdOMcvAJJZZ/khS9WqLwoL1c2lfz
 mJTw==
X-Gm-Message-State: AOAM530xgw/vakLVhMWpmyS+Xxqa6prQ7r9u2gNunbMnEWEhXBGBIEjl
 DWGVHwsF7GtMTmoHRgdqqJUvIxCOCAvWLFvchbs=
X-Google-Smtp-Source: ABdhPJyWpcBYilhB5rRxMRSa3CCrCFIFRFqvnlP2Suej+HlvvmvJHn6xR3qCJEWmVySTguagDCpasNmcewlLedTS7Ag=
X-Received: by 2002:a17:907:987c:: with SMTP id
 ko28mr13480958ejc.200.1627871028530; 
 Sun, 01 Aug 2021 19:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210722193459.7474-1-ojab@ojab.ru>
 <CAKzrAgRvOLX6rcKKz=8ghD+QLyMu-1KEPm5HkkLEAzuE1MQpDA@mail.gmail.com>
In-Reply-To: <CAKzrAgRvOLX6rcKKz=8ghD+QLyMu-1KEPm5HkkLEAzuE1MQpDA@mail.gmail.com>
From: Axel Rasmussen <axel.rasmussen1@gmail.com>
Date: Sun, 1 Aug 2021 19:23:37 -0700
Message-ID: <CACC2YF1j45r0chib-HC463FVO_a1Um1f+7PvuRBYVLC7WbgGnQ@mail.gmail.com>
Subject: Re: [PATCH V2] ath10k: don't fail if IRAM write fails
To: "ojab //" <ojab@ojab.ru>
Cc: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath10k@lists.infradead.org, 
 Linux Wireless <linux-wireless@vger.kernel.org>, netdev@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_192355_423935_ACE6B3AE 
X-CRM114-Status: GOOD (  26.93  )
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

On Thu, Jul 22, 2021 at 12:42 PM ojab // <ojab@ojab.ru> wrote:
>
> See also: https://lists.infradead.org/pipermail/ath10k/2021-May/012626.html
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

Thanks for working on this! And sorry for the slow response. I've been
unexpectedly very busy lately, but I plan to test out this patch next
week.

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
