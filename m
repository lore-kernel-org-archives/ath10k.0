Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W496Y-0008QP-6k
 for ath10k@lists.infradead.org; Fri, 17 Jan 2014 13:04:58 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: implement and use new beacon method
References: <1389287073-10939-1-git-send-email-marek.puzyniak@tieto.com>
Date: Fri, 17 Jan 2014 15:04:31 +0200
In-Reply-To: <1389287073-10939-1-git-send-email-marek.puzyniak@tieto.com>
 (Marek Puzyniak's message of "Thu, 9 Jan 2014 18:04:33 +0100")
Message-ID: <87ha92rc80.fsf@kamboji.qca.qualcomm.com>
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
To: Marek Puzyniak <marek.puzyniak@tieto.com>
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Marek Puzyniak <marek.puzyniak@tieto.com> writes:

> From: Michal Kazior <michal.kazior@tieto.com>
>
> Until now ath10k used a copy-by-value beacon
> submission.
>
> The new method passes a DMA address via WMI
> command only. This command contains additional
> metadata that fixes AP behaviour with regard
> to powersave buffering.
>
> This also fixes strange bug when multicast traffic
> would freeze TX indefinitely.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -61,6 +61,11 @@ struct ath10k_skb_cb {
>  		u8 frag_len;
>  		u8 pad_len;
>  	} __packed htt;
> +
> +	struct {
> +		bool dtim_zero;
> +		bool deliver_cab;
> +	} bcn;
>  } __packed;

I think we will run out of space in skb_cb soon and we will need to
start using bitflags. But this is ok for now.

>  static inline struct ath10k_skb_cb *ATH10K_SKB_CB(struct sk_buff *skb)
> @@ -222,6 +227,7 @@ struct ath10k_vif {
>  	u32 beacon_interval;
>  	u32 dtim_period;
>  	struct sk_buff *beacon;
> +	bool beacon_sent;

Please document how this is protected.

> @@ -3377,25 +3390,40 @@ int ath10k_wmi_peer_assoc(struct ath10k *ar,
>  	return ath10k_wmi_cmd_send(ar, skb, ar->wmi.cmd->peer_assoc_cmdid);
>  }
>  
> -int ath10k_wmi_beacon_send_nowait(struct ath10k *ar,
> -				  const struct wmi_bcn_tx_arg *arg)
> +/* This function assumes the beacon is already DMA mapped */
> +int ath10k_wmi_beacon_send_ref_nowait(struct ath10k *ar, u32 vdev_id,
> +				      struct sk_buff *beacon)

I think this would be cleaner:

ath10k_wmi_beacon_send_ref_nowait(struct ath10k_vif *arvif,
 			      struct sk_buff *beacon)

Or maybe even without the beacon parameter? We get it from arvif anyway.

> --- a/drivers/net/wireless/ath/ath10k/wmi.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
> @@ -3391,6 +3391,20 @@ struct wmi_bcn_tx_arg {
>  	const void *bcn;
>  };
>  
> +enum wmi_bcn_tx_ref_flags {
> +	WMI_BCN_TX_REF_FLAG_DTIM_ZERO = 0x1,
> +	WMI_BCN_TX_REF_FLAG_DELIVER_CAB = 0x2,
> +};
> +
> +struct wmi_bcn_tx_ref_cmd {
> +	__le32 vdev_id;
> +	__le32 data_len;
> +	__le32 data_ptr; /* dma pointer */
> +	__le32 msdu_id; /* id for host to track */
> +	__le32 frame_control;
> +	__le32 flags; /* WMI_BCN_TX_REF_FLAG_ */
> +} __packed;

Comments before the field, please. Like here:

struct wmi_resource_config_10x {
	/* number of virtual devices (VAPs) to support */
	__le32 num_vdevs;

	/* number of peer nodes to support */
	__le32 num_peers;

	/* number of keys per peer */
	__le32 num_peer_keys;

	/* total number of TX/RX data TIDs */
	__le32 num_tids;

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
