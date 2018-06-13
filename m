Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fT4JK-0000s7-9X
 for ath10k@lists.infradead.org; Wed, 13 Jun 2018 11:51:36 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix memory leak of tpc_stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180527211702.23778-1-colin.king@canonical.com>
References: <20180527211702.23778-1-colin.king@canonical.com>
Message-Id: <20180613115123.D67D36074D@smtp.codeaurora.org>
Date: Wed, 13 Jun 2018 11:51:23 +0000 (UTC)
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
To: Colin Ian King <colin.king@canonical.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S . Miller" <davem@davemloft.net>

Colin Ian King <colin.king@canonical.com> wrote:

> Currently tpc_stats is allocated and is leaked on the return
> path if num_tx_chain is greater than WMI_TPC_TX_N_CHAIN. Avoid
> this leak by performing the check on num_tx_chain before the
> allocation of tpc_stats.
> 
> Detected by CoverityScan, CID#1469422 ("Resource Leak")
> Fixes: 4b190675ad06 ("ath10k: fix kernel panic while reading tpc_stats")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

260e629bbf44 ath10k: fix memory leak of tpc_stats

-- 
https://patchwork.kernel.org/patch/10429553/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
