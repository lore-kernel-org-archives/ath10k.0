Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyfJi-0001MS-4B
 for ath10k@lists.infradead.org; Fri, 16 Aug 2019 16:43:07 +0000
Date: Fri, 16 Aug 2019 18:43:01 +0200
From: Christoph Hellwig <hch@lst.de>
Subject: Re: regression in ath10k dma allocation
Message-ID: <20190816164301.GA3629@lst.de>
References: <8fe8b415-2d34-0a14-170b-dcb31c162e67@mni.thm.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8fe8b415-2d34-0a14-170b-dcb31c162e67@mni.thm.de>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, hch@lst.de, nicoleotsuka@gmail.com, iommu@lists.linux-foundation.org, tobias.klausmann@freenet.de, robin.murphy@arm.com, davem@davemloft.net, kvalo@codeaurora.org, m.szyprowski@samsung.com

Hi Tobias,

do you have CONFIG_DMA_CMA set in your config?  If not please make sure
you have this commit in your testing tree, and if the problem still
persists it would be a little odd and we'd have to dig deeper:

commit dd3dcede9fa0a0b661ac1f24843f4a1b1317fdb6
Author: Nicolin Chen <nicoleotsuka@gmail.com>
Date:   Wed May 29 17:54:25 2019 -0700

    dma-contiguous: fix !CONFIG_DMA_CMA version of dma_{alloc, free}_contiguous()


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
