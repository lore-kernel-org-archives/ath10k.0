Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCzce-00037N-P3
 for ath10k@lists.infradead.org; Wed, 25 Sep 2019 05:13:54 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: Enable support for beacon interval per VAP
References: <1550579046-22649-1-git-send-email-dundi@codeaurora.org>
Date: Wed, 25 Sep 2019 08:13:47 +0300
In-Reply-To: <1550579046-22649-1-git-send-email-dundi@codeaurora.org> (Dundi
 Raviteja's message of "Tue, 19 Feb 2019 17:54:06 +0530")
Message-ID: <87pnjp3qlw.fsf@codeaurora.org>
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
To: Dundi Raviteja <dundi@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Dundi Raviteja <dundi@codeaurora.org> writes:

> Enable support to configure different beacon interval per VAP.
>
> To support this feature, map different beacon interval service bit
> to wmi tlv service.
>
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
>
> Signed-off-by: Dundi Raviteja <dundi@codeaurora.org>

[...]

> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -8232,6 +8232,30 @@ void ath10k_mac_destroy(struct ath10k *ar)
>  	},
>  };
>  
> +static struct
> +ieee80211_iface_combination ath10k_tlv_qcs_bcn_int_if_comb[] = {
> +	{
> +		.limits = ath10k_tlv_if_limit,
> +		.num_different_channels = 1,
> +		.max_interfaces = 4,
> +		.beacon_int_infra_match = true,
> +		.beacon_int_min_gcd = 1,
> +		.n_limits = ARRAY_SIZE(ath10k_tlv_if_limit),
> +	},
> +	{
> +		.limits = ath10k_tlv_qcs_if_limit,
> +		.num_different_channels = 2,
> +		.max_interfaces = 4,
> +		.n_limits = ARRAY_SIZE(ath10k_tlv_qcs_if_limit),
> +	},
> +	{
> +		.limits = ath10k_tlv_if_limit_ibss,
> +		.num_different_channels = 1,
> +		.max_interfaces = 2,
> +		.n_limits = ARRAY_SIZE(ath10k_tlv_if_limit_ibss),
> +	},
> +};
> +
>  static const struct ieee80211_iface_limit ath10k_10_4_if_limits[] = {
>  	{
>  		.max = 1,
> @@ -8642,6 +8666,15 @@ int ath10k_mac_register(struct ath10k *ar)
>  				ath10k_tlv_qcs_if_comb;
>  			ar->hw->wiphy->n_iface_combinations =
>  				ARRAY_SIZE(ath10k_tlv_qcs_if_comb);
> +
> +			if (test_bit
> +			    (WMI_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT,
> +			    ar->wmi.svc_map)) {
> +				ar->hw->wiphy->iface_combinations =
> +						ath10k_tlv_qcs_bcn_int_if_comb;
> +				ar->hw->wiphy->n_iface_combinations =
> +				     ARRAY_SIZE(ath10k_tlv_qcs_bcn_int_if_comb);
> +			}

I don't like using WMI service flags to advertise different interface
combinations, it makes ath10k code convoluted. A much better approach is
to use WMI_SERVICE_IFACE_COMBINATION_SUPPORT:

ath10k:New interface to get interface combinations from FW

https://patchwork.kernel.org/patch/11027361/

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
