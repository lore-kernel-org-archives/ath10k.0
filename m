Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8B7C433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6yDybwxcYoO/rDU9oBu4K/FLwMhRR0REdvXwQSv6sds=; b=Ls9X4Ra5Bxyuyq
	/MqhhZdYFfr24M9Fr2bqfEprHk3LquDJ0nHsJfouOj2VdFfbrIhjaAf42zwPXbIdsG0sWi2bpbKJB
	ClpEH9tsi95aXFIGLiIRM/B6MrRSyDAIR0Xg91RK/iOAhrAUFHwkVN2jOHktQ+1IcpBou4Zsgh+Fm
	QXj5ufTxDdjrwLnB1rw8fJNqGnMjRIrqpNT/VcJiccDHQlXP1Xgw7HF7eO4IZ/LBX0CvsjiaC3lX1
	BXJTVdlFIbeNS4DdB31tWP4TA+TM1xINaQdYoGluSiisYIOtU/4+al61zupo3q4/wwD72WPX4vl2J
	BRTbezYZCHMCI1X1R+/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAtjs-00F3Pe-8O; Fri, 21 Jan 2022 13:14:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAtjp-00F3OY-Aw
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:13:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0EE2CB81EAC;
 Fri, 21 Jan 2022 13:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B1FC340E3;
 Fri, 21 Jan 2022 13:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642770834;
 bh=LcQmaNEvoRsTA2l+KmtvGQb9/2mXc4DdejSbh5lCIfU=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=RB7LFw9ZeucGAPE9q7FOMs5d8k1ng2rFp/Cf/KzZDS/HfSrlLarLLuAnpeoNYjz36
 FugznJkNKjJguB4XiWgYad21hXoeNtnyu6MZIr27KkLV2GQy/AV7JdpLly5huEp9w1
 HNokt5vSd6egE/JtZC4KbLNwAYnGS0xs1/l1aWIl7CmasWoQSExNv6/iFW16qXOh3x
 qr1t8p0roropvnMzKl27vt657txYxB+9zzmKWfM/7P4zmRMb705LLTKZYrfTAcH9hN
 +m5flC3eGUrDlQjtYwbe4t4ta6VUkQa1sS0M6BFFXuX6yaWnamOXTFVBTrWfLZMUAQ
 +jl/ZiYyA90Eg==
From: Kalle Valo <kvalo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Update OpenMesh A42 specific BDFs
References: <3587857.nm731UhE9D@bentobox>
Date: Fri, 21 Jan 2022 15:13:52 +0200
In-Reply-To: <3587857.nm731UhE9D@bentobox> (Sven Eckelmann's message of "Mon, 
 01 Jul 2019 11:43:06 +0200")
Message-ID: <87tudxfcz3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_051357_543554_D314FDA1 
X-CRM114-Status: GOOD (  22.03  )
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

Sven Eckelmann <sven@narfation.org> writes:

> [resent of mail from 2019-06-11; seems like @datto.com mail server ate the
>  outgoing mails]
>
> Hi,
>
> The OpenMesh AA2 AP requires two special BDFs to get the Wi-Fi PHYs working 
> (correctly). The  bmi-board-id='s would clash with one of the the IPQ401X 
> AP-DK boards because QCA doesn't provide special IDs for customers and seems 
> to use the AP-DK board-ids in the wifi firmware to change its behavior. 
>
> This update contains:
>
> * add of the antenna gain
> * CTLs for DFS channels
>
> It supersedes https://lkml.kernel.org/r/2339663.SsakJrGtyZ@bentobox
>
>
> Now to the questions from the wiki page [1]:
>
> * description for what hardware this is:
>
>   - it is a QCA4019 based module (based on qcom-ipq4019-ap.dk01.1)
>   - one QCA4019 radio is used as 2.4GHz radio
>   - one QCA4019 radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - it was created by the ODM and QCA for the OpenMesh A42
>   - was provided by the ODM to OpenMesh for this product (this includes
>     distribution)
>   - it is the latest release from 2018-11-28 (with fix to have
>     antennagain at correct position)
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=OM-A42
>       md5sum: 3556213619f465b53348836ff7444f01
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=OM-A42
>       md5sum: f836ec38fe8b5c169a2a33a9fd9afae7
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:


Changed:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=OM-A42
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=OM-A42

Deleted:

0 board image(s) added, 2 changed, 0 deleted, 50 in total

https://github.com/kvalo/ath10k-firmware/commit/bc425879a4f43bd2b0c2c56298fc88ebeb711af0

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
