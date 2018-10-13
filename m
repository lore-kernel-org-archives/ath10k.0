Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBNeR-0007wB-QW
 for ath10k@lists.infradead.org; Sat, 13 Oct 2018 17:24:33 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: remove unnecessary comparison of unsigned integer
 with < 0
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20181005185623.GA14405@embeddedor.com>
References: <20181005185623.GA14405@embeddedor.com>
Message-Id: <20181013172421.88FA860C1D@smtp.codeaurora.org>
Date: Sat, 13 Oct 2018 17:24:21 +0000 (UTC)
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
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>

"Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote:

> There is no need to compare *ps_state_enable* with < 0 because
> such variable is of type u8 (8 bits, unsigned), making it
> impossible to hold a negative value.
> 
> Fix this by removing such comparison.
> 
> Addresses-Coverity-ID: 1473921 ("Unsigned compared against 0")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

7bfd82bff60e ath10k: remove unnecessary comparison of unsigned integer with < 0

-- 
https://patchwork.kernel.org/patch/10628679/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
