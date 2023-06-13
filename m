Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F743C77B7A
	for <ath10k@archiver.kernel.org>; Tue, 13 Jun 2023 08:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXrQs2t/951IC7dJUGfORXJfJfoNUujiv67g1TAE0Fg=; b=urEESPwU/3XrLi
	7ovZe6DajFnXT/r4f/PGOzs5jNJkGpXpyO8iWsKf63PRXKmahVvshfIhYyM+yAkV6Z4/uipg6V2BA
	afAnFWXYWMaGh55qwC1kp/Je7I+18ODm5FF4ttkFc/muV+7Biw0Uc3cti78Ww2wN1peNshhGhEPud
	N5cQN+o8ckyi/6H9zGlHfAB+5GAjp592GSuD56zi1NELzVwZWdFrPaQEyewpWm7fFwd82WHWABcB5
	ZWW3Dz5+9HrxY+CTacT5Xvqf6MtLksFUMfIuKO0tWIL2MmVfbIidvi1odO15VBu5Fj0Zyt8JhY353
	M1qe1chgKyj/rwiPP3gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8zM0-007Mte-1d;
	Tue, 13 Jun 2023 08:26:16 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8zLx-007Mrx-1f
	for ath10k@lists.infradead.org;
	Tue, 13 Jun 2023 08:26:15 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f8d176396bso1463795e9.2
        for <ath10k@lists.infradead.org>; Tue, 13 Jun 2023 01:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686644769; x=1689236769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H+stmKTJJ1zKKsAXZHeRQmco5p+1rIdj4b4TWRazF9k=;
        b=HkUc+WikQcsmK9A5wvdvN4v8PNFsvEoV3VkB5dbmO96LFuFjJ2O6YpADaCCs6HiQ0i
         fs3T36te1TqPS6kxz2vKXnwooQIs9utYjEhd6jK4pxodHaAEe0X8RyHySuRg6GDS7bRs
         cOEJBf/xbKIMY4SssX+GJXVy6leZHt6/3mCGYWI+N8seKS5qVuXaOHorseNNsE3YwCuC
         GzOX0PSDIgCtu5TStMNT0bg4WuaTcvjF+GCgv+vgIWUhKah84yOKqFXQ9+DV9KthKhzs
         IXoF9GAYb0wxTxqbkl8xVXdjd6AvHZC0AxjrbN/wB8WWGhyJ8Ks/Sqk/NlNv5wQVWrcT
         ZIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686644769; x=1689236769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+stmKTJJ1zKKsAXZHeRQmco5p+1rIdj4b4TWRazF9k=;
        b=cwJYdiqRW8w9h3edJhU29rSJmdvoChm82mIFNHHwkKvUgWfjwhLRdTGeyBhNOYHR+J
         GEONPNZCpdQrmkK9JW3+j8zSxe1lrphBI02eackBHFpUvCG3lSJZdwJR+8QOWTVWG4Bd
         dkK780XBWq6poVLwjq3ZZ7xHiXX9+lGegqb7yVnGaWK7+PUTAqOHgzriABcwRrMQQ7Nr
         gZ18C5hUsoqcsvqjMBX2qm/0vWZw5x1E8+KO+vroypJmrp09h8xxu/W3SkU1HTg+7gFy
         IqznhPED8BIhxADpfRrgYtBPiyxQER3F/ocfsZPtlmScOVgKSa1vEX5kMW3vr+ccvK41
         ZbAQ==
X-Gm-Message-State: AC+VfDxkcIzYZI89PPtj6unfeGyMmXUGbMysEeOHlDiwGP8wmJGsxhjK
	w8LEtsoEDV5GRY/jGyjS1kw=
X-Google-Smtp-Source: ACHHUZ6CN1I3Jyy5GDSFGBT8ttbc1Ecce/p3m7t9Lkrr8pRa11BdBALLEUCGQBkTd74jAp87QISTiA==
X-Received: by 2002:a7b:c84c:0:b0:3f7:2d7d:c673 with SMTP id c12-20020a7bc84c000000b003f72d7dc673mr8154219wml.14.1686644768691;
        Tue, 13 Jun 2023 01:26:08 -0700 (PDT)
