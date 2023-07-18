Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE32CEB64DA
	for <ath10k@archiver.kernel.org>; Wed, 19 Jul 2023 06:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wug471Z47dzF4FGDbcWKMq5/HOsjBUUK6+5pny+byiU=; b=TfgKNelc5ln0zm
	TRKl97BeWl/36A+oxJ0gIZQGXQrWoXu/12FBPg+9YroqlGxHiMvlMzDk8/1tEYGDuZHbrkOqDbXMD
	kPS7ElQuGQgLA2WSkcoRWATYiGrjUQ5rfjjn8YBTk1JkDpwu/X/ADy2luCa3+eLkNpEEcR+l37It6
	4wGeZBhpyIit50LS3liTkD1g4ICuSbHnYKAz02Jt1J1FR1UVV1Sfqra3gY4LZS54uBuReQCtp0H+A
	C+xHS0wHfSe9o08RdXAzecHXCnYt+fbP0Gmvp5SeSPnKPgjvjvgphVavUHJ5jdPpmTHQtV5Wf14nu
	fyYx4ksu6K0+TZXYEHtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0he-005kp0-0j;
	Wed, 19 Jul 2023 06:30:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0hc-005kny-0u
	for ath10k@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z0vyMeOfw7fSC/qxKnZBBj+xlz8lL8pZMksMNnnuzCg=; b=AZTD5wSbQygkz8XcJEu3l7RYcv
	hUvZjOwCxjxJ51akFSMi1ECkLFT84uUyFiolVu6mTL5QOI8OvMGRo7x/o9DCIMfzttCz4F5dxPv6X
	TSLTRDz/5gV3xAwCelT6O7rt/e5GcOSxaMpfrOob9wkGOA0uyZmcQvSgk7E/xeKTYjbbDS+6Uefal
	YbACpMGS/bxR9xLXCFSXGyGqPW50zVkEl48BVYF+S8Rhbp0oHprIOAQuj6k8TdRSa/RRRIJ+EDMtw
	GUKkXYBeDikuYPGWCijZ0+m8vYKWzQgfsRFvZLe0bbiR5rdVIiplfxkgR9dpr0qvKvNf3MVmrGT4K
	874WD2KA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLgzI-00BMJI-0t
	for ath10k@lists.infradead.org;
	Tue, 18 Jul 2023 09:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689672437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0vyMeOfw7fSC/qxKnZBBj+xlz8lL8pZMksMNnnuzCg=;
	b=Q2+7fGF0YkjJPjxBfiXUIFkyFK5IRcBIC8/xhlL+kpaCbfiCSxwWapD7JXhNS7srOtvUqS
	idSrC9/xzjOeMZ/M8q6XgyTv9hMgFnvyY/sllrd8LeFgIm4k5nuBQ93iP4SiKvPFB6UUz+
	ZN478OsyWDXLgMv7hDKdnoKQ5HpMCPE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689672438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0vyMeOfw7fSC/qxKnZBBj+xlz8lL8pZMksMNnnuzCg=;
	b=K7TqF0DNUlcG9za22J4Zz7DRxNCZQ3nix1UAh2gErwSgekXMLIhPvNGwNCQqqTFyNMdwhy
	etWVYGfmGf6QJaOGaHpOHCzwxkezWulucN8FEtJUtDoprmEn3RA4SZglG0Xt8+fe/Ddwi5
	FG/j3EbMWqoPAJ0KlAKvKiRo6VXdn0A=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-O_2CdXTGPtq_XEwSN_F3Uw-1; Tue, 18 Jul 2023 05:27:16 -0400
