Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smail.rz.tu-ilmenau.de ([141.24.186.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjLOQ-0003v0-5k
 for ath10k@lists.infradead.org; Thu, 11 Jun 2020 11:29:11 +0000
Subject: Re: [PATCH] ath10k: enable advertising support for channels 32, 68
 and 98
References: <20200327093147.189390-1-robert.marko@sartura.hr>
From: Markus Theil <markus.theil@tu-ilmenau.de>
Message-ID: <1f5bab38-4c77-6858-ed02-f52c71ee11fe@tu-ilmenau.de>
Date: Thu, 11 Jun 2020 13:29:07 +0200
MIME-Version: 1.0
In-Reply-To: <20200327093147.189390-1-robert.marko@sartura.hr>
Content-Language: en-US
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
To: Robert Marko <robert.marko@sartura.hr>, ath10k@lists.infradead.org
Cc: Luka Perkov <luka.perkov@sartura.hr>

On 3/27/20 10:31 AM, Robert Marko wrote:
> Enable advertising support for 5G channels: 32, 68 and 96.
> These channels are legal and available for use in ETSI countries.
> So lets advertise these and they will be available in accordance with the regulatory domain used.
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> ---
>  drivers/net/wireless/ath/ath10k/core.h | 2 +-
>  drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> index 5101bf2b5b15..480efaa1278c 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -37,7 +37,7 @@
>  #define WMI_READY_TIMEOUT (5 * HZ)
>  #define ATH10K_FLUSH_TIMEOUT_HZ (5 * HZ)
>  #define ATH10K_CONNECTION_LOSS_HZ (3 * HZ)
> -#define ATH10K_NUM_CHANS 41
> +#define ATH10K_NUM_CHANS 44
>  #define ATH10K_MAX_5G_CHAN 173
>  
>  /* Antenna noise floor */
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 7fee35ff966b..f98422427b27 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -8363,6 +8363,7 @@ static const struct ieee80211_channel ath10k_2ghz_channels[] = {
>  };
>  
>  static const struct ieee80211_channel ath10k_5ghz_channels[] = {
> +	CHAN5G(32, 5160, 0),
>  	CHAN5G(36, 5180, 0),
>  	CHAN5G(40, 5200, 0),
>  	CHAN5G(44, 5220, 0),
> @@ -8371,6 +8372,8 @@ static const struct ieee80211_channel ath10k_5ghz_channels[] = {
>  	CHAN5G(56, 5280, 0),
>  	CHAN5G(60, 5300, 0),
>  	CHAN5G(64, 5320, 0),
> +	CHAN5G(68, 5340, 0),
> +	CHAN5G(96, 5480, 0),
>  	CHAN5G(100, 5500, 0),
>  	CHAN5G(104, 5520, 0),
>  	CHAN5G(108, 5540, 0),

Hi, your patch is incomplete. Mgmt frames cannot be received on channel 32, because of the following lines in wmi.c:

	/* Hardware can Rx CCK rates on 5GHz. In that case phy_mode is set to
	 * MODE_11B. This means phy_mode is not a reliable source for the band
	 * of mgmt rx.
	 */
	if (channel >= 1 && channel <= 14) {
		status->band = NL80211_BAND_2GHZ;
	} else if (channel >= 36 && channel <= ATH10K_MAX_5G_CHAN) {
		status->band = NL80211_BAND_5GHZ;
	} else {
		/* Shouldn't happen unless list of advertised channels to
		 * mac80211 has been changed.
		 */
		WARN_ON_ONCE(1);
		dev_kfree_skb(skb);
		return 0;
	}

Have you tested this patch?

Markus


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
