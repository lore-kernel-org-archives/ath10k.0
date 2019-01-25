Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn1Ub-0002Pm-PJ
 for ath10k@lists.infradead.org; Fri, 25 Jan 2019 13:25:58 +0000
Message-ID: <4f4eab34a995000d230c8b99cb6cff3f9dfd5c64.camel@sipsolutions.net>
Subject: Re: [PATCH v7 1/4] mac80211: Expose ieee80211_schedule_txq() function
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 25 Jan 2019 14:25:50 +0100
In-Reply-To: <20190122142019.21417-2-toke@redhat.com>
 (sfid-20190122_152134_612942_99BDC416)
References: <20190122142019.21417-1-toke@redhat.com>
 <20190122142019.21417-2-toke@redhat.com>
 (sfid-20190122_152134_612942_99BDC416)
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
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>, linux-wireless@vger.kernel.org
Cc: make-wifi-fast@lists.bufferbloat.net, ath10k@lists.infradead.org, Rajkumar Manoharan <rmanohar@codeaurora.org>


> +void ieee80211_schedule_txq(struct ieee80211_hw *hw,
> +			    struct ieee80211_txq *txq)
> +	__acquires(txq_lock) __releases(txq_lock)
> +{
> +	struct ieee80211_local *local = hw_to_local(hw);
> +	struct txq_info *txqi = to_txq_info(txq);
> +
> +	spin_lock_bh(&local->active_txq_lock[txq->ac]);
> +	ieee80211_return_txq(hw, txq);
> +	spin_unlock_bh(&local->active_txq_lock[ac]);
> 
Maybe v6 had txq->ac here instead of just ac which doesn't compile ;-)

I fixed it up, but I hope you tested a compiling version :P

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
