Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0963AC433F5
	for <ath10k@archiver.kernel.org>; Mon, 25 Apr 2022 23:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6geu5NHaOhwjD09pNinB1WtM52D0odsKJEEjNURfsI=; b=dwYVeQvnQMOGQ0
	nxQ/U5chTIENighCNVNGKLk3qmS1lojMzeaEnH9qekqdNcF9OE8CC4WcgTrls2u5Qk102eWFGQeq2
	9kJQcLPs21opOkJETpz0gW4m1gQicgtB6EsViYImzQoduX3X6U0GEms4pc+m6y++NI2NezRxVVlVh
	DcqeEZbCP+foyi4IUBR3bKR25q8gRUvLMhUgAiVjb5XA5h+esRmCxPyAFO8qGxqKDTHeLqIBjKXCv
	EZnnfJtrIhXea3CbFaIyK46ffSU+EMdBc6V6CU3py1ozYtSxrUhECov/v64kRNnsff4TosksOnwTn
	/YeN58vEKN0snJGinpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj7tM-00Bi3g-Fs; Mon, 25 Apr 2022 23:13:16 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj7tK-00Bi2B-EK
 for ath10k@lists.infradead.org; Mon, 25 Apr 2022 23:13:15 +0000
Received: by mail-pl1-x634.google.com with SMTP id n18so28603152plg.5
 for <ath10k@lists.infradead.org>; Mon, 25 Apr 2022 16:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2DJhIYTqXYplW9lP9uJQwqXKSCnTlNmW0Zo9c3Kv29k=;
 b=epgKtVTNynOyu/7OZFsmHnChXekgv57ciJlvl0aIbH/M+t0fuW4gnBFAv2SPOU/7oI
 lOwY1o5RP7sRPX4OvCPP47Jw2e6kzACR8pgMEW7Ia8M6D+UwuFy1P4WGdE9aXyy69FpB
 l5hLGufQ0xogXf1k0QakrqnU+LccdI2/aOYQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2DJhIYTqXYplW9lP9uJQwqXKSCnTlNmW0Zo9c3Kv29k=;
 b=zpybiKk+XwTXc9R6Z05P3KbG6GUgl92EQbrL27qtOgfHgPHz0CrvNyUMB4Y9QWDdFX
 QY0gGDGUaB2NEYU2Tcas4C2QgBS5oE7D1fwjPgZN9/iFQdOSCUg5hoJTDb0hKCo1kNkf
 5gy7JrZ2oMQjxhBdJUEz+MnuJEjhMo6c6nIkF7sSnOitPV63hCCnCtuLgOp1f59IVqwh
 0pT185fdHsEv+Czzhr7SirCw0rYlsNbY1/9eVzNybIjEwInJW83KCgTqxBIN2/aaK3Vf
 VTn++ZO6X/eLrq++kmcr0VllVt97nHqSCadiVtPJlETQ6/iyW7f1FUgQjgkm1vUfjm2x
 Ednw==
X-Gm-Message-State: AOAM533c4bEVFtoyVGjf8OeZZgcuHhwt8JegnkD/pDV8+f/i48Rk+Hep
 a2nb5aCdE2JdFQpzD3YugH/YUQ==
X-Google-Smtp-Source: ABdhPJx1ULMWttNhMQ0Qvlkb27kuiPfgh7vujfY1m6axCjNVRaz5FzsGwvA+45wmAAUpUKZG8wN4Dw==
X-Received: by 2002:a17:902:b906:b0:14f:76a0:ad48 with SMTP id
 bf6-20020a170902b90600b0014f76a0ad48mr20675811plb.79.1650928391477; 
 Mon, 25 Apr 2022 16:13:11 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:84c6:2d6d:c16:1a1b])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a17090abd9000b001d2edf4b513sm347375pjr.56.2022.04.25.16.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 16:13:10 -0700 (PDT)
Date: Mon, 25 Apr 2022 16:13:08 -0700
From: Brian Norris <briannorris@chromium.org>
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: kvalo@kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 netdev@vger.kernel.org, Wen Gong <quic_wgong@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH] ath10k: skip ath10k_halt during suspend for driver state
 RESTARTING
Message-ID: <YmcrBFZ0CB/7abzW@google.com>
References: <20220425021442.1.I650b809482e1af8d0156ed88b5dc2677a0711d46@changeid>
 <YmcqsFyCMqcWAEMM@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YmcqsFyCMqcWAEMM@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_161314_535830_6C0CA5AD 
X-CRM114-Status: GOOD (  15.91  )
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

On Mon, Apr 25, 2022 at 04:11:44PM -0700, Brian Norris wrote:
> On Mon, Apr 25, 2022 at 02:15:20AM +0000, Abhishek Kumar wrote:
> > --- a/drivers/net/wireless/ath/ath10k/mac.c
> > +++ b/drivers/net/wireless/ath/ath10k/mac.c
> > @@ -5345,8 +5345,22 @@ static void ath10k_stop(struct ieee80211_hw *hw)
...
> > +			/* If the current driver state is RESTARTING but not yet
> > +			 * fully RESTARTED because of incoming suspend event,
> > +			 * then ath11k_halt is already called via
> 
> s/ath11k/ath10k/
> 
> I know ath11k is the hot new thing, but this is ath10k ;)
> 
> > +			 * ath10k_core_restart and should not be called here.
> 
> s/ath10k/ath11k/

Oh boy, I got *that* backwards! Should be this, obviously:

s/ath11k/ath10k/

> > +			 */
> > +			if (ar->state != ATH10K_STATE_RESTARTING)
> > +				ath10k_halt(ar);
> > +			else
> > +				/* Suspending here, because when in RESTARTING
> > +				 * state, ath11k_core_stop skips
> 
> s/ath10k/ath11k/

Same.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
