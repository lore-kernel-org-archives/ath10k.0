Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62203C433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9cpZOhmZSGSTX5/OAQ1Dm5Wqmb6mPiUZYtoi9y9WI0=; b=j9xXvQfq+fgApH
	xI8J56mWQQ+KaNBUuNIU53OWxmE9sNQ+b5Nwvp0i1LqDfdM/gheEds0qISeuHIDlaptjRuEq9an06
	6aOw/Y9yHvWJOrdMEqW7VrO1MUWnEuonVFmBC9zyETcYiFIlGpiEM8LF2xrvgFj4+sqdX6+eFqBB6
	tsn8xsVQqv+KykFyFbMUjfRvhNRmbaqABNB3vPao58OwqfMHoQhtlJeQztmEkGOI2HbEuXwhDfMaX
	KdrYdveHOTdiPXJ2p9TTQ2r41EkXFhBkWvxU+s4pVqIpnB9Se9nIJdzsWUNOI8a3sFfrnH3Amar+R
	+4M+qlVIHMUsqZkI7ohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAtxJ-00F9nv-BY; Fri, 21 Jan 2022 13:27:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAtxF-00F9lT-Pz
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:27:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D007061381;
 Fri, 21 Jan 2022 13:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD30C340E1;
 Fri, 21 Jan 2022 13:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642771668;
 bh=MpX4R8eYqWSYwfL7+n7+bsdmtZcNJeFogXYrXQUvzpw=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=G7YdQCakE27Fr4BT/T8OYx03uSNF5GCuytcdXBZqFvEk/TW3NIqHCKidYgEMg0wBF
 IRuNPcFv8ObSakGH2xvPx5yY1Uxy3sMw9i/0PZNu7bnKWFDeiSgnvOBSEj4fv7OD6m
 TxclwlafdpQDNHk3a3TBQrGvsyWmv70CrwB7gbEAcMugOXQ+B9zbLFOurK+6qtgHG1
 tAXU/zIYCnNI3L70wv7kAfpbcvkRZoSylmU0122EcE1oVI/8JcTiyLtEfx+ZfGcxmu
 AIsqUrJkHEtKCkfTueNMmtKmNpXZCbbZrARDVqojXyByRjgotFYsqCMx8aRzzzGRnN
 vsHt8vklcosTA==
From: Kalle Valo <kvalo@kernel.org>
To: David Bauer <mail@david-bauer.net>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add AVM FRITZ!Repeater 1200
 specific BDFs
References: <e364f809-e91a-4553-1788-f1452c4d9c78@david-bauer.net>
Date: Fri, 21 Jan 2022 15:27:46 +0200
In-Reply-To: <e364f809-e91a-4553-1788-f1452c4d9c78@david-bauer.net> (David
 Bauer's message of "Thu, 26 Sep 2019 15:43:43 +0200")
Message-ID: <87v8yddxrh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_052749_918040_A3FBE216 
X-CRM114-Status: GOOD (  18.79  )
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

> this is a set of board.bin files for the AVM FRITZ!Repeater 1200 [0],
> which I wish to be added to the ath10k-firmware repository.
>
> As per the current "Submitting board files" guidelines [1]:
>
> * description for what hardware this is:
>   - it is a IPQ4019 based board [0]
>     - one QCA40xx radio is used as 2.4 GHz radio
>     - one QCA40xx radio is used as 5 GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>   - all files were extracted from official vendor firmware which was on
> the device and can be downloaded from AVM [2]
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>   - qca4019 hw1.0
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=AVM-FRITZRepeater-1200
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=AVM-FRITZRepeater-1200
> * sha256sum of each new board file to add
>   - bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=AVM-FRITZRepeater-1200
>     - c7b6026635bd32fe0709600edb024e1752151a0d038a1a8830f847bb815ad32b
>   - bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=AVM-FRITZRepeater-1200
>     - 5191621ea04058dad1709c492c559de24454374c9d286582154ff94a1978d248
>
> * attach the actual board file (board.bin)
>   - the name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=AVM-FRITZRepeater-1200
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=AVM-FRITZRepeater-1200

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 64 in total

https://github.com/kvalo/ath10k-firmware/commit/b529a8b98fd7cd8f37bf25b70d7b78fb756ec692

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