Received: from p1g2 (2a01cb000fac0c0088f09ee77063439d.ipv6.abo.wanadoo.fr. [2a01:cb00:fac:c00:88f0:9ee7:7063:439d])
        by smtp.gmail.com with ESMTPSA id s2-20020adfecc2000000b0030aed4223e0sm14513307wro.105.2023.06.13.01.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 01:26:08 -0700 (PDT)
Date: Tue, 13 Jun 2023 10:26:06 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: "Lukas F. Hartmann" <lukas@mntre.com>, ath10k@lists.infradead.org,
	gary.bisson@boundarydevices.com
Subject: Re: Problems with QCA9377 SDIO on NXP i.MX8MPlus SOM
Message-ID: <ZIgoHqP8gk5wdP8A@p1g2>
References: <875y7swixj.fsf@mntre.com>
 <87mt13eqit.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mt13eqit.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_012613_549746_35108EF4 
X-CRM114-Status: GOOD (  33.26  )
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

Hi Lukas & Kalle,

On Tue, Jun 13, 2023 at 11:05:14AM +0300, Kalle Valo wrote:
> 
> EXTERNAL EMAIL: Be careful with attachments and links.
> 
> "Lukas F. Hartmann" <lukas@mntre.com> writes:
> 
> > I'm trying to get the QCA9377 SDIO module on Boundary Devices'
> > i.MX8MPlus SOM working with the ath10k mainline driver (from Linux git
> > tip). Currently it can scan and see some APs and authenticate, but not
> > associate (timeout). Several months ago I thought this was an SDIO
> > signalling issue with the SoC, but I'm not sure anymore, because I fixed
> > up the qcacld driver for the current Linux kernel and it works fine on
> > the same system (i.e. I can rmmod ath10k_sdio and insmod wlan.ko and it
> > works).
> >
> > I wonder if it is some kind of firmware/driver mismatch. I pasted the
> > relevant dmesg output after my signature below.
> >
> > This is after I tried to build my own board-2.bin including bdwlan30.bin
> > from qcacld-2.0-CNSS.LEA.NRT_3.0 (source:
> > https://github.com/8devices/qcacld-2.0/tree/CNSS.LEA.NRT_3.0/firmware_bin/sdio).
> > It gets picked up but doesn't seem to make a difference. I also tried
> > assembling my own firmware-5-sdio.bin from qwlan30.bin and otp30.bin but
> > this triggers a firmware crash (with register dump) when loading
> > ath10k_sdio.ko.

As far as I know, the ath10k driver only supports (deprecated) LEH
firmware [1]. That is information I got a long time ago and I can't seem
to find the email back. But basically what I was told is that the LEH &
LEA firmwares had different frames format to exchange data between the
host and the chip, therefore drivers & firmware have to match.
And at that time I was told that ath10k only supported the LEH firmware
for SDIO, which is why we haven't invested much time on it as LEH
firmware is 1) old/deprecated as qcom hasn't updated it for 6 years now
and 2) it contains bugs affecting the performance in our case (diversity
not working etc).

Since I don't have the insight info about the LEA vs. LEH firmware
behavior I'm afraid I can't help much but at least I would say that
trying LEA firmware on ath10k driver is expected to fail (timeout).

Maybe Kalle have more info on the matter and maybe the above doesn't
apply any more and ath10k has evolved to support LEA firmware.

> > The qcacld driver works with that firmware, though.
> >
> > Any pointers on how to debug this are most appreciated.
> 
> Trying significantly older ath10k from an older kernel is something to
> try in case there are recent regressions in ath10k.
> 
> I don't have an ath10k SDIO device myself so I don't know the state of
> SDIO support in ath10k. Does anyone else from the list know?

FYI we have a branch in our repo with the firmware that worked on ath10k
at some point [2].

Regards,
Gary

[1] https://github.com/boundarydevices/qca-firmware/tree/bd-sdmac-qcacld
[2] https://github.com/boundarydevices/qca-firmware/tree/bd-sdmac-ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
