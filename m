Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aj507-0002KO-6O
 for ath10k@lists.infradead.org; Thu, 24 Mar 2016 13:08:35 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/9] ath10k: speedup htt rx descriptor processing for tx
 completion
Date: Thu, 24 Mar 2016 13:08:05 +0000
Message-ID: <8760wcdnws.fsf@kamboji.qca.qualcomm.com>
References: <1458647539-17213-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1458647539-17213-2-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1458647539-17213-2-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Tue, 22 Mar 2016 17:22:11 +0530")
Content-Language: en-US
Content-ID: <0D7816BF055E204E885BC3FF25707DB5@qualcomm.com>
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "rmanohar@codeaurora.org" <rmanohar@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> To optimize CPU usage htt rx descriptors will be reused instead of
> refilling it for htt rx copy engine (CE5). To support that all htt rx
> indications should be processed at same context. FIFO queue is used
> to maintain tx completion status for each msdu. This helps to retain
> the order of tx completion.
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

[...]

> @@ -1712,7 +1710,20 @@ static void ath10k_htt_rx_frm_tx_compl(struct ath10k *ar,
>  	for (i = 0; i < resp->data_tx_completion.num_msdus; i++) {
>  		msdu_id = resp->data_tx_completion.msdus[i];
>  		tx_done.msdu_id = __le16_to_cpu(msdu_id);
> -		ath10k_txrx_tx_unref(htt, &tx_done);
> +
> +		/* kfifo_put: In practice firmware shouldn't fire off per-CE
> +		 * interrupt and main interrupt (MSI/-X range case) for the same
> +		 * HTC service so it should be safe to use kfifo_put w/o lock.
> +		 *
> +		 * From kfifo_put() documentation:
> +		 *  Note that with only one concurrent reader and one concurrent
> +		 *  writer, you don't need extra locking to use these macro.
> +		 */
> +		if (!kfifo_put(&htt->txdone_fifo, tx_done)) {
> +			ath10k_warn(ar, "txdone fifo overrun, msdu_id %d status %d\n",
> +				    tx_done.msdu_id, tx_done.status);
> +			ath10k_txrx_tx_unref(htt, &tx_done);
> +		}

I see two new warnings on the kfifo_put() call:

drivers/net/wireless/ath/ath10k/htt_rx.c:1722:22: warning: cast to non-scalar
drivers/net/wireless/ath/ath10k/htt_rx.c:1722:22: warning: cast from non-scalar

But I suspect they are false warnings due to my old compiler:

gcc (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3

Opinions?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
