Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fKrYS-0008EV-SP
 for ath10k@lists.infradead.org; Mon, 21 May 2018 20:37:18 +0000
Received: by mail-lf0-x242.google.com with SMTP id w202-v6so25773945lff.12
 for <ath10k@lists.infradead.org>; Mon, 21 May 2018 13:37:05 -0700 (PDT)
Date: Mon, 21 May 2018 22:37:01 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH] ath10k: transmit queued frames after waking queues
Message-ID: <20180521203701.GA7619@localhost.localdomain>
References: <20180517231512.13085-1-niklas.cassel@linaro.org>
 <CAJ-Vmon1ybhWs_8Nv=w62pmhSizDdDeYCgK8_HTTwPZ=EEC46g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ-Vmon1ybhWs_8Nv=w62pmhSizDdDeYCgK8_HTTwPZ=EEC46g@mail.gmail.com>
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
To: Adrian Chadd <adrian.chadd@gmail.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>, David Miller <davem@davemloft.net>

On Thu, May 17, 2018 at 03:26:25PM -0700, Adrian Chadd wrote:
> On Thu, 17 May 2018 at 16:16, Niklas Cassel <niklas.cassel@linaro.org>
> wrote:
> 
> > diff --git a/drivers/net/wireless/ath/ath10k/txrx.c
> b/drivers/net/wireless/ath/ath10k/txrx.c
> > index cda164f6e9f6..1d3b2d2c3fee 100644
> > --- a/drivers/net/wireless/ath/ath10k/txrx.c
> > +++ b/drivers/net/wireless/ath/ath10k/txrx.c
> > @@ -95,6 +95,9 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
> >                  wake_up(&htt->empty_tx_wq);
> >          spin_unlock_bh(&htt->tx_lock);
> 
> > +       if (htt->num_pending_tx <= 3 && !list_empty(&ar->txqs))
> > +               ath10k_mac_tx_push_pending(ar);
> > +
> 
> Just sanity checking - what's protecting htt->num_pending_tx? or is it
> serialised some other way?

Hello Adrian,

I did not take the htt->tx_lock lock for this since it should not be
needed.

There are however some compiler optimizations that you have to look out
for:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/memory-barriers.txt?h=v4.17-rc6#n1547

I can't see that any of the examples applies, but let's add READ_ONCE(),
to make sure that the compiler doesn't try to optimize this.

Will send a V2 for this.

Regards,
Niklas

> 
> >          dma_unmap_single(dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
> 
> >          ath10k_report_offchan_tx(htt->ar, msdu);
> > --
> > 2.17.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
