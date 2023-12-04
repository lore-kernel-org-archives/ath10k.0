Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BC9C4167B
	for <ath10k@archiver.kernel.org>; Mon,  4 Dec 2023 13:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fW3mjZFFzwIx8dmT9JEHvadR6/J6k7n4MRMrtMRyEY=; b=LXLjp1kW24Fxpp+Kbna71tJ42m
	WxCPGMfV1rOuPT5iqeK2PViKgyPe8sWzh17J/Absc60/+WBqFQgRUU+jZxFGH4AtCVavdktJ7kClY
	AjrIOPZQ1rVD7pwixzFLyLF5e0bxZPC0REo+aNfxe7hV/g1UDdoo/lAVGecgjf8rvIuhWXVzIiS98
	2yMg1ZmwvwQ1fy4pnzXiyYFWv7kTd+XPg2X+DbITaRbg921vhkBW4xKp9ASTZJfYCFyOXrz4So5+s
	znhm0y625V4qXJ+FdGprYKA7zhiM0cgwp+zdaFRqd8Jc44uOamBNoOyrntOjGPcDfvAhHMgK2uvPk
	iNOv/vwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA8zS-004bxv-02;
	Mon, 04 Dec 2023 13:28:02 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA8zO-004btd-2L
	for ath10k@lists.infradead.org;
	Mon, 04 Dec 2023 13:28:00 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5d33574f64eso48010207b3.3
        for <ath10k@lists.infradead.org>; Mon, 04 Dec 2023 05:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701696477; x=1702301277; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2fW3mjZFFzwIx8dmT9JEHvadR6/J6k7n4MRMrtMRyEY=;
        b=SDZ+yovDu48YjvcwVIh00b3kzrI+v4Qv2ZPAKcEXJfZV/wQ5U/Kne8G/lmdwAiB5nu
         xZaoBhUAVo56f1HzZvsz500PFbVdsegsSc8cgk6LNM+t6XEeyWyOp7MY0eywl9E++Yes
         9W0Sl2rKQACPw4XQ5z2m0BFKN8qY67KpaJbzJyMA+Jp086Y94QfKrm7gwR5Np18qj2Mc
         1SidKPI/ax0mLF3B46fl4krZSi7kOINCE4sG3+R0565Kr7fS8hz19lR10NARXE1yXHbC
         g1XzhJ6wSDmKAf1+Pl/M5IxpNjoYiqh88KRnzXf1ocRJLpGastK6YEdlgdUVQuCtQt2n
         c5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701696477; x=1702301277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2fW3mjZFFzwIx8dmT9JEHvadR6/J6k7n4MRMrtMRyEY=;
        b=V+Y5fe5y9VM7vjdvtQLn6PDjDx2BS9GguEYG9er5ir/8QdTCje147vBIbZBNebq8ZF
         mFHVx77XANP7ceXf3x41A9TVUZyV7dOlUJkykhVAKZNkeNHG6Qv1NFTOVDjHBNu7umBR
         QMJULBLuR1Mcb1zzRTT+9ycEnHgqqHYR/D//jAl45JX0lmJr9m5GfCnb/LJKSzbinK+a
         yhm4XjXvGJwh7oqNr3YLhfTSzXXOjps7xMpoMfclsXXh6X/QfiSHKdMo4NKoXVi5vV69
         4YcOzphTfZVWF5AfNFEsEQasShrsf6Y8OemMRuwnnpIf/mgM5PoJUSnYdtERKv5yANXt
         /3qg==
X-Gm-Message-State: AOJu0YwDw0bLpuNNQfO7GtMyoPS/6npAZjKSJMsDC1uw4IOvTD/pIMKP
	Us3c2/caRZfvnfPdr2yaGE1vTtJZDnKe8oRk7trftlTl3C7QkbnXdvo=
X-Google-Smtp-Source: AGHT+IFT5Ekm/eux4m2CPF+K2InPLFR37b/4dxO3Ja+TBOqMeMVzDBImq2SVkNPbb6g1r6wIiJTMB7rV1scXEx5//MU=
X-Received: by 2002:a81:af14:0:b0:5d7:1940:b373 with SMTP id
 n20-20020a81af14000000b005d71940b373mr3543896ywh.63.1701696477097; Mon, 04
 Dec 2023 05:27:57 -0800 (PST)
