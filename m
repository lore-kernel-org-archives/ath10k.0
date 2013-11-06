Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VdzpC-0001L5-Pf
 for ath10k@lists.infradead.org; Wed, 06 Nov 2013 09:54:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/3] ath10k: introduce DFS implementation
References: <1383048394-15256-1-git-send-email-marek.puzyniak@tieto.com>
 <1383048394-15256-2-git-send-email-marek.puzyniak@tieto.com>
Date: Wed, 6 Nov 2013 11:54:32 +0200
In-Reply-To: <1383048394-15256-2-git-send-email-marek.puzyniak@tieto.com>
 (Marek Puzyniak's message of "Tue, 29 Oct 2013 13:06:33 +0100")
Message-ID: <877gclua7b.fsf@kamboji.qca.qualcomm.com>
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
To: Marek Puzyniak <marek.puzyniak@tieto.com>
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Marek Puzyniak <marek.puzyniak@tieto.com> writes:

> Configure interface combination for AP running on channels
> where radar detection is required. It allows only one type
> of interface - AP on DFS channel and limits number of AP
> interfaces to 8. Setup WMI channel flags accordingly to mac
> channel configuration. CAC based on additional monitor vdev
> is started if required for current channel.
>
> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> +static const struct ieee80211_iface_limit ath10k_if_dfs_limits[] = {
> +	{
> +	.max	= 8,
> +	.types	= BIT(NL80211_IFTYPE_AP)
> +	},
> +};
> +
> +static const struct ieee80211_iface_combination ath10k_if_comb[] = {
> +	{
> +		.limits = ath10k_if_limits,
> +		.n_limits = ARRAY_SIZE(ath10k_if_limits),
> +		.max_interfaces = 8,
> +		.num_different_channels = 1,
> +		.beacon_int_infra_match = true,
> +	},
> +	{
> +		.limits = ath10k_if_dfs_limits,
> +		.n_limits = ARRAY_SIZE(ath10k_if_dfs_limits),
> +		.max_interfaces = 8,
> +		.num_different_channels = 1,
> +		.beacon_int_infra_match = true,
> +		.radar_detect_widths =	BIT(NL80211_CHAN_WIDTH_20_NOHT) |
> +					BIT(NL80211_CHAN_WIDTH_20) |
> +					BIT(NL80211_CHAN_WIDTH_40) |
> +					BIT(NL80211_CHAN_WIDTH_80),
> +	}
>  };
>  
>  static struct ieee80211_sta_vht_cap ath10k_create_vht_cap(struct ath10k *ar)
> @@ -3531,8 +3667,8 @@ int ath10k_mac_register(struct ath10k *ar)
>  	 */
>  	ar->hw->queues = 4;
>  
> -	ar->hw->wiphy->iface_combinations = &ath10k_if_comb;
> -	ar->hw->wiphy->n_iface_combinations = 1;
> +	ar->hw->wiphy->iface_combinations = ath10k_if_comb;
> +	ar->hw->wiphy->n_iface_combinations = ARRAY_SIZE(ath10k_if_comb);

If ATH10K_DFS_CERTIFIED is disabled should we still enable
radar_detect_widths? Doesn't that enable DFS even it should be disabled?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
