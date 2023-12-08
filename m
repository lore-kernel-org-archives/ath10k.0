Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2307C10DC3
	for <ath10k@archiver.kernel.org>; Fri,  8 Dec 2023 02:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrS1+gj4SQqrLBMUECtVXORlr6dGcnhoysWJjVqwxW0=; b=Bm342/N+THyfUiyvNaV7zdsj60
	CKZhYztGDqlnO0OFStpbV1wBj/eLsYyS9jfVr56tLjH3pF0zo9EGr3/mvmKMFgKryOO+whzOc4m7Q
	WflwK5f+tKWjJAk3zQDx1ahYruiDSfqY4i3gvZZFdiX++82ORAWW8maFyKkfGFhjCNN+7XS0Ds/eL
	F4dK28sksGsN0O/CVWer0JKtN8pkKZC2K2Npt1LQT86IP4/+NswPOr8Fwe4/UQgYSEVoI9YQ/x21B
	vrIOgj4wRQWVkT6h8q/bn7b1s0N366DisjAWsEfnJAcLF2NRdirXTlg/iuVfMDBR3P5MkuEBuZBG1
	QGDhtM3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBQKc-00EWQT-1F;
	Fri, 08 Dec 2023 02:11:10 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBQKZ-00EWPj-2C
	for ath10k@lists.infradead.org;
	Fri, 08 Dec 2023 02:11:09 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-db632fef2dcso1758887276.1
        for <ath10k@lists.infradead.org>; Thu, 07 Dec 2023 18:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702001464; x=1702606264; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrS1+gj4SQqrLBMUECtVXORlr6dGcnhoysWJjVqwxW0=;
        b=YVsYWMedd2aL3zjccClVlRB1udYBzpFW8aLjfcHJYHU4H4c5YDB7gsBzqDlMGesDYK
         Eht2qAqr3g0VKJ5pNDhldRObRSEal9ouF3o3316JwcPqii9BDyM7s6PES1cLBExN1Awj
         VYD5BjOaT78KOrGl9GXpTepH7TbG0Pj3DBpFGkEb2jhnP9o7fHHGAHH52TS/ghHklitx
         DXbijmxEOAg/LhFZ5lLdfnzFwSxuZ3j5lpQEfKVeGQt5i0gEkMyc7LAgppbcfb94zIKO
         B2RVSBMrT4b2vVPahihb2m891aa6b46URXXmaF3kAl3TK6Bqy3g7xV6CNZqOOadL5NdY
         m6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702001464; x=1702606264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrS1+gj4SQqrLBMUECtVXORlr6dGcnhoysWJjVqwxW0=;
        b=PTAjD3qiB+PN8hdoTIIcI/z8VQXbn9DcAsOFryxRIFSs7UlYvwOCF3XfC05kNAJ7l9
         rFDX6I+Ap7eo9z/m1NhBsrMQ4/ujnkDwZj2mqtP/g5wayfi9juyY1GZMAqa8gf5H8vmr
         I0MuPKjSRIlTrfti9aZ0ygtxlEKm0lkCZax8McFGivB9gWS9+m9BnPi23MWg0KlmkSlP
         E5ZgsvrTEt/O4Wg0+KWl0kzw0hvRLwSF1stOaMzu4T06J/bNyTIY9/KvVBzyxetg4zDm
         Crk/YkQTMFgtPFpK2krw+TU09sJ/rMgH3TLnwFQRTGCn8yyfCSnFBS78iZ9Wt2kZXXh3
         GwRw==
X-Gm-Message-State: AOJu0Yx1IWq8htcJX2pZ1cvMjxfTWmbedQC0+WPENuYJTTl1JtPnRYY0
	FM8/L5OK4aU8NAmR3SwDYbcnehnJiNmDGd2H1RsLSg==
