Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A32C433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZmrSlI1PvtCaR7Swh9mlt347ksFdHxIO1WOpt61oO4=; b=LqXNFLPVPhHwFw
	dOieTuXafWsgpH7GcB9RI4lxYExhfekT55Ks0BaikmaYuq/OQa9U1jvuvXAteIeBSTkS+nZJLPxb4
	bwmoRBfdlQSj3QIG/t8W9S9Zk/exjieIiERbAGm/M/GmXX01npxH4VGKtLw+ZL2aRokQOQYgX4uYX
	sIupj6ZsoFPVpAyx1B1k4NQ8aVAGU1lBBnH3WUlfvKgnbMkKKyuoy+PvKAvgNVcL1n4mB/IA6U6IX
	Oj9yn7/WE3l1T1Nr43XUFVCy8vuMeXF8VW5M84OzUUhfd/Q8GTQczNYNfk6OOaGR/Q4ZhLzK4RoKr
	zF56j4HOKb0+TFVxDhEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuFF-00FDQD-Rj; Fri, 21 Jan 2022 13:46:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuFD-00FDPm-14
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:46:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 53C6961440;
 Fri, 21 Jan 2022 13:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C30AC340E1;
 Fri, 21 Jan 2022 13:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642772781;
 bh=N/VL3xF8BKdbw5wVcFJJZyXZsxW15gtnrgxsjuP+N+I=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=Mp8xyGrsnWyxCT4vd7UhLCNlda4eKKaaWfbPRCaGgZvh5gs3a602h/fHxbvNQe4tR
 +EOwiSxudPx1VUOd+tGqxhmERKHENovqkc9KBEBYm50kNVvGpC1P7zW4lCDlNHFaDb
 QOsBlKX3VSsjzWsPsduMkDKnWgmVJ98xh5E2iXpZokC2IOKU0I+y9C5vSX4/hDNrXC
 p+yq8/KNWbGyybFOF7W5EWgzomSe/fPEQzFKImBoXUXaXE28PiXOS7gSMwA6k3p7N2
 LA3GB2ysQyQqJGtYy8NWJ1OkMyaa6kHDbYV/ho0zU7iD2+WE2FZhivhZOZ1peZWdFB
 llOYRAdzquvzg==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robimarko@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Update 8devices Habanero specific
 BDFs
References: <CAOX2RU6wCpdtUMSrnaPK9Bg8hyn-wqnAeZgszYe-T45MH4E+cw@mail.gmail.com>
 <874k5xfcf0.fsf@kernel.org>
 <CAOX2RU4r338J_iAbK50OFQbuWP1_KgMfCGm2s0So2P+2P=gwkg@mail.gmail.com>
Date: Fri, 21 Jan 2022 15:46:16 +0200
In-Reply-To: <CAOX2RU4r338J_iAbK50OFQbuWP1_KgMfCGm2s0So2P+2P=gwkg@mail.gmail.com>
 (Robert Marko's message of "Fri, 21 Jan 2022 14:34:13 +0100")
Message-ID: <87wnitcic7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_054623_138683_791C976E 
X-CRM114-Status: GOOD (  25.43  )
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

Robert Marko <robimarko@gmail.com> writes:

> On Fri, 21 Jan 2022 at 14:25, Kalle Valo <kvalo@kernel.org> wrote:
>>
>> Robert Marko <robimarko@gmail.com> writes:
>>
>> > I am currently working on the 8devices Habanero support for
>> > OpenWrt. This
>> > AP requires two special BDFs to get the Wi-Fi PHYs working (correctly). The
>> > bmi-board-id='s would clash with one of the the IPQ401X AP-DK boards because
>> > QCA doesn't provide special IDs for customers and seems to use the AP-DK
>> > board-ids in the wifi firmware to change its behavior.
>> >
>> > This update improves 5GHz radio.
>> >
>> > Now to the questions from the wiki page [1]:
>> >
>> > * description for what hardware this is:
>> >
>> >   - it is a QCA4019 based module
>> >   - one QCA4019 radio is used as 2.4GHz radio
>> >   - one QCA4019 radio is used as 5GHz radio
>> >
>> > * origin of the board file (did you create it yourself or where you
>> >   downloaded)
>> >
>> >   - it was pulled from the 8devices OpenWrt fork
>> >   - it is based on latest version
>> >
>> > * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>> >
>> >   - QCA4019 hw1.0
>> >
>> >   + bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=8devices-Habanero
>> >      md5sum:
>> >      64d0817da715875483d323f2bb0c898c
>> >
>> >   + bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=8devices-Habanero
>> >      md5sum:
>> >      56202ea33e96f16c65b75d464451c251
>> >
>> > * attach the actual board file (board.bin)
>> >
>> >   - The name of the files are equal to the id string in the board-2.bin
>> >     (minus the ".bin")
>>
>> Do note that it seems that only one board file contents was actually
>> changed, was that on purpose?
>
> Yes, only the 5GHz radio had an update.

Good, thanks for checking.

> 8devices released new BDF-s last year that fix the thermal readings.
>
> Do you mind if I send the updated ones upstream?

Sure, why not? My board file queue is just really long but I'm going
through it at the moment.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
