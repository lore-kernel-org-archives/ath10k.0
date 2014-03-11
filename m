Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNJUY-0006Pq-Et
 for ath10k@lists.infradead.org; Tue, 11 Mar 2014 10:00:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 05/14] ath10k: introduce ieee80211_rx_status to htt_rx_info
References: <1393937548-7482-1-git-send-email-janusz.dziedzic@tieto.com>
 <1393937548-7482-6-git-send-email-janusz.dziedzic@tieto.com>
Date: Tue, 11 Mar 2014 11:59:55 +0200
In-Reply-To: <1393937548-7482-6-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Tue, 4 Mar 2014 13:52:18 +0100")
Message-ID: <87eh29hx7o.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> Will be used as a template, and final storage for
> rx_status.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

I think this patch is too small. It's good to have small atomic commits
but I think goes overboard.

> @@ -1174,6 +1175,7 @@ struct htt_peer_unmap_event {
>  
>  struct htt_rx_info {
>  	struct sk_buff *skb;
> +	struct ieee80211_rx_status rx_status;
>  	enum htt_rx_mpdu_status status;
>  	enum htt_rx_mpdu_encrypt_type encrypt_type;
>  	s8 signal;
> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> index 3008a1d..2fca1fa 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -756,7 +756,7 @@ static void ath10k_process_rx(struct ath10k *ar, struct htt_rx_info *info)
>  	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)info->skb->data;
>  
>  	status = IEEE80211_SKB_RXCB(info->skb);
> -	memset(status, 0, sizeof(*status));
> +	memcpy(status, &info->rx_status, sizeof(*status));

So you are idea with the status template is that instead clearing
status, you copy it from the previous frame and reuse it? Why do you
want to do it? Performance reasons?

I didn't fully understand your idea here, but I assume patch 9 is
related as I see that you change the CRC flag handling from this:

-	if (info->fcs_err)
-		status->flag |= RX_FLAG_FAILED_FCS_CRC;

to this:

+			fcs_err = ath10k_htt_rx_has_fcs_err(msdu_head);
+			if (fcs_err)
+				info.rx_status.flag |= RX_FLAG_FAILED_FCS_CRC;
+			else
+				info.rx_status.flag &= ~RX_FLAG_FAILED_FCS_CRC;

I don't really like that clearing the flag part. Can you describe what
is your plan behind this template?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
