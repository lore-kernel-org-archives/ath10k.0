Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fviYs-0000Tu-DP
 for ath10k@lists.infradead.org; Fri, 31 Aug 2018 12:30:04 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [RFC v2] ath10k: report tx rate using ieee80211_tx_status()
References: <1524291786-30850-1-git-send-email-akolli@codeaurora.org>
Date: Fri, 31 Aug 2018 15:29:47 +0300
In-Reply-To: <1524291786-30850-1-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Sat, 21 Apr 2018 11:53:06 +0530")
Message-ID: <87k1o6d8hw.fsf@kamboji.qca.qualcomm.com>
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgen?= =?utf-8?Q?sen?= <toke@toke.dk>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> writes:

> Mesh path metric needs txrate information from ieee80211_tx_status()
> call but in ath10k there is no mechanism to report tx rate information
> via ieee80211_tx_status(), the rate is only accessible via
> sta_statiscs() op.
>
> Per peer stats has tx rate info available, this patch stores per peer
> last tx rate and updates the tx rate info structures in tx completition.
> The rate updated in ieee80211_tx_status() is not exactly for the last
> transmitted frame instead the rate is from one of the previous frames.
>
> Per peer txrate information is updated through per peer statistics
> and is available for QCA9888/QCA9984/QCA4019/QCA998X only
>
> Tested on QCA9984 with firmware-5.bin_10.4-3.5.3-00053
> Tested on QCA998X with firmware-5.bin_10.2.4-1.0-00036
>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

This is a patch from last March, full patch here:

https://patchwork.kernel.org/patch/10267693/

> @@ -119,6 +122,18 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
>  			info->flags &= ~IEEE80211_TX_STAT_ACK;
>  	}
>  
> +	if (sta) {
> +		spin_lock_bh(&ar->data_lock);
> +		arsta = (struct ath10k_sta *)sta->drv_priv;
> +		info->status.rates[0].idx =
> +			arsta->tx_info.status.rates[0].idx;
> +		info->status.rates[0].count =
> +			arsta->tx_info.status.rates[0].count;
> +		info->status.rates[0].flags =
<> +			arsta->tx_info.status.rates[0].flags;
> +		spin_unlock_bh(&ar->data_lock);
> +	}
> +
>  	ieee80211_tx_status(htt->ar->hw, msdu);
>  	/* we do not own the msdu anymore */

"is not exactly" is IMHO an understatement. What it means that with this
patch ath10k reports the rate information from another frame instead of
the current skb, because the firmware provides the rate information "out
of band". A simple example to clarify:

   Let's say ath10k transmits frames A, B and C. Then ath10k calls
   ieee80211_tx_status() for frame C the rate information could be for
   frame A, or it could be the other around for frame A status the rate
   information is from frame C.

In other words, there's no guarantee from what frame the rate
information is from.

Too me this feels like a bad idea but I'm not familiar enough with
mac80211 to really comment on this. What kind of implications does this
have for Mesh or ATF, for example? Adding Johannes and Toke to hear
about their opinion about this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
