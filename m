Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0WyE-00035B-Ky
 for ath10k@lists.infradead.org; Fri, 27 Jun 2014 14:17:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC/RFT 2/2] ath10k: fix Rx aggregation reordering
References: <1403860015-31601-1-git-send-email-michal.kazior@tieto.com>
 <1403860015-31601-3-git-send-email-michal.kazior@tieto.com>
Date: Fri, 27 Jun 2014 17:17:13 +0300
In-Reply-To: <1403860015-31601-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 27 Jun 2014 11:06:55 +0200")
Message-ID: <8761jmtp1y.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Denton Gentry <denton.gentry@gmail.com>

Michal Kazior <michal.kazior@tieto.com> writes:

> Firmware doesn't perform Rx reordering so it is
> left to the host driver to do that.
>
> Use mac80211 to perform reordering instead of
> re-inventing the wheel.
>
> This fixes TCP throughput issues in some
> environments (notably Windows stations connecting
> to ath10k AP).
>
> Reported-By: Denton Gentry <denton.gentry@gmail.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -21,6 +21,7 @@
>  #include "txrx.h"
>  #include "debug.h"
>  #include "trace.h"
> +#include "mac.h"

Why this? At least from a quick search I didn't see any reason to add this.

>  
>  #include <linux/log2.h>
>  
> @@ -1533,10 +1534,95 @@ void ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
>  	case HTT_T2H_MSG_TYPE_STATS_CONF:
>  		trace_ath10k_htt_stats(skb->data, skb->len);
>  		break;
> +	case HTT_T2H_MSG_TYPE_RX_ADDBA: {
> +		struct ath10k *ar = htt->ar;
> +		struct htt_rx_addba *ev = &resp->rx_addba;
> +		struct ath10k_peer *peer;
> +		struct ath10k_vif *arvif;
> +		u16 info0, tid, peer_id;
> +
> +		info0 = __le32_to_cpu(ev->info0);
> +		tid = MS(info0, HTT_RX_BA_INFO0_TID);
> +		peer_id = MS(info0, HTT_RX_BA_INFO0_PEER_ID);

This event handling is pretty long. I think it would be better to have a
separate function for this event.

> +	case HTT_T2H_MSG_TYPE_RX_DELBA: {
> +		struct ath10k *ar = htt->ar;
> +		struct htt_rx_addba *ev = &resp->rx_addba;
> +		struct ath10k_peer *peer;
> +		struct ath10k_vif *arvif;
> +		u16 info0, tid, peer_id;

And the same for this event.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
