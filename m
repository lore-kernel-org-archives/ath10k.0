Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kadQi-0000Dc-H8
 for ath10k@lists.infradead.org; Thu, 05 Nov 2020 11:27:49 +0000
MIME-Version: 1.0
Date: Thu, 05 Nov 2020 19:27:46 +0800
From: Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [RFC 2/2] ath10k: allow dynamic SAR power limits via common API
In-Reply-To: <20201104231128.GA3212577@google.com>
References: <1600753775-4745-1-git-send-email-cjhuang@codeaurora.org>
 <1600753775-4745-2-git-send-email-cjhuang@codeaurora.org>
 <20201104231128.GA3212577@google.com>
Message-ID: <6563d6ac38368de40cd07ae36f230a86@codeaurora.org>
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
To: Brian Norris <briannorris@chromium.org>
Cc: linux-wireless@vger.kernel.org, dianders@chromium.org, ath10k@lists.infradead.org, kuabhs@google.com

On 2020-11-05 07:11, Brian Norris wrote:
> Hi,
> 
> On Tue, Sep 22, 2020 at 01:49:35PM +0800, Carl Huang wrote:
>> ath10k assigns ath10k_mac_set_sar_specs to ath10k_ops, and
>> this function is called when user space application calls
>> NL80211_CMD_SET_SAR_SPECS. ath10k also registers SAR type,
>> and supported frequency ranges to wiphy so user space can
>> query SAR capabilities.
>> 
>> ath10k_mac_set_sar_specs further sets the power to firmware
>> to limit the TX power.
>> 
>> This feature is controlled by hw parameter: dynamic_sar_support.
>> 
>> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
>> ---
> 
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c 
>> b/drivers/net/wireless/ath/ath10k/mac.c
>> index 2e3eb5b..830c61f 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -81,6 +81,17 @@ static struct ieee80211_rate ath10k_rates_rev2[] = 
>> {
>>  	{ .bitrate = 540, .hw_value = ATH10K_HW_RATE_OFDM_54M },
>>  };
>> 
>> +static const struct cfg80211_sar_freq_ranges ath10k_sar_freq_ranges[] 
>> = {
>> +	{ .index = 0, .start_freq = 2412000, .end_freq = 2484000 },
> 
> 2412 MHz is a center frequency, but other parts of the nl80211 API use
> band edges. For example:
> 
>  * @NL80211_ATTR_FREQ_RANGE_START: starting frequencry for the 
> regulatory
>  *      rule in KHz. This is not a center of frequency but an actual 
> regulatory
>  *      band edge.
>  * @NL80211_ATTR_FREQ_RANGE_END: ending frequency for the regulatory 
> rule
>  *      in KHz. This is not a center a frequency but an actual 
> regulatory
>  *      band edge.
> 
> Seems like we should improve the nl80211.h docs (patch 1) and make 
> these
> edges (this patch).
> 
>> +	{ .index = 1, .start_freq = 2484000, .end_freq = 5865000 },
>> +};
>> +
>> +static const struct cfg80211_sar_capa ath10k_sar_capa = {
>> +	.type = NL80211_SAR_TYPE_POWER,
>> +	.num_freq_ranges = (ARRAY_SIZE(ath10k_sar_freq_ranges)),
>> +	.freq_ranges = &ath10k_sar_freq_ranges[0],
>> +};
>> +
>>  #define ATH10K_MAC_FIRST_OFDM_RATE_IDX 4
>> 
>>  #define ath10k_a_rates (ath10k_rates + 
>> ATH10K_MAC_FIRST_OFDM_RATE_IDX)
>> @@ -2880,6 +2891,95 @@ static int ath10k_mac_vif_recalc_txbf(struct 
>> ath10k *ar,
>>  	return 0;
>>  }
>> 
>> +static bool ath10k_mac_is_connected(struct ath10k *ar)
>> +{
>> +	struct ath10k_vif *arvif;
>> +
>> +	list_for_each_entry(arvif, &ar->arvifs, list) {
>> +		if (arvif->is_up && arvif->vdev_type == WMI_VDEV_TYPE_STA)
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +int ath10k_mac_set_sar_power(struct ath10k *ar)
> 
> This function should be static.
> 
Right.

>> +{
>> +	int ret;
>> +
>> +	if (!ar->hw_params.dynamic_sar_support)
>> +		return 0;
> 
> return -EOPNOTSUPP ?
> 
sure

>> +
>> +	if (ar->tx_power_2g_limit == 0 || ar->tx_power_5g_limit == 0)
> 
> ath10k_mac_txpower_recalc() doesn't care about this -- why should you?
> This also seems especially weird, because one of the 2 could be valid
> nonzero values, and yet you're silently rejecting it. Regardless, the
> following seems wrong:
> 
Per current design, it's required for userspace to always set meaningful
power limitations.

Now in V2, 0 will be treated as "don't have SAR on this range".


>> +		return 0;
> 
> This should probably be an error.
> 
>> +
>> +	if (!ath10k_mac_is_connected(ar))
>> +		return 0;
> 
> Note to self (since this wasn't obvious to me the first read-through):
> you're calling this function from ath10k_bss_assoc() too, so even if 
> you
> weren't connected the first time around, it'll get called later.
> 
>> +
>> +	ret = ath10k_wmi_pdev_set_param(ar,
>> +					ar->wmi.pdev_param->txpower_limit2g,
>> +					ar->tx_power_2g_limit);
>> +	if (ret) {
>> +		ath10k_warn(ar, "failed to set 2.4G txpower %d: %d\n",
>> +			    ar->tx_power_2g_limit, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = ath10k_wmi_pdev_set_param(ar,
>> +					ar->wmi.pdev_param->txpower_limit5g,
>> +					ar->tx_power_5g_limit);
>> +	if (ret) {
>> +		ath10k_warn(ar, "failed to set 5G txpower %d: %d\n",
>> +			    ar->tx_power_5g_limit, ret);
>> +		return ret;
>> +	}
> 
> Hmm, so these are the same params configured by
> ath10k_mac_txpower_recalc(), except that we're not taking into account
> the limitations in ath10k_mac_txpower_recalc() (and vice versa) -- 
> isn't
> that bad? Should we be merging the SAR limitation into
> ath10k_mac_txpower_recalc() and calling that instead?
> 
Good suggestions.

> Brian
> 
>> +
>> +	ath10k_dbg(ar, ATH10K_DBG_MAC, "set txpower 2G:%d, 5G:%d 
>> successfully\n",
>> +		   ar->tx_power_2g_limit, ar->tx_power_5g_limit);
>> +
>> +	return ret;
>> +}
>> +

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
