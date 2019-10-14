Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJvwl-000369-FT
 for ath10k@lists.infradead.org; Mon, 14 Oct 2019 08:43:22 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: Correct error handling of dma_map_single()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191011182817.194565-1-bjorn.andersson@linaro.org>
References: <20191011182817.194565-1-bjorn.andersson@linaro.org>
Message-Id: <20191014084318.E7F66606CF@smtp.codeaurora.org>
Date: Mon, 14 Oct 2019 08:43:18 +0000 (UTC)
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
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Niklas Cassel <niklas.cassel@linaro.org>, "David S. Miller" <davem@davemloft.net>

Bjorn Andersson <bjorn.andersson@linaro.org> wrote:

> The return value of dma_map_single() should be checked for errors using
> dma_mapping_error() and the skb has been dequeued so it needs to be
> freed.
> 
> This was found when enabling CONFIG_DMA_API_DEBUG and it warned about the
> missing dma_mapping_error() call.
> 
> Fixes: 1807da49733e ("ath10k: wmi: add management tx by reference support over wmi")
> Reported-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

d43810b2c180 ath10k: Correct error handling of dma_map_single()

-- 
https://patchwork.kernel.org/patch/11186173/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