X-Google-Smtp-Source: AGHT+IFzB/fvfpt3l9KUjfBQeyBhYz5PrQ3cvYlMjYHNiikQIZ+vKmYh5c3DKdUmzSxnO8b96mhu8iTGOuCgu0Nogu4=
X-Received: by 2002:a25:d415:0:b0:db7:dacf:59f1 with SMTP id
 m21-20020a25d415000000b00db7dacf59f1mr3933594ybf.101.1702001464147; Thu, 07
 Dec 2023 18:11:04 -0800 (PST)
MIME-Version: 1.0
References: <20230630151842.1.If764ede23c4e09a43a842771c2ddf99608f25f8e@changeid>
 <CAMSo37XcwAn9znSQ8202LUTdBKLDz94QJ9i43aXya5LHs-4GiQ@mail.gmail.com>
 <87wmtqnk3y.fsf@kernel.org> <CAD=FV=VHHCsjJmVWDXN4g3U=-_SLWc2iWqbAdZPOykn+QMQojw@mail.gmail.com>
In-Reply-To: <CAD=FV=VHHCsjJmVWDXN4g3U=-_SLWc2iWqbAdZPOykn+QMQojw@mail.gmail.com>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Fri, 8 Dec 2023 10:10:52 +0800
Message-ID: <CAMSo37UfQmpTb3_+URbGTbX77mTJNn4SC0aaVD5KXasMsW7Jow@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Don't touch the CE interrupt registers after
 power up
To: Doug Anderson <dianders@chromium.org>
Cc: Kalle Valo <kvalo@kernel.org>, ath10k@lists.infradead.org, 
	Abhishek Kumar <kuabhs@chromium.org>, Youghandhar Chintala <quic_youghand@quicinc.com>, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	John Stultz <jstultz@google.com>, Viktor Martensson <vmartensson@google.com>, 
	Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_181107_759370_82939DAF 
X-CRM114-Status: GOOD (  33.36  )
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

On Fri, 8 Dec 2023 at 00:49, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Dec 7, 2023 at 6:49=E2=80=AFAM Kalle Valo <kvalo@kernel.org> wrot=
e:
> >
> > > Recently during our Android build test on the Dragonboard 845c board,
> > > with the Android Common Kernel android11-5.4-lts and android12-5.4-lt=
s branches,
> > >
> > > we found there are some ufshcd related changes printed,
> > > and the serial console gets stuck, no response for input,
> > > and the Android boot is stuck at the animation window.
> > >
> > > The problem is reported here
> > >     https://issuetracker.google.com/issues/314366682
> > > You could check there for more log details.
> > >
> > > And with some bisection, I found it's related to this commit,
> > > when I revert this commit, the problem is gone.
> > >
> > > So replied here, not sure if you have any idea about it,
> > > or any suggestions on what we should do next to resolve the problem?
> >
> > FWIW we don't support Android kernels, only kernel.org releases.
>
> Right. If the problem also reproduces on mainline Linux then that
> would be interesting to know. I think db845c is at least somewhat well
> supported by mainline so it should be possible to test it there.

I checked with the ACK android-mainline branch, which is based on the
mainline Linux,
this commit is there, but the problem is not seen.

> If I had to guess, I'd think that probably the CE interrupts are
> firing nonstop for you and not getting handled. Then those constant
> interrupts are (presumably) causing the UFS controller to timeout. If
> this is true, the question is: why? Maybe you could use ftrace to
> confirm this by adding some traces to
> ath10k_snoc_per_engine_handler()? There's a way to get ftrace buffers
> dumped on panic (or, if you use kdb, it has a command for it).

Thanks for the suggestions, I will check internally on how to debug that.

> If this reproduces on mainline and it's not obvious how to fix this, I
> don't object to a revert. As per the description of the original
> patch, the problem being fixed was fairly rare and I didn't have a way
> to reproduce it. The fix seemed safe to me and we've been using it on
> Chromebooks based on sc7180, but if it had to get reverted it wouldn't
> be the end of the world.
>
> -Doug



--=20
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android

