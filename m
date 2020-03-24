Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGkjE-0001SS-3d
 for ath10k@lists.infradead.org; Tue, 24 Mar 2020 14:40:30 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 2/2] ath10k: correct legacy rate in tx stats
References: <1574147982-3956-1-git-send-email-yyuwang@codeaurora.org>
 <0101016e82882548-361b3da4-fd9b-4ba9-95b6-a5d782d4a1c8-000000@us-west-2.amazonses.com>
Date: Tue, 24 Mar 2020 16:40:21 +0200
In-Reply-To: <0101016e82882548-361b3da4-fd9b-4ba9-95b6-a5d782d4a1c8-000000@us-west-2.amazonses.com>
 (Yu Wang's message of "Tue, 19 Nov 2019 07:19:50 +0000")
Message-ID: <87h7yd4y0a.fsf@kamboji.qca.qualcomm.com>
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
To: Yu Wang <yyuwang@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Yu Wang <yyuwang@codeaurora.org> writes:

> When working in station mode, after connected to a legacy
> AP, 11g only, for example, the tx bitrate is incorrect in
> output of command 'iw wlan0 link'.
>
> That's because the legacy tx bitrate value reported by
> firmware is not well handled:
> For QCA6174, the value represents rate index, but treated
> as a real rate;
> For QCA9888, the value is real rate, with unit 'Mbps', but
> treated as '100kbps'.
>
> To fix this issue:
> 1. Translate the rate index to real rate for QCA6174;
> 2. Translate the rate from 'Mbps' to 'kbps' for QCA9888.
>
> Tested with:
> QCA6174 PCIe with firmware WLAN.RM.4.4.1.c3-00031.
> QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00029.
> QCA9888 PCIe with firmware 10.4-3.9.0.2-00040.
>
> Signed-off-by: Yu Wang <yyuwang@codeaurora.org>

[...]

> @@ -3723,6 +3729,74 @@ static void ath10k_htt_rx_sec_ind_handler(struct ath10k *ar,
>  	spin_unlock_bh(&ar->data_lock);
>  }
>  
> +static int
> +ath10k_htt_update_ratecode(struct ath10k *ar, struct ath10k_sta *arsta,
> +			   u8 *ratecode)
> +{
> +	u8 hw_rate, preamble;
> +	u16 bitrate;
> +	int i;
> +	const struct ieee80211_rate *bitrates;
> +	bool cck;
> +	struct ieee80211_chanctx_conf *conf = NULL;
> +	enum nl80211_band band;
> +	struct ieee80211_supported_band *sband;
> +
> +	if (!ratecode)
> +		return -EINVAL;
> +
> +	/* only for legacy ratecode */
> +	preamble = ATH10K_HW_PREAMBLE(*ratecode);
> +	if (preamble != WMI_RATE_PREAMBLE_CCK &&
> +	    preamble != WMI_RATE_PREAMBLE_OFDM)
> +		return 0;
> +
> +	if (!arsta->arvif || !arsta->arvif->vif)
> +		return -EINVAL;
> +
> +	WARN_ON(!rcu_read_lock_held());
> +	conf = rcu_dereference(arsta->arvif->vif->chanctx_conf);
> +	if (!conf)
> +		return -EINVAL;
> +
> +	band = conf->def.chan->band;
> +	sband = &ar->mac.sbands[band];
> +	if (!sband->bitrates)
> +		return -EINVAL;
> +
> +	if (WARN_ON_ONCE(sband->n_bitrates > S8_MAX))
> +		return -EINVAL;
> +
> +	cck = (preamble == WMI_RATE_PREAMBLE_CCK);
> +	hw_rate = ATH10K_HW_LEGACY_RATE(*ratecode);
> +	for (i = 0; i < sband->n_bitrates; i++) {
> +		bitrates = &sband->bitrates[i];
> +		if (ath10k_mac_bitrate_is_cck(bitrates->bitrate) != cck)
> +			continue;
> +
> +		if (bitrates->hw_value == hw_rate ||
> +		    (bitrates->flags & IEEE80211_RATE_SHORT_PREAMBLE &&
> +		     bitrates->hw_value_short == hw_rate)) {
> +			bitrate = bitrates->bitrate;
> +
> +			/* The bitrate will be recovered in
> +			 * ath10k_update_per_peer_tx_stats().
> +			 */
> +			if (bitrate == 55)
> +				bitrate = 60;
> +
> +			bitrate = bitrate / 10;

Here you use magic value 60 but in ath10k_update_per_peer_tx_stats() you
use magic value 50:

> +		/* from 1Mbps to 100Kbps */
> +		rate = rate * 10;
> +		if (rate == 50)
> +			rate = 55;

Am I missing something or how is this supposed to work?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
