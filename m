Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-x231.google.com ([2607:f8b0:400d:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1awvfE-00071m-Jy
 for ath10k@lists.infradead.org; Sun, 01 May 2016 18:00:17 +0000
Received: by mail-qg0-x231.google.com with SMTP id w36so7393029qge.3
 for <ath10k@lists.infradead.org>; Sun, 01 May 2016 10:59:56 -0700 (PDT)
Message-ID: <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
Subject: Re: [Codel] fq_codel_drop vs a udp flood
From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Sun, 01 May 2016 10:59:52 -0700
In-Reply-To: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
Mime-Version: 1.0
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
To: Dave Taht <dave.taht@gmail.com>
Cc: make-wifi-fast@lists.bufferbloat.net, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, ath10k <ath10k@lists.infradead.org>

On Sat, 2016-04-30 at 20:41 -0700, Dave Taht wrote:
> >>>
> >>>     45.78%  [kernel]       [k] fq_codel_drop
> >>>      3.05%  [kernel]       [k] ag71xx_poll
> >>>      2.18%  [kernel]       [k] skb_release_data
> >>>      2.01%  [kernel]       [k] r4k_dma_cache_inv
> 
> The udp flood behavior is not "weird".  The test is wrong. It is so filling
> the local queue as to dramatically exceed the bandwidth on the link.

Well, just _kill_ the offender, instead of trying to be gentle.

fq_codel_drop() could drop _all_ packets of the fat flow, instead of a
single one.

It is too cpu intensive to be kind to the elephant, since under pressure
fq_codel_drop() needs to be called for every enqueue.

Really, we should not try to let inelastic flows hurt us.

I can provide a patch.




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
