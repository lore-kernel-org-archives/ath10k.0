Return-Path: <SRS0=aCQL=MO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B54DC4338F
	for <ath10k@archiver.kernel.org>; Thu, 22 Jul 2021 19:43:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61EC460EB1
	for <ath10k@archiver.kernel.org>; Thu, 22 Jul 2021 19:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61EC460EB1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ojab.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2XBfKSH20t06XKvOh0wNA7OEEgnAOSxo86IlJ5yhI+U=; b=B+EbGYRxrBT3Yg
	y3NtfXdpvsFw19u0egxUAwhwebq/tNd2L1o1dNFxN5Sf06loeqZ/TfRUcSrYn/gBQsHNfGWu35IGZ
	eY92QXhtqc4qLitxo5Sn/rUvyPBsL6SukwPnjTJhvyWeicthPHs38esTqmB2KMds44HdmN36vy44S
	tw8rOm0Wbi+50U01aamRkFcVOlpH89oWjzC2KVrJUqhaMKp4+LYZSzp8KErIZcS3eKuuyobbBivUN
	hollOP1nyNpAW0os73CIOtAZ1zjghJg6lVnTGdLnB3sRN2ZqJdusJW7mhnghNGzw9fjUNF4Om6Kzo
	C6V2p3+4vomq/I9z8Tiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6ead-002aiD-Fk; Thu, 22 Jul 2021 19:42:39 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6eaa-002ahE-2Z
 for ath10k@lists.infradead.org; Thu, 22 Jul 2021 19:42:37 +0000
Received: by mail-il1-x12c.google.com with SMTP id m20so6446725ili.9
 for <ath10k@lists.infradead.org>; Thu, 22 Jul 2021 12:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ojab.ru; s=ojab;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bEuCuHt84F523pMpVlgmLvJ4UIBF4EoLTs4dbDpATW8=;
 b=mKU59JZsPpk4Uwrh9veqroWHFfmAS+JdwuvxLQdk+8vF9zAFjuiNoiHEI24a2DukKo
 5MhOTtxunUNS4hbaqrDkjLwYr76tA5g73A4+lczu0NSSiOmMb+UKUc6r6h99MW6A5+b9
 Q7bvYpxu1Mon2J4EnpLpVzxK+RGPMCxddZpU/EWqjSdsZnK8PKC4m/3T/xuu5KrT1ASi
 wyy/tEO03vbX5aFkjMVtqkhVlsb6N31yshFICDUkrcKUmWz8qhBs0tytE1iqSKSKgECD
 tpPtwFrUdXvO7VCKWdKQKxmu2xurNAK46JCBbIFn7O5l/cT9FyPL2gorlJMGX2WfLV2Q
 qnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bEuCuHt84F523pMpVlgmLvJ4UIBF4EoLTs4dbDpATW8=;
 b=A/QYL1zg6qTsM7ZaRLcDdlg/1tlKUQ+SbsT4Vwf89ZtR1M1xxiyW0Mp2brHtLW0LTp
 3heBRPUP46WSWJhSnhzapnwDURO4L8RruSbl5hnGfxTdUw3ePr4X66KqXJ/VK39lpJU7
 oZVdwS0VYOR+ek+sJ7b/YKBM1OxBs5D2pNJgqKaofCgDqLlkjjfjpS8UU1aOT4jcmsSa
 KTmz7fnSQ1TFi7/0g7J06qGglbHujU3fNVNDvujSOpJMH6fpPhbJJP9BFVuwnoVsZvok
 UnPWoOUGeVUX8vAWMmI/+/WkVqouRaE2eK3KIOPurlQWuxDMr6IdssbmfQFPERXJm0Gb
 J3WQ==
X-Gm-Message-State: AOAM530hel11x8a+ot2hC4oh0orlqCQOuTNBD2bRW1nL9/Umx6CV6b9P
 Dhh7tEdOvyGeUiQqJo/to+VicnRSJ1ul0Qp/jW8FeA==
X-Google-Smtp-Source: ABdhPJyMABrkiHTJMS9LZm/CFEJBy6P8UgBeaGafeRs22DUJ5aaCx9PBDCrxo0HZCPVZx1y0wGfrIk1R5ZHDwpeYc/o=
X-Received: by 2002:a05:6e02:1d0f:: with SMTP id
 i15mr893058ila.199.1626982954711; 
 Thu, 22 Jul 2021 12:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210722193459.7474-1-ojab@ojab.ru>
In-Reply-To: <20210722193459.7474-1-ojab@ojab.ru>
From: "ojab //" <ojab@ojab.ru>
Date: Thu, 22 Jul 2021 22:42:23 +0300
Message-ID: <CAKzrAgRvOLX6rcKKz=8ghD+QLyMu-1KEPm5HkkLEAzuE1MQpDA@mail.gmail.com>
Subject: Re: [PATCH V2] ath10k: don't fail if IRAM write fails
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, axel.rasmussen1@gmail.com
Cc: ath10k@lists.infradead.org, 
 Linux Wireless <linux-wireless@vger.kernel.org>, netdev@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_124236_177460_8C973AF6 
X-CRM114-Status: GOOD (  21.86  )
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

See also: https://lists.infradead.org/pipermail/ath10k/2021-May/012626.html

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
