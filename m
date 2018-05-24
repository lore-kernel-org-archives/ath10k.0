Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x243.google.com ([2607:f8b0:4001:c0b::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLsVr-0005jB-CJ
 for ath10k@lists.infradead.org; Thu, 24 May 2018 15:50:51 +0000
Received: by mail-it0-x243.google.com with SMTP id p3-v6so2998598itc.0
 for <ath10k@lists.infradead.org>; Thu, 24 May 2018 08:50:36 -0700 (PDT)
Date: Thu, 24 May 2018 11:50:34 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH] ath10k: transmit queued frames after waking queues
Message-ID: <20180524155034.xse7cfm5figfktuj@localhost>
References: <20180517231512.13085-1-niklas.cassel@linaro.org>
 <CAJ-Vmon1ybhWs_8Nv=w62pmhSizDdDeYCgK8_HTTwPZ=EEC46g@mail.gmail.com>
 <20180521203701.GA7619@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180521203701.GA7619@localhost.localdomain>
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
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Adrian Chadd <adrian.chadd@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>, David Miller <davem@davemloft.net>

On Mon, May 21, 2018 at 10:37:01PM +0200, Niklas Cassel wrote:
> On Thu, May 17, 2018 at 03:26:25PM -0700, Adrian Chadd wrote:
> > On Thu, 17 May 2018 at 16:16, Niklas Cassel <niklas.cassel@linaro.org>
> > wrote:
> > 
> > > diff --git a/drivers/net/wireless/ath/ath10k/txrx.c
> > b/drivers/net/wireless/ath/ath10k/txrx.c
> > > index cda164f6e9f6..1d3b2d2c3fee 100644
> > > --- a/drivers/net/wireless/ath/ath10k/txrx.c
> > > +++ b/drivers/net/wireless/ath/ath10k/txrx.c
> > > @@ -95,6 +95,9 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
> > >                  wake_up(&htt->empty_tx_wq);
> > >          spin_unlock_bh(&htt->tx_lock);
> > 
> > > +       if (htt->num_pending_tx <= 3 && !list_empty(&ar->txqs))
> > > +               ath10k_mac_tx_push_pending(ar);
> > > +
> > 
> > Just sanity checking - what's protecting htt->num_pending_tx? or is it
> > serialised some other way?
[...]
> I can't see that any of the examples applies, but let's add READ_ONCE(),
> to make sure that the compiler doesn't try to optimize this.

Couldn't you just move the num_pending_tx read inside tx_lock which is 2 lines
above?  I think all the other manipulations are protected by tx_lock.

-- 
Bob Copeland %% https://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
