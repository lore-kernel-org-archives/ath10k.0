Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCJNM-0003bM-57
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 08:07:17 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/2] ath10k: Add support for adding htt_rx_ops based on
 htt_version
References: <1551251628-22518-1-git-send-email-svishnoi@codeaurora.org>
 <1551251628-22518-2-git-send-email-svishnoi@codeaurora.org>
Date: Mon, 23 Sep 2019 11:07:12 +0300
In-Reply-To: <1551251628-22518-2-git-send-email-svishnoi@codeaurora.org>
 (Surabhi Vishnoi's message of "Wed, 27 Feb 2019 12:43:47 +0530")
Message-ID: <87ef07a11r.fsf@codeaurora.org>
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
To: Surabhi Vishnoi <svishnoi@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Surabhi Vishnoi <svishnoi@codeaurora.org> writes:

> Refactor the code to add the support to attach htt_rx_ops
> based on HTT version.
>
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
>
> Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>

[...]

> @@ -3572,7 +3580,7 @@ int ath10k_htt_txrx_compl_task(struct ath10k *ar, int budget)
>  	.htt_reset_paddrs_ring = ath10k_htt_reset_paddrs_ring_64,
>  };
>  
> -static const struct ath10k_htt_rx_ops htt_rx_ops_hl = {
> +static struct ath10k_htt_rx_ops htt_rx_ops_hl = {
>  };
>  
>  void ath10k_htt_set_rx_ops(struct ath10k_htt *htt)
> @@ -3585,4 +3593,19 @@ void ath10k_htt_set_rx_ops(struct ath10k_htt *htt)
>  		htt->rx_ops = &htt_rx_ops_64;
>  	else
>  		htt->rx_ops = &htt_rx_ops_32;
> +
> +	switch (ar->running_fw->fw_file.htt_op_version) {
> +	case ATH10K_FW_HTT_OP_VERSION_MAIN:
> +	case ATH10K_FW_HTT_OP_VERSION_10_1:
> +	case ATH10K_FW_HTT_OP_VERSION_10_4:
> +		htt->rx_ops->htt_fetch_peer_stats = ath10k_htt_fetch_peer_stats;
> +	break;
> +	case ATH10K_FW_HTT_OP_VERSION_TLV:
> +		htt->rx_ops->htt_fetch_peer_stats = ath10k_htt_fetch_peer_stats_tlv;
> +	break;
> +	case ATH10K_FW_HTT_OP_VERSION_MAX:
> +	case ATH10K_FW_HTT_OP_VERSION_UNSET:
> +		WARN_ON(1);
> +	return;
> +	}
>  }

I just realised this won't work. Let's say that there's both a qca988x
and a qca6174 PCI device on the same host. Then htt->rx_ops is shared by
_both_ devices and the htt_fetch_peer_stats field will contain the value
of the last initialised ath10k device.

So back to the drawing board. As this feature is for wcn3990 would it be
enough to modify htt_rx_ops_64? IIRC only wcn3990 support 64bit HTT
interface, right? Of course then qca6174 won't support this feature, but
does the qca6174 firmware even support that?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
