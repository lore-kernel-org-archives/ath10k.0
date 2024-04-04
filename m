Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A38CD1299
	for <ath10k@archiver.kernel.org>; Thu,  4 Apr 2024 13:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJzdwgYqSiXBG2wAbt+70V3f0hLZ0hXphRY5qJD39hQ=; b=U244FPSe0xS0QAkc+bb1l0ZO3a
	Syul/LHlQzNTEgko2Yn7BzsY9Fl69AN4+4twoIIaG+pgk/nSaeuiwPyqAh/zpYQuy2MELUjj3rJXd
	uktvjQyaSFhWaUNj086q9APmzjZ/2A6s5zGE8fnAuckzeYe8q5Rh/LmbJ/cO+AcT3l+nYpe67Avs4
	A6s4xdhyRAHMVsehkIWwZfhjVrbkckZUxAPl+pjqiOQgZ1YnMnGXMnNBi83owXgPrGYybeQ3FAUAT
	4Wj12Kd8H+WCdwkM3n//GRxqfMzbJDIujyasF14ZPsGyy5t6qVblPwEteRmuHKi82ldYEM5qYVlcv
	MIXzYCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsMle-00000002kon-36HD;
	Thu, 04 Apr 2024 13:04:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsJRw-000000021wr-2RaE
	for ath10k@bombadil.infradead.org;
	Thu, 04 Apr 2024 09:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QJzdwgYqSiXBG2wAbt+70V3f0hLZ0hXphRY5qJD39hQ=; b=PfcJ6l/P0DeN3EQC2tQ/nJ6blS
	QiyWehbGrfoCVs9ZQCSYNAiE/NOPs1nrd2JhHBXDRyAI57BQ3Ftfu0upHleo8v7IhzpqPZatWuzPJ
	t92icCSgsPY9N9GCt9PkDfuOPrFmzh1TQD17BPPrlNTx2K0e7eQz22MNuk7MZ5mR7Kq9tUA7+ttLo
	JJn5/pWGhvhaacDadBhzRYHKcycwLSvyVaF6XH3limE6/LuKuqQn7F3TUVsjSP+pyY2StE3AHCfXu
	3xio7zTxs4+mFfKRTvu92Y3+W65SRq1YAZ2aX7x4nnJ3CWhWVQtJMR2eiAC2hMdGpkKCzshNe22Hh
	lSiuUC5g==;
Received: from mail-yb1-f169.google.com ([209.85.219.169])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsJRa-00000004tjI-0OOy
	for ath10k@lists.infradead.org;
	Thu, 04 Apr 2024 09:31:51 +0000
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dd14d8e7026so757827276.2
        for <ath10k@lists.infradead.org>; Thu, 04 Apr 2024 02:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712223091; x=1712827891; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QJzdwgYqSiXBG2wAbt+70V3f0hLZ0hXphRY5qJD39hQ=;
        b=zc/kZiUY93GsKWMF/62TB5FDeJvLowiJcNNtjrDiVbh9coJnWG6my2pbNtlOsOetD/
         lbdMsNDHunbtZnbkQeP31q1doSdkP2GuuKLQJZdXx9Uw9jqesltBFxBrWpR7A9QtQ4ze
         4Plx/mnBgFcAlem9JbKLq+pfhi+jIAddrVPgGr+MvRxHZtTLQZL+uFA3kq6K2wdTV6JD
         1LzztWX2Q/onKTDtrP2dIPS+ar0u2xlTv9CEa+6+7aI2w3SMljSvG7lkFi3eQI3GZaay
         PaWYaLZvutFqAM7dV6AVCUmtT5aHcLkuZn8hHEwJx4QXC/PmGQsCddlaJ6xlRlQBwp9Y
         GRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712223091; x=1712827891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJzdwgYqSiXBG2wAbt+70V3f0hLZ0hXphRY5qJD39hQ=;
        b=sGV/cj9Jx3bwbEqftRC1pmoZ2c2rKqW7k0CumURuwEmkUatzUM9iZSfR4hq62neK66
         2+5nG1ZK54VJXJWOGEbYRiVvPvE0Xt533rlZeBHMGsBRYtzv7GqVM9GsH34hhxTj5Nz7
         kHyFO1S04n4GlRJs0lHiyUbDwCi25I1j5o/WPI/fPbdwluol7ycVOu99dujpBTIuH2Ux
         og/Xtojbt9xWgJpFvYY7KDlMj7C6CQjc9CZlXA47vEFICyvnk4Aj5mV9192KrVxgN4U9
         gGOtI/c8SEExVtTx7o5RKKzhHWFWsyhgjh+nvv3McJoTZXzvPERd8F7DKWnPMlkn2e+g
         MFTg==
X-Forwarded-Encrypted: i=1; AJvYcCXRJg6URDRx9fBQIETOSoJdC1JJkdglAm4DKxT39byKj0rmpB6r3UrRXm1wy1bB6j3qD7mMsdS90FraXrlxBGwVAmltFYoutaFFbQ==
X-Gm-Message-State: AOJu0YzNlKSWgEE3v7lmT7VjebLuO6LevXn2SXnPdCOJN0MsBNEMVS+B
	AAFrU0oO0/LA9Bt1F969InGJaZOFhMm6Dx899X5APtooUC7Z5XpmmGme1p9jFco7WgnpPNbPUcV
	UrpbvVuxCszvPkMnIJUzt6hPNnsV2ud+sRsijpw==
X-Google-Smtp-Source: AGHT+IHTXtbKZV4PRrgxvlL/R1tUqcSFTjPcwK6//feDtYUO9NjrShijYYET6/+oeV22B9HIEQVjv5iZuw/cw+hBGTs=
X-Received: by 2002:a25:ac04:0:b0:dc7:423c:b8aa with SMTP id
 w4-20020a25ac04000000b00dc7423cb8aamr1828891ybi.12.1712223091503; Thu, 04 Apr
 2024 02:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-module-owner-sdio-v2-0-ae46d6b955eb@linaro.org>
In-Reply-To: <20240403-module-owner-sdio-v2-0-ae46d6b955eb@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 4 Apr 2024 11:30:54 +0200
Message-ID: <CAPDyKFodTh-KN+=b1B3V+7aNEoR0SPo5-xjFaWu=gYEtsDy1pQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] mmc/wifi/bluetooth: store owner from modules with sdio_register_driver()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kalle Valo <kvalo@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Arend van Spriel <arend.vanspriel@broadcom.com>, 
	Brian Norris <briannorris@chromium.org>, Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>, 
	linux-mmc@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_103140_865748_93E7E4C0 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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

On Wed, 3 Apr 2024 at 16:17, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Changes in v2:
> 1. Add "wifi: ath10k: sdio: simplify module initialization" patch, from
>    my other patchset to avoid conflicts.
> 2. Add Acks/Rb tags.
> 3. Drop applied SDIO patch, which was the dependency for the rest
>    cleanups.
> 4. Update subjects according to feedback.
> - Link to v1: https://lore.kernel.org/r/20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org
>
> Merging
> =======
> With Acks from Kalle, please take entire set via mmc/sdio.

The series applied for next, thanks!

[...]

Kind regards
Uffe

