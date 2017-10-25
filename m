Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e7NRj-0005hJ-LJ
 for ath10k@lists.infradead.org; Wed, 25 Oct 2017 15:18:23 +0000
Message-ID: <1508944670.2421.49.camel@sipsolutions.net>
Subject: Re: Setting single rate in ath10k broken by "reject/clear user rate
 mask if not usable"
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 25 Oct 2017 17:17:50 +0200
In-Reply-To: <0bfb289d-a9fa-03d9-f9c7-cc0d01b0bd43@candelatech.com>
References: <13895fa0-3685-dd2b-583d-2d6469d23cfe@candelatech.com>
 <1507708948.1998.15.camel@sipsolutions.net>
 <2c293255-aa79-75a0-1c28-994f864cddf4@candelatech.com>
 <1508312033.2674.9.camel@sipsolutions.net>
 <2ad42671-59c4-80ed-4bca-f874eb53d653@candelatech.com>
 <8c2e0e98-f3f4-6e0c-1bf0-43dfa6e97275@rempel-privat.de>
 <1508358869.2674.55.camel@sipsolutions.net>
 <9791c86a-a15f-4c99-ab84-ce00b242d70f@candelatech.com>
 <1508360527.2674.61.camel@sipsolutions.net>
 <0bfb289d-a9fa-03d9-f9c7-cc0d01b0bd43@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>, Oleksij Rempel <linux@rempel-privat.de>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, kirtika@google.com

Hi,

So I fixed the part about the rate setting calling into the driver
before rejecting.

> If a user specifies a specific rate or rate-set, then I do not think we
> should quietly change it out from under them.  So, we could check at the
> time the rate-set is applied (all current peers).  We can reject the change
> at that point if one of the peers does not support any common rates.
> And, whenever a peer tries to be associated, we can check that there is some common rateset
> in place.  If there is no common rateset, then reject the association
> one way or another.

It's not trivial to do in the kernel, but if we reject adding the
station then hostapd will turn around and reject the association. This
might not end up being done nicely, but I think it does still happen
before the association response, so a negative one would result.

> > We'll need to be a little careful what happens with client-mode
> > interfaces, which is where we actually observed hitting the WARN_ON()
> > about not having any rates at all, but I think I already put a reset of
> > the rates there anyway if they're not compatible with the AP. At least
> > that's easier because there's only one client.
> 
> It would be easy to configure a station to do VHT MCS 8 only, and then
> it would never be able to associate with an HT AP, for instance.  I don't
> think this should be a WARN_ON event, just a failure.  

Well it resulted in a WARN_ON because if the AP didn't have those
rates, we'd not find any usable rates while trying to transmit a frame,
and then ended up warning and falling down to the lowest possible rate.

I don't think I agree that configuring this should reject the
association, and I've already implemented the behaviour of dropping the
user's rate set in this case in the patch we're discussing.

> It would be great
> if we could get a useful error message back to the caller, but I am not
> sure how feasible that is with the current netlink and mac80211 code.

If we reject the user setting, then we can easily more useful return
error messages now that we have generic netlink extack support. The
more "interesting" case is when the user set this and then reconnects.

This kind of problem is why I absolutely dislike out-of-band state that
affects the connection, rather than giving it in the connection
command(s) (connect, auth, associate, whatever). We're stuck with it
now, and needed to redefine that this selection may be dropped if not
usable.

> If your main concern is hitting a WARN_ON, maybe just change it to a
> quieter error message or remove it entirely and just return a failure
> code?

No, the warning serves a useful purpose, it's not useful to fall back
to the lowest rate, even if the user selected something completely
unusable. Arguably we should simply reject transmitting in that case,
but that's not really better either ...

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
