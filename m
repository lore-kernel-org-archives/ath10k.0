Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([2001:470:dc45:1000::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOsZL-0006Yx-77
 for ath10k@lists.infradead.org; Mon, 19 Nov 2018 23:03:04 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: [PATCH v3 3/6] mac80211: Add airtime accounting and scheduling to
 TXQs
In-Reply-To: <8e7847ff-4c88-10ae-2223-2fc7321641d9@nbd.name>
References: <1542063113-22438-1-git-send-email-rmanohar@codeaurora.org>
 <1542063113-22438-4-git-send-email-rmanohar@codeaurora.org>
 <e5344cad-2a18-a938-f2ed-43870027251c@nbd.name> <871s7nv9pl.fsf@toke.dk>
 <8e7847ff-4c88-10ae-2223-2fc7321641d9@nbd.name>
Date: Mon, 19 Nov 2018 15:02:50 -0800
Message-ID: <87k1l8smat.fsf@toke.dk>
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
To: Felix Fietkau <nbd@nbd.name>, Rajkumar Manoharan <rmanohar@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: make-wifi-fast@lists.bufferbloat.net

Hi Felix

Thinking a bit more about this, I think that rather than having the
driver work around the API as in your example...

> do {
> 	struct ieee80211_txq *pending_txq[4];
> 	int n_pending_txq = 0;
> 	int i;
>
> 	if (hwq->pending < 4)
> 		break;p
>
> 	nframes = 0;
>
> 	ieee80211_txq_schedule_start(hw, ac)
> 	do {
> 		bool requeue = false;
>
> 		struct ieee80211_txq *txq;
>
> 		txq = ieee80211_next_txq(hw, ac);
> 		if (!txq)
> 			break;
>
> 		nframes += schedule_txq(txq, &requeue);
> 		if (requeue)
> 			pending_txq[n_pending_txq++] = txq;
>
> 	} while (n_pending_txq < ARRAY_SIZE(pending_txq));
>
> 	for (i = n_pending_txq; i > 0; i--)
> 		ieee80211_return_txq(hw, pending_txq[i - 1]);
>
> 	ieee80211_txq_schedule_end(hw, ac)
> } while (nframes);

... really what we want is that the driver can just do this:

ieee80211_txq_schedule_start(hw, ac);
while ((txq = ieee80211_next_txq(hw, ac)) {
	schedule_txq(txq, &requeue);
        return_txq(txq);
}
ieee80211_txq_schedule_end(hw, ac);

and expect so get through all eligible TXQs. Note that there will be
cases where there is only a single eligible TXQ (such as the example I
gave in the other email); in which case the current version is fine. But
there is (probably) also going to be cases where more than one TXQ is
eligible at the same time, which we cannot handle with the current RR
scheduler.

However, I think that assuming we can get the scheduler to guarantee
that it will return all eligible TXQs between each pair of calls to
schedule_start()/schedule_end(), we should be fine with the current API.
Do you agree with this?

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
