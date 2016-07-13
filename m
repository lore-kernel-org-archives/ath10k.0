Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x22e.google.com ([2607:f8b0:4001:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNPfd-0006oD-9U
 for ath10k@lists.infradead.org; Wed, 13 Jul 2016 19:18:10 +0000
Received: by mail-io0-x22e.google.com with SMTP id q83so55734940iod.1
 for <ath10k@lists.infradead.org>; Wed, 13 Jul 2016 12:17:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <57868038.3040907@candelatech.com>
References: <578673DA.1010907@candelatech.com>
 <1468430769350.75672@qti.qualcomm.com>
 <57868038.3040907@candelatech.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Wed, 13 Jul 2016 12:17:47 -0700
Message-ID: <CAJ-Vmo=v2BSXP1UzzX3B_PJqQxtRVsQL2hJ0MFJgPujOR9yCPQ@mail.gmail.com>
Subject: Re: Anyone brought up 9984 NIC on x86-64?
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
To: Ben Greear <greearb@candelatech.com>
Cc: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>, ath10k <ath10k@lists.infradead.org>

On 13 July 2016 at 10:54, Ben Greear <greearb@candelatech.com> wrote:

>
>
> For reference, this is today's un-patched linux-ath:
>
> DMA: Out of SW-IOMMU space for 770224 bytes at device 0000:05:00.0
> Kernel panic - not syncing: DMA: Random memory could be DMA read
>

Hi,

So I looked at this code in a bit more detail. Ideally for large
requests you shouldn't be asking for separate bounce buffers, you'd
just allocate memory that was within the 32 bit physmem boundary so
you don't /need/ a bounce buffer.

That's likely what's tripping things up.

Now, on freebsd I'd just request memory that was under 32 bit and the
memory allocator would fail the allocation if it wasn't available.
Bounce buffers get used for general system things like mbufs (our
skbs), disk buffers, etc that can come from any memory and need a
temporary mapping. This kind of stuff isn't temporary.

So to save me having to dig into what the linux kernel allocator
provides (since I'm really a freebsd developer at heart!), what's the
"right" way to maintain large, non-ephermal memory allocation that may
have to do DMA? eg, like descriptor rings, etc.



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
