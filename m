Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iItY4-0005vR-DR
 for ath10k@lists.infradead.org; Fri, 11 Oct 2019 11:57:33 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Correct error check of dma_map_single()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191010162653.141303-1-bjorn.andersson@linaro.org>
References: <20191010162653.141303-1-bjorn.andersson@linaro.org>
Message-Id: <20191011115732.044BF60BE8@smtp.codeaurora.org>
Date: Fri, 11 Oct 2019 11:57:32 +0000 (UTC)
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, stable@vger.kernel.org, Niklas Cassel <niklas.cassel@linaro.org>, "David S. Miller" <davem@davemloft.net>

Bjorn Andersson <bjorn.andersson@linaro.org> wrote:

> The return value of dma_map_single() should be checked for errors using
> dma_mapping_error(), rather than testing for NULL. Correct this.
> 
> Fixes: 1807da49733e ("ath10k: wmi: add management tx by reference support over wmi")
> Cc: stable@vger.kernel.org
> Reported-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Did this fix any real bug? Or is this just something found during code review?

-- 
https://patchwork.kernel.org/patch/11183923/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
