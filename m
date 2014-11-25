Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtC34-0004Tj-OR
 for ath10k@lists.infradead.org; Tue, 25 Nov 2014 09:04:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: don't drop corrupted mgmt frames
References: <1416839648-31803-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 25 Nov 2014 11:04:12 +0200
In-Reply-To: <1416839648-31803-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 24 Nov 2014 15:34:08 +0100")
Message-ID: <87egsr1wj7.fsf@kamboji.qca.qualcomm.com>
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

> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -1381,6 +1381,8 @@ static bool ath10k_htt_rx_amsdu_allowed(struct ath10k *ar,
>  {
>  	struct sk_buff *msdu;
>  	struct htt_rx_desc *rxd;
> +	bool is_mgmt;
> +	bool has_fcs_err;
>  
>  	msdu = skb_peek(amsdu);
>  	rxd = (void *)msdu->data - sizeof(*rxd);
> @@ -1394,12 +1396,19 @@ static bool ath10k_htt_rx_amsdu_allowed(struct ath10k *ar,
>  		return false;
>  	}
>  
> +	is_mgmt = !!(rxd->attention.flags &
> +		     __cpu_to_le32(RX_ATTENTION_FLAGS_MGMT_TYPE));
> +	has_fcs_err = !!(rxd->attention.flags &
> +			 __cpu_to_le32(RX_ATTENTION_FLAGS_FCS_ERR));

I think I asked this before in some other patch, but isn't '!!' operator
useless here? is_mgmt is a boolean so the compiler should convert it
correctly without '!!' anyway, right?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
