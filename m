Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([52.28.52.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUC9M-0005ez-B0
 for ath10k@lists.infradead.org; Tue, 04 Dec 2018 14:58:14 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: [PATCH v3 3/6] mac80211: Add airtime accounting and scheduling to
 TXQs
In-Reply-To: <e5344cad-2a18-a938-f2ed-43870027251c@nbd.name>
References: <1542063113-22438-1-git-send-email-rmanohar@codeaurora.org>
 <1542063113-22438-4-git-send-email-rmanohar@codeaurora.org>
 <e5344cad-2a18-a938-f2ed-43870027251c@nbd.name>
Date: Tue, 04 Dec 2018 16:55:45 +0200
Message-ID: <87in09ibny.fsf@toke.dk>
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

Felix Fietkau <nbd@nbd.name> writes:

>> diff --git a/net/mac80211/status.c b/net/mac80211/status.c
>> index aa4afbf0abaf..a1f1256448f5 100644
>> --- a/net/mac80211/status.c
>> +++ b/net/mac80211/status.c
>> @@ -818,6 +818,12 @@ static void __ieee80211_tx_status(struct ieee80211_hw *hw,
>>  			ieee80211_sta_tx_notify(sta->sdata, (void *) skb->data,
>>  						acked, info->status.tx_time);
>>  
>> +		if (info->status.tx_time &&
>> +		    wiphy_ext_feature_isset(local->hw.wiphy,
>> +					    NL80211_EXT_FEATURE_AIRTIME_FAIRNESS))
>> +			ieee80211_sta_register_airtime(&sta->sta, tid,
>> +						       info->status.tx_time, 0);
>> +
>>  		if (ieee80211_hw_check(&local->hw, REPORTS_TX_ACK_STATUS)) {
>>  			if (info->flags & IEEE80211_TX_STAT_ACK) {
>>  				if (sta->status_stats.lost_packets)
> I think the same is needed in ieee80211_tx_status_ext.

So finally circled back to this. In ieee80211_tx_status_ext() we don't
have an skb, so we don't know which TID the packet was sent to; what
airtime information would the driver actually provide in this case? Is
it an aggregate of all ACs, or?

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
