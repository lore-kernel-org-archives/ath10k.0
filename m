Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIyXB-00012g-9T
 for ath10k@lists.infradead.org; Fri, 11 Oct 2019 17:16:58 +0000
Received: by mail-pf1-x443.google.com with SMTP id y22so6468492pfr.3
 for <ath10k@lists.infradead.org>; Fri, 11 Oct 2019 10:16:56 -0700 (PDT)
Date: Fri, 11 Oct 2019 10:16:52 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] ath10k: Correct error check of dma_map_single()
Message-ID: <20191011171652.GF571@minitux>
References: <20191010162653.141303-1-bjorn.andersson@linaro.org>
 <20191011115732.044BF60BE8@smtp.codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011115732.044BF60BE8@smtp.codeaurora.org>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, ath10k@lists.infradead.org, Niklas Cassel <niklas.cassel@linaro.org>, "David S. Miller" <davem@davemloft.net>

On Fri 11 Oct 04:57 PDT 2019, Kalle Valo wrote:

> Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> 
> > The return value of dma_map_single() should be checked for errors using
> > dma_mapping_error(), rather than testing for NULL. Correct this.
> > 
> > Fixes: 1807da49733e ("ath10k: wmi: add management tx by reference support over wmi")
> > Cc: stable@vger.kernel.org
> > Reported-by: Niklas Cassel <niklas.cassel@linaro.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Did this fix any real bug? Or is this just something found during code review?
> 

CONFIG_DMA_API_DEBUG screamed at us for calling dma_unmap_single()
without ever having called dma_mapping_error() on the return value.

But Govind just pointed out to me that I hastily missed the fact that
this code path leaks the dequeued skb. So I'll respin the patch to fix
both issues at once.

Regards,
Bjorn

> -- 
> https://patchwork.kernel.org/patch/11183923/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
> 
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
