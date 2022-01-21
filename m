Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8485AC433FE
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 14:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQS/KhEz1FoOmHcH7oly5/8p/dMgfPh+z2BT4mFZHFc=; b=mSC1p8JX/lcj7s
	ax+3X257I5gSYK+EsrrMBkRg9aIXJmYrAQWtC32LkBCobd6X2N8qmXsbdA7+wSXKplT30a79VqN4f
	8IeCdqfIdJ0GNQSbCzOf1PRdaDhTIz66WIt7UGKD5SCQ6/KZRudfNFRRdUOfVg/hA3L+rn88tNvZs
	xV2CEbF3euQ3lJCACXMOI4yOu9Tx+glHHYyIukcM7TS4DXxD3KJSeB5z37r2GjGHRXz9NPiQvOIg7
	cHbFcMXKpZnsccFNF2KQn4qpC0av3oWdIz0MCOJBPnDoyLPwsXPCPtPPlTmIcZw+xv/BRaZGjdby6
	MPD0ArT4lfho9kZkwIgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuXy-00FIrH-Ai; Fri, 21 Jan 2022 14:05:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuXf-00FIcy-V8
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 14:05:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 69589616EF;
 Fri, 21 Jan 2022 14:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DAAAC340E1;
 Fri, 21 Jan 2022 14:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642773926;
 bh=7P2xcm0ehGEay/rb+eF0LIEMAk+UlUjNPeXZEfSAFAQ=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=QfD3VlMYvhhRp5xLExPHLCmwdtr32TU+gL8TQTPqTn/Pkv/zm8bnl+sa63tsA80PH
 YbiikMRDxQwc7Ms55mYcAMLC/ysdp1QLpEudGXHl4avoH4Y61OP5NuL4dB+9PXmjqO
 aCnel7gAWqPRfJSjxN2m02wSl/6PVzAnWEcMxPaP7ZyEMGQO6ui8YxMvMbUXwlkMPc
 ukQOYpg4ZdKxAHV+Sb7fYDym0URnDSSWYHAYfIFTQgB21PfPxvjRvpqYzNKj6P3hqS
 b6kHKiEmedzIwR6m4cP/OhCK44XtdlOvE4XRmb3YCR+QslCovA6mbNIUojIYPDwbez
 VNzZ4OEu4GICA==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA9980 hw2.0: add ASRock G10 specific BDFs
References: <4031513.NO3PqbrPAa@debian64>
Date: Fri, 21 Jan 2022 16:05:24 +0200
In-Reply-To: <4031513.NO3PqbrPAa@debian64> (Christian Lamparter's message of
 "Fri, 10 Apr 2020 15:01:23 +0200")
Message-ID: <87zgnp9obf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_060528_080153_F4943D98 
X-CRM114-Status: GOOD (  15.57  )
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

> this is a set of board.bin files for the ASRock G10,
> which I wish to be added to the ath10k-firmware repository.
>
> As per the current "Submitting board files" guidelines [1]:
>
> * description for what hardware this is:
>   - it is a IPQ8064 based board with
>     - one QCA9980 radio is used as 2.4 GHz radio
>     - one QCA9980 radio is used as 5 GHz radio
>
> * origin of the board file (did you create it yourself or where you downloaded
>   all files were extracted from official vendor firmware which was on the device.
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>   - qca9980 hw2.0
>     + bus=pci,bmi-chip-id=1,bmi-board-id=1,variant=ASRock-G10
>     + bus=pci,bmi-chip-id=1,bmi-board-id=2,variant=ASRock-G10
> * md5sum of each new board file to add
>
> ae069744baeebfd6861e8080a92439ca  bus=pci,bmi-chip-id=1,bmi-board-id=1,variant=ASRock-G10 
> 9e196846841a186e61ea208cc873384c  bus=pci,bmi-chip-id=1,bmi-board-id=2,variant=ASRock-G10

There is no QCA9880 directory in ath10k-firmware, do you mean this
should be added to QCA988X/hw2.0/board-2.bin?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
