Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f84AQ-0008LR-UN
 for ath10k@lists.infradead.org; Mon, 16 Apr 2018 13:27:36 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 3/4] ath10k: Enable SRRI/DRRI support on ddr for WCN3990
References: <1523370212-8778-1-git-send-email-pillair@codeaurora.org>
 <1523370212-8778-4-git-send-email-pillair@codeaurora.org>
Date: Mon, 16 Apr 2018 16:27:20 +0300
In-Reply-To: <1523370212-8778-4-git-send-email-pillair@codeaurora.org>
 (pillair@codeaurora.org's message of "Tue, 10 Apr 2018 19:53:31
 +0530")
Message-ID: <87y3hnp9hj.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: pillair@codeaurora.org
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

pillair@codeaurora.org writes:

> From: Govind Singh <govinds@codeaurora.org>
>
> SRRI/DRRI are not mapped in the HW Shadow block and can lead
> to un-clocked access if common subsystem in the target is
> powered down due to idle mode.
>
> To mitigate this problem SRRI/DRRI can be read from
> DDR instead of doing an actual hardware read.
> Host allocates non cached memory on ddr and configures
> the physical address of this memory to the CE hardware.
> The hardware updates the RRI on this particular location.
> Read SRRI/DRRI from DDR location instead of
> direct target read.
>
> Enable retention restore on ddr using hw params to enable
> in specific targets.
>
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>

[...]

> +	for (i = 0; i < CE_COUNT; i++) {
> +		ctrl1_regs = ar->hw_ce_regs->ctrl1_regs->addr;
> +		ce_base_addr = ath10k_ce_base_address(ar, i);
> +		ath10k_ce_write32(ar, ce_base_addr + ctrl1_regs,
> +				  ath10k_ce_read32(ar,
> +				  ce_base_addr + ctrl1_regs) |
> +				  ar->hw_ce_regs->upd->mask);
> +	}

This gives a checkpatch warning:

drivers/net/wireless/ath/ath10k/ce.c:1917: Alignment should match open parenthesis

You could fix that, and make the code a lot more readable, with
something like this:

tmp = ath10k_ce_read32(ar, ce_base_addr + ctrl1_regs);
tmp |= ar->hw_ce_regs->upd->mask;
ath10k_ce_write32(ar, ce_base_addr + ctrl1_regs, tmp);

Usually it's a good practise avoid making clever tricks, simple code is
a lot easier to read.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
