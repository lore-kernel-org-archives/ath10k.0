Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLhMA-000092-3t
 for ath10k@lists.infradead.org; Tue, 07 Apr 2020 06:05:07 +0000
MIME-Version: 1.0
Date: Tue, 07 Apr 2020 14:04:58 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v9 1/4] ath10k: disable TX complete indication of htt for
 sdio
In-Reply-To: <20200407054431.6B2A0C433BA@smtp.codeaurora.org>
References: <20200212080415.31265-2-wgong@codeaurora.org>
 <20200407054431.6B2A0C433BA@smtp.codeaurora.org>
Message-ID: <84039fe1187e3ec7546edd4f9fe5600a@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2020-04-07 13:44, Kalle Valo wrote:

> This has new warnings:
> 
> drivers/net/wireless/ath/ath10k/htt_tx.c: In function
> 'ath10k_htt_htc_tx_complete':
> drivers/net/wireless/ath/ath10k/htt_tx.c:566:30: warning: 'msg_type'
> may be used uninitialized in this function [-Wmaybe-uninitialized]
> drivers/net/wireless/ath/ath10k/htt_tx.c:573:6: warning: 'flags1' may
> be used uninitialized in this function [-Wmaybe-uninitialized]
> drivers/net/wireless/ath/ath10k/htt_tx.c:577:42: warning: 'desc_hdr'
> may be used uninitialized in this function [-Wmaybe-uninitialized]
> 

I already run ath10k-check, but not see these warnings.
my gcc: gcc (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4
so is it because my gcc too version too low?

>> From what I can see these are false positives, but please do double 
>> check that. In
> the pending branch I solved it like this:
> 
> --- a/drivers/net/wireless/ath/ath10k/htt_tx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
> @@ -546,9 +546,9 @@ void ath10k_htt_htc_tx_complete(struct ath10k *ar,
> struct sk_buff *skb)
>         struct ath10k_htt *htt = &ar->htt;
>         struct htt_tx_done tx_done = {0};
>         struct htt_cmd_hdr *htt_hdr;
> -       struct htt_data_tx_desc *desc_hdr;
> -       u16 flags1;
> -       u8 msg_type;
> +       struct htt_data_tx_desc *desc_hdr = NULL;
> +       u16 flags1 = 0;
> +       u8 msg_type = 0;
> 
>         if (htt->disable_tx_comp) {
>                 htt_hdr = (struct htt_cmd_hdr *)skb->data;

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
