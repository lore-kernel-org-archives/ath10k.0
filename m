Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e4vJW-0000oq-8s
 for ath10k@lists.infradead.org; Wed, 18 Oct 2017 20:51:44 +0000
Subject: Re: Setting single rate in ath10k broken by "reject/clear user rate
 mask if not usable"
References: <13895fa0-3685-dd2b-583d-2d6469d23cfe@candelatech.com>
 <1507708948.1998.15.camel@sipsolutions.net>
 <2c293255-aa79-75a0-1c28-994f864cddf4@candelatech.com>
 <1508312033.2674.9.camel@sipsolutions.net>
 <2ad42671-59c4-80ed-4bca-f874eb53d653@candelatech.com>
 <8c2e0e98-f3f4-6e0c-1bf0-43dfa6e97275@rempel-privat.de>
 <1508358869.2674.55.camel@sipsolutions.net>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <9791c86a-a15f-4c99-ab84-ce00b242d70f@candelatech.com>
Date: Wed, 18 Oct 2017 13:51:15 -0700
MIME-Version: 1.0
In-Reply-To: <1508358869.2674.55.camel@sipsolutions.net>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>, Oleksij Rempel <linux@rempel-privat.de>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, kirtika@google.com

On 10/18/2017 01:34 PM, Johannes Berg wrote:
> Hi,
>
> On Wed, 2017-10-18 at 19:56 +0200, Oleksij Rempel wrote:
>>
>>> People trying to do regulatory testing want this feature, and other people
>>> that are not me also like to test with specific rates.  Still a
>>> small-ish set of people, but bigger than just me at least.
>>
>> Till now i was interviewing different people who was asking for this for
>> ath9k-htc. So I would say we have:
>> - academical researchers
>> - testers
>> - R&D
>> - exploit and penetration testers
>> - HAM
>> - just hackers
>>
>> As for me, it sounds a s lot.
>
> Making (literally) millions of devices in the field hit a WARN_ON() is
> not really acceptable either though.
>
> You can argue that this introduced a regression, but putting the old
> behaviour back would equally be a regression, for more systems by a few
> orders of magnitude.
>
> In any case, I've already suggested a way to fix this, but you've both
> completely ignored that part of my email. All I've been reading is that
> you're demanding that I fix this, and arguments about how much people
> are allowed to shoot themselves in the foot, none of which is very
> constructive.


You mean this part?  It wasn't clear to me that you thought this was a good
solution that should be implemented.

"
I guess you could implement this part? I.e. iterating the clients and
checking that they all support the rate that is set. However, then you
also need to implement that this gets reset when a new client that
doesn't support this rate connects.
"

The first part seems OK, but the second seems like a pain.  Maybe just
keep a new client from being able to connect at all if it doesn't support
any available rates?

Thanks,
Ben

> I might even fix it myself eventually, if only to appease the people
> who say we have a zero tolerance no regressions rule, but it's not
> exactly the most important thing I'm doing right now (also, I'll be
> going on vacation for a few days, and you can probably implement my
> suggestion in that time, and then I can review it when I get back on
> Monday.)
>
> Let's just say that I think we're discussing the wrong thing here - we
> ought to be discussing how it can be fixed, and perhaps you can even be
> constructive in suggesting (and testing, which I can't really do)
> changes.
>
> johannes
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
