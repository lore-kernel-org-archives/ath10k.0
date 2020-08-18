Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7yWu-0001WQ-Oo
 for ath10k@lists.infradead.org; Tue, 18 Aug 2020 10:07:47 +0000
MIME-Version: 1.0
Date: Tue, 18 Aug 2020 15:36:38 +0530
From: Tamizh Chelvam <tamizhr@codeaurora.org>
Subject: Re: [PATCHv2 3/4] ath10k: Add new api to support TID specific
 configuration
In-Reply-To: <20200817141934.733A0C433CB@smtp.codeaurora.org>
References: <1593875614-5683-4-git-send-email-tamizhr@codeaurora.org>
 <20200817141934.733A0C433CB@smtp.codeaurora.org>
Message-ID: <942a13405902460498184ef799f30581@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi Kalle,

> 
>> This patch add ops for set_tid_config to support TID
>> specific configuration. Station specific TID configuration
>> will have more priority than vif specific TID configuration.
>> WMI_SERVICE_PEER_TID_CONFIGS_SUPPORT service flag introduced
>> to notify host for TID config support. And RTS_CTS extended tid
>> configuration support advertised through the service flag
>> WMI_10_4_SERVICE_EXT_PEER_TID_CONFIGS_SUPPORT.
>> 
>> TID specific noack configuration requires
>> aggregation should be disabled and rate for the data TID packets
>> should be basic rates. So, if the TID already configured
>> with noack policy then driver will ignore the aggregation
>> or TX rate related configuration for the same data TID.
>> 
>> In TX rate configuration should be applied with highest
>> preamble configuration(HT rates should not be applied
>> for the station which supports vht rates).
>> 
>> Tested-on: QCA9984 hw1.0 PCI 10.4-3.9.0.2-00021
>> 
>> Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> 
> There few checkpatch warnings which I fixed and also I did some 
> whitespace
> changes to improve readability. Others were trivial but please check 
> carefully
> this change and let me know if it's ok:
> 
Thanks for the cleanup. Change looks good to me.

> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -7089,6 +7089,7 @@ static void ath10k_sta_tid_cfg_wk(struct 
> work_struct *wk)
>         bool config_apply;
>         int ret, i;
>         u32 changed;
> +       u8 nss;
> 
>         arsta = container_of(wk, struct ath10k_sta, tid_config_wk);
>         sta = container_of((void *)arsta, struct ieee80211_sta, 
> drv_priv);
> @@ -7138,9 +7139,12 @@ static void ath10k_sta_tid_cfg_wk(struct 
> work_struct *wk)
> 
>                 if (changed & (BIT(NL80211_TID_CONFIG_ATTR_TX_RATE) |
>                     BIT(NL80211_TID_CONFIG_ATTR_TX_RATE_TYPE))) {
> -                       if (arvif->rate_ctrl[i] >
> WMI_TID_CONFIG_RATE_CONTROL_AUTO &&
> -                           ath10k_mac_validate_rate_mask(ar, sta,
> arvif->rate_code[i],
> -
> ATH10K_HW_NSS(arvif->rate_code[i]))) {
> +                       nss = ATH10K_HW_NSS(arvif->rate_code[i]);
> +                       ret = ath10k_mac_validate_rate_mask(ar, sta,
> +                                                           
> arvif->rate_code[i],
> +                                                           nss);
> +                       if (ret &&
> +                           arvif->rate_ctrl[i] >
> WMI_TID_CONFIG_RATE_CONTROL_AUTO) {
>                                 arg.rate_ctrl = 0;
>                                 arg.rcode_flags = 0;
>                         }

Tamizh.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
