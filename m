Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn1Zm-0003pj-9T
 for ath10k@lists.infradead.org; Fri, 25 Jan 2019 13:31:20 +0000
Received: by mail-ed1-f67.google.com with SMTP id g22so7379975edr.7
 for <ath10k@lists.infradead.org>; Fri, 25 Jan 2019 05:31:17 -0800 (PST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v7 1/4] mac80211: Expose ieee80211_schedule_txq() function
In-Reply-To: <4f4eab34a995000d230c8b99cb6cff3f9dfd5c64.camel@sipsolutions.net>
References: <20190122142019.21417-1-toke@redhat.com>
 <20190122142019.21417-2-toke@redhat.com>
 <4f4eab34a995000d230c8b99cb6cff3f9dfd5c64.camel@sipsolutions.net>
Date: Fri, 25 Jan 2019 14:31:14 +0100
Message-ID: <87sgxgc199.fsf@toke.dk>
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
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: make-wifi-fast@lists.bufferbloat.net, ath10k@lists.infradead.org, Rajkumar Manoharan <rmanohar@codeaurora.org>

Johannes Berg <johannes@sipsolutions.net> writes:

>> +void ieee80211_schedule_txq(struct ieee80211_hw *hw,
>> +			    struct ieee80211_txq *txq)
>> +	__acquires(txq_lock) __releases(txq_lock)
>> +{
>> +	struct ieee80211_local *local = hw_to_local(hw);
>> +	struct txq_info *txqi = to_txq_info(txq);
>> +
>> +	spin_lock_bh(&local->active_txq_lock[txq->ac]);
>> +	ieee80211_return_txq(hw, txq);
>> +	spin_unlock_bh(&local->active_txq_lock[ac]);
>> 
> Maybe v6 had txq->ac here instead of just ac which doesn't compile ;-)
>
> I fixed it up, but I hope you tested a compiling version :P

Ah, right, thanks for fixing it! I think this was an artifact of moving
things around while rebasing for submission (I have another patch on top
of this series that I need to test first).

So yeah, I definitely have a version in my tree somewhere that actually
compiles ;)

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
