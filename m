Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail3-166.sinamail.sina.com.cn ([202.108.3.166])
 by bombadil.infradead.org with smtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hztul-0001jd-Ou
 for ath10k@lists.infradead.org; Tue, 20 Aug 2019 02:30:29 +0000
From: Hillf Danton <hdanton@sina.com>
Subject: Re: regression in ath10k dma allocation
Date: Tue, 20 Aug 2019 10:29:35 +0800
Message-Id: <20190820022935.7016-1-hdanton@sina.com>
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
To: Christoph Hellwig <hch@lst.de>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Nicolin Chen <nicoleotsuka@gmail.com>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "tobias.klausmann@freenet.de" <tobias.klausmann@freenet.de>, Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>, "robin.murphy@arm.com" <robin.murphy@arm.com>, "davem@davemloft.net" <davem@davemloft.net>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>


On Tue, 20 Aug 2019 10:15:01 +0800 Christoph Hellwig wrote:
> On Mon, Aug 19, 2019 at 06:58:52PM -0700, Nicolin Chen wrote:
> > Right...the condition was in-between. However, not every caller
> > of dma_alloc_contiguous() is supposed to have a coherent check.
> > So we either add a 'bool coherent_ok' to the API or revert the
> > dma-direct part back to the original. Probably former option is
> > better?
> >
> > Thank you for the debugging. I have been a bit distracted, may
> > not be able to submit a fix very soon. Would you like to help?
> 
> Yeah, it turns out that while the idea for the dma_alloc_contiguous
> helper was neat it didn't work out at all, and me pushing Nicolin
> down that route was not a very smart idea.  Sorry for causing this
> mess.
> 
> I think we'll just need to open code it for dma-direct for 5.3.
> Hillf do you want to cook up a patch or should I do it?

Feel free to do that, Sir.

Thanks
Hillf


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
