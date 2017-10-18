Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e4v3I-0006gn-Ql
 for ath10k@lists.infradead.org; Wed, 18 Oct 2017 20:34:59 +0000
Message-ID: <1508358869.2674.55.camel@sipsolutions.net>
Subject: Re: Setting single rate in ath10k broken by "reject/clear user rate
 mask if not usable"
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 18 Oct 2017 22:34:29 +0200
In-Reply-To: <8c2e0e98-f3f4-6e0c-1bf0-43dfa6e97275@rempel-privat.de>
 (sfid-20171018_195626_878094_461B764D)
References: <13895fa0-3685-dd2b-583d-2d6469d23cfe@candelatech.com>
 <1507708948.1998.15.camel@sipsolutions.net>
 <2c293255-aa79-75a0-1c28-994f864cddf4@candelatech.com>
 <1508312033.2674.9.camel@sipsolutions.net>
 <2ad42671-59c4-80ed-4bca-f874eb53d653@candelatech.com>
 <8c2e0e98-f3f4-6e0c-1bf0-43dfa6e97275@rempel-privat.de>
 (sfid-20171018_195626_878094_461B764D)
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
To: Oleksij Rempel <linux@rempel-privat.de>, Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, kirtika@google.com

Hi,

On Wed, 2017-10-18 at 19:56 +0200, Oleksij Rempel wrote:
> 
> > People trying to do regulatory testing want this feature, and other people
> > that are not me also like to test with specific rates.  Still a 
> > small-ish set of people, but bigger than just me at least.
> 
> Till now i was interviewing different people who was asking for this for 
> ath9k-htc. So I would say we have:
> - academical researchers
> - testers
> - R&D
> - exploit and penetration testers
> - HAM
> - just hackers
> 
> As for me, it sounds a s lot.

Making (literally) millions of devices in the field hit a WARN_ON() is
not really acceptable either though.

You can argue that this introduced a regression, but putting the old
behaviour back would equally be a regression, for more systems by a few
orders of magnitude.

In any case, I've already suggested a way to fix this, but you've both
completely ignored that part of my email. All I've been reading is that
you're demanding that I fix this, and arguments about how much people
are allowed to shoot themselves in the foot, none of which is very
constructive.

I might even fix it myself eventually, if only to appease the people
who say we have a zero tolerance no regressions rule, but it's not
exactly the most important thing I'm doing right now (also, I'll be
going on vacation for a few days, and you can probably implement my
suggestion in that time, and then I can review it when I get back on
Monday.)

Let's just say that I think we're discussing the wrong thing here - we
ought to be discussing how it can be fixed, and perhaps you can even be
constructive in suggesting (and testing, which I can't really do)
changes.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