MIME-Version: 1.0
References: <CAA8EJpp+SJpX4FFmcTm133KNtztTJH0ovTLRm0bftahPT8a1kw@mail.gmail.com>
 <87leaaqg7a.fsf@kernel.org>
In-Reply-To: <87leaaqg7a.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 15:27:46 +0200
Message-ID: <CAA8EJpomDw0sBOT_t5F33Uqn4FeWRBewv_=_4q4OzvU+JzXH-g@mail.gmail.com>
Subject: Re: ath10k / WCN3990: firmware-5.bin and wlanmdsp.mbn being out of sync
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_052758_803963_F62138F3 
X-CRM114-Status: GOOD (  31.85  )
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

On Mon, 4 Dec 2023 at 14:56, Kalle Valo <kvalo@kernel.org> wrote:
>
> Hi Dmitry,
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > I wanted to ask your opinion regarding one of the issues we stumbled
> > upon on the Qualcomm RB1 and RB2 platforms. These platforms use ath10k
> > snoc (WCN3990) WiFi "card". We noticed the following messages being
> > spawned on the console, which I traced it to the
> > ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL feature:
> >
> > ath10k_snoc c800000.wifi: chan info: invalid frequency 0 (idx 41 out of bounds)
> >
> > As a reminder, on this platform the wlan firmware and firmware-N.bin
> > files come separately.
> > The wlanmdsp.mbn is downloaded by the onboard modem DSP via the
> > tqftpserv request (which is served from the board-specific folder
> > qcom/qcm2210). The firmware-N.bin file is loaded by the WiFi driver
> > itself from the generic folder, ath10k/WCN3990/hw1.0. Current
> > firmware-5.bin file was provided with the sdm845's wlanmdsp.mbn, which
> > is older than qcm2210/qrb4210's wlanmdsp.mbn.
> >
> > I'm looking for suggestions on how to make ath10k driver load
> > firmware-N.bin file which corresponds to the board-specific
> > wlanmdsp.mbn.
>
> We have had similar discussions in the past but it didn't go very far.
> It would be so nice if you could finally fix this :) At one point we
> even had a discussion that we might need something similar for ath11k
> but it didn't go anywhere.
>
> > In particular I'd like to hear your opinion on the following proposal:
> >
> > Add the  optional property to the board DT, that specifies:
> > firmware-name = "path/to/wlanmdsp.mbn".  The property, if present,
> > will be used as an override for the firmware directory. So, while the
> > ath10k driver will not load wlanmdsp.mbn on its own, it will still
> > look for the firmware-N files in the specified directory.
>
> Back in the day I was thinking something like below, please let me know
> what you think.
>
> So the normal firmware path for WCN3990 is:
>
> ath10k/WCN3990/hw1.0/
>
> My idea was that if we could extend it for different "platforms" (not
> sure what's the proper term for this) by having platform specific
> directories:
>
> ath10k/WCN3990/hw1.0-platform/
>
> (Replace "platform" with a unique name for the platform, for example
> "acme-kv7" for a product from Acme with model name kv7.)
>
> Then DT could inform ath10k about this "platform" string and ath10k
> would then download boath firmware-N.bin and board-2.bin from the
> platform specific directory.
>
> And even cleaner if we could have the *.mbn firmware files in the same
> directory, even if ath10k doesn't access them directly.

We can, and a symlink from qcom/SoC/.../dir to that subdir.

So, for example, for Pixel-3, using your schema we will have:

ath10k/WCN3990/hw1.0-blueline/wlanmdsp.mbn
ath10k/WCN3990/hw1.0-blueline/firmware-5.bin
ath10k/WCN3990/hw1.0-blueline/board-2.bin

qcom/sdm845/Google/blueline/wlanmdsp.mbn ->
../../../../ath10k/WCN3990/hw1.0-blueline/wlanmdsp.mbn

This sounds mostly fine to me. My only suggestions is to change it as following:

ath10k/WCN3990/hw1.0/board-2.bin

ath10k/WCN3990/hw1.0/blueline/wlanmdsp.mbn
ath10k/WCN3990/hw1.0/blueline/firmware-5.bin
ath10k/WCN3990/hw1.0/blueline/board-2.bin

qcom/sdm845/Google/blueline/wlanmdsp.mbn ->
../../../../ath10k/WCN3990/hw1.0/blueline/wlanmdsp.mbn

-- 
With best wishes
Dmitry

