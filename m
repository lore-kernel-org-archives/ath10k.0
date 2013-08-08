Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7LsM-00038g-Rr
 for ath10k@lists.infradead.org; Thu, 08 Aug 2013 08:47:20 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 1/3] ath10k: add support for firmware newer than 636
References: <1375949298-7159-1-git-send-email-michal.kazior@tieto.com>
 <1375949298-7159-2-git-send-email-michal.kazior@tieto.com>
Date: Thu, 8 Aug 2013 11:46:46 +0300
In-Reply-To: <1375949298-7159-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 8 Aug 2013 10:08:16 +0200")
Message-ID: <87iozg36yx.fsf@kamboji.qca.qualcomm.com>
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

> The mgmt_rx event structure has been expanded.
> Since the structure header is expanded the payload
> (i.e. mgmt frame) is shifted by a few bytes. This
> needs to be taken into account in order to support
> both old and new firmware.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> @@ -325,13 +327,24 @@ static int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
>  	u32 rate;
>  	u32 buf_len;
>  	u16 fc;
> +	int pull_len;
> +
> +	if (ar->fw_version_build > 636) {
> +		ev_abi2 = (struct wmi_mgmt_rx_event_abi2 *)skb->data;
> +		ev_hdr = &ev_abi2->hdr.abi1;
> +		pull_len = sizeof(*ev_abi2);
> +	} else {
> +		ev_abi1 = (struct wmi_mgmt_rx_event_abi1 *)skb->data;
> +		ev_hdr = &ev_abi1->hdr;
> +		pull_len = sizeof(*ev_abi1);
> +	}

I would prefer to have ar->fw_features (or similar) bitmap for handling
this. That way we can group all firmware version tests into one place
and not sprinkle them around. I suspect there will be more tests like
this.

[...]

> --- a/drivers/net/wireless/ath/ath10k/wmi.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
> @@ -1268,7 +1268,7 @@ struct wmi_scan_event {
>   * good idea to pass all the fields in the RX status
>   * descriptor up to the host.
>   */
> -struct wmi_mgmt_rx_hdr {
> +struct wmi_mgmt_rx_hdr_abi1 {
>  	__le32 channel;
>  	__le32 snr;
>  	__le32 rate;
> @@ -1277,8 +1277,18 @@ struct wmi_mgmt_rx_hdr {
>  	__le32 status; /* %WMI_RX_STATUS_ */
>  } __packed;
>  
> -struct wmi_mgmt_rx_event {
> -	struct wmi_mgmt_rx_hdr hdr;
> +struct wmi_mgmt_rx_hdr_abi2 {
> +	struct wmi_mgmt_rx_hdr_abi1 abi1;
> +	__le32 rssi_ctl[4];
> +} __packed;
> +
> +struct wmi_mgmt_rx_event_abi1 {
> +	struct wmi_mgmt_rx_hdr_abi1 hdr;
> +	u8 buf[0];
> +} __packed;
> +
> +struct wmi_mgmt_rx_event_abi2 {
> +	struct wmi_mgmt_rx_hdr_abi2 hdr;
>  	u8 buf[0];
>  } __packed;

I would prefer to use v1 and v2 instead on abi1 and abi2.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
