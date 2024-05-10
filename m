Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B63EC25B10
	for <ath10k@archiver.kernel.org>; Fri, 10 May 2024 14:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUshYNDgznxLpJcEyG0DD70zqbgXQycZfQ4megorFuE=; b=C7uepEyoZXl3oVau74V60mFCRj
	cSLmm9i05XW47jFiAZQXwQbhply9MJy2zcStEDv96Bf/M0jrXY+/GNPeCsnn0dHcQ2Hnlr8bWwS7/
	7BAMDucIqryOO/IbzcKTUWOYsJiVGMoiifKk4jcyslJe37QUUEgOFaYRXlqBBftaGlqbfD++CMJdN
	DlX1em7PndNZOvh79hM/No4oLgHyhW8u0t4Q6jPTpE9/49LD/DBNZomN1YT9KEvUSHl92YZ30L7LS
	oSWT/kmnoALbunZajcQWQ0WAGU/rccuD1nqgeKc+fh9MKkS4zR0OVBWypXPrEREYqzJiFno9MIRPu
	sO4F0PHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5QwX-00000005VBV-3kk2;
	Fri, 10 May 2024 14:09:49 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5QwU-00000005V8s-36H8
	for ath10k@lists.infradead.org;
	Fri, 10 May 2024 14:09:48 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-51ab4ee9df8so2181028e87.1
        for <ath10k@lists.infradead.org>; Fri, 10 May 2024 07:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715350182; x=1715954982; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IUshYNDgznxLpJcEyG0DD70zqbgXQycZfQ4megorFuE=;
        b=nAucVx96SOVPoYxoy8TDbgBAKjSTTfMu2ltU01g8J/xOl6MNI7FfZwo50M8mN5F35F
         01L7MM/f80ZNVgYgRpxl5gD4+iaH6V+iiNSiZHNY3yif+tPI82fFkPNnibx1gCIccFY7
         CVibqqUjHQMPxPo1LZDdvbHSqS+77CUt+XLb+g7VzK2atd1xjww7J9SYV/Qc+8MQcWC4
         Oh5og/jIYZ1HrvqlKRCvB/XuV78AF/9Z8CFf7irux38FsCQdrXpv/hQV990beJd031rt
         X/TqRPZgKfM9kL44/uD1i0RuL54Et1hmyo4loJIqoQP9f780DoZ/mGYHjcaMkc07iBy4
         sgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715350182; x=1715954982;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUshYNDgznxLpJcEyG0DD70zqbgXQycZfQ4megorFuE=;
        b=N4COnD8JhVDQxqNSUYiXgTmAd090B5B3ty2m3qSBPCJDaxI4rZckDG2jJRkEs6JtKW
         I3tJAD+tEucGbyev1ooHvQ6CoV2jIiWSxfZNXtk0VtjCy1xca9L2tBaJDdAqfXA9nCzC
         pjcZhrDXktGPrkwOgB79QqRFYkcocNz+2Z2oSjvmYGf9g4I+0oNINy6bYfW0liQAFFBC
         nzMjSlP9eJL8jfrlSnpvQ3pOMd+1Ce8fRQVUl2JiWGShu0o1RW/lIXQgL0Ay0nARQpOr
         iZCekxRhY2M3e50prRJ7E8bzaaFtJRx5nBI9e5+aWpwvC/o9uaF3sDQWhedw+fKrLJRU
         F/dA==
X-Forwarded-Encrypted: i=1; AJvYcCWg2vFQh3W/x1ehSz7SJYCDw/XDxT2HetYb4RHKQOKF7UU2+bQtS44pQKy89/1hCw311WNgJlNIu1Mp2Rwk+/WkcEXTbocb+oL1fA==
X-Gm-Message-State: AOJu0YyJA2UCXIUPUH/IYCmPhuz41qbNE2ov3gXzrgwpVbrLEDWRBLW8
	lXMO+6VImAZmexERKcZQGyAW5oLt9Z7rD6eQgPHYyFL2g6ovkXup
X-Google-Smtp-Source: AGHT+IHPnFwxBKyNEbIQhl0xygTuNDfAL4ZLXFsiihw6QPJeyV0T7tJdRJWji7wQMeLS9PIpNkPVWg==
X-Received: by 2002:a05:6512:104b:b0:521:f000:5d1a with SMTP id 2adb3069b0e04-5221006cd2dmr2006606e87.59.1715350181498;
        Fri, 10 May 2024 07:09:41 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce2449sm66291035e9.16.2024.05.10.07.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 07:09:40 -0700 (PDT)
Message-ID: <663e2aa4.050a0220.a4c56.1c5a@mx.google.com>
X-Google-Original-Message-ID: <Zj4qoTIXSWlkVStH@Ansuel-XPS.>
Date: Fri, 10 May 2024 16:09:37 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	Sebastian Gottschall <s.gottschall@dd-wrt.com>,
	Steve deRosier <derosier@cal-sierra.com>,
	Stefan Lippers-Hollmann <s.l-h@gmx.de>
Subject: Re: [PATCH v14] ath10k: add LED and GPIO controlling support for
 various chipsets
References: <20230611080505.17393-1-ansuelsmth@gmail.com>
 <878rcjbaqs.fsf@kernel.org>
 <648cdebb.5d0a0220.be7f8.a096@mx.google.com>
 <648ded2a.df0a0220.b78de.4603@mx.google.com>
 <CA+_ehUzzVq_sVTgVCM+r=oLp=GNn-6nJRBG=bndJjrRDhCodaw@mail.gmail.com>
 <87v83nlhb3.fsf@kernel.org>
 <663c9fc7.050a0220.5fb3a.4e87@mx.google.com>
 <87a5kxlqrn.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5kxlqrn.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_070946_962929_78C6BDBE 
X-CRM114-Status: GOOD (  17.58  )
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

On Fri, May 10, 2024 at 04:50:52PM +0300, Kalle Valo wrote:
> Christian Marangi <ansuelsmth@gmail.com> writes:
> 
> >> 
> >> Sorry for the delay but finally I looked at this again. I decided to
> >> just remove the fixme and otherwise it looks good for me. Please check
> >> my changes:
> >> 
> >> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=688130a66ed49f20ca0ce02c3987f6a474f7c93a
> >>
> >
> > All ok for me, Just I notice the ATH10K_LEDS is not exposed anymore? Is
> > that intended?
> 
> Yes. It follows the same idea as other wireless drivers do, for example iwlwifi:
> 
> config IWLWIFI_LEDS
> 	bool
> 	depends on LEDS_CLASS=y || LEDS_CLASS=MAC80211
> 	depends on IWLMVM || IWLDVM
> 	select LEDS_TRIGGERS
> 	select MAC80211_LEDS
> 	default y
> 
> So what this patch now does:
> 
> config ATH10K_LEDS
> 	bool
> 	depends on ATH10K
> 	depends on LEDS_CLASS=y || LEDS_CLASS=MAC80211
> 	default y
> 
> The idea being that if LEDS_CLASS is enabled then ATH10K_LEDS is
> automatically enabled. But please let us know if something is wrong
> here.
>

Sure, was just asking some clarification about it. Not a problem for me
since we are using other pattern to handle this.

-- 
	Ansuel

