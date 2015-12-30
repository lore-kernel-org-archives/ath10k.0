Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aEOiY-0000ms-Os
 for ath10k@lists.infradead.org; Wed, 30 Dec 2015 21:55:39 +0000
Subject: Re: [PATCH v2] ath10k: do not use coherent memory for allocated
 device memory chunks
References: <1448908321-3042-1-git-send-email-nbd@openwrt.org>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <568452C5.7090700@candelatech.com>
Date: Wed, 30 Dec 2015 13:55:17 -0800
MIME-Version: 1.0
In-Reply-To: <1448908321-3042-1-git-send-email-nbd@openwrt.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Felix Fietkau <nbd@openwrt.org>, linux-wireless@vger.kernel.org
Cc: kvalo@codeaurora.org, ath10k@lists.infradead.org

On 11/30/2015 10:32 AM, Felix Fietkau wrote:
> Coherent memory is more expensive to allocate (and constrained on some
> architectures where it has to be pre-allocated). It is also completely
> unnecessary, since the host has no reason to even access these allocated
> memory spaces
>
> Signed-off-by: Felix Fietkau <nbd@openwrt.org>

> -	memset(ar->wmi.mem_chunks[idx].vaddr, 0, pool_size);
> +	if (!num_units)
> +		return -ENOMEM;
> +
> +	paddr = dma_map_single(ar->dev, vaddr, pool_size, DMA_TO_DEVICE);
> +	if (dma_mapping_error(ar->dev, paddr)) {
> +		kfree(vaddr);
> +		return -ENOMEM;
> +	}

Are you sure you have the direction correct for the 'dma_map_single'
call?

I thought this memory was for the NIC to scribble in, and probably
host should never even bother reading or writing it?

The reason I started looking at this is that I see these errors when
trying to use a 4x4 wave-2 ath10k NIC in a 4.4.0-rc7 ath kernel:

[  202.489625] wlan0: authenticate with 00:0e:8e:f8:73:96
[  202.784533] DMAR: DRHD: handling fault status reg 3
[  202.786246] wlan0: send auth to 00:0e:8e:f8:73:96 (try 1/3)
[  202.788133] DMAR: DMAR:[DMA Write] Request device [05:00.0] fault addr ff5de000
DMAR:[fault reason 05] PTE Write access is not set
[  202.887410] wlan0: send auth to 00:0e:8e:f8:73:96 (try 2/3)
[  202.988423] wlan0: send auth to 00:0e:8e:f8:73:96 (try 3/3)
[  203.089437] wlan0: authentication with 00:0e:8e:f8:73:96 timed out

This is on an Intel x86-64 system with IOMMU (VT-d) enabled.

I'm likely having more than one problem since a 4.3.0-rc6+ kernel is not
working with this NIC either...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
