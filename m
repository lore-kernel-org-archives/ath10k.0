Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout2.fh-giessen.de ([212.201.18.46])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hykvy-0002yp-R1
 for ath10k@lists.infradead.org; Fri, 16 Aug 2019 22:43:00 +0000
Subject: Re: regression in ath10k dma allocation
References: <8fe8b415-2d34-0a14-170b-dcb31c162e67@mni.thm.de>
 <20190816164301.GA3629@lst.de>
 <af96ea6a-2b17-9b66-7aba-b7dae5bcbba5@mni.thm.de>
 <20190816222506.GA24413@Asurada-Nvidia.nvidia.com>
From: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Message-ID: <3f7475e3-e27b-aca7-c21e-71cac6cafc1c@mni.thm.de>
Date: Sat, 17 Aug 2019 00:42:48 +0200
MIME-Version: 1.0
In-Reply-To: <20190816222506.GA24413@Asurada-Nvidia.nvidia.com>
Content-Language: en-US
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
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, davem@davemloft.net, iommu@lists.linux-foundation.org, tobias.klausmann@freenet.de, robin.murphy@arm.com, Christoph Hellwig <hch@lst.de>, kvalo@codeaurora.org, m.szyprowski@samsung.com

Hi Nicolin,

On 17.08.19 00:25, Nicolin Chen wrote:
> Hi Tobias
>
> On Fri, Aug 16, 2019 at 10:16:45PM +0200, Tobias Klausmann wrote:
>>> do you have CONFIG_DMA_CMA set in your config?  If not please make sure
>>> you have this commit in your testing tree, and if the problem still
>>> persists it would be a little odd and we'd have to dig deeper:
>>>
>>> commit dd3dcede9fa0a0b661ac1f24843f4a1b1317fdb6
>>> Author: Nicolin Chen <nicoleotsuka@gmail.com>
>>> Date:   Wed May 29 17:54:25 2019 -0700
>>>
>>>       dma-contiguous: fix !CONFIG_DMA_CMA version of dma_{alloc, free}_contiguous()
>> yes CONFIG_DMA_CMA is set (=y, see attached config), the commit you mention
>> above is included, if you have any hints how to go forward, please let me
>> know!
> For CONFIG_DMA_CMA=y, by judging the log with error code -12, I
> feel this one should work for you. Would you please check if it
> is included or try it out otherwise?
>
> dma-contiguous: do not overwrite align in dma_alloc_contiguous()
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c6622a425acd1d2f3a443cd39b490a8777b622d7


Thanks for the hint, yet the commit is included and does not fix the 
problem!

Greetings,

Tobias


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
