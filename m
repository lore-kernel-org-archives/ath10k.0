Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAyJM-0006gb-Pp
 for ath10k@lists.infradead.org; Fri, 12 Oct 2018 14:21:06 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/2] ath10k: Handle bundled tx completion for managenent
 frames
References: <1538503421-17607-1-git-send-email-pillair@codeaurora.org>
 <1538503421-17607-2-git-send-email-pillair@codeaurora.org>
Date: Fri, 12 Oct 2018 17:20:49 +0300
In-Reply-To: <1538503421-17607-2-git-send-email-pillair@codeaurora.org>
 (Rakesh Pillai's message of "Tue, 2 Oct 2018 23:33:40 +0530")
Message-ID: <87y3b3456m.fsf@kamboji.qca.qualcomm.com>
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> writes:

> WCN3990 supports sending tx completion for multiple
> management frames bundled together in a single event.
>
> Add support to handle the bundled tx completion
> event for WCN3990.
>
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>

[...]

> +static int ath10k_wmi_tlv_op_pull_mgmt_tx_bundle_compl_ev(
> +				struct ath10k *ar, struct sk_buff *skb,
> +				struct wmi_tlv_mgmt_tx_bundle_compl_ev_arg *arg)
> +{
> +	struct wmi_tlv_tx_bundle_compl_parse bundle_tx_compl = { };
> +	int ret;
> +
> +	ret = ath10k_wmi_tlv_iter(ar, skb->data, skb->len,
> +				  ath10k_wmi_tlv_mgmt_tx_bundle_compl_parse,
> +				  &bundle_tx_compl);
> +	if (ret) {
> +		ath10k_warn(ar, "failed to parse tlv: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (!bundle_tx_compl.num_reports || !bundle_tx_compl.desc_ids ||
> +	    !bundle_tx_compl.status)
> +		return -EPROTO;
> +
> +	arg->num_reports = __le32_to_cpu(*bundle_tx_compl.num_reports);

This causes a new warning:

drivers/net/wireless/ath/ath10k/wmi-tlv.c:744:26: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath10k/wmi-tlv.c:744:26:    expected restricted __le32 [usertype] num_reports
drivers/net/wireless/ath/ath10k/wmi-tlv.c:744:26:    got unsigned int [unsigned] [usertype] <noident>

> +	arg->desc_ids = (__le32 *)bundle_tx_compl.desc_ids;
> +	arg->status = (__le32 *)bundle_tx_compl.status;

And these casts look really fishy, casting away const? Avoid casts as
much as possible, only in very expectional cases they are ok to use.

> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -2378,6 +2378,32 @@ int ath10k_wmi_event_mgmt_tx_compl(struct ath10k *ar, struct sk_buff *skb)
>  	return 0;
>  }
>  
> +int ath10k_wmi_event_mgmt_tx_bundle_compl(struct ath10k *ar, struct sk_buff *skb)
> +{
> +	struct wmi_tlv_mgmt_tx_bundle_compl_ev_arg arg;
> +	u32 *desc_ids, *status;
> +	u32 num_reports;
> +	int i, ret;
> +
> +	ret = ath10k_wmi_pull_mgmt_tx_bundle_compl(ar, skb, &arg);
> +	if (ret) {
> +		ath10k_warn(ar, "failed to parse bundle mgmt compl event: %d\n", ret);
> +		return ret;
> +	}
> +
> +	num_reports = __le32_to_cpu(arg.num_reports);
> +	desc_ids = (u32 *)arg.desc_ids;
> +	status = (u32 *)arg.status;

These casts look fishy as well.

> +	for (i = 0; i < num_reports; i++)
> +		wmi_process_mgmt_tx_comp(ar, __le32_to_cpu(desc_ids[i]),
> +					 __le32_to_cpu(status[i]));

This has a warning:

drivers/net/wireless/ath/ath10k/wmi.c:2399:46: warning: cast to restricted __le32
drivers/net/wireless/ath/ath10k/wmi.c:2400:42: warning: cast to restricted __le32

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
