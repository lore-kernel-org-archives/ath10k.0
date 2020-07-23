Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyfvW-0004zT-Lz
 for ath10k@lists.infradead.org; Thu, 23 Jul 2020 18:26:46 +0000
From: "Rakesh Pillai" <pillair@codeaurora.org>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>	
 <1595351666-28193-2-git-send-email-pillair@codeaurora.org>
 <0dbdef912f9d61521011f638200fd451a3530568.camel@sipsolutions.net>
In-Reply-To: <0dbdef912f9d61521011f638200fd451a3530568.camel@sipsolutions.net>
Subject: RE: [RFC 1/7] mac80211: Add check for napi handle before WARN_ON
Date: Thu, 23 Jul 2020 23:56:18 +0530
Message-ID: <003201d6611e$c54a1c90$4fde55b0$@codeaurora.org>
MIME-Version: 1.0
Content-Language: en-us
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
To: 'Johannes Berg' <johannes@sipsolutions.net>, ath10k@lists.infradead.org
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, dianders@chromium.org, kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org



> -----Original Message-----
> From: Johannes Berg <johannes@sipsolutions.net>
> Sent: Wednesday, July 22, 2020 6:26 PM
> To: Rakesh Pillai <pillair@codeaurora.org>; ath10k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org; linux-kernel@vger.kernel.org;
> kvalo@codeaurora.org; davem@davemloft.net; kuba@kernel.org;
> netdev@vger.kernel.org; dianders@chromium.org; evgreen@chromium.org
> Subject: Re: [RFC 1/7] mac80211: Add check for napi handle before
> WARN_ON
> 
> On Tue, 2020-07-21 at 22:44 +0530, Rakesh Pillai wrote:
> > The function ieee80211_rx_napi can be now called
> > from a thread context as well, with napi context
> > being NULL.
> >
> > Hence add the napi context check before giving out
> > a warning for softirq count being 0.
> >
> > Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
> >
> > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > ---
> >  net/mac80211/rx.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
> > index a88ab6f..1e703f1 100644
> > --- a/net/mac80211/rx.c
> > +++ b/net/mac80211/rx.c
> > @@ -4652,7 +4652,7 @@ void ieee80211_rx_napi(struct ieee80211_hw
> *hw, struct ieee80211_sta *pubsta,
> >  	struct ieee80211_supported_band *sband;
> >  	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
> >
> > -	WARN_ON_ONCE(softirq_count() == 0);
> > +	WARN_ON_ONCE(napi && softirq_count() == 0);
> 
> FWIW, I'm pretty sure this is incorrect - we make assumptions on
> softirqs being disabled in mac80211 for serialization and in place of
> some locking, I believe.
> 

I checked this, but let me double confirm.
But after this change, no packet is submitted from driver in a softirq context.
So ideally this should take care of serialization.


> johannes



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
