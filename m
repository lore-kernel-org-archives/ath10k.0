Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82361C4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 13:38:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4666161058
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 13:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4666161058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQ/YuWAh91znLZd2GNcn29+ael97nCO/UdGQnq+9h94=; b=DLYk2tvTqSF36K
	8aAzZXwvJ47M3SxpFpY980OOiHdPFW3ejmOPZiJTRb8OtyPqotbtw/XHXcGA8j3Mb6SNmzWGcgamV
	M0zvggjbGGSfp3EgMssMgkCuVuqc8V7Egq6Vg6B1dUt36OuH4YzbPui1Ite9Zu+9t+ciCpOHIhLVE
	NAfWdMJm88Ynh6YhkNRO5oMxYtKjJEItfm3pl7+984hQnBLzr8k+kd31sBBYzQiSYOAHIP+ceaDKG
	Phx0fUWQMKk+QKEA3VS91YUA7wjHXFC3YXOJ/sc/BADDK0gURTmm/PdzPhVgHv3uiGE0jsY2Rh7wg
	+Htc06GpARsSEMdl2Z0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGLlV-005j7N-54; Wed, 18 Aug 2021 13:37:57 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGLlQ-005j3F-0r
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 13:37:55 +0000
Received: by mail-lj1-x236.google.com with SMTP id c12so5181653ljr.5
 for <ath10k@lists.infradead.org>; Wed, 18 Aug 2021 06:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2qeLGhEUm2fqgovV3rHdwAwD0qbiDIwzIYXkXiw7KcI=;
 b=LhxiOQshZXAVof4f5rqnjQLm1KQIm5vTmoKpi/0oapO0FdwcTl2MJY9O32zPww5FY4
 z8ZLU4nJghZGEK5540OQa05FGdXHM3oIy/6q+f8HGOZBf72gXKjxf2FNjmJ5/+PNtgBW
 IeNbyQOk9p8gHV/hfTLlPoXS13s++P9YTq2QtSjjrgGFdlCQrjxNp8ELROeAkAmHqhvE
 YgZw7jBTblHAZtqfQ/cPCPGKtN8VFMZlkTVeMouUXx676qrjG6/DgPcV42MaQB+f6MPD
 Xd15laChSDYtS+gjRRc0P7EwQmrmXDR3drsvyknrSbTbXxq+ikKxedq8Khhwn5jCkTz9
 t7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2qeLGhEUm2fqgovV3rHdwAwD0qbiDIwzIYXkXiw7KcI=;
 b=Nk6ld2tqVk7cZ1HikG2+JAhyxUR/7GNA4C8Z4Ba3B15grs1j1MmrFtEF22PVrseMJU
 Wd5CbaiiSrqtJy5juZzZ2bxoTMNIr57HnE46B7hzx2CgmpgLIMted3xKh5EaaAQhUjSw
 Fph8NTVF8v5NpZIM00yZ6u9oiBv8yp4YbRSX0k90Mp6PuYzT4XIxc425QrwLVabJnYqi
 AfeI5BKnlgJTG1vd39lpwr6EaN3iUUS6yYkrQm+03Rj8+d1r4EZ4eZYZR8MRgQNtUq29
 Rg52DybdQJgm6cJwz0nQ5Mi/9MF9xujxtxfoSDmpJDYGz4wtA+fLnFgZaA6Zt8eaB9jD
 G3Yw==
X-Gm-Message-State: AOAM5335vswptgIECfaE0n0WSJlTkiPCcFPO9hZCT8VauNRuWD0Otj/+
 etuQPT/dMpYrZM+zflsLhZpCdLq7hXfnf4AZ4JM=
X-Google-Smtp-Source: ABdhPJwTzY5tBpkyYYpCo95/ARt0AoceuxAfd2DiomIfbbVKrZPxVhvjT0+HD7+hzfBi/eQjS5pnyzy7LmcuJses120=
X-Received: by 2002:a2e:8816:: with SMTP id x22mr7916970ljh.264.1629293869832; 
 Wed, 18 Aug 2021 06:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DEAMMKHwDkXxqWxg6uj_GQjBUQ5jV+4AzxAr2DCrgTVg@mail.gmail.com>
 <20210818051128.GA8550@lst.de>
 <CAOMZO5APotsBKPkN6tFDNnK0C7w7pzJ8zTWKUx6P=Rhd9_81mQ@mail.gmail.com>
 <20210818132800.GA6269@lst.de>
In-Reply-To: <20210818132800.GA6269@lst.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Aug 2021 10:37:38 -0300
Message-ID: <CAOMZO5AhZ04cJ8R5Twr+qff8jR2iO5qWufxLPnF7Qhi2=etcoA@mail.gmail.com>
Subject: Re: imx7: dev->coherent_dma_mask NULL warning
To: Christoph Hellwig <hch@lst.de>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, Bough Chen <haibo.chen@nxp.com>, 
 linux-mmc <linux-mmc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_063752_157877_3E850B93 
X-CRM114-Status: GOOD (  14.18  )
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

Hi Christoph,

On Wed, Aug 18, 2021 at 10:28 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Aug 18, 2021 at 06:31:19AM -0300, Fabio Estevam wrote:
> > Correct, on i.MX7 the ath10k Wifi chip connects via SDIO.
> >
> > Is there a way to avoid the WARN_ON_ONCE(!dev->coherent_dma_mask)
> > to happen in this case?
>
> The way to avoid it is by stoppind to use dma_alloc_attrs/coherent
> on a device that is not DMA capable.

Understood, thanks.

Maybe something like this (untested)?
https://pastebin.com/xTZqtRqD

Kalle,

From an ath10k driver perspective: would you have any suggestions as
to how to stop calling
dma_alloc_coherent() for the SDIO and USB cases?

Thanks

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
