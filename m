Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A51C433EF
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQ0xFIFrxaZ2zAZC9Cm5qpWftGxw1LDls6AF8528tcc=; b=Dcl+mqpZzoduQZ
	NKcDKu8DfzixTCmsGvXRivpxY98Rt5SvtYcao2N9rbESclHbvgDXMZj5XOmX2TKopOmbsqt3Kz+3B
	VITLP0mWBFGkUSFT6kMbnWAiYyEP7W9g/EehjUJkq8QQdZRKOO60ut7ZhSTybspMJAfJ1ytMGtmR0
	GS52kv4OnAgEs59aPAWAzrMA7pinOyQpmE3mK1oMQvjp3evBzIA1Y90abiMZxYi0yBdPpHMPyLUGp
	ZOPW6lt15vih6npXBMLFkXwCLLfZ/9iPjzuZWotwpQs11c6Ubv/I/cgQ0385ROmDqkaysSKbI5zQ2
	3dWuocspVx51oZQ96YvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuHn-00FDvd-By; Fri, 21 Jan 2022 13:49:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuHk-00FDup-If
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:49:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 28CCC61566;
 Fri, 21 Jan 2022 13:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05FBEC340E1;
 Fri, 21 Jan 2022 13:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642772939;
 bh=p9swUO4btnwnJUEhqiPIaxyeX9TEqkrnxfGoGwdVzSc=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=K2vyJX7m979yxtsaJ7syLEJ0F5ffqt7AoCYzhvEzK/GPUMAKiShbqLB86vGJVtv5W
 QC4xOplmIfut4LK0mfihUF/OMXKszasYc2clQHiFwtJGKJiYCMtsmoU88djF+q6g++
 ylniRlIgz4vcHzCyMpRPN8xInEIIpnRr/Po8zlgfOjnwocSbZ7WhnM9C0xVSjf2FLG
 5NboP5yrGCkg9WtxeiByfrB9qZ0oKqF77oDoEPNf7W4erCGfKyEqRs9Rj1MSYEwc8w
 FsHB8OJM+svzjwx39SBjYOADY6Zvl9Wi7SUh8NSMM4bt3hVkrXOgJMf6mUYEnte/FV
 zlsXwOhmnAVMw==
From: Kalle Valo <kvalo@kernel.org>
To: Tomasz Maciej Nowak <tmn505@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Luma WRTQ-329ACN BDFs
References: <2895a833-aa32-3b5d-e247-876916937556@gmail.com>
Date: Fri, 21 Jan 2022 15:48:57 +0200
In-Reply-To: <2895a833-aa32-3b5d-e247-876916937556@gmail.com> (Tomasz Maciej
 Nowak's message of "Fri, 28 Aug 2020 17:53:20 +0200")
Message-ID: <87o845ci7q.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_054900_674931_9BB99685 
X-CRM114-Status: GOOD (  11.85  )
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

> Description for what hardware this is:
> Luma WRTQ-329ACN, more known as Luma Home WiFi, is a Dual band wireless access point.
> Design based on IPQ40xx/AP-DK01.1-C2
> - one QCA40xx radio is used as 2.4GHz radio
> - one QCA40xx radio is used as 5GHz radio
>
> Origin of the board file (did you create it yourself or where you downloaded):
> Files were copied from flash chip of mentioned device, originally called:
> boardData_1_0_IPQ4019_Y9803_wifi0.bin
> boardData_1_0_IPQ4019_Y9803_wifi1.bin
>
> Ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k):
> QCA4019 hw1.0
>
>   bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=Luma-WRTQ-329ACN
>   sha256sum: ffeeeff8d8252694a9dd527a4feda82675416de34131e9291785cf353c217d62
>
>   bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=Luma-WRTQ-329ACN
>   sha256sum: ce19617b8926f985ab3ea3b2fca2b08c4456919b071c920e24b2789aa7205867
>
> The attached files have names derived from ids to be used with .bin file extension.

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=Luma-WRTQ-329ACN
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=Luma-WRTQ-329ACN

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 78 in total

https://github.com/kvalo/ath10k-firmware/commit/725d7f66e3c6659bbb83a091b02a60010d867e09

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
