Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65585C4167B
	for <ath10k@archiver.kernel.org>; Tue,  5 Dec 2023 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mQ+XPDjXk72pElyeLCT+9tOvl6EzhwUwj2lCq1Lrvw=; b=0K5ZNIpBTAZjz7GHI+q/cOyqyE
	W5ExQyab4kWIT7lpfpC1jwe6vuLP7A/Uf2ifLu0jnDBuBbQGyTu+AKiy3+pxRZC5kOv4Y+Ber+MPP
	ZUvLoz17v+3UjhthkvvnYF6ANyJuOsQBaBp2vXTa6+Rlf5VUJ/259stbUWmuWtDJOSWw+mUgYytYq
	ibAh7y8p3W9Mw+dS9iljNZiPmSxtMFYKsE4MsQ3VGyhgg00sPNMc9Z5OBttKwtShWk2prMEgujZ8l
	dwsG0LfOcQ1EP6ez0h89rs4QLo414wQVJQXY+oP6ylS0Sm1qjrDPYKD4qStWgC0yOeYzmYNhgNjlw
	jN+eavKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAUj0-007Pye-1K;
	Tue, 05 Dec 2023 12:40:30 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAUiw-007Pt0-1z
	for ath10k@lists.infradead.org;
	Tue, 05 Dec 2023 12:40:28 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5d400779f16so34058297b3.0
        for <ath10k@lists.infradead.org>; Tue, 05 Dec 2023 04:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701780021; x=1702384821; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1mQ+XPDjXk72pElyeLCT+9tOvl6EzhwUwj2lCq1Lrvw=;
        b=UxCkmTSSlSpHTSGVmdZDC10QKqu/5R11rDT2oz6dqv8MzOBgY3ahVTtLTHS14LZa2X
         Bhv6HhG/WrNdpczVAMlY2ayXj/NvYVPknISAjJanQApXuHWt4FKEHzjTysu5pw9dD5PB
         69SPxK8NKSXsM5bx3o14oGWzDt67TXhOnbjd0Jx4FvR8Rvs4QSZbFNbgqn6A602U/spK
         0ukbhYJj2OotVmrPjQi1hfwl3g1tQuxRD9hW97EIvPWvVuPltgLkDrDEpf/7y34XQ+XH
         IqNokqrwP0BToQYyFpBPkBtWXRCrloGcOvj62JvdRTBZjwNVYWv6fDAfEOGzB1fxnvsb
         cGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701780021; x=1702384821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1mQ+XPDjXk72pElyeLCT+9tOvl6EzhwUwj2lCq1Lrvw=;
        b=C9eMRGSg6LD8dEN7rXCKavtPLmRcqSNs18ZTAN6Ou0cRZPcmQFL3SNDFCCAr/t20KH
         4ATa6xJF7Gj2S//DGJhzBDAFVoNUbd+/yOqGnNQ0+gYTRd4KVv2oWV07oj4vk9KHJ50S
         qpHQfTEkuQXk9xQL5/rzFmtT966VKCfwF1JhQi1ApOMRSD45g3NQ48yQNaOXuQgyyF8V
         wmz2UT/IuoZVu6gXcopnBRo7A4DQL0N9aNQRKsrTIBRXWmftt4iqIVInthZw4AkFlhRh
         U71gMfBRFLvNdr/mbU98Vs3iOlLIRgx2g3UUNKeiH0XdmIokAB7IwPI3hVCNq5soFaLh
         i3Fg==
X-Gm-Message-State: AOJu0Yw7KU/Bbb3DPA6iKgNEnKjreD3qT8NdvdaGzjHMTXRpFDhvssdx
	mEvV26dm1aN/AIiG7O1bGUvoZYn299W/7aKj42hXVRb6jlbSyhtPuhk=
X-Google-Smtp-Source: AGHT+IGsEF/0vazUGMDcfSRmSMa5s2n3omOEJJ6qeTf+/doE5/HnIHfte4PIpepq4xm8JJeX8Cc9y8reKTDesbUNUUY=
X-Received: by 2002:a81:57c4:0:b0:5d8:9242:47ae with SMTP id
 l187-20020a8157c4000000b005d8924247aemr815990ywb.19.1701780021375; Tue, 05
 Dec 2023 04:40:21 -0800 (PST)
MIME-Version: 1.0
References: <CAA8EJpp+SJpX4FFmcTm133KNtztTJH0ovTLRm0bftahPT8a1kw@mail.gmail.com>
 <87leaaqg7a.fsf@kernel.org> <CAA8EJpomDw0sBOT_t5F33Uqn4FeWRBewv_=_4q4OzvU+JzXH-g@mail.gmail.com>
 <878r6aq71z.fsf@kernel.org> <CAA8EJpoeozL_Vo0ivV6Gc3sPvANjz69e9jLrSgiegbv5LJUFXw@mail.gmail.com>
 <87r0k0q0zm.fsf@kernel.org>
In-Reply-To: <87r0k0q0zm.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Dec 2023 14:40:10 +0200
Message-ID: <CAA8EJpooQWqyb1XVOc4icWFvtMS1pxTicLuJBmQjddaUYfD9YQ@mail.gmail.com>
Subject: Re: ath10k / WCN3990: firmware-5.bin and wlanmdsp.mbn being out of sync
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_044026_691578_D5E1F19F 
X-CRM114-Status: GOOD (  42.62  )
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

