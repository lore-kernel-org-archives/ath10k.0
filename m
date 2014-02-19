Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG8tg-0004RA-QS
 for ath10k@lists.infradead.org; Wed, 19 Feb 2014 15:17:17 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC/RFT 0/7] ath10k: performance improvements
References: <1392629563-31046-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 19 Feb 2014 17:16:49 +0200
In-Reply-To: <1392629563-31046-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 17 Feb 2014 10:32:36 +0100")
Message-ID: <87eh2zxhcu.fsf@kamboji.qca.qualcomm.com>
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

> Hi,
>
> These patches aim at reducing host CPU load and
> thus improve performance on low-end systems.
>
> In my setup I get a relative improvement of
> 100mbps for both UDP Tx and Rx.
>
>                Tx ----->
> laptop:eth---eth:AP135:ath10k---ath10k:laptop
>                <----- Rx
>
>
> Michal Kazior (7):
>   ath10k: remove DMA mapping wrappers
>   ath10k: remove is_aborted from skb_cb
>   ath10k: replace send_head() with tx_sg()
>   ath10k: bypass htc for htt tx path
>   ath10k: batch htt tx/rx completions
>   ath10k: remove pci completion list
>   ath10k: minimize coherent dma accesses

Ok, now I reviewed the patches and sent some comments. But I didn't run
any tests yet. I assume you also saw these warnings from the build bot:

drivers/net/wireless/ath/ath10k/htt_rx.c:274:17: sparse: context imbalance in 'ath10k_htt_rx_amsdu_pop' - unexpected unlock
drivers/net/wireless/ath/ath10k/htt_tx.c:505 ath10k_htt_tx() warn: potential pointer math issue ('skb_cb->htt.txbuf' is a 352 bit pointer)
drivers/net/wireless/ath/ath10k/htt_tx.c:423:2: error: implicit declaration of function 'dma_pool_alloc' [-Werror=implicit-function-declaration]
drivers/net/wireless/ath/ath10k/htt_tx.c:112:2: error: implicit declaration of function 'dma_pool_create' [-Werror=implicit-function-declaration]
drivers/net/wireless/ath/ath10k/htt_tx.c:149:2: error: implicit declaration of function 'dma_pool_destroy' [-Werror=implicit-function-declaration]
drivers/net/wireless/ath/ath10k/htt_tx.c:529:2: error: implicit declaration of function 'dma_pool_free' [-Werror=implicit-function-declaration]
drivers/net/wireless/ath/ath10k/htt_tx.c:423:20: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/wireless/ath/ath10k/txrx.c:72:3: error: implicit declaration of function 'dma_pool_free' [-Werror=implicit-function-declaration]

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
