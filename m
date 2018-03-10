Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1euakU-0002qc-IG
 for ath10k@lists.infradead.org; Sat, 10 Mar 2018 09:25:08 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: DMA issues on PowerPC64
References: <CAM=7fbewAQ7tW7J4fbq811a4++H+RMz0oxC9KiOsZnPFFQcuNQ@mail.gmail.com>
Date: Sat, 10 Mar 2018 11:24:50 +0200
In-Reply-To: <CAM=7fbewAQ7tW7J4fbq811a4++H+RMz0oxC9KiOsZnPFFQcuNQ@mail.gmail.com>
 (Jared Bents's message of "Fri, 9 Mar 2018 09:08:29 -0600")
Message-ID: <87h8pocmfx.fsf@kamboji.qca.qualcomm.com>
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
To: Jared Bents <jared.bents@rockwellcollins.com>
Cc: ath10k@lists.infradead.org

Jared Bents <jared.bents@rockwellcollins.com> writes:

> Some background information first.  I transitioned a build from 32 bit
> to 64 bit and discovered my wifi modules no longer work.  I am using
> fsl-v2.0-1703 on a qoriq t1042.  I sourced the problem to DMA mapping
> errors and found that it was trying to map addresses in regions not
> allowed by the kernel.
>
> ath10k_pci 0001:01:00.0: unable to get target info from device
> ath10k_pci 0001:01:00.0: could not get target info (5)
> ath10k_pci 0001:01:00.0: could not probe fw (5)
>
>
> I discovered that if I limited my memory from the actual 8GB present
> down to just 2GB with the bootarg mem=2048M, the ath10k modules
> worked.
>
> So I started poking around in ath10k/pci.c and noticed that if I ORed
> the regions specified in the memory allocations with GFP_DMA, I could
> get rid of the initial dma mapping errors.  A couple of examples are
> below.
>
> skb = __dev_alloc_skb(pipe->buf_sz, GFP_DMA | GFP_ATOMIC);
> treq = kmemdup(req, req_len, GFP_DMA | GFP_KERNEL);
>
>
> But then came across these failures which I have yet to sort out.
>
> ath10k_pci 0001:01:00.0: failed to connect htt (-5)
> ath10k_pci 0001:01:00.0: could not init core (-5)
> ath10k_pci 0001:01:00.0: could not probe fw (-5)

Do note that GFP_DMA is not supposed to be used anymore:

 * GFP_DMA exists for historical reasons and should be avoided where possible.
 *   The flags indicates that the caller requires that the lowest zone be
 *   used (ZONE_DMA or 16M on x86-64). Ideally, this would be removed but
 *   it would require careful auditing as some users really require it and
 *   others use the flag to avoid lowmem reserves in ZONE_DMA and treat the
 *   lowest zone as a type of emergency reserve.

> I am wondering if anyone else has come across this issue and solved it
> or if somehow this is just an issue on ppc64 and I am somehow the only
> one in that use case.  Unfortunately because of the qoriq t1042, I am
> on the latest kernel I can use via the latest available sdk for my
> processor which is linux kernel version 4.1.35-rt41

I don't know if this is a problem with ath10k or your arch, but I think
you should ask help from wider audience, like linux-kernel, pci or ppc
lists. Though I don't know how they will react as you are using an
out-of-tree kernel.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
