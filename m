Return-Path: <SRS0=iTPL=NQ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1B6C4338F
	for <ath10k@archiver.kernel.org>; Wed, 25 Aug 2021 16:15:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F0456113A
	for <ath10k@archiver.kernel.org>; Wed, 25 Aug 2021 16:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F0456113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ojab.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCKRjIamwOVyOmff9+UVppK/A3Kmytt3VvUB1BeWIxU=; b=L7mqTX7GNyBLSI
	Aifce9NvhPqcZpNgZcLNeIHHCXYIpJP5ndZSwrvt2PNc050AAXsuzRW2+3MLzfqgCWxAEB35/d3XC
	/3iFodRbwsrjZgYZ/ekMNux800qWnN4SB5VpiLkgWi12/ZnQa8UOkLl/ECL7elpyWJ9ArdfcksNGa
	gWni/5d6VweCdHXzIqn87OgQGdNZ0sk8tmpa0AnA8FhiaUL1yuh/NpQTxNhThWYKPrXsOtiCNxGKj
	tiCj3q1H5DL//Lp3BcsOzcBnLX0bqRGyTHFtlzWxSk0t4/ZpbSXOGdTt9MR8OsbVyHifMcg6l0Qca
	RcBgoWIbsDkUS/ihnP7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIvYs-007g0w-OZ; Wed, 25 Aug 2021 16:15:34 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIvYn-007fz4-N5
 for ath10k@lists.infradead.org; Wed, 25 Aug 2021 16:15:34 +0000
Received: by mail-il1-x12d.google.com with SMTP id r6so43877ilt.13
 for <ath10k@lists.infradead.org>; Wed, 25 Aug 2021 09:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ojab.ru; s=ojab;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HBQ7/GEOmYXjqJRDQP512nK1xmzb2LUIy5CzP7HmLLc=;
 b=Le+0CERPASqTwIsSfzVaah29zkhbQegc50elIeB//BGmKeq/nqrS+dWxbohxzVbCsT
 h8M54sG98n2ayYPHa7thQjLg244JEA9OQVIK+USUQvYoNrBXzGcB0QAIuTt5UZalOgWI
 7WYNIMxhzOj2PVBzbH04wbIAYcwDPMwFLOQrs7VwyRB7sznMSKDrRXtkSReIu0C5x58S
 wj6+fI5ROlCLW+2Kz0GN4/lzi0U9sH+C2mTI38hRN+z7NqqVdhlWBT6FnMXwahRf8wyh
 7C7L95dflKKXVg/Q1fbUL/cZsyfdhMxmYSyiJA6YfoKwwCJ+RCjnvdSomgDJ5Uy8OPHY
 7v2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HBQ7/GEOmYXjqJRDQP512nK1xmzb2LUIy5CzP7HmLLc=;
 b=MRGV7bGrXEXjb8u9VILjZ0T1uIE+VqMs4UWVHM8P9H2M017CFIiAyfid4pAeFcNShX
 MI9T2gYqLnTwdj0xwKgpiEH9RMZQILW7DmjBSptWlVMUbdG08aonsj+RcQv8lmWzQndl
 84DcaQfxuyteyygG1sSDX4fF54VHh+KGrSqqcHxB7QRDQra4lZgtXA4HM+96B+LHYmZS
 e2uqLCuGst7y668zVrSBy/WZ3Kp3Ok8HEsmxQ30P+Mo5lEXpFqJXW9b23kQZSIiJYxqv
 k7/HLSYtqFxxTZLmg6xkE1nIqKlKInJqL/a3HcHmwSoovFvsjgKddOdD2T8bDIEzdPUm
 Q+1g==
X-Gm-Message-State: AOAM532PhAEGUaz31B/8EppCPc9+cffZuqFugNj1XuuJ5/6IX9zyfsXX
 B0GVzZvSV1BIAjzVlBlyguymBnG4jmahkghiLUo1XQ==
X-Google-Smtp-Source: ABdhPJyadvErapiS94DOEhvjeAXjHPr6wwH/FOcNWNYsGlyYK8iYlTrYsnOCICA7ZuQRZDvHJbiSP+9lePQkbVIw4vY=
X-Received: by 2002:a92:a008:: with SMTP id e8mr30590006ili.187.1629908127732; 
 Wed, 25 Aug 2021 09:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210722193459.7474-1-ojab@ojab.ru>
In-Reply-To: <20210722193459.7474-1-ojab@ojab.ru>
From: "ojab //" <ojab@ojab.ru>
Date: Wed, 25 Aug 2021 19:15:16 +0300
Message-ID: <CAKzrAgRt0jRFyFNjF-uq=feG-9nhCx=tTztCgCEitj1cpMk_Xg@mail.gmail.com>
Subject: Re: [PATCH V2] ath10k: don't fail if IRAM write fails
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Cc: ath10k@lists.infradead.org, 
 Linux Wireless <linux-wireless@vger.kernel.org>, netdev@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_091530_252044_2599204C 
X-CRM114-Status: GOOD (  22.88  )
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

Can I haz it merged?

//wbr ojab

On Thu, 22 Jul 2021 at 22:36, ojab <ojab@ojab.ru> wrote:
>
> After reboot with kernel & firmware updates I found `failed to copy
> target iram contents:` in dmesg and missing wlan interfaces for both
> of my QCA9984 compex cards. Rolling back kernel/firmware didn't fixed
> it, so while I have no idea what's actually happening, I don't see why
> we should fail in this case, looks like some optional firmware ability
> that could be skipped.
>
> Also with additional logging there is
> ```
> [    6.839858] ath10k_pci 0000:04:00.0: No hardware memory
> [    6.841205] ath10k_pci 0000:04:00.0: failed to copy target iram contents: -12
> [    6.873578] ath10k_pci 0000:07:00.0: No hardware memory
> [    6.875052] ath10k_pci 0000:07:00.0: failed to copy target iram contents: -12
> ```
> so exact branch could be seen.
>
> Signed-off-by: Slava Kardakov <ojab@ojab.ru>
> ---
>  Of course I forgot to sing off, since I don't use it by default because I
>  hate my real name and kernel requires it
>
>  drivers/net/wireless/ath/ath10k/core.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 2f9be182fbfb..d9fd5294e142 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2691,8 +2691,10 @@ static int ath10k_core_copy_target_iram(struct ath10k *ar)
>         u32 len, remaining_len;
>
>         hw_mem = ath10k_coredump_get_mem_layout(ar);
> -       if (!hw_mem)
> +       if (!hw_mem) {
> +               ath10k_warn(ar, "No hardware memory");
>                 return -ENOMEM;
> +       }
>
>         for (i = 0; i < hw_mem->region_table.size; i++) {
>                 tmp = &hw_mem->region_table.regions[i];
> @@ -2702,8 +2704,10 @@ static int ath10k_core_copy_target_iram(struct ath10k *ar)
>                 }
>         }
>
> -       if (!mem_region)
> +       if (!mem_region) {
> +               ath10k_warn(ar, "No memory region");
>                 return -ENOMEM;
> +       }
>
>         for (i = 0; i < ar->wmi.num_mem_chunks; i++) {
>                 if (ar->wmi.mem_chunks[i].req_id ==
> @@ -2917,7 +2921,6 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
>                 if (status) {
>                         ath10k_warn(ar, "failed to copy target iram contents: %d",
>                                     status);
> -                       goto err_hif_stop;
>                 }
>         }
>
> --
> 2.32.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
