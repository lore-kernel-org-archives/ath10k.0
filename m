Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fMBy3-0001fV-8f
 for ath10k@lists.infradead.org; Fri, 25 May 2018 12:37:18 +0000
Received: by mail-wr0-x242.google.com with SMTP id i12-v6so8994871wrc.4
 for <ath10k@lists.infradead.org>; Fri, 25 May 2018 05:37:00 -0700 (PDT)
Date: Fri, 25 May 2018 14:36:56 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH] ath10k: transmit queued frames after waking queues
Message-ID: <20180525123656.GB8780@localhost.localdomain>
References: <20180517231512.13085-1-niklas.cassel@linaro.org>
 <CAJ-Vmon1ybhWs_8Nv=w62pmhSizDdDeYCgK8_HTTwPZ=EEC46g@mail.gmail.com>
 <20180521203701.GA7619@localhost.localdomain>
 <20180524155034.xse7cfm5figfktuj@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180524155034.xse7cfm5figfktuj@localhost>
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
To: Bob Copeland <me@bobcopeland.com>
Cc: Adrian Chadd <adrian.chadd@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>, David Miller <davem@davemloft.net>

On Thu, May 24, 2018 at 11:50:34AM -0400, Bob Copeland wrote:
> On Mon, May 21, 2018 at 10:37:01PM +0200, Niklas Cassel wrote:
> > On Thu, May 17, 2018 at 03:26:25PM -0700, Adrian Chadd wrote:
> > > On Thu, 17 May 2018 at 16:16, Niklas Cassel <niklas.cassel@linaro.org>
> > > wrote:
> > > 
> > > > diff --git a/drivers/net/wireless/ath/ath10k/txrx.c
> > > b/drivers/net/wireless/ath/ath10k/txrx.c
> > > > index cda164f6e9f6..1d3b2d2c3fee 100644
> > > > --- a/drivers/net/wireless/ath/ath10k/txrx.c
> > > > +++ b/drivers/net/wireless/ath/ath10k/txrx.c
> > > > @@ -95,6 +95,9 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
> > > >                  wake_up(&htt->empty_tx_wq);
> > > >          spin_unlock_bh(&htt->tx_lock);
> > > 
> > > > +       if (htt->num_pending_tx <= 3 && !list_empty(&ar->txqs))
> > > > +               ath10k_mac_tx_push_pending(ar);
> > > > +
> > > 
> > > Just sanity checking - what's protecting htt->num_pending_tx? or is it
> > > serialised some other way?
> [...]
> > I can't see that any of the examples applies, but let's add READ_ONCE(),
> > to make sure that the compiler doesn't try to optimize this.
> 
> Couldn't you just move the num_pending_tx read inside tx_lock which is 2 lines
> above?  I think all the other manipulations are protected by tx_lock.

Hello Bob,

There is both a V2 and V3 of this patchset, V3 moves this to a sdio.c and
calls ath10k_mac_tx_push_pending() unconditionally.


But to answer your question,
it shouldn't matter if the read is done while holding the lock or not.

Sure, the compiler could do things so that the code path is always or never
executed, but that is why I added READ_ONCE() in V2.

A spin lock does have the advantage of ordering: memory operations issued
before the spin_unlock_bh() will be completed before the spin_unlock_bh()
operation has completed.

However, ath10k_htt_tx_dec_pending() was called earlier in the same function,
which decreases htt->num_pending_tx, so that write will be completed before
our read. That is the only ordering we care about here (if we should call
ath10k_mac_tx_push_pending() or not).


Kind regards,
Niklas

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
