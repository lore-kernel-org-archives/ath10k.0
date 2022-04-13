Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7542EC433EF
	for <ath10k@archiver.kernel.org>; Wed, 13 Apr 2022 09:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmd1Ys6dXEMGOYJyvvm28PvV/k9v4i7X/kTr07JhcVI=; b=NL0GUYZrSM1Epr
	Lzggx3wp/9qV4rFRl3UfGAjx8HQ9uhOlaCfdv9Fi3mB5UeRNL+RQ1a+SBuMBCC7UOVpWsGk6yojTK
	oyNnr8fNL5gZUlbWXOzAv4hu0VmnNeD4g6/er7KQXbYgMZHuBvpE0DPazbd328Qfg4mXXyU0u3uBo
	JJ+LxYn3/+R9I44pu16xgsw3oH493D3ujmW7+RcjqaAHWVoI/F7MU+PjciDY+xBpJKj4np5QOcihd
	oy7dnkB9mQvt+vIX9Ul3SmGUuC/SThwjvDtGpfcFtcX5452L5vf+bqXU6uD03hWJOgmQMfHq/nUcs
	N7w0H8OienCpjl8ICftQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neYwq-000Da6-3i; Wed, 13 Apr 2022 09:06:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neYwo-000DYr-0X
 for ath10k@lists.infradead.org; Wed, 13 Apr 2022 09:05:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7883E61AC6;
 Wed, 13 Apr 2022 09:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B022FC385A4;
 Wed, 13 Apr 2022 09:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649840757;
 bh=leNCDTpAE5MifCADm9sf8x4gb1Dw5JYYr0vAm3CuUw4=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=eTZP8k8sbds+TvLCwQTeGTP8cJ4iJPMr9CIlwQmLpOaynoESdVnq5/Yf9XYxm2m7d
 ZMg2RKhnDaBNeLdUrjGEBnt3E8DaD9GKyB4iJROIVCUCX/DQxLPoLZ99ZFUVM1G1aQ
 xm0JBaSkaIA5gKv4Mgj8D3M28bhsEFHQeqJKQ4KOabhwY/p7w9sceuKjG+JCX+cwpg
 UpLG7XcioqZMIqilwcXDQSzcGB8bOSe3MmtYtEDsPIVP8/1L3DiIfndNPRX6PfJXSq
 PX3gn5PaV4SizMptlGXeu6+9eci0cJcOUbApdUra1pDOrPyE9eUCJuG+gS0F5OxetW
 e71d87rwjULQg==
From: Kalle Valo <kvalo@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019: hw1.0: Add Google Wifi BDFs
References: <YjaNGW252Ls/yDw8@localhost>
Date: Wed, 13 Apr 2022 12:05:54 +0300
In-Reply-To: <YjaNGW252Ls/yDw8@localhost> (Brian Norris's message of "Sat, 19
 Mar 2022 19:10:33 -0700")
Message-ID: <87tuaxl5e5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_020558_127839_D236A3B6 
X-CRM114-Status: GOOD (  18.98  )
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

Brian Norris <computersforpeace@gmail.com> writes:

> Hi,
>
> OpenWrt support for Google Wifi is under review, so I'd like to push the BDFs
> into the mainline board-2.bin.
>
> Per the wiki [1]:
>
>  * description for what hardware this is
>
>    - IPQ4019-based router, with two QCA4019 radios -- one for 2.4GHz (BMI board
>      ID 16) and one for 5GHz (BMI board ID 21)
>    - The Google Wifi product (notably, this is different than the Nest Wifi)
>      was originally released in 2016, with a codename "Gale". It was refreshed
>      in 2020 with near-identical hardware [2], using the same OS but a new BDF
>      and new codename ("Breeze"). I include both Gale and Breeze BDFs but have
>      only tested the former.
>
>  * origin of the board file (did you create it yourself or where you
>    downloaded)
>
>    - Pulled from the factory device filesystem (version R89-13729.57.27), which
>      supports both the "Gale" and the (very similar) "Breeze" variants
>
>  * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k) +
>    md5sum of each new board file to add
>
>    - QCA4019 hw1.0
>
>      BoardNames[0]: 'bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=GO_GALE'
>      BoardMD5[0]: ea35e78c88a8571201da8b75edc9b881
>      BoardNames[1]: 'bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=GO_GALE'
>      BoardMD5[1]: 44cbc4ca6cb7141ba4249615f7065582
>      BoardNames[2]: 'bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=GO_BREEZE'
>      BoardMD5[2]: b4ac055b3ab67d5a6f5607a96af39a1f
>      BoardNames[3]: 'bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=GO_BREEZE'
>      BoardMD5[3]: 8b26cb285032314247304114b8ac50e7
>
>   Variant naming scheme reflects that used by other Google projects -- using a
>   GO(ogle) prefix, an underscore (_), and the project code name, all in caps.
>
> Attached filenames match the IDs above, with a '.bin' suffix appended.

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=GO_BREEZE
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=GO_GALE
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=GO_BREEZE
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=GO_GALE

Changed:


Deleted:

4 board image(s) added, 0 changed, 0 deleted, 93 in total

https://github.com/kvalo/ath10k-firmware/commit/eec6f3922cee26ad4d512564dadc278893a71fe0

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
