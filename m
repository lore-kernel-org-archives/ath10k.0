Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([144.76.43.152] helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTSDO-00051n-Rj
 for ath10k@lists.infradead.org; Fri, 28 Mar 2014 08:32:39 +0000
Message-ID: <1395995531.4175.3.camel@jlt4.sipsolutions.net>
Subject: Re: [PATCH] ath10k: dont call csa_finish more than once
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 28 Mar 2014 09:32:11 +0100
In-Reply-To: <CA+BoTQ=zZo-f=w3KaWPC6TJ6TmoW+XOBHNwyYCSkbc1cnedihQ@mail.gmail.com>
 (sfid-20140324_073736_101334_2EBC9F24)
References: <1395410520-26939-1-git-send-email-michal.kazior@tieto.com>
 <1395411440.4164.15.camel@jlt4.sipsolutions.net>
 <CA+BoTQk5RiFPjDGMSwFHd6GGt=x9M6QXGZcdENtMjQrDcORicg@mail.gmail.com>
 <1395414428.4164.16.camel@jlt4.sipsolutions.net>
 <CA+BoTQ=zZo-f=w3KaWPC6TJ6TmoW+XOBHNwyYCSkbc1cnedihQ@mail.gmail.com>
 (sfid-20140324_073736_101334_2EBC9F24)
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Mon, 2014-03-24 at 07:37 +0100, Michal Kazior wrote:

> > Yeah I guess. What was the reason for this though? Here it's multi-vif?
> > Before I think we were talking about races?
> 
> Before multi-vif if ieee80211_csa_finalize() failed and left
> csa_active==true driver could end up poking the csa_finalize_work()
> over and over again I guess?

I think the concern previously was about races, where finalize_work
doesn't actually get to run before the next beacon.

> For multi-vif csa using reservation there are 2 reasons:
>  a) channel switches across interfaces may not be tightly
> synchronized. I did tests where 2 long (cs_count=100) channel switches
> were a few seconds apart. In that case driver poked csa_finalize work
> quite a lot resulting in a mess.
>  b) my current approach has the following flow:
> 
> 1. reserve_chanctx()
> 2. (some time later) driver calls csa_finish, and csa_finalize calls
> use_reserved_chanctx() because reserved_chanctx is set
> 3. (possibly some time later, for multi-vif reservations) csa_finalize
> is called again but this time without reserved_chanctx, so it verifies
> if bss_conf.chandef is csa_chandef (after successful reservation it
> should be).
> 
> This means if driver would poke csa_finalize() more than once then
> use_reserved_chanctx() would be called again and again as a result.

Yeah but that seems better to catch in mac80211?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
