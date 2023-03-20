Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B359AC7618A
	for <ath10k@archiver.kernel.org>; Mon, 20 Mar 2023 15:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMIVXsvAzL86vUknMYFcZWmHQ68LWTcbkjiAQBGYvjs=; b=Z3zn7QS4e5ZUx4
	RJgr8YnK3TsLv1pwhZx5h794kCMlwtUWiRn4Y5qIZAdMxkJ4Xh91FU9csdYolStILQPUu0lRSutGM
	1e6pxEOShVgTGHGbu+nlC1kzcsDesvNUnmk734rC48R16GpmpZF0kvnilEXBcd7B35ZItXtD+dIdC
	uAciVcR8hJ6vGF8SnW0MRC5+HgPvqlMPE/8y1q8ad4HksusyPFKq09nB/yWoSZdChc+h2WEg9/eDN
	ichp+ewwSWzTi8Y/WkOcHpXEO2Exn7hRtRvxUeleUgReH0pJN4aVGGm2uA4C71BCvbPNLZV2IRFa/
	F+ok94yUyi2HQWX0vVWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHog-009eWA-2v;
	Mon, 20 Mar 2023 15:52:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHoe-009eVC-1G
	for ath10k@lists.infradead.org;
	Mon, 20 Mar 2023 15:52:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 03B6C615B8;
	Mon, 20 Mar 2023 15:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7029C4339B;
	Mon, 20 Mar 2023 15:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679327575;
	bh=qJTUY3Q3kCvBcZXn22XlEgBU+GoEuKTFrBD0ipXTR7s=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=TT2+Tl5oPm0CZW03lrnMyXKpLJ0qOO6m2eGIjMFgCrZ2rtbDer6PgwoUFbozHk6sx
	 5frCvGE5XIcciQPkT45KdDRR15Pi8Mp4De/ELVOtZmInmYsJREEIz6PYkEFVdqrd1K
	 f3Gn9SL+Dy+KSvBUicoSz74AgdZfxquE3w1nbmbs8DkaH0X0NhoVuybSx9Nb0AHpRh
	 XYRDxBUYnQ5NdVeX7gvnND0q20JKRVNa10Ngd3EP0cOfy7CQXGxFxey7KLOPeTivNj
	 B2XOMwK6aLp8lwSs2q+u+eh2ioHbOqb8WS3LHuieAT7JQsRxUFZmjjqXq8U/0r5orr
	 SzKWzrIkKKdDA==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA99X0 hw2.0: Add ZTE MF18A specific BDFs (5G)
References: <6415f385.5d0a0220.72099.9555@mx.google.com>
Date: Mon, 20 Mar 2023 17:52:50 +0200
In-Reply-To: <6415f385.5d0a0220.72099.9555@mx.google.com> (Christian Marangi's
	message of "Sat, 18 Mar 2023 12:23:40 +0100")
Message-ID: <87sfdzfmi5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_085256_482437_757BBB42 
X-CRM114-Status: GOOD (  16.34  )
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
>   - it is a IPQ4019 based board
>   - one QCA99X0 radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - extracted from the original stock firmware image
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA99X0 hw2.0
>
>     + bus=pci,bmi-chip-id=1,bmi-board-id=1.bin,variant=ZTE-MF18A
>       sha256sum:
>       409de24fdfa49d8ae11c30b003888749cd93b17fdffc3510c224468cb9584e02
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA99X0/hw2.0/board-2.bin:

New:
bus=pci,bmi-chip-id=1,bmi-board-id=1,variant=ZTE-MF18A

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 14 in total

https://github.com/kvalo/ath10k-firmware/commit/f876e546ef00ac2b24240ea1da6926a53f269ccc

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
