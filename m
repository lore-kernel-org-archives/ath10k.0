Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC0EC433EF
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLec0rmymgdMp4m37DXdswaQXPkY+aeG0atKrofro6I=; b=EE+ZtEesThgy1I
	J0q/G3Lu4SmW+H/mHMGuFooyjzVVysS8LZg6vy1lH02yVgsgf+PLPsMR9KA5+3TMsYZuMf4AwIhLZ
	YYX0BCg+EQegHsjiY8WyxUXQWxAQJF+4+osoF1APe5O3TSp7muK3FQo+JVArDON/jCOVea33vFhgi
	TRXId7mT/fvKj2d7jJBpFWabhA7sDDUztFw8WFzQJtu7T+b5Iuj2+VteldfggR6iBVCHCTy7wQj7b
	r/nqdBssR2e1BvckVa/YCur724mPQmokMDCF+8+gc7OfXmVmC4mu8ZFpKevZ21G/QsTauJdQTw7qu
	tgeUBrYpJ2tdYpYONw/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAu3i-00FC4D-LD; Fri, 21 Jan 2022 13:34:30 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAu3f-00FC1m-DC
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:34:29 +0000
Received: by mail-qt1-x82f.google.com with SMTP id ay42so1440596qtb.2
 for <ath10k@lists.infradead.org>; Fri, 21 Jan 2022 05:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JOM/kgc9Gr3wOVHjR4TsTdFENKsJPD2Px7TWi2GwX4s=;
 b=oEpeMvqnrnIYJyWessTKxQV9vXgs6mJWojpZKVC4FvBXgKoY2Fb9U1sfwi3+0SKMA4
 H3+ZQbYmkajeqt2I8w3d0xHx1ATGiTwnZ7XRc96cZFXcU9lNBp93ek0NcCEzg2SJCeFZ
 JKkzq6h6jIbjeEDtz1S3rTz7vjxjTCBE7z0cznAgF4D/HI45hbEnr9ksVYR8VQcUCN/G
 X8IC5CsAGuQMDPxQ2F14EqA+DvGszFlI4NnmazQQVN1kOZrFo3zLAV8qOm4CxTEFS784
 fVLwr1RAdDTHwhqQ3c71HromnM6N7cCU8tXWH41v4mHsZoPJdE3hhqIbUII3h3zH/qYB
 ftAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JOM/kgc9Gr3wOVHjR4TsTdFENKsJPD2Px7TWi2GwX4s=;
 b=v4ICJFryACdU/kTeiDHH9itIcTP//TRp22W0NcT+u9z3xP4EOZ0L09Wq1prHhhjyq2
 Gta5xj7zroqZtGR9ect2K60gfUeYBRdcIa0RiwLr95h6uLdr2Ix+vB5CcOOQ1eeroQGW
 THGkWDlVJxbgGGs5dnBsCmtR9067DZD+zwgNhs3Zz4Ux0qQ0vqDT7lOqko5BZeenxbFq
 hxP0i294/8hWr0HPbKv9AGLUPguMJ4bAE3p2IEwD2JdyXywSiX7nSmRIylpZE2Jj7aeu
 jOoGa8Y6SNtRTLKQTiJNgskR3WYQ1D1fx0aUdLhcVBS1xOmDXgRQwwgjfcHL4nVjkTU3
 /U8Q==
X-Gm-Message-State: AOAM5325K3xrf+jeoEV+z2UfJ2ZVdQCg9h7OOg0aPXyTq7VFswooM0Zc
 VvI4I+LO+IOePxdBHSipRlXqHoCZPdynHlB2bpPeUB39
X-Google-Smtp-Source: ABdhPJwMk4jPDOjidb62HPQ0H+3KdKN+luoeU0yGsr/jjQtWR+jVcGGouLC1Uk1HMQkOSqTtZXP/tGucflslVhXygMA=
X-Received: by 2002:a05:622a:450:: with SMTP id
 o16mr715422qtx.82.1642772064102; 
 Fri, 21 Jan 2022 05:34:24 -0800 (PST)
MIME-Version: 1.0
References: <CAOX2RU6wCpdtUMSrnaPK9Bg8hyn-wqnAeZgszYe-T45MH4E+cw@mail.gmail.com>
 <874k5xfcf0.fsf@kernel.org>
In-Reply-To: <874k5xfcf0.fsf@kernel.org>
From: Robert Marko <robimarko@gmail.com>
Date: Fri, 21 Jan 2022 14:34:13 +0100
Message-ID: <CAOX2RU4r338J_iAbK50OFQbuWP1_KgMfCGm2s0So2P+2P=gwkg@mail.gmail.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Update 8devices Habanero specific
 BDFs
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_053427_484943_1FAC350E 
X-CRM114-Status: GOOD (  22.26  )
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

On Fri, 21 Jan 2022 at 14:25, Kalle Valo <kvalo@kernel.org> wrote:
>
> Robert Marko <robimarko@gmail.com> writes:
>
> > I am currently working on the 8devices Habanero support for
> > OpenWrt. This
> > AP requires two special BDFs to get the Wi-Fi PHYs working (correctly). The
> > bmi-board-id='s would clash with one of the the IPQ401X AP-DK boards because
> > QCA doesn't provide special IDs for customers and seems to use the AP-DK
> > board-ids in the wifi firmware to change its behavior.
> >
> > This update improves 5GHz radio.
> >
> > Now to the questions from the wiki page [1]:
> >
> > * description for what hardware this is:
> >
> >   - it is a QCA4019 based module
> >   - one QCA4019 radio is used as 2.4GHz radio
> >   - one QCA4019 radio is used as 5GHz radio
> >
> > * origin of the board file (did you create it yourself or where you
> >   downloaded)
> >
> >   - it was pulled from the 8devices OpenWrt fork
> >   - it is based on latest version
> >
> > * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> >
> >   - QCA4019 hw1.0
> >
> >   + bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=8devices-Habanero
> >      md5sum:
> >      64d0817da715875483d323f2bb0c898c
> >
> >   + bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=8devices-Habanero
> >      md5sum:
> >      56202ea33e96f16c65b75d464451c251
> >
> > * attach the actual board file (board.bin)
> >
> >   - The name of the files are equal to the id string in the board-2.bin
> >     (minus the ".bin")
>
> Do note that it seems that only one board file contents was actually
> changed, was that on purpose?

Yes, only the 5GHz radio had an update.
8devices released new BDF-s last year that fix the thermal readings.

Do you mind if I send the updated ones upstream?

Regards,
Robert
>
> Thanks, added to QCA4019/hw1.0/board-2.bin:
>
> New:
>
>
> Changed:
> bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=8devices-Habanero
>
> Deleted:
>
> 0 board image(s) added, 1 changed, 0 deleted, 60 in total
>
> https://github.com/kvalo/ath10k-firmware/commit/1fad4d7a4aab0bb7daaabd5324c2b87e438d9bac
>
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
