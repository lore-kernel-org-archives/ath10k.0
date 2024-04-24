Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1207CC4345F
	for <ath10k@archiver.kernel.org>; Wed, 24 Apr 2024 13:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jc7SzQ2rFd1yOXtRir0afWZyCYP8A5E33YvodhVoINM=; b=WVKwDMfK438x2M4F1lWjOYnFTs
	dVE6rbc2ZxGCwfrwFqxNS3yxGDLzC2YsydEANW6DNWxhkYp2ca7UsweA09wb6pIFdz6z7jD7N/iUU
	GUkPVM5jvfOmEK+rCqJGpdapFaTLOjGa4DFEppvLLEPV9GuSU93MJNc4zU4FTv9dqfsekPYgZQ1xS
	eytd/6Tr7dH/k2JytveUPsXsin/Ca0t4VPtYmaY4theOOKCPTBLB1UotEZSwZLSrl+HUxifWRb1w7
	GZ330qHt68RF2RnQJrHDnT0eUHYgUDEadL6REgN70GjlF+YaJpavUF4RtsuoHa6CwnMLstqiSqnzN
	L6pljwtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzckm-00000004HLQ-49r6;
	Wed, 24 Apr 2024 13:33:41 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzcki-00000004HHn-3zcF
	for ath10k@lists.infradead.org;
	Wed, 24 Apr 2024 13:33:38 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso7234666276.0
        for <ath10k@lists.infradead.org>; Wed, 24 Apr 2024 06:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713965614; x=1714570414; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jc7SzQ2rFd1yOXtRir0afWZyCYP8A5E33YvodhVoINM=;
        b=FRbd1zClksus0MFDbgzd2hsraiXsmun1/Qbnf1KxUFrEVXNt3uVu9acnCnMH/C/SSE
         9MU2KRodwtRWeTgN5qih4LeBH202Go5Akk26X9hqS5dDKmz9i1cJVfoqDc2KfqAIL5hm
         bX58k50uBIX5v2xKrHeZjYsEmUwth19I6BLuTJbLe96/k1BkYLcFBI6eC/iKrbzacmGV
         xDgX/Jqvv2wTwWyxnPuAKdFUfqW+nKcbXitpsrmG7R2I3Fp3EmVKZE5+qvxmCu4v63MH
         VpVWTjtqz4mtaAtElVkI33Use55hup9p8wLu2uswr3vDwxLd+L00nFBlRQt0PANl8A3z
         kNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713965614; x=1714570414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jc7SzQ2rFd1yOXtRir0afWZyCYP8A5E33YvodhVoINM=;
        b=SZJjKq7KPFkGGd8d46VDsv60AGrGEqzklAQUSqcyN4O5CZpU4QGIcyJ+N0ciAHLF2b
         KYoeBqx6YOX4tmlO1aJvPY+W7XlUcxM7XZzTy6KlS0u8mepoxZvFiovNHJfqZu8gExh3
         1MRay92DV/V9CUbU6oQoYVKYXU0L7Wv7ODDPNVSj4t7DSkMUBjbFSPgS8bsKc+NVuSoZ
         2c9KA6o6eoqAq4OmrLJ70FDqVr5lIw2tPrSixIiPgVqgYk4yylsUWAEjCm1hwKY3t9Fs
         glB4bOs+i73nCJeCfUc8nujSwZkwhFJejH6VfhH6CS5nyiY9VBd4YoC2cmJyhb44i0z8
         IUAw==
X-Forwarded-Encrypted: i=1; AJvYcCUdtCg0ZPrS6ceQHg18KZOLbyF/kdEdoZUHUqvWFX5aZvlz5LhBACQr5cNMf9bvsgeeNrmKMctYUviTzWxCt32pPe/van/nYLb8wA==
X-Gm-Message-State: AOJu0YwNxAEXnjFugGtu/Lt/bhYGmZLdasyZJ8HN8LKX8gRfY8vrtcjh
	TkbBu/yzvxn6r/Ib9wCI7tsOdVg3nKQ10/tqdit5iSVOTR9EnlG2AnDrPW9BmKJADNTOvokLEp1
	2/u0Wr6RVM7QGrFCtBbJh0KWEn+2p0+lPsMr0d9JnIJgkci7M
X-Google-Smtp-Source: AGHT+IE8QrCc26Q5VHRiKgg2cj7tbF2iPJOAPFAsbXJakKBSPK+XP9cjRfoklyulE62TV9SW0c2EGNVo4hQ8l8eP4sM=
X-Received: by 2002:a05:6902:110e:b0:dca:c369:fac2 with SMTP id
 o14-20020a056902110e00b00dcac369fac2mr3013394ybu.3.1713965614110; Wed, 24 Apr
 2024 06:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
 <CAA8EJprsjs8SWZmpTisyQcAZ9VC8g3_GEEc1hhp8bMZrm-hyaw@mail.gmail.com> <875xww3tv8.fsf@kernel.org>
In-Reply-To: <875xww3tv8.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 16:33:22 +0300
Message-ID: <CAA8EJpp32a9G19TnaO_-JtO3TAwi6VkwPq0mJkfxj2Gmw=xsYg@mail.gmail.com>
Subject: Re: [PATCH 0/3] wifi: ath10k: fix board file loading for wcn3990 devices
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Yongqin Liu <yongqin.liu@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_063337_125885_2DA7A3BD 
X-CRM114-Status: GOOD (  18.96  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Fri, 5 Apr 2024 at 14:57, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On Tue, 30 Jan 2024 at 08:47, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >
> >>
> >> The ath10k driver fails to properly handle fallback from board-2.bin to
> >> board.bin for WCN3990 cards. This happens because the
> >> ath10k_hw_params_list doesn't include .fw.board* parameters for the
> >> WCN3990 platform.
> >>
> >> Add board data configuration for WCN3990. While we are at it, merge
> >> common pieces of BDF support: drop .board and .eboard names from struct
> >> ath10k_hw_params_fw and use the common name instead.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >> Dmitry Baryshkov (3):
> >>       wifi: ath10k: populate board data for WCN3990
> >>       wifi: ath10k: drop chip-specific board data file name
> >>       wifi: ath10k: drop fw.eboard file name
> >>
> >>  drivers/net/wireless/ath/ath10k/core.c      | 32 ++++-------------------------
> >>  drivers/net/wireless/ath/ath10k/hw.h        | 14 ++-----------
> >>  drivers/net/wireless/ath/ath10k/pci.c       | 10 ++++-----
> >>  drivers/net/wireless/ath/ath10k/targaddrs.h |  3 +++
> >>  4 files changed, 14 insertions(+), 45 deletions(-)
> >> ---
> >> base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
> >> change-id: 20240129-wcn3990-board-fw-a2d97507a712
> >
> > Kalle, Jeff, is there anything pending on me on this series?
>
> This is in my queue (Deferred state):
>
> https://patchwork.kernel.org/project/linux-wireless/list/?series=821157&state=*&order=date
>
> Unfortunately there is not really much time for ath10k nowadays so there
> will be delays.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

Please excuse me, can we get at least patch 1? It fixes an actual
issue with WCN3990 which prevents us from testing board data files (or
adding new boards) without fixing board-2.bin first. The driver
ignores board.bin even if it is present on rootfs.

-- 
With best wishes
Dmitry

