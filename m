Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWZgp-00067m-R1
 for ath10k@lists.infradead.org; Thu, 07 May 2020 06:07:30 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: Remove msdu from idr when management pkt send
 fails
References: <1588667015-25490-1-git-send-email-pillair@codeaurora.org>
Date: Thu, 07 May 2020 09:07:11 +0300
In-Reply-To: <1588667015-25490-1-git-send-email-pillair@codeaurora.org>
 (Rakesh Pillai's message of "Tue, 5 May 2020 13:53:35 +0530")
Message-ID: <875zd88ei8.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> writes:

> Currently when the sending of any management pkt
> via wmi command fails, the packet is being unmapped
> freed in the error handling. But the idr entry added,
> which is used to track these packet is not getting removed.
>
> Hence, during unload, in wmi cleanup, all the entries
> in IDR are removed and the corresponding buffer is
> attempted to be freed. This can cause a situation where
> one packet is attempted to be freed twice.
>
> Fix this error by rmeoving the msdu from the idr
> list when the sending of a management packet over
> wmi fails.
>
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
>
> Fixes: 1807da49733e ("ath10k: wmi: add management tx by reference support over wmi")
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>

[...]

> --- a/drivers/net/wireless/ath/ath10k/wmi-ops.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi-ops.h
> @@ -133,6 +133,7 @@ struct wmi_ops {
>  	struct sk_buff *(*gen_mgmt_tx_send)(struct ath10k *ar,
>  					    struct sk_buff *skb,
>  					    dma_addr_t paddr);
> +	int (*cleanup_mgmt_tx_send)(struct ath10k *ar, struct sk_buff *msdu);
>  	struct sk_buff *(*gen_dbglog_cfg)(struct ath10k *ar, u64 module_enable,
>  					  u32 log_level);
>  	struct sk_buff *(*gen_pktlog_enable)(struct ath10k *ar, u32 filter);
> @@ -442,6 +443,15 @@ ath10k_wmi_get_txbf_conf_scheme(struct ath10k *ar)
>  }
>  
>  static inline int
> +ath10k_wmi_cleanup_mgmt_tx_send(struct ath10k *ar, struct sk_buff *msdu)
> +{
> +	if (!ar->wmi.ops->cleanup_mgmt_tx_send)
> +		return -EOPNOTSUPP;
> +
> +	return ar->wmi.ops->cleanup_mgmt_tx_send(ar, msdu);
> +}
> +
> +static inline int
>  ath10k_wmi_mgmt_tx_send(struct ath10k *ar, struct sk_buff *msdu,
>  			dma_addr_t paddr)
>  {
> @@ -457,8 +467,11 @@ ath10k_wmi_mgmt_tx_send(struct ath10k *ar, struct sk_buff *msdu,
>  
>  	ret = ath10k_wmi_cmd_send(ar, skb,
>  				  ar->wmi.cmd->mgmt_tx_send_cmdid);
> -	if (ret)
> +	if (ret) {
> +		/* remove this msdu from idr tracking */
> +		ath10k_wmi_cleanup_mgmt_tx_send(ar, msdu);
>  		return ret;
> +	}

I missed that this call was in wmi-ops.h, but the idea is that file
should be just a dumb wrapper and not have any logic. So I moved this to
mac.c, the functionality should be the same but please do check my
changes:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=master-pending&id=71195d2244ed812c73dc617f7536566400f7ce87

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
