Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.aperture-lab.de ([138.201.29.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRyRp-0004Np-0D
 for ath10k@lists.infradead.org; Tue, 05 Nov 2019 13:00:38 +0000
Date: Tue, 5 Nov 2019 14:00:19 +0100
From: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing@c0d3.blue>
Subject: Re: [RFC PATCH] ath10k: fix RX of frames with broken FCS in monitor
 mode
Message-ID: <20191105125152.GB10238@otheros>
References: <20191101111138.9086-1-linus.luessing@c0d3.blue>
 <8d256f92-a74b-1670-4493-8e36f402548b@candelatech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d256f92-a74b-1670-4493-8e36f402548b@candelatech.com>
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
Cc: Linus =?utf-8?Q?L=C3=BCssing?= <ll@simonwunderlich.de>, ath10k@lists.infradead.org, Simon Wunderlich <sw@simonwunderlich.de>

On Fri, Nov 01, 2019 at 08:46:53AM -0700, Ben Greear wrote:
> > diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> > index 53f1095de8ff..ce0a16ebb8bb 100644
> > --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> > +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> > @@ -1285,6 +1285,12 @@ static void ath10k_process_rx(struct ath10k *ar, struct sk_buff *skb)
> >   	status = IEEE80211_SKB_RXCB(skb);
> > +	if (ar->monitor && !(ar->filter_flags & FIF_FCSFAIL) &&
> > +	    status->flag & RX_FLAG_FAILED_FCS_CRC) {
> > +		dev_kfree_skb_any(skb);
> > +		return;
> > +	}
> 
> Maybe worth adding a counter like 'rx_drop_crc' to the ath10k_debug struct and increment it here
> and also show in debugfs and/or ethtool stats?

Ok.

> 
> And, maybe no check for ar->monitor, in case somehow the frame is still received
> with bad CRC even without monitor mode?

I think ath9k is also checking for "ah->is_monitoring" here:

https://elixir.bootlin.com/linux/v5.3.8/source/drivers/net/wireless/ath/ath9k/common.c#L96

And I didn't want to divert from this. Should I remove it anyway?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
