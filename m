Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUagY-0007t5-BJ
 for ath10k@lists.infradead.org; Tue, 12 Nov 2019 18:14:41 +0000
Received: by mail-pf1-x443.google.com with SMTP id 193so13885311pfc.13
 for <ath10k@lists.infradead.org>; Tue, 12 Nov 2019 10:14:37 -0800 (PST)
Subject: Re: [PATCH 2/2] ath10k: correct legacy rate in tx stats
References: <1573559148-4844-1-git-send-email-yyuwang@codeaurora.org>
 <1573559148-4844-3-git-send-email-yyuwang@codeaurora.org>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <8c633afa-085d-9cf1-549e-afcfee89c96a@eero.com>
Date: Tue, 12 Nov 2019 10:14:34 -0800
MIME-Version: 1.0
In-Reply-To: <1573559148-4844-3-git-send-email-yyuwang@codeaurora.org>
Content-Language: en-US
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
To: Yu Wang <yyuwang@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org


On 11/12/19 3:45 AM, Yu Wang wrote:
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
> ---
>
> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -3454,10 +3440,12 @@ ath10k_update_per_peer_tx_stats(struct ath10k *ar,
>   {
>   	struct ath10k_sta *arsta = (struct ath10k_sta *)sta->drv_priv;
>   	struct ieee80211_chanctx_conf *conf = NULL;
> -	u8 rate = 0, sgi;
> -	s8 rate_idx = 0;
> +	u8 sgi;
> +	s8 rate_idx = -1;
>   	bool skip_auto_rate;
>   	struct rate_info txrate;
> +	enum nl80211_band band;
> +	struct ieee80211_supported_band *sband;
>   
>   	lockdep_assert_held(&ar->data_lock);
>   
> @@ -3475,7 +3463,7 @@ ath10k_update_per_peer_tx_stats(struct ath10k *ar,
>   		return;
>   
>   	if (txrate.flags == WMI_RATE_PREAMBLE_VHT && txrate.mcs > 9) {
> -		ath10k_warn(ar, "Invalid VHT mcs %hhd peer stats",  txrate.mcs);
> +		ath10k_warn(ar, "Invalid VHT mcs %hhd peer stats", txrate.mcs);
>   		return;
>   	}
>   
> @@ -3490,14 +3478,19 @@ ath10k_update_per_peer_tx_stats(struct ath10k *ar,
>   	memset(&arsta->tx_info.status, 0, sizeof(arsta->tx_info.status));
>   	if (txrate.flags == WMI_RATE_PREAMBLE_CCK ||
>   	    txrate.flags == WMI_RATE_PREAMBLE_OFDM) {
> -		rate = ATH10K_HW_LEGACY_RATE(peer_stats->ratecode);
> -		/* This is hacky, FW sends CCK rate 5.5Mbps as 6 */
> -		if (rate == 6 && txrate.flags == WMI_RATE_PREAMBLE_CCK)
> -			rate = 5;
> -		rate_idx = ath10k_get_legacy_rate_idx(ar, rate);
> -		if (rate_idx < 0)
> +		if (!arsta->arvif || !arsta->arvif->vif)
> +			return;
> +
> +		conf = rcu_dereference(arsta->arvif->vif->chanctx_conf);
> +		if (!conf)
> +			return;
> +
> +		band = conf->def.chan->band;
> +		sband = &ar->mac.sbands[band];
> +		if (ath10k_wmi_get_legacy_rate(ar, sband, peer_stats->ratecode,
> +					       &arsta->txrate.legacy,
> +					       &rate_idx))

Using wmi ops to parse rate info breaks ath10k driver architecture, 
since the rate info comes from htt layer and nothing related to wmi.


Thanks,

Peter


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
