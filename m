Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A7EC7618A
	for <ath10k@archiver.kernel.org>; Mon, 20 Mar 2023 05:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yrUXgGoECgEtTgEsgo59mxQhIxaRkUb2WOLBYRLaUaQ=; b=3ceyCcpGfZP65W
	OldsQiM9hWUdEOOqOq8NPhUR7fe3kGGN8RLIonhhVwKMRkKbV4a2yFflB2h2swhXz6YMa2CfTNn7D
	BJOuBBe3GtgEGiMzrBpSmkaEkJ0Mw8pen7xlNVY/PI3xTEZwWQ2HAS/zHmxBN1Py3wCccxNZofL7j
	fAMhS9CBy52HkQ0x5px9GXl3WlB0ZS+tmEJnIMqs9BhxzIL3am5n61nDeLcNqpVUkaTpmWc1osQKD
	IWGjTxLGGRxnvNTnroZ20QPLzOvYkh8usYL7Pzf/FHbZCgajarg/tSN9UmLh6rbY+FWCk5zg7zBkn
	Vcrfysucy23YURzSuUgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe8XT-008CW8-2H;
	Mon, 20 Mar 2023 05:58:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe8XQ-008CVN-2q
	for ath10k@lists.infradead.org;
	Mon, 20 Mar 2023 05:58:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 70637CE0FB6;
	Mon, 20 Mar 2023 05:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADE7C433EF;
	Mon, 20 Mar 2023 05:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679291902;
	bh=3yKLmbDPeOrdTfqUlBRRlWo2S4TSqbZZLeP6dyUiINU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=rTJeYeEn0rHOGfySajcRjGr4Vef3hJHLwWs4UXSQf13Etus+7r8RBzDux4MQDcfAg
	 p3lB57H++KbvwtMSB7KrRcMit0m99Cljmclznpz3XT2msxvtxXSxTk4ztS5i0lv5uM
	 gTvF2Wi3zC/ASf7tRI3I3D6daWfBB8BUo4RQ8S36uBhr8HB2u1Vq7HGRRF1ZGlmfQv
	 h6DX/PhUjRrJKilyuRNVOHxhZI68rWPMSawwpQ83y2v3y8oEHRJEvRATrulzv1GROB
	 gdiqsL8w0Q4aqOgEfYtjotkBGXNblKlsenssHY3Qn5Kkrbdjehqjaa11HPviRzvSl3
	 4OySkUWw9SpBw==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA9984 hw1.0: Add Edgecore-ECW5410-L specific BDFs
References: <6414891b.5d0a0220.6f9f5.e092@mx.google.com>
Date: Mon, 20 Mar 2023 07:58:19 +0200
In-Reply-To: <6414891b.5d0a0220.6f9f5.e092@mx.google.com> (Christian Marangi's
	message of "Fri, 17 Mar 2023 16:36:58 +0100")
Message-ID: <877cvchslg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_225833_108181_E4D03B7E 
X-CRM114-Status: GOOD (  16.19  )
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
>   - QCA4019 hw1.0
>
>     + bus=pci,bmi-chip-id=0,bmi-board-id=1,variant=Edgecore-ECW5410-L
>       sha256sum:
>       add8a7574c1bce2fedc43fdd69825510be68096aac86c5ef3e5bbd438ff18295
>     + bus=pci,bmi-chip-id=0,bmi-board-id=2,variant=Edgecore-ECW5410-L
>       sha256sum:
>       9786e70bcb62480d24ff8c5801fa1f211fe78eaf217566b4742b475b4034f4f1
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

I'll drop this one as there's v2.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
