Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJvrs-0001Dd-08
 for ath10k@lists.infradead.org; Mon, 14 Oct 2019 08:38:17 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k: fix array out-of-bounds access
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1570609089-22071-1-git-send-email-miaoqing@codeaurora.org>
References: <1570609089-22071-1-git-send-email-miaoqing@codeaurora.org>
Message-Id: <20191014083815.9E00860953@smtp.codeaurora.org>
Date: Mon, 14 Oct 2019 08:38:15 +0000 (UTC)
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
To: Miaoqing Pan <miaoqing@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Miaoqing Pan <miaoqing@codeaurora.org> wrote:

> If firmware reports rate_max > WMI_TPC_RATE_MAX(WMI_TPC_FINAL_RATE_MAX)
> or num_tx_chain > WMI_TPC_TX_N_CHAIN, it will cause array out-of-bounds
> access, so print a warning and reset to avoid memory corruption.
> 
> Tested HW: QCA9984
> Tested FW: 10.4-3.9.0.2-00035
> 
> Signed-off-by: Miaoqing Pan <miaoqing@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

c5329b2d5b8b ath10k: fix array out-of-bounds access
486a88498434 ath10k: fix memory leak for tpc_stats_final

-- 
https://patchwork.kernel.org/patch/11180701/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
