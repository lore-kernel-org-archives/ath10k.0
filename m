Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA52DC6FD1D
	for <ath10k@archiver.kernel.org>; Mon, 20 Mar 2023 17:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0MdaUKnodmoNTAq8r+YUoAvtuYOtuUSf16cOtcZh54=; b=ByTQIlnRArgcdO
	Qw8jEMhL6XuLgsRkyArG1vwORX+VDFG6bNIm8ZEbDW4qj3YN4zDDjOSUbCjODQL8TcrEJJXMmUYSm
	9svbBCN3a/MZwBhAbAvUUw9/D0jiAWb0476KuCcgcSHOcULjyYQxED92qtuofuZUJs8H5+5KcJ+ze
	lv/tCF3rHu/ysJtshAsbNNHZB9WQOtPBHxcSXrMIy/4/t6Ys/elQiwXU10UfSGV4NXPK1gWPyYl4t
	1A/qsF3GO8OB6bIRoGsjEJLo2pQ1VrbtjWDHkbeXst4K1mOOpQLKve0H/Tof+OIzrNsN0EJ8hNLVQ
	TzZ1p+lGF5ZcvAlHCQtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peJ2h-009wtn-2b;
	Mon, 20 Mar 2023 17:11:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peJ2b-009wsu-1m
	for ath10k@lists.infradead.org;
	Mon, 20 Mar 2023 17:11:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 154C26171F;
	Mon, 20 Mar 2023 17:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C5CC433B3;
	Mon, 20 Mar 2023 17:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679332284;
	bh=VBtuxnj0aFz8rshXe01Rb2iz94qtzmBFOD2WgmOYKaw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=FkyMLz9AdT/0fHYrrV16RntbvhZT/BMIcbFZpA3VBFSIAnm0+zfqM9RZnEwwhrmOP
	 Tr8l1RI6QM9WAGkh1k4Y38KoplqFdVQJIAKKt3LC+b6UJ95K9RDchR1jwHBfys3Bpl
	 f8XprRhjRMgq6Ao/8R1w/ngHvoYZXNn5jlhLsezbNQddzQIakawzZz6B8mjBXBKQIz
	 Qz0GtGWU/JJEpTKPnQDYS78LlS5mmS6c2/D9QYa85AOXin57yJRiypRgcBgia9ENrM
	 8yeeAanVRTnhwZgWg2FHkUUPM3ryMF9dwTU+ALuxJKj4/ObqFEoHxov/+7nYZP3OsV
	 4YL2tHYVXBbgA==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA9984 hw1.0: Add Nokia-AC400i specific BDFs
References: <641601bb.050a0220.3cae0.e1d4@mx.google.com>
Date: Mon, 20 Mar 2023 19:11:22 +0200
In-Reply-To: <641601bb.050a0220.3cae0.e1d4@mx.google.com> (Christian Marangi's
	message of "Sat, 18 Mar 2023 13:29:22 +0100")
Message-ID: <87edpjfiv9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_101125_644200_CD2CF3A1 
X-CRM114-Status: GOOD (  16.31  )
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
>   - it is a IPQ806X based board
>   - one QCA9984 radio is used as 2.4GHz radio
>   - one QCA9984 radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - extracted from the original stock firmware image
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA9984 hw1.0
>
>     + bus=pci,bmi-chip-id=0,bmi-board-id=1,variant=Nokia-AC400i
>       sha256sum:
>       1277be6d5c0dafe7d6ceb7d8f0d37a7f111f274c65dfe8a5c78df0d0e26303d0
>     + bus=pci,bmi-chip-id=0,bmi-board-id=2,variant=Nokia-AC400i
>       sha256sum:
>       c716e0d70deb5401b19af9809b13c702908a2cb165ecd009faf1d7c33faaa82e
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA9984/hw1.0/board-2.bin:

New:
bus=pci,bmi-chip-id=0,bmi-board-id=1,variant=Nokia-AC400i
bus=pci,bmi-chip-id=0,bmi-board-id=2,variant=Nokia-AC400i

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 24 in total

https://github.com/kvalo/ath10k-firmware/commit/fb46dd77357113bd03121e8dcdaea085aa1e28c3

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
