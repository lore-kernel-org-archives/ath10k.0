Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1PaN-0000oH-WA
 for ath10k@lists.infradead.org; Tue, 11 Feb 2020 07:03:57 +0000
Received: by mail-pf1-x441.google.com with SMTP id p14so5019795pfn.4
 for <ath10k@lists.infradead.org>; Mon, 10 Feb 2020 23:03:54 -0800 (PST)
Subject: Re: [PATCH v8 1/4] ath10k: disable TX complete indication of htt for
 sdio
References: <20191128103030.6429-1-wgong@codeaurora.org>
 <0101016eb1903db0-ef7063b4-0f42-4a01-8886-327541e6c1a4-000000@us-west-2.amazonses.com>
From: Pi-Hsun Shih <pihsun@chromium.org>
Message-ID: <76bce8e3-e05b-ace6-3edd-54f522be3fe6@chromium.org>
Date: Tue, 11 Feb 2020 15:03:51 +0800
MIME-Version: 1.0
In-Reply-To: <0101016eb1903db0-ef7063b4-0f42-4a01-8886-327541e6c1a4-000000@us-west-2.amazonses.com>
Content-Language: en-GB
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Wen Gong <wgong@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Hi,

On 11/28/19 6:30 PM, Wen Gong wrote:
> ...
> diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
> index a182c0944cc7..c6c4b2a4d20f 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_tx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
> @@ -543,7 +543,35 @@ void ath10k_htt_tx_free(struct ath10k_htt *htt)
>   
>   void ath10k_htt_htc_tx_complete(struct ath10k *ar, struct sk_buff *skb)
>   {
> +	struct ath10k_htt *htt = &ar->htt;
> +	struct htt_tx_done tx_done = {0};
> +	struct htt_cmd_hdr *htt_hdr;
> +	struct htt_data_tx_desc *desc_hdr;
> +	u16 flags1;
> +
>   	dev_kfree_skb_any(skb);
> +
> +	if (!htt->disable_tx_comp)
> +		return;
> +
> +	htt_hdr = (struct htt_cmd_hdr *)skb->data;

skb is already freed on the above line (dev_kfree_skb_any) but is still 
used here, should the dev_kfree_skb_any be moved to the end of this 
function?

> +	if (htt_hdr->msg_type != HTT_H2T_MSG_TYPE_TX_FRM)
> +		return;
> +
> +	desc_hdr = (struct htt_data_tx_desc *)
> +		(skb->data + sizeof(*htt_hdr));
> +	flags1 = __le16_to_cpu(desc_hdr->flags1);
> +
> +	ath10k_dbg(ar, ATH10K_DBG_HTT,
> +		   "htt tx complete msdu id:%u ,flags1:%x\n",
> +		   __le16_to_cpu(desc_hdr->id), flags1);
> +
> +	if (flags1 & HTT_DATA_TX_DESC_FLAGS1_TX_COMPLETE)
> +		return;
> +
> +	tx_done.status = HTT_TX_COMPL_STATE_ACK;
> +	tx_done.msdu_id = __le16_to_cpu(desc_hdr->id);
> +	ath10k_txrx_tx_unref(&ar->htt, &tx_done);
>   }
>   

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
