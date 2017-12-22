Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSPJA-0007md-UG
 for ath10k@lists.infradead.org; Fri, 22 Dec 2017 15:32:26 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v3 06/11] ath10k: htt: High latency RX support
Date: Fri, 22 Dec 2017 15:32:09 +0000
Message-ID: <87k1xeaidi.fsf@kamboji.qca.qualcomm.com>
References: <20170917194013.8658-1-erik.stromdahl@gmail.com>
 <20170917194013.8658-7-erik.stromdahl@gmail.com>
In-Reply-To: <20170917194013.8658-7-erik.stromdahl@gmail.com> (Erik
 Stromdahl's message of "Sun, 17 Sep 2017 21:40:08 +0200")
Content-Language: en-US
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> Special HTT RX handling for high latency interfaces.
>
> Since no DMA physical addresses are used in the RX ring
> config message (this is not supported by the high latency
> devices), no RX ring is allocated.
> All RX skb's are allocated by the driver and passed directly
> to mac80211 in the HTT RX indication handler.
>
> A nice side effect of this is that no huge buffer will be
> allocated with dma_alloc_coherent. On embedded systems with
> limited memory resources, the allocation of the RX ring is
> prone to fail.
>
> Some tweaks made to "make it work":
>
> Removal of protected bit in 802.11 header frame control field.
> The chipset seems to do hw decryption but the frame_control
> protected bit is still set.
>
> This is necessary for mac80211 not to drop the frame.
>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c    |  27 ++++---
>  drivers/net/wireless/ath/ath10k/htt.h     |  47 ++++++++++++
>  drivers/net/wireless/ath/ath10k/htt_rx.c  | 119 +++++++++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath10k/rx_desc.h |  15 ++++
>  4 files changed, 195 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index c21227a74996..1880570989ae 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2083,10 +2083,12 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
>  	ar->htt.rx_ring.in_ord_rx = !!(test_bit(WMI_SERVICE_RX_FULL_REORDER,
>  						ar->wmi.svc_map));
>  
> -	status = ath10k_htt_rx_alloc(&ar->htt);
> -	if (status) {
> -		ath10k_err(ar, "failed to alloc htt rx: %d\n", status);
> -		goto err_htt_tx_detach;
> +	if (!ar->is_high_latency) {
> +		status = ath10k_htt_rx_alloc(&ar->htt);
> +		if (status) {
> +			ath10k_err(ar, "failed to alloc htt rx: %d\n", status);
> +			goto err_htt_tx_detach;
> +		}
>  	}

Wouldn't it be cleaner code to have the is_high_latency check within
ath10k_htt_rx_alloc() call?

> @@ -2203,10 +2205,13 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
>  		}
>  	}
>  
> -	status = ath10k_htt_rx_ring_refill(ar);
> -	if (status) {
> -		ath10k_err(ar, "failed to refill htt rx ring: %d\n", status);
> -		goto err_hif_stop;
> +	if (!ar->is_high_latency) {
> +		status = ath10k_htt_rx_ring_refill(ar);
> +		if (status) {
> +			ath10k_err(ar, "failed to refill htt rx ring: %d\n",
> +				   status);
> +			goto err_hif_stop;
> +		}
>  	}

Ditto.

> @@ -2235,7 +2240,8 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
>  err_hif_stop:
>  	ath10k_hif_stop(ar);
>  err_htt_rx_detach:
> -	ath10k_htt_rx_free(&ar->htt);
> +	if (!ar->is_high_latency)
> +		ath10k_htt_rx_free(&ar->htt);
>  err_htt_tx_detach:
>  	ath10k_htt_tx_free(&ar->htt);
>  err_wmi_detach:

Ditto.

> @@ -2280,7 +2286,8 @@ void ath10k_core_stop(struct ath10k *ar)
>  
>  	ath10k_hif_stop(ar);
>  	ath10k_htt_tx_stop(&ar->htt);
> -	ath10k_htt_rx_free(&ar->htt);
> +	if (!ar->is_high_latency)
> +		ath10k_htt_rx_free(&ar->htt);
>  	ath10k_wmi_detach(ar);
>  	ar->is_started = false;
>  }

Ditto.

> +	/* Not entirely sure about this, but all frames from the chipset has
> +	 * the protected flag set even though they have already been decrypted.
> +	 * Unmasking this flag is necessary in order for mac80211 not to drop
> +	 * the frame.
> +	 * TODO: Verify this is always the case or find out a way to check
> +	 * if there has been hw decryption.
> +	 */
> +	if (ieee80211_has_protected(hdr->frame_control)) {
> +		hdr->frame_control &= ~__cpu_to_le16(IEEE80211_FCTL_PROTECTED);
> +		rx_status->flag |= RX_FLAG_DECRYPTED |
> +				   RX_FLAG_IV_STRIPPED |
> +				   RX_FLAG_MMIC_STRIPPED;
> +	}
> +
> +	local_bh_disable();
> +	ieee80211_rx(ar->hw, skb);
> +	local_bh_enable();

ieee80211_rx_ni()?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
