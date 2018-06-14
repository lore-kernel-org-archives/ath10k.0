Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTTux-00066f-AW
 for ath10k@lists.infradead.org; Thu, 14 Jun 2018 15:12:08 +0000
MIME-Version: 1.0
Subject: Re: [v2] ath10k: fix incorrect size of dma_free_coherent in
 ath10k_ce_alloc_src_ring_64
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180601112548.22592-1-yuehaibing@huawei.com>
References: <20180601112548.22592-1-yuehaibing@huawei.com>
Message-Id: <20180614151157.03850606DB@smtp.codeaurora.org>
Date: Thu, 14 Jun 2018 15:11:56 +0000 (UTC)
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
To: YueHaibing <yuehaibing@huawei.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, davem@davemloft.net

YueHaibing <yuehaibing@huawei.com> wrote:

> sizeof(struct ce_desc) should be a copy-paste mistake
> just use sizeof(struct ce_desc_64) to avoid mem leak
> 
> Fixes: b7ba83f7c414 ("ath10k: add support for shadow register for WNC3990")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

5a211627004e ath10k: fix incorrect size of dma_free_coherent in ath10k_ce_alloc_src_ring_64

-- 
https://patchwork.kernel.org/patch/10443063/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
