Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85008C433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 14:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEpb84ue6KP7PBv/UOlYRyl2zNY0fgAqRQmYnlYXdVQ=; b=gTvwZ0cHWNDHjR
	FJj0ln0sxlFce9ErePcQzeKoBf3RuZGsLw9bWr14c3hiKDcPIIqaiGL0aBseBxg/y+JsZvVv8HN5i
	BkCKac7i5jpydDeliJA3Dlu6AZAUNsjM4GQ7Y1hWggrQpfI4RZbtNEUrYldtb+wygNRDcGNmfu/lP
	Hpgg+wtheHVdCFJCFHRAr73pNZM8KCi8PcrP0JuXPiReOPtgPvr4lO5NZ5oRWMhNSnbzCqU5He5xi
	5bWGnObVOcnMDxcLAvDe5dSoZ5xBn6LLLoALiWpZ5eSCT6V7lWGTUvEnx+xtDO0hc9+f/gcm2uSvV
	g/zD9piFypiXCDrnoNLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAua0-00FJwC-6V; Fri, 21 Jan 2022 14:07:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuZu-00FJse-Hm
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 14:07:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0B16B616EF;
 Fri, 21 Jan 2022 14:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3884C340E1;
 Fri, 21 Jan 2022 14:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642774065;
 bh=7NgDWk0/aC/jFQkwTuk2Yt1ZVqwG4GBo77KOVvSpPjI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=guo77U8zVbJwjcAz6ytce301B1KJjMg1Ol9HsUZVy+DtFDEvXgVU3j0OghM53mT7Q
 JpLAFVcBBPAXk+IJR6ATUIFSFe1duLS2fKnlQecTni4pUQM9kmlzMnMVuHklwcV9ry
 yLgRo3s2OU36eIDzOTVgRlbb1sdUuc0zW856XKk4A6xyQGGyCOvJQWg6IAX7lszNx6
 Ny21cnhQaNDprU6xE0GpJExwx202oR5CnDAm7cl4TkxzLh7jwDCUMuMC2jglUfafqd
 F+2OzyBL/tBRtvKTb9UiTlR7vOaAiVJhI+RS2bhPDYIyw0IfjmS+3RmJEpv2lVXkh4
 Q9/V8Xt4zCbHA==
From: Kalle Valo <kvalo@kernel.org>
To: Yanase Yuki <dev@zpc.sakura.ne.jp>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA9984 hw1.0: Add NEC Platforms WG2600HP3
 specific BDFs
References: <20200711093201.GA1053@dev-email>
Date: Fri, 21 Jan 2022 16:07:43 +0200
In-Reply-To: <20200711093201.GA1053@dev-email> (Yanase Yuki's message of "Sat, 
 11 Jul 2020 18:35:34 +0900")
Message-ID: <87r1919o7k.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_060746_672708_8A7255A3 
X-CRM114-Status: GOOD (  12.55  )
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

Yanase Yuki <dev@zpc.sakura.ne.jp> writes:

> These files are NEC Platforms WG2600HP3 specific BDFs extracted
> from stock firmware.
>
> Required information:
>
> * description for what hardware this is:
>   - it is a IPQ8062 based board
>     - one QCA9984 radio is used as 2.4GHz radio
>     - one QCA9984 radio is used as 5GHz radio
>
> * origin of the board files
>   - extracted from stock firmware
>
> * ids to be used with the board files
>   - bus=pci,bmi-chip-id=0,bmi-board-id=3,variant=NEC-Platforms-WG2600HP3
>     - md5sum: c2cca25e45ba07320ecf4a4b16b9a9bc
>     - sha1sum: 0a8f6701fc4654efe67bd3af897a77208c0434c7
>   - bus=pci,bmi-chip-id=0,bmi-board-id=4,variant=NEC-Platforms-WG2600HP3
>     - md5sum: a552038db2da69a9e91e38e607cceb56
>     - sha1sum: de70d1dba9bb40c96ca1c26d85f839d024867a83

Thanks, added to QCA9984/hw1.0/board-2.bin:

New:
bus=pci,bmi-chip-id=0,bmi-board-id=3,variant=NEC-Platforms-WG2600HP3
bus=pci,bmi-chip-id=0,bmi-board-id=4,variant=NEC-Platforms-WG2600HP3

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 18 in total

https://github.com/kvalo/ath10k-firmware/commit/43ebf8e2b0b3b9a8c9e79a967c6dc5b6b9eba7ad

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
