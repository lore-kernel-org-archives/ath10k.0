Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBNdc-0007lz-7b
 for ath10k@lists.infradead.org; Sat, 13 Oct 2018 17:23:41 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: htt_rx: Fix signedness bug in
 ath10k_update_per_peer_tx_stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20181005184245.GA11700@embeddedor.com>
References: <20181005184245.GA11700@embeddedor.com>
Message-Id: <20181013172329.F0EA760B72@smtp.codeaurora.org>
Date: Sat, 13 Oct 2018 17:23:29 +0000 (UTC)
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
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>

"Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote:

> Currently, the error handling for the call to function
> ath10k_get_legacy_rate_idx() doesn't work because
> *rate_idx* is of type u8 (8 bits, unsigned), which
> makes it impossible for it to hold a value less
> than 0.
> 
> Fix this by changing the type of variable *rate_idx*
> to s8 (8 bits, signed).
> 
> Addresses-Coverity-ID: 1473914 ("Unsigned compared against 0")
> Fixes: 0189dbd71cbd ("ath10k: get the legacy rate index to update the txrate table")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9d9cdbf3f9ed ath10k: htt_rx: fix signedness bug in ath10k_update_per_peer_tx_stats

-- 
https://patchwork.kernel.org/patch/10628675/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
