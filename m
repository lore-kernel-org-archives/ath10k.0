Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3W5v-0008Ir-F5
 for ath10k@lists.infradead.org; Thu, 06 Aug 2020 02:57:30 +0000
From: "Rakesh Pillai" <pillair@codeaurora.org>
References: <20200802122227.678637-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200802122227.678637-1-christophe.jaillet@wanadoo.fr>
Subject: RE: [PATCH] ath10k: Fix the size used in a 'dma_free_coherent()' call
 in an error handling path
Date: Thu, 6 Aug 2020 08:27:07 +0530
Message-ID: <002101d66b9d$497721b0$dc656510$@codeaurora.org>
MIME-Version: 1.0
Content-Language: en-us
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
To: 'Christophe JAILLET' <christophe.jaillet@wanadoo.fr>, kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org



> -----Original Message-----
> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Sent: Sunday, August 2, 2020 5:52 PM
> To: kvalo@codeaurora.org; davem@davemloft.net; kuba@kernel.org;
> pillair@codeaurora.org
> Cc: ath10k@lists.infradead.org; linux-wireless@vger.kernel.org;
> netdev@vger.kernel.org; linux-kernel@vger.kernel.org; kernel-
> janitors@vger.kernel.org; Christophe JAILLET
> <christophe.jaillet@wanadoo.fr>
> Subject: [PATCH] ath10k: Fix the size used in a 'dma_free_coherent()' call
in
> an error handling path
> 
> Update the size used in 'dma_free_coherent()' in order to match the one
> used in the corresponding 'dma_alloc_coherent()'.
> 
> Fixes: 1863008369ae ("ath10k: fix shadow register implementation for
> WCN3990")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch looks obvious to me, but commit 1863008369ae looks also simple.
> So it is surprising that such a "typo" slipped in.

Reviewed-by: Rakesh Pillai <pillair@codeaurora.org> 

> ---
>  drivers/net/wireless/ath/ath10k/ce.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/ce.c
> b/drivers/net/wireless/ath/ath10k/ce.c
> index 294fbc1e89ab..e6e0284e4783 100644
> --- a/drivers/net/wireless/ath/ath10k/ce.c
> +++ b/drivers/net/wireless/ath/ath10k/ce.c
> @@ -1555,7 +1555,7 @@ ath10k_ce_alloc_src_ring(struct ath10k *ar,
> unsigned int ce_id,
>  		ret = ath10k_ce_alloc_shadow_base(ar, src_ring, nentries);
>  		if (ret) {
>  			dma_free_coherent(ar->dev,
> -					  (nentries * sizeof(struct
> ce_desc_64) +
> +					  (nentries * sizeof(struct ce_desc)
+
>  					   CE_DESC_RING_ALIGN),
>  					  src_ring-
> >base_addr_owner_space_unaligned,
>  					  base_addr);
> --
> 2.25.1



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
