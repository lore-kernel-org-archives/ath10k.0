Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fMDal-00070i-T9
 for ath10k@lists.infradead.org; Fri, 25 May 2018 14:21:17 +0000
Received: by mail-wr0-x242.google.com with SMTP id w3-v6so9539317wrl.12
 for <ath10k@lists.infradead.org>; Fri, 25 May 2018 07:21:05 -0700 (PDT)
Date: Fri, 25 May 2018 16:21:01 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH] ath10k: transmit queued frames after waking queues
Message-ID: <20180525142101.GA14422@localhost.localdomain>
References: <20180517231512.13085-1-niklas.cassel@linaro.org>
 <CAJ-Vmon1ybhWs_8Nv=w62pmhSizDdDeYCgK8_HTTwPZ=EEC46g@mail.gmail.com>
 <20180521203701.GA7619@localhost.localdomain>
 <20180524155034.xse7cfm5figfktuj@localhost>
 <20180525123656.GB8780@localhost.localdomain>
 <20180525125023.alc42lkgehc6iodg@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180525125023.alc42lkgehc6iodg@localhost>
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

On Fri, May 25, 2018 at 08:50:23AM -0400, Bob Copeland wrote:
> On Fri, May 25, 2018 at 02:36:56PM +0200, Niklas Cassel wrote:
> > A spin lock does have the advantage of ordering: memory operations issued
> > before the spin_unlock_bh() will be completed before the spin_unlock_bh()
> > operation has completed.
> > 
> > However, ath10k_htt_tx_dec_pending() was called earlier in the same function,
> > which decreases htt->num_pending_tx, so that write will be completed before
> > our read. That is the only ordering we care about here (if we should call
> > ath10k_mac_tx_push_pending() or not).
> 
> Sure.  I also understand that reading inside a lock and operating on the
> value outside the lock isn't really the definition of synchronization
> (doesn't really matter in this case though).
> 
> I was just suggesting that the implicit memory barrier in the spin unlock
> that we are already paying for would be sufficient here too, and it matches
> the semantic of "tx fields under tx_lock."  On the other hand, maybe it's
> just me, but I tend to look askance at just-in-case READ_ONCEs sprinkled
> about.

I agree, because of the implicit memory barrier from spin_unlock_bh(),
READ_ONCE shouldn't really be needed in this case.

I think that it's a good thing to be critical of all "just-in-case" things,
however, it's not always that obvious if you actually need READ_ONCE or not.

E.g. you might need to use it even when you are holding a spin_lock.

Some people recommend to use it for all concurrent non-read-only shared memory
accesses: https://github.com/google/ktsan/wiki/READ_ONCE-and-WRITE_ONCE

Is there a better guideline somewhere..?


Kind regards,
Niklas

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
