Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA306C4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 14:49:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E4C3610D2
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 14:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E4C3610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fb8cfTL6brDNmWKCs1rJyctZSeAM+F1C5F1wCc0XmHQ=; b=JWyiVt9xkv1rTc
	Z9POxv0o4OmtUZueHu2Uv9CKzcBfjIFQ7bFwFzQVtJFxbSkLFlio5tDhtOw5RnUULcmdxj1rG0w8e
	n6o2HH6hUsCLAGmT3mmlY+lDlAx6/Q32b59qplqtyfJqE3TV6LO3HYKEvKhMxpMXKdE+zUCOoHCkY
	W3J1bwDh0sdbzHR1Hybq1LLgYVynY/L3mmIxeLHWbSPzi8e6+LcXFYfvMzMBzHhWRfW8YBPcf3+z9
	InGhA9qjCOY1sJo8aY9YxDOmX2tGpZJKOIV6ZTVTVXgBKGRw07GjtM8Koz4Zw91E6jTc0ddqVHFdP
	2RZKBS5bpownHa+Kihew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGMrP-005wGo-Cn; Wed, 18 Aug 2021 14:48:07 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGMrJ-005wEY-Sc
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 14:48:05 +0000
Received: by mail-lj1-x234.google.com with SMTP id i28so5587465ljm.7
 for <ath10k@lists.infradead.org>; Wed, 18 Aug 2021 07:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UmaovXnVmqDv/oCMxYwI2AhRfxNkF+Bsj0AIpnN1uFk=;
 b=VbZdcyCzaNRgw0tc2ZUkvURsPLxhWIdO1MPVCGRVlGJ/msXf5Zgx/QeZJ887VMmkoX
 aSWs7SevCyUa7jYW37NMWgsmNihbu1vHwu/u9yQ8ZAKQqaTkD0VTXHk9DZUmNDaGoYKf
 vU/3eAz4otbOmyssZIzzwk/A4ym8sBxHzpxMrk0pN/O/ZaV0tzI6maVrM5QiVMAYNJlc
 zIVDI/ijP5S10jwwB/TGf/5Y6smbfr6QnOVB9eOIoZwzqyndPJxxoIwsEdPDFrFSPeko
 dNBNvLgNCOZBBvuIaew69ppGk7hOxJSR0LsBrkzFeCJqDkt8X89kdrFVRQovSU5JEf49
 dtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UmaovXnVmqDv/oCMxYwI2AhRfxNkF+Bsj0AIpnN1uFk=;
 b=MQMN5ZC6YonfL5fL9NPbXMRU6WSSEjQjaUVgmdPvZGj+wmTn+Icn1jFTwIBu09/NMn
 OWmyOav+pP9EItJx2gW2xKB7X68mfk9WilK5mqfzxPPbe7FsLnaLGIq2WuCx20HS0cvN
 4jTqWrm8GUfObM/3v4VExLLco3o66bCr6eN5Wn5SeduRtZrMG42Y1AkJmYF5cUxBLdJY
 j/SX/rn0w13kAUgVe29lxDmpnXMbjHdUJ+DooxXczJ3h24EpBHlAdI6LSpFg+6m3doMW
 Kcj5dxqTS0iCfeRl0ciqAHadXardVAnVp1zwx+7x250gs5fJCv+JztXFq0V24AA3WfkZ
 G6MQ==
X-Gm-Message-State: AOAM532EtwcmXJfXFR+dxGz16sVTC/Q0AXU7oKiZXFMkn6IcN4AOnsJN
 Sappi6G67ZdnjKUbNH0yB5C3R0dZ6z2cjOB3hdU=
X-Google-Smtp-Source: ABdhPJx/0jpBYqy7evFhHoUnrLr+UPBej7dLhblD8ydJOQWmdzPTrVYqMM8In3Ljpl6oNzehDH3S8Ue58YRyF0pTVCM=
X-Received: by 2002:a2e:9881:: with SMTP id b1mr8234118ljj.53.1629298080481;
 Wed, 18 Aug 2021 07:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DEAMMKHwDkXxqWxg6uj_GQjBUQ5jV+4AzxAr2DCrgTVg@mail.gmail.com>
 <20210818051128.GA8550@lst.de>
 <CAOMZO5APotsBKPkN6tFDNnK0C7w7pzJ8zTWKUx6P=Rhd9_81mQ@mail.gmail.com>
 <20210818132800.GA6269@lst.de>
 <CAOMZO5AhZ04cJ8R5Twr+qff8jR2iO5qWufxLPnF7Qhi2=etcoA@mail.gmail.com>
In-Reply-To: <CAOMZO5AhZ04cJ8R5Twr+qff8jR2iO5qWufxLPnF7Qhi2=etcoA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Aug 2021 11:47:49 -0300
Message-ID: <CAOMZO5A=DgmGgqTWDfXdgoPgoH2XO68FS73RvwwK=3dgUAZyUg@mail.gmail.com>
Subject: Re: imx7: dev->coherent_dma_mask NULL warning
To: Christoph Hellwig <hch@lst.de>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, Bough Chen <haibo.chen@nxp.com>, 
 linux-mmc <linux-mmc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_074801_977148_1FF61AAE 
X-CRM114-Status: GOOD (  15.66  )
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

On Wed, Aug 18, 2021 at 10:37 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Christoph,
>
> On Wed, Aug 18, 2021 at 10:28 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Wed, Aug 18, 2021 at 06:31:19AM -0300, Fabio Estevam wrote:
> > > Correct, on i.MX7 the ath10k Wifi chip connects via SDIO.
> > >
> > > Is there a way to avoid the WARN_ON_ONCE(!dev->coherent_dma_mask)
> > > to happen in this case?
> >
> > The way to avoid it is by stoppind to use dma_alloc_attrs/coherent
> > on a device that is not DMA capable.
>
> Understood, thanks.
>
> Maybe something like this (untested)?
> https://pastebin.com/xTZqtRqD

Tested it on the board and this seems to work fine. I will submit a
proper patch.

Thanks

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
