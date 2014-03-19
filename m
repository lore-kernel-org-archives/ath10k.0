Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQJ0e-00089H-QA
 for ath10k@lists.infradead.org; Wed, 19 Mar 2014 16:06:29 +0000
Message-ID: <5329C069.7010604@candelatech.com>
Date: Wed, 19 Mar 2014 09:06:01 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFC] ath10k: fix rssi and rate reporting
References: <1395237135-18159-1-git-send-email-janusz.dziedzic@tieto.com>
In-Reply-To: <1395237135-18159-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 03/19/2014 06:52 AM, Janusz Dziedzic wrote:
> RSSI and RATE fields are valid only when
> START_VALID bit is set.
> So, in current implementation we have to remember
> rssi and rates we have when START_VALID and report
> the same also when END_VALID bit is set.
> 
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
> ---
>  drivers/net/wireless/ath/ath10k/htt.h    |    3 +++
>  drivers/net/wireless/ath/ath10k/htt_rx.c |   41 +++++++++++++++---------------
>  2 files changed, 24 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
> index 870f807..bd3e537 100644
> --- a/drivers/net/wireless/ath/ath10k/htt.h
> +++ b/drivers/net/wireless/ath/ath10k/htt.h
> @@ -1278,6 +1278,9 @@ struct ath10k_htt {
>  	struct tasklet_struct txrx_compl_task;
>  	struct sk_buff_head tx_compl_q;
>  	struct sk_buff_head rx_compl_q;
> +
> +	/* rx_info template */
> +	struct htt_rx_info rx_info;
>  };
>  
>  #define RX_HTT_HDR_STATUS_LEN 64
> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> index 665a256..6e33475 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -1128,7 +1128,6 @@ static bool ath10k_htt_rx_amsdu_allowed(struct ath10k_htt *htt,
>  static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
>  				  struct htt_rx_indication *rx)
>  {
> -	struct htt_rx_info info;
>  	struct htt_rx_indication_mpdu_range *mpdu_ranges;
>  	struct htt_rx_desc *rxd;
>  	enum htt_rx_mpdu_status status;
> @@ -1143,7 +1142,6 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
>  
>  	lockdep_assert_held(&htt->rx_ring.lock);
>  
> -	memset(&info, 0, sizeof(info));
>  
>  	fw_desc_len = __le16_to_cpu(rx->prefix.fw_rx_desc_bytes);
>  	fw_desc = (u8 *)&rx->fw_desc;
> @@ -1153,24 +1151,27 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
>  	mpdu_ranges = htt_rx_ind_get_mpdu_ranges(rx);
>  
>  	/* Fill this once, while this is per-ppdu */
> -	info.rx_status.signal  = ATH10K_DEFAULT_NOISE_FLOOR;
> -	info.rx_status.signal += rx->ppdu.combined_rssi;
> +	if (rx->ppdu.info0 & HTT_RX_INDICATION_INFO0_START_VALID) {
> +		memset(&htt->rx_info, 0, sizeof(htt->rx_info));
> +		htt->rx_info.rx_status.signal  = ATH10K_DEFAULT_NOISE_FLOOR;
> +		htt->rx_info.rx_status.signal += rx->ppdu.combined_rssi;

Maybe do the above as:
                htt->rx_info.rx_status.signal = ATH10K_DEFAULT_NOISE_FLOOR
			+ rx->ppdu.combined_rssi;

?


Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
