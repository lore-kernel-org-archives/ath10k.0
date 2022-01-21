Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7149C433EF
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfnqwUa/UernQJgA/Hal7RpW4uYvhKk5FKlByg1mq9w=; b=qyasY6KhCfZBOY
	K2xF01o0RPt3NIbR0ceAsHSJwHR13kEpDVisKN1OdnmD8QYP9G3sqM/xxlZngk6GakZoIU1lpheR+
	/q69kYppoODF1TCxfVc2cTcA/pe6xqYUxjKjoVrqVtwjfC92l/z+u2DGYpa9kb2nSkgw+UN6Cr6xi
	nK473V3lICqDHDZKp2QwzIyZy9rxxt8L7gRLUHcm7M6FV5o87VjIkKGvP2FWnenyUf+Zw78i9sOHq
	2Kxa5sSjEX4ij1jhSJ7wswZ/zHtLHc8T4AOrt6RgFqc80h7vaCuPhFsgcOS5vwivgIBxftMKTTjfq
	usjdZBFnrjncyfUnx+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAtsY-00F7Vk-A5; Fri, 21 Jan 2022 13:22:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAtp0-00F5uk-29
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:19:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 88EF3B81FAD;
 Fri, 21 Jan 2022 13:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44E7C340E3;
 Fri, 21 Jan 2022 13:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642771155;
 bh=ySYLHkjbLdNi1B9RgEqdxQzC/EotDSdmImy1Z3qCiPs=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=Zgh61nuHj/3ksok/C2OH/Yw+8RRA/4H4sDQ4L7gGFDyqGPLI2igI0s5WNf1Zh/RDp
 JtxBYlezVZ1AiQ5HCGL4Mebc9QQINXtv106y2HMxS5z3p2+8JMzW+igtJMEOQSQGQB
 gBn7ld1V3flbwOgozsIQtpdS/1lRrBQFUq1JkMIRj5LGmT8mgv8jXSX4Xm1pbLkzOm
 RJpX6yb2gbcgpR4Px/XGIDbvcW9rqrHs+tdVoEheRsOj2uTt5P+E79N1lbWfsvka5Y
 ZYU+M9SiXbV140yh6/w3rgajdlrFmS7zCsAijZ68pJLywDgt9G6nE0YruhtpZ819nW
 QlfEtn39bj9KQ==
From: Kalle Valo <kvalo@kernel.org>
To: <frank.shen@senao.com>
Cc: <ath10k@lists.infradead.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add EnGenius EMD1 specific BDFs
References: <5DD5DD3C954B284B8B00D292B7482C300102DD500A@snex01.senao.com>
Date: Fri, 21 Jan 2022 15:19:12 +0200
In-Reply-To: <5DD5DD3C954B284B8B00D292B7482C300102DD500A@snex01.senao.com>
 (frank shen's message of "Tue, 17 Sep 2019 09:55:39 +0000")
Message-ID: <87czklfcq7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_051918_316483_D25E90AC 
X-CRM114-Status: GOOD (  15.70  )
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

<frank.shen@senao.com> writes:

> The support for this device was added a while ago to OpenWrt. This AP
> requires two special BDFs to get the Wi-Fi PHYs working (correctly).
> The bmi-board-id='s would clash with one of the the IPQ401X AP-DK
> boards because QCA doesn't provide special IDs for customers and seems
> to use the AP-DK board-ids in the wifi firmware to change its
> behavior.
>
> Now to the questions from the wiki page [1]:
>
> l       description for what hardware this is:
> -       it is a IPQ4018 based board
> -       one QCA40xx radio is used as 2.4GHz radio
> -       one QCA40xx radio is used as 5GHz radio
>
> l       origin of the board file (did you create it yourself or where you downloaded)
> -       taken from stock firmware image
>
> l       ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> -        QCA4019 hw1.0
>
> md5sum of each new board file to add
> + bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=EnGenius-EMD1'
> md5sum: da14e0efd0b408685a0e5aa83227d460
> + bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=EnGenius-EMD1'
> md5sum: 685aa42c29ac39248ca75b748d8f9e18

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=EnGenius-EMD1
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=EnGenius-EMD1

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 58 in total

https://github.com/kvalo/ath10k-firmware/commit/0d2493ac59f3d3373bbcb24a35fe1944a15b6ad6

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
