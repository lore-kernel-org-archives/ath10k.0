Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DF9C4167B
	for <ath10k@archiver.kernel.org>; Mon,  4 Dec 2023 16:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNOR5hPbxSi6oOJtDcDO/9t8S2G/RM9x8pzeEdejC9g=; b=rEfzs/fAHZt4n/5rFBGH572AQ3
	X04TmKO+xWby7BP6fq42RSKA/ct1FVg7QHE0eiHAap9wxGitr0MxqWPKiwyIxT8Ji+4AwRlwLCD/E
	Q00rebHn9ifWPOiclLpppmi0qbfFjy6BVqYsiIAl0PedHwh9SPoI1zTFz8JiT1tLt93DMzbP5NVyn
	LgSWZEQeNN0RdU/lMtJhYrhkzqdEJSPDaH16juteugPtst3Q+SPkFRmUclNfNkPoIKOFktp09XIoC
	g6N3mzYAVKyv8YY944Ax+whLsYv8zgrA4ciFRm8Nk8PoCFQCrR+7Hjcgg2n8u3CwRa4qKFeuoxwB6
	PVk+bYBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAC8F-0058DH-2w;
	Mon, 04 Dec 2023 16:49:20 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAC8A-0058Be-1h
	for ath10k@lists.infradead.org;
	Mon, 04 Dec 2023 16:49:16 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5d8a772157fso10113777b3.3
        for <ath10k@lists.infradead.org>; Mon, 04 Dec 2023 08:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701708551; x=1702313351; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uNOR5hPbxSi6oOJtDcDO/9t8S2G/RM9x8pzeEdejC9g=;
        b=hItW0x47y/1l7nP+ePiKEcEQ1KUSkErxWWtuTrfYJJU9LDwjFceUzomx1zMmAqtSEw
         watOKCB3qMi7Gam5N4rXongYiCRG/4GOpCP+GJZP85bc6Nci5Jfa5iHdcx6Jv4wozf7l
         3HQskaTd8ucGFahjmHU8D2Sm7N7tdpzpoBo49TCIFfoDW7YbHdmpACu3H1P6hl7Ztmp1
         fbOUain1akh3BIyAXu1AWOwhEOG9LqFzAGUmxmNPaIgOklNJTrHa6Mk9ga4pE/RA3f0q
         9LxtFlLEgh+RpvmOE+eLu1BbYaEsvjI/KjK4I1RYIcT8yNOqlxnUfMHlMekb4dAbJeXy
         7uNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701708551; x=1702313351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNOR5hPbxSi6oOJtDcDO/9t8S2G/RM9x8pzeEdejC9g=;
        b=K/zx2jwzVxY+sqQthcILDk/7BRYoysl/err+j/IyfW3xbE1JCKp5G+hkj75YNrscHI
         xNTekydPkxVk6qlnnlz9Y6tSvU/yr+M34Gr/0RjQ8Ke2zTG9CkVDRRDS7lysZSxuCQlP
         Jzi6mMz7tjy16vhEmpA6ngMulWQZhPaZmr/1TkKJFs/v1rHgl5ZUWqgcnlkFNTJKqFwK
         x0Jr7h3OAnvRSaZw3k2nzv/rXpnjhvI84SZbH0LhtzvNIoLgrpWV2voQjYH/Kk8ZNnt7
         dUPE4LWZXzepA5XPXGmwvREaALe/AvQM+XQ2WId05tQ1AXltYgGahOv6qDzgZeuwKO9B
         UU9A==
X-Gm-Message-State: AOJu0Yw3FBA++xC+1a8uBdR9lptrqU1s6MnVyydJFRpZFTtkbv1gTFt5
	ko+mdyMv2AsI09B1+IbuCXquMqbntVBnJZd/ejFJfcAM/M0jm7JT
X-Google-Smtp-Source: AGHT+IFHh6JHzSU9qHaDuUKxHyO45txUlNPSX7zn38qqp5CrYHqcA3g2fJfazOckxp3XQ/bZY+vFQOjhCpU8XvUebG4=
X-Received: by 2002:a81:9a4f:0:b0:5d7:1941:aac with SMTP id
 r76-20020a819a4f000000b005d719410aacmr3444165ywg.71.1701708551653; Mon, 04
 Dec 2023 08:49:11 -0800 (PST)
MIME-Version: 1.0
References: <CAA8EJpp+SJpX4FFmcTm133KNtztTJH0ovTLRm0bftahPT8a1kw@mail.gmail.com>
 <87leaaqg7a.fsf@kernel.org> <CAA8EJpomDw0sBOT_t5F33Uqn4FeWRBewv_=_4q4OzvU+JzXH-g@mail.gmail.com>
 <878r6aq71z.fsf@kernel.org>
