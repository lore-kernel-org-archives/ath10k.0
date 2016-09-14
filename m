Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkBKM-0001N2-Ft
 for ath10k@lists.infradead.org; Wed, 14 Sep 2016 14:38:19 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 19/21] ath10k: Enable adhoc mode for CT firmware.
Date: Wed, 14 Sep 2016 14:37:42 +0000
Message-ID: <877faeeedm.fsf@kamboji.qca.qualcomm.com>
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
 <1462986153-16318-20-git-send-email-greearb@candelatech.com>
In-Reply-To: <1462986153-16318-20-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 11 May 2016 10:02:31	-0700")
Content-Language: en-US
Content-ID: <91C08870E15CBB4AAF021D0B90B4AD54@qualcomm.com>
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
To: "greearb@candelatech.com" <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> CT firmware can support IBSS mode, so allow users to configure this.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index f1bfb3a..3fc9006 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -7482,6 +7482,10 @@ static const struct ieee80211_iface_limit ath10k_10x_ct_if_limits[] = {
>  	.max	= 7,
>  	.types	= BIT(NL80211_IFTYPE_AP)
>  	},
> +	{
> +	.max	= 1,
> +	.types	= BIT(NL80211_IFTYPE_ADHOC)
> +	},
>  };
>  
>  static const struct ieee80211_iface_combination ath10k_if_comb[] = {
> @@ -7862,6 +7866,7 @@ int ath10k_mac_register(struct ath10k *ar)
>  			ar->hw->wiphy->iface_combinations = ath10k_10x_ct_if_comb;
>  			ar->hw->wiphy->n_iface_combinations =
>  				ARRAY_SIZE(ath10k_10x_ct_if_comb);
> +			ar->hw->wiphy->interface_modes |= BIT(NL80211_IFTYPE_ADHOC);
>  		} else {
>  			ar->hw->wiphy->iface_combinations = ath10k_10x_if_comb;
>  			ar->hw->wiphy->n_iface_combinations =

There should a feature flag ATH10K_FW_FEATURE_SUPPORTS_ADHOC and we use
that flag as an indication to enable the mode. I wish we had done that
from the beginning, using wmi_op_version to guess that just creates
problems :(

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
