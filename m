Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hmwxn-0003l7-T9
 for ath10k@lists.infradead.org; Mon, 15 Jul 2019 09:08:06 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v3 20/24] wireless: Remove call to memset after
 dma_alloc_coherent
References: <20190715031941.7120-1-huangfq.daxian@gmail.com>
Date: Mon, 15 Jul 2019 12:07:56 +0300
In-Reply-To: <20190715031941.7120-1-huangfq.daxian@gmail.com> (Fuqian Huang's
 message of "Mon, 15 Jul 2019 11:19:41 +0800")
Message-ID: <87v9w38y37.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Fuqian Huang <huangfq.daxian@gmail.com>
Cc: brcm80211-dev-list.pdl@broadcom.com, Arend van Spriel <arend.vanspriel@broadcom.com>, Sergey Matyukevich <smatyukevich@quantenna.com>, netdev@vger.kernel.org, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, linux-wireless@vger.kernel.org, Hante Meuleman <hante.meuleman@broadcom.com>, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, Igor Mitsyanko <imitsyanko@quantenna.com>, Wright Feng <wright.feng@cypress.com>, brcm80211-dev-list@cypress.com, Avinash Patil <avinashp@quantenna.com>, "David S . Miller" <davem@davemloft.net>, Franky Lin <franky.lin@broadcom.com>

Fuqian Huang <huangfq.daxian@gmail.com> writes:

> In commit 518a2f1925c3
> ("dma-mapping: zero memory returned from dma_alloc_*"),
> dma_alloc_coherent has already zeroed the memory.
> So memset is not needed.
>
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
> Changes in v3:
>   - Use actual commit rather than the merge commit in the commit message
>
>  drivers/net/wireless/ath/ath10k/ce.c                     | 5 -----
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c  | 2 --
>  drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c | 2 --
>  drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c | 2 --
>  4 files changed, 11 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
> index eca87f7c5b6c..294fbc1e89ab 100644
> --- a/drivers/net/wireless/ath/ath10k/ce.c
> +++ b/drivers/net/wireless/ath/ath10k/ce.c
> @@ -1704,9 +1704,6 @@ ath10k_ce_alloc_dest_ring_64(struct ath10k *ar, unsigned int ce_id,
>  	/* Correctly initialize memory to 0 to prevent garbage
>  	 * data crashing system when download firmware
>  	 */
> -	memset(dest_ring->base_addr_owner_space_unaligned, 0,
> -	       nentries * sizeof(struct ce_desc_64) + CE_DESC_RING_ALIGN);

Shouldn't you also remove the comment?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
