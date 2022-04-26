Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918A0C433EF
	for <ath10k@archiver.kernel.org>; Tue, 26 Apr 2022 06:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrIRunfB2vWf5JyzAvOPenGzgYxhZXFtoE1ZKOxk/po=; b=PW4qZ129tjUJZ2
	27NvMThIQctWfektPMaCxQargMkbt1fYa0UrqL1pfArc/JgFjEZ/6omh/0Mt3X4TzkgTx5nSFW+97
	UG1TmdlC/8FOr6yb6q+myG6xzRQuGUlbgshnywDDkhLTmpny3Z8tg0M/OXuoa0vbKkkyp3+3wVkiw
	cZP0Y/sepQIWtx/7VgbxcV9EdLxB73FJnRDlCR8D9aIopgvLZEQdUPdFayXAMnHQ8vv/LSoY/NNdB
	Da5DA9VeJHNqK+GJD/ndTQecooe1+BgPjb+geJ3KSUgQQKstJVlwi32ilMgjj6Gai/eMZp318ErkQ
	0s9ZZ23+W/V+sZ3eItuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njEuY-00Cmb2-So; Tue, 26 Apr 2022 06:42:58 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njEuV-00CmXg-82
 for ath10k@lists.infradead.org; Tue, 26 Apr 2022 06:42:56 +0000
Received: by mail-il1-x130.google.com with SMTP id z12so1712165ilp.8
 for <ath10k@lists.infradead.org>; Mon, 25 Apr 2022 23:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KZXWw+mQ5SzKYx4pfHPUdeVXw0Lw7Zqv4OHZg6/bECE=;
 b=OKJwseg1BeqVGbbzLWqwmGv8I2ybhlAXs0ZZiquP8s51TudFvCYmyB/NFxUejLaeFQ
 8YURQdOA78Loxv1i/wvBL8VaG+Sub/jxhqrSmKlyLsKQKgMupTsdUNHzVYeRVj81Ggg8
 1T3lKGQ0zuv/y700/wT44FGJuCuomHnhlUHA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KZXWw+mQ5SzKYx4pfHPUdeVXw0Lw7Zqv4OHZg6/bECE=;
 b=tqYree3ZIW4cr3wGMlbGLvNhSguHQ1U9II+B/8cpeqvSongoOv1VmCFfUUKFrXoJeX
 hZFRKWu0/YVxA2SQg+gGd7ZA77EWH6MLi+DbhQwqUnAb98n7gp+rTzr0FTnjHi2cdxKj
 17hEC6jmjcyLT1lOiIYE+04k3ZVBeK3VWHKBZLjM6DVWKlxVe3f2nvV9Yyh2FkE4W5Am
 0Keu9JMTxPeEqlI1KamoOy/OntZw58UTbqI49/9rSpxjaDa08aW5wQ7UQBxYlPHzV4KP
 JWymVr0ykS0x6pBqjXCcYFkgSoX2fZUacnr+qTmGfrcTPNac3w6yKFILO1AvG0NBz2Tc
 YQ0A==
X-Gm-Message-State: AOAM531ggJZQ4mwGB2eNRZRyIn+P8HcFfNvzaTeom8xtvPPDXiyQWdPY
 txjwC661dP8ireYqd0AWv8hPTgAgeiYEBE4LL3ou1Q==
X-Google-Smtp-Source: ABdhPJxH9n+PwfsCKTqGm/BpdLMkKverpXfcsHBbklasMzhpv4vrvXWAKTyAnSm2FEo0e4Wj/1yceplZhDz1BC7+DfU=
X-Received: by 2002:a05:6e02:1c04:b0:2cc:183f:b8cc with SMTP id
 l4-20020a056e021c0400b002cc183fb8ccmr8436041ilh.51.1650955371082; Mon, 25 Apr
 2022 23:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220425021442.1.I650b809482e1af8d0156ed88b5dc2677a0711d46@changeid>
 <YmcqsFyCMqcWAEMM@google.com> <YmcrBFZ0CB/7abzW@google.com>
In-Reply-To: <YmcrBFZ0CB/7abzW@google.com>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Mon, 25 Apr 2022 23:42:39 -0700
Message-ID: <CACTWRwtXsAyudCvNJ1Cuo+Ow3tYN_uaes7QNWzOzHhTjOKzxVA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: skip ath10k_halt during suspend for driver state
 RESTARTING
To: Brian Norris <briannorris@chromium.org>
Cc: kvalo@kernel.org, linux-kernel@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 netdev@vger.kernel.org, Wen Gong <quic_wgong@quicinc.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_234255_363380_981D3D20 
X-CRM114-Status: GOOD (  18.01  )
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

On Mon, Apr 25, 2022 at 4:13 PM Brian Norris <briannorris@chromium.org> wrote:
>
> On Mon, Apr 25, 2022 at 04:11:44PM -0700, Brian Norris wrote:
> > On Mon, Apr 25, 2022 at 02:15:20AM +0000, Abhishek Kumar wrote:
> > > --- a/drivers/net/wireless/ath/ath10k/mac.c
> > > +++ b/drivers/net/wireless/ath/ath10k/mac.c
> > > @@ -5345,8 +5345,22 @@ static void ath10k_stop(struct ieee80211_hw *hw)
> ...
> > > +                   /* If the current driver state is RESTARTING but not yet
> > > +                    * fully RESTARTED because of incoming suspend event,
> > > +                    * then ath11k_halt is already called via
> >
> > s/ath11k/ath10k/
> >
> > I know ath11k is the hot new thing, but this is ath10k ;)
> >
> > > +                    * ath10k_core_restart and should not be called here.
> >
> > s/ath10k/ath11k/
>
> Oh boy, I got *that* backwards! Should be this, obviously:
>
> s/ath11k/ath10k/
>
> > > +                    */
> > > +                   if (ar->state != ATH10K_STATE_RESTARTING)
> > > +                           ath10k_halt(ar);
> > > +                   else
> > > +                           /* Suspending here, because when in RESTARTING
> > > +                            * state, ath11k_core_stop skips
> >
> > s/ath10k/ath11k/
>
> Same.
Oh!, lately working on ath11k mostly and the muscle memory kicked in
... sorry about this, will fix in next revision. Kale whenever you get
time, let me know if the logic looks good to you and if ath11k/ath10k
typo fix is the only comment.

Thanks
Abhishek
>
> Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
