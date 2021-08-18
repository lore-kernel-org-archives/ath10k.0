Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B490AC432BE
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 20:58:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 756466102A
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 20:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 756466102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OFsa/jn3Nwz2YZ7ez8co9j+4haSEgnwmnxUSwSYwDYk=; b=kY80DWlhA7+dtU
	yBr0PqgO8mZwLPtcJDccYyGcDhlJfljfwT0/cDzY7jxzLr2euovnz2+yIWNGKL945F6QdP0rAN+02
	S0Jh+/KLOkpHD8oKzkMBkeppVutspX839LbBqw3bu4aVYb/Onn05rlshvY2jTEhwMxT9mb7wtJzCV
	pOm63zCEhLaGgIQPV5OiqNCr3YaIXIRWT6eiTAG9HLwLS3FUr6TOW6b2tmjAhAFKvz4yWPhOdO1cf
	TELpDQMBBNbAyUB0Ho3wbC7eJ3DJwdV8GCGJos5cFKPJnAo5TW9R/RpXNyKLSOY7hLObaHGb0/rnI
	yyoqeCZ6wA0ueBVZrtXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGSe3-006fLy-66; Wed, 18 Aug 2021 20:58:43 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGSe0-006fLW-GO
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 20:58:41 +0000
Received: by mail-lf1-x135.google.com with SMTP id z2so7549023lft.1
 for <ath10k@lists.infradead.org>; Wed, 18 Aug 2021 13:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3jJTY5RurtelSMfApfTPulu82aXjdVlqtKpskloZbHk=;
 b=AKqgZUaq97Yoy52AsC1xrmksvvgnRXN6lRBktw0TKuJVw6fGAaawLwp7iMr9t+XZct
 U0MGdA+roLw/J/kmo8gMgmFQC0WqUcGCeMGFu6smOOJu9X1tQlw5nZGYG1lT79iIZ+Cx
 ebpkwGJcLVX1ZnJuLTc7UWljkN1yRvQVxpdQzXu7Efg5XCKbGqkU/2YIm32eljuZN0GW
 oDpHLvz9QwJjSu3l8919b3hbhfLQlgapDVkUWGA7Oc3h7ET/XG87r+aOXhyMnkmMGZm2
 KKr7jmE3NG/6a/8+iiytMWGAzbzpO+6t9ZlgpSU+pWhheZKVkE+Z2KjB9DGfczJbhKvO
 FByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3jJTY5RurtelSMfApfTPulu82aXjdVlqtKpskloZbHk=;
 b=aQgsuub9glfbhVEzQCDzFNN3+SWVLoWr3OY1pa1gXvq76vZoGkRWd+0j05Oxv4m7sF
 yDoF4aim1vt/JbuYEaVVB1392EaWwYc59voctjnWHS6rEZZF12OmMpNj66CpGkKHpFSu
 JUXRsiZbZbYuWrNr3ktDBAswWJrwIjuPshbpJPNLfa0/SgI7tSvDPCYqlYFU1g5ewOTe
 74cTiXh5+8X3IaqPFIGCpbTjbdoW2mZvtJpgqzl543uTJEGrb+xIsR9l3KGioQ6LBlXV
 IUH6dWwhn9PYbwwU3jU35MWb6V5+2YB9bOmemrX0WE8HbDrzw0xLbYPFa5L9XZjhTZBE
 ixqQ==
X-Gm-Message-State: AOAM532/r4F3d3KxBBf5FNmJqbdmXKjj/Jf48176KSWblNImQzR2HlBw
 K+Lf00ActxYPGqoJ6+ZVlOnLbhp4H5PNSPnKcFM=
X-Google-Smtp-Source: ABdhPJw9EbFfs6R+Cg3EX4J2J+gzDbYWl7CvmAajlIy7XoKhalcW6E8qm6r8lqRWTPZYJd8pCJCnaMC43umjzmsASBY=
X-Received: by 2002:ac2:4143:: with SMTP id c3mr5149201lfi.295.1629320318930; 
 Wed, 18 Aug 2021 13:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210818150943.1630199-1-festevam@denx.de>
 <17b5a29d098.279b.9696ff82abe5fb6502268bdc3b0467d4@gmail.com>
In-Reply-To: <17b5a29d098.279b.9696ff82abe5fb6502268bdc3b0467d4@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Aug 2021 17:58:27 -0300
Message-ID: <CAOMZO5BjAp3eJtOgifDDvAa-EB--SbvtYFMD=ha8VokipVp3tA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Do not call dma_alloc_coherent() for SDIO and USB
To: Arend van Spriel <aspriel@gmail.com>
Cc: Fabio Estevam <festevam@denx.de>, Kalle Valo <kvalo@codeaurora.org>,
 ath10k@lists.infradead.org, 
 linux-wireless <linux-wireless@vger.kernel.org>, Christoph Hellwig <hch@lst.de>,
 erik.stromdahl@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_135840_605329_00EE1292 
X-CRM114-Status: UNSURE (   7.74  )
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

Hi Arend,

On Wed, Aug 18, 2021 at 1:51 PM Arend van Spriel <aspriel@gmail.com> wrote:

> Does this mean you can not really setup a beaconing interface type for SDIO
> and USB?

As per the debug message below:

ath10k_dbg(ar, ATH10K_DBG_MAC, "mac vdev create %d (add interface)
type %d subtype %d bcnmode %s\n",
   arvif->vdev_id, arvif->vdev_type, arvif->vdev_subtype,
   arvif->beacon_buf ? "single-buf" : "per-skb");

If arvif->beacon_buf is NULL then it will be a "per-skb" beacon mode.

Thanks

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
