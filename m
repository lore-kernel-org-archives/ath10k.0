Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6yp3-00074v-8X
 for ath10k@lists.infradead.org; Mon, 01 Oct 2018 14:06:15 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k: Move napi_enable to hif_start for consistent
 pairing
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180920050426.4113-1-govinds@codeaurora.org>
References: <20180920050426.4113-1-govinds@codeaurora.org>
Message-Id: <20181001140505.9C4BA60C81@smtp.codeaurora.org>
Date: Mon,  1 Oct 2018 14:05:05 +0000 (UTC)
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Govind Singh <govinds@codeaurora.org> wrote:

> There is unbalanced napi_{enable,disable}() behavior as they
> are being called from hif_snoc_{power_up/stop).
> 
> The fix is to call napi_enable() from ath10k_snoc_hif_start()
> so that it matches with napi_disable() being called from
> ath10k_snoc_hif_stop().
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

752ed2a229c6 ath10k: move napi_enable to hif_start for consistent pairing
393b9b0f830e ath10k: disable napi before resource cleanup to avoid "use after free"

-- 
https://patchwork.kernel.org/patch/10606859/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
