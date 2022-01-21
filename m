Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF6DC433EF
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5JsJIr1m+nQ1ef4NtMTkhDPtNerLi86o6Vh4T/bZUI=; b=t9/4Hp6GoWJyHG
	C+MEgNEzj03PjpKqQznpgBLhINFu1LdwLJFk8sGGZZ3ifUu/qwG+52jUH0jp/GXN70gnzq/O6mpcU
	oZI2N/vN6p2kSXU5kcLv/8QWJgrxBDLO+Rdvfb00cBPKUxRVYtAMaGU6cZBDAeXdB4IzYit7egTpg
	Ry21qmYt1WTiQIMfvxpNvhxyPQSgAk8loFB7/mPFH9HYzOgbhqPL3tsROoQdqNjXMJRbbFqReXcOA
	QpnxUljBv/uKfl2LK0ffmrB0N40ZeXiVDNgJKi/sHWgA5rIhLmjp0aYOgbrZKvEwzZ+iy+i73ryAf
	97SrAtcJRikI6dC4u+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAu2g-00FBoS-Dw; Fri, 21 Jan 2022 13:33:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAu2d-00FBnh-L0
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:33:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 307146165D;
 Fri, 21 Jan 2022 13:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A818C340E1;
 Fri, 21 Jan 2022 13:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642772002;
 bh=OQgt73k12qACkkWD99LuprqXTLsmmvcdU4FinERvrjA=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=iz1J5i/YeXvZ+h9RINE1vkgpUYsaAiEBo/sOwDyxtx2kY3Qp/aEwa3xQ5NCBGK+Ws
 +JJRIAdNxP+OW/jrNWlfhmlRsz1JNOge4r57HycTm4lgd5injNa3HaJmfwqmMkwARo
 PLJtMHqY0ZxNAyLRcaJ0MOVIrbt5bdcx0X3xc9FcITdrsrV9SNIhZUnoIII5aTqcdr
 Hj8LTTIgaaLaT2XxS1qUrTeJ3DBMScCbzT6/zyVpd2Qjg/2zhZgyQs0jfmmj+H3idi
 OVbvpmS4uqcfSnJAsHLpG8Dq+586mtEOOinXwSpRVU4BhMr+hzxiPFM4W9mtRcmFMS
 FlbTkUmKmYzLA==
From: Kalle Valo <kvalo@kernel.org>
To: David Lam <david@thedavid.net>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add MobiPromo CM520-79F
References: <CAAj=pSDJkTXFzh=rKG9+_t3_9MZuKpFPB+T5ZNzZj3KoCACUOA@mail.gmail.com>
Date: Fri, 21 Jan 2022 15:33:20 +0200
In-Reply-To: <CAAj=pSDJkTXFzh=rKG9+_t3_9MZuKpFPB+T5ZNzZj3KoCACUOA@mail.gmail.com>
 (David Lam's message of "Mon, 23 Mar 2020 00:44:50 -0700")
Message-ID: <87ee51dxi7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_053323_749497_E1854995 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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

David Lam <david@thedavid.net> writes:

> This request is to add official OpenWrt support for the MobiPromo
> CM520-79F device which uses two BDFs for its QCA40xx 2.4/5Ghz radios.
>
> Wiki questions:
>    - IPQ4019 based board
>    - One QCA40xx radio for 2.4Ghz, one QCA40xx radio for 5Ghz
>    - Extracted from vendor stock OpenWrt firmware (QCA4019 hw1.0)
>    - 496396e221f0c0550899fa851e507b92ffdfb8d671ff7a6734bedd31b96e862e
>   /lib/firmware/IPQ4019/hw.1/boardData_1_0_IPQ4019_DK04_2G.bin -
> bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=CM520-79F.bin
>    - c9a0bf20c92ac3891bbb3a3b6a9500d95dd678c98b7118a65b568d3bb06adb6d
>   /lib/firmware/IPQ4019/hw.1/boardData_1_0_IPQ4019_DK04_5G.bin -
> bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=CM520-79F.bin

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=CM520-79F
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=CM520-79F

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 71 in total

https://github.com/kvalo/ath10k-firmware/commit/0e51daca16518d9acb287e92eb6ce41a27ee22b2

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
