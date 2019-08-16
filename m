Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hykdk-0005Ms-1Q
 for ath10k@lists.infradead.org; Fri, 16 Aug 2019 22:24:09 +0000
Received: by mail-pf1-x441.google.com with SMTP id w26so3790880pfq.12
 for <ath10k@lists.infradead.org>; Fri, 16 Aug 2019 15:24:07 -0700 (PDT)
Date: Fri, 16 Aug 2019 15:25:07 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: regression in ath10k dma allocation
Message-ID: <20190816222506.GA24413@Asurada-Nvidia.nvidia.com>
References: <8fe8b415-2d34-0a14-170b-dcb31c162e67@mni.thm.de>
 <20190816164301.GA3629@lst.de>
 <af96ea6a-2b17-9b66-7aba-b7dae5bcbba5@mni.thm.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af96ea6a-2b17-9b66-7aba-b7dae5bcbba5@mni.thm.de>
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
To: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, davem@davemloft.net, iommu@lists.linux-foundation.org, tobias.klausmann@freenet.de, robin.murphy@arm.com, Christoph Hellwig <hch@lst.de>, kvalo@codeaurora.org, m.szyprowski@samsung.com

Hi Tobias

On Fri, Aug 16, 2019 at 10:16:45PM +0200, Tobias Klausmann wrote:
> > do you have CONFIG_DMA_CMA set in your config?  If not please make sure
> > you have this commit in your testing tree, and if the problem still
> > persists it would be a little odd and we'd have to dig deeper:
> > 
> > commit dd3dcede9fa0a0b661ac1f24843f4a1b1317fdb6
> > Author: Nicolin Chen <nicoleotsuka@gmail.com>
> > Date:   Wed May 29 17:54:25 2019 -0700
> > 
> >      dma-contiguous: fix !CONFIG_DMA_CMA version of dma_{alloc, free}_contiguous()

> yes CONFIG_DMA_CMA is set (=y, see attached config), the commit you mention
> above is included, if you have any hints how to go forward, please let me
> know!

For CONFIG_DMA_CMA=y, by judging the log with error code -12, I
feel this one should work for you. Would you please check if it
is included or try it out otherwise?

dma-contiguous: do not overwrite align in dma_alloc_contiguous()
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c6622a425acd1d2f3a443cd39b490a8777b622d7

Thanks
Nicolin

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
