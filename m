Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80667C74A5B
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PyaSDI1Zlqx9dG+AHeP/lhZiuIOuaJN1hEge8oDZaCc=; b=j4KGKkyHeKzyEB
	Sen5G0+4xkwSl2RpZnZjf42b4INob/Vg5IUsy7s0b5B64zaDUvgXBcfm314fi+sfDXCbFnl5u+e0Y
	wDUK1AKIMJz4MJd/6mEuZdx1JnZSbe5wYaMPmDxHDuGG3maVTL7iYVppqxisIQshBqTmM0mYUNFOf
	utr4I05x/ZFwiJmD+JhzlxFYVBvZjHRHLJSsEU2yqOMIxmZ35XYRDo0gxigS8UwmQI0+VDdLsUWcQ
	SGBpPfZv8KFN6KCcCxa9BVpm+BpbNDViTtvsJdttbcXuFZ7NRFkfhScNOyw9TZpJzSHvCH7WumC5T
	KbrTWbUenmEkDjILWg8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Me-0024ch-18;
	Fri, 17 Mar 2023 11:35:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Mb-0024cB-2X
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:35:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3CC7162274;
	Fri, 17 Mar 2023 11:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5815C4339B;
	Fri, 17 Mar 2023 11:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679052912;
	bh=XRo7Vy9tx2dhMXbNuZWYF0STovTliFvFV+aMdx6Pv2c=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=L/tJzdfU5XxAKwv/F4QusqiK679zNVRMr7WYizaliOkS6JRC6Jh3wxV1XL64pukUB
	 1rtHUOsX8p803Q+yZ/7tJ0e6S2cnvpAeD5LfpW87vQZr9a1hB5p+QPZNYrJVCZ2cbE
	 GON3wP45BE2In2FdeYIO+JU/3uon1sOuHrS4fmXvxwYDj+sHK/JPQoShVdTnsY2JOk
	 IhekuLwjreS5cXkwtNJ3IZ9meH0iMi+NZXxZnNNxGP+w8DAnx6jUbw0uR6O6nJ/Cfs
	 mHyXw7Xyqu4FJpw2dW5AedGq3pWs7/z9l/2sJwV8v3Wo8fnt/wsCvslpD/J3QYUFZn
	 fo5DMLf3I7h0g==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: [V2] ath10k-firmware: QCA4019 hw1.0: Add BDF for Linksys EA8300 [1/2]
