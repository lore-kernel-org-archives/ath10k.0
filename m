Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E07C6FA8F
	for <ath10k@archiver.kernel.org>; Thu, 24 Aug 2023 11:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADXOftkz7e+jK6ZqkAIEz13i+4jvgdYZ2g3HGmJr1UE=; b=rS54PfD8ob6k8w
	Hz/VFqvGf+gz8DCb3Sw0GELhAzkNbmGpDOt+GUDZJ3F24SPWmi+B/qll/K18znVsajKI25e8Kmc7i
	sxYF5/654PkvwQp1HIEUVzjPkhj2z04RqYk/ha3fPl2/dnbhj1JTvHJrZXF0poZ6UOKhe0AJblRog
	fxGGGrf9PtpYKHAIREZE8HlSnDewzJiXOfCFRBIC5giltFNrI3wGS9TFRO6aghp8UyvGEDVvtkrUX
	lpniPrFoMWIFYFNdzyEGw57fQOkhYL25Dh7O3odehntoz+xsy0i89Xt45nssEiXX2BcrokJ9PVmmq
	JTwsk3kPqbKG4/Mdqqbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ8k7-002zoP-2g;
	Thu, 24 Aug 2023 11:43:15 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ8k5-002znj-0M
	for ath10k@lists.infradead.org;
	Thu, 24 Aug 2023 11:43:14 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d77a4e30e97so2140033276.2
        for <ath10k@lists.infradead.org>; Thu, 24 Aug 2023 04:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692877390; x=1693482190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kDa317b/S5ni7PHJsPutQh8uxkD8M4beLbuLcLXbo6U=;
        b=yulo+qTHWz1tH2zLDVugsHtlGqZuFzqPxOpI6SFqjlQHgglUmJ9dakdZ/upezIeIdc
         xrXfD6avfihrs3k0ZRVirXPdZTE8iXFtBlCZRU5n46hXFMvnww36ic6hfJdpBwLF1iVR
         psc7lJd0FMWD1m21p4w7PrGksBQhhJCR25g8/vc0BMT6DfmLfzIOOdf0MJ6j8nsNxktQ
         jFEgh+cc8GAgAbDB2oo9zTaat/7aJYPq5VqClcAueJOSyBvhsxWctkDB+zF6aIXvkEn0
         abLw3C4nxyOgXgg/1yvVUSKh1usTl5nTxwVXytjOTxRhQUY4kj0oT3B9bp9IcBFNvc9s
         EFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692877390; x=1693482190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDa317b/S5ni7PHJsPutQh8uxkD8M4beLbuLcLXbo6U=;
        b=KYb9N7Gyg2KslDW24Wwf7+FsZ7aFZDEt/jasrSFbCP7H9O5gxSoDTtOaH0QBfXvhWH
         23nnSuv5KtZ2s0Z7LIKItHklkp2c6u12KHB6zhWsY70PM799OmDdA3PDY+aXXKkOHJXs
         2AQL8X915xqg7vlvHyBOx226Zng2Pg+NIj+vuVCxG5QKQwGc+Gp3cbBc1XTjvKH2BLD2
         M1NlD/y+UDquQM1nvVOXXWX4zH5uE+cLwL28bKglT0tJqXYj1GxTJp3W9Ywsc5l7Ki68
         XFWyuM0PCsvpcH5xoH4U3AY+J3dBOp+mgnqn9vCBz9b0JSzPfpCuhS8x/Qkj/ZXiuYGN
         blAw==
X-Gm-Message-State: AOJu0YxRVOW2h2Es1x9E5smuo6iuHBA0UCFj+NRAWS9geb69ijqvelPD
	7lIAWV/rlUFB4lSP5Rf2kCdIPLvibN0dUWmedBepRw==
