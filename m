Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hztfk-0002t6-Pn
 for ath10k@lists.infradead.org; Tue, 20 Aug 2019 02:14:58 +0000
Date: Tue, 20 Aug 2019 04:14:52 +0200
From: Christoph Hellwig <hch@lst.de>
Subject: Re: regression in ath10k dma allocation
Message-ID: <20190820021452.GA22792@lst.de>
References: <8fe8b415-2d34-0a14-170b-dcb31c162e67@mni.thm.de>
 <20190816164301.GA3629@lst.de>
 <af96ea6a-2b17-9b66-7aba-b7dae5bcbba5@mni.thm.de>
 <20190816222506.GA24413@Asurada-Nvidia.nvidia.com>
 <20190818031328.11848-1-hdanton@sina.com>
 <acd7a4b0-fde8-1aa2-af07-2b469e5d5ca7@mni.thm.de>
 <20190820015852.GA15830@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820015852.GA15830@Asurada-Nvidia.nvidia.com>
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
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Hillf Danton <hdanton@sina.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, davem@davemloft.net, iommu@lists.linux-foundation.org, tobias.klausmann@freenet.de, Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>, robin.murphy@arm.com, Christoph Hellwig <hch@lst.de>, kvalo@codeaurora.org, m.szyprowski@samsung.com

On Mon, Aug 19, 2019 at 06:58:52PM -0700, Nicolin Chen wrote:
> Right...the condition was in-between. However, not every caller
> of dma_alloc_contiguous() is supposed to have a coherent check.
> So we either add a 'bool coherent_ok' to the API or revert the
> dma-direct part back to the original. Probably former option is
> better?
> 
> Thank you for the debugging. I have been a bit distracted, may
> not be able to submit a fix very soon. Would you like to help?

Yeah, it turns out that while the idea for the dma_alloc_contiguous
helper was neat it didn't work out at all, and me pushing Nicolin
down that route was not a very smart idea.  Sorry for causing this
mess.

I think we'll just need to open code it for dma-direct for 5.3.
Hillf do you want to cook up a patch or should I do it?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
