Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHCHf-0004KU-H4
 for ath10k@lists.infradead.org; Fri, 30 Jan 2015 14:10:56 +0000
Message-ID: <1422627032.1919.26.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/7] ath10k: implement chanctx API
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 30 Jan 2015 15:10:32 +0100
In-Reply-To: <CA+BoTQ=pRfxreghBMNoqXfADSLntws_UZqtLHRHbdTrLJvH6bw@mail.gmail.com>
 (sfid-20150130_150200_280430_F4A5B0DB)
References: <1422607287-12289-1-git-send-email-michal.kazior@tieto.com>
 <1422621086-28970-1-git-send-email-michal.kazior@tieto.com>
 <1422621086-28970-3-git-send-email-michal.kazior@tieto.com>
 <1422622694.1919.17.camel@sipsolutions.net>
 <CA+BoTQkVuDqZVCVUB6pkDKp2tZ1sgnezju6Kg48JvnS4a_LZyA@mail.gmail.com>
 <1422623446.1919.20.camel@sipsolutions.net>
 <CA+BoTQ=pRfxreghBMNoqXfADSLntws_UZqtLHRHbdTrLJvH6bw@mail.gmail.com>
 (sfid-20150130_150200_280430_F4A5B0DB)
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

On Fri, 2015-01-30 at 15:01 +0100, Michal Kazior wrote:

> With `width` you'll change `center_freq1` in many cases. Reading a
> pair of old-and-new of each may not necessarily be fatal but may
> introduce subtle bugs that are hard to debug. Even if the current code
> doesn't really use these values out of mac80211 callback context now
> it may become a problem later.

Yes, this is a good point. Like I said (below), we had a similar issue
with the bss_conf, in our case that was two timestamps there that need
to be read together. Right now we're the only ones using those and only
within the context of the callback, so we can just document that they're
only valid together in such a context, but it's a more general issue.

> > We've recently seen a similar issue with vif->bss_conf, and I'm
> > considering making that an RCU-protected pointer rather than the
> > embedded sub-struct, that way mac80211 can replace it atomically when
> > needed. I've yet to see if that's practical though.
> 
> It'd be lovely if I could freely read mac80211 structures from
> whatever context I want without any worries but I think you'd have to
> introduce explicit locking between mac80211 and drivers or go ham with
> RCU :-)

Yeah, locking there would perhaps not be such a bad idea? Either that or
RCU. Though we need RCU already in many contexts (like a tasklet
iterating the list of interfaces) but perhaps configuration accesses
could be contained to mutex-capable contexts? I don't know.

We did have a similar problem between cfg80211 and mac80211 and decided
to move the cfg80211 mutex to the public part so that mac80211 (or other
cfg80211 drivers, of course) could use it - and in fact the cfg80211 API
requires that now in some places - but we haven't really considered this
so much in the context of drivers.

I think this would make a good discussion topic for the wireless
workshop :)

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
