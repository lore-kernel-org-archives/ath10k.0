Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B30C74A5B
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JDCrQ8ZmojWkOMBja7FbI5Y58+WF6rWRLYHVBfErYz4=; b=MQbqR+YF6jn1Jc
	jpcrwzgOXK5s7ygBMPyDYeljchbSAcnlk561d0+GSGUqH23Bk+Ze8ey2+3gYkXrtWUrQd5CJge5/g
	jkFoMrYKfIXfMG5OziJfiazbnsM2qGwKdq67vY74NWPe/SRu8zGZj85ji5kVuml8CsgDMPwrYMFVk
	LAFqyDy3kY8s/ohe/RNYM43Kq1PMuqnbmdw0r2UiRNznL6IJciU8XC2E+mqIlmXKIXKjH+dvp4URZ
	9eJsCQoJ2uTSe427IBOBCsIAoF9gbzn/Qrfdw3N07InhFsF+o7VZ69HTrLenGAj4395lX1yE+tQ51
	2gdKmwmLG/oClon1mxgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8U4-00274V-30;
	Fri, 17 Mar 2023 11:42:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8U1-002742-2y
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:42:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8682EB82560;
	Fri, 17 Mar 2023 11:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC098C433D2;
	Fri, 17 Mar 2023 11:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679053371;
	bh=4MKWcGIZuBdsA4nzksKrqYkJg6CjODduogYl4ftfx/4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=SsXj9bMlwKSyVlyLAOG/qO4yB43ulF6JFsznlqb04KtZvPLwbMkjIFIX3zWmkUADH
	 z7x8UYg5XM6GarJWdzt2W4EAOb/vjEnS3EgDA2twfidYhRoRYle/cUCBDZ/A8A17FR
	 9kR/LjcOqHNBwZP6REtsD4DQUMfhcU9BdL7P1UJkQ47QbolER8P2Lo7SdoPdjAaUO2
	 CsQzkLWkMFPdxV0xf77a4mlS9M+PI3gcONpPasv3H2Nq/21L9Rlvtuc61/c3e7Ne5a
	 8cDlwV/KSXPmvGSsUYvdh8+9CfNKCK3V3qkhmsL+cjtlRKgFR89IqJYvcwoSS0iKlZ
	 5gKtYEDz11big==
From: Kalle Valo <kvalo@kernel.org>
To: Vincent Tremblay <vincent@vtremblay.dev>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Linksys WHW03V2 specific BDFs
References: <CA+RD57PNNMFfkZ5ysh646A1Qde17x3qitqWhnXbRpFkYAYYuoQ@mail.gmail.com>
	<CA+RD57M8sAvBL60Um52Afb2dCJAsHuo1S44qVxFaWagssQOxeQ@mail.gmail.com>
Date: Fri, 17 Mar 2023 13:42:45 +0200
In-Reply-To: <CA+RD57M8sAvBL60Um52Afb2dCJAsHuo1S44qVxFaWagssQOxeQ@mail.gmail.com>
	(Vincent Tremblay's message of "Tue, 20 Dec 2022 14:32:59 -0500")
Message-ID: <87pm97k3ii.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_044254_104887_ECFCC907 
X-CRM114-Status: GOOD (  17.44  )
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
>   - one QCA40xx radio is used as 2.4GHz radio
>   - one QCA40xx radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded):
>
>   They were extracted from the vendor firmware (version 2.1.19.209783).
>   The files can be found in the folder "/lib/firmware/IPQ4019/v2/FCC".
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k):
>
> bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=linksys-whw03v2.bin
> md5sum: 0435269fbb0797bf269b8cb0591e7544
>
> bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=linksys-whw03v2.bin
> md5sum: 79042d093e81a43c8c790bc124ca4dfc
>
> * attach the actual board file (board.bin):
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

It looks like you submitted a new version of these so dropping this one.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
