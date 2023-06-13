Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C123AC77B7A
	for <ath10k@archiver.kernel.org>; Tue, 13 Jun 2023 08:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLT+LMlSoPUYUhRJ85WPCV+s/91a9ldX3a8vtoYSVSs=; b=FMUhdoErnn6ncm
	eoAEznl9LYqo3gcbN64X+YJwyDXX8VQa7RR2LluTWaWVRr/OlpNAlzBNDN0R67qMeTWGXaqcDVz0m
	+5MwVkLLFsz5kZUL1z7+OynqvLAFIJp5T+CpijIfoaFaEF38wVvdNJ8OWluNOrMXKyFMyrl897No3
	ZdXXElSH8sT/FW1AGjjeSNY3h493CDdnRAkLXPzPaoMkOav/PDgvdfhcl0Y4XGju3gghpeThNJ2h/
	j2EPD78cLtKmueY03DMp68C9gyBs2E81/BrzX3xQdKDhFIseN34VX8ynhHnE/ClQ+usp4CIIzXJUQ
	ejU3KEJ4RmPgBT68p/NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8z1p-007Jzh-00;
	Tue, 13 Jun 2023 08:05:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8z1l-007Jyt-2r
	for ath10k@lists.infradead.org;
	Tue, 13 Jun 2023 08:05:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CFEE863241;
	Tue, 13 Jun 2023 08:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8C0C433EF;
	Tue, 13 Jun 2023 08:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686643520;
	bh=CJ13lxVU4kUwKJ6tIfH9RGkQteXjNWRUv+H4oz9Iv7k=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=eM4+GZAghXw85du4eAMOWBJKwD8zR551JdlGNW96qNfuAv5+3iUSXlvMG1xJCVArl
	 np+hOj54rsywAcK+H4DfCEVRmRrio0aU/gh3z5Q/sFCJtm+Lm+ygrSX+n787gK0vuM
	 tietYOIbQdZZaFVRSqUXYanyodm8kOB+JXaxt5Fg8wQBX/44es2u4VJQJ8rbB7XqAy
	 6cauqX1OvRT+uIZpYsZf6Kc/kjXlOG/JORa4HpxEfTwhlu75OYih9RK4o+XNmUWA2o
	 4FUKand44luGp2pe0UrZxQ+DoRawNFqs2IHwPXXhkelNcNVIYOqiyfYyKFFT1tJVvP
	 QOOAMTw2m0nIA==
From: Kalle Valo <kvalo@kernel.org>
To: "Lukas F. Hartmann" <lukas@mntre.com>
Cc: ath10k@lists.infradead.org,  gary.bisson@boundarydevices.com
Subject: Re: Problems with QCA9377 SDIO on NXP i.MX8MPlus SOM
References: <875y7swixj.fsf@mntre.com>
Date: Tue, 13 Jun 2023 11:05:14 +0300
In-Reply-To: <875y7swixj.fsf@mntre.com> (Lukas F. Hartmann's message of "Mon,
	12 Jun 2023 21:59:36 +0200")
Message-ID: <87mt13eqit.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_010521_964469_97779EED 
X-CRM114-Status: GOOD (  22.28  )
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

"Lukas F. Hartmann" <lukas@mntre.com> writes:

> I'm trying to get the QCA9377 SDIO module on Boundary Devices'
> i.MX8MPlus SOM working with the ath10k mainline driver (from Linux git
> tip). Currently it can scan and see some APs and authenticate, but not
> associate (timeout). Several months ago I thought this was an SDIO
> signalling issue with the SoC, but I'm not sure anymore, because I fixed
> up the qcacld driver for the current Linux kernel and it works fine on
> the same system (i.e. I can rmmod ath10k_sdio and insmod wlan.ko and it
> works).
>
> I wonder if it is some kind of firmware/driver mismatch. I pasted the
> relevant dmesg output after my signature below.
>
> This is after I tried to build my own board-2.bin including bdwlan30.bin
> from qcacld-2.0-CNSS.LEA.NRT_3.0 (source:
> https://github.com/8devices/qcacld-2.0/tree/CNSS.LEA.NRT_3.0/firmware_bin/sdio).
> It gets picked up but doesn't seem to make a difference. I also tried
> assembling my own firmware-5-sdio.bin from qwlan30.bin and otp30.bin but
> this triggers a firmware crash (with register dump) when loading
> ath10k_sdio.ko.
>
> The qcacld driver works with that firmware, though.
>
> Any pointers on how to debug this are most appreciated.

Trying significantly older ath10k from an older kernel is something to
try in case there are recent regressions in ath10k.

I don't have an ath10k SDIO device myself so I don't know the state of
SDIO support in ath10k. Does anyone else from the list know?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
