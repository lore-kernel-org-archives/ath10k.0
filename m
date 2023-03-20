Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9943CC6FD1D
	for <ath10k@archiver.kernel.org>; Mon, 20 Mar 2023 15:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zL1qQdFpvknGTaQYK8BuhpYCq6caz5uaS8PBvU2LrjA=; b=hnxjomCO2Ri6KB
	ZXTwO+TB8DIK7NzgNvOGblaDMILXeivuU1SZeH3QVWrIQZ8gV1RnML2CWVApyJIlHuRE0cKaueiIq
	MFTaHkMUPq+NWoCnnLwoG76QBfLIaZY7RudyeNI42AdU7jzEYJ3wpFbGGC8H8Fn8Uv0Uhwwic6ebE
	60SrQyqRleMSNvXUkUrOTmHsBzYAylIqKnD55fFKUUtguSjXigqId7Efyo5Rjp6lmxSa3phoWY7fR
	Y1vkzwc1bM9V7OhLaMDPj2Py4BzsaWH4UYgF4ldke2JmuIKPcb5+coYK6YNQnQVeJ0tH6FHs3fRHv
	Dg2rzHQ4I/TvHI2TbAbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHdo-009bNL-02;
	Mon, 20 Mar 2023 15:41:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHdk-009bMG-3C
	for ath10k@lists.infradead.org;
	Mon, 20 Mar 2023 15:41:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 802C2B80ECE;
	Mon, 20 Mar 2023 15:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE839C4339B;
	Mon, 20 Mar 2023 15:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679326898;
	bh=QjJNrUnvBi1VCrd5IZHE7yO404Z2KBmKQ4BQiPlebbU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Z/Petf5TipqFKCJZPn9sVsUR/v82hhRz293Rh8NXBusBNTCteo5TGgASWSgd9mw5U
	 1H+wXHfKv/FodHm3VqQSUd8fdyR9u+Xrqe2OKGJUZUtVI5oBvON/Rx2wORyN5tcY9j
	 KCnYcIzspxybCXhG5A7xDMicAovEmpLou34KaEAClx4JNDlGy+8ks3NfoIpWWXl8f3
	 aFqMxgN/8bGV8UVyTQxPUPUPV6eajFS00OC14qFmyH8LgeslgV/UsQ73mrPX/wGz61
	 JS3TTdLGzm/I17IJ30MUpji/b9fTNAOPqVSnTUt02FztmhyUmFJtdgCmwoiNg24UwE
	 ZuYITheyFE+Ug==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Qxwlan-E2600AC-C1 specific BDFs
References: <64149043.5d0a0220.5f4b7.e8d1@mx.google.com>
Date: Mon, 20 Mar 2023 17:41:32 +0200
In-Reply-To: <64149043.5d0a0220.5f4b7.e8d1@mx.google.com> (Christian Marangi's
	message of "Fri, 17 Mar 2023 17:07:29 +0100")
Message-ID: <87wn3bh1lf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_084141_178704_6B347D1F 
X-CRM114-Status: GOOD (  16.21  )
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
>   - it is a QCA4019 based board
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
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Qxwlan-E2600AC-C1
>       sha256sum:
>       a3b3687c1d80dc92b5d78b1aa205f1463bd11f4efc29f7311bdaabc28c1d3eb2
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Qxwlan-E2600AC-C1
>       sha256sum:
>       44f3f2e8d9ff9396d3ab73db3dfeb864cef20d7e43032a133fa8a7c74e5d7ad4
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Qxwlan-E2600AC-C1
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Qxwlan-E2600AC-C1

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 130 in total

https://github.com/kvalo/ath10k-firmware/commit/9feef68f00133885952b29b5d79512c339382e7a

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
