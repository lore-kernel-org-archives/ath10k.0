Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAXbO-0005c3-4k
 for ath10k@lists.infradead.org; Thu, 11 Oct 2018 09:49:55 +0000
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath10k: fix out of bound read on array ath10k_rates
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20181005215609.13935-1-colin.king@canonical.com>
References: <20181005215609.13935-1-colin.king@canonical.com>
Message-Id: <20181011094942.C151260209@smtp.codeaurora.org>
Date: Thu, 11 Oct 2018 09:49:42 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, Sriram R <srirrama@codeaurora.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S . Miller" <davem@davemloft.net>

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> An out-of-bounds read on array ath10k_rates is occurring because
> the maximum number of elements is currently based on the size of
> the array and not the number of elements in the array. Fix this
> by using ARRAY_SIZE instead of sizeof.
> 
> Detected by CoverityScan, CID#1473918 ("Out-of-bounds read")
> 
> Fixes: f279294e9ee2 ("ath10k: add support for configuring management packet rate")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

This is already fixed in ath-next.

error: patch failed: drivers/net/wireless/ath/ath10k/mac.c:164
error: drivers/net/wireless/ath/ath10k/mac.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Rejected.

-- 
https://patchwork.kernel.org/patch/10628815/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
