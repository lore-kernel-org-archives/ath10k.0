Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A2AC54E41
	for <ath10k@archiver.kernel.org>; Wed,  6 Mar 2024 14:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZpMPKa6e7jU2jBVyiXD1uP0V9gbgVlt9tlhzywS1d0=; b=hFhdcnuIi1EWSq/iQy5Sfq83Ml
	gHVg5gtOe75Qvrgd0vXDdSyTZ9fgGLSQKwHBBxXoQtXySvsZiv2uPNNi56qHCblIRqAJHV7AQOdiV
	nDdnyQageiqtMslYOP3DervYKigoEIQIUlTMJSfY9F3R62e2kqr83TpzqrGLfFMqSy6wEqE0CQNGl
	TZY9S/nNIYpQGI2P3Ji5jnxshpg4Xxn0cR5UtirHkw3RVmVaWHdkPfVmdgc8sMDjBVmgRlCqJ7oFp
	xgLQHzGcoVjr7CUmQ7RhB63Tb+NW/TU/uWrhXm7fYL3EaCGKo+XsOzfZ+h0d9Cbq/p2oB6iNMh0Yo
	Pzfqvavw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhsBo-00000000YbC-2RaQ;
	Wed, 06 Mar 2024 14:24:12 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhsBk-00000000YYI-09FJ
	for ath10k@lists.infradead.org;
	Wed, 06 Mar 2024 14:24:10 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-608ccac1899so11950807b3.1
        for <ath10k@lists.infradead.org>; Wed, 06 Mar 2024 06:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709735046; x=1710339846; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eZpMPKa6e7jU2jBVyiXD1uP0V9gbgVlt9tlhzywS1d0=;
        b=Rz1AUthWBr4DGNtrtoEES73361fULZOR5GFYmcg7Qaw1ouCQ0hfa7X+AYipgZf70EO
         7BhgNs8L5OB0VNlWxfnEK/M/eOya/OyDSkKEv1Racm6o0yk8qyadDJXTn6toAa3EIvQz
         xdgKNh4dKuCfD54f6ZvhCHZQiFDPqVI6T3wDaULHMCUieIuEJrIjjTp9LhU+saSrsCbI
         CbiDK8Am1a67mMSdRKd6hfCQ1SaWXbA7YrpNk3RatcEp5Tg7Jt6xdGhBZJti8UfN0e2K
         EqlolyotTxKLDfYTJEyP9/t/cCaCiDfQJj1gSTqq/h+RomU6j/3bHkuXYkF8E59VLD1f
         7rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709735046; x=1710339846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZpMPKa6e7jU2jBVyiXD1uP0V9gbgVlt9tlhzywS1d0=;
        b=jRjzc4rNbVgAMGvNjcs6IVunyw68IshBHLDoA8/PMZJOVq51ocwNi6Y7fw6Vp8YHCi
         Gm4rR+vuvZ1HHqaynCvTqjJWSn1oABrAaSidjnTNDaE2PGfp/0Tv2JMQdVqZNGUMwMdI
         GfrMnJx/vXYf271L9Ypqm+q2ERObjqVVCxbO2NxqVwClZybflapfMWxJiieoso8oWEUF
         GL2mICApsXpj8y7MFNrK2Ij0VIVPv6wCYKN8ZlBlruyyJs/CtUKMQByrzCr2kWLTqmde
         TBpcAfCipt5i17OKO6+7ZXYUjnXuPeLogw/4TwfdDCNkmqVLVMvHycP9Z2lMyP19JZW+
         xIjw==
X-Forwarded-Encrypted: i=1; AJvYcCUAC/xZ0a/cv5nncYU08a6I4yK4WZCqrrPIq3LBhVbMJADl12/WHldpXKyrEGzmbT4WpJ79bUmhHFldZ695AUaGdtfcTf4sYtgWkw==
X-Gm-Message-State: AOJu0YwhQ/3mcIV6OcJ4Y9LkyhlhlY6oAhZjM49ayIee6kh6kaD2fkUE
	oK9XjQY1s5Rf6lh/TUgb3CpUb9xNU8WIuj7naJHUHeHegg4I9UqLgS7hznPLTGtj/PW1jAG8agJ
	upYpPNFQ2f7OFNJwgZPRsPPlwtV0HzYVM7XY6Wg==
