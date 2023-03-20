Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE195C6FD1D
	for <ath10k@archiver.kernel.org>; Mon, 20 Mar 2023 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ioVtmotkzfxbWWBn/CRU7gHeeT+mJu/+VDavTlR+4E=; b=JbH58+wO8axrHu
	sSIeX/uaDTzbnKLtSlPS3A43NScrTRRzEpnevNLTFuR5MSk3T6OarZMPWXH6eW/uHLgKKzr8ppw9m
	lHWtn+M/BrzhV9d2UtFows4g4ZZg2HTKxhb141j78n8b7fM37ylUM1JvSVhGIRLrevh+l8tDBtTO1
	XzH+1Iw23a5XbN7kSASKriN4AKhYuSyzLwg9M/MqvC+kN2ycFoMG/xQV/HlIbnTs58Nbdpk/aBa5h
	FwFy8uZcHsjEiXJ3reGuBKL49mr6dC7j397jBTKgZBJ+8Duq7BIpRXEbflJJZmNGQRi608SPlX4bp
	y7e8/dl8P9+4r7gGJgAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHhM-009cDL-1x;
	Mon, 20 Mar 2023 15:45:24 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHhI-009cCQ-3C
	for ath10k@lists.infradead.org;
	Mon, 20 Mar 2023 15:45:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0701CCE12EC;
	Mon, 20 Mar 2023 15:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7524C433D2;
	Mon, 20 Mar 2023 15:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679327117;
	bh=O+H61w5zWfkHAPGXuUmYpFBcJtE/abgo4NFIWg9EcuY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ffY+Tk/94Vkbi0+/ha9O7zy4UECldpddUd4tsF60efAqYswyBIAWrhXQmevFhL3S9
	 Bk4J83W9ePxytMJVm4yXIqjcRcoyzLY6H5o6OpafSQyZURi/8KU2PJGZPcbMruObAo
	 sSpfw/6ydfnz4fMI0V1WGl3GoelAGRrF/AG7v4MrxvIUUvBbLlSSmwplnVSazkLltK
	 OQo1jwMEhn3xV7N9bzcboIcs5undTdLrQA7yXYmogqJlwAYq6flVsu/gnN+cx9+cru
	 2sG6MNsGvr+youo09ZA/ML6ZaYFRuY9xn/bKVjQwQ6XcVXnygL5IH1H6SE7U5wdU5w
	 636SqepEC+AJQ==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: [v2] ath10k-firmware: QCA4019 hw1.0: Add GL-A1300 specific BDFs
References: <641497ea.050a0220.ad7fe.fe81@mx.google.com>
Date: Mon, 20 Mar 2023 17:45:12 +0200
In-Reply-To: <641497ea.050a0220.ad7fe.fe81@mx.google.com> (Christian Marangi's
	message of "Fri, 17 Mar 2023 17:40:09 +0100")
Message-ID: <87pm93h1fb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_084521_532693_453A98EF 
X-CRM114-Status: GOOD (  16.33  )
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

Christian Marangi <ansuelsmth@gmail.com> writes:

> Hi, we have many board file not pused upstream in openwrt. The intention
> is to fix this and have all of them merged.
>
> Resending due to copy past error in the ids (extra .bin)
>
> * description for what hardware this is:
>
>   - it is a QCA4019 based board
>   - one QCA40xx radio is used as 2.4GHz radio
>   - one QCA40xx radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - extracted from the original stock firmware image
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=GL-A1300
>       sha256sum:
>       7dd85d4d5b95570985ecd4a66f51258d6973f14e57d715e49e0f6006a7b91f66
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=GL-A1300
>       sha256sum:
>       9ec16a0670d71e29c4f9c0758babee85fd57982fad870a78ca779fbd43eb4731
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=GL-A1300
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=GL-A1300

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 132 in total

https://github.com/kvalo/ath10k-firmware/commit/7c38ff73720e35adcb11cf531af052c37fa3211c

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
