Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9839FC433F5
	for <ath10k@archiver.kernel.org>; Wed, 13 Apr 2022 09:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ayveqcj85H+Z+pNmfHsabAL3tQfzNrP7Fjy8Kw7/9+I=; b=HkI6V3IwFjGwCF
	qzBnWjBXnTyT2f+DjRhfznycDgws91Zykn5Dw/3H/Ki4XOyfjqNVVswHMMtk1VH/b+T/D1kA0av/1
	iqutrklH5P5xkGmDsfbXjcPQSIee+c+kb90/qmZM2jBbCQV3XjE2jJ0k2Ep1XK+DmBbwR9G0BL/3U
	4Wu4VoRy92Hm7ukMtaDXKnFD6EpisRx7Yd+17Ix21rLu1eiFAplk0YUgGBUbkc1jbNiCfOXaOslkL
	Ox3GURJVJlgingHsbGXqO4hB4KyRBWUqZITMTrP7OM3WZ4CzGvI/z/h8ua4rjLiIFs+V32NFWgung
	QiCc7jGprp7i3F7iNruQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neYv6-000DHY-RO; Wed, 13 Apr 2022 09:04:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neYv3-000DGr-HS
 for ath10k@lists.infradead.org; Wed, 13 Apr 2022 09:04:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0891FB81AB3;
 Wed, 13 Apr 2022 09:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAE8C385A3;
 Wed, 13 Apr 2022 09:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649840646;
 bh=vc95Ucaf3AWbJCZ9vT2y9hEsnUDol9kVmrls2iQ0snU=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=DrNl6Xe7MgUKB6i24f2qEKnrVPnkj0q4TlAZEwpJR58PEVuRRaP7YdDgyImIN65u5
 IlSsb41FiXjdavgHQ44UUcc4qcaSEz6+RuJhOsR6ypVagSjZmwrDdZdflgwIFd+6ov
 FRrwKEwwihUnQIS3bbf4yjZJgWlEDbV5rEkKNPCWnA5m2rjm78/IWzaYnfbpIMx+H1
 hMIMChU5DbhDlBsrD/CoTo43JHO5MwWcyliyzm0mPlVSE8N5tgAD3ivdLSu/GnCSCP
 wE5aDlti3EQzBrJ9MW9ygZWeZFVfYiysVQWvq5yPQ9zJlVlYoOFf7J6no6t/WEtknp
 OoPCEugJJExTA==
From: Kalle Valo <kvalo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Update Plasma Cloud PA1200
 specific BDFs
References: <2931430.FNKZsP7sFK@sven-l14>
Date: Wed, 13 Apr 2022 12:04:04 +0300
In-Reply-To: <2931430.FNKZsP7sFK@sven-l14> (Sven Eckelmann's message of "Sat, 
 22 Jan 2022 09:36:12 +0100")
Message-ID: <87y209l5h7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_020409_741381_A60DE58C 
X-CRM114-Status: GOOD (  19.90  )
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

Sven Eckelmann <sven@narfation.org> writes:

> Hi,
>
> the firmware 10.4-3.6-00140 crashed [1] when the 5GHz of the PA1200 was 
> set up. It was noticed that this is somehow related to the option 
> baseEepHeader.nonLinearTxFir which was set to 1. There was no feedback from 
> QCA and the manufacturer about this problem. So as only known workaround (with 
> the latest firmware), this option was set to 0 and the modified BDFs were 
> integrated in OpenWrt [2].
>
>
> Now to the questions from the wiki page [3]:
>
> * description for what hardware this is:
>
>    - it is a IPQ4019 based board
>    - one QCA40xx radio is used as 2.4GHz radio
>    - one QCA40xx radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - the file from ath10k-firmware was modified by setting the 
>     baseEepHeader.nonLinearTxFir to 0 to work around a crash in the ath10k-
>     firmware
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - BoardNames[0]: 'bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=PlasmaCloud-PA1200'
>     BoardLength[0]: 12064
>     BoardCRC32[0]: b587e755
>     BoardMD5[0]: 4129d301ee1a697af1fa311afcad6f87
>   - BoardNames[1]: 'bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=PlasmaCloud-PA1200'
>     BoardLength[1]: 12064
>     BoardCRC32[1]: 680fe0ec
>     BoardMD5[1]: 928c27310acfdef356ce6d6a5cdfc1f2
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:


Changed:
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=PlasmaCloud-PA1200
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=PlasmaCloud-PA1200

Deleted:

0 board image(s) added, 2 changed, 0 deleted, 89 in total

https://github.com/kvalo/ath10k-firmware/commit/648cebaa3ff588ca5de0a13cf3ca772a95813668

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