In-Reply-To: <878r6aq71z.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 18:49:00 +0200
Message-ID: <CAA8EJpoeozL_Vo0ivV6Gc3sPvANjz69e9jLrSgiegbv5LJUFXw@mail.gmail.com>
Subject: Re: ath10k / WCN3990: firmware-5.bin and wlanmdsp.mbn being out of sync
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_084914_912450_6DC05C1A 
X-CRM114-Status: GOOD (  38.01  )
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

On Mon, 4 Dec 2023 at 18:14, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On Mon, 4 Dec 2023 at 14:56, Kalle Valo <kvalo@kernel.org> wrote:
> >
> >>
> >> Hi Dmitry,
> >>
> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> >>
> >> > I wanted to ask your opinion regarding one of the issues we stumbled
> >> > upon on the Qualcomm RB1 and RB2 platforms. These platforms use ath10k
> >> > snoc (WCN3990) WiFi "card". We noticed the following messages being
> >> > spawned on the console, which I traced it to the
> >> > ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL feature:
> >> >
> >> > ath10k_snoc c800000.wifi: chan info: invalid frequency 0 (idx 41 out of bounds)
> >> >
> >> > As a reminder, on this platform the wlan firmware and firmware-N.bin
> >> > files come separately.
> >> > The wlanmdsp.mbn is downloaded by the onboard modem DSP via the
> >> > tqftpserv request (which is served from the board-specific folder
> >> > qcom/qcm2210). The firmware-N.bin file is loaded by the WiFi driver
> >> > itself from the generic folder, ath10k/WCN3990/hw1.0. Current
> >> > firmware-5.bin file was provided with the sdm845's wlanmdsp.mbn, which
> >> > is older than qcm2210/qrb4210's wlanmdsp.mbn.
> >> >
> >> > I'm looking for suggestions on how to make ath10k driver load
> >> > firmware-N.bin file which corresponds to the board-specific
> >> > wlanmdsp.mbn.
> >>
> >> We have had similar discussions in the past but it didn't go very far.
> >> It would be so nice if you could finally fix this :) At one point we
> >> even had a discussion that we might need something similar for ath11k
> >> but it didn't go anywhere.
> >>
> >> > In particular I'd like to hear your opinion on the following proposal:
> >> >
> >> > Add the  optional property to the board DT, that specifies:
> >> > firmware-name = "path/to/wlanmdsp.mbn".  The property, if present,
> >> > will be used as an override for the firmware directory. So, while the
> >> > ath10k driver will not load wlanmdsp.mbn on its own, it will still
> >> > look for the firmware-N files in the specified directory.
> >>
> >> Back in the day I was thinking something like below, please let me know
> >> what you think.
> >>
> >> So the normal firmware path for WCN3990 is:
> >>
> >> ath10k/WCN3990/hw1.0/
> >>
> >> My idea was that if we could extend it for different "platforms" (not
> >> sure what's the proper term for this) by having platform specific
> >> directories:
> >>
> >> ath10k/WCN3990/hw1.0-platform/
> >>
> >> (Replace "platform" with a unique name for the platform, for example
> >> "acme-kv7" for a product from Acme with model name kv7.)
> >>
> >> Then DT could inform ath10k about this "platform" string and ath10k
> >> would then download boath firmware-N.bin and board-2.bin from the
> >> platform specific directory.
> >>
> >> And even cleaner if we could have the *.mbn firmware files in the same
> >> directory, even if ath10k doesn't access them directly.
> >
> > We can, and a symlink from qcom/SoC/.../dir to that subdir.
> >
> > So, for example, for Pixel-3, using your schema we will have:
> >
> > ath10k/WCN3990/hw1.0-blueline/wlanmdsp.mbn
> > ath10k/WCN3990/hw1.0-blueline/firmware-5.bin
> > ath10k/WCN3990/hw1.0-blueline/board-2.bin
> >
> > qcom/sdm845/Google/blueline/wlanmdsp.mbn ->
> > ../../../../ath10k/WCN3990/hw1.0-blueline/wlanmdsp.mbn
> >
> > This sounds mostly fine to me. My only suggestions is to change it as following:
> >
> > ath10k/WCN3990/hw1.0/board-2.bin
> >
> > ath10k/WCN3990/hw1.0/blueline/wlanmdsp.mbn
> > ath10k/WCN3990/hw1.0/blueline/firmware-5.bin
> > ath10k/WCN3990/hw1.0/blueline/board-2.bin
> >
> > qcom/sdm845/Google/blueline/wlanmdsp.mbn ->
> > ../../../../ath10k/WCN3990/hw1.0/blueline/wlanmdsp.mbn
>
> Is there a specific reason why you propose adding a new subdirectory?
> Personally I find it confusing that hw1.0 directory contains the
> firmware files and then there's a subdirectory which also contains
> similar firmware files.

My main idea was to allow fallback at least for board-2.bin. I don't
think we should have 10 instances of the file (or load it from the
platform-specific location).

-- 
With best wishes
Dmitry

