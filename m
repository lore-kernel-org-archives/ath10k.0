Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyhUy-0002rb-GE
 for ath10k@lists.infradead.org; Thu, 23 Jul 2020 20:07:25 +0000
Message-ID: <ce380ea1fd1f5db40a92f67673f070a1f88eee50.camel@sipsolutions.net>
Subject: Re: [RFC 1/7] mac80211: Add check for napi handle before WARN_ON
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 23 Jul 2020 22:06:46 +0200
In-Reply-To: <003201d6611e$c54a1c90$4fde55b0$@codeaurora.org>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <1595351666-28193-2-git-send-email-pillair@codeaurora.org>
 <0dbdef912f9d61521011f638200fd451a3530568.camel@sipsolutions.net>
 <003201d6611e$c54a1c90$4fde55b0$@codeaurora.org>
MIME-Version: 1.0
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
To: Rakesh Pillai <pillair@codeaurora.org>, ath10k@lists.infradead.org
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, dianders@chromium.org, kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org

On Thu, 2020-07-23 at 23:56 +0530, Rakesh Pillai wrote:

> > > -	WARN_ON_ONCE(softirq_count() == 0);
> > > +	WARN_ON_ONCE(napi && softirq_count() == 0);
> > 
> > FWIW, I'm pretty sure this is incorrect - we make assumptions on
> > softirqs being disabled in mac80211 for serialization and in place of
> > some locking, I believe.
> > 
> 
> I checked this, but let me double confirm.
> But after this change, no packet is submitted from driver in a softirq context.
> So ideally this should take care of serialization.

I'd guess that we have some reliance on BHs already being disabled, for
things like u64 sync updates, or whatnot. I mean, we did "rx_ni()" for a
reason ... Maybe lockdep can help catch some of the issues.

But couldn't you be in a thread and have BHs disabled too?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
