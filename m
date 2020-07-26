Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzjQz-0006sr-IN
 for ath10k@lists.infradead.org; Sun, 26 Jul 2020 16:23:36 +0000
From: "Rakesh Pillai" <pillair@codeaurora.org>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>		
 <1595351666-28193-2-git-send-email-pillair@codeaurora.org>	
 <0dbdef912f9d61521011f638200fd451a3530568.camel@sipsolutions.net>	
 <003201d6611e$c54a1c90$4fde55b0$@codeaurora.org>
 <ce380ea1fd1f5db40a92f67673f070a1f88eee50.camel@sipsolutions.net> 
In-Reply-To: 
Subject: RE: [RFC 1/7] mac80211: Add check for napi handle before WARN_ON
Date: Sun, 26 Jul 2020 21:49:51 +0530
Message-ID: <000e01d66368$9a6ece70$cf4c6b50$@codeaurora.org>
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
> From: Rakesh Pillai <pillair@codeaurora.org>
> Sent: Friday, July 24, 2020 11:51 AM
> To: 'Johannes Berg' <johannes@sipsolutions.net>;
> 'ath10k@lists.infradead.org' <ath10k@lists.infradead.org>
> Cc: 'linux-wireless@vger.kernel.org' <linux-wireless@vger.kernel.org>;
> 'linux-kernel@vger.kernel.org' <linux-kernel@vger.kernel.org>;
> 'kvalo@codeaurora.org' <kvalo@codeaurora.org>; 'davem@davemloft.net'
> <davem@davemloft.net>; 'kuba@kernel.org' <kuba@kernel.org>;
> 'netdev@vger.kernel.org' <netdev@vger.kernel.org>;
> 'dianders@chromium.org' <dianders@chromium.org>;
> 'evgreen@chromium.org' <evgreen@chromium.org>
> Subject: RE: [RFC 1/7] mac80211: Add check for napi handle before
> WARN_ON
> 
> 
> 
> > -----Original Message-----
> > From: Johannes Berg <johannes@sipsolutions.net>
> > Sent: Friday, July 24, 2020 1:37 AM
> > To: Rakesh Pillai <pillair@codeaurora.org>; ath10k@lists.infradead.org
> > Cc: linux-wireless@vger.kernel.org; linux-kernel@vger.kernel.org;
> > kvalo@codeaurora.org; davem@davemloft.net; kuba@kernel.org;
> > netdev@vger.kernel.org; dianders@chromium.org;
> evgreen@chromium.org
> > Subject: Re: [RFC 1/7] mac80211: Add check for napi handle before
> > WARN_ON
> >
> > On Thu, 2020-07-23 at 23:56 +0530, Rakesh Pillai wrote:
> >
> > > > > -	WARN_ON_ONCE(softirq_count() == 0);
> > > > > +	WARN_ON_ONCE(napi && softirq_count() == 0);
> > > >
> > > > FWIW, I'm pretty sure this is incorrect - we make assumptions on
> > > > softirqs being disabled in mac80211 for serialization and in place of
> > > > some locking, I believe.
> > > >
> > >
> > > I checked this, but let me double confirm.
> > > But after this change, no packet is submitted from driver in a softirq
> > context.
> > > So ideally this should take care of serialization.
> >
> > I'd guess that we have some reliance on BHs already being disabled, for
> > things like u64 sync updates, or whatnot. I mean, we did "rx_ni()" for a
> > reason ... Maybe lockdep can help catch some of the issues.
> >
> > But couldn't you be in a thread and have BHs disabled too?
> 
> This would ideally beat the purpose and possibly hurt the other subsystems
> running on the same core.
> 

Hi Johannes,

We do have the usage of napi_gro_receive and netif_receive_skb in mac80211.
                /* deliver to local stack */
                if (rx->napi)
                        napi_gro_receive(rx->napi, skb);
                else
                        netif_receive_skb(skb);


Also all the rx_handlers are called under the " rx->local->rx_path_lock" lock.
Is the BH disable still required ?


> >
> > johannes



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
