Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yd4pf-0001ZM-8r
 for ath10k@lists.infradead.org; Tue, 31 Mar 2015 22:40:28 +0000
Message-ID: <551B2243.2060609@candelatech.com>
Date: Tue, 31 Mar 2015 15:40:03 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFC] ath10k: IBSS allow to use RSN
References: <1426876523-5337-1-git-send-email-janusz.dziedzic@tieto.com>
In-Reply-To: <1426876523-5337-1-git-send-email-janusz.dziedzic@tieto.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: ath10k@lists.infradead.org

I tried this on my CT firmware, hacked into a 4.0 kernel,
but it does not work for me.

(I tried configuring WPA2 IBSS interfaces, but they cannot pass traffic).

Could still be something on my side though..I never managed to get
ath9k to do IBSS + WPA2 either, though haven't tried that again lately.

Thanks,
Ben


On 03/20/2015 11:35 AM, Janusz Dziedzic wrote:
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
> 
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 39c60f5..ebecfe9 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -6541,11 +6541,13 @@ int ath10k_mac_register(struct ath10k *ar)
>  			IEEE80211_HW_SPECTRUM_MGMT |
>  			IEEE80211_HW_SW_CRYPTO_CONTROL |
>  			IEEE80211_HW_CONNECTION_MONITOR |
> +			IEEE80211_HW_SUPPORTS_PER_STA_GTK |
>  			IEEE80211_HW_WANT_MONITOR_VIF |
>  			IEEE80211_HW_CHANCTX_STA_CSA |
>  			IEEE80211_HW_QUEUE_CONTROL;
>  
>  	ar->hw->wiphy->features |= NL80211_FEATURE_STATIC_SMPS;
> +	ar->hw->wiphy->flags |= WIPHY_FLAG_IBSS_RSN;
>  
>  	if (ar->ht_cap_info & WMI_HT_CAP_DYNAMIC_SMPS)
>  		ar->hw->wiphy->features |= NL80211_FEATURE_DYNAMIC_SMPS;
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
