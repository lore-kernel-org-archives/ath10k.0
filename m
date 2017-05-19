Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBdw8-0004NI-5W
 for ath10k@lists.infradead.org; Fri, 19 May 2017 09:11:06 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] [ath10k] go back to using dma_alloc_coherent() for
 firmware scratch memory.
Date: Fri, 19 May 2017 09:10:38 +0000
Message-ID: <871srlw6t0.fsf@kamboji.qca.qualcomm.com>
References: <20170501214327.5621-1-adrian@freebsd.org>
In-Reply-To: <20170501214327.5621-1-adrian@freebsd.org> (Adrian Chadd's
 message of "Mon, 1 May 2017 14:43:27 -0700")
Content-Language: en-US
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "nbd@nbd.name" <nbd@nbd.name>

Adrian Chadd <adrian@freebsd.org> writes:

> This reverts b057886524be060021e3cfad0ba8458c850330cd in 2015
> which converted this allocation from dma_map_coherent() to
> kzalloc() / dma_map_single().
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

So there are now three positive test results (including mine) so I would
like to queue this to 4.12 as an important bug fix.

But I think all of them was with x86 and I'm worried if this patch
creates problems with other architectures, especially on ARM? In the
original commit Felix wrote that coherent memory is constrained some
architectures. I would hate to go ping pong with this and reverting this
patch soon after, instead I would prefer to find a proper solution which
works for everyone.

Felix, what do you think? Can someone test this patch on LEDE with the
most problematic boards?

commit b057886524be060021e3cfad0ba8458c850330cd
Author: Felix Fietkau <nbd@openwrt.org>
Date:   Mon Nov 30 19:32:01 2015 +0100

    ath10k: do not use coherent memory for allocated device memory chunks
    
    Coherent memory is more expensive to allocate (and constrained on some
    architectures where it has to be pre-allocated). It is also completely
    unnecessary, since the host has no reason to even access these allocated
    memory spaces
    
    Signed-off-by: Felix Fietkau <nbd@openwrt.org>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
