Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5uGa-0004y0-4A
 for ath10k@lists.infradead.org; Tue, 10 Apr 2018 14:29:01 +0000
MIME-Version: 1.0
Subject: Re: ath10k: avoid possible string overflow
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180328220635.3704458-1-arnd@arndb.de>
References: <20180328220635.3704458-1-arnd@arndb.de>
Message-Id: <20180410142849.C867360C55@smtp.codeaurora.org>
Date: Tue, 10 Apr 2018 14:28:49 +0000 (UTC)
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>, Johannes Berg <johannes.berg@intel.com>, netdev@vger.kernel.org, Anilkumar Kolli <akolli@codeaurora.org>, Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>

Arnd Bergmann <arnd@arndb.de> wrote:

> The way that 'strncat' is used here raised a warning in gcc-8:
> 
> drivers/net/wireless/ath/ath10k/wmi.c: In function 'ath10k_wmi_tpc_stats_final_disp_tables':
> drivers/net/wireless/ath/ath10k/wmi.c:4649:4: error: 'strncat' output truncated before terminating nul copying as many bytes from a string as its length [-Werror=stringop-truncation]
> 
> Effectively, this is simply a strcat() but the use of strncat() suggests
> some form of overflow check. Regardless of whether this might actually
> overflow, using strlcat() instead of strncat() avoids the warning and
> makes the code more robust.
> 
> Fixes: bc64d05220f3 ("ath10k: debugfs support to get final TPC stats for 10.4 variants")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

6707ba0105a2 ath10k: avoid possible string overflow

-- 
https://patchwork.kernel.org/patch/10314201/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
