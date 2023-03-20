Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83978C7618A
	for <ath10k@archiver.kernel.org>; Mon, 20 Mar 2023 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xe6sssapLcfaYRyqNAXRwKOZxUrY2W1SSI3rx23svJk=; b=qpKw9j2vbUItEv
	Dfq5SmtYAfaoMnYOq/wVY1+EYGLIG66aaUcTD9Au1Lpo4xTB5tQQAo7rzCOSz+rM1Pacmb+2k9pzP
	tEtsvCiRQdgUHgMbOYKI8XDcbxMBeWKzng1csx8BW2BL1iTVNF04JC1xldGKthBXR7DiZ5nCZH8GT
	EgpmnCWZgTIdUhEZH4cCUuQKFbguvgqRPF17w2HZpEV7UeAaeJ+2q2dQ/jjJ+bLy9Kl2A6I1ilQev
	Z/o7Plty+0iwxm+rDbuPui649WukwcRTP+uNAbIfelJZlLUrvg0RsKzLqpWuTj60cFPaq7YJ/qcBy
	NaRdXJOb4wK07ILsj9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHmR-009dms-20;
	Mon, 20 Mar 2023 15:50:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHmM-009djw-2r
	for ath10k@lists.infradead.org;
	Mon, 20 Mar 2023 15:50:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6B049615B4;
	Mon, 20 Mar 2023 15:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D19C43322;
	Mon, 20 Mar 2023 15:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679327434;
	bh=uIyvOxBFWgJ/M8DO/8ka7DWcqGnjqV895OVh4s9UnPQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=UPhmrwmCDs2hivBHjwtG/xpvmDtXd9Z0xLiBKFYif78n1WL/olMNCP7PnhvqL6hXI
	 tyBnJsT81cvEVzDUR8SlJvrzPS414kj7fNieUnIt24eqLJYz0f3jj9PTprQJGngZWy
	 3ZdSmejGeyqx8cgqwheNkngA9S+1f0te070hq3jJwTYWxiAuHFh1qey2QEcUMeAXmP
	 MZVAuiL2jGlBcqGCLZ851ns0imgjQZEDmMiIVCnVjeNk0lLx2Be81Kc3USY6Z5cyfi
	 0/9W5xTm2t16w80d89MDKObtBt4JYFHjx65kDBIvZna3Rsuw1BwGijbBgSq38Ine5/
	 PVgiQi3yzN6yw==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: IPQ4019 hw1.0: Add ZTE MF18A specific BDFs
References: <6415fa08.050a0220.f5f44.dde7@mx.google.com>
Date: Mon, 20 Mar 2023 17:50:31 +0200
In-Reply-To: <6415fa08.050a0220.f5f44.dde7@mx.google.com> (Christian Marangi's
	message of "Sat, 18 Mar 2023 12:53:46 +0100")
Message-ID: <871qljh16g.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_085034_977211_751F5E16 
X-CRM114-Status: GOOD (  16.41  )
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
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=ZTE-MF18A
>       sha256sum:
>       2f4a5ab3d12c680ed508a902edfc72e86aeff77404cb9ec8e1dbe0df67ac0fb2
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=31,variant=ZTE-MF18A
>       sha256sum:
>       54f2c22713165b795a6484fa1754482d43490d0b199ba6f782b250a636dd727a
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=ZTE-MF18A
bus=ahb,bmi-chip-id=0,bmi-board-id=31,variant=ZTE-MF18A

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 145 in total

https://github.com/kvalo/ath10k-firmware/commit/5116f7fe30ff385dd1ffcb7620767e4b52569fd3

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
