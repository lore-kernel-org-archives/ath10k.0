Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XlkCx-0005jT-KS
 for ath10k@lists.infradead.org; Tue, 04 Nov 2014 19:56:04 +0000
Message-ID: <54592F3E.10204@candelatech.com>
Date: Tue, 04 Nov 2014 11:55:42 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 06/10] ath10k: use configured nss instead of max nss.
References: <1411507045-18973-1-git-send-email-greearb@candelatech.com>
 <1411507045-18973-6-git-send-email-greearb@candelatech.com>
In-Reply-To: <1411507045-18973-6-git-send-email-greearb@candelatech.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 09/23/2014 02:17 PM, greearb@candelatech.com wrote:
> From: Ben Greear <greearb@candelatech.com>
> 
> When re-associating a station, the nss was set back to
> maximum value even if user had configured small number
> of tx chains.  So, pay attention to user's config in
> this case as well.

Looks like this (and probably the related patch) did not make
it upstream yet.

Is someone waiting for more changes from me or did this just
get lost?

Thanks,
Ben

> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
> 
> v2:  No changes from v1.
> 
>  drivers/net/wireless/ath/ath10k/mac.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index e75607d..34ec992 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -4114,6 +4114,10 @@ ath10k_default_bitrate_mask(struct ath10k *ar,
>  	u32 legacy = 0x00ff;
>  	u8 ht = 0xff, i;
>  	u16 vht = 0x3ff;
> +	u16 nrf = ar->num_rf_chains;
> +
> +	if (ar->cfg_tx_chainmask)
> +		nrf = get_nss_from_chainmask(ar->cfg_tx_chainmask);
>  
>  	switch (band) {
>  	case IEEE80211_BAND_2GHZ:
> @@ -4129,11 +4133,11 @@ ath10k_default_bitrate_mask(struct ath10k *ar,
>  	if (mask->control[band].legacy != legacy)
>  		return false;
>  
> -	for (i = 0; i < ar->num_rf_chains; i++)
> +	for (i = 0; i < nrf; i++)
>  		if (mask->control[band].ht_mcs[i] != ht)
>  			return false;
>  
> -	for (i = 0; i < ar->num_rf_chains; i++)
> +	for (i = 0; i < nrf; i++)
>  		if (mask->control[band].vht_mcs[i] != vht)
>  			return false;
>  
> @@ -4384,6 +4388,9 @@ static int ath10k_set_bitrate_mask(struct ieee80211_hw *hw,
>  	u8 fixed_nss = ar->num_rf_chains;
>  	u8 force_sgi;
>  
> +	if (ar->cfg_tx_chainmask)
> +		fixed_nss = get_nss_from_chainmask(ar->cfg_tx_chainmask);
> +
>  	force_sgi = mask->control[band].gi;
>  	if (force_sgi == NL80211_TXRATE_FORCE_LGI)
>  		return -EINVAL;
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
