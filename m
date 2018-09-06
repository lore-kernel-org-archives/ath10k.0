Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxoRN-00011J-5H
 for ath10k@lists.infradead.org; Thu, 06 Sep 2018 07:10:58 +0000
MIME-Version: 1.0
Date: Thu, 06 Sep 2018 12:40:45 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [RFC v2] ath10k: report tx rate using ieee80211_tx_status()
In-Reply-To: <1535969922.3437.37.camel@sipsolutions.net>
References: <1524291786-30850-1-git-send-email-akolli@codeaurora.org>
 <87k1o6d8hw.fsf@kamboji.qca.qualcomm.com>
 <1535969922.3437.37.camel@sipsolutions.net>
Message-ID: <57c9d018e6c8bddc50871c88bddee3b7@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rge?= =?UTF-8?Q?nsen?= <toke@toke.dk>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2018-09-03 15:48, Johannes Berg wrote:
> On Fri, 2018-08-31 at 15:29 +0300, Kalle Valo wrote:
> 
>> Too me this feels like a bad idea but I'm not familiar enough with
>> mac80211 to really comment on this. What kind of implications does 
>> this
>> have for Mesh or ATF, for example? Adding Johannes and Toke to hear
>> about their opinion about this.
> 
> The biggest implication is probably radiotap. Beyond that, it's using
> this to report the "last rate" to nl80211, but that's not all super
> useful anyway.
> 
> The retry count is also affected, and since you report "somewhat
> liberally" that would lead to erroneous statistics.
> 
> I'd recommend against doing this and disentangling the necessary code 
> in
> mac80211, e.g. with ieee80211_tx_status_ext() or adding similar APIs.
> 
> johannes

Thanks for the review.

Is this okay to implement a new API to update the tx rate alone?

Code snippet:
  /**
  * ieee80211_tx_status_rate_upd - transmit rate update callback
  *
  * This function can be used in drivers that does not have provision
  * in updating the tx rate in data path.
  *
  * @hw: the hardware the frame was transmitted by
  * @status: tx status information
  * @pubsta: the station to update the tx rate for.
  */
void ieee80211_tx_status_rate_upd(struct ieee80211_hw *hw,
				  struct ieee80211_sta *pubsta,
				  struct ieee80211_tx_info *info);


Source:
void ieee80211_tx_status_rate_upd(struct ieee80211_hw *hw,
				  struct ieee80211_sta *pubsta,
				  struct ieee80211_tx_info *info)
{
	struct ieee80211_local *local = hw_to_local(hw);
	struct ieee80211_supported_band *sband;
	int retry_count;
	int rates_idx;
	struct ieee80211_tx_status status = {
		.skb = NULL,
		.info = info,
	};

	ieee80211_tx_get_rates(hw, info, &retry_count);
	sband = hw->wiphy->bands[info->band];

	if (pubsta) {
		struct sta_info *sta;

		sta = container_of(pubsta, struct sta_info, sta);
		status.sta = &sta->sta;
		rate_control_tx_status(local, sband, &status);
		if (ieee80211_hw_check(&local->hw, HAS_RATE_CONTROL) &&
		    (rates_idx != -1))
			sta->tx_stats.last_rate = info->status.rates[rates_idx];
	}

}
EXPORT_SYMBOL(ieee80211_tx_status_rate_upd);


Thanks
Anil.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
