Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED9AC4167B
	for <ath10k@archiver.kernel.org>; Thu,  7 Dec 2023 14:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvaxDcD2mtxGeB3/2hAJCw3+15Dnjab0Oo7DQtO8neQ=; b=o1EBhmxrPmMgNi1WXTqXNWK6iT
	QLMpkcWRwmXd5koU8QhkSfoTf3pZgSsADVONEdeNpRKynaxgQJ/9jYSnPrHANa9Ar9JqCMJbzX3Yd
	Y9BS0xfZNOF3u4KIlfvTL/lcavLjjdna9NRhoiVgG/uhb1gdqNwd88d8xMAyjDB7WOLt0tmtY4a47
	NZQ8nxzFnhpyv+OQvfU+/QCXZAJF2sXsscM7wfFYLD20muPMGcZKKyp8Im/KTInJb5KD1dViLffpa
	VPNQAYYYHuqAV1wQvZQPq1BcmEZJVcwZ6nZDyt3VDjPP4hZcVcYAGYCtp+2QSJAYwlKafcnnCK8B7
	K3lmAzjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFnX-00D5TU-2t;
	Thu, 07 Dec 2023 14:56:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFnV-00D5Sl-0w
	for ath10k@lists.infradead.org;
	Thu, 07 Dec 2023 14:56:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DC6AFB8281D;
	Thu,  7 Dec 2023 14:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DA9C433C8;
	Thu,  7 Dec 2023 14:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701960975;
	bh=xvaxDcD2mtxGeB3/2hAJCw3+15Dnjab0Oo7DQtO8neQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Fxlo4tLXQB1/6Vd1prnwXiFJjkmMjgUjke7ZNmeE+e0vJOgchFSzJu2pTEG7zUTOk
	 4qV93lNUP/EBY9bFhIghtbasdqYAHYb3m5Rg4ZJJtOiuZ/HivWVJJ9TZu/OJfAvJ5X
	 JtTiqdFEzWnR3b5e7/npcoJo7SlK1fLuujBYL2Khf20tH8lpsx0xJKzdRpLdWVMur2
	 KsZozzmVbRuJndjd88uc0f0iMLE7v3+7o5IEC2na7yMrSwwXOFfCJGU4OPFn+z42fm
	 3b+FhZwkmSA4/u0gtSYhkaMBbrHRcrZzlr8kP2eqwrlHSGwqI1GUGKSpv//BRmOesg
	 joXFqkP55D0hw==
From: Kalle Valo <kvalo@kernel.org>
To: Dylan Van Assche <me@dylanvanassche.be>
Cc: ath10k@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  ~postmarketos/upstreaming@lists.sr.ht,  phone-devel@vger.kernel.org
Subject: Re: ath10k-firmware: WCN3990: Add board file for SHIFTPHONES SHIFT6mq
References: <55665952-c6ce-d097-d4b7-4cacd324eb06@dylanvanassche.be>
Date: Thu, 07 Dec 2023 16:56:12 +0200
In-Reply-To: <55665952-c6ce-d097-d4b7-4cacd324eb06@dylanvanassche.be> (Dylan
	Van Assche's message of "Fri, 25 Aug 2023 17:16:14 +0200")
Message-ID: <87bkb2njsj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_065617_472919_ED3A3148 
X-CRM114-Status: GOOD (  16.92  )
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

Dylan Van Assche <me@dylanvanassche.be> writes:

> I would like to include the board file for the SHIFTPHONES SHIFT6mq
> smartphone.
> This smartphone is manufactured by SHIFTPHONES and uses the Snapdragon
> SDM845 SoC.
> At postmarketOS, we run the mainline kernel on this phone so shipping
> this board file
> from upstream would be a great addition. Below, the questions from the wi=
ki:
>
> * description for what hardware this is:
>
> Smartphone with a SDM845 chip and a WCN3990 Bluetooth/WiFi chip.
> The WCN3990 chip is connected to 2 QM488xx radios, one is used
> for 2.4Ghz and the other one for 5Ghz radio.
>
> * origin of the board file (did you create it yourself or where you
> =C2=A0 downloaded)
>
> Extracted from the stock firmware.
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
> - WCN3990 hw1.0
> =C2=A0 + bus=3Dsnoc,qmi-board-id=3Dff,qmi-chip-id=3D30214,variant=3Dshift=
_axolotl
> =C2=A0=C2=A0=C2=A0 sha256sum:
> 082f65dad7b2ee938911d60a0f4f9ef8df18417ce69e9f42c9e947e961d18f30
> =C2=A0=C2=A0=C2=A0 md5sum: 5dce0c544a7a8036ebd4beaeba3d244b
>
> * attach the actual board file (board.bin)
>
> The name of the files are equal to the id string in the board-2.bin
> (minus the ".bin")

Thanks, added to WCN3990/hw1.0/board-2.bin:

New:
bus=3Dsnoc,qmi-board-id=3Dff,qmi-chip-id=3D30214,variant=3Dshift_axolotl

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 25 in total

https://github.com/kvalo/ath10k-firmware/commit/6b7eabe275dc87037f5aa782571=
91944a6809d63

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