On Tue, 5 Dec 2023 at 14:37, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On Mon, 4 Dec 2023 at 18:14, Kalle Valo <kvalo@kernel.org> wrote:
> >
> >>
> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> >>
> >> > On Mon, 4 Dec 2023 at 14:56, Kalle Valo <kvalo@kernel.org> wrote:
> >> >
> >> >>
> >> >> Hi Dmitry,
> >> >>
> >> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> >> >>
> >> >> > I wanted to ask your opinion regarding one of the issues we stumbled
> >> >> > upon on the Qualcomm RB1 and RB2 platforms. These platforms use ath10k
> >> >> > snoc (WCN3990) WiFi "card". We noticed the following messages being
> >> >> > spawned on the console, which I traced it to the
> >> >> > ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL feature:
> >> >> >
> >> >> > ath10k_snoc c800000.wifi: chan info: invalid frequency 0 (idx 41 out of bounds)
> >> >> >
> >> >> > As a reminder, on this platform the wlan firmware and firmware-N.bin
> >> >> > files come separately.
> >> >> > The wlanmdsp.mbn is downloaded by the onboard modem DSP via the
> >> >> > tqftpserv request (which is served from the board-specific folder
> >> >> > qcom/qcm2210). The firmware-N.bin file is loaded by the WiFi driver
> >> >> > itself from the generic folder, ath10k/WCN3990/hw1.0. Current
> >> >> > firmware-5.bin file was provided with the sdm845's wlanmdsp.mbn, which
> >> >> > is older than qcm2210/qrb4210's wlanmdsp.mbn.
> >> >> >
> >> >> > I'm looking for suggestions on how to make ath10k driver load
> >> >> > firmware-N.bin file which corresponds to the board-specific
> >> >> > wlanmdsp.mbn.
> >> >>
> >> >> We have had similar discussions in the past but it didn't go very far.
> >> >> It would be so nice if you could finally fix this :) At one point we
> >> >> even had a discussion that we might need something similar for ath11k
> >> >> but it didn't go anywhere.
> >> >>
> >> >> > In particular I'd like to hear your opinion on the following proposal:
> >> >> >
> >> >> > Add the  optional property to the board DT, that specifies:
> >> >> > firmware-name = "path/to/wlanmdsp.mbn".  The property, if present,
> >> >> > will be used as an override for the firmware directory. So, while the
> >> >> > ath10k driver will not load wlanmdsp.mbn on its own, it will still
> >> >> > look for the firmware-N files in the specified directory.
> >> >>
> >> >> Back in the day I was thinking something like below, please let me know
> >> >> what you think.
> >> >>
> >> >> So the normal firmware path for WCN3990 is:
> >> >>
> >> >> ath10k/WCN3990/hw1.0/
> >> >>
> >> >> My idea was that if we could extend it for different "platforms" (not
> >> >> sure what's the proper term for this) by having platform specific
> >> >> directories:
> >> >>
> >> >> ath10k/WCN3990/hw1.0-platform/
> >> >>
> >> >> (Replace "platform" with a unique name for the platform, for example
> >> >> "acme-kv7" for a product from Acme with model name kv7.)
> >> >>
> >> >> Then DT could inform ath10k about this "platform" string and ath10k
> >> >> would then download boath firmware-N.bin and board-2.bin from the
> >> >> platform specific directory.
> >> >>
> >> >> And even cleaner if we could have the *.mbn firmware files in the same
> >> >> directory, even if ath10k doesn't access them directly.
> >> >
> >> > We can, and a symlink from qcom/SoC/.../dir to that subdir.
> >> >
> >> > So, for example, for Pixel-3, using your schema we will have:
> >> >
> >> > ath10k/WCN3990/hw1.0-blueline/wlanmdsp.mbn
> >> > ath10k/WCN3990/hw1.0-blueline/firmware-5.bin
> >> > ath10k/WCN3990/hw1.0-blueline/board-2.bin
> >> >
> >> > qcom/sdm845/Google/blueline/wlanmdsp.mbn ->
> >> > ../../../../ath10k/WCN3990/hw1.0-blueline/wlanmdsp.mbn
> >> >
> >> > This sounds mostly fine to me. My only suggestions is to change it as following:
> >> >
> >> > ath10k/WCN3990/hw1.0/board-2.bin
> >> >
> >> > ath10k/WCN3990/hw1.0/blueline/wlanmdsp.mbn
> >> > ath10k/WCN3990/hw1.0/blueline/firmware-5.bin
> >> > ath10k/WCN3990/hw1.0/blueline/board-2.bin
> >> >
> >> > qcom/sdm845/Google/blueline/wlanmdsp.mbn ->
> >> > ../../../../ath10k/WCN3990/hw1.0/blueline/wlanmdsp.mbn
> >>
> >> Is there a specific reason why you propose adding a new subdirectory?
> >> Personally I find it confusing that hw1.0 directory contains the
> >> firmware files and then there's a subdirectory which also contains
> >> similar firmware files.
> >
> > My main idea was to allow fallback at least for board-2.bin. I don't
> > think we should have 10 instances of the file (or load it from the
> > platform-specific location).
>
> A very good point, I didn't think of board files. I agree, we should
> avoid having several board-2.bin files. But I don't see how a
> subdirectory would solve that? What if we have symlinks for board-2.bin
> file:
>
> ath10k/WCN3990/hw1.0-blueline/board-2.bin -> ath10k/WCN3990/hw1.0/board-2.bin
>
> That way we can have just one board-2.bin file to maintain. And I
> suspect this would be easier to implement in ath10k driver.

I think it's the same amount of effort. Let me take a look at implementing it.

>
> In my previous mail I forgot to mention about backwards compatibility
> which is important. So we need to be careful that older kernels continue
> to work.

Yes, I had that in mind too.

For the current kernels to work, we need following three files:

ath10k/WCN3990/hw1.0/firmware-5.bin
ath10k/WCN3990/hw1.0/board-2.bin
qcom/sdm845/wlanmdsp.mbn

-- 
With best wishes
Dmitry

