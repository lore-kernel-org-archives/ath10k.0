Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C221EC433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8l23Jeq47GJIdkaaFklZzbN/qnA2q1thbUZCMlXk088=; b=WM1QVPBRUexWrA
	xoVwpHLRtR5CU7l65o07eHuHMX6RSvEjy8BuzI1iPydMqQLZqGida5MTVdkEhXkYORpQms9n9xB2i
	kFs7m+4xKAYlwNBbcskRvwZsWDLhTLHQy8HnL2wHs67Gz7oOLS12ZCv4WS8TnQ1p9z6NEnpbRSu+8
	l5NjHfj7zRav44BIoyW+bGI0M14WWQ4cwhK0KkhoDuxa7NwYkyZs0wmJ6nO2/0MCzoxrWIswMGZgq
	qJSVLs1AE6X8MVDOTWn6mZvQoBd+y45mLmWwqZ8UcJCkedl3ugXZZtCvvcgh9w5d6EhN1MeDPtN06
	RGlPcPDNTP/tHYmih8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAu48-00FCBo-6w; Fri, 21 Jan 2022 13:34:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAu43-00FC9z-VM
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:34:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C641B81FB4;
 Fri, 21 Jan 2022 13:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0EE9C340E1;
 Fri, 21 Jan 2022 13:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642772089;
 bh=sRo9DgGC/i80PVA8HWQ8lXEpHdVZU5VkRjRojm9MjMY=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=F6cKgJdI0GEZS8uYXWyLfagBKXQoviHQulS2/UC8rm3T3Rq81+Bol87LQ2QWdBwff
 Xgkc8SNmdxs6yIWfFyCiXHkzljMVpNng6YHDocWePklHuSeOP+NnDsD4ppqCbtlVn0
 26x5pl0oWROhKb3mABrWf0uPUy/5fMoU+9gk5wr63mPyJlCT4kmZ4APUThDh+8mROd
 eRVVrprTUQ0WQMse3eeuBnpg0O4XSnXc7BJeNB2G/+XrVB7G3faOcnQV242iE5hwEG
 pIfTf/hTlX+0QpNDP3Q/G+3gf0f2X0ayho87622Trh3SVxfHoGAUNMAr8jAeGwHNqE
 sTcr7OaLhRrBg==
From: Kalle Valo <kvalo@kernel.org>
To: David Bauer <mail@david-bauer.net>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Aruba AP-303 specific BDFs
References: <8d42b55b-b4d4-5156-dc85-524b8cabd29d@david-bauer.net>
Date: Fri, 21 Jan 2022 15:34:46 +0200
In-Reply-To: <8d42b55b-b4d4-5156-dc85-524b8cabd29d@david-bauer.net> (David
 Bauer's message of "Fri, 3 Apr 2020 02:14:54 +0200")
Message-ID: <87a6fpdxft.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_053452_190460_E3E7B190 
X-CRM114-Status: GOOD (  18.49  )
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

David Bauer <mail@david-bauer.net> writes:

> this is a set of board.bin files for the Aruba AP-303,
> which I wish to be added to the ath10k-firmware repository.
>
> As per the current "Submitting board files" guidelines [1]:
>
> * description for what hardware this is:
>   - it is a IPQ4029 based board
>     - one QCA40xx radio is used as 2.4 GHz radio
>     - one QCA40xx radio is used as 5 GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>   - all files were extracted from official vendor firmware which was on
> the device
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>   - qca4019 hw1.0
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Aruba-AP-303
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Aruba-AP-303
> * sha256sum of each new board file to add
>   - bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Aruba-AP-303.bin
>     - deeeee5b1408681c68699d068eea297aa970a64fef4f04ad4fc30413e186d67f
>   - bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Aruba-AP-303.bin
>     - b636eb18ed7c2df6a6f2567009bf95c7c2252feea146b4f05d8757514fe1d6e1
>
> * attach the actual board file (board.bin)
>   - the name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Aruba-AP-303
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Aruba-AP-303

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 73 in total

https://github.com/kvalo/ath10k-firmware/commit/46a4f4a7165fc0ed51abfa70fb3713791c394026

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
