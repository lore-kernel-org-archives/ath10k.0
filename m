Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO0hj-00089E-Vq
 for ath10k@lists.infradead.org; Tue, 07 May 2019 14:04:27 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Check tx_stats before use it
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1556804210-28599-1-git-send-email-yintang@codeaurora.org>
References: <1556804210-28599-1-git-send-email-yintang@codeaurora.org>
Message-Id: <20190507140423.AF01060A33@smtp.codeaurora.org>
Date: Tue,  7 May 2019 14:04:23 +0000 (UTC)
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
To: Yingying Tang <yintang@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Yingying Tang <yintang@codeaurora.org> wrote:

> tx_stats will be freed and set to NULL before debugfs_sta node is
> removed in station disconnetion process. So if read the debugfs_sta
> node there may be NULL pointer error. Add check for tx_stats before
> use it to resove this issue.
> 
> Signed-off-by: Yingying Tang <yintang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9e7251fa3897 ath10k: Check tx_stats before use it

-- 
https://patchwork.kernel.org/patch/10926861/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
