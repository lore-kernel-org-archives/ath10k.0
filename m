Return-Path: <SRS0=SK/k=OI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A48C433EF
	for <ath10k@archiver.kernel.org>; Sat, 18 Sep 2021 11:22:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 795626103B
	for <ath10k@archiver.kernel.org>; Sat, 18 Sep 2021 11:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 795626103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ojab.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PEOracyrWMxwfrGuLrQ6RcYn0yU3Cq88qDdp1IXNWUY=; b=2bGOVG2Jhek52A
	FhY81rdgZbvBapwj7VDyWuFZ01zDBNpl8PQAjVGK2UTecETbDSZKZjPpfzarQOyEpCwrFHlqLE13p
	TmI3y7PIyVTwffn6ROSy065al+igrFWtJ6nXwrt9ZV++aISf4iG/3WcOfJ5QU4fr8LKHUK1im1wqW
	ktDHt5+vodjjVJbeH0NTyoGVTSfsmCW3vBvfJZxCFG46HHx2cwgU9OCjOY6WmJlfPWEL8rLMR2JmM
	MCg8ltuAInjvR3AnuJ2dngTEEseccVRjXcmcrIkxQPf+34PnBl814AYVtYpFQ7JjWaREmD82gbEOY
	RHo0t3M4s0/IM8bWGZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRYPQ-00FpIR-Nv; Sat, 18 Sep 2021 11:21:28 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRYPM-00FpHU-W1
 for ath10k@lists.infradead.org; Sat, 18 Sep 2021 11:21:27 +0000
Received: by mail-io1-xd30.google.com with SMTP id m11so15519858ioo.6
 for <ath10k@lists.infradead.org>; Sat, 18 Sep 2021 04:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ojab.ru; s=ojab;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+vTIBq7OgcFSIUkKEdHY3wi/HPPALeiPsoDimZEmejs=;
 b=TB7+9svnr9db5eEQUcCbKnnthERxnsR3zGSst85Gue8c5XVSczZl73Z3IQ8pRQfT3c
 7ZoKYL6RyebbyeInS8PBtSlIu7ibrCwG32ouDax/Ezk8jYGrxqo3TndHw2eqAwfY13dN
 9V/+EThULN+urYK/0fnnBbnraXPIl/T8mbPIDcr6aRMwDh2KRjXt3ir27rUKwA7Wv+9S
 Y+VefQsIGKFPPmPRfFvFoYNP/CvB6FfBTp7Wv1rZQHFOKnkfhLFpELOwMOuiZye51uWT
 G5icb2n99Mcu+90RKzfpCg5SU68h27lE/XZhrc0SI9UfiWqxdidObJhBjP32Zgshluca
 plaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+vTIBq7OgcFSIUkKEdHY3wi/HPPALeiPsoDimZEmejs=;
 b=M0cYlaWJcxoFtTCJMu2nVu0RKrr3oXaXfdOD0ksJdERz5rakdaS8whC2ALjh/4NtdJ
 Jys/DvIov5gzlvK977JNHhk0FOtn84qb09eerusMCl3x2pNm3OocAH/2ZkGHjWvBljSe
 ati5wyQ3aZfMJk/ZRYoYT7yk/o1M9g3wWXP2suf7CzPau6GjoqHWwK4c8UuHJ40fOSwL
 s6r/rbxa4Gt8IdBRD79L+/iDDMFE/IH0YJYV8uLItw6+lfENTRU1oDIjlBMQWCrSahDh
 rf6Bi4+eff0aRpAixbJoFJ5ucoMHrO4A2XWhA3W5s90N4gQfvWaOIMmpSrCHS04thTop
 NJ8w==
X-Gm-Message-State: AOAM532IlBLG4JBI1PBMinkpofEhvQEuL+NyYztDxF22DcQnQBU2K9Kl
 EQtM3dfEHQ95ve8MS65YOl+8SBzCDNMtsvrWEffmTg==
X-Google-Smtp-Source: ABdhPJwawAEnPF7WRSLXu4E3brYMb0Nevsg4dHFpW+EkY/D0CNrUQ0zciPKvDG41wbFIpYfBR3EDXX6UubRwmQc25yE=
X-Received: by 2002:a6b:f007:: with SMTP id w7mr12181943ioc.112.1631964081521; 
 Sat, 18 Sep 2021 04:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210722193459.7474-1-ojab@ojab.ru>
 <CAKzrAgRt0jRFyFNjF-uq=feG-9nhCx=tTztCgCEitj1cpMk_Xg@mail.gmail.com>
 <CAKzrAgQgsN6=Cu4SvjSSFoJOqAkU2t8cjt7sgEsJdNhvM8f7jg@mail.gmail.com>
 <CAKzrAgSEiq-qOgetzryaE3JyBUe3URYjr=Fn0kz9sF7ZryQ5pA@mail.gmail.com>
 <538825a2-82f0-6102-01da-6e0385e53cf5@gmx.de>
