Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([52.28.52.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5uee-0002Aj-Lz
 for ath10k@lists.infradead.org; Fri, 28 Sep 2018 15:26:11 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: [RFC 2/2] ath10k: reporting estimated tx airtime for fairness
In-Reply-To: <1538008874-11692-2-git-send-email-rmanohar@codeaurora.org>
References: <1538008874-11692-1-git-send-email-rmanohar@codeaurora.org>
 <1538008874-11692-2-git-send-email-rmanohar@codeaurora.org>
Date: Fri, 28 Sep 2018 17:25:47 +0200
Message-ID: <87lg7lfxtw.fsf@toke.dk>
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>, ath10k@lists.infradead.org
Cc: Kan Yan <kyan@google.com>, linux-wireless@vger.kernel.org

Rajkumar Manoharan <rmanohar@codeaurora.org> writes:

> Transmit airtime will be estimated from last tx rate used.
> Firmware report tx rate by peer stats. Airtime is computed
> on tx path and the same will be reported to mac80211 upon
> tx completion.
>
> Signed-off-by: Kan Yan <kyan@google.com>
> Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/core.h   |  2 ++
>  drivers/net/wireless/ath/ath10k/htt_rx.c |  1 +
>  drivers/net/wireless/ath/ath10k/mac.c    | 58 ++++++++++++++++++++++++++++++--
>  drivers/net/wireless/ath/ath10k/txrx.c   |  4 +++
>  4 files changed, 62 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> index d3e20aaf8023..4bfc370bf659 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -123,6 +123,7 @@ struct ath10k_skb_cb {
>  	u8 flags;
>  	u8 eid;
>  	u16 msdu_id;
> +	u16 airtime_est;
>  	struct ieee80211_vif *vif;
>  	struct ieee80211_txq *txq;
>  } __packed;
> @@ -493,6 +494,7 @@ struct ath10k_sta {
>  	u32 smps;
>  	u16 peer_id;
>  	struct rate_info txrate;
> +	u32 last_tx_bitrate;
>  
>  	struct work_struct update_wk;
>  	u64 rx_duration;
> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> index f2aaa2f7a022..f1de9fc09d9f 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -2809,6 +2809,7 @@ static inline int ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
>  
>  	arsta->txrate.nss = txrate.nss;
>  	arsta->txrate.bw = ath10k_bw_to_mac80211_bw(txrate.bw);
> +	arsta->last_tx_bitrate = cfg80211_calculate_bitrate(&arsta->txrate);
>  
>  	if (ath10k_debug_is_extd_tx_stats_enabled(ar))
>  		ath10k_accumulate_per_peer_tx_stats(ar, arsta, peer_stats,
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index d4648b22ad64..a694dae6f024 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -3528,7 +3528,7 @@ static void ath10k_tx_h_add_p2p_noa_ie(struct ath10k *ar,
>  static void ath10k_mac_tx_h_fill_cb(struct ath10k *ar,
>  				    struct ieee80211_vif *vif,
>  				    struct ieee80211_txq *txq,
> -				    struct sk_buff *skb)
> +				    struct sk_buff *skb, u16 airtime)
>  {
>  	struct ieee80211_hdr *hdr = (void *)skb->data;
>  	struct ath10k_skb_cb *cb = ATH10K_SKB_CB(skb);
> @@ -3545,6 +3545,7 @@ static void ath10k_mac_tx_h_fill_cb(struct ath10k *ar,
>  
>  	cb->vif = vif;
>  	cb->txq = txq;
> +	cb->airtime_est = airtime;
>  }
>  
>  bool ath10k_mac_tx_frm_has_freq(struct ath10k *ar)
> @@ -3932,6 +3933,50 @@ static bool ath10k_mac_tx_can_push(struct ieee80211_hw *hw,
>  	return false;
>  }
>  
> +/* Return estimated airtime in microsecond, which is calculated using last
> + * reported TX rate. This is just a rough estimation because host driver has no
> + * knowledge of the actual transmit rate, retries or aggregation. If actual
> + * airtime can be reported by firmware, then delta between estimated and actual
> + * airtime can be adjusted from deficit.
> + */
> +#define IEEE80211_ATF_OVERHEAD		100	/* IFS + some slot time */
> +#define IEEE80211_ATF_OVERHEAD_IFS	16	/* IFS only */
> +static u16 ath10k_mac_update_airtime(struct ath10k *ar,
> +				     struct ieee80211_txq *txq,
> +				     struct sk_buff *skb)
> +{
> +	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
> +	struct ath10k_sta *arsta;
> +	u32 pktlen;
> +	u16 airtime = 0;
> +
> +	if (!txq || !txq->sta || !ieee80211_is_data(hdr->frame_control))
> +		return airtime;
> +
> +	spin_lock_bh(&ar->data_lock);
> +	arsta = (struct ath10k_sta *)txq->sta->drv_priv;
> +
> +	pktlen = skb->len + 38; /* Assume MAC header 30, SNAP 8 for most case */
> +	if (arsta->last_tx_bitrate) {
> +		/* airtime in us, last_tx_bitrate in 100kbps */
> +		airtime = (pktlen * 8 * (1000 / 100))
> +				/ arsta->last_tx_bitrate;
> +		/* overhead for media access time and IFS */
> +		airtime += IEEE80211_ATF_OVERHEAD_IFS;
> +	} else {
> +		/* This is mostly for throttle excessive BC/MC frames, and the
> +		 * airtime/rate doesn't need be exact. Airtime of BC/MC frames
> +		 * in 2G get some discount, which helps prevent very low rate
> +		 * frames from being blocked for too long.
> +		 */
> +		airtime = (pktlen * 8 * (1000 / 100)) / 60; /* 6M */
> +		airtime += IEEE80211_ATF_OVERHEAD;
> +	}
> +	spin_unlock_bh(&ar->data_lock);
> +
> +	return airtime;
> +}
> +
>  int ath10k_mac_tx_push_txq(struct ieee80211_hw *hw,
>  			   struct ieee80211_txq *txq)
>  {
> @@ -3947,6 +3992,7 @@ int ath10k_mac_tx_push_txq(struct ieee80211_hw *hw,
>  	size_t skb_len;
>  	bool is_mgmt, is_presp;
>  	int ret;
> +	u16 airtime;
>  
>  	spin_lock_bh(&ar->htt.tx_lock);
>  	ret = ath10k_htt_tx_inc_pending(htt);
> @@ -3964,7 +4010,8 @@ int ath10k_mac_tx_push_txq(struct ieee80211_hw *hw,
>  		return -ENOENT;
>  	}
>  
> -	ath10k_mac_tx_h_fill_cb(ar, vif, txq, skb);
> +	airtime = ath10k_mac_update_airtime(ar, txq, skb);
> +	ath10k_mac_tx_h_fill_cb(ar, vif, txq, skb, airtime);
>  
>  	skb_len = skb->len;
>  	txmode = ath10k_mac_tx_h_get_txmode(ar, vif, sta, skb);
> @@ -4230,8 +4277,10 @@ static void ath10k_mac_op_tx(struct ieee80211_hw *hw,
>  	bool is_mgmt;
>  	bool is_presp;
>  	int ret;
> +	u16 airtime;
>  
> -	ath10k_mac_tx_h_fill_cb(ar, vif, txq, skb);
> +	airtime = ath10k_mac_update_airtime(ar, txq, skb);
> +	ath10k_mac_tx_h_fill_cb(ar, vif, txq, skb, airtime);
>  
>  	txmode = ath10k_mac_tx_h_get_txmode(ar, vif, sta, skb);
>  	txpath = ath10k_mac_tx_h_get_txpath(ar, skb, txmode);
> @@ -8446,6 +8495,9 @@ int ath10k_mac_register(struct ath10k *ar)
>  		wiphy_ext_feature_set(ar->hw->wiphy,
>  				      NL80211_EXT_FEATURE_DATA_ACK_SIGNAL_SUPPORT);
>  
> +	if (ath10k_peer_stats_enabled(ar))
> +		wiphy_ext_feature_set(ar->hw->wiphy,
> +				      NL80211_EXT_FEATURE_AIRTIME_FAIRNESS);
>  	/*
>  	 * on LL hardware queues are managed entirely by the FW
>  	 * so we only advertise to mac we can do the queues thing
> diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
> index 23606b6972d0..8e7c416cd330 100644
> --- a/drivers/net/wireless/ath/ath10k/txrx.c
> +++ b/drivers/net/wireless/ath/ath10k/txrx.c
> @@ -95,6 +95,10 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
>  		wake_up(&htt->empty_tx_wq);
>  	spin_unlock_bh(&htt->tx_lock);
>  
> +	if (txq && txq->sta)
> +		ieee80211_sta_register_airtime(txq->sta, txq->tid,
> +					       skb_cb->airtime_est, 0);
> +

So this just uses the calculated airtime based on rate and size? Wasn't
there supposed to be an airtime usage value reported by the firmware? :)

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