X-Google-Smtp-Source: AGHT+IH5es0saTEdNqwQ4iMQ1t+ZcIvec2Q2Ka0Jj4l57Jssi2mXkY1VNgk8/B9iwiqd4WRBW7DoTYxUMsWC21Xid5k=
X-Received: by 2002:a25:240f:0:b0:d53:f88a:dc09 with SMTP id
 k15-20020a25240f000000b00d53f88adc09mr14917161ybk.2.1692877389946; Thu, 24
 Aug 2023 04:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <22075892-6518-ba53-8021-9500d22e5722@linaro.org>
 <8990bf1c-32c8-e582-7aa1-d207eba7d7d6@linaro.org> <87cz05wxfm.fsf@kernel.org>
 <f0ef6af9-b648-cc64-0165-eb135f0de578@linaro.org> <87il9xv1dw.fsf@kernel.org>
In-Reply-To: <87il9xv1dw.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 24 Aug 2023 14:42:58 +0300
Message-ID: <CAA8EJpqGR+J-Sa_H18dYWFg3+pHvns=C474V6jSnd3WeTyY97Q@mail.gmail.com>
Subject: Re: wcn3990 firmware
To: Kalle Valo <kvalo@kernel.org>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Vinod Koul <vkoul@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_044313_179502_F51ABBC0 
X-CRM114-Status: GOOD (  26.77  )
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

On Wed, 2 Aug 2023 at 19:45, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On 02/08/2023 13:28, Kalle Valo wrote:
> >
> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> >>
> >>> On 24/07/2023 22:38, Dmitry Baryshkov wrote:
> >>>> Hello Kalle, colle
> >>>> Yet-another firmware question (I remember the standard answer of not
> >>>> using firmware not coming from your side). I see that for
> >>>> wcn3990/hw1.0 we have wlanmdsp.mbn with the version
> >>>> WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
> >>>> We have got the newer wlanmdsp.mbn released under
> >>>> redistribution-permissive license (LICENSE.qcom from
> >>>> linux-firmware). The file has the version
> >>>> WLAN.HL.3.3.7.c2-00723-QCAHLSWMTPLZ-1. It was released for the
> >>>> ath10k embedded into Qualcomm QRB2210 / QRB4210 SoCs.
> >>>
> >>> Update: with the current wlanmdsp.mbn I'm getting the following error
> >>> from the DSP:
> >>>
> >>> [   22.468121] qcom_q6v5_pas 6080000.remoteproc: fatal error received:
> >>> EX:kernel:0x0:SigVerify:0x173:PC=0xc10dd460
> >>>
> >>> The board is not fused, but the signature format was changed (and so
> >>> were some of the fields).
> >>>
> >>> It seems we will have to provide the updated file somehow to
> >>> linux-firmware. What would be the preferred way for us to do so?
> >> I cannot take firmware files from a 3rd party.
> >
> > Ack
> >
> >> Also I don't follow the
> >> WCN3990 firmware development so I can't really comment how that firmware
> >> release works with different WCN3990 hardware, board files and/or
> >> calibration data.
> >
> > It seems to work pretty normal. I have pointed out the only issue we
> > have stumbled so far in
> > https://bugzilla.kernel.org/show_bug.cgi?id=217748 (the warning during
> > scan).
> >
> >> But if you think that release should be submitted to
> >> linux-firmware that's up to you.
> >
> > This obviously means that we should not push it to
> > <linux-firmware>/ath10k/WCN3990, correct?
>
> That's the only directory ath10k uses, right? So how would any other
> directory work?

As we are nearly ready to send a pull request to linux-firmware, I
wanted to check if the following commit ([1]) is fine with you. An
alternative approach would be to push wlanmdsp.mbn as
ath10k/WCN3990/wlanmdsp-something.mbn and add two symlinks, from
qcom/qcm2290 and qcom/qrb4210.

As a reminder, the wlanmdsp.mbn is not loaded directly via remoteproc
/ firmware loader, but instead it is loaded by the modem DSP using
tqftp protocol (and tqftpserv will load it from the directory with
modem.mbn).

[1] https://github.com/lumag/linux-firmware/commit/f29e3265b02430630222fb3aba8b76ebcba632be

-- 
With best wishes
Dmitry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
