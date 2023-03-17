Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97ECC74A5B
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLTUM8qGj5NBikm6fijGDzJv2J1f0j891preRFu24lw=; b=F7vLI7zKbwMSSI
	7JkziOECOsUyNZ7eWoSf7xAtnXkUdPJ9hiFQKJl+K83Yeaww6GbVqfRKY17bEXFTqZBqS8YE+hYtc
	fPIGEBNn7NSTrEuCU5jklLqJeU6M78n+O3/7JM5uLZuXp5YU5giqqRd2w4nRVy4tQfV5bbOzFACHc
	UWn/1R3TdJyWz22bjN9HHfBu5LUGlWtkXNe1THeeUnnx80fqD+qZ94s22X+ZjP3+kP7zjmiUzuqYi
	mwfeFbBgZbP2jmpstB0xf2XYQL0LqleuJWyqZ0rPaCvprCsxbJ6c6DKVoq7etQCScxBzuHNi4pDPH
	C8PgCejjTKM6wGJTYFxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8aP-0027lI-2n;
	Fri, 17 Mar 2023 11:49:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8aM-0027kn-2O
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:49:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F33EB60EA0;
	Fri, 17 Mar 2023 11:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5052C433EF;
	Fri, 17 Mar 2023 11:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679053765;
	bh=MK47VvMX4sX4IbSRvIazmeTA+bCXr7HU9qYl1Dl9XNc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=NnCuWXdhwb4eLmDmN4uxm2TSEddl59AGqmINDvk/vNg08zxJs6Y6baX5SapJM0vn2
	 mmFJpcDERIT+5mwUrZz0L4epGFw2vF2O/+HbNbEWYvpl6MJAJUw44Vx3mUw5NnjHGr
	 Xo2+8qjDzLZwuWTp/28aHsKsnm2wwETWsIAXAaNmKynx8Hp5YQAdvaylAgruQ7fNeK
	 dasmiUCtkHGfqSRWT7rXTW2VrE6w9fehHQgrB5+r6KOlT2r2Rhh0HSdNCHUl+mljGR
	 Aju2AeqAivd4uK65UwJRK+ZIN6ZwxZ3ZGt1HO2R+Fa4FVqRJ6+bBqy495nwVmdpVl2
	 Pa3IDaERKonFQ==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: [V2] ath10k-firmware: QCA9888 hw2.0: Add BDF for Linksys EA8300 [2/2]
References: <35f7ccc8-9669-966a-516c-d7754d243d02@gmail.com>
Date: Fri, 17 Mar 2023 13:49:21 +0200
In-Reply-To: <35f7ccc8-9669-966a-516c-d7754d243d02@gmail.com> (Christian
	Lamparter's message of "Fri, 1 Jul 2022 13:25:15 +0200")
Message-ID: <871qlnk37i.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_044926_848072_1DC1175C 
X-CRM114-Status: GOOD (  19.20  )
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
> This is a IPQ4019-based device with a PCI-attached QCA9888
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
> Two similar messages will be sent, one for each chipset, as per the directions.
>
>
> The files selected and their original names and organization include:
>
>         27d9dfe1e86c3befe808f89dd3cd105b  OEM/QCA9888/IC/boardData_2_0_QCA9888_5G_Y9690_SBS_HB.bin
>         7f2f0de6c0fb2df1d642895d8233d3ef  OEM/QCA9888/EU/boardData_2_0_QCA9888_5G_Y9690_SBS_HB.bin
>         62049f88a498e51870973143e376e7af  OEM/QCA9888/FCC/boardData_2_0_QCA9888_5G_Y9690_SBS_HB.bin
>         27d71485fc4987bc1c11b7744c373b59  OEM/QCA9888/AH/boardData_2_0_QCA9888_5G_Y9690_SBS_HB.bin
>
> The files were renamed as follows:
>
>         for JD in AH EU FCC IC ; do
>             jd=$(echo "$JD" | tr 'A-Z' 'a-z')
>             cp -vp OEM/QCA9888/${JD}/boardData_2_0_QCA9888_5G_Y9690_SBS_HB.bin \
> 	    ${dest}/bus=pci,bmi-chip-id=0,bmi-board-id=23,variant=linksys-ea8300-${jd}
>         done
>
>
> Renamed board files are individually attached to QCA9888 messages.
>
>   - QCA9888 hw 2.0:
>
>     bus=pci,bmi-chip-id=0,bmi-board-id=23,variant=linksys-ea8300-eu
>     md5sum: 7f2f0de6c0fb2df1d642895d8233d3ef
>
>     bus=pci,bmi-chip-id=0,bmi-board-id=23,variant=linksys-ea8300-ic
>     md5sum: 27d9dfe1e86c3befe808f89dd3cd105b
>
>     bus=pci,bmi-chip-id=0,bmi-board-id=23,variant=linksys-ea8300-ah
>     md5sum: 27d71485fc4987bc1c11b7744c373b59
>
>     bus=pci,bmi-chip-id=0,bmi-board-id=23,variant=linksys-ea8300-fcc
>     md5sum: 62049f88a498e51870973143e376e7af

Thanks, added to QCA9888/hw2.0/board-2.bin:

New:
bus=pci,bmi-chip-id=0,bmi-board-id=23,variant=linksys-ea8300-ah
bus=pci,bmi-chip-id=0,bmi-board-id=23,variant=linksys-ea8300-eu
bus=pci,bmi-chip-id=0,bmi-board-id=23,variant=linksys-ea8300-fcc
bus=pci,bmi-chip-id=0,bmi-board-id=23,variant=linksys-ea8300-ic

Changed:


Deleted:

4 board image(s) added, 0 changed, 0 deleted, 16 in total

https://github.com/kvalo/ath10k-firmware/commit/82f428f4bb780b3462656be8e05ba7bd8052c658

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
