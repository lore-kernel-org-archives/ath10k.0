Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dG1b7-0003R1-8p
 for ath10k@lists.infradead.org; Wed, 31 May 2017 11:15:31 +0000
MIME-Version: 1.0
Subject: Re: go back to using dma_alloc_coherent() for firmware scratch memory.
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20170501214327.5621-1-adrian@freebsd.org>
References: <20170501214327.5621-1-adrian@freebsd.org>
Message-ID: <3f92c875c8fa4c66a3e32d88947c18b7@euamsexm01a.eu.qualcomm.com>
Date: Wed, 31 May 2017 13:15:00 +0200
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
Cc: Adrian Chadd <adrian@FreeBSD.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Adrian Chadd <adrian@freebsd.org> wrote:

> This reverts commit b057886524be ("ath10k: do not use coherent memory for
> allocated device memory chunks") in 2015 which converted this allocation from
> dma_map_coherent() to kzalloc() / dma_map_single().
> 
> The current problem manifests when using later model NICs with larger
> (>700KiB) scratch spaces in memory.  Although the kzalloc call
> succeeds, the software IOMMU TLB code (via dma_map_single()) panics
> because it can't find 700KiB of linear physmem bounce buffers for DMA.
> Now, this is a bit of a silly failure mode for the dma map API,
> but it's what we currently have to play with.
> 
> In these cases, doing kzalloc() works fine, but the dma_map_single()
> call fails.
> 
> After chatting with Linus briefly about this, it indeed should be
> using dma_alloc_coherent() for doing larger device memory allocation
> that requires some kind of physical address mapping.
> 
> You're not supposed to be using kzalloc and dma_map_* calls for
> large memory regions, and I'm guessing not for long-held mappings
> either.  Typically dma mappings should be temporary for DMA,
> not long held like these.
> 
> Now, since hopefully the major annoying underlying problem has also been
> addressed (ie, ath10k is no longer tears down all of these allocations
> and reallocates them every time the vdevs are brought down) fragmentation
> should stop being such a touchy issue.  If it is though, using
> dma_alloc_coherent() use gets us access to the CMB APIs too relatively
> easily and ideally we would be allocating memory early in boot for
> exactly these reasons.
> 
> Signed-off-by: Adrian Chadd <adrian@FreeBSD.org>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

79e68821582d ath10k: go back to using dma_alloc_coherent() for firmware scratch memory

-- 
https://patchwork.kernel.org/patch/9707059/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
