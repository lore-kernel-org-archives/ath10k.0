Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCPMa-0007ss-3t
 for ath10k@lists.infradead.org; Thu, 01 Dec 2016 11:17:17 +0000
MIME-Version: 1.0
Subject: Re: ath10k: wmi-alloc-chunk should use DMA_BIDIRECTIONAL.
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1480456828-13735-1-git-send-email-greearb@candelatech.com>
References: <1480456828-13735-1-git-send-email-greearb@candelatech.com>
Message-ID: <4391889d7b9f4329a2edfdc29ae42ecc@euamsexm01a.eu.qualcomm.com>
Date: Thu, 1 Dec 2016 12:16:49 +0100
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> wrote:
> From: Ben Greear <greearb@candelatech.com>
> 
> These memory chunks are often used as 'swap' by the NIC,
> so it will be both reading and writing to these areas.
> 
> This seems to fix errors like this on my x86-64 machine:
> 
> kernel: DMAR: DMAR:[DMA Write] Request device [05:00.0] fault addr ff5de000
>         DMAR:[fault reason 05] PTE Write access is not set
> 
> Tested-by: Marek Behun <kabel@blackhole.sk>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> 
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index 9fcb249..c68278a 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -4558,7 +4558,7 @@ static int ath10k_wmi_alloc_chunk(struct ath10k *ar, u32 req_id,
>  	if (!num_units)
>  		return -ENOMEM;
>  
> -	paddr = dma_map_single(ar->dev, vaddr, pool_size, DMA_TO_DEVICE);
> +	paddr = dma_map_single(ar->dev, vaddr, pool_size, DMA_BIDIRECTIONAL);
>  	if (dma_mapping_error(ar->dev, paddr)) {
>  		kfree(vaddr);
>  		return -ENOMEM;

Patch applied to ath-next branch of ath.git, thanks.

43ca92d380a8 ath10k: wmi-alloc-chunk should use DMA_BIDIRECTIONAL

-- 
https://patchwork.kernel.org/patch/9453173/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
