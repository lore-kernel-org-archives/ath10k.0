Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3267AC433EF
	for <ath10k@archiver.kernel.org>; Fri, 29 Apr 2022 06:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrgmZ4cwri8sTcu7vH0OxhHK4bsFNreDbUCAt/kzwQs=; b=P5M/ifpAUeHynS
	yj+D1kN7Le3YfaN/jWYWtaT/EhzHN/CMsekPdn0ugaVD6+S+K8Ak/19XCSFgXFG2a1XKS0BM9l2M8
	fTNvaHF97HrGT4ida/PbwGxycIIxNWz0hWEEMmV2r8vmuQI2JjSqWmEbgRfoMAWO7yR5YBCdgnfad
	vJfn+1+ajkyl3MJmkeIXLiVaVEsPdkqtnz6fb9WG8xSUHGsy3tGt8U6Jtt4rKlx3DGxIVotAk4Xhl
	z/nq9v5RUesMS2wnIJHAI/KhbwQXEkyWzJqa2Sc2qlmEA5tV2GigESJOSjHBcZMGVUSE4dIVMg5QU
	MpnAh0H7MePZAR9zKT6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkJs2-009hYT-An; Fri, 29 Apr 2022 06:12:50 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkJrz-009hVl-B9
 for ath10k@lists.infradead.org; Fri, 29 Apr 2022 06:12:48 +0000
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2f7bb893309so74875077b3.12
 for <ath10k@lists.infradead.org>; Thu, 28 Apr 2022 23:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JnXNRi3fgLseToL8emPAro3wD9fV8AutKcOTldnUHZg=;
 b=hlwtoZX5S8WE5hujcH3ZqSI1F6JaTPn+asutbPJcQCC2bbL5Kfg3Kg6RR0129B5hGJ
 0s0RPL0CYx/63UTzOvYhq6RBlIHCPY6i0WBpSXW6Y5CMbZAf0GkRCWsJFKgHUYb098et
 TZetDO80SdCHicgzkOGFwZecll7xmToAqGL1wJ+sLVf15/mMApvnCoR9qol0ahu36Iij
 IgHog0xdtRcxjG5RIu/lCjhIIggH2lzrKqsH+KQ67RF8nR9cSV8ZJ7JpkWod6jHGyJIl
 1Q2tHzNgW0wVgUJL8ydgUrWE+zASpoKSuyhmU6rilGsVZuyGCIEtpDXbuyDuEwYiwquW
 7/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JnXNRi3fgLseToL8emPAro3wD9fV8AutKcOTldnUHZg=;
 b=D3cdeTC03vRa6SqAVcou5UwdHihUk/chsd8VzUsT1SafWZDCFE3wG54kqW4I61CjAZ
 FOnciInF220124KL2KVXkvGbr58GCXlvPJrn/dguDy1s8A0T7cZGwE5CzXMEZGoq8lCU
 ttxqJZ2Dd0OhiW7GPvRegC5JjEZzgBHoeE8t9O1oRflb0OaH6S/X2Zm5a4NFaCL9oV3d
 9RPFXU2PqBSpy+l5ZpSEmxPH0+15HjnVoMir50+QRdypAx+tx8dHe9VZC25opQLff/U9
 PA1RFi4TXPTc1S5+un6JfOafyGt1nnpzTBCUL3zXNICPsecWoHLD+5oBjwnsmA++P2MT
 WVyQ==
X-Gm-Message-State: AOAM5332DghCy/ybowL9joSPHiDNiJ+WNa71gO8qcq2/X2aweIjl9FaJ
 Bw6J3QyxviLhRQJGJ2C9t0n0+ZwZ80dAnyyRlsfd1Q==
X-Google-Smtp-Source: ABdhPJydCw7QruBmFPtNS1LGkkCjRGaFOawi7x7UIiIhGh/L6he7e8pCGYsHIflNa7QBcza34vr14ezR92EiO4/ypPo=
X-Received: by 2002:a81:492:0:b0:2f7:ce87:c324 with SMTP id
 140-20020a810492000000b002f7ce87c324mr28911207ywe.359.1651212760038; Thu, 28
 Apr 2022 23:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR02MB4567E377F14F272DFF48907A92FA9@BYAPR02MB4567.namprd02.prod.outlook.com>
 <332e62e5-b04d-3a6a-38fe-924d056bf0f8@linaro.org> <87k0b8fnpj.fsf@kernel.org>
In-Reply-To: <87k0b8fnpj.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Apr 2022 09:12:28 +0300
Message-ID: <CAA8EJpr3Uxa-Tif5TyHfXL03j1--vrAb+DgT=0DY8KDpvHPjeQ@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20220423
To: Kalle Valo <kvalo@kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
 "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, 
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_231247_412500_0754E3FA 
X-CRM114-Status: GOOD (  16.21  )
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

On Fri, 29 Apr 2022 at 08:44, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > Hi Kalle,
> >
> > On 27/04/2022 11:32, Kalle Valo wrote:
> >> Add support for QCN9074 and WCN6750 ath11k hardware families. Also
> >> there are several updates to existing firmwares and board files for both ath10k
> >> and ath11k.
> >>
> >> Please let me know if there are any problems.
> >
> > I noticed that this pull request doesn't include the board file for
> > WCN3990. Is there any issue with it that we can solve on our side?
>
> Oh, sorry about that. I guess this is just a bug in my scripts, I'll
> include the wcn3990 board file in the next pull request.

Thank you! No problem, it was more of a question if we missed something.

> Linux firmware maintainers, please pull this anyway. I'll submit a
> follow up pull request later.


-- 
With best wishes
Dmitry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
