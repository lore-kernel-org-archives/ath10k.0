Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIaYF-0001gJ-VR
 for ath10k@lists.infradead.org; Thu, 10 Oct 2019 15:40:29 +0000
Message-ID: <a2cc0ebecfb055c8b667db57d0469fe69054a69c.camel@sipsolutions.net>
Subject: Re: [PATCH v3 1/2] mac80211: Implement Airtime-based Queue Limit (AQL)
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 10 Oct 2019 17:40:12 +0200
In-Reply-To: <20191010022502.141862-2-kyan@google.com>
 (sfid-20191010_042522_960956_7035429C)
References: <20191010022502.141862-1-kyan@google.com>
 <20191010022502.141862-2-kyan@google.com>
 (sfid-20191010_042522_960956_7035429C)
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
To: Kan Yan <kyan@google.com>
Cc: make-wifi-fast@lists.bufferbloat.net, toke@redhat.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, yiboz@codeaurora.org, nbd@nbd.name

Hi,

A couple of points...

First, I'd like Toke to review & ack this if possible :-)

Second, I probably won't apply this until I return from vacation (will
be out next week & the week after).

Third, a couple of more comments on the code:

> +/* The per TXQ firmware queue limit in airtime */

I was pretty sure I mentioned it *somewhere*, but I think just calling
this "device" or something would be more general. If you don't mind, I
can edit that also (unless you have other reasons to resubmit?)

> +/**
> + * ieee80211_sta_update_pending_airtime - update txq's estimated airtime
> + *
> + * Update the estimated total airtime of frames queued in a lower layer queue.
> + *
> + * The estimated airtime is calculated for each frame using the last reported
> + * data rate and stored in the SKB's CB. Once the frame is completed, the same
> + * airtime stored in the CB should be subtracted from a txq's pending airtime

"stored in the CB" should probably be just given as an example "(e.g.
stored in the CB)"

> + * count.

"count" is a bit odd for a time value, just remove "count"?

(again, I can fix these)

> +/**
> + * ieee80211_txq_aql_check - check if a txq can send frame to device

I wonder if this really should even be have "aql" in the name? It's also
going to return NULL if there's nothing on the TXQ, for example, right?

> +	len = scnprintf(buf, sizeof(buf),
> +			"AC	AQL limit low	AQL limit high\n"
> +			"0	%u		%u\n"
> +			"1	%u		%u\n"
> +			"2	%u		%u\n"
> +			"3	%u		%u\n",

BK/BE/VI/VO instead of 0/1/23?

> +			local->aql_txq_limit_low[0],
> +			local->aql_txq_limit_high[0],
> +			local->aql_txq_limit_low[1],
> +			local->aql_txq_limit_high[1],
> +			local->aql_txq_limit_low[2],
> +			local->aql_txq_limit_high[2],
> +			local->aql_txq_limit_low[3],
> +			local->aql_txq_limit_high[3]);

but then I guess we have to use the macros to index here too

> +	local->airtime_flags =
> +		AIRTIME_USE_TX | AIRTIME_USE_RX | AIRTIME_USE_AQL;


might be nicer as 

 airtime_flags = TX |
                 RX |
                 AQL;

but doesn't matter, just in case you have to resend anyway...

> +	spin_lock_bh(&local->active_txq_lock[ac]);
> +	if (unlikely(sta->airtime[ac].aql_tx_pending + tx_airtime > S32_MAX)) {
> +		WARN_ONCE(1, "TXQ pending airtime underflow: %d, %d",
> +			  sta->airtime[ac].aql_tx_pending, tx_airtime);

if (WARN_ONCE(..., "...", ...))

saves you the braces and the extra condition

Also, hmm, doesn't this rely on 2s complement underflow or something?

Maybe that should be

	__signed_add_overflow(aql_tx_pending, tx_airtime,
                              &aql_tx_pending) ||
        aql_tx_pending < 0

or so?

But then again, we don't really care *that* much about overflow or
underflow in this code path - it's not going to be security critical.

But it seems that your code there actually can cause UB? That would be
nice to avoid.

Actually, that condition can never be true, right? Wait, ok, this one
can because integer promotion?

> +		sta->airtime[ac].aql_tx_pending = 0;
> +	} else {
> +		sta->airtime[ac].aql_tx_pending += tx_airtime;
> +	}
> +
> +	if (unlikely(local->aql_total_pending_airtime + tx_airtime > S32_MAX)) {
> +		WARN_ONCE(1, "pending airtime underflow: %d, %d",
> +			  local->aql_total_pending_airtime, tx_airtime);

same here

Except aql_total_pending_airtime is still defined as s32 and that causes
different behaviour?

All this confuses me ... is it possible to write this more clearly?

Thanks,
johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