In-Reply-To: <538825a2-82f0-6102-01da-6e0385e53cf5@gmx.de>
From: "ojab //" <ojab@ojab.ru>
Date: Sat, 18 Sep 2021 14:21:10 +0300
Message-ID: <CAKzrAgQcT=X0JtqoVWiTEhqSDcN-4XSW2xW6dWLsVo_OZt+hEw@mail.gmail.com>
Subject: Re: [PATCH V2] ath10k: don't fail if IRAM write fails
To: "sparks71@gmx.de" <sparks71@gmx.de>
Cc: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath10k@lists.infradead.org, 
 Linux Wireless <linux-wireless@vger.kernel.org>, netdev@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210918_042125_099895_CBF799B8 
X-CRM114-Status: GOOD (  24.35  )
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

oh, awesome. Thanks!

//wbr ojab

On Sat, 18 Sept 2021 at 13:12, sparks71@gmx.de <sparks71@gmx.de> wrote:
>
> Have you seen the new patch?
>
> https://www.mail-archive.com/ath10k@lists.infradead.org/msg13784.html
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=master-pending&id=973de582639a1e45276e4e3e2f3c2d82a04ad0a6
>
>
> could probably have been communicated better
>
>
> best regards
>
>
>
> Am 17.09.21 um 21:30 schrieb ojab //:
> > ._.
> >
> > //wbr ojab
> >
> > On Thu, 9 Sept 2021 at 02:42, ojab // <ojab@ojab.ru> wrote:
> >> Gentle ping.
> >>
> >> //wbr ojab
> >>
> >> On Wed, 25 Aug 2021 at 19:15, ojab // <ojab@ojab.ru> wrote:
> >>> Can I haz it merged?
> >>>
> >>> //wbr ojab
> >>>
> >>> On Thu, 22 Jul 2021 at 22:36, ojab <ojab@ojab.ru> wrote:
> >>>> After reboot with kernel & firmware updates I found `failed to copy
> >>>> target iram contents:` in dmesg and missing wlan interfaces for both
> >>>> of my QCA9984 compex cards. Rolling back kernel/firmware didn't fixed
> >>>> it, so while I have no idea what's actually happening, I don't see why
> >>>> we should fail in this case, looks like some optional firmware ability
> >>>> that could be skipped.
> >>>>
> >>>> Also with additional logging there is
> >>>> ```
> >>>> [    6.839858] ath10k_pci 0000:04:00.0: No hardware memory
> >>>> [    6.841205] ath10k_pci 0000:04:00.0: failed to copy target iram contents: -12
> >>>> [    6.873578] ath10k_pci 0000:07:00.0: No hardware memory
> >>>> [    6.875052] ath10k_pci 0000:07:00.0: failed to copy target iram contents: -12
> >>>> ```
> >>>> so exact branch could be seen.
> >>>>
> >>>> Signed-off-by: Slava Kardakov <ojab@ojab.ru>
> >>>> ---
> >>>>   Of course I forgot to sing off, since I don't use it by default because I
> >>>>   hate my real name and kernel requires it
> >>>>
> >>>>   drivers/net/wireless/ath/ath10k/core.c | 9 ++++++---
> >>>>   1 file changed, 6 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> >>>> index 2f9be182fbfb..d9fd5294e142 100644
> >>>> --- a/drivers/net/wireless/ath/ath10k/core.c
> >>>> +++ b/drivers/net/wireless/ath/ath10k/core.c
> >>>> @@ -2691,8 +2691,10 @@ static int ath10k_core_copy_target_iram(struct ath10k *ar)
> >>>>          u32 len, remaining_len;
> >>>>
> >>>>          hw_mem = ath10k_coredump_get_mem_layout(ar);
> >>>> -       if (!hw_mem)
> >>>> +       if (!hw_mem) {
> >>>> +               ath10k_warn(ar, "No hardware memory");
> >>>>                  return -ENOMEM;
> >>>> +       }
> >>>>
> >>>>          for (i = 0; i < hw_mem->region_table.size; i++) {
> >>>>                  tmp = &hw_mem->region_table.regions[i];
> >>>> @@ -2702,8 +2704,10 @@ static int ath10k_core_copy_target_iram(struct ath10k *ar)
> >>>>                  }
> >>>>          }
> >>>>
> >>>> -       if (!mem_region)
> >>>> +       if (!mem_region) {
> >>>> +               ath10k_warn(ar, "No memory region");
> >>>>                  return -ENOMEM;
> >>>> +       }
> >>>>
> >>>>          for (i = 0; i < ar->wmi.num_mem_chunks; i++) {
> >>>>                  if (ar->wmi.mem_chunks[i].req_id ==
> >>>> @@ -2917,7 +2921,6 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
> >>>>                  if (status) {
> >>>>                          ath10k_warn(ar, "failed to copy target iram contents: %d",
> >>>>                                      status);
> >>>> -                       goto err_hif_stop;
> >>>>                  }
> >>>>          }
> >>>>
> >>>> --
> >>>> 2.32.0
> > _______________________________________________
> > ath10k mailing list
> > ath10k@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/ath10k
> >
> >
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
