Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8354C6FD1D
	for <ath10k@archiver.kernel.org>; Mon, 20 Mar 2023 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5QjSQc2lLmm+kJYkXKz+ZWjV4gXcD7A7kjO6Q65QRc=; b=mvzhcZfGglOiXM
	izZaF8yaXfzuwl5tY6QgvDu+StClSobJU3GR3piRqAI4efxXIdoSWlkPn5067CB+WC+WDBgpdsq76
	kpkuupk/LmTcX+iTY2iRGhD/2UThrELOpR7rhBymTRUjCQDZSgMXSa/2T9aVOcAIePIsUsTwWI2kk
	zmDXLcZDqmlnRXusCZoOfd3zUdPRz/d8vEss5yT3cSaAXk8kVqg/81UrhUtSE/sf2oxCbs2d8IxLH
	z7NXgOCUmXki7RwBF7TpZhV/XZwyCxVTn2PNTR0+CmDY4T5G7q9t245NrDkZGVaFl2EC+OFQZPLOg
	EJI/YeIoRReJISdK1R5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHhu-009cK5-06;
	Mon, 20 Mar 2023 15:45:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHhq-009cJ6-0v
	for ath10k@lists.infradead.org;
	Mon, 20 Mar 2023 15:45:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A1630B80EC2;
	Mon, 20 Mar 2023 15:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C826EC433D2;
	Mon, 20 Mar 2023 15:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679327151;
	bh=ZK+3FgSYS5Rux8einRKyHJv5jW/IcAw/z/eATV0cU8k=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fmLOkJ2xeUV/7DQ8GIdrOSpIZcT87ws4cFNdCkXVlR2biS4sdifmb021kuwzwlzdU
	 ByzjmGMei3gMqdtJ2riyxuKU9gGeRBPdPA3F2kx9aaUslfdMAYYG/mpLRhgQ3wVCz9
	 Yf4ah+YGXsdZmILMB0Bd0r9XUWP+tm/uT13YGrwFQgF6OxEb3eHk8grpSxUpe6W/p8
	 zNpqEoRkbMXEvJ2tfTiJh79pFp5WYnZlp+Y79JlLv/O/SCXGJ1xu1qCUzFLm2RFgfx
	 a8HH1jHQYHSTLENRW6BGb4MEGxpjY9L2Hk2duKASODceOsUIcAQHuJELj7gLSW39Vu
	 Fe2qIOSUapR+g==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add GL-S1300 specific BDFs
References: <6414996c.050a0220.5183b.09fe@mx.google.com>
Date: Mon, 20 Mar 2023 17:45:48 +0200
In-Reply-To: <6414996c.050a0220.5183b.09fe@mx.google.com> (Christian Marangi's
	message of "Fri, 17 Mar 2023 17:46:34 +0100")
Message-ID: <87lejrh1eb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_084554_462977_8C783EBB 
X-CRM114-Status: GOOD (  16.21  )
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
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=16.bin,variant=GL-S1300
>       sha256sum:
>       58e491844a57b3cd26d006bc5b5bdf2d3452a248be29a6859fa367814ad8bb10
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21.bin,variant=GL-S1300
>       sha256sum:
>       07a6f4e176703a5a5ee4eeba6b546512d77489984a107105001129d5d11f19d0
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=GL-S1300
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=GL-S1300

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 134 in total

https://github.com/kvalo/ath10k-firmware/commit/49d403c724f414d2747c1ce41cdf38566f1a53bd

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
