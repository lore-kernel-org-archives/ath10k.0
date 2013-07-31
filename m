Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4PqL-0004Fj-77
 for ath10k@lists.infradead.org; Wed, 31 Jul 2013 06:25:06 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: implement get_survey()
References: <1374750412-5513-1-git-send-email-michal.kazior@tieto.com>
 <1375081712-9697-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 31 Jul 2013 09:24:30 +0300
In-Reply-To: <1375081712-9697-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 29 Jul 2013 09:08:32 +0200")
Message-ID: <871u6fs0v5.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This implements a limited subset of what can be
> reported in the survey dump.
>
> This can be used for assessing approximate channel
> load, e.g. for automatic channel selection.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> @@ -374,6 +375,11 @@ struct ath10k {
>  
>  	struct work_struct restart_work;
>  
> +	/* cycle count is reported twice for each visited channel during scan */
> +	u32 survey_last_rx_clear_count;
> +	u32 survey_last_cycle_count;
> +	struct survey_info survey[ATH10K_NUM_CHANS];

Please document the locking. Apparently survey is protected with
data_lock?


[...]

>  static void ath10k_wmi_event_chan_info(struct ath10k *ar, struct sk_buff *skb)
>  {
> -	ath10k_dbg(ATH10K_DBG_WMI, "WMI_CHAN_INFO_EVENTID\n");
> +	struct wmi_chan_info_event *ev;
> +	int idx;
> +
> +	spin_lock_bh(&ar->data_lock);
> +
> +	ev = (struct wmi_chan_info_event *)skb->data;
> +	ath10k_dbg(ATH10K_DBG_WMI,
> +		   "chan info: err_code:%d freq:%d cmd_flags:%d noise_floor:%d rx_clear_count:%d cycle_count:%d\n",
> +		   __le32_to_cpu(ev->err_code),
> +		   __le32_to_cpu(ev->freq),
> +		   __le32_to_cpu(ev->cmd_flags),
> +		   __le32_to_cpu(ev->noise_floor),
> +		   __le32_to_cpu(ev->rx_clear_count),
> +		   __le32_to_cpu(ev->cycle_count));

"wmi event chan info err_code %d freq %d cmd_flags %d noise_floor %d rx_clear_count %d cycle_count %d\n"

> +	if (!ar->scan.in_progress) {
> +		ath10k_warn("chan info event without a scan request?\n");
> +		goto exit;
> +	}
> +
> +	if (__le32_to_cpu(ev->cmd_flags) & WMI_CHAN_INFO_FLAG_COMPLETE) {
> +		idx = freq_to_idx(ar, __le32_to_cpu(ev->freq));
> +		if (idx >= ARRAY_SIZE(ar->survey)) {
> +			ath10k_warn("chan info: invalid frequency %d (idx %d out of bounds)\n",
> +				    __le32_to_cpu(ev->freq), idx);

I think we should just bail out if this happens.

> +		} else {
> +			/* During scanning chan info is reported twice for each
> +			 * visited channel. The reported cycle count is global
> +			 * and per-channel cycle count must be calculated */
> +
> +			ar->survey[idx].channel_time = WMI_CHAN_INFO_MSEC(
> +					__le32_to_cpu(ev->cycle_count) -
> +					ar->survey_last_cycle_count);
> +			ar->survey[idx].channel_time_rx = WMI_CHAN_INFO_MSEC(
> +					__le32_to_cpu(ev->rx_clear_count) -
> +					ar->survey_last_rx_clear_count);
> +			ar->survey[idx].noise = __le32_to_cpu(ev->noise_floor);
> +			ar->survey[idx].filled = SURVEY_INFO_CHANNEL_TIME |
> +						 SURVEY_INFO_CHANNEL_TIME_RX |
> +						 SURVEY_INFO_NOISE_DBM;
> +		}

...and then there's no reason to use else branch here. Also you can add
temporary variables time and time_rx to make clean up the indentation.

> +	}
> +
> +	ar->survey_last_rx_clear_count = __le32_to_cpu(ev->rx_clear_count);
> +	ar->survey_last_cycle_count = __le32_to_cpu(ev->cycle_count);
> +
> +exit:
> +	spin_unlock_bh(&ar->data_lock);
>  }
>  
>  static void ath10k_wmi_event_echo(struct ath10k *ar, struct sk_buff *skb)
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
> index da3b2bc..4acff47 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
> @@ -2931,6 +2931,9 @@ struct wmi_chan_info_event {
>  	__le32 cycle_count;
>  } __packed;
>  
> +#define WMI_CHAN_INFO_FLAG_COMPLETE BIT(0)
> +#define WMI_CHAN_INFO_MSEC(x) ((x) / 76595) /* XXX: empirically extrapolated */

Use "FIXME:" and comment on a separate line:

/* FIXME: empirically extrapolated */
#define WMI_CHAN_INFO_MSEC(x) ((x) / 76595)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
