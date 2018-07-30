Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkCNc-0008LD-9f
 for ath10k@lists.infradead.org; Mon, 30 Jul 2018 17:54:49 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: remove redundant pointers 'dev' and 'noa'
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180709123446.14796-1-colin.king@canonical.com>
References: <20180709123446.14796-1-colin.king@canonical.com>
Message-Id: <20180730175438.0B00162240@smtp.codeaurora.org>
Date: Mon, 30 Jul 2018 17:54:37 +0000 (UTC)
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
To: Colin King <colin.king@canonical.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S . Miller" <davem@davemloft.net>

Colin King <colin.king@canonical.com> wrote:

> Pointers dev and noa are being assigned but are never used hence they
> are redundant and can be removed.
> 
> Cleans up clang warnings:
> warning: variable 'dev' set but not used [-Wunused-but-set-variable]
> warning: variable 'noa' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e6712aa1244f ath10k: remove redundant pointers 'dev' and 'noa'

-- 
https://patchwork.kernel.org/patch/10514521/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