X-MC-Unique: O_2CdXTGPtq_XEwSN_F3Uw-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-635eb5b04e1so13842246d6.1
        for <ath10k@lists.infradead.org>; Tue, 18 Jul 2023 02:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689672436; x=1690277236;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z0vyMeOfw7fSC/qxKnZBBj+xlz8lL8pZMksMNnnuzCg=;
        b=HmZtP2tRqScyavmhHFkkzaRa94OKyrvHyYLL12NCnaQb+gRcjO0JrXYw4pwnwsglT9
         Xo9NhgqiBJZGcM8Qpn5kXMzu7w9cXCwjBs5NEytRcck9aRT/dLjsWIdB7q4TzZJZqyFX
         cD/8QIWqoTyeL8o03r+YWDcFWbh+rrbannOaSKKJmrHUGA2zOLIlqBbpis4i4yXVJw9U
         YSHY2pYIPLMxSwPA4L5Pj5B2HrFTlEtVmY3fpRkaarP/EOjSxkWVSQggm5RxL0s7u/oW
         eayEfQNrIbRBDqbn3QQCZerhmI9SXQJzbj8U5UUkWikGfRcuQyvV1n1ronLcvoEKrC6W
         AMrw==
X-Gm-Message-State: ABy/qLbRlLplkVLKE/zOOfvxDVWpvIn0YYnknu93X/7Co6erx4bfA/nx
	JNwzciIdcxgu5HLdiUrcSHrjGb8N58kki0Gl2mGrgHJSMrpWbA9c7nzQVpuIX4mOVsDR4OmilS+
	6MA1kGpOtstu6wNZQtHVM+Q==
X-Received: by 2002:a05:6214:509d:b0:63c:7427:e7e9 with SMTP id kk29-20020a056214509d00b0063c7427e7e9mr12261356qvb.6.1689672436184;
        Tue, 18 Jul 2023 02:27:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFYFNw7x3jThmvZICEe6iXFu0qG+zQql7vEpRKMvc0qVPxJUK7o8zW+ji84Z85dUEkIw+qD2g==
X-Received: by 2002:a05:6214:509d:b0:63c:7427:e7e9 with SMTP id kk29-20020a056214509d00b0063c7427e7e9mr12261327qvb.6.1689672435965;
        Tue, 18 Jul 2023 02:27:15 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-226-170.dyn.eolo.it. [146.241.226.170])
        by smtp.gmail.com with ESMTPSA id h10-20020a0cf20a000000b00635fc10afd6sm592785qvk.70.2023.07.18.02.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 02:27:15 -0700 (PDT)
Message-ID: <ee31215ededd386eba19fb62b0de8d0bad78d687.camel@redhat.com>
Subject: Re: [PATCH] net: Explicitly include correct DT includes
From: Paolo Abeni <pabeni@redhat.com>
To: Alex Elder <elder@ieee.org>, Rob Herring <robh@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Alex Elder <elder@kernel.org>
Cc: devicetree@vger.kernel.org, linux-can@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-amlogic@lists.infradead.org, linux-oxnas@groups.io, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-wpan@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 wcn36xx@lists.infradead.org
Date: Tue, 18 Jul 2023 11:27:10 +0200
In-Reply-To: <1c6175fc-496a-843c-c8c5-2173e065eaa8@ieee.org>
References: <20230714174809.4060885-1-robh@kernel.org>
	 <1c6175fc-496a-843c-c8c5-2173e065eaa8@ieee.org>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_102720_497447_3CC8E9C1 
X-CRM114-Status: GOOD (  14.30  )
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

Hi,

On Sat, 2023-07-15 at 10:11 -0500, Alex Elder wrote:
> On 7/14/23 12:48 PM, Rob Herring wrote:
> > The DT of_device.h and of_platform.h date back to the separate
> > of_platform_bus_type before it as merged into the regular platform bus.
> > As part of that merge prepping Arm DT support 13 years ago, they
> > "temporarily" include each other. They also include platform_device.h
> > and of.h. As a result, there's a pretty much random mix of those include
> > files used throughout the tree. In order to detangle these headers and
> > replace the implicit includes with struct declarations, users need to
> > explicitly include the correct includes.
> > 
> > Signed-off-by: Rob Herring <robh@kernel.org>
> 
> (I significantly reduced the addressee list to permit the message
> to be sent.)
> 
> For "drivers/net/ipa/ipa_main.c":
> 
> Acked-by: Alex Elder <elder@linaro.org>

The patch does not apply cleanly to net-next. Rob, could you please re-
spin it? While at that, have you considered splitting it in a few
smaller patches (e.g. can, dsa, freescale, ibm, marvel, mediatek,
stmmicro,  sun, ti, xilinx, wireless, remaining)?

Thanks!

Paolo


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
