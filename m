Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fMCB2-0006Y7-QY
 for ath10k@lists.infradead.org; Fri, 25 May 2018 12:50:38 +0000
Received: by mail-io0-x244.google.com with SMTP id e20-v6so6256418iof.4
 for <ath10k@lists.infradead.org>; Fri, 25 May 2018 05:50:25 -0700 (PDT)
Date: Fri, 25 May 2018 08:50:23 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH] ath10k: transmit queued frames after waking queues
Message-ID: <20180525125023.alc42lkgehc6iodg@localhost>
References: <20180517231512.13085-1-niklas.cassel@linaro.org>
 <CAJ-Vmon1ybhWs_8Nv=w62pmhSizDdDeYCgK8_HTTwPZ=EEC46g@mail.gmail.com>
 <20180521203701.GA7619@localhost.localdomain>
 <20180524155034.xse7cfm5figfktuj@localhost>
 <20180525123656.GB8780@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180525123656.GB8780@localhost.localdomain>
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

On Fri, May 25, 2018 at 02:36:56PM +0200, Niklas Cassel wrote:
> A spin lock does have the advantage of ordering: memory operations issued
> before the spin_unlock_bh() will be completed before the spin_unlock_bh()
> operation has completed.
> 
> However, ath10k_htt_tx_dec_pending() was called earlier in the same function,
> which decreases htt->num_pending_tx, so that write will be completed before
> our read. That is the only ordering we care about here (if we should call
> ath10k_mac_tx_push_pending() or not).

Sure.  I also understand that reading inside a lock and operating on the
value outside the lock isn't really the definition of synchronization
(doesn't really matter in this case though).

I was just suggesting that the implicit memory barrier in the spin unlock
that we are already paying for would be sufficient here too, and it matches
the semantic of "tx fields under tx_lock."  On the other hand, maybe it's
just me, but I tend to look askance at just-in-case READ_ONCEs sprinkled
about.

-- 
Bob Copeland %% https://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
