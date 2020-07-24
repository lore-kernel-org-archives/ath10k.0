Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyr6H-0004Cl-O7
 for ath10k@lists.infradead.org; Fri, 24 Jul 2020 06:22:38 +0000
From: "Rakesh Pillai" <pillair@codeaurora.org>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>		
 <1595351666-28193-2-git-send-email-pillair@codeaurora.org>	
 <0dbdef912f9d61521011f638200fd451a3530568.camel@sipsolutions.net>	
 <003201d6611e$c54a1c90$4fde55b0$@codeaurora.org>
 <ce380ea1fd1f5db40a92f67673f070a1f88eee50.camel@sipsolutions.net>
In-Reply-To: <ce380ea1fd1f5db40a92f67673f070a1f88eee50.camel@sipsolutions.net>
Subject: RE: [RFC 1/7] mac80211: Add check for napi handle before WARN_ON
Date: Fri, 24 Jul 2020 11:51:12 +0530
Message-ID: <000401d66182$a3d97ab0$eb8c7010$@codeaurora.org>
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
> Sent: Friday, July 24, 2020 1:37 AM
> To: Rakesh Pillai <pillair@codeaurora.org>; ath10k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org; linux-kernel@vger.kernel.org;
> kvalo@codeaurora.org; davem@davemloft.net; kuba@kernel.org;
> netdev@vger.kernel.org; dianders@chromium.org; evgreen@chromium.org
> Subject: Re: [RFC 1/7] mac80211: Add check for napi handle before
> WARN_ON
> 
> On Thu, 2020-07-23 at 23:56 +0530, Rakesh Pillai wrote:
> 
> > > > -	WARN_ON_ONCE(softirq_count() == 0);
> > > > +	WARN_ON_ONCE(napi && softirq_count() == 0);
> > >
> > > FWIW, I'm pretty sure this is incorrect - we make assumptions on
> > > softirqs being disabled in mac80211 for serialization and in place of
> > > some locking, I believe.
> > >
> >
> > I checked this, but let me double confirm.
> > But after this change, no packet is submitted from driver in a softirq
> context.
> > So ideally this should take care of serialization.
> 
> I'd guess that we have some reliance on BHs already being disabled, for
> things like u64 sync updates, or whatnot. I mean, we did "rx_ni()" for a
> reason ... Maybe lockdep can help catch some of the issues.
> 
> But couldn't you be in a thread and have BHs disabled too?

This would ideally beat the purpose and possibly hurt the other subsystems running on the same core.

> 
> johannes



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
