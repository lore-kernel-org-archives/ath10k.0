Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ablsI-0007aB-6u
 for ath10k@lists.infradead.org; Fri, 04 Mar 2016 09:18:18 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 10/13] ath10k: implement flushing of pending frames in txqs
Date: Fri, 4 Mar 2016 09:17:52 +0000
Message-ID: <87h9gmy538.fsf@kamboji.qca.qualcomm.com>
References: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
 <1453384006-31907-11-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1453384006-31907-11-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 21 Jan 2016 14:46:43 +0100")
Content-Language: en-US
Content-ID: <DF0FCEA5F734AB4B883A40A93D1C4786@qualcomm.com>
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
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> Firmware supporting pull-push tx model may request
> a switch between modes. When switching from
> pull-push to push-only it will be necessary to
> flush all pending frames. The code will do that
> once other bits that actually trigger it are added.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

This fails to apply:

fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath10k/htt_rx.c).
Repository lacks necessary blobs to fall back on 3-way merge.
Cannot fall back to three-way merge.
Patch failed at 0010 ath10k: implement flushing of pending frames in txqs

> @@ -2370,6 +2371,8 @@ static void ath10k_htt_txrx_compl_task(unsigned long ptr)
>  		dev_kfree_skb_any(skb);
>  	}
>  
> +	ath10k_mac_tx_push_pending(ar);
> +
>  	spin_lock_bh(&htt->rx_ring.lock);
>  	while ((skb = __skb_dequeue(&htt->rx_compl_q))) {
>  		resp = (struct htt_resp *)skb->data;

This hunk seems to be the problem. I could try to fix it myself but the
function has changed so I would prefer that you respin.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
