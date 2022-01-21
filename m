Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2A9C433EF
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 14:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IBVcdum56KZ5/t7gz10HgvLfc7uTPBrQLXjGw9cQbo=; b=ub22vPeq6QsUoB
	6BSovIiwQlEwIWiS8NjSMssEy89e4MXDyqBT1qE1tSPYTWUOutna4FX3EXz3KOTLZI/XOs9tGcAHV
	uKdGmMvpSUwH9F8ZT2nzUA6cbIUxRl64NyZ+XNtEl4UMX3Rl3X950GXugPGKEG7U+RpEhBYTHfRX+
	v/sBtYNq+mL8y0MZhrk00I+WcRW4tdhhQOA6lUSsaHyDz3sh294VcW1u0+LCPqF4WePoF0TqfuOGN
	kn6Rwc/e3qr7EqgJF/mF7fJw+JU/7dG87mKtpNTht63hf+LCi2EkmaPtl2aY6bwDfgvD09nxw+beC
	lty7Q8/NsXyDaS+RMgYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuTH-00FGiz-7E; Fri, 21 Jan 2022 14:00:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuTE-00FGiC-0S
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 14:00:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BE476B81FC5;
 Fri, 21 Jan 2022 14:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22B3C340E1;
 Fri, 21 Jan 2022 14:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642773649;
 bh=4B7ivUGPVURovXWqSkZIyRAU6uzMBC5pRxBxrL1sfJo=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=u7GKZZMaIP9CgMummej22+wG4kTu/oI2oyjLy/ed611MZIaf4F1SF80P1qTU/UyW9
 Uwzex5iJyPl1X8scX6xy/ZcYrRSIp2h32aMNMaGY7oc/0ANZY6GBXpywaWxKyuqlxU
 rxjQeS9EuCtwPOJHxMwu3KoWcJRxsWoj1UwUHtsCZCXXQ+RIxvBJVdziZZM9CrsRi7
 1ax/KtmKQmTml/LmtzOAJzZp8yKpe+GGGeHKKmyX75Ul9BGQpgJbcxNV+Akb9SotpN
 V33CWXb8KUOr7zI+c7o6U2BjcRdxUedJRz/Qe9REadg6mvG0gvfitE8ubYRz5YPm9G
 UAIk8578dFnSA==
From: Kalle Valo <kvalo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA9888 hw2.0: Update OpenMesh A62 specific BDFs
References: <2415801.IdI8GFFNdC@bentobox>
Date: Fri, 21 Jan 2022 16:00:47 +0200
In-Reply-To: <2415801.IdI8GFFNdC@bentobox> (Sven Eckelmann's message of "Mon, 
 01 Jul 2019 11:43:02 +0200")
Message-ID: <87h79xb33k.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_060052_209527_62F8F0C1 
X-CRM114-Status: GOOD (  23.41  )
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

> [resent of mail from 2019-06-11; seems like @datto.com mail server ate the
>  outgoing mails]
>
> Hi,
>
> The OpenMesh A62 AP requires three special BDFs to get the Wi-Fi PHYs working 
> (correctly). The  bmi-board-id='s would clash with one of the the IPQ401X 
> AP-DK boards because QCA doesn't provide special IDs for customers and seems 
> to use the AP-DK board-ids in the wifi firmware to change its behavior. This 
> request contains the file for QCA9888. The QCA4019 one will be submitted 
> in a different request.
>
> This update contains:
>
> * add of the antenna gain
> * adjustments of the antenna sensitivity (see configAddr)
> * CTLs for DFS channels
>
> It supersedes https://lkml.kernel.org/r/1573300.yjC3Zj7d1F@bentobox
>
>
> Now to the questions from the wiki page [1]:
>
> * description for what hardware this is:
>
>   - it is a QCA4018 based module (based on qcom-ipq4019-ap.dk04.1)
>   - one QCA4018 radio is used as 2.4GHz radio
>   - one QCA4018 radio is used as 5GHz radio
>   - an additional QCA9888 5GHz radio is attached via PCI
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - it was created by the ODM and QCA for the OpenMesh A62
>   - was provided by the ODM to OpenMesh for this product (this includes
>     distribution)
>   - it is the latest release from 2018-11-28 (with fix to have
>     antennagain at correct position)
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA9888 hw2.0
>
>     + bus=pci,bmi-chip-id=0,bmi-board-id=16,variant=OM-A62
>       md5sum: f8ed39484f5e86d16b6a4377ce8a5243
>       
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA9888/hw2.0/board-2.bin:

New:


Changed:
bus=pci,bmi-chip-id=0,bmi-board-id=16,variant=OM-A62

Deleted:

0 board image(s) added, 1 changed, 0 deleted, 7 in total

https://github.com/kvalo/ath10k-firmware/commit/75d699b3ffb9472e57603ff028bd2883397368ba

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
