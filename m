Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7cKx-0005fc-LB
 for ath10k@lists.infradead.org; Mon, 17 Aug 2020 10:26:01 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix the size used in a 'dma_free_coherent()' call
 in an error handling path
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200802122227.678637-1-christophe.jaillet@wanadoo.fr>
References: <20200802122227.678637-1-christophe.jaillet@wanadoo.fr>
Message-Id: <20200817102538.BB16BC43391@smtp.codeaurora.org>
Date: Mon, 17 Aug 2020 10:25:38 +0000 (UTC)
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
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, pillair@codeaurora.org, kuba@kernel.org, davem@davemloft.net

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Update the size used in 'dma_free_coherent()' in order to match the one
> used in the corresponding 'dma_alloc_coherent()'.
> 
> Fixes: 1863008369ae ("ath10k: fix shadow register implementation for WCN3990")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

454530a9950b ath10k: Fix the size used in a 'dma_free_coherent()' call in an error handling path

-- 
https://patchwork.kernel.org/patch/11696383/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
