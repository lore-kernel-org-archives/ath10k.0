Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897A1C433F5
	for <ath10k@archiver.kernel.org>; Fri, 11 Feb 2022 14:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBGxuljYTwETmKnaoYGIo16dFxcSLld2aZUsiKy/6b4=; b=cwRw9eN+v8fzcQ
	l22rvEaBu74WoS0y5e3Rspl8hEd3gda9KotDjYToTvFMx6o93ir2gd6sPB2NWAd+3I6fBVEYxABJc
	BdATu8Tpe7Qa568iH3RUXOZ53rTFFMm618q5592isme8jd41xckzEfPtcXdcxEQQArdXsQMVb3Fs1
	nC1n7XCclhoU857Mg5yM2vjrNJKYLz7ZoEDil7ZeuNTuaWRuG9pepAYlSjj7dIKrpDcJJMI2y42qv
	PBwapZ8W3CaXJBcQ8xHpSaIzcXuwM0pD1Vj76SkaOrfgCJXhpkOUzpEIGM2/rf41tNOgTsxtajUJ/
	4s6lmfMfi7z6MZ6mLmLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIXHF-007fJf-GH; Fri, 11 Feb 2022 14:52:01 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIXHB-007fIx-9i
 for ath10k@lists.infradead.org; Fri, 11 Feb 2022 14:52:00 +0000
Received: by mail-qt1-x82e.google.com with SMTP id j12so9239429qtr.2
 for <ath10k@lists.infradead.org>; Fri, 11 Feb 2022 06:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GPTwWoDOMTrU+QTJPAlyKHtjJCNOmrps0ng1LX59i5U=;
 b=IUd3EwjB68VAPxaCG0nVB+gJQyBiP7IChMwc6uwvx2BvIcHyiTxcjirpzYPVp7P3YT
 JZjR9RcpZzV5srJsPVKFJCJewk1p2IOb+5bj66koiSoHUofmEhg5U53LLRIf0a9bEDpu
 Fp2F4AA+iye4EwhpKHqsCU+wH/GdzANUYZu+iQiDhaj4UPYr2FM/sTuQoKZ9NX0VcwWc
 DfvMyOHD1/pZ+LiggfVf77bPFkjyJuFvuA09dQwC6cUavQe3gQlaf81FoVT7b/LrOLmT
 cp9XC+Mdw0P3Bn+Gqgo9EBuOr54Oke4mh5VczIrkuE2IZ8RtrynlvoraQww0MOlsRsC9
 pEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GPTwWoDOMTrU+QTJPAlyKHtjJCNOmrps0ng1LX59i5U=;
 b=jmcRIShxZCGR1ayAFvqs/LzyTSngAvf6tGNyxmPh1/aAGI8ps61gIjAAcuizWkaOHz
 vypUsmmFQ9jV5D1YC+wjzWgimBXBqOyP1HJYNbIAJ2qtdQU+4rDfA0KCVeL1luJ8oXKD
 UHHj3zJF7dw4eyc5sdc6e/KaM0SFTU7wUrfKQa5SV+5fHvAvbzk0fDQHo5h6sjb2ZlHy
 uffTFRYcKK3o7MqflqkMplFv+fSAo0ko3swX3DHHVQg0GPgE+xdta1OH0G/1S5nZ5u3E
 i9YgfkHx4MSdYjV5JcPPB1G5pylp3crLNpGrWwol/lterKxACfiEdhKmnkgb/0BRDnsp
 aJGA==
X-Gm-Message-State: AOAM5311K2mbqcFoOE3jnOsX7K86MUTfM9rwxLecgA4vMeDqGyq5UDO0
 +JzTzrZ7mLeBxtE8+zR+cXXAFpso/fZSpTcdL9iLvkeHzDQ=
X-Google-Smtp-Source: ABdhPJzcnKkoeGjsbaADSbJySlkS4yRc2uf8u0+gNO3iiJoSTMgpgYqlH6y0wqKQkZvGc/UI47XAEOKj8AhLHmHmyb8=
X-Received: by 2002:a05:622a:88:: with SMTP id
 o8mr1334494qtw.116.1644591115122; 
 Fri, 11 Feb 2022 06:51:55 -0800 (PST)
MIME-Version: 1.0
References: <CAKBt_AeMSV8Z98bZh3saK8G61e9m8JNXZrLmNT2oJsvAHJNTZg@mail.gmail.com>
 <e2adadf1ff5d26eddd657c3b5e6f5d547bd0270a.camel@freebox.fr>
In-Reply-To: <e2adadf1ff5d26eddd657c3b5e6f5d547bd0270a.camel@freebox.fr>
From: Guilherme Weidle <guileweidle@gmail.com>
Date: Fri, 11 Feb 2022 11:51:44 -0300
Message-ID: <CAKBt_AdkDqj+wocWM3CSNA7Fh1DRYEHz-vJCGQpR6woY2WAH7w@mail.gmail.com>
Subject: Re: push-pull stalls (QCA 9888)
To: mbizon@freebox.fr
Cc: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_065157_373222_DAD2D21F 
X-CRM114-Status: GOOD (  16.34  )
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

On Thu, Feb 10, 2022 at 4:48 PM Maxime Bizon <mbizon@freebox.fr> wrote:
>
>
> On Tue, 2022-02-08 at 16:31 -0300, Guilherme Weidle wrote:
>
> Hello,
>
> >
> > Does anyone also came across this issue or have any idea how to solve
> > it?
> >
>
> I do and noticed the exact same thing with the push-pull switch, but I
> did not have a clean way to reproduce like you have.
>
> Can you please try to revert this:
>
> "mac80211: Switch to a virtual time-based airtime scheduler"
>
> and tell me if it fixes your problem ?
>
> --
> Maxime
>
>
>
The kernel I'm using here (v4.4.60) does not have this patch. I
believe this issue has been around for a long time now and is still
there...

--
Guilherme Weidle

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
