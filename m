Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIqZ9-0006S6-CT
 for ath10k@lists.infradead.org; Fri, 11 Oct 2019 08:46:28 +0000
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath10k: fix null dereference on pointer crash_data
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191004160227.31577-1-colin.king@canonical.com>
References: <20191004160227.31577-1-colin.king@canonical.com>
Message-Id: <20191011084627.105B0605FE@smtp.codeaurora.org>
Date: Fri, 11 Oct 2019 08:46:27 +0000 (UTC)
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

> Currently when pointer crash_data is null the present null check
> will also check that crash_data->ramdump_buf is null and will cause
> a null pointer dereference on crash_data. Fix this by using the ||
> operator instead of &&.
> 
> Fixes: 3f14b73c3843 ("ath10k: Enable MSA region dump support for WCN3990")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a69d3bdd4d40 ath10k: fix null dereference on pointer crash_data

-- 
https://patchwork.kernel.org/patch/11174955/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
