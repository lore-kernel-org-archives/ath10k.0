Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhiZy-0005jt-Ar
 for ath10k@lists.infradead.org; Tue, 06 May 2014 16:50:55 +0000
Message-ID: <536912D0.5020005@candelatech.com>
Date: Tue, 06 May 2014 09:50:24 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: ath10k: kernel BUG at net/core/skbuff.c:147
References: <CAHqTa-22VFGSKGBq0BA+12GPz1yA87SUoYZ3J2z+RLt0VK_T4g@mail.gmail.com>
In-Reply-To: <CAHqTa-22VFGSKGBq0BA+12GPz1yA87SUoYZ3J2z+RLt0VK_T4g@mail.gmail.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 05/06/2014 03:00 AM, Avery Pennarun wrote:
> Here's another crash I'm getting sometimes.
> 
> This is with 3.2.26 kernel, mindspeed c2000 (armv7l) processor, and
> backports built using kvalo's ath-next branch, with commit
> v3.15-rc1-237-gd9bc4b9, firmware 10.1.467.2-1.
> 
> This didn't happen with the previous driver version I was using,
> ath10k-stable-3.11-8.

> Someone at work has partially analyzed it as follows:
> 
> """
> There is a change between the last backports and the new one involving how MSDU
> sk_buffs are handled. It appears to be copying a chain of skbs to the
> tail of the first skb.
> 
> The panic happens when there is insufficient headroom, which this
> function doesn't change.
> So though interesting, this doesn't appear to be involved in the panic.
> 
> [This patch seems to be from greearb, cc'd.]

Before my patch, MSDUs were just dropped, so they must have been
fairly rare and/or un-tested in most work loads.

Can you find which part of the ath10k driver is calling the code
that calls the skb_push, ie using gdb and the 'l *(ath10k_htt_txrx_compl_task+0x7ec)' command?


Thanks,
Ben



-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
