Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34038C6FD1D
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROkniJmpS1QHr40V6/kmplmf7hMcja3Fj/Adzw2TFig=; b=zTXGxQ+S6Au8/X
	QKpw2g3AmVIExQkAFDCDnaUopAKzmNKoHy2GKhZrKtfY2qg27uyVwKJ8s3JAOQxk0OHPPmUwwuQ0q
	sOo3Vlxtn66tv8HVOJ3EVUzmB9Z0/eXK+khDtXpvvPnVFpeo1zWTGqOXPHfHCgewjw4TTCFlIsdOh
	azoMoCdzr8x0BlzGQ50c6/Y7E/6yVcBp8AejigjfNFCAXlqQ2ENr2M8t815n5GhXYLHuLsof+eZ68
	8+xlKI2ZaViZNkFvjtKX2GLd9XdefdVRc8a7gu1X9v3xj4u3JNNF1c7pvdOwCWQoMgED2eG5HEPuI
	KZKyoLBEJEoBGQbftseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Ur-0027A7-2B;
	Fri, 17 Mar 2023 11:43:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Up-00279d-0Q
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:43:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5ECA66226D;
	Fri, 17 Mar 2023 11:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38323C4339B;
	Fri, 17 Mar 2023 11:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679053421;
	bh=cRhkkj+MI8nk94t874pRVlZH1TdgAGETGZIQkmcFtlU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=IbjMyPe7eXYb+O/1qxQcWaM9fPpIIZdPA/YNZJ1tWa5vXJJhUX0vWyzJ4pmFrhVJi
	 1HhVwXLBMOrufDqHI9/r1EPhrto8XGUDqKWtKU8akbPVZ8Qjmkbe179rfPUUbBMsR1
	 qDL4PvULFqdjqFDJ/GP8hyWxLkMDcPEf7aN7EL+uRDZSGHv6ChmMNWdhaVZlRyUEyI
	 wAy9k4ffiF2DjaRqPcpAtQttTDJn0JDf6p/v4URhr83wKwgypCkaVRsAWkNHCUi9M+
	 JV6dMpfRl1EcTfsa9ButaKx4PogUudBA4GWVx/oUtZaPjOVfCJtRePhd+k5c8+mSMg
	 kO53L6e4eduIg==
From: Kalle Valo <kvalo@kernel.org>
To: Vincent Tremblay <vincent@vtremblay.dev>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA9888 hw2.0: Add Linksys WHW03V2 specific BDFs
References: <CA+RD57PNNMFfkZ5ysh646A1Qde17x3qitqWhnXbRpFkYAYYuoQ@mail.gmail.com>
	<CA+RD57M8sAvBL60Um52Afb2dCJAsHuo1S44qVxFaWagssQOxeQ@mail.gmail.com>
	<CA+RD57Mv6FJwOKLo0JcJoMEZ3A22bZ8e4Fvhhzpjdn2r-Q1yrw@mail.gmail.com>
	<CA+RD57OHp1EuDEWRzDCr6fdytFawqdoMANLvF4TgECt4ryJXcg@mail.gmail.com>
Date: Fri, 17 Mar 2023 13:43:39 +0200
In-Reply-To: <CA+RD57OHp1EuDEWRzDCr6fdytFawqdoMANLvF4TgECt4ryJXcg@mail.gmail.com>
	(Vincent Tremblay's message of "Tue, 20 Dec 2022 14:41:09 -0500")
Message-ID: <87lejvk3h0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_044343_212551_4C89A4E5 
X-CRM114-Status: GOOD (  17.07  )
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

Vincent Tremblay <vincent@vtremblay.dev> writes:

> This is a set of files for the Linksys WHW03V2 that are currently
> missing from the repository.
>
> *  description for what hardware this is:
>
>   - it is a IPQ4019 based board
>   - QCA9888 V2 interface connected over PCI-E to operate on higher
> part of the 5 GHZ spectrum
>
> * origin of the board file (did you create it yourself or where you
>   downloaded):
>
>   They were extracted from the vendor firmware (version 2.1.19.209783).
>   The files can be found in the folder "/lib/firmware/QCA9888/v2/FCC".
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k):
>
> bus=pci,bmi-chip-id=0,bmi-board-id=23,variant=linksys-whw03v2.bin
> md5sum: fde89e0dace1652566d96fb9c83b1c61
>
> * attach the actual board file (board.bin):
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

It looks like you submitted a new version of this so dropping this one.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
