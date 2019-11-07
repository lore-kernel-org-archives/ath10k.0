Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.aperture-lab.de ([2a01:4f8:171:314c::100:a1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSiNz-00037r-Hp
 for ath10k@lists.infradead.org; Thu, 07 Nov 2019 14:03:45 +0000
Date: Thu, 7 Nov 2019 15:03:31 +0100
From: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing@c0d3.blue>
Subject: Re: [PATCH net-next] ath10k: fix RX of frames with broken FCS in
 monitor mode
Message-ID: <20191107140149.GB19482@otheros>
References: <20191105164932.11799-1-linus.luessing@c0d3.blue>
 <927cea69-7afc-5c35-df8d-9813392e8928@candelatech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <927cea69-7afc-5c35-df8d-9813392e8928@candelatech.com>
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
Cc: Linus =?utf-8?Q?L=C3=BCssing?= <ll@simonwunderlich.de>, Simon Wunderlich <sw@simonwunderlich.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S . Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

On Tue, Nov 05, 2019 at 09:19:20AM -0800, Ben Greear wrote:
> Thanks for adding the counter.  Since it us u32, I doubt you need the spin lock
> below?

Ok, I can remove the spin-lock.

Just for clarification though, if I recall correctly then an increment operator
is not guaranteed to work atomically. But you think it's unlikely
to race with a concurrent ++ and therefore it's fine for just a debug counter?
(and if it were racing, it'd just be a missed +1)

Or is there another mechanism that avoids concurrency in the
ath10k RX path?


> 
> --Ben
> 
> > +	if (!(ar->filter_flags & FIF_FCSFAIL) &&
> > +	    status->flag & RX_FLAG_FAILED_FCS_CRC) {
> > +		spin_lock_bh(&ar->data_lock);
> > +		ar->stats.rx_crc_err_drop++;
> > +		spin_unlock_bh(&ar->data_lock);
> > +
> > +		dev_kfree_skb_any(skb);
> > +		return;
> > +	}
> > +
> >   	ath10k_dbg(ar, ATH10K_DBG_DATA,
> >   		   "rx skb %pK len %u peer %pM %s %s sn %u %s%s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
> >   		   skb,
> > 
> 
> 
> -- 
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
