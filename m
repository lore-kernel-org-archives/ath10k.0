Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtd1I-0003r1-No
 for ath10k@lists.infradead.org; Tue, 12 Feb 2019 18:43:03 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix line length warning in
 ath10k_ce_alloc_dest_ring()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1549636171-32628-1-git-send-email-kvalo@codeaurora.org>
References: <1549636171-32628-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20190212184259.CA1776086B@smtp.codeaurora.org>
Date: Tue, 12 Feb 2019 18:42:59 +0000 (UTC)
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> Commit 750afb08ca71 ("cross-tree: phase out dma_zalloc_coherent()") introduced
> a new checkpatch warning:
> 
> drivers/net/wireless/ath/ath10k/ce.c:1602: line over 90 characters
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

acc65103c15c ath10k: fix line length warning in ath10k_ce_alloc_dest_ring()

-- 
https://patchwork.kernel.org/patch/10803205/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
