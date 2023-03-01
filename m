Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEC7C7EE30
	for <ath10k@archiver.kernel.org>; Wed,  1 Mar 2023 09:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K1cyQ/OtxKFCRgNmGD+FdJvNi6R/mBsP/VkkYauDPfQ=; b=4StCkCaKlO95Zb
	jt1OBjwONHSf7KE3jfzb2v4LOjZDTj/SYaOyi/ybSDUIRdjWW6vy9ERc+avmQah7O7SilBeY/vC/i
	UC3VLYMWKNvnA7CPDV9NO3ntr9B66oZNK58dgqXvCsWmQ2NDelJ5gytsB6oxqYj5amhdqfDvrS2ny
	zVOqTkksNA6LZ0NDCgcyLeyvZys1zEccTwUI39Ed/MyEOIpURQF6UoonUzLU1QGPtyL0rQLrAwI3H
	eRQHYolEzwgLsbFnRK0BehtL6Pbg2Fq+zDsPoW2dLGTPAeTP+RLBSo84DDNPT+7C92lONgdmYrvgJ
	Y8pD+AXUewDdkvzrcK2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXIN0-00FVBj-4z; Wed, 01 Mar 2023 09:03:30 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXIMw-00FVBH-Mi
	for ath10k@lists.infradead.org; Wed, 01 Mar 2023 09:03:28 +0000
Received: by mail-pj1-x102f.google.com with SMTP id cp7-20020a17090afb8700b0023756229427so16561086pjb.1
        for <ath10k@lists.infradead.org>; Wed, 01 Mar 2023 01:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7kLFJAEhf38Z91ErKT+SpxGk8u9CKv5JjAsWvmwSh1U=;
        b=kFV6gWvUnLZUgZ3rx1fWN6XsMVZGaOvEhSfcLg/s8cO8hXYZcsfYyMQVpM1nPe0baw
         9ArjHkD/rTNKS5uasdrwh9EyO2HLnFSdTwYbjkFKAu3WyoU4IHt3Tz34CYydA9oO369D
         BObp7hV6riaekilNuiKshaOLfMCvvMGnhgoDEztu+nfov0YCkeX/+HL/23Yn7jAZ8k5x
         NMf4axghp3wg1SxSNbK2DtkVk61xSTsSv7ln/oLuupE6mXwtZ4StRepp85j7sHIy6sLP
         gDU3wf3dZ189e0zn3+AZIZ/STcotbaSfkInW+N3RhCLw3z5qel277LPsO3bAKE4Pkh8k
         BMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kLFJAEhf38Z91ErKT+SpxGk8u9CKv5JjAsWvmwSh1U=;
        b=0aXuFZ/l7JJJhpoaBaymmPYssi5TLW/khvkQYPSc+US/y5iqcU5Vpwyn2HafjlY1Y4
         wHtv+IK9+QRu7o0z2fRjQZnGUVtVSOPf61ka4xU8wneAQeNOrIPzxh4T/hkbebM7iXVM
         f+9+rD+OIR8ZS4E3h4lhdet+kqPOESZXGblp2zculQskHhjtPWfpanjVr3IIlBrdubvg
         ABhRNwX1FrNooqF1gN2kmq+edIB/LF2bZ1PCcsixRZAWYwVgkDzfAWHZ3a+FVoMuzT6B
         pCgb4YhPVmQPxgMP7WasgMyVJbuINprRm++bQj956YJNT1/OovuRAyj5tHAzVoFKpyJ0
         fmBg==
X-Gm-Message-State: AO0yUKWf+/lIHbWeh3QcvKMxWtWC8/rHHv9OaZKDpc+UvTW9cJFQ8z9/
	KEvzvAM4NamJ9qt1nBxvwMemKER3FjVyDcskxeUcFg==
X-Google-Smtp-Source: AK7set/EtY+OG6oXO/oVlz80z4XiEM8n0HHmXdl5DR+0gJsIWwZvMhJ6meksEeV5+DLgP3I/bf83eA0yaUAqAI17xbc=
X-Received: by 2002:a17:902:e5d0:b0:19a:fa2f:559e with SMTP id
 u16-20020a170902e5d000b0019afa2f559emr3823016plf.3.1677661405158; Wed, 01 Mar
 2023 01:03:25 -0800 (PST)
MIME-Version: 1.0
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
 <Y0hr9XTGAg8Q6K6y@google.com> <CAA8EJppuGbDGb1D-yf2WL77U1bqx1QQStQeDArWmGFCUiOtnww@mail.gmail.com>
 <10237323.nUPlyArG6x@steina-w>
In-Reply-To: <10237323.nUPlyArG6x@steina-w>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 1 Mar 2023 10:02:48 +0100
Message-ID: <CAPDyKFq7NFx_cwTZajqjOnRsjJ1i-F0ip+b0ZjFUcOdLjMJSkQ@mail.gmail.com>
Subject: Re: [PATCH v1 00/15] create power sequencing subsystem
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Matthias Kaehlcke <mka@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Stanimir Varbanov <svarbanov@mm-sol.com>, linux-arm-msm@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_010326_761648_3EC52B56 
X-CRM114-Status: GOOD (  26.02  )
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

On Wed, 1 Mar 2023 at 09:17, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi,
>
> sorry for being late to the party.
>
> Am Mittwoch, 19. Oktober 2022, 08:03:22 CET schrieb Dmitry Baryshkov:
> > Ho,
> >
> > On Thu, 13 Oct 2022 at 22:50, Matthias Kaehlcke <mka@chromium.org> wrote:
> > > Do you still plan to refresh this series?
> > >
> > > I know there have been multiple attempts to get something similar
> > > landed in the past 10 year or so. Your series didn't seem to get
> > > much pushback from maintainers, might be worth sending a refresh :)
> >
> > Yes, I hope to return to it eventually. I just had no time for it lately.
>
> I just found this thread while searching for power sequencing devices in
> Linux. From what I understand this is transforming the existing mmc pwrseq
> drivers into generic ones. What is the intention of this new subsystem? What
> is it supposed to address?
> In my case I have an LTE module attached via USB, but in order to use it I
> need to perform several steps:
> 1. apply power supply
> 2. Issue a reset pulse(!), the length actually defines whether its a reset or
> poweroff/on
> 3a. wait for a GPIO to toggle
> 3b. wait a minimum time
> 4a. device will enumerate on USB
> 4b. device can be access using UART
>
> This is something required to actually see/detect the device in the first
> place, thus it cannot be part of the device driver side.
> Is this something pwrseq is supposed to address?

Yes, this is one of those typical use-cases for discoverable buses
that we need to add support for, in one way or the other.

>
> Best regards,
> Alexander

[...]

Kind regards
Uffe

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