X-Google-Smtp-Source: AGHT+IFtPw7iiv+byEAcjoYdyvfBnMJrrGDYSOvTrCZtLuKlzx6HBrSrHHu558ENUxjrcYdwWnuD1V710Dta5mIdRvM=
X-Received: by 2002:a81:85c5:0:b0:609:9171:130d with SMTP id
 v188-20020a8185c5000000b006099171130dmr10635779ywf.19.1709735046114; Wed, 06
 Mar 2024 06:24:06 -0800 (PST)
MIME-Version: 1.0
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
 <87plw7hgt4.fsf@kernel.org> <CAA8EJpr6fRfY5pNz6cXVTaNashqffy5_qLv9c35nkgjaDuSgyQ@mail.gmail.com>
 <87cys7hard.fsf@kernel.org>
In-Reply-To: <87cys7hard.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 16:23:55 +0200
Message-ID: <CAA8EJpowyEEbXQ4YK-GQ63wZSkJDy04qJsC2uuYCXt+aJ1HSOQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/4] wifi: ath10k: support board-specific firmware overrides
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_062408_136127_7100F9F9 
X-CRM114-Status: GOOD (  38.03  )
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

On Wed, 6 Mar 2024 at 13:15, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On Wed, 6 Mar 2024 at 11:04, Kalle Valo <kvalo@kernel.org> wrote:
> >
> >>
> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> >>
> >> > On WCN3990 platforms actual firmware, wlanmdsp.mbn, is sideloaded to the
> >> > modem DSP via the TQFTPserv. These MBN files are signed by the device
> >> > vendor, can only be used with the particular SoC or device.
> >> >
> >> > Unfortunately different firmware versions come with different features.
> >> > For example firmware for SDM845 doesn't use single-chan-info-per-channel
> >> > feature, while firmware for QRB2210 / QRB4210 requires that feature.
> >> >
> >> > Allow board DT files to override the subdir of the fw dir used to lookup
> >> > the firmware-N.bin file decribing corresponding WiFi firmware.
> >> > For example, adding firmware-name = "qrb4210" property will make the
> >> > driver look for the firmware-N.bin first in ath10k/WCN3990/hw1.0/qrb4210
> >> > directory and then fallback to the default ath10k/WCN3990/hw1.0 dir.
> >> >
> >> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> > ---
> >> > Changes in v2:
> >> > - Fixed the comment about the default board name being NULL (Kalle)
> >> > - Expanded commit message to provide examples for firmware paths (Kalle)
> >> > - Added a note regarding board-2.bin to the commit message (Kalle)
> >> > - Link to v1:
> >> > https://lore.kernel.org/r/20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org
> >>
> >> From my point of view this looks good now but let's see what others say.
> >> Is there a specific reason why you marked this as RFC still?
> >
> > No, I just forgot to remove it from the series settings, so you can
> > consider it as final.
>
> Good, so let's ignore the RFC label for this v2.
>
> > I had one minor question in my head (but that's mostly for patches 3
> > and 4): in linux-firmware we will have ath10k/WCN3990/hw1.0/qcm2290
> > and make qrb4210 as a symlink to it. Is that fine from your POV?
>
> Yes, I think using a symlink is a good idea.
>
> > Or should we use sensible device names (e.g. qcom-rb1)?
>
> I guess 'qcom-rb1' refers to 'Qualcomm Robotics RB1' board? In other
> words, the question is that should we use chipset specific names like
> 'qcm2290' or product based names like 'qcom-rb1'?
>
> That's a good question for which I don't have a good answer :) I'm not
> very familiar with WCN3990 hardware and SoCs to have a full picture of
> all this, especially how the firmware images are signed or what
> different firmware branches there are etc.

I checked Pixel-3 data, it has wlanmdsp.mbn signed by Google.

>
> To be on the safe side using 'qcom-rb1' makes sense but on the other
> hand that means we need to update linux-firmware (basically add a new
> symlink) everytime a new product is added. But are there going to be
> that many new ath10k based products?
>
> Using 'qcm2290' is easier because for a new product then there only
> needs to be a change in DTS and no need to change anything
> linux-firmware. But here the risk is that if there's actually two
> different ath10k firmware branches for 'qcm2290'. If that ever happens
> (I hope not) I guess we could solve that by adding new 'qcm2290-foo'
> directory?
>
> But I don't really know, thoughts?

After some thought, I'd suggest to follow approach taken by the rest
of qcom firmware:
put a default (accepted by non-secured hardware) firmware to SoC dir
and then put a vendor-specific firmware into subdir. If any of such
vendors appear, we might even implement structural fallback: first
look into sdm845/Google/blueline, then in sdm845/Google, sdm845/ and
finally just under hw1.0.

>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


--
With best wishes
Dmitry

