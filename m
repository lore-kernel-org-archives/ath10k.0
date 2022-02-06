Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8966DC433F5
	for <ath10k@archiver.kernel.org>; Sun,  6 Feb 2022 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWJ4Zi9PPTkeGv8/+Ng8AOBFQafe7gJOug4JbNinDkU=; b=mAhLCYV8FVapA9
	7uGq23RcUe4TaV8TCKSloYZJoFeuO6K9IAgyLuBm4bfDB7zh/CuH8jucPrgRolBroWbNmdzNSR+bH
	Mlz2fxNWl5K4ZASlxRnwF5Y/omvF6VNHlAWhuH3jwjpK8t9yT0hKiZMWVAr19lwk3tJVWPMphnD8g
	MmO9pH+zgWw9AzmtzoIN/hiG3M+U/y52GNRO+AbCil5IFSGP25L8JIOz6nyj4pr4Z1PlAjLaZlqwr
	pMsd3tCcVRC7dLAODzaaaNbi2IEwR+yknhUVtTznhQCygVKgIxXq3CXtJ7jRfjtvPJbK4NUSr2C4l
	Y9rV14UjX0nkwaPUd6sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGejy-00860L-D0; Sun, 06 Feb 2022 10:25:54 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGeju-0085zj-NX
 for ath10k@lists.infradead.org; Sun, 06 Feb 2022 10:25:52 +0000
Received: by mail-io1-xd2b.google.com with SMTP id n17so13171021iod.4
 for <ath10k@lists.infradead.org>; Sun, 06 Feb 2022 02:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yzZm6IWn9SbxjJLqFyjUiXhf5hqI8VOiovfMTemjpIU=;
 b=mjVDt6Vb9J1V2Xfdtj1UdIq9+L5xXxcbPNgyN/nrJmqERozgeNeElejBvxyjhQrJNV
 UtFN9s903YSfG+7Cq4x/gR7mjel0WlFuQuCmYr7QPahc/nwVaJJuCb2jK4Wnk7Q+CGSP
 rNJtuWf1C3BjFpXH98qFhSofOYJJ/0mYk7eLq8P0pYWoA9Rdxf6Mkn2OyvzIyS+bUFI9
 4BSWnhMXegvxDK/GIbIFEswQUuGYDePhttWZCCIjs3jTuWtW8ZWxzdzzSG7m1/BE6WSo
 q/YQdwC4g/X37hPDHPMwSXK2q9ghv16pKa8T/M/5quC847flJJ4Ox9OT/fXsvm3BsIBq
 ZBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yzZm6IWn9SbxjJLqFyjUiXhf5hqI8VOiovfMTemjpIU=;
 b=rZ3/zNu30JT6wraWbcbGfZGoocP/PrBIUlrdTZxI7dtBbqz7uapnhiQJ+9pN79VEiE
 7Cg1z65bjDCVee2YSi23EWRSSSPoWdIyPot/sGKW1G5jlpog0XEOvwjnZ6NFQsHwLlyb
 dkjW8VcTtHtraNm6q0q0o5jJLsMAZvvyzH2BvWq/CQEJT5TASfKRRDicucTkPGtC+1iZ
 4nFGsu/dkrVu23LpyZCnkTyMIvaVkY9OI6bbgf1QtnL6I5kcSldKhakoycpUEt+s7c3U
 RmxZAd0Jzvnx7ToT0On2NNaEidy57SvjDeRejMh5R8ph0QSh8C0iJ/4jAzym4ZXY0aaD
 V6SA==
X-Gm-Message-State: AOAM5317S5MnkGyEKiJj1oToF8RaShTyT959p2jYfCTQ34wqdEACUBjh
 kz4FNiAak76H+BT0LNBrKAfLuFkddcs6A8RsFl0=
X-Google-Smtp-Source: ABdhPJxvRWV70WNO7IothVav8+FlR0ubzpJzHnzmxQvAn9oWLGx1qVMY67B7PZYreZk0KK77QqUqlhqgdPLhvhJOEeI=
X-Received: by 2002:a02:c90a:: with SMTP id t10mr3523841jao.142.1644143149291; 
 Sun, 06 Feb 2022 02:25:49 -0800 (PST)
MIME-Version: 1.0
References: <20220201130900.GD22458@kili>
In-Reply-To: <20220201130900.GD22458@kili>
From: Francesco Magliocca <franciman12@gmail.com>
Date: Sun, 6 Feb 2022 11:25:56 +0100
Message-ID: <CAH4F6usWj5_a9m4g+v1xxNDGwhiCmkCqphBY9VNsmfwX+NvUyg@mail.gmail.com>
Subject: Re: [bug report] ath10k: abstract htt_rx_desc structure
To: Dan Carpenter <dan.carpenter@oracle.com>, Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_022550_818698_C9D4F699 
X-CRM114-Status: GOOD (  13.25  )
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

Hello Dan Carpenter,
auch, nice catch, thank you very much.
Yes, your solution is correct,
even if I think that we  could avoid skipping the first part of the
rx_desc altogether,
because it is just a trace.

Kalle, will you amend my commit or do I need to file a new patch?

Best regards,
Francesco Magliocca


Il giorno mar 1 feb 2022 alle ore 14:09 Dan Carpenter
<dan.carpenter@oracle.com> ha scritto:
>
> Hello Francesco Magliocca,
>
> The patch 6bae9de622d3: "ath10k: abstract htt_rx_desc structure" from
> Jan 12, 2022, leads to the following Smatch static checker warning:
>
>         drivers/net/wireless/ath/ath10k/htt_rx.c:432 ath10k_htt_rx_amsdu_pop()
>         warn: potential pointer math issue ('rx_desc' is a 32 bit pointer)
>
> drivers/net/wireless/ath/ath10k/htt_rx.c
>     346 static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
>     347                                    struct sk_buff_head *amsdu)
>     348 {
>     349         struct ath10k *ar = htt->ar;
>     350         struct ath10k_hw_params *hw = &ar->hw_params;
>     351         int msdu_len, msdu_chaining = 0;
>     352         struct sk_buff *msdu;
>     353         struct htt_rx_desc *rx_desc;
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>     354         struct rx_attention *rx_desc_attention;
>     355         struct rx_frag_info_common *rx_desc_frag_info_common;
>     356         struct rx_msdu_start_common *rx_desc_msdu_start_common;
>     357         struct rx_msdu_end_common *rx_desc_msdu_end_common;
>     358
>
> [ snip ]
>
>     427
>     428                 last_msdu = __le32_to_cpu(rx_desc_msdu_end_common->info0) &
>     429                                 RX_MSDU_END_INFO0_LAST_MSDU;
>     430
>     431                 /* FIXME: why are we skipping the first part of the rx_desc? */
> --> 432                 trace_ath10k_htt_rx_desc(ar, rx_desc + sizeof(u32),
>                                                      ^^^^^^^^^^^^^^^^^^^^^
> This is a pointer math bug.  It's possible that it should be:
>
>         trace_ath10k_htt_rx_desc(ar, (u8 *)rx_desc + sizeof(u32),
>
> But as your FIXME notes, it's hard to tell what's going on here...
>
>
>     433                                          hw->rx_desc_ops->rx_desc_size - sizeof(u32));
>     434
>     435                 if (last_msdu)
>     436                         break;
>     437         }
>
> regards,
> dan carpenter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
