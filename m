Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIq6I-0001dI-Fv
 for ath10k@lists.infradead.org; Fri, 11 Oct 2019 08:16:40 +0000
Message-ID: <3cbedfe48e796b9d2c28d97c301a08a03b42869c.camel@sipsolutions.net>
Subject: Re: [PATCH v3 1/2] mac80211: Implement Airtime-based Queue Limit (AQL)
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 11 Oct 2019 10:16:27 +0200
In-Reply-To: <CA+iem5u8p7pDZw-QvqU285p7F5AunN3Z4YyS=TjAd9xbKqegnQ@mail.gmail.com>
 (sfid-20191011_042420_744343_355715ED)
References: <20191010022502.141862-1-kyan@google.com>
 <20191010022502.141862-2-kyan@google.com>
 <a2cc0ebecfb055c8b667db57d0469fe69054a69c.camel@sipsolutions.net>
 <87ftk0jr70.fsf@toke.dk>
 <CA+iem5u8p7pDZw-QvqU285p7F5AunN3Z4YyS=TjAd9xbKqegnQ@mail.gmail.com>
 (sfid-20191011_042420_744343_355715ED)
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
To: Kan Yan <kyan@google.com>, Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc: make-wifi-fast@lists.bufferbloat.net, Yibo Zhao <yiboz@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Felix Fietkau <nbd@nbd.name>

On Thu, 2019-10-10 at 19:24 -0700, Kan Yan wrote:

> > > + * ieee80211_txq_aql_check - check if a txq can send frame to device
> > I wonder if this really should even be have "aql" in the name? It's also
> > going to return NULL if there's nothing on the TXQ, for example, right?
> 
> Renamed to  ieee80211_txq_airtime_check()

:)

> This function is not for finding next eligible txq, but return a
> boolean to indicate if a given txq can send more packets to device. It
> is also called from ath10k:
> static bool ath10k_mac_tx_can_push(struct ieee80211_hw *hw,
>                                    struct ieee80211_txq *txq)
> {
>        ...
>         if (!ieee80211_txq_airtime_check(hw, txq))
>                 return false;

Sure, I get that.

I phrased this badly before because I neglected to look at the code of
the function closely.

You were documenting it as

+ * Return true if the AQL's airtime limit has not been reached and the txq can
+ * continue to send more packets to the device. Otherwise return false.

but with the current implementation that's not really true. For example,
if there are no packets on the TXQ at all, then the function still
returns true, even if it's not true that "the txq can continue to send
more packets to the device".

So I guess really what I should ask is if the documentation shouldn't be
rephrased to say something like

	[...] has not been reached and the TXQ is eligible to send
        packets to the device, regardless of whether or not it currently
        can or cannot (e.g. if it has no packets, or is stopped, etc.)

to make it more obvious that this really is *only* concerned about the
airtime aspects.

> > But then again, we don't really care *that* much about overflow or
> > underflow in this code path - it's not going to be security critical.
> > But it seems that your code there actually can cause UB? That would be
> > nice to avoid.
> > Actually, that condition can never be true, right? Wait, ok, this one
> > can because integer promotion?
> 
>  I don't think that condition could happen. The WARN_ONCE() was added
> per your earlier comment. The older version don't have underflow check
> and reset pending_airtime part and I didn't find any issues.

Of course it will never happen with a valid driver :-)

But it seems like a very easy mistake to make - add an estimate, and
later subtract the actual airtime, which may be more ...

> > Except aql_total_pending_airtime is still defined as s32 and that causes
> > different behaviour?
> > All this confuses me ... is it possible to write this more clearly?
> 
> I revised it to something similar to the original version, which
> ieee80211_sta_update_pending_airtime() takes extra parameter to
> indicate whether it is for a tx completion event.
> void ieee80211_sta_update_pending_airtime(struct ieee80211_sta *pubsta, u8 tid,
>                                           u32 tx_airtime, bool tx_completed)
> This help get rid of the problem that airtime need be signed. Also
> added the inline function of
> ieee80211_sta_register/release_pending_airtime() as you suggested.

ok

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