References: <4ac52436-699f-cd31-4538-a63ba37505df@gmail.com>
Date: Fri, 17 Mar 2023 13:35:10 +0200
In-Reply-To: <4ac52436-699f-cd31-4538-a63ba37505df@gmail.com> (Christian
	Lamparter's message of "Fri, 1 Jul 2022 13:25:13 +0200")
Message-ID: <87jzzflifl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043513_907459_0E8B9FDC 
X-CRM114-Status: GOOD (  19.61  )
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

Christian Lamparter <chunkeey@gmail.com> writes:

> From: Jeff Kletsky <lede@allycomm.com>
>
> This is a QCA4019-based device with a PCI-attached QCA9888
> supplying a third radio on 5 GHz. The OEM's firmware and source
> suggest that this device is "based on Qualcomm AP DK07.1-c1"
>
> Linksys ships four market-specific variants of this device, notated as
> -AH, -EU, (no suffix), and -CA. They supply four sets of pre-cal board
> files in their firmware, AH, EU, FCC, and IC. The corresponding files
> differ from each other, and appear to provide different parameters in
> the different regions. The OEM firmware copies the appropriate set of
> files into place based on examining the SKU of the device at boot.
>
> These board files may be obtained from extraction of the OEM firmware
> Ver. 1.1.4.191539, Latest Date: 11/8/2018, 49.0 MB
> http://downloads.linksys.com/downloads/firmware/FW_EA8300_1.1.4.191539_prod.img
> Ver. 1.1.3.184925, Latest Date: 11/15/2017, 47.4 MB
> http://downloads.linksys.com/downloads/firmware/FW_EA8300_1.1.3.184925_prod.img
> and/or from a running device. There does not appear to be a difference
> in the board files between the two firmware versions.
>
> DTS for the EA8300 under OpenWrt expects that the variant be encoded
> as, for example, linksys-ea8300-fcc, with the lower-cased suffix
> indicating the OEM's regional code, or -fcc.
>
>
> The files selected and their original names and organization include:
>
>          435d236890521515feffc834218ca594  OEM/IPQ4019/IC/boardData_1_0_IPQ4019_DK04_5G.bin
>          e8858ab9259f7d4372040da1c592d1cc  OEM/IPQ4019/IC/boardData_1_0_IPQ4019_DK04_2G.bin
>          d6d7ed00db985b4d8c48ccc3fe10fa87  OEM/IPQ4019/EU/boardData_1_0_IPQ4019_DK04_5G.bin
>          5cef8208a0345c1469494e44e1f370f1  OEM/IPQ4019/EU/boardData_1_0_IPQ4019_DK04_2G.bin
>          0e820f5946b5773ad9f4a74809c05b79  OEM/IPQ4019/FCC/boardData_1_0_IPQ4019_DK04_5G.bin
>          057ed5528e360197c2239796710cb61c  OEM/IPQ4019/FCC/boardData_1_0_IPQ4019_DK04_2G.bin
>          0171919a4576199ae88e8831f72c03fe  OEM/IPQ4019/AH/boardData_1_0_IPQ4019_DK04_5G.bin
>          a8e23769dc98da97b6c70a4f601ffca8  OEM/IPQ4019/AH/boardData_1_0_IPQ4019_DK04_2G.bin
>
>
> The files were renamed as follows:
>
>          for JD in AH EU FCC IC ; do
>              jd=$(echo "$JD" | tr 'A-Z' 'a-z')
>              cp -vp OEM/IPQ4019/${JD}/boardData_1_0_IPQ4019_DK04_2G.bin \
> 	    ${dest}/bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=linksys-ea8300-${jd}
>              cp -vp OEM/IPQ4019/${JD}/boardData_1_0_IPQ4019_DK04_5G.bin \
> 	    ${dest}/bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=linksys-ea8300-${jd}
>          done
>
>
> Renamed board files are individually attached to the IPQ4019
> messages. dmesg excerpts are from the device running OpenWrt with
> locally crafted, aggregate board files.
>
>
> - QCA4019 hw1.0
>     bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=linksys-ea8300-ah
>     md5sum: a8e23769dc98da97b6c70a4f601ffca8
>
>     bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=linksys-ea8300-fcc
>     md5sum: 057ed5528e360197c2239796710cb61c
>
>     bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=linksys-ea8300-eu
>     md5sum: 5cef8208a0345c1469494e44e1f370f1
>
>     bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=linksys-ea8300-ic
>     md5sum: e8858ab9259f7d4372040da1c592d1cc
>
>
>     bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=linksys-ea8300-eu
>     md5sum: d6d7ed00db985b4d8c48ccc3fe10fa87
>
>     bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=linksys-ea8300-ic
>     md5sum: 435d236890521515feffc834218ca594
>
>     bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=linksys-ea8300-fcc
>     md5sum: 0e820f5946b5773ad9f4a74809c05b79
>
>     bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=linksys-ea8300-ah
>     md5sum: 0171919a4576199ae88e8831f72c03fe

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=linksys-ea8300-ah
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=linksys-ea8300-eu
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=linksys-ea8300-fcc
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=linksys-ea8300-ic
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=linksys-ea8300-ah
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=linksys-ea8300-eu
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=linksys-ea8300-fcc
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=linksys-ea8300-ic

Changed:


Deleted:

8 board image(s) added, 0 changed, 0 deleted, 114 in total

https://github.com/kvalo/ath10k-firmware/commit/0c3378faf4622bea1d328e6e004f3972777f5ac2

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
