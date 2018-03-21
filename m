Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyjOU-000877-Tp
 for ath10k@lists.infradead.org; Wed, 21 Mar 2018 19:27:32 +0000
Received: by mail-it0-x242.google.com with SMTP id c1-v6so7211066itj.1
 for <ath10k@lists.infradead.org>; Wed, 21 Mar 2018 12:27:20 -0700 (PDT)
Mime-Version: 1.0 (1.0)
Subject: Re: [ath10k] not working in 64 bit with >2GB Ram
From: paresh chaudhary <chaudharyparesh1986@gmail.com>
In-Reply-To: <CAJ-VmokwZYrkgU=3vMYZTy0ZQ9erXCANP0xXPYxj=tCOOZoO8g@mail.gmail.com>
Date: Wed, 21 Mar 2018 14:26:43 -0500
Message-Id: <787E6F36-9C7C-4371-943C-FD0EA2D75C58@gmail.com>
References: <C8E19707-2E18-4EBE-A83F-8F9A5CC8C86E@gmail.com>
 <760892ee-c949-b0e4-fdb7-93859f753691@candelatech.com>
 <CAJsuzOXKb2Q40PCb5=FbU6BSePVUH9yBSVaf-8UXDtfVnHuScA@mail.gmail.com>
 <e2cedf15-050b-7853-8651-97e4f3e4760d@candelatech.com>
 <CAJ-Vmono5n1DhFw84vuCddPeFsWiqEpQkAQJq4NhmXOxWeOtzQ@mail.gmail.com>
 <CAJ-VmokwZYrkgU=3vMYZTy0ZQ9erXCANP0xXPYxj=tCOOZoO8g@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

Hi Adrian,

The answer regarding fbff7000 : This address is returned by dma_map_single api but it's failed to validate in dma_map_error api.

  skb_cb->paddr = dma_map_single(dev, msdu->data, msdu->len,
                                       DMA_TO_DEVICE);
        res = dma_mapping_error(dev, skb_cb->paddr);
        if (res) {
                res = -EIO;
                goto err_free_txdesc;
        }

For bounce buffer, we have compiled kernel with  SWIOTLB support. 


config SWIOTLB
        bool "SWIOTLB support"
        default n
        select IOMMU_HELPER
        ---help---
          Support for IO bounce buffering for systems without an IOMMU.
          This allows us to DMA to the full physical address space on
          platforms where the size of a physical address is larger
          than the bus address.  Not all platforms support this.



> On Mar 21, 2018, at 12:12 PM, Adrian Chadd <adrian@freebsd.org> wrote:
> 
> Sorry, a quick follow-up:
> 
> I bring it up because I know there's some oddness with the PPC IOMMU
> and where they put their devices in the physical address map, so you
> have to do a lot of gymnastics to be able to even access devices.
> Anything above 32 bit boundary requires that they do a temporary IOMMU
> mapping OR they have to use a bounce buffer in memory < 4G. So that
> whole side of things needs to be setup correctly on the Linux BSP side
> of things for the dma map/unmap calls to do the right thing.
> 
> 
> 
> -adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
