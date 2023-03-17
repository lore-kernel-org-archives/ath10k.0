Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D8FC7618B
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B5FZVpY+VVg84vEQDA3pxWJ+ysEsaflQBMEY2dt/RFY=; b=YYYItdhPUbtZ3N
	AVcuqD69Ry8EW5hWz41Z2fkOjaHjcAodgpwx6tI1DhQo/C9WjYr+WZlE952028DJuNkWjT5J4gGsQ
	nzSqpsv3UkQv8w85XUC93ixEekVbFxU0L/vUNJHs5Bwdjk/F2ah3qsmMIPzJAVor9DVUPtzjRDFzL
	/E2vvWprGHQsF3W/BlVhy8R7EZ8aPe7L75MXIUx3F7eX/P0R3JQfb1YhwOklE7o6gDMRsWH+UwiyL
	qM/bBcYF4bmMKilBNRFzwPg1ND6kHGlFvW1CFooQapOwtiUMIfQjmW6llGX/0/NrEkYBpUumcIm6E
	DAiSFbLsdAKmokOla2LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Qi-0026Pg-0w;
	Fri, 17 Mar 2023 11:39:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Qf-0026Nv-0r
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:39:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7ADB7B82560;
	Fri, 17 Mar 2023 11:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80CAFC433D2;
	Fri, 17 Mar 2023 11:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679053162;
	bh=3XDDB4msWubE89u9J4oV5bBnh41U7brAGdoEmxxYWU4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=eIkFsW2GN7UAd+rx20DmsIIPUebhTMrVywW02HDx4+yHUFt6JXaIfIPTpJ/w/wktj
	 +4vpOcLXmzHLNrbVuJN2yhrDT8b780jdyfNidEWOLiSQCjA6WdHzMYUK2cveoHIojF
	 g6ZHrX9si25qiGGK+MVza7FRt/n+CVUwbZvD7seJDSjudne9Ryo654+MRdbq5ARfGz
	 4V6YJtDlOlAhkJegA8AIjAZUU4d6rTk5KsQESTtcsMivtPVDUdVTfLfqUMy++HjHkW
	 mm6tnj1ReH5SarsYivKrWGVn+vABiRBPm7gMtgflGcNb2YLA8a4Lepo9QoihPxmhaq
	 mvsyvch2fc+Yg==
From: Kalle Valo <kvalo@kernel.org>
To: Tomasz Maciej Nowak <tmn505@gmail.com>
Cc: ath10k@lists.infradead.org,  Kalle Valo <quic_kvalo@quicinc.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Pakedge WR-1 BDFs
References: <c6047a63-9efd-34c5-f50e-2ef2e181cae9@gmail.com>
Date: Fri, 17 Mar 2023 13:39:19 +0200
In-Reply-To: <c6047a63-9efd-34c5-f50e-2ef2e181cae9@gmail.com> (Tomasz Maciej
	Nowak's message of "Wed, 24 Aug 2022 19:08:06 +0200")
Message-ID: <874jqjli8o.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043925_594349_02157559 
X-CRM114-Status: GOOD (  12.72  )
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

Tomasz Maciej Nowak <tmn505@gmail.com> writes:

> I didn't see previously any request for adding multiply files for single radio,
> if that's frowned upon, please include only the ones without certification
> institution suffix (-ACMA, -IC, -SRRC). Thanks.
>
> Description for what hardware this is:
> Pakedge WR-1 is a Dual band wireless router.
> Design based on IPQ40xx/AP-DK01.1-C1
> - one QCA40xx radio is used as 2.4GHz radio
> - one QCA40xx radio is used as 5GHz radio
>
> Origin of the board file (did you create it yourself or where you downloaded):
> Files were copied from flash chip of mentioned device, originally called:
>
> boardData_1_0_IPQ4019_Y9803_wifi0-2017-07-20-d941e23712b3596dee0c1042a20d3702.bin
> boardData_1_0_IPQ4019_Y9803_wifi0_ACMA-2017-10-13-64d8ede4af92a45245c7e7af4f32462d.bin
> boardData_1_0_IPQ4019_Y9803_wifi0_IC-2017-07-28-d941e23712b3596dee0c1042a20d3702.bin
> (same as the 1st)
> boardData_1_0_IPQ4019_Y9803_wifi0_SRRC-2018-01-15-bdb871aa33722d14cf33410208cc40d1.bin
>
> boardData_1_0_IPQ4019_Y9803_wifi1-2017-08-02-9e36c74546614062b84f6868325de42b.bin
> boardData_1_0_IPQ4019_Y9803_wifi1_ACMA-2017-10-13-f214e782e0e2e82e15a4a7381ced2a29.bin
> boardData_1_0_IPQ4019_Y9803_wifi1_IC-2017-08-03-b89f97ba74cdb1fdd6127ccf6064815.bin
> boardData_1_0_IPQ4019_Y9803_wifi1_SRRC-2018-01-15-87cfd46bba373fb33cb9d603bc871a0c.bin
>
> Ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k):
> QCA4019 hw1.0
>
>   bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=Pakedge-WR-1
>   md5sum: d941e23712b3596dee0c1042a20d3702
>   sha256sum: b01ddf3807cd5cd9ec3c5d4c018ff2fa6377e60e1207187a59119018710d8372
>
>   bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=Pakedge-WR-1-ACMA
>   md5sum: 64d8ede4af92a45245c7e7af4f32462d
>   sha256sum: bde478a8295e9b14d5fb89acfc75a1a4fd73aa3cc81a6f6ad49a9c492fcdf507
>
>   bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=Pakedge-WR-1-SRRC
>   md5sum: bdb871aa33722d14cf33410208cc40d1
>   sha256sum: 0a0e3f670b8c29c68128ad1ea4fd707e9276c4c16b0aa5f8ea6427fcce14dbe3
>
>
>   bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=Pakedge-WR-1
>   md5sum: 9e36c74546614062b84f6868325de42b
>   sha256sum: ef6a5a3d2a37f3619463df37e5c0cdbe8a023a85067d30e45780afbe8b706d47
>
>   bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=Pakedge-WR-1-ACMA
>   md5sum: f214e782e0e2e82e15a4a7381ced2a29
>   sha256sum: d934dbf0d48a13f9192bb7e41c4a888de8ba4a2d5c8a7b66078d330035ed9828
>
>   bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=Pakedge-WR-1-IC
>   md5sum: bb89f97ba74cdb1fdd6127ccf6064815
>   sha256sum: 5404f616b3b1816fec7a1ecc9c5ef7fd32f1a0bc85db62972c60c30db1de13da
>
>   bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=Pakedge-WR-1-SRRC
>   md5sum: 87cfd46bba373fb33cb9d603bc871a0c
>   sha256sum: 6b55eab79070d331e0c5d0d54074f4e4cbc1455b6a662e085a965cc613e0e996
>
> The attached files have names derived from ids to be used with .bin file extension.

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=Pakedge-WR-1
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=Pakedge-WR-1-ACMA
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=Pakedge-WR-1-SRRC
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=Pakedge-WR-1
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=Pakedge-WR-1-ACMA
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=Pakedge-WR-1-IC
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=Pakedge-WR-1-SRRC

Changed:


Deleted:

7 board image(s) added, 0 changed, 0 deleted, 124 in total

https://github.com/kvalo/ath10k-firmware/commit/7dff998ec61163b90a8a6d389b7c9120c7dbec7b


-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
