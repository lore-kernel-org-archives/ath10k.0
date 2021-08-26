Return-Path: <SRS0=L2np=NR=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08681C432BE
	for <ath10k@archiver.kernel.org>; Thu, 26 Aug 2021 12:02:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C42DC61058
	for <ath10k@archiver.kernel.org>; Thu, 26 Aug 2021 12:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C42DC61058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pouLYmklrdf68fy3G8YZ6mAJbgt724mSgQxRuNMDCRw=; b=LgeffxRal9qPbw
	gIhTCo0nN1MmE++8BbRprP17RuV+2RN2C43aTd8eg0Dpni5atw3xIulxwF80v5WvMcipSkeC0bf0R
	jTU/QuWkglpjGGzgjkboITM9X5vZOsRGy152XgvbY6MD+6vtjEQL8Nf2z7t7QTyFRA/IsPkeq2MP5
	YNMyV0iBpcAH1U/F2ZraZAs+JZhom/U1FK4vu1S8z1oqpGmS0D0KmfFhTiEMtHP8Z3NzTr1lU4rA8
	uB7UeBg41Nk/U5CJ498HuQy9kOgAvvL4d1O+k3oWLEVnPA/vXQOeQw44D+lqdp3i5EnVf3j+1DGqz
	FJo9nucUinLHQ9W57JAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJE4n-00A0h9-HR; Thu, 26 Aug 2021 12:01:45 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJE4l-00A0gJ-2Q
 for ath10k@lists.infradead.org; Thu, 26 Aug 2021 12:01:44 +0000
Received: by mail-lf1-x133.google.com with SMTP id i9so6253853lfg.10
 for <ath10k@lists.infradead.org>; Thu, 26 Aug 2021 05:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RxiV7ERqDs1q2vy53IAICS71yjit7QHURfhHYR5Qkmc=;
 b=kYcF+L37cZeqiUKaYvw7RXwE+AkjBgz4yVfL180iQEVlrVP/d4WUwsD9R1MPeknA5w
 haQVebhjKt+6J7NiL//7M4BnN0mAlheDZAYQ88qjZ0Gj8QhNLdA0pzqQs8yRp/8FTE6x
 h7WulZhGu4bJjHi5y2GgmCMEu4c3TlqvwydMpqAI4qpTE6V+cTybcclb8TcfQSR30g3I
 ggrKAon83LPO+UA3xAF5b0KKb2vE5c2S5/rM/WHP8SRX+jOBdNtJabJWPO6z0l4hauKl
 mCW4JXuVzYVyCkeEufBXA95OymbYuZjSZgwgD3+q+JEc9fh0nBtHP4HenXS5w/I0TTXB
 Bz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RxiV7ERqDs1q2vy53IAICS71yjit7QHURfhHYR5Qkmc=;
 b=AcxldIww4EaPPuLA9i37yxsu1fuc9MUF88QRoRyyqTSvuBlp0Oah/rhcgl3qzaG5PR
 JPii5zde6QMWkcjel91/u6I1TvgRM4PCXGOCFxud9G7G/FCwQRqpDm/U2hMmmCqbyL0e
 ed+DqM2VJcbvARTGQeMCA/ga3hLUiWge6knYPprasVWck92jino9h/uUgY5U1jmvYnA4
 MaOLdp28ge2wCpszI0A/YnuV0bPxCfjmupWyKYDL1RgRbCFkKOEHtRW08q8798e1ZLrr
 DLqKgGZOGV7CwcuAygm0nuW2uWyhtEMR3AB06QLHhmcASB7i46nNUQjdnWbn74sk/gUn
 KKEA==
X-Gm-Message-State: AOAM530gqz4XMIPajf8Q+QcZb25dTgrd8h/bp86vqN+5E0pH5zOjvG/x
 OEUNB2cmID8k/wHT8fpjoHMpvgeaQyJ25VzVDRwoe3RY
X-Google-Smtp-Source: ABdhPJydRTHpuS5wvu11saeoFPugthubxBfE787bIrwBOiaTLZekqZIj1aXPsHJRo+6/Ud0+fBGxZeV3iJ1dW44MG3g=
X-Received: by 2002:a19:701a:: with SMTP id h26mr2379051lfc.443.1629979298649; 
 Thu, 26 Aug 2021 05:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210818232627.2040121-1-festevam@denx.de>
In-Reply-To: <20210818232627.2040121-1-festevam@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Aug 2021 09:01:27 -0300
Message-ID: <CAOMZO5CJC0=iH4zzJGj0e82GexBN7suOehz8ajKK8bK3ZcMOSg@mail.gmail.com>
Subject: Re: [PATCH v3] ath10k: high latency fixes for beacon buffer
To: Fabio Estevam <festevam@denx.de>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org, 
 linux-wireless <linux-wireless@vger.kernel.org>, Christoph Hellwig <hch@lst.de>,
 erik.stromdahl@gmail.com, 
 Peter Oh <peter.oh@eero.com>, Arend van Spriel <aspriel@gmail.com>,
 Marek Vasut <marex@denx.de>, alagusankar@silex-india.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_050143_153374_4CED77A6 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

Hello Kalle,

On Wed, Aug 18, 2021 at 8:27 PM Fabio Estevam <festevam@denx.de> wrote:
>
> From: Alagu Sankar <alagusankar@silex-india.com>
>
> Beacon buffer for high latency devices does not use DMA. other similar
> buffer allocation methods in the driver have already been modified for
> high latency path. Fix the beacon buffer allocation left out in the
> earlier high latency changes.
>
> Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> [fabio: adapt it to use ar->bus_param.dev_type ]
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v2:
> - Pick Alagu's patch:
> https://patchwork.kernel.org/project/ath10k/patch/20190417191503.18814-3-erik.stromdahl@gmail.com/

A gentle ping on this one.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
