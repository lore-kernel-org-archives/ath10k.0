Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7y8i-0006xB-54
 for ath10k@lists.infradead.org; Tue, 18 Aug 2020 09:42:48 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: move enable_pll_clk call to ath10k_core_start()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1597421745-4329-1-git-send-email-kvalo@codeaurora.org>
References: <1597421745-4329-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20200818094222.EAC02C433C6@smtp.codeaurora.org>
Date: Tue, 18 Aug 2020 09:42:22 +0000 (UTC)
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

> There's no reason to have call for enable_pll_clk in ath10k_bmi_start(), move
> it to ath10k_core_start() instead. This way it's possible to call
> ath10k_bmi_start() from sdio.c during firmware dump creation. And also the
> function call is more visible when it's in core.c.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

ad0dc0426468 ath10k: move enable_pll_clk call to ath10k_core_start()

-- 
https://patchwork.kernel.org/patch/11714755/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
