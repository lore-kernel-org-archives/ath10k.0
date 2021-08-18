Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89CDC4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 20:44:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80721610F7
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 20:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80721610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpJ7dOQc/lTpCVQmvnn06HOHJ/LXh4aL2FjE5mNU3Qs=; b=H6zZ6g1vnPyfhh
	SPFtYNzEth1YpZu2r6RWAxnu9d2sYabCbAV9gFecykj8dv0Xoa3DmR0qtm77kvbSoWBwoyj6gG4nY
	VVRcb6YceHQLN+fXlgESGsb7RGLZR51duO0wCHQ8SLgJ7yaA151B+cpQRbnYE3nptkkBVq+NrkiJs
	W3+RmRGeYH4MaQyLGjZcbj/Wltvvxjp7s/Ki6QYNGRK39zpGPI/+bVVXJKLqtv5xg4Li4c6wpRAg9
	f/RQm/8OcKbhtCsBfsGXF4RpzbJ8PsFCgl+lbKwoj+jftKNPWMvMB77bUXwS28ofpow/hXvH844vB
	muO03Tp1NIE3+EtCK+Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGSPy-006doE-8E; Wed, 18 Aug 2021 20:44:10 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGSPu-006dnW-MD
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 20:44:07 +0000
Received: by mail-lf1-x135.google.com with SMTP id r9so7432645lfn.3
 for <ath10k@lists.infradead.org>; Wed, 18 Aug 2021 13:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ReRbCCu0NU8RaS/JlVj2xJ16jur0TR6FOgfUXy9kMT8=;
 b=kHgHFIrN/AkFQjVOnO4YPNKDmkaGspaNUBCMzY0msP8ztHtG6lO1QOmF0BWTuW/DDd
 rCsJ7uzdbEWQvvfchSR9Iyqkz6ChERVfC2kM+iIUM0tKGAbllVb5gy4GFlqpSRmx3WlM
 CmaVPJ/xAUYPG/lHcVFFjdFynEvzKT/3XDNk64VIdw/Mmis2OVvDzbYTjD4kHBgP8USF
 ygH1DOw3CRci8FUZPqxgdlW/gHn5GBzsIQF1yTrNKr5kp6GuEWuPMjMtIuszrWFs955V
 LyVWV2i5enncbyXqyZiJhqBc59lNZqv5PiRrJxwyJqKNg6R0CrqT9bKloaYW0dHbPkrT
 KqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ReRbCCu0NU8RaS/JlVj2xJ16jur0TR6FOgfUXy9kMT8=;
 b=UmLXSWvD2N6p0CqE2u62d6wJWiJV7R/FmjQAXi4xIqzvvpBUl8rQik1x9IAjTOUgaV
 +CkXFRSU1/GtcDKaJB3qb+CM66lYRUMILqsA6TWtfzkUR0LcaVFd0BXCn/JO9uK4ozkQ
 +/iFD2YDPl3d+t8eDhBs5DK0nDr8odP+MU6uOaxz0q3N9D4r+q3fFEc+JGm2GQv51SoD
 Ll+wHXPct+AMjWz/uL2NEbsbQFU8Gb0fhtrsCVxo7fg2a0DQQkNFprAL8MIRbJeyJOkG
 3WCcUbx2jcAPCKYHAdywU3iCEDaZMtthdO0CvkKIk1LLCRYeKjl3rh3CO7MmPA8NoCat
 L1YA==
X-Gm-Message-State: AOAM532rzfCErsbcjcjUQ3Gk05wEiwTxGSufPcX7idTABRwVxUW6epcp
 2czs3ic1obnsbfIfqt0V4VrRK78Uk4P0ANXSNDY=
X-Google-Smtp-Source: ABdhPJxvKi2zQU2opUFjrNrd9PiSQytgodqEWYK7C9DiGchwcwp1emNustuYq+DrpER9P34sni153g+POCphaBCki3E=
X-Received: by 2002:a05:6512:401a:: with SMTP id
 br26mr3380230lfb.539.1629319444959; 
 Wed, 18 Aug 2021 13:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210818150943.1630199-1-festevam@denx.de>
 <17b5a29d098.279b.9696ff82abe5fb6502268bdc3b0467d4@gmail.com>
 <369c1f89-df33-455b-773e-a2e0dbf582ff@eero.com>
In-Reply-To: <369c1f89-df33-455b-773e-a2e0dbf582ff@eero.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Aug 2021 17:43:53 -0300
Message-ID: <CAOMZO5DbZ11HE4un20tBkLbjGWcyUu8KpTV+gEtVf=rT2JyT+A@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Do not call dma_alloc_coherent() for SDIO and USB
To: Peter Oh <peter.oh@eero.com>
Cc: Arend van Spriel <aspriel@gmail.com>, Fabio Estevam <festevam@denx.de>, 
 Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org, 
 linux-wireless <linux-wireless@vger.kernel.org>, Christoph Hellwig <hch@lst.de>,
 erik.stromdahl@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_134406_795112_4D877048 
X-CRM114-Status: GOOD (  10.52  )
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

Hi Peter,

On Wed, Aug 18, 2021 at 2:35 PM Peter Oh <peter.oh@eero.com> wrote:
>
>
> >> Fix the problem by not calling dma_alloc_coherent() when the device
> >> is not DMA capable, such as SDIO and USB.
> >>
> ath10k calls dma_alloc_coherent multiple places including
> ath10k_htt_rx_alloc.
>
> Do SDIO and USB not use such data path function at all?

Good point! Maybe I am not just hitting these paths on my simple tests.

Kalle,

How should we handle this?

Thanks

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
