Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga1Tc-0004Fu-Ay
 for ath10k@lists.infradead.org; Thu, 20 Dec 2018 16:47:13 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: remove set but not used variable 'num_tdls_vifs'
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1541669570-110540-1-git-send-email-yuehaibing@huawei.com>
References: <1541669570-110540-1-git-send-email-yuehaibing@huawei.com>
Message-Id: <20181220164702.013FD6071C@smtp.codeaurora.org>
Date: Thu, 20 Dec 2018 16:47:01 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, ath10k@lists.infradead.org, netdev@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_sta_state':
> drivers/net/wireless/ath/ath10k/mac.c:6238:7: warning:
>  variable 'num_tdls_vifs' set but not used [-Wunused-but-set-variable]
> 
> 'num_tdls_vifs' not used any more after
>   9a993cc1ea95 ("ath10k: fix the logic of limiting tdls peer counts")
> 
> Also, remove the single called function ath10k_mac_tdls_vifs_count
> and ath10k_mac_tdls_vifs_count_iter.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

bff70e5f78e9 ath10k: remove set but not used variable 'num_tdls_vifs'

-- 
https://patchwork.kernel.org/patch/10673841/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
