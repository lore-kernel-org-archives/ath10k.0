Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVMby-0000J3-W7
 for ath10k@lists.infradead.org; Tue, 10 Mar 2015 16:02:28 +0000
Message-ID: <54FF157C.7090208@candelatech.com>
Date: Tue, 10 Mar 2015 09:02:04 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: fix PMG by using AES-CMAC/IGTK software crypto
References: <1425994339-15864-1-git-send-email-bartosz.markowski@tieto.com>
In-Reply-To: <1425994339-15864-1-git-send-email-bartosz.markowski@tieto.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 03/10/2015 06:32 AM, Bartosz Markowski wrote:
> While testing with older supplicant, .drv_set_key() was failing due to
> higher than ath10k firmware could handle key_index (WMI_MAX_KEY_INDEX == 3).
> 
> --
> wpa_driver_nl80211_set_key: ifindex=15 alg=4 addr=0x7f02b129fbe3 key_idx=4 set_tx=0 seq_len=6 key_len=16
>     broadcast key
> nl80211: set_key failed; err=-22 Invalid argument)
> wlan0: WPA: Failed to configure IGTK to the driver
> wlan0: RSN: Failed to configure IGTK
> --
> 
> In order to fix this case (PMF: AES-CMAC/IGTK) force the AES_CMAC cipher to
> be handled by software.

How did you get firmware to allow the host to do the encryption?

Every time I've tried such a thing I end up with either nothing or garbage on
the air.

Or this this particular type of encryption treated differently by the
firmware?

Thanks,
Ben

> 
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 1138f4f8923f..5a3129010951 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -66,8 +66,8 @@ static int ath10k_send_key(struct ath10k_vif *arvif,
>  		arg.key_cipher = WMI_CIPHER_WEP;
>  		break;
>  	case WLAN_CIPHER_SUITE_AES_CMAC:
> -		/* this one needs to be done in software */
> -		return 1;
> +		WARN_ON(1);
> +		return -EINVAL;
>  	default:
>  		ath10k_warn(ar, "cipher %d is not supported\n", key->cipher);
>  		return -EOPNOTSUPP;
> @@ -3995,6 +3995,10 @@ static int ath10k_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
>  	int ret = 0;
>  	u32 flags = 0;
>  
> +	/* this one needs to be done in software */
> +	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC)
> +		return 1;
> +
>  	if (key->keyidx > WMI_MAX_KEY_INDEX)
>  		return -ENOSPC;
>  
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
