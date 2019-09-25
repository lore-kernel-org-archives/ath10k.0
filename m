Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iD032-0003U6-2u
 for ath10k@lists.infradead.org; Wed, 25 Sep 2019 05:41:09 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: remove iteration in wake_tx_queue
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190327162906.6010-1-erik.stromdahl@gmail.com>
References: <20190327162906.6010-1-erik.stromdahl@gmail.com>
Message-Id: <20190925054107.A6456609F3@smtp.codeaurora.org>
Date: Wed, 25 Sep 2019 05:41:07 +0000 (UTC)
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, yiboz@codeaurora.org, ath10k@lists.infradead.org

Erik Stromdahl <erik.stromdahl@gmail.com> wrote:

> Iterating the TX queue and thereby dequeuing all available packets in the
> queue could result in performance penalties on some SMP systems.
> 
> The reason for this is most likely that the per-ac lock (active_txq_lock)
> in mac80211 will be held by the CPU iterating the current queue.
> 
> This will lock up other CPUs trying to push new messages on the TX
> queue.
> 
> Instead of iterating the queue we fetch just one packet at the time,
> resulting in minimal starvation of the other CPUs.
> 
> Reported-by: Yibo Zhao <yiboz@codeaurora.org>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>

Like others, I'm not convinced about this either. To me it looks like a quick
workaround instead of properly investigating, and fixing, the root cause. To my
understanding the throughput dip was caused by this commit:

e3148cc5fecf ath10k: fix return value check in wake_tx_q op

So to me it feels like the issue has been there all along, just hidden, and the
fix above just exposed it.

-- 
https://patchwork.kernel.org/patch/10873753/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
