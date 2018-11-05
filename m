Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJcmt-0004IP-4f
 for ath10k@lists.infradead.org; Mon, 05 Nov 2018 11:11:21 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fixup extended per sta tx statistics
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20181018073619.c2cxj74enkramhjr@kili.mountain>
References: <20181018073619.c2cxj74enkramhjr@kili.mountain>
Message-Id: <20181105111108.D538A607CA@smtp.codeaurora.org>
Date: Mon,  5 Nov 2018 11:11:08 +0000 (UTC)
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
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> I had a couple concerns with this code.  First, we definitely need to
> set the error code if the kzalloc() fails.  Secondly, I was worried that
> if we didn't set "arsta->tx_stats" to NULL after freeing it, then it
> looks to me like it might lead to a use after free.  I can't test that,
> but it's harmless to set it to NULL so I did.
> 
> Fixes: a904417fc876 ("ath10k: add extended per sta tx statistics support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

539b44e70c5b ath10k: fixup extended per sta tx statistics

-- 
https://patchwork.kernel.org/patch/10646825/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
