Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E9AC433EF
	for <ath10k@archiver.kernel.org>; Mon, 17 Jan 2022 12:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tr+brr2wppAXbrKbvt2wDaU1bk+pJgc064Z+3rLzIBw=; b=Z0cRo/vxew4gXt
	58UGsi8zWsyKciTiDXF3vHhAiq92GpxIjtV/V4YZJoPwlKLXYKzV40Seq3h32MKiC3kUTf6ZW7ALc
	xagvmW6NRw50krvUhXHhY/1K7p482Z0LDYVFh1SMGOfTZXVQcGY3HsjAQzDym8mAjrZCfYpI4+wri
	KHsy5x1izlOQDP+rF3Y8Mjutayy1dUqhV1DDOVhXYHyxufRexst2O7XeIZQBVrxipLrRdPsMG9yfn
	2OdU9fATpqAZg3RVgKS6mrT97Qh4go0SU2JHPsWnHjpCGW2M23lH3QOR/jnsbxEe5Idkr19dHLyVX
	+f0UB91KGwo0BrrUHd4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9RK8-00Evcm-6E; Mon, 17 Jan 2022 12:41:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9RK5-00EvbO-15
 for ath10k@lists.infradead.org; Mon, 17 Jan 2022 12:41:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5A3B9B81054;
 Mon, 17 Jan 2022 12:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE793C36AE3;
 Mon, 17 Jan 2022 12:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642423277;
 bh=xxJoEFGj3wMM7MoTzGkGqzbFVQtRZzLW7rU54sUS3rA=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=XwEMN3IpFENJ5j2TbwquLb8ywuTZwInN8+No5wRLRypoKEwvTI46HeqE/5+NlRNCV
 Em3ljHsjn0lb47c7q0yM1psByRpdC+c11dSFyW4obUsjSgSjQ6FAh8RTYe/mSS2zKQ
 6TEv8iGpRceOLthTiWYUBTYv8R3rZs65IehTudgf3VbuO++AZ2lbTfuUwFG+dlcB1t
 VWwn/PJhaD/DZgIAcHUnsXMxWe7svDxQ3oqhKHRtJ/Y9iUDAs8FSdgbyn4gd1M3eB8
 tAg0kl5m59uXbS0apvPuMwISLUnOggwXp/SxFs0ZZrgTqWkQ7e2SRg9sFejsn3kdwD
 Z1ITMqaIaWNig==
MIME-Version: 1.0
Subject: Re: [PATCH 7/8] ath10k: Use platform_get_irq() to get the interrupt
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211224192626.15843-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211224192626.15843-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164242327317.27899.10499132550349029858.kvalo@kernel.org>
Date: Mon, 17 Jan 2022 12:41:14 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_044121_245547_69F906AC 
X-CRM114-Status: GOOD (  10.38  )
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

Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

f14c3f4db9cb ath10k: Use platform_get_irq() to get the interrupt

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211224192626.15843-8-prabhakar.mahadev-lad.rj@bp.renesas.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
